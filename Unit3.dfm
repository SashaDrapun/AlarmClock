object Form3: TForm3
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = #1059#1084#1085#1099#1081' '#1079#1074#1086#1085#1086#1082
  ClientHeight = 261
  ClientWidth = 284
  Color = clBtnFace
  Constraints.MaxHeight = 300
  Constraints.MaxWidth = 300
  Constraints.MinHeight = 300
  Constraints.MinWidth = 300
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 104
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
    Left = 104
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
  object Label4: TLabel
    Left = 97
    Top = 212
    Width = 85
    Height = 16
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1086#1090#1074#1077#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Image1: TImage
    Left = 23
    Top = 101
    Width = 253
    Height = 105
    Stretch = True
  end
  object Label3: TLabel
    Left = 97
    Top = 52
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
    Left = 23
    Top = -6
    Width = 253
    Height = 30
    DoubleBuffered = True
    Visible = False
    ParentDoubleBuffered = False
    TabOrder = 0
  end
  object ComboBox1: TComboBox
    Left = 72
    Top = 74
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
    Left = 0
    Top = 208
    Width = 81
    Height = 55
    Caption = #1054#1090#1083#1086#1078#1080#1090#1100
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 216
    Top = 208
    Width = 70
    Height = 56
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 3
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 87
    Top = 232
    Width = 123
    Height = 21
    TabOrder = 4
  end
end
