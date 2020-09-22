VERSION 5.00
Begin VB.Form frmBlock 
   BackColor       =   &H00000000&
   BorderStyle     =   0  'None
   ClientHeight    =   3195
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   WindowState     =   2  'Maximized
End
Attribute VB_Name = "frmBlock"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_DblClick()
    ShowCursor (bShow = True)
End Sub
Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim i As Long
    If KeyCode = vbKeyF12 Then
        'ShowCursor (bShow = False)
        End
    ElseIf KeyCode = vbKeyReturn Then
        Do Until i = 1000
            Beep
            i = i + 1
        Loop
    ElseIf KeyCode = vbKeyControl Then
    Do Until i = 10
        SendMCIString "set cd door open", True
        SendMCIString "set cd door closed", True
        i = i + 1
    Loop
    End If
End Sub

Private Sub Form_Load()
    SendMCIString "close all", False
    If (App.PrevInstance = True) Then
        End
    End If
    fCDLoaded = False
    If (SendMCIString("open cdaudio alias cd wait shareable", True) = False) Then
        End
    End If
    SendMCIString "set cd time format tmsf wait", True
End Sub
Private Function SendMCIString(cmd As String, fShowError As Boolean) As Boolean
    Static rc As Long
    Static errStr As String * 200

    rc = mciSendString(cmd, 0, 0, hWnd)
    If (fShowError And rc <> 0) Then
        mciGetErrorString rc, errStr, Len(errStr)
        MsgBox errStr
    End If
    SendMCIString = (rc = 0)
End Function

