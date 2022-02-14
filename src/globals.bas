#ifndef GLOBALS_BAS
#define GLOBALS_BAS
#include "windows.bi"

#define SPR_FRONT 0
#define SPR_BEHIND 1
#define SPR_LEFT 2
#define SPR_RIGHT 3

Dim Shared IsDebug As Boolean = True
Dim Shared DT As Integer = 60
Dim shared as Integer xres=800
Dim shared as Integer yres=600
Dim shared as Integer backgroundColour=bgr(0,0,0)
Dim shared As hwnd p
Dim shared As HBITMAP hbmOld 
Dim shared As hdc Memhdc,WorkingScreen,hdc
Dim shared As HBITMAP Membitmap
Dim shared As msg emsg
Dim shared As Long fps

#endif
