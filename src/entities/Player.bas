#ifndef PLAYER_BAS
#define PLAYER_BAS
#include "windows.bi"
#include "../globals.bas"
#include "../Sprite.bas"

Type sPlayer
    Declare Sub Create()
    Declare Sub Control()
    Declare Sub Destroy()
    Declare Sub Draw()
    
    Dim As Integer spd = 4

    Dim As Integer x = 0
    Dim As Integer y = 0
    Dim As Integer w = 90
    Dim As Integer h = 90
    
    Dim sprF As Sprite
    Dim sprB As Sprite

    Dim position As Integer = SPR_BEHIND
End Type

Sub sPlayer.Create()
    sprF.loadImage("res\guarda\guarda.bmp")
    sprB.loadImage("res\guarda\guarda1.bmp")
End Sub

Sub sPlayer.Control()

    if(GetAsyncKeyState(VK_RIGHT)) then
        x+= spd
        w+= spd
    endif
    if(GetAsyncKeyState(VK_LEFT)) then
        x-= spd
        w-= spd
    endif
      
    if(GetAsyncKeyState(VK_DOWN)) then
        y+= spd
        h+= spd
        position = SPR_FRONT
    endif

    if(GetAsyncKeyState(VK_UP)) then
        y-= spd
        h-= spd
        position = SPR_BEHIND
    endif

    if(spd > 4) then
        spd = 4
    Endif

End Sub

Sub sPlayer.Draw()
    if(position = SPR_FRONT) then
        sprF.drawImage(x,y,w,h)
    Endif
    If(position = SPR_BEHIND) then
        sprB.drawImage(x,y,w,h)
    Endif
End Sub

Sub sPlayer.Destroy()
    sprF.cleanUpImage()
End Sub

#endif
