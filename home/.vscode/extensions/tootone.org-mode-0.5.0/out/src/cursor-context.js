"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
// import * as vscode from 'vscode';
const vscode_1 = require("vscode");
const Util = require("./utils");
// Any potential data labels should go here
exports.DATE = "DATE";
exports.TODO = "TODO";
function getCursorContext(textEditor, edit) {
    const document = Util.getActiveTextEditorEdit();
    const cursorPos = Util.getCursorPosition();
    const curLine = Util.getLine(document, cursorPos);
    // Match for timestamp
    const timestampRegexp = /\[\d{4}-\d{1,2}-\d{1,2}(?: \w{3})?\]/g;
    let match;
    while ((match = timestampRegexp.exec(curLine)) != null) {
        const timestampContext = getTimestampContext(match, cursorPos);
        if (timestampContext) {
            return timestampContext;
        }
    }
    // Match for TODO (or absence)
    const todoKeywords = Util.getKeywords().join("|");
    // const todoWords = "TODO|DONE";
    const todoHeaderRegexp = new RegExp(`^(\\*+\\s+)(${todoKeywords})(?:\\b|\\[|$)`);
    match = todoHeaderRegexp.exec(curLine);
    if (match) {
        // We've found our match
        return getTodoContext(match, cursorPos);
    }
    return undefined;
}
exports.default = getCursorContext;
function getTimestampContext(match, cursorPos) {
    const line = cursorPos.line;
    const startPos = new vscode_1.Position(line, match.index);
    const endPos = new vscode_1.Position(line, match.index + match[0].length);
    const range = new vscode_1.Range(startPos, endPos);
    if (range.contains(cursorPos)) {
        // We've found our match
        return {
            dataLabel: exports.DATE,
            data: match[0],
            line: line,
            range: range
        };
    }
    // Should return undefined if no match contains the cursor
}
function getTodoContext(match, cursorPos) {
    const line = cursorPos.line;
    const prefix = match[1];
    const todoWord = match[2];
    const start = match.index + match[1].length;
    const startPos = new vscode_1.Position(line, start);
    const end = start + todoWord.length;
    const endPos = new vscode_1.Position(line, end);
    const range = new vscode_1.Range(startPos, endPos);
    return {
        dataLabel: exports.TODO,
        data: todoWord,
        line: line,
        range: range
    };
}
//# sourceMappingURL=cursor-context.js.map