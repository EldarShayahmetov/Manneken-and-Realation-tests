object FTest: TFTest
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = 'Test'
  ClientHeight = 600
  ClientWidth = 748
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object PTop: TPanel
    Left = 0
    Top = 0
    Width = 748
    Height = 67
    Align = alTop
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1086#1090#1074#1077#1090':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object PBottom: TPanel
    Left = 0
    Top = 510
    Width = 748
    Height = 90
    Align = alBottom
    TabOrder = 1
    object LOk: TLabel
      Left = 368
      Top = 6
      Width = 28
      Height = 19
      Caption = 'LOk'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSilver
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 144
      Top = 62
      Width = 447
      Height = 14
      Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1086#1090#1074#1090#1077' - "'#1084#1099#1096#1100'", '#1082#1083#1072#1074#1080#1096#1080' <1,2>, '#1072#1074#1072#1088#1080#1081#1085#1099#1081' '#1074#1099#1093#1086#1076' - <ESC>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSilver
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 304
      Top = 62
      Width = 147
      Height = 14
      Caption = #1042#1088#1077#1084#1077#1085#1080' '#1086#1089#1090#1072#1083#1086#1089#1100': 300'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSilver
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object BBExit: TBitBtn
      Left = 344
      Top = 31
      Width = 75
      Height = 25
      Caption = '&0 '#1042#1099#1093#1086#1076
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
        F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
        000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
        338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
        45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
        3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
        F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
        000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
        338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
        4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
        8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
        333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
        0000}
      NumGlyphs = 2
      TabOrder = 0
      OnClick = BBExitClick
    end
  end
  object PQuestion: TPanel
    Left = 0
    Top = 67
    Width = 748
    Height = 422
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object LNo: TLabel
      Left = 232
      Top = 88
      Width = 32
      Height = 23
      Caption = 'LNo'
    end
    object LQuest: TLabel
      Left = 633
      Top = 297
      Width = 57
      Height = 23
      Caption = 'LQuest'
      Visible = False
    end
    object LAnsw: TLabel
      Left = 1
      Top = 398
      Width = 746
      Height = 23
      Align = alBottom
      Caption = 'LAnsw'
      ExplicitTop = 392
      ExplicitWidth = 53
    end
    object Image1: TImage
      Left = 1
      Top = 1
      Width = 746
      Height = 397
      Align = alClient
      Center = True
      ExplicitTop = -4
      ExplicitHeight = 420
    end
  end
  object PAnswer: TPanel
    Left = 0
    Top = 489
    Width = 748
    Height = 21
    Align = alClient
    TabOrder = 3
    ExplicitHeight = 74
    object RGYesNo: TRadioGroup
      Left = 278
      Top = 4
      Width = 209
      Height = 53
      Caption = #1042#1072#1096' '#1086#1090#1074#1077#1090
      Columns = 2
      Items.Strings = (
        #1074' '#1083#1077#1074#1086#1081' '#1088#1091#1082#1077
        #1074' '#1087#1088#1072#1074#1086#1081' '#1088#1091#1082#1077)
      TabOrder = 0
      OnClick = RGYesNoClick
    end
  end
  object TPausa: TTimer
    OnTimer = TPausaTimer
    Left = 40
    Top = 16
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 600
    Top = 16
  end
end
