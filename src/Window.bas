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
Dim As hwnd p=CreateWindowEx(0,WINCLASS, _
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

    While true
        
        While(PeekMessage(@eMsg,0, 0, 0, PM_REMOVE)) > 0 
                TranslateMessage (@eMsg)
                DispatchMessage (@eMsg)

                

                If GetAsyncKeyState(&h1B) Then ' escape key
                    DeleteObject(Membitmap)
                    DeleteDC    (Memhdc)
                    onDestroy()
                    End
                End If
        Wend
        'graphics loop
        clearscreen(Memhdc)

        onCreate()
        onDraw()

        text(Memhdc,0,0,"framerate = "&fps)
        
        BitBlt(WorkingScreen, 0, 0, xres, yres,Memhdc, 0, 0,SRCCOPY)
        Sleep regulate(60,fps)
    Wend

    Function = eMsg.wParam

End Function
#endif
