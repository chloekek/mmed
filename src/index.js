"use strict";

const electron = require("electron");
const {app, BrowserWindow} = electron;

app.on("ready", () => {
    const window = new BrowserWindow({
        width: 800,
        height: 600,
        webPreferences: {
            nodeIntegration: true,
        },
    });
    window.loadFile("index.html");
});
