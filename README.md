# ZofUtils

A collection of utility functions for AutoIt v3 language


# Provided Functions

## Alert

```au3
    Alert('some text to display');
```

Displays a message box with text.

## Die

```au3
    Die();
    Die('some error to display');
    Die('some error to display and close the message box after 10secs', 10);
```

Exits the program. If optional text is provided, display a message box first.
Third argument specifies after how many seconds to auto-close the message
box (**NOTE**: `0` means **no** timeout!!);


## nap

```au3
    nap();
```

Equivalent to `Sleep(1000)`

## hnap

```au3
    hnap();
```

Equivalent to `Sleep(500)`. (mnemonic: "half `nap`")