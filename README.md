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


# Shortcut Functions

Functions that are equivalent to specific AutoIt code. `Return` indicates
that function returns that specific value.

```$ZOFUTILS_NAP` is a global variable that you can use as a multiplier
for nap functions

```au3
    nap();                  Sleep(1000 * $ZOFUTILS_NAP)
    hnap();                 Sleep(500  * $ZOFUTILS_NAP);  (mnemonic "half nap")
    title_mode_start();     Return Opt("WinTitleMatchMode", 1)
    title_mode_sub();       Return Opt("WinTitleMatchMode", 2)
    title_mode_exact();     Return Opt("WinTitleMatchMode", 3)
    title_mode($mode);      Return Opt("WinTitleMatchMode", $mode)
```
