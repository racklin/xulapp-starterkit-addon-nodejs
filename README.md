NodeJS Runtime For XULApp StarterKit
-----------------------------
NodeJS Runtime For for XULApp StarterKit. Now you can running NodeJS Tools in XULApp StarterKit.

This Add-on Contains NodeJS v0.8.17 MacOSX(32bit/64bit) and Linux(32bit/64bit) and Windows(32bit) runtime.

Download pre-build XPI
-----------------------------
Download pre-build XPI in [Download XPI](https://s3.amazonaws.com/xulapp/addons/xulapp-starterkit-addon-nodejs-0.8.17.xpi)


Get started
-----------------------------
Using XULApp.NodeJS.createProcess() to create a nsIProcess and initialized with node execute file.
Then you can using 'run' for running node process in foreground , using 'runAsync' running node process in background.

XULApp.NodeJS.createProcess() auto add a default observer handler, It will kill all running node process when XULApp quit.

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
var process = XULApp.NodeJS.createProcess();
var args = ["YOUR EXPRESS APP"];
process.runAsync(args, args.length);
```
#### express web application demo addon 
Running express web application from XULApp demo addon is here:
[expressjs-demo](https://github.com/racklin/xulapp-starterkit-addon-expressjs-demo)


License
-----------------------------
NodeJS Runtime For XULApp StarterKit are licensed under the [MPL License].
See LICENSE for more details.
