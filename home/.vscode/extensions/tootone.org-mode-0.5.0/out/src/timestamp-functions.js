"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const vscode = require("vscode");
const Utils = require("./utils");
const Datetime = require("./simple-datetime");
function insertTimestamp(textEditor, edit) {
    const document = Utils.getActiveTextEditorEdit();
    const cursorPos = Utils.getCursorPosition();
    const dateObject = Datetime.currentDate();
    const dateString = Datetime.buildDateString(dateObject);
    edit.insert(cursorPos, dateString);
}
exports.insertTimestamp = insertTimestamp;
function clockIn(textEditor, edit) {
    const document = Utils.getActiveTextEditorEdit();
    const cursorPos = Utils.getCursorPosition();
    const line = Utils.getLine(document, cursorPos);
    if (line.indexOf('CLOCK:') === -1) {
        edit.insert(cursorPos, 'CLOCK: ');
    }
    insertDateTime(edit, cursorPos);
}
exports.clockIn = clockIn;
function clockOut(textEditor, edit) {
    const document = Utils.getActiveTextEditorEdit();
    const cursorPos = Utils.getCursorPosition();
    const line = Utils.getLine(document, cursorPos);
    const separator = Utils.getClockInOutSeparator();
    const separatorIndex = line.indexOf(separator);
    if (separatorIndex !== -1) {
        const initPos = new vscode.Position(cursorPos.line, separatorIndex);
        const endPos = new vscode.Position(cursorPos.line, line.length);
        const range = new vscode.Range(initPos, endPos);
        edit.replace(range, '');
    }
    edit.insert(cursorPos, separator);
    insertDateTime(edit, cursorPos);
}
exports.clockOut = clockOut;
function updateClock(textEditor, edit) {
    const document = Utils.getActiveTextEditorEdit();
    const cursorPos = Utils.getCursorPosition();
    const line = Utils.getLine(document, cursorPos);
    const clockTotal = Datetime.getClockTotal(line);
    if (!clockTotal) {
        vscode.window.showErrorMessage('You need two timestamps to update the clock total.');
        return;
    }
    const separator = Utils.getClockTotalSeparator();
    const separatorIndex = line.indexOf(separator);
    if (separatorIndex !== -1) {
        const initPos = new vscode.Position(cursorPos.line, separatorIndex);
        const endPos = new vscode.Position(cursorPos.line, line.length);
        const range = new vscode.Range(initPos, endPos);
        edit.replace(range, '');
    }
    edit.insert(cursorPos, separator);
    edit.insert(cursorPos, clockTotal);
}
exports.updateClock = updateClock;
function insertDateTime(edit, cursorPos) {
    const dateTimeObject = Datetime.currentDateTime();
    const dateTimeString = Datetime.buildDateTimeString(dateTimeObject);
    edit.insert(cursorPos, dateTimeString);
}
//# sourceMappingURL=timestamp-functions.js.map