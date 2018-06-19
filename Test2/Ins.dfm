object Instruction: TInstruction
  Left = 0
  Top = 0
  Caption = 'Instruction'
  ClientHeight = 470
  ClientWidth = 577
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnActivate = FormActivate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object PTop: TPanel
    Left = 0
    Top = 0
    Width = 577
    Height = 57
    Align = alTop
    Caption = #1048#1085#1089#1090#1088#1091#1082#1094#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 57
    Width = 577
    Height = 362
    Align = alClient
    TabOrder = 1
    object REIns: TRichEdit
      Left = 1
      Top = 1
      Width = 575
      Height = 360
      Align = alClient
      BorderStyle = bsNone
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Lines.Strings = (
        #1048#1085#1089#1090#1091#1082#1094#1080#1103': '#1042#1072#1084' '#1087#1088#1077#1076#1083#1072#1075#1072#1077#1090#1089#1103' '#1088#1103#1076' '#1082#1072#1088#1090#1080#1085#1086#1082' '#1089' '#1084#1072#1085#1077#1082#1077#1085#1086#1084', '#1086#1087#1088#1077#1076#1077#1083#1080#1090#1077
        #1074' '#1082#1072#1082#1086#1081' '#1088#1091#1082#1077' '#1085#1072#1093#1086#1076#1080#1090#1089#1103' '#1086#1073#1098#1077#1082#1090' '#1087#1086' '#1094#1074#1077#1090#1091' '#1089#1086#1074#1087#1072#1076#1072#1102#1097#1080#1081' '#1089' '#1094#1074#1077#1090#1086#1084
        #1087#1086#1089#1090#1072#1084#1077#1085#1090#1072'. '#1048#1079#1084#1077#1088#1103#1077#1090#1089#1103' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1087#1088#1072#1074#1080#1083#1100#1085#1099#1093' '#1086#1090#1074#1077#1090#1086#1074' '#1080' '#1074#1088#1077#1084#1103'.')
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      Zoom = 100
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 419
    Width = 577
    Height = 51
    Align = alBottom
    TabOrder = 2
    object BBExit: TBitBtn
      Left = 248
      Top = 16
      Width = 75
      Height = 25
      Caption = '&0 '#1042#1099#1093#1086#1076
      Kind = bkClose
      NumGlyphs = 2
      TabOrder = 0
    end
  end
end
