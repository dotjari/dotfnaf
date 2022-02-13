#ifndef WINDOW_BAS
#define WINDOW_BAS
#include "windows.bi"
#include "gui/gui.bas"
#define WINCLASS "#32770"

Type sWindow

    Declare Function InitWindow(ByVal lTitle As LPCSTR, _
                                ByVal nWidth As Integer, _
                                ByVal nHeight As Integer) As Boolean

    Declare Sub onCreate() 
    Declare Sub onDraw() 
    Declare Sub onDestroy() 


    dim m_is_run as Boolean

End Type

Function sWindow.InitWindow(ByVal lTitle As LPCSTR, _
                    ByVal nWidth As Integer, _
                    ByVal nHeight As Integer) As Boolean

    Function = 0
    p=CreateWindowEx(0,WINCLASS, _
                            lTitle, _
                            (WS_OVERLAPPEDWINDOW Or WS_SYSMENU) - (WS_THICKFRAME) Or WS_VISIBLE, _
                            200,200,xres,yres,0,0,0,null)
    WorkingScreen=GetDC(p)
    Memhdc = CreateCompatibleDC(WorkingScreen)
    Membitmap = CreateCompatibleBitmap(WorkingScreen, xres, yres)

    SelectObject(Memhdc, Membitmap)
    setfontsize(Memhdc,20,"courier new")
    setfontcolours(Memhdc,bgr(0,0,255),BackgroundColour)

    SetWindowLong(p, GWL_STYLE, GetWindowLong(p, GWL_STYLE) And Not WS_MAXIMIZEBOX)

    onCreate()
    While true
        
        While(PeekMessage(@eMsg,0, 0, 0, PM_REMOVE)) > 0 
                TranslateMessage (@eMsg)
                DispatchMessage (@eMsg)
        Wend
        'graphics loop
        clearscreen(Memhdc)
        SetBack(RGB(165,165,165))

        onDraw()

        text(Memhdc,0,0,"framerate = "&fps)
        
        BitBlt(WorkingScreen, 0, 0, xres, yres,Memhdc, 0, 0,SRCCOPY)
        Sleep regulate(60,fps)
        If GetAsyncKeyState(&h1B) Then ' escape key
            DeleteObject(Membitmap)
            DeleteDC    (Memhdc)
            End
        End If
    Wend
    onDestroy()
    Function = eMsg.wParam

End Function

Function getWidth() As Integer
    Dim As RECT rect
    Dim As Integer nwidth
    if(GetWindowRect(p, @rect)) Then
        nwidth = rect.right - rect.left
    Endif
    Return nwidth
End Function 

Function getHeight() As Integer
    Dim As RECT rect
    Dim As Integer nheight
    if(GetWindowRect(p, @rect)) Then
        nheight = rect.bottom - rect.top
    Endif
    Return nheight
End Function
#endif
