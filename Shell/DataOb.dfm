object DM1: TDM1
  OldCreateOrder = False
  Height = 398
  Width = 770
  object ADOCPDT: TADOConnection
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 296
    Top = 32
  end
  object ADOQTesting: TADOQuery
    Connection = ADOCPDT
    CursorType = ctStatic
    AfterScroll = ADOQTestingAfterScroll
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM Testing')
    Left = 96
    Top = 96
  end
  object ADOQRespondent: TADOQuery
    Connection = ADOCPDT
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM Respondent')
    Left = 664
    Top = 160
  end
  object ADOQTest: TADOQuery
    Connection = ADOCPDT
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM Test')
    Left = 240
    Top = 96
  end
  object ADOQResult: TADOQuery
    Connection = ADOCPDT
    CursorType = ctStatic
    OnCalcFields = ADOQResultCalcFields
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM Result')
    Left = 304
    Top = 96
    object ADOQResultID_Result: TAutoIncField
      FieldName = 'ID_Result'
      ReadOnly = True
    end
    object ADOQResultID_Testing: TIntegerField
      FieldName = 'ID_Testing'
    end
    object ADOQResultID_ParamResult: TIntegerField
      FieldName = 'ID_ParamResult'
    end
    object ADOQResultName_ParamResult: TStringField
      FieldKind = fkCalculated
      FieldName = 'Name_ParamResult'
      Calculated = True
    end
    object ADOQResultValue_Result: TWideStringField
      FieldName = 'Value_Result'
      Size = 255
    end
  end
  object ADOQParamResult: TADOQuery
    Connection = ADOCPDT
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM ParamResult')
    Left = 384
    Top = 96
  end
  object ADOQQuestion: TADOQuery
    Connection = ADOCPDT
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM Question')
    Left = 456
    Top = 96
  end
  object ADOQAnswer: TADOQuery
    Connection = ADOCPDT
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM Answer')
    Left = 528
    Top = 96
  end
  object ADOQProtocol: TADOQuery
    Connection = ADOCPDT
    CursorType = ctStatic
    OnCalcFields = ADOQProtocolCalcFields
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM Protocol')
    Left = 600
    Top = 96
    object ADOQProtocolID_Protocol: TAutoIncField
      FieldName = 'ID_Protocol'
      ReadOnly = True
    end
    object ADOQProtocolID_Testing: TIntegerField
      FieldName = 'ID_Testing'
    end
    object ADOQProtocolNum_Question: TIntegerField
      FieldName = 'Num_Question'
    end
    object ADOQProtocolNum_Answer: TIntegerField
      FieldName = 'Num_Answer'
    end
    object ADOQProtocolTimeAnswer: TDateTimeField
      FieldName = 'TimeAnswer'
      DisplayFormat = 'hh:nn:ss'
    end
    object ADOQProtocolQuestion: TStringField
      FieldKind = fkCalculated
      FieldName = 'Question'
      Size = 150
      Calculated = True
    end
    object ADOQProtocolAnswer: TStringField
      FieldKind = fkCalculated
      FieldName = 'Answer'
      Size = 50
      Calculated = True
    end
  end
  object ADOQPassword: TADOQuery
    Connection = ADOCPDT
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM Code')
    Left = 680
    Top = 96
  end
  object ADOQTesting2: TADOQuery
    Connection = ADOCPDT
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM Testing2')
    Left = 168
    Top = 96
  end
  object DSRespondent: TDataSource
    DataSet = ADOQRespondent
    Left = 216
    Top = 168
  end
  object DSTesting: TDataSource
    AutoEdit = False
    DataSet = ADOQTesting
    Left = 320
    Top = 176
  end
  object DSResult: TDataSource
    DataSet = ADOQResult
    Left = 424
    Top = 176
  end
  object DSProtocol: TDataSource
    DataSet = ADOQProtocol
    Left = 504
    Top = 168
  end
  object frxReport1: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42858.908361481500000000
    ReportOptions.LastChange = 42859.046014571760000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 360
    Top = 264
    Datasets = <
      item
        DataSet = frxDBDatasetP
        DataSetName = 'frxDBDataset2'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          Left = 253.228510000000000000
          Width = 204.094620000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #1055#1088#1086#1090#1086#1082#1086#1083' '#1090#1077#1089#1090#1080#1088#1086#1074#1072#1085#1080#1103)
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 34.015770000000000000
        Top = 453.543600000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 453.543600000000000000
          Top = 7.559060000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[Page#]')
        end
        object Memo15: TfrxMemoView
          Left = 211.653680000000000000
          Top = 7.559060000000000000
          Width = 241.889920000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #1055#1088#1086#1090#1086#1082#1086#1083' '#1090#1077#1089#1090#1080#1088#1086#1074#1072#1085#1080#1103)
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 154.960730000000000000
        Top = 64.252010000000000000
        Width = 718.110700000000000000
        object Memo3: TfrxMemoView
          Left = 162.519790000000000000
          Top = 22.677180000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Memo.UTF8W = (
            #1056#1077#1089#1087#1086#1085#1076#1077#1085#1090':')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 211.653680000000000000
          Top = 56.692950000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Memo.UTF8W = (
            #1040#1055#1044#1052':')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 90.708720000000000000
          Top = 90.708720000000000000
          Width = 181.417440000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Memo.UTF8W = (
            #1044#1072#1090#1072' '#1090#1077#1089#1090#1080#1088#1086#1074#1072#1085#1080#1103':')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 75.590600000000000000
          Top = 124.724490000000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Memo.UTF8W = (
            #1042#1088#1077#1084#1103' '#1090#1077#1089#1090#1080#1088#1086#1074#1072#1085#1080#1103':')
          ParentFont = False
        end
        object MemoResp: TfrxMemoView
          Left = 287.244280000000000000
          Top = 22.677180000000000000
          Width = 427.086890000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #1056#1077#1089#1087#1086#1085#1076#1077#1085#1090':')
          ParentFont = False
        end
        object MemoAPDM: TfrxMemoView
          Left = 287.244280000000000000
          Top = 56.692950000000000000
          Width = 427.086890000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #1040#1055#1044#1052':')
          ParentFont = False
        end
        object MemoDate: TfrxMemoView
          Left = 287.244280000000000000
          Top = 90.708720000000000000
          Width = 427.086890000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #1044#1072#1090#1072' '#1090#1077#1089#1090#1080#1088#1086#1074#1072#1085#1080#1103':')
          ParentFont = False
        end
        object MemoTime: TfrxMemoView
          Left = 287.244280000000000000
          Top = 124.724490000000000000
          Width = 427.086890000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #1042#1088#1077#1084#1103' '#1090#1077#1089#1090#1080#1088#1086#1074#1072#1085#1080#1103':')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        Height = 56.692950000000000000
        Top = 279.685220000000000000
        Width = 718.110700000000000000
        object Memo7: TfrxMemoView
          Top = 26.456710000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            #1053#1086#1084#1077#1088' '#1074#1086#1087#1088#1086#1089#1072)
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 128.504020000000000000
          Top = 26.456710000000000000
          Width = 325.039580000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #1042#1086#1087#1088#1086#1089)
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 453.543600000000000000
          Top = 26.456710000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #1054#1090#1074#1077#1090)
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 578.268090000000000000
          Top = 26.456710000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #1042#1088#1077#1084#1103)
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 34.015770000000000000
        Top = 359.055350000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDatasetP
        DataSetName = 'frxDBDataset2'
        RowCount = 0
        object Memo11: TfrxMemoView
          Top = 11.338590000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          DataField = 'Num_Question'
          DataSet = frxDBDatasetP
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset2."Num_Question"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 128.504020000000000000
          Top = 11.338590000000000000
          Width = 325.039580000000000000
          Height = 18.897650000000000000
          DataField = 'Question'
          DataSet = frxDBDatasetP
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset2."Question"]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 453.543600000000000000
          Top = 11.338590000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          DataField = 'Answer'
          DataSet = frxDBDatasetP
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset2."Answer"]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 578.268090000000000000
          Top = 11.338590000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          DataField = 'TimeAnswer'
          DataSet = frxDBDatasetP
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset2."TimeAnswer"]')
          ParentFont = False
        end
      end
    end
  end
  object frxDBDatasetR: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = ADOQResult
    BCDToCurrency = False
    Left = 264
    Top = 328
  end
  object frxDBDatasetP: TfrxDBDataset
    UserName = 'frxDBDataset2'
    CloseDataSource = False
    DataSet = ADOQProtocol
    BCDToCurrency = False
    Left = 448
    Top = 328
  end
  object ADOQTemp: TADOQuery
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=.\PDT.mdb;Persist S' +
      'ecurity Info=False'
    Parameters = <>
    Left = 216
    Top = 248
  end
end
