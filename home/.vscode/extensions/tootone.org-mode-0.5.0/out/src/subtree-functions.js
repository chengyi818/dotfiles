"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const vscode = require("vscode");
const Utils = require("./utils");
function promoteSubtree(textEditor, edit) {
    const document = textEditor.document;
    const cursorPos = Utils.getCursorPosition();
    let curLine = Utils.getLine(textEditor.document, cursorPos);
    let headerPrefix = Utils.getHeaderPrefix(curLine);
    let endOfContent = Utils.findEndOfContent(document, cursorPos, headerPrefix);
    if (headerPrefix) {
        for (let i = cursorPos.line; i < endOfContent.line + 1; ++i) {
            let curlineStart = new vscode.Position(i, 0);
            let lineHeaderPrefix = Utils.getHeaderPrefix(Utils.getLine(document, curlineStart));
            if (lineHeaderPrefix) {
                if (Utils.getStarPrefixCount(lineHeaderPrefix) > 1) {
                    edit.delete(new vscode.Range(curlineStart, new vscode.Position(i, 1)));
                }
            }
        }
    }
}
exports.promoteSubtree = promoteSubtree;
function demoteSubtree(textEditor, edit) {
    const document = textEditor.document;
    const cursorPos = Utils.getCursorPosition();
    let curLine = Utils.getLine(textEditor.document, cursorPos);
    let headerPrefix = Utils.getHeaderPrefix(curLine);
    let endOfContent = Utils.findEndOfContent(document, cursorPos, headerPrefix);
    if (headerPrefix) {
        for (let i = cursorPos.line; i < endOfContent.line + 1; ++i) {
            let curlineStart = new vscode.Position(i, 0);
            if (Utils.getHeaderPrefix(Utils.getLine(document, curlineStart))) {
                edit.insert(curlineStart, "*");
            }
        }
    }
}
exports.demoteSubtree = demoteSubtree;
//# sourceMappingURL=subtree-functions.js.map