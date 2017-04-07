; -------------------
; mousepostooltip.ahk
; -------------------
; 
; MIT License
; 
; Copyright (c) ErlangParasu 2017 
; 
; Permission is hereby granted, free of charge, to any person obtaining a copy
; of this software and associated documentation files (the "Software"), to deal
; in the Software without restriction, including without limitation the rights
; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
; copies of the Software, and to permit persons to whom the Software is
; furnished to do so, subject to the following conditions:
; 
; The above copyright notice and this permission notice shall be included in all
; copies or substantial portions of the Software.
; 
; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
; SOFTWARE.

CoordMode, Mouse, Screen

mX := 0
mY := 0

#Persistent
SetTimer, WatchCursor, 1
return

WatchCursor:
    MouseGetPos, mX, mY, id, control
    ;ToolTip, X: %mX%`nY: %mY%
    ToolTip, (%mX%`, %mY%)
return

savePos(name, x, y) {
    fileName := "mousepostooltip.log"
    file := FileOpen(fileName, "a")
    if !IsObject(file)
    {
        MsgBox, 
        MsgBox, 0, Error, Can't open "%fileName%" for saving!, 
        return
    }
    TestString := "`r`n" . name . "," . x . "," . y
    file.Write(TestString)
    file.Close()
}

::&sc::
InputBox, posName, Save Mouse Position, Position:`n    X: %mX%`n    Y: %mY%`n`nName this position as:, , , 
if !ErrorLevel {
    savePos(posName, mX, mY)
}
return
