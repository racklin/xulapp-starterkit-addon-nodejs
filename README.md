NodeJS Runtime For XULApp StarterKit
-----------------------------
NodeJS Runtime For for XULApp StarterKit. Now you can running NodeJS Tools in XULApp StarterKit.

This Add-on Contains NodeJS v0.8.17 MacOSX(32bit/64bit) and Linux(32bit/64bit) and Windows(32bit) runtime.

Download pre-build XPI
-----------------------------
Download pre-build XPI in [downloads](https://github.com/racklin/xulapp-starterkit-addon-nodejs/tree/master/downloads)


Get started
-----------------------------
XULApp.NodeJS.createProcess to create a nsIProcess and initialized with node execute file.
Then you can using 'run' for running node process in foreground , using 'runAsync' running node process in background.

NodeJS also add an Default Observer Handler , when XULApp StarterKit quit, it will kill all node running process.

More detail, please see [nsIProcess](https://developer.mozilla.org/en-US/docs/XPCOM_Interface_Reference/nsIProcess).


Example
-----------------------------
### Running CoffeeScript compiler in block mode , wait until finish.
```
var process = XULApp.NodeJS.createProcess();
// Run the coffeescript compiler
var args = ["COFFEESCRIPT_ADDON_PATH", "-c", "/tmp/test.coffee", "-o", "test.js"];
process.run(true, args, args.length);
```

### Running express web application from XULApp (Crazy idea)
```
var processObserverHandler = {
    observe: function(subject, topic, data) {
        switch (topic) {
            // Process has finished running and closed
            case "process-finished":
                break;
            // Process failed to run
            case "process-failed":
                break;
        }
    }
};

var process = XULApp.NodeJS.createProcess();
var args = ["YOUR EXPRESS APP"];
process.runAsync(args, args.length);
```

License
-----------------------------
NodeJS Runtime For XULApp StarterKit are licensed under the [MPL License].
See LICENSE for more details.
