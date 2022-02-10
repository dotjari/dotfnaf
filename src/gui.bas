#include "windows.bi"
#include "../globals.bas"
Sub setfontsize(h As hdc,size As Long,style As zstring Ptr)
      SelectObject(h,CreateFont(size,0,0,0,400,0,0,0,DEFAULT_CHARSET,OUT_OUTLINE_PRECIS,CLIP_DEFAULT_PRECIS,ANTIALIASED_QUALITY,VARIABLE_PITCH,style)) 
End Sub

Sub setfontcolours(h As hdc,text As Ulong,background As Ulong)
      SetTextColor(h,text) 
      SetBkColor(h,background)
End Sub

Sub text(h As hdc,x As Long,y As Long,s As String)
      Var l=Len(s)
      textouta(h,x,y,s,L)
End Sub

Sub ClearScreen(h As hdc)
      Var colour=BackgroundColour
      SetDCBrushColor(h,colour)
      SetDCPenColor(h,colour)
      rectangle(h,0,0,xres,yres)
End Sub

Function Regulate(Byval MyFps As Long,Byref fps As Long) As Long 'optional
      Static As Double timervalue,_lastsleeptime,t3,frames
      frames+=1
      If (Timer-t3)>=1 Then t3=Timer:fps=frames:frames=0
      Var sleeptime=_lastsleeptime+((1/myfps)-Timer+timervalue)*1000
      If sleeptime<1 Then sleeptime=1
      _lastsleeptime=sleeptime
      timervalue=Timer
      Return sleeptime
End Function


 
