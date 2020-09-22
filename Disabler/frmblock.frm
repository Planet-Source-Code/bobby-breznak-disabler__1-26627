VERSION 5.00
Begin VB.Form frmRBlock 
   BackColor       =   &H80000007&
   BorderStyle     =   0  'None
   ClientHeight    =   3195
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   WindowState     =   2  'Maximized
   Begin VB.Timer tmrShutDown 
      Interval        =   3000
      Left            =   960
      Top             =   1320
   End
End
Attribute VB_Name = "frmRBlock"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function ExitWindowsEx Lib "user32" (ByVal uFlags As Long, ByVal dwReserved As Long) As Boolean
Private Sub Form_DblClick()
    ShowCursor (bShow = True)
End Sub
Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
    If KeyCode = vbKeyF12 Then
        ShowCursor (bShow = False)
    ElseIf KeyCode = vbKeyControl Then
        tmrShutDown.Enabled = True
        If tmrShutDown.Interval = 3000 Then
            MsgBox "Good-Bye", vbCritical, "See Ya"
            ExitWindowsEx 2, 0
        
        End If
    End If
End Sub

