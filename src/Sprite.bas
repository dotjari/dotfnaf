#ifndef SPRITE_BAS
#define SPRITE_BAS
#include "windows.bi"
#include "globals.bas"

Type Sprite

    Dim As HDC         imageDC
    Dim As HBITMAP     imageBmp
    Dim As HBITMAP     imageBmpOld

    Declare Sub loadImage(ByVal pathname As String)
    Declare Sub cleanUpImage()
    Declare Sub drawImage(ByVal x As Integer, ByVal y As Integer, _
                            ByVal w As Integer, ByVal h As Integer)
End Type

Sub Sprite.loadImage(ByVal pathname As String)
    imageDC = CreateCompatibleDC(NULL)

    imageBmp = Cast(HBITMAP, LoadImageA(NULL, pathname,IMAGE_BITMAP,0,0,LR_DEFAULTSIZE Or LR_LOADFROMFILE))

    imageBmpOld = Cast(HBITMAP, SelectObject(imageDC,imageBmp))
End Sub

Sub Sprite.cleanUpImage()
    SelectObject(imageDC,imageBmpOld)
    DeleteObject(imageBmp)
    DeleteDC(imageDC)
End Sub

Sub Sprite.drawImage(ByVal x As Integer, ByVal y As Integer, _
                    ByVal w As Integer, ByVal h As Integer)
    BitBlt(Memhdc, x,y,w,h, imageDC, 0,0, SRCCOPY)
End Sub
#endif