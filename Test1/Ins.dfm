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
        #1048#1085#1089#1090#1091#1082#1094#1080#1103': '#1074#1072#1084' '#1087#1088#1077#1076#1083#1072#1075#1072#1077#1090#1089#1103' '#1088#1103#1076' '#1091#1090#1074#1077#1088#1078#1076#1077#1085#1080#1081'. '
        
          #1055#1086#1089#1083#1077#1076#1086#1074#1072#1090#1077#1083#1100#1085#1086' '#1087#1088#1086#1095#1080#1090#1072#1081#1090#1077' '#1080#1093' '#1080' '#1074#1099#1088#1072#1079#1080#1090#1077' '#1089#1074#1086#1077' '#1086#1090#1085#1086#1096#1077#1085#1080#1077' '#1082' '#1082#1072#1078#1076#1086#1084 +
          #1091' '#1087#1091#1085#1082#1090#1091', '
        #1080#1089#1087#1086#1083#1100#1079#1091#1103' '#1096#1077#1089#1090#1080#1073#1072#1083#1100#1085#1091#1102' '#1096#1082#1072#1083#1091' '#1086#1090' '#8211'3 ('#171#1087#1086#1083#1085#1086#1089#1090#1100#1102' '#1085#1077' '#1089#1086#1075#1083#1072#1089#1077#1085#187')'
        ' '#1076#1086' +3 ('#171#1087#1086#1083#1085#1086#1089#1090#1100#1102' '#1089#1086#1075#1083#1072#1089#1077#1085#187').')
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      Zoom = 100
      ExplicitLeft = 2
      ExplicitTop = -4
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
