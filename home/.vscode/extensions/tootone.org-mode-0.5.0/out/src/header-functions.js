"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const vscode = require("vscode");
const Utils = require("./utils");
function insertHeadingRespectContent(textEditor, edit) {
    const document = textEditor.document;
    const cursorPos = Utils.getCursorPosition();
    const curLine = Utils.getLine(document, cursorPos);
    const endOfLine = curLine.length;
    let insertPos = new vscode.Position(cursorPos.line, endOfLine);
    let sibling;
    let headerPrefix = Utils.getHeaderPrefix(curLine);
    if (headerPrefix) {
        sibling = headerPrefix;
        insertPos = Utils.findEndOfContent(document, cursorPos, sibling);
    }
    else {
        let parentHeader = Utils.findParentPrefix(document, cursorPos) || "*";
        sibling = parentHeader;
        insertPos = Utils.findEndOfContent(document, cursorPos, Utils.getPrefix(curLine));
    }
    if (sibling) {
        edit.insert(insertPos, "\n" + sibling + " ");
        Utils.moveToEndOfLine(textEditor, new vscode.Position(insertPos.line, 0));
        textEditor.revealRange(new vscode.Range(new vscode.Position(insertPos.line, 0), insertPos)); //jump screen so cursor is in view
    }
}
exports.insertHeadingRespectContent = insertHeadingRespectContent;
function insertChild(textEditor, edit) {
    const document = textEditor.document;
    const cursorPos = Utils.getCursorPosition();
    const curLine = Utils.getLine(textEditor.document, cursorPos);
    const endOfLine = curLine.length;
    let headerPrefix = Utils.getHeaderPrefix(curLine);
    let insertPos = new vscode.Position(cursorPos.line, endOfLine);
    if (headerPrefix) {
        edit.insert(insertPos, "\n" + headerPrefix.trim() + "* ");
        Utils.moveToEndOfLine(textEditor, new vscode.Position(insertPos.line, 0));
        textEditor.revealRange(new vscode.Range(insertPos, insertPos)); //jump screen so cursor is in view
    }
}
exports.insertChild = insertChild;
function demoteLine(textEditor, edit) {
    const document = textEditor.document;
    const cursorPos = Utils.getCursorPosition();
    const curLine = Utils.getLine(textEditor.document, cursorPos);
    let headerPrefix = Utils.getHeaderPrefix(curLine);
    let insertPos = new vscode.Position(cursorPos.line, 0);
    if (headerPrefix) {
        edit.insert(insertPos, "*");
    }
}
exports.demoteLine = demoteLine;
function promoteLine(textEditor, edit) {
    const document = textEditor.document;
    const cursorPos = Utils.getCursorPosition();
    const curLine = Utils.getLine(textEditor.document, cursorPos);
    let headerPrefix = Utils.getHeaderPrefix(curLine);
    let insertPos = new vscode.Position(cursorPos.line, 0);
    if (headerPrefix && headerPrefix !== "* ") {
        let deleteRange = new vscode.Range(insertPos, new vscode.Position(insertPos.line, 1));
        edit.delete(deleteRange);
    }
}
exports.promoteLine = promoteLine;
//# sourceMappingURL=header-functions.js.map