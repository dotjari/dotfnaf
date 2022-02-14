#ifndef FOXY_BAS
#define FOXY_BAS
#include "windows.bi"
#include "../globals.bas"
#include "../Window.bas"
#include "Entitie.bas"
#include "../gui/gui.bas"
#include "player.bas"
#include "../Sprite.bas"

Type sFoxy Extends Entitie
    Declare Sub Create()
    Declare Sub Control()
    Declare Sub Destroy()
    Declare Sub Draw()
    Declare Sub ReachPlayer(Byval p As sPlayer)
    
    Dim As Boolean IsActive = False
    Dim As Boolean aTimer = False 

    Dim As Double spd = 2.8
    
    Dim sprF As Sprite
    Dim sprB As Sprite

    Dim position As Integer = SPR_FRONT
End Type

Sub sFoxy.ReachPlayer(Byval p As sPlayer)
    '    190
    If(aTImer = True) Then
        if(p.x <= x+280) Then
            if(p.y <= y+280) Then
                text(Memhdc,0,32,"aTimer")

                If p.x > x Then
                    x += spd 
                Endif

                If p.x < x Then
                    x -= spd 
                Endif

                If p.y > y Then
                    y += spd 
                    position = SPR_FRONT
                Endif

                If p.y < y Then
                    y -= spd 
                    position = SPR_BEHIND
                Endif

            Endif
        Endif
        if(IsDebug = True) Then
            DrawLine(x+(w/2),y+(h/2),p.x+(w/2),p.y+(h/2),RGB(255,0,0),1)
        EndIf
    Endif

End Sub


Sub sFoxy.Create()
    sprF.loadImage("res\foxy\foxy.bmp")
    sprB.loadImage("res\foxy\foxy1.bmp")
End Sub

Sub sFoxy.Control()

    if(GetAsyncKeyState(&h46)) Then 
        aTimer = True 
    Endif

End Sub

Sub sFoxy.Draw()

    w = 37
    h = 111
    if(position = SPR_FRONT) Then   
        sprF.drawImage(x,y,w,h)
    ElseIf(position = SPR_BEHIND) Then
        sprB.drawImage(x,y,w,h)
    Endif
End Sub

Sub sFoxy.Destroy()
    sprF.cleanUpImage()
    sprB.cleanUpImage()
End Sub
#endif
