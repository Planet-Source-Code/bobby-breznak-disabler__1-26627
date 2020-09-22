VERSION 5.00
Begin VB.Form frmBlink 
   BorderStyle     =   0  'None
   Caption         =   "Form1"
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
End
Attribute VB_Name = "frmBlink"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
    Dim a, b, c As Integer
    Me.Show
    Randomize
    Do
    a = Int(Rnd * 256)
    b = Int(Rnd * 256)
    c = Int(Rnd * 256)
    Me.BackColor = rgb(a, b, c)
    Loop
End Sub
