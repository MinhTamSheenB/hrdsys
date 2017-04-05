object FormDut26: TFormDut26
  Left = 50
  Top = 110
  Width = 700
  Height = 400
  Caption = 'FormDut26'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 85
    Width = 692
    Height = 240
    Align = alClient
    TabOrder = 0
    object TntDBGrid1: TTntDBGrid
      Left = 1
      Top = 1
      Width = 690
      Height = 238
      Align = alClient
      DataSource = DataSource1
      FixedColor = clSkyBlue
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'dept_code'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dept_name'
          Width = 195
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'spc_dut_cnt'
          Visible = True
        end>
    end
  end
  object PanelTitle: TTntPanel
    Left = 0
    Top = 0
    Width = 692
    Height = 36
    Align = alTop
    BevelOuter = bvNone
    Caption = 'dut26_titl'
    Color = clCream
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 36
    Width = 692
    Height = 49
    Align = alTop
    TabOrder = 2
    object TntLabel1: TTntLabel
      Left = 17
      Top = 21
      Width = 32
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #37096#38272
    end
    object TntLabel2: TTntLabel
      Left = 371
      Top = 20
      Width = 32
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #26085#26399
    end
    object DTPicker: TDateTimePicker
      Left = 405
      Top = 16
      Width = 105
      Height = 21
      Date = 38877.000000000000000000
      Time = 38877.000000000000000000
      TabOrder = 0
    end
    object CobDeptBegin: TTntComboBox
      Left = 56
      Top = 16
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 1
    end
    object Btn_Search: TTntBitBtn
      Left = 521
      Top = 13
      Width = 81
      Height = 25
      Caption = 'find'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = Btn_SearchClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555555555555555555555555555555555555555FF55555555555559055555
        55555555577FF5555555555599905555555555557777F5555555555599905555
        555555557777FF5555555559999905555555555777777F555555559999990555
        5555557777777FF5555557990599905555555777757777F55555790555599055
        55557775555777FF5555555555599905555555555557777F5555555555559905
        555555555555777FF5555555555559905555555555555777FF55555555555579
        05555555555555777FF5555555555557905555555555555777FF555555555555
        5990555555555555577755555555555555555555555555555555}
      NumGlyphs = 2
    end
    object BtnPrint: TTntBitBtn
      Left = 614
      Top = 13
      Width = 75
      Height = 25
      Caption = 'print'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = BtnPrintClick
    end
    object CobDeptEnd: TTntComboBox
      Left = 208
      Top = 16
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 4
    end
  end
  object TntPanel1: TTntPanel
    Left = 0
    Top = 325
    Width = 692
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object TntLabel3: TTntLabel
      Left = 40
      Top = 16
      Width = 56
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #21512#35336#20154#25976
    end
    object EditTotal: TTntEdit
      Left = 102
      Top = 13
      Width = 121
      Height = 21
      TabOrder = 0
    end
  end
  object ADOQuery1: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterOpen = ADOQuery1AfterOpen
    BeforeClose = ADOQuery1BeforeClose
    OnCalcFields = ADOQuery1CalcFields
    Parameters = <>
    SQL.Strings = (
      'select * from tmp_spc_dut')
    Left = 40
    Top = 8
    object ADOQuery1dept_code: TStringField
      FieldName = 'dept_code'
      Size = 6
    end
    object ADOQuery1dept_name: TTntWideStringField
      FieldKind = fkCalculated
      FieldName = 'dept_name'
      Calculated = True
    end
    object ADOQuery1spc_dut_cnt: TIntegerField
      FieldName = 'spc_dut_cnt'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 72
    Top = 8
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = ADOQuery1
    Left = 107
    Top = 8
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 144
    Top = 8
    object ClientDataSet1dept_code: TStringField
      FieldName = 'dept_code'
      Size = 6
    end
    object ClientDataSet1spc_dut_cnt: TIntegerField
      FieldName = 'spc_dut_cnt'
      ReadOnly = True
    end
  end
end
