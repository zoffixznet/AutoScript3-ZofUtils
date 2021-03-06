#cs ---------------------------------------------------------------------------

AutoIt Version: 3.2.12.0
Author:         Zoffix Znet
License:        Artistic License 2.0

Library description: useful utility functions

#ce ---------------------------------------------------------------------------

#include-once
#include <MsgBoxConstants.au3>
#include <FileConstants.au3>

Opt('MustDeclareVars', 1);

Global $ZOFUTILS_NAP = 1;

Func alert($text)
    MsgBox($MB_OK, "", $text);
EndFunc

Func die($text = '', $timeout = 0)
    If StringLen($text) Then MsgBox($MB_OK, "", $text, $timeout);
    Exit(1);
EndFunc

func nap()
    sleep(1000 * $ZOFUTILS_NAP)
endfunc

func hnap()
    sleep(500 * $ZOFUTILS_NAP)
endfunc

Func title_mode_start()
    Return Opt("WinTitleMatchMode", 1);
EndFunc

Func title_mode_sub()
    Return Opt("WinTitleMatchMode", 2);
EndFunc

Func title_mode_exact()
    Return Opt("WinTitleMatchMode", 3);
EndFunc

Func title_mode($mode)
    Return Opt("WinTitleMatchMode", $mode);
EndFunc

Func post($url, $data)
    Local $req = ObjCreate('winhttp.winhttprequest.5.1');
    $req.Open('POST', $url, False);
    $req.SetRequestHeader('Content-Type','application/x-www-form-urlencoded');
    $req.Send($data);
    Local $res[] = [ $req.ResponseText, $req.Status ];
    Return $res;
EndFunc

Func spurt($data, $filename)
    Local $fh _
    = FileOpen($filename, $FO_OVERWRITE + $FO_UTF8_NOBOM + $FO_CREATEPATH);
    If $fh == -1 Then Return -1;

    If Not FileWrite($fh, $data) Then Return -1;
    Return $fh;
EndFunc

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
