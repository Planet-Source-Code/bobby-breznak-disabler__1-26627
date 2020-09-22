VERSION 5.00
Begin VB.Form frmMain 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Disabler"
   ClientHeight    =   5115
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   7755
   Icon            =   "frmMain.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5115
   ScaleWidth      =   7755
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdKClosed 
      Caption         =   "Keep Clo&sed"
      Height          =   735
      Left            =   5880
      TabIndex        =   14
      Top             =   2880
      Width           =   1695
   End
   Begin VB.CommandButton cmdKOpen 
      Caption         =   "Kee&p Open"
      Height          =   735
      Left            =   4080
      TabIndex        =   13
      Top             =   2880
      Width           =   1695
   End
   Begin VB.CommandButton cmdTOpen 
      Caption         =   "&Keep on Opening"
      Height          =   735
      Left            =   5880
      TabIndex        =   12
      Top             =   2040
      Width           =   1695
   End
   Begin VB.CommandButton cmdOpen 
      Caption         =   "&Open CD Tray"
      Height          =   735
      Left            =   4080
      TabIndex        =   11
      Top             =   2040
      Width           =   1695
   End
   Begin VB.Frame famFun 
      Caption         =   "Fun"
      Height          =   1935
      Left            =   3960
      TabIndex        =   18
      Top             =   1800
      Width           =   3735
   End
   Begin VB.CommandButton CmdAbout 
      Caption         =   "&About"
      Height          =   495
      Left            =   2160
      TabIndex        =   15
      Top             =   4560
      Width           =   4095
   End
   Begin VB.CommandButton cmdRBlock 
      Caption         =   "&Reset Block"
      Height          =   375
      Left            =   240
      TabIndex        =   2
      Top             =   960
      Width           =   3375
   End
   Begin VB.Frame famOff 
      Caption         =   "Getting Off"
      Height          =   1335
      Left            =   3840
      TabIndex        =   17
      Top             =   240
      Width           =   3735
      Begin VB.CommandButton cmdRestart 
         Caption         =   "Restart"
         Height          =   735
         Left            =   1920
         TabIndex        =   10
         Top             =   360
         Width           =   1695
      End
      Begin VB.CommandButton cmdLog 
         Caption         =   "Log Off"
         Height          =   735
         Left            =   120
         TabIndex        =   9
         Top             =   360
         Width           =   1695
      End
   End
   Begin VB.Frame famGood 
      Caption         =   "Good"
      Height          =   2775
      Left            =   120
      TabIndex        =   16
      Top             =   1680
      Width           =   3735
      Begin VB.CommandButton cmdBlink 
         Caption         =   "&Flashing Screen"
         Height          =   735
         Left            =   1920
         TabIndex        =   8
         Top             =   1920
         Width           =   1695
      End
      Begin VB.CommandButton cmdBlack 
         Caption         =   "Black &Screen"
         Height          =   735
         Left            =   120
         TabIndex        =   7
         Top             =   1920
         Width           =   1695
      End
      Begin VB.CommandButton cmdcaddisable 
         Caption         =   "&Disable Ctrl-Alt-Del"
         Height          =   735
         Left            =   120
         TabIndex        =   3
         Top             =   240
         Width           =   1695
      End
      Begin VB.CommandButton cmdcadenable 
         Caption         =   "&Enable"
         Height          =   735
         Left            =   1920
         TabIndex        =   4
         Top             =   240
         Width           =   1695
      End
      Begin VB.CommandButton cmdMouse 
         Caption         =   "&Mouse"
         Height          =   735
         Left            =   120
         TabIndex        =   5
         Top             =   1080
         Width           =   1695
      End
      Begin VB.CommandButton cmdMEnable 
         Caption         =   "Ena&ble"
         Height          =   735
         Left            =   1920
         TabIndex        =   6
         Top             =   1080
         Width           =   1695
      End
   End
   Begin VB.CommandButton cmdblock 
      Caption         =   "&Block"
      Height          =   375
      Left            =   240
      TabIndex        =   1
      Top             =   480
      Width           =   3375
   End
   Begin VB.Frame famDisable 
      Caption         =   "Evil"
      Height          =   1455
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   3615
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'To Shut Down, Restart, Log-Off, ...
Private Declare Function ExitWindowsEx Lib "user32" (ByVal uFlags As Long, ByVal dwReserved As Long) As Boolean

Private Declare Function SystemParametersInfo Lib _
    "user32" Alias "SystemParametersInfoA" (ByVal uAction _
    As Long, ByVal uParam As Long, ByVal lpvParam As Any, _
    ByVal fuWinIni As Long) As Long
Dim abc As Boolean
Dim H As Long
Dim L As Long
Dim R As Long
Dim abc2 As Boolean
Sub DisableCtrlAltDelete(bDisabled As Boolean)
    ' Disables Control Alt Delete
    Dim X As Long
    X = SystemParametersInfo(97, bDisabled, CStr(1), 0)
End Sub
    'Log-Off
Private Sub cmd2_Click()
    ExitWindowsEx 2, 4
End Sub
    'About
Private Sub CmdAbout_Click()
    MsgBox "Made by BobTec., A simple but effective program to disable and even cripple a computer!", vbInformation, "Version 5.0"
End Sub
    'Flashing Screen
Private Sub cmdBlink_Click()
    frmBlink.Show
End Sub

Private Sub cmdblock_Click()
    'Block Form
    frmBlock.Show
End Sub
Private Sub cmdcaddisable_Click()
    'Tells Computer To Disable Ctrl-Alt-Del
    DisableCtrlAltDelete True
End Sub

Private Sub cmdcadenable_Click()
    'Tells Computer to Enable Ctrl-Alt-Del
    DisableCtrlAltDelete False
End Sub

Private Sub cmdForce_Click()
    'Forced Exit
    ExitWindowsEx 4, 0
End Sub

Private Sub cmdClose_Click()
    'Close the CD Tray
    'This Sub will also show the "CLOSE"
    'button instead of the "OPEN" button.
    SendMCIString "set cd door closed", True
    cmdClose.Name = cmdOpen
End Sub

Private Sub cmdConnect_Click()
    txtHost.Text = H
    txtRPort.Text = R
    txtLPort.Text = L
End Sub

Private Sub cmdKClosed_Click()
    Do
        'Floods With Closed So CD Tray Can't BE Opened
        SendMCIString "set cd door closed", True
    Loop
End Sub

Private Sub cmdKOpen_Click()
    'Floods With open, so CD Tray Can't Be Closed
    Do
        SendMCIString "set cd door open", True
    Loop
End Sub

Private Sub cmdLog_Click()
    'Forced Log-Off
    ExitWindowsEx 0, 4
End Sub

Private Sub cmdMEnable_Click()
    'Fix Cursor
    ShowCursor (bShow = False)
End Sub

Private Sub cmdMouse_Click()
    'Disable Mouse
    ShowCursor (bShow = True)
End Sub

' Open the CD Tray
Private Sub cmdopen_Click()
    If cmdOpen.Caption = "&Open CD Tray" Then
        SendMCIString "set cd door open", True
        cmdOpen.Caption = "&Close CD Tray"
    ElseIf cmdOpen.Caption = "&Close CD Tray" Then
        SendMCIString "set cd door closed", True
        cmdOpen.Caption = "&Open CD Tray"
    End If
End Sub
'Goto Restart and Block
Private Sub cmdRBlock_Click()
     frmRBlock.Show
     Me.Hide
End Sub
'Forced Restart
Private Sub cmdRestart_Click()
    ExitWindowsEx 2, 0
End Sub
'Keeps on opening and closing cd
Private Sub cmdTOpen_Click()
    Do
        SendMCIString "set cd door open", True
        SendMCIString "set cd door closed", True
    Loop
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

Private Sub Form_Unload(Cancel As Integer)
'Close all MCI devices opened by this program
    SendMCIString "close all", False
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

