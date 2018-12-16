object Form2: TForm2
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = #1047#1074#1086#1085#1086#1082
  ClientHeight = 161
  ClientWidth = 184
  Color = clBtnFace
  Constraints.MaxHeight = 200
  Constraints.MaxWidth = 200
  Constraints.MinHeight = 200
  Constraints.MinWidth = 200
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 56
    Top = 8
    Width = 62
    Height = 16
    Caption = #1041#1091#1076#1080#1083#1100#1085#1080#1082
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 56
    Top = 30
    Width = 4
    Height = 16
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 56
    Top = 48
    Width = 4
    Height = 16
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 56
    Top = 64
    Width = 77
    Height = 16
    Caption = #1054#1090#1083#1086#1078#1080#1090#1100' '#1085#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object MediaPlayer1: TMediaPlayer
    Left = -21
    Top = 28
    Width = 253
    Height = 30
    DoubleBuffered = True
    Visible = False
    ParentDoubleBuffered = False
    TabOrder = 0
  end
  object ComboBox1: TComboBox
    Left = 31
    Top = 86
    Width = 145
    Height = 21
    TabOrder = 1
    Text = '5'
    Items.Strings = (
      '5'
      '10'
      '15'
      '30'
      '60')
  end
  object Button1: TButton
    Left = 1
    Top = 110
    Width = 88
    Height = 51
    Caption = #1054#1090#1083#1086#1078#1080#1090#1100
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 88
    Top = 110
    Width = 88
    Height = 51
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 3
    OnClick = Button2Click
  end
end
