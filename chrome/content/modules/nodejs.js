/**
 * NodeJS support for XULApp StarterKit
 *
 * Copyright (c) 2013 Rack Lin (racklin@gmail.com)
 */


this.EXPORTED_SYMBOLS  = ['NodeJS'];
Components.utils.import("resource://gre/modules/Services.jsm");

this.NodeJS = new function() {

    const nodeRuntimeChromePath = "chrome://nodejs-runtime/content/";
    const Ci = Components.interfaces;
    const Cc = Components.classes;

    // exported properties and methods
    this.__exposedProps__ = {
        createProcess: "r"
    };

    var getNodeFile = function() {
        var nodeRuntimeUrl = "";
        // isWindows?
        if (Services.appinfo.OS == "WINNT") {
            nodeRuntimeUrl = nodeRuntimeChromePath + "node.exe";
        }else {
            nodeRuntimeUrl = nodeRuntimeChromePath + "bin/node";
        }

        // Convert Url to nsIFile
        var nodeFullpath = GREUtils.File.chromeToPath(nodeRuntimeUrl);
        var nodeFile = GREUtils.File.getFile(nodeFullpath);

        return nodeFile;
    }


    var getDefaultQuitHandler = function(process) {

        var observerHandler = {
            // subject refers to the process nsIProcess object
            observe: function(subject, topic, data) {
                switch (topic) {
                    case "quit-application-granted":
                        // Shut down any Node.js processes
                        if(process) process.kill();
                        break;
                };
            }
        };

        return observerHandler;
    }


    /**
     * create nsIProcess and initialized with node.
     */
    this.createProcess = function(quitObserveHandler) {

        var nodeFile = getNodeFile();
        if (!nodeFile.exists()) return null;

        // Create an nsIProcess
        var process = Cc["@mozilla.org/process/util;1"].createInstance(Ci.nsIProcess);
        process.init(nodeFile);

        // auto register observe when application quit, kill background process
        if (!quitObserveHandler) {
            quitObserveHandler = getDefaultQuitHandler(process);
        }
        Services.obs.addObserver(quitObserveHandler, "quit-application-granted", false);

        return process;
    }

}

