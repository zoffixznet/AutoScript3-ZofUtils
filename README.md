# ZofUtils

A collection of utility functions for AutoIt v3 language


# Provided Functions

## alert

```au3
    alert('some text to display');
```

Displays a message box with text.

## die

```au3
    die();
    die('some error to display');
    die('some error to display and close the message box after 10secs', 10);
```

Exits the program. If optional text is provided, display a message box first.
Third argument specifies after how many seconds to auto-close the message
box (**NOTE**: `0` means **no** timeout!!)

## post

```au3
    Local $res = post('http://httpbin.org/post', 'foo=bar&bez=ber');
    If $res[1] <> 200 Then die('Failed! Response code: ' & $res[1])
    alert('Response is: ' & $res[0]);
```

## spurt

```au3
    Local $fh = spurt('C:/foo/bar/baz/My content!', 'foo.txt');
    If $fh == -1 Then die('Error!');
```
Writes data (first argument) into file (second argument) and returns
the filehandle. Returns -1 on error. The file and any needed directories
are created. If the file exists, its contents will be overwritten.

# Shortcut Functions

Functions that are equivalent to specific AutoIt code. `Return` indicates
that function returns that specific value.

`$ZOFUTILS_NAP` is a global variable that you can use as a multiplier
for nap functions

```au3
    nap();                  Sleep(1000 * $ZOFUTILS_NAP)
    hnap();                 Sleep(500  * $ZOFUTILS_NAP);  (mnemonic "half nap")
    title_mode_start();     Return Opt("WinTitleMatchMode", 1)
    title_mode_sub();       Return Opt("WinTitleMatchMode", 2)
    title_mode_exact();     Return Opt("WinTitleMatchMode", 3)
    title_mode($mode);      Return Opt("WinTitleMatchMode", $mode)
```
