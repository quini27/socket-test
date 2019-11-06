object FormAddress: TFormAddress
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'endere'#231'o de IP'
  ClientHeight = 187
  ClientWidth = 505
  Color = clGradientActiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 56
    Width = 228
    Height = 16
    Caption = 'Introduza o endere'#231'o de IP do servidor:'
    Color = clCaptionText
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 288
    Top = 55
    Width = 161
    Height = 21
    TabOrder = 0
  end
  object OKBtn: TButton
    Left = 224
    Top = 136
    Width = 75
    Height = 25
    Caption = 'OK'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = OKBtnClick
  end
end
