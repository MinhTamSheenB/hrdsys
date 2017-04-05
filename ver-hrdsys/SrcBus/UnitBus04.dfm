object FormBus04: TFormBus04
  Left = -7
  Top = 41
  Width = 800
  Height = 516
  Caption = 'FormBus04'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = TntFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object TntPanel1: TTntPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 57
    Align = alTop
    Caption = 'bus04_titl'
    Color = clCream
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object TntGroupBox2: TTntGroupBox
    Left = 0
    Top = 57
    Width = 792
    Height = 48
    Align = alTop
    Caption = 'query_condition'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object TntLabel1: TTntLabel
      Left = 277
      Top = 22
      Width = 71
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'month'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lb_car_no: TTntLabel
      Left = 11
      Top = 21
      Width = 80
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'car_no'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object CobCarNoBegin: TTntComboBox
      Left = 97
      Top = 17
      Width = 88
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 0
      OnChange = CobCarNoEndChange
    end
    object bbtn_search: TTntBitBtn
      Left = 475
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
      TabOrder = 4
      OnClick = bbtn_searchClick
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
    object bbtn_reset: TTntBitBtn
      Left = 559
      Top = 13
      Width = 81
      Height = 25
      Caption = 'reset'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = bbtn_resetClick
      Kind = bkRetry
    end
    object CobCarNoEnd: TTntComboBox
      Left = 185
      Top = 17
      Width = 88
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 1
      OnChange = CobCarNoEndChange
    end
    object MeMonthBegin: TMaskEdit
      Left = 355
      Top = 17
      Width = 48
      Height = 21
      AutoSize = False
      EditMask = '9999/99;0;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 7
      ParentFont = False
      TabOrder = 2
      OnEnter = MeMonthBeginEnter
    end
    object MeMonthEnd: TMaskEdit
      Left = 407
      Top = 17
      Width = 50
      Height = 21
      AutoSize = False
      EditMask = '9999/99;0;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 7
      ParentFont = False
      TabOrder = 3
      OnEnter = MeMonthBeginEnter
    end
  end
  object TntGroupBox1: TTntGroupBox
    Left = 0
    Top = 256
    Width = 792
    Height = 226
    Align = alBottom
    Caption = 'detail_info'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object TntDBGrid2: TTntDBGrid
      Left = 2
      Top = 15
      Width = 788
      Height = 209
      Align = alClient
      DataSource = DataSource1
      FixedColor = clSkyBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clRed
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'car_no'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'out_date'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'driver_name'
          Title.Caption = 'driver'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 83
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dept_name'
          Title.Caption = 'use_dept'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 142
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'if_bing'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dest'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'KM'
          Title.Caption = 'km'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 32
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'over_cate'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 61
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'over_time'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 54
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'repair_pay'
          Title.Caption = 'repair_rate'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 59
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'road_pay'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 49
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'meal_pay'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 56
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'park_pay'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 62
          Visible = True
        end>
    end
  end
  object TntGroupBox3: TTntGroupBox
    Left = 0
    Top = 105
    Width = 792
    Height = 151
    Align = alClient
    Caption = 'tran_data'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object TntDBGrid1: TTntDBGrid
      Left = 2
      Top = 15
      Width = 788
      Height = 134
      Align = alClient
      DataSource = DataSource2
      FixedColor = clSkyBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clRed
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'car_no'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'amonth'
          Title.Caption = 'month'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'sal_pay'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 47
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'meal_pay'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 53
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'park_pay'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 57
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'road_pay'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 54
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'picc_pay'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 52
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'you_pay'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 49
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'define_pay'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 59
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'fix_pay'
          Title.Caption = 'repair_rate'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 43
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'depreciation'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 66
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tot_pay'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 44
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'liCheng'
          Title.Caption = 'mileage'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Visible = True
        end>
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery2
    Left = 133
    Top = 65535
  end
  object qry_pub: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'select * from hrd_car_out')
    Left = 25
    Top = 1
  end
  object CDSCarCost: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    AfterScroll = CDSCarCostAfterScroll
    Left = 176
    Data = {
      350200009619E0BD01000000180000000D000000000003000000350206636172
      5F6E6F0100490000000100055749445448020002000A0006616D6F6E74680100
      4900000001000557494454480200020006000773616C5F7061790C0005000000
      020008444543494D414C53020002000400055749445448020002001300086D65
      616C5F7061790C0005000000020008444543494D414C53020002000400055749
      445448020002001300087061726B5F7061790C0005000000020008444543494D
      414C5302000200040005574944544802000200130008726F61645F7061790C00
      05000000020008444543494D414C530200020004000557494454480200020013
      0008706963635F7061790C0005000000020008444543494D414C530200020004
      0005574944544802000200130007796F755F7061790C00050000000200084445
      43494D414C530200020004000557494454480200020013000A646566696E655F
      7061790C0005000000020008444543494D414C53020002000400055749445448
      020002001300076669785F7061790C0005000000020008444543494D414C5302
      00020004000557494454480200020013000C646570726563696174696F6E0C00
      05000000020008444543494D414C530200020004000557494454480200020013
      0007746F745F7061790C0005000000020008444543494D414C53020002000400
      055749445448020002001300076C694368656E670C0005000000020008444543
      494D414C530200020004000557494454480200020013000000}
    object CDSCarCostcar_no: TStringField
      FieldName = 'car_no'
      Size = 10
    end
    object CDSCarCostamonth: TStringField
      FieldName = 'amonth'
      Size = 6
    end
    object CDSCarCostsal_pay: TBCDField
      FieldName = 'sal_pay'
      Precision = 19
    end
    object CDSCarCostmeal_pay: TBCDField
      FieldName = 'meal_pay'
      Precision = 19
    end
    object CDSCarCostpark_pay: TBCDField
      FieldName = 'park_pay'
      Precision = 19
    end
    object CDSCarCostroad_pay: TBCDField
      FieldName = 'road_pay'
      Precision = 19
    end
    object CDSCarCostpicc_pay: TBCDField
      FieldName = 'picc_pay'
      Precision = 19
    end
    object CDSCarCostyou_pay: TBCDField
      FieldName = 'you_pay'
      Precision = 19
    end
    object CDSCarCostdefine_pay: TBCDField
      FieldName = 'define_pay'
      Precision = 19
    end
    object CDSCarCostfix_pay: TBCDField
      FieldName = 'fix_pay'
      Precision = 19
    end
    object CDSCarCostdepreciation: TBCDField
      FieldName = 'depreciation'
      Precision = 19
    end
    object CDSCarCosttot_pay: TBCDField
      FieldName = 'tot_pay'
      Precision = 19
    end
    object CDSCarCostliCheng: TBCDField
      FieldName = 'liCheng'
      Precision = 19
    end
  end
  object DataSource2: TDataSource
    DataSet = CDSCarCost
    Left = 208
  end
  object qry_temp: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select car_no,'
      'driver as amonth,'
      'road_pay as sal_pay,'
      'road_pay as meal_pay,'
      'road_pay as park_pay,'
      'road_pay as road_pay,'
      'road_pay as picc_pay,'
      'road_pay as you_pay,'
      'road_pay as define_pay,'
      'road_pay as fix_pay,'
      'road_pay as depreciation,'
      'road_pay as tot_pay,'
      'road_pay as liCheng '
      ' from hrd_car_out')
    Left = 316
  end
  object ADOQuery2: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    Left = 105
    Top = 1
    object StringField1: TStringField
      FieldName = 'upd_user'
      Size = 10
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'upd_date'
    end
    object StringField2: TStringField
      FieldName = 'car_no'
      Size = 10
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'out_date'
    end
    object StringField3: TStringField
      FieldName = 'use_dept'
      Size = 6
    end
    object StringField4: TStringField
      FieldName = 'if_bing'
      OnGetText = StringField4GetText
      Size = 1
    end
    object StringField5: TStringField
      FieldName = 'dest'
    end
    object IntegerField1: TIntegerField
      FieldName = 'KM'
    end
    object StringField6: TStringField
      FieldName = 'over_cate'
      OnGetText = StringField6GetText
      Size = 1
    end
    object IntegerField2: TIntegerField
      FieldName = 'over_time'
    end
    object BCDField1: TBCDField
      FieldName = 'repair_pay'
      Precision = 19
    end
    object BCDField2: TBCDField
      FieldName = 'road_pay'
      Precision = 19
    end
    object BCDField3: TBCDField
      FieldName = 'meal_pay'
      Precision = 19
    end
    object BCDField4: TBCDField
      FieldName = 'park_pay'
      Precision = 19
    end
    object TntWideStringField1: TTntWideStringField
      FieldKind = fkLookup
      FieldName = 'driver_name'
      LookupDataSet = qry_driver
      LookupKeyFields = 'driver'
      LookupResultField = 'driver_name'
      KeyFields = 'driver'
      Lookup = True
    end
    object StringField7: TStringField
      FieldName = 'driver'
      Size = 6
    end
    object TntWideStringField2: TTntWideStringField
      FieldKind = fkLookup
      FieldName = 'dept_name'
      LookupDataSet = ADOQuery3
      LookupKeyFields = 'dept_code'
      LookupResultField = 'dept_name'
      KeyFields = 'use_dept'
      Lookup = True
    end
  end
  object qry_driver: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select driver,driver+'#39' '#39'+name_chs as driver_name  from hrd_car_d' +
        'river')
    Left = 16
    Top = 32
  end
  object ADOQuery3: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select dept_code,dept_code+'#39' '#39'+abbr_titl as dept_name  from hrd_' +
        'dept ')
    Left = 48
    Top = 32
  end
end
