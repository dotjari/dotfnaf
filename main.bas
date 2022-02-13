#include "windows.bi"
#include "src/entities/Player.bas"
#include "src/entities/Foxy.bas"
#include "src/globals.bas"
#include "src/Window.bas"
#include "src/Sprite.bas"
Dim win As sWindow
Dim shared sp As sPlayer
Dim shared sf As sFoxy


Sub sWindow.OnCreate()
    sp.Create()
    sf.Create()
    sf.x = 90
    sf.y = 90
End Sub 
Sub sWindow.OnDraw()
    sp.Control()
    sf.Draw()
    sp.Draw()
    sf.ReachPlayer(sp)

End Sub 
Sub sWindow.OnDestroy()
    sp.Destroy()
    sf.Destroy()
End Sub 

win.InitWindow("dotFNaF", 800, 600)
