#cs ---------------------------------------------------------------------------

AutoIt Version: 3.2.12.0
Author:         Zoffix Znet
License:        Artistic License 2.0

Library description: useful utility functions

#ce ---------------------------------------------------------------------------

#include-once
#include <MsgBoxConstants.au3>

Opt('MustDeclareVars', 1);

Func Alert($text)
    MsgBox($MB_OK, "", $text);
EndFunc

Func Die($text = '', $timeout = 0)
    If StringLen($text) Then MsgBox($MB_OK, "", $text, $timeout);
    Exit(1);
EndFunc

func nap()
    sleep(1000)
endfunc

func hnap()
    sleep(500)
endfunc

#cs ---------------------------------------------------------------------------

StringRegExpG( $text, $pattern [, $flag = 0 [, $offset = 1]] );

Return all matches of $pattern in $text


Func StringRegExpG( $text, $pattern, $flag = 0, $offset = 1)
    Local $total_matches[1];
    Local $is_first = 1;
    While 1
        Local $matches = StringRegExp( $text, $pattern, $flag, $offset );

        If @error = 0 Then
            $offset = @extended;
        Else
            ExitLoop
        EndIf

        If $is_first Then
            $total_matches = $matches;
            $is_first = 0;
        Else
            _ArrayConcatenate( $total_matches, $matches );
        EndIf
    WEnd

    Return $total_matches;

EndFunc

#ce ---------------------------------------------------------------------------
