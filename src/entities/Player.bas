#ifndef PLAYER_BAS
#define PLAYER_BAS
#include "windows.bi"
#include "../globals.bas"

Type sPlayer
        Declare Sub Control()
        Declare Sub Draw()
        Dim As Integer x = 0
        Dim As Integer y = 0
        Dim As Integer w = 90
        Dim As Integer h = 90
End Type

Sub sPlayer.Control()

    if(GetAsyncKeyState(VK_RIGHT)) then
        x+= 4
        w+= 4
    endif
    if(GetAsyncKeyState(VK_LEFT)) then
        x-= 4
        w-= 4
    endif
      
    if(GetAsyncKeyState(VK_DOWN)) then
        y+= 4
        h+= 4
    endif

    if(GetAsyncKeyState(VK_UP)) then
        y-= 4
        h-= 4
    endif

End Sub

Sub sPlayer.Draw()
    Rectangle(Memhdc,x,y,w,h)
End Sub

#endif
