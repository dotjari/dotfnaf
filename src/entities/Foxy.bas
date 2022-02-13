#ifndef FOXY_BAS
#define FOXY_BAS
#include "windows.bi"
#include "../globals.bas"
#include "animatronic.bas"
#include "player.bas"
#include "../Sprite.bas"

Type sFoxy Extends Animatronic
    Declare Sub Create()
    Declare Sub Control()
    Declare Sub Destroy()
    Declare Sub Draw()
    Declare Sub ReachPlayer(Byval p As sPlayer)
    
    Dim As Integer spd = 3

    Dim As Integer x = 0 
    Dim As Integer y = 0
    Dim As Integer w = 90
    Dim As Integer h = 90
    
    Dim sprF As Sprite
    Dim sprB As Sprite

    Dim position As Integer = SPR_FRONT
End Type

Sub sFoxy.ReachPlayer(Byval p As sPlayer)
    '    190
    If p.x > x Then
        x = x + spd
    Endif

    If p.x < x Then
        x = x - spd
    Endif

    If p.y > y Then
    y = y + spd
    Endif

    If p.y < y Then
        y = y - spd
    Endif
    
End Sub


Sub sFoxy.Create()
    sprF.loadImage("res\foxy\foxy.bmp")
End Sub

Sub sFoxy.Control()

End Sub

Sub sFoxy.Draw()
    sprF.drawImage(x,y,w,h)
End Sub

Sub sFoxy.Destroy()
    sprF.cleanUpImage()
End Sub
#endif
