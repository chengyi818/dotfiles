"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const vscode = require("vscode");
function butterfly(textEditor, edit) {
    const query = "Do you really want to unleash the powers of the butterfly?";
    const options = ["Yes", "No"];
    const fact = "Amazing physics going on...";
    const xkcd = "https://xkcd.com/378/";
    const status = vscode.window.createStatusBarItem(vscode.StatusBarAlignment.Right, 100);
    status.text = "Successfully flipped one bit!";
    vscode.window.showInformationMessage(query, ...options)
        .then(choice => {
        if (choice === "Yes") {
            status.show();
            vscode.window.showInformationMessage(fact)
                .then(() => status.hide());
        }
        else if (choice === "No") {
            vscode.window.showInformationMessage(xkcd);
        }
        ;
    });
}
exports.butterfly = butterfly;
;
//# sourceMappingURL=pascuanese-functions.js.map