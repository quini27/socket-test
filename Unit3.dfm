object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Teste de socket client'
  ClientHeight = 497
  ClientWidth = 634
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 176
    Width = 275
    Height = 19
    Caption = 'Estado da conex'#227'o: desconectado'
    Color = clRed
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Titulo: TLabel
    Left = 208
    Top = 24
    Width = 215
    Height = 26
    Caption = 'Teste de socket client'
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -24
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 32
    Top = 80
    Width = 207
    Height = 13
    Caption = 'Conex'#227'o de TCP/IP ao servidor Nodemcu   '
  end
  object Label3: TLabel
    Left = 32
    Top = 293
    Width = 87
    Height = 16
    Caption = 'Texto a enviar:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Memo1: TMemo
    Left = 0
    Top = 368
    Width = 633
    Height = 137
    Lines.Strings = (
      '')
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
    OnChange = Memo1Change
  end
  object LedOnButton: TButton
    Left = 32
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Led On'
    Enabled = False
    TabOrder = 1
    OnClick = LedOnButtonClick
  end
  object LedOffButton: TButton
    Left = 104
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Led Off'
    Enabled = False
    TabOrder = 2
    OnClick = LedOffButtonClick
  end
  object ConectorButton: TButton
    Left = 32
    Top = 121
    Width = 75
    Height = 25
    Caption = 'Conectar'
    Enabled = False
    TabOrder = 3
    OnClick = ConectorButtonClick
  end
  object Edit1: TEdit
    Left = 32
    Top = 319
    Width = 332
    Height = 21
    TabOrder = 4
  end
  object SendStrButt: TButton
    Left = 370
    Top = 317
    Width = 89
    Height = 25
    Caption = 'Send string =>'
    Enabled = False
    TabOrder = 5
    OnClick = SendStrButtClick
  end
  object StartBtn: TButton
    Left = 496
    Top = 239
    Width = 115
    Height = 56
    Caption = 'Start client'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = StartBtnClick
  end
  object StopButton: TButton
    Left = 496
    Top = 293
    Width = 115
    Height = 49
    Caption = 'Stop client'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = StopButtonClick
  end
  object ClientSocket1: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Host = '192.168.0.200'
    Port = 80
    OnConnect = ClientSocket1Connect
    OnDisconnect = ClientSocket1Disconnect
    OnRead = ClientSocket1Read
    OnWrite = ClientSocket1Write
    OnError = ClientSocket1Error
    Left = 552
    Top = 16
  end
  object Timer1: TTimer
    Interval = 10000
    OnTimer = Timer1Timer
    Left = 536
    Top = 88
  end
end
