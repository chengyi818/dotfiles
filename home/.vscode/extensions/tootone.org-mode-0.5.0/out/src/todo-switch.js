"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const vscode_1 = require("vscode");
const utils_1 = require("./utils");
function default_1(todoString, action) {
    const todoKeywords = utils_1.getUniq(utils_1.getKeywords());
    let nextKeywordIdx = todoKeywords.indexOf(todoString);
    if (nextKeywordIdx < 0) {
        vscode_1.window.showErrorMessage(`Keyword '${todoString}' not found`);
        return todoString;
    }
    else {
        const mod = action === "UP" ? 1 : -1;
        nextKeywordIdx = (nextKeywordIdx + mod);
        if (nextKeywordIdx < 0) {
            nextKeywordIdx = todoKeywords.length - 1;
        }
        else {
            nextKeywordIdx %= todoKeywords.length;
        }
    }
    let nextWord = todoKeywords[nextKeywordIdx];
    if (todoString === "") {
        nextWord += " ";
    }
    return nextWord;
}
exports.default = default_1;
//# sourceMappingURL=todo-switch.js.map