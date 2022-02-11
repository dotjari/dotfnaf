#include "windows.bi"
#include "src/entities/Player.bas"
#include "src/globals.bas"
#include "src/Window.bas"
#include "src/Sprite.bas"
Dim win As sWindow
Dim shared sp As sPlayer

Sub sWindow.OnCreate()
    sp.Control()
    sp.Create()
End Sub 
Sub sWindow.OnDraw()
    sp.Draw()
End Sub 
Sub sWindow.OnDestroy()
    sp.Destroy()
End Sub 

win.InitWindow("dotFNaF", 800, 600)
