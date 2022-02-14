#ifndef PLAYER_BAS
#define PLAYER_BAS
#include "windows.bi"
#include "../globals.bas"
#include "../gui/gui.bas"
#include "../Sprite.bas"
#include "Entitie.bas"

Type sPlayer Extends Entitie

    Dim wFrame As Integer = 0

    Declare Sub Create()
    Declare Sub Control()
    Declare Sub Destroy()
    Declare Sub Draw()
    
    Declare Sub addFrame()

    Dim As Integer spd = 1
    Dim As Boolean released = False
    
    Dim sprF As Sprite
    Dim sprB As Sprite
    
    Dim sprWF As Sprite
    Dim sprWF1 As Sprite
    
    Dim sprWB As Sprite
    Dim sprWB1 As Sprite

    Dim position As Integer = SPR_BEHIND
End Type

Sub sPlayer.Create()
    
    sprF.loadImage("res\guarda\guarda.bmp")
    sprB.loadImage("res\guarda\guarda1.bmp")

    sprWF.loadImage("res\guarda\guardaW.bmp")
    sprWF1.loadImage("res\guarda\guardaW1.bmp")

    sprWB.loadImage("res\guarda\guardaW2.bmp")
    sprWB1.loadImage("res\guarda\guardaW3.bmp")
End Sub

Sub sPlayer.addFrame()
    wFrame += 1
    if(wFrame > 10) then
        wFrame = 0
    Endif
End Sub

Sub sPlayer.Control()


    if(GetAsyncKeyState(VK_RIGHT)< 0) then
        spdx += spd 
    endif
    if(GetAsyncKeyState(VK_LEFT)< 0) then
        spdx -= spd 
    endif
      
    if(GetAsyncKeyState(VK_DOWN)< 0) then
        spdy += spd
        addFrame()
        position = SPR_FRONT
    endif

    if(GetAsyncKeyState(VK_UP)< 0) then
        spdy -= spd
        addFrame()
        position = SPR_BEHIND
    endif

    x += spdx
    y += spdy
    w -= spdx
    h -= spdy
    
    spdx *= 0.744
    spdy *= 0.744


End Sub

Sub sPlayer.Draw()
    w = 90
    h = 90
    if(position = SPR_FRONT) then
        if(wFrame <= 5) then
            sprWF.drawImage(x,y,w,h)
        Elseif(wFrame >= 5) then
            sprWF1.drawImage(x,y,w,h)
        Endif

    Endif
    If(position = SPR_BEHIND) then
        if(wFrame <= 5) then
            sprWB.drawImage(x,y,w,h)
        Elseif(wFrame >= 5) then
            sprWB1.drawImage(x,y,w,h)
        Endif
    Endif
End Sub

Sub sPlayer.Destroy()
    sprF.cleanUpImage()
    sprB.cleanUpImage()

    sprWF.cleanUpImage()
    sprWF1.cleanUpImage()

    sprWB.cleanUpImage()
    sprWB1.cleanUpImage()
End Sub

#endif
