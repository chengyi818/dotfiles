"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const utils_1 = require("./utils");
function bold(textEditor, edit) {
    utils_1.surroundWithText(textEditor, edit, "*", "Please select the text you want to mark as bold.");
}
exports.bold = bold;
function italic(textEditor, edit) {
    utils_1.surroundWithText(textEditor, edit, "/", "Please select the text you want to italicize.");
}
exports.italic = italic;
function underline(textEditor, edit) {
    utils_1.surroundWithText(textEditor, edit, "_", "Please select the text you want to underline.");
}
exports.underline = underline;
function code(textEditor, edit) {
    utils_1.surroundWithText(textEditor, edit, "~", "Please select the text you want to mark as code.");
}
exports.code = code;
function verbose(textEditor, edit) {
    utils_1.surroundWithText(textEditor, edit, "=", "Please select the text you want to mark as verbose.");
}
exports.verbose = verbose;
function literal(textEditor, edit) {
    utils_1.prependTextToLine(textEditor, edit, ": ");
}
exports.literal = literal;
//# sourceMappingURL=markup-functions.js.map