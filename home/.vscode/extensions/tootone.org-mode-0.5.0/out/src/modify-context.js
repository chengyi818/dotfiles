"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const vscode = require("vscode");
const cursor_context_1 = require("./cursor-context");
const Datetime = require("./simple-datetime");
const todo_switch_1 = require("./todo-switch");
exports.UP = "UP";
exports.DOWN = "DOWN";
// If any new contexts are created (Such as TODO), switch for the dataLabel here
function modifyContext(textEditor, edit, action) {
    const ctx = cursor_context_1.default(textEditor, edit);
    if (!ctx) {
        vscode.window.showErrorMessage("No context to modify");
        return;
    }
    switch (ctx.dataLabel) {
        case cursor_context_1.DATE:
            const newDateString = Datetime.modifyDate(ctx.data, action);
            edit.replace(ctx.range, newDateString);
            break;
        case cursor_context_1.TODO:
            const newTodoString = todo_switch_1.default(ctx.data, action);
            if (newTodoString === "") {
                // Must remove extra space
                const oldEnd = ctx.range.end;
                const newEnd = oldEnd.with({ character: oldEnd.character + 1 });
                const oldRange = ctx.range;
                ctx.range = oldRange.with({ end: newEnd });
            }
            edit.replace(ctx.range, newTodoString);
            break;
    }
}
function incrementContext(textEditor, edit) {
    modifyContext(textEditor, edit, exports.UP);
}
exports.incrementContext = incrementContext;
function decrementContext(textEditor, edit) {
    modifyContext(textEditor, edit, exports.DOWN);
}
exports.decrementContext = decrementContext;
//# sourceMappingURL=modify-context.js.map