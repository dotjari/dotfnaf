#include "windows.bi"
#include "src/entities/Player.bas"
#include "src/globals.bas"
#include "src/Window.bas"
Dim win As sWindow
Dim shared sp As sPlayer

Sub sWindow.OnCreate()
    sp.Control()
End Sub 
Sub sWindow.OnDraw()
    sp.Draw()
End Sub 
Sub sWindow.OnDestroy()
End Sub 

win.InitWindow("dotFNaF", 800, 600)