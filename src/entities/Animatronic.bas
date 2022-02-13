#ifndef ANIMATRONIC_BAS
#define ANIMATRONIC_BAS
#include "windows.bi"
#include "../globals.bas"
#include "../Sprite.bas"

Type Animatronic

    Dim As Integer Idle = 0
    Dim As Integer Atention  = 1
    Dim As Integer Found = 2

    Dim As Integer Mode = 3
End Type
#endif
