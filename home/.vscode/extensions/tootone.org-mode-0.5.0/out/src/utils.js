"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const vscode = require("vscode");
function getCursorPosition() {
    const curEditor = vscode.window.activeTextEditor;
    return curEditor.selection.active;
}
exports.getCursorPosition = getCursorPosition;
function getActiveTextEditorEdit() {
    return vscode.window.activeTextEditor.document;
}
exports.getActiveTextEditorEdit = getActiveTextEditorEdit;
function getLine(document, lineNum) {
    return document.lineAt(lineNum).text;
}
exports.getLine = getLine;
function getHeaderPrefix(line) {
    const prefix = line.match(/^\*+\s/);
    if (prefix) {
        return prefix[0].trim();
    }
    else {
        return "";
    }
}
exports.getHeaderPrefix = getHeaderPrefix;
function getPrefix(line) {
    const prefix = line.match(/^\*+|^-\s|^\d+\./);
    if (prefix) {
        return prefix[0].trim();
    }
    else {
        return "";
    }
}
exports.getPrefix = getPrefix;
function findParentPrefix(document, pos) {
    let thisLinePrefix = getHeaderPrefix(getLine(document, pos));
    let curLine = pos.line;
    let curLinePrefix = "";
    while (curLine > 0 && curLinePrefix === thisLinePrefix) {
        curLine--;
        let curLineContent = getLine(document, new vscode.Position(curLine, 0));
        curLinePrefix = getHeaderPrefix(curLineContent);
    }
    return curLinePrefix;
}
exports.findParentPrefix = findParentPrefix;
function findBeginningOfSectionWithHeader(document, pos, levelSym = "") {
    let beginningOfSection = findBeginningOfSection(document, pos, levelSym);
    let prevLineNum = beginningOfSection.line - 1;
    if (prevLineNum >= 0 && document.lineAt(prevLineNum).text.match(/^\*+\s/)) {
        return new vscode.Position(prevLineNum, 0);
    }
    return beginningOfSection;
}
exports.findBeginningOfSectionWithHeader = findBeginningOfSectionWithHeader;
function findBeginningOfSection(document, pos, levelSym = "") {
    let sectionRegex = getSectionRegex(levelSym);
    let curLine = pos.line;
    let curPos;
    let curLinePrefix;
    do {
        curLine--;
        curPos = new vscode.Position(curLine, 0);
        curLinePrefix = getPrefix(getLine(document, curPos));
    } while (curLine > 0 && inSubsection(curLinePrefix, sectionRegex));
    if (curPos) {
        curPos = new vscode.Position(curPos.line + 1, 0);
    }
    return curPos;
}
exports.findBeginningOfSection = findBeginningOfSection;
function findEndOfSection(document, pos, levelSym = "") {
    if (pos.line === document.lineCount - 1) {
        return pos;
    }
    let sectionRegex = getSectionRegex(levelSym);
    let curLine = pos.line;
    let curPos;
    let curLinePrefix;
    do {
        curLine++;
        curPos = new vscode.Position(curLine, 0);
        curLinePrefix = getPrefix(getLine(document, curPos));
    } while (curLine < document.lineCount - 1 && inSubsection(curLinePrefix, sectionRegex));
    curPos = new vscode.Position(curPos.line - 1, getLine(document, new vscode.Position(curPos.line - 1, 0)).length + 1);
    return curPos;
}
exports.findEndOfSection = findEndOfSection;
//TODO: write findEndOfSection
function findEndOfContent(document, pos, levelSym = "") {
    if (pos.line === document.lineCount - 1) {
        return pos;
    }
    let sectionRegex = getSectionRegex(levelSym);
    if (levelSym.startsWith("*")) {
        let numStars = getStarPrefixCount(levelSym) + 1;
        sectionRegex = new RegExp(`\\*{${numStars},}`);
    }
    let curLine = pos.line;
    let curPos;
    let curLinePrefix;
    do {
        curLine++;
        curPos = new vscode.Position(curLine, 0);
        curLinePrefix = getPrefix(getLine(document, curPos));
    } while (curLine < document.lineCount - 1 && inSubsection(curLinePrefix, sectionRegex));
    if (curLine !== document.lineCount - 1) {
        curPos = new vscode.Position(curPos.line - 1, getLine(document, new vscode.Position(curPos.line - 1, 0)).length + 1);
    }
    else {
        curPos = new vscode.Position(curPos.line, getLine(document, new vscode.Position(curPos.line, 0)).length + 1);
    }
    return curPos;
}
exports.findEndOfContent = findEndOfContent;
function inSubsection(linePrefix, sectionRegex) {
    return (linePrefix.match(sectionRegex)) || linePrefix === "-" || !linePrefix || linePrefix.match(/\d+\./);
}
exports.inSubsection = inSubsection;
//returns regex that will match a subsection and facilitate respecting section content
function getSectionRegex(prefix) {
    let regex = null;
    if (prefix.match(/\d+./)) {
        regex = /\d+./;
    }
    else if (prefix === "") {
        regex = /^$/;
    }
    else if (prefix === "-") {
        regex = /^-\s$/;
    }
    else if (prefix.startsWith("*")) {
        let numStars = getStarPrefixCount(prefix);
        regex = new RegExp(`\\*{${numStars},}`);
    }
    return regex;
}
exports.getSectionRegex = getSectionRegex;
function getStarPrefixCount(prefix) {
    if (!prefix.startsWith("*")) {
        return 0;
    }
    let starMatch = prefix.match(/\*+/);
    return starMatch[0].length;
}
exports.getStarPrefixCount = getStarPrefixCount;
function surroundWithText(textEditor, edit, surroundingText, errorMessage) {
    const selection = vscode.window.activeTextEditor.selection;
    if (selection.isEmpty) {
        vscode.window.showErrorMessage(errorMessage);
    }
    else {
        edit.insert(selection.start, surroundingText);
        edit.insert(selection.end, surroundingText);
    }
}
exports.surroundWithText = surroundWithText;
function prependTextToLine(textEditor, edit, prependingText) {
    const document = getActiveTextEditorEdit();
    const cursorPos = getCursorPosition();
    const curLine = getLine(document, cursorPos);
    const insertPos = new vscode.Position(cursorPos.line, 0);
    edit.insert(insertPos, prependingText);
}
exports.prependTextToLine = prependTextToLine;
//pos is a position anywhere on the target line
function moveToEndOfLine(editor, pos) {
    const curLine = getLine(editor.document, pos);
    const endOfLine = curLine.length;
    const endOfLinePos = new vscode.Position(pos.line, endOfLine);
    editor.selections = [new vscode.Selection(endOfLinePos, endOfLinePos)];
}
exports.moveToEndOfLine = moveToEndOfLine;
function getKeywords() {
    const settings = vscode.workspace.getConfiguration("org");
    let todoKeywords = settings.get("todoKeywords");
    todoKeywords.push(""); // Since 'nothing' can be a TODO
    return todoKeywords;
}
exports.getKeywords = getKeywords;
function getLeftZero() {
    const settings = vscode.workspace.getConfiguration("org");
    let addLeftZero = settings.get("addLeftZero");
    return addLeftZero;
}
exports.getLeftZero = getLeftZero;
function getClockInOutSeparator() {
    const settings = vscode.workspace.getConfiguration("org");
    let clockInOutSeparator = settings.get("clockInOutSeparator");
    return clockInOutSeparator;
}
exports.getClockInOutSeparator = getClockInOutSeparator;
function getClockTotalSeparator() {
    const settings = vscode.workspace.getConfiguration("org");
    let clockTotalSeparator = settings.get("clockTotalSeparator");
    return clockTotalSeparator;
}
exports.getClockTotalSeparator = getClockTotalSeparator;
function getUniq(arr) {
    // Must also preserve order
    let map = {};
    let uniq = [];
    arr.forEach(el => {
        if (!map[el]) {
            uniq.push(el);
        }
        map[el] = true;
    });
    return uniq;
}
exports.getUniq = getUniq;
//# sourceMappingURL=utils.js.map