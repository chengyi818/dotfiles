'use strict';
Object.defineProperty(exports, "__esModule", { value: true });
const vscode = require("vscode");
const HeaderFunctions = require("./header-functions");
const TimestampFunctions = require("./timestamp-functions");
const MarkupFunctions = require("./markup-functions");
const SubtreeFunctions = require("./subtree-functions");
const modify_context_1 = require("./modify-context");
const PascuaneseFunctions = require("./pascuanese-functions");
function activate(context) {
    let insertHeadingRespectContentCmd = vscode.commands.registerTextEditorCommand('org.insertHeadingRespectContent', HeaderFunctions.insertHeadingRespectContent);
    let insertChildCmd = vscode.commands.registerTextEditorCommand('org.insertSubheading', HeaderFunctions.insertChild);
    let demoteLineCmd = vscode.commands.registerTextEditorCommand('org.doDemote', HeaderFunctions.demoteLine);
    let promoteLineCmd = vscode.commands.registerTextEditorCommand('org.doPromote', HeaderFunctions.promoteLine);
    let promoteSubtreeCmd = vscode.commands.registerTextEditorCommand('org.promoteSubtree', SubtreeFunctions.promoteSubtree);
    let demoteSubtreeCmd = vscode.commands.registerTextEditorCommand('org.demoteSubtree', SubtreeFunctions.demoteSubtree);
    let insertTimestampCmd = vscode.commands.registerTextEditorCommand('org.timestamp', TimestampFunctions.insertTimestamp);
    let clockInCmd = vscode.commands.registerTextEditorCommand('org.clockin', TimestampFunctions.clockIn);
    let clockOutCmd = vscode.commands.registerTextEditorCommand('org.clockout', TimestampFunctions.clockOut);
    let updateClockCmd = vscode.commands.registerTextEditorCommand('org.updateclock', TimestampFunctions.updateClock);
    let incrementContextCmd = vscode.commands.registerTextEditorCommand('org.incrementContext', modify_context_1.incrementContext);
    let decrementContextCmd = vscode.commands.registerTextEditorCommand('org.decrementContext', modify_context_1.decrementContext);
    const boldCmd = vscode.commands.registerTextEditorCommand('org.bold', MarkupFunctions.bold);
    const italicCmd = vscode.commands.registerTextEditorCommand('org.italic', MarkupFunctions.italic);
    const underlineCmd = vscode.commands.registerTextEditorCommand('org.underline', MarkupFunctions.underline);
    const codeCmd = vscode.commands.registerTextEditorCommand('org.code', MarkupFunctions.code);
    const verboseCmd = vscode.commands.registerTextEditorCommand('org.verbose', MarkupFunctions.verbose);
    const literalCmd = vscode.commands.registerTextEditorCommand('org.literal', MarkupFunctions.literal);
    const butterflyCmd = vscode.commands.registerTextEditorCommand('org.butterfly', PascuaneseFunctions.butterfly);
    context.subscriptions.push(insertHeadingRespectContentCmd);
    context.subscriptions.push(insertChildCmd);
    context.subscriptions.push(demoteLineCmd);
    context.subscriptions.push(promoteLineCmd);
    context.subscriptions.push(promoteSubtreeCmd);
    context.subscriptions.push(demoteSubtreeCmd);
    context.subscriptions.push(insertTimestampCmd);
    context.subscriptions.push(incrementContextCmd);
    context.subscriptions.push(decrementContextCmd);
    context.subscriptions.push(boldCmd);
    context.subscriptions.push(italicCmd);
    context.subscriptions.push(underlineCmd);
    context.subscriptions.push(codeCmd);
    context.subscriptions.push(verboseCmd);
    context.subscriptions.push(literalCmd);
    context.subscriptions.push(butterflyCmd);
}
exports.activate = activate;
function deactivate() {
}
exports.deactivate = deactivate;
//# sourceMappingURL=extension.js.map