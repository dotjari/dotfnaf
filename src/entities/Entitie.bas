#ifndef ETENTITIE_BAS
#define ETENTITIE_BAS
#include "windows.bi"
#include "../globals.bas"
#include "../Sprite.bas"

Type Entitie

    Dim As Integer Idle = 0
    Dim As Integer Atention  = 1
    Dim As Integer Found = 2

    Dim As Integer x = 0 
    Dim As Integer y = 0
    
    Declare Function Collide(ByVal objx As Integer, ByVal objy As Integer, _
                            ByVal objw As Integer, ByVal objh As Integer) As Integer
    
    Dim As Double spdx = 0
    Dim As Double spdy = 0.0

    Dim As Integer w = 90
    Dim As Integer h = 90

    Dim As Integer Mode = 3
End Type

Function Entitie.Collide(ByVal objx As Integer, ByVal objy As Integer, _
                        ByVal objw As Integer, ByVal objh As Integer) As Integer
    if((x + w > objx) And (x < objx + objw) And (y + objh > objy)And (y < objy + objh)) Then
        Return 1
    Endif
End FUnction
#endif
