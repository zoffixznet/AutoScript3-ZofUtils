#cs ---------------------------------------------------------------------------

AutoIt Version: 3.2.12.0
Author:         Zoffix Znet
License:        Artistic License 2.0

Library description: useful utility functions

#ce ---------------------------------------------------------------------------

#include <Array.au3>;
Opt('MustDeclareVars', 1);

#cs ---------------------------------------------------------------------------

StringRegExpG( $text, $pattern [$flag = 0], [$offset = 1] );

Return all matches of $pattern in $text

#ce ---------------------------------------------------------------------------

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