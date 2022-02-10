#ifndef GLOBALS_BAS
#define GLOBALS_BAS
#include "windows.bi"

Dim shared as Integer xres=800
Dim shared as Integer yres=600
Dim shared as Integer backgroundColour=bgr(0,0,0)

Dim shared As hdc Memhdc,WorkingScreen,hdc
Dim shared As HBITMAP Membitmap
Dim shared As msg emsg
Dim shared As Long fps

#endif