object FormBus03: TFormBus03
  Left = -3
  Top = 58
  Width = 800
  Height = 501
  Caption = 'FormBus03'
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
    Caption = 'bus03_titl'
    Color = clCream
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object TntGroupBox9: TTntGroupBox
    Left = 0
    Top = 57
    Width = 792
    Height = 43
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
      Left = 456
      Top = 16
      Width = 73
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
    object TntLabel2: TTntLabel
      Left = 20
      Top = 18
      Width = 83
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'dept_range'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object CobDeptBegin: TTntComboBox
      Left = 107
      Top = 14
      Width = 171
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 0
      OnChange = CobDeptEndChange
    end
    object bbtn_search: TTntBitBtn
      Left = 648
      Top = 11
      Width = 65
      Height = 25
      Caption = 'find'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
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
      Left = 716
      Top = 11
      Width = 65
      Height = 25
      Caption = 'reset'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = bbtn_resetClick
      Kind = bkRetry
    end
    object CobDeptEnd: TTntComboBox
      Left = 279
      Top = 14
      Width = 171
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 3
      OnChange = CobDeptEndChange
    end
    object MeMonthBegin: TMaskEdit
      Left = 531
      Top = 13
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
      TabOrder = 4
      OnChange = MeMonthBeginChange
      OnEnter = MeMonthBeginEnter
    end
    object MeMonthEnd: TMaskEdit
      Left = 580
      Top = 13
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
      TabOrder = 5
      OnEnter = MeMonthBeginEnter
    end
  end
  object PanelAct: TTntPanel
    Left = 0
    Top = 431
    Width = 792
    Height = 36
    Align = alBottom
    TabOrder = 2
    object sb_Save: TTntSpeedButton
      Left = 355
      Top = 6
      Width = 102
      Height = 25
      Caption = 'transferfiles'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
        00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
        00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
        00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
        0003737FFFFFFFFF7F7330099999999900333777777777777733}
      NumGlyphs = 2
      OnClick = sb_SaveClick
    end
  end
  object TntGroupBox1: TTntGroupBox
    Left = 0
    Top = 100
    Width = 792
    Height = 128
    Align = alTop
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
      Height = 111
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
      OnEnter = TntDBGrid1Enter
      Columns = <
        item
          Expanded = False
          FieldName = 'dept_name'
          Title.Caption = 'use_dept'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 95
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'month'
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
          FieldName = 'park_pay'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 55
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
          Width = 62
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
          Width = 48
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
          Width = 52
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
          Width = 63
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
          Width = 45
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
          Width = 56
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
          Width = 48
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
          Width = 49
          Visible = True
        end>
    end
  end
  object TntGroupBox2: TTntGroupBox
    Left = 0
    Top = 228
    Width = 792
    Height = 203
    Align = alClient
    Caption = 'detail_info'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    object TntDBGrid2: TTntDBGrid
      Left = 2
      Top = 15
      Width = 788
      Height = 186
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
          Width = 83
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
          Width = 51
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
          Width = 70
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
          Width = 37
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
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 45
    Top = 65535
  end
  object ADOQuery1: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    BeforePost = ADOQuery1BeforePost
    AfterScroll = ADOQuery1AfterScroll
    Parameters = <>
    SQL.Strings = (
      'select * from hrd_car_dept')
    Left = 9
    Top = 1
    object ADOQuery1upd_user: TStringField
      FieldName = 'upd_user'
      Size = 10
    end
    object ADOQuery1upd_date: TDateTimeField
      FieldName = 'upd_date'
    end
    object ADOQuery1use_dept: TStringField
      FieldName = 'use_dept'
      FixedChar = True
      Size = 6
    end
    object ADOQuery1month: TStringField
      FieldName = 'month'
      Size = 6
    end
    object ADOQuery1sal_pay: TBCDField
      FieldName = 'sal_pay'
      Precision = 19
    end
    object ADOQuery1park_pay: TBCDField
      FieldName = 'park_pay'
      Precision = 19
    end
    object ADOQuery1define_pay: TBCDField
      FieldName = 'define_pay'
      Precision = 19
    end
    object ADOQuery1road_pay: TBCDField
      FieldName = 'road_pay'
      Precision = 19
    end
    object ADOQuery1meal_pay: TBCDField
      FieldName = 'meal_pay'
      Precision = 19
    end
    object ADOQuery1depreciation: TBCDField
      FieldName = 'depreciation'
      Precision = 19
    end
    object ADOQuery1you_pay: TBCDField
      FieldName = 'you_pay'
      Precision = 19
    end
    object ADOQuery1repair_pay: TBCDField
      FieldName = 'repair_pay'
      Precision = 19
    end
    object ADOQuery1picc_pay: TBCDField
      FieldName = 'picc_pay'
      Precision = 19
    end
    object ADOQuery1tot_pay: TBCDField
      FieldName = 'tot_pay'
      Precision = 19
    end
    object ADOQuery1dept_name: TTntWideStringField
      FieldKind = fkLookup
      FieldName = 'dept_name'
      LookupDataSet = ADOQuery3
      LookupKeyFields = 'dept_code'
      LookupResultField = 'dept_titl'
      KeyFields = 'use_dept'
      Lookup = True
    end
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery2
    Left = 216
  end
  object ADOQuery2: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'select * from hrd_car_out')
    Left = 184
    object ADOQuery2upd_user: TStringField
      FieldName = 'upd_user'
      Size = 10
    end
    object ADOQuery2upd_date: TDateTimeField
      FieldName = 'upd_date'
    end
    object ADOQuery2car_no: TStringField
      FieldName = 'car_no'
      Size = 10
    end
    object ADOQuery2out_date: TDateTimeField
      FieldName = 'out_date'
    end
    object ADOQuery2driver: TStringField
      FieldName = 'driver'
      Size = 6
    end
    object ADOQuery2use_dept: TStringField
      FieldName = 'use_dept'
      Size = 6
    end
    object ADOQuery2if_bing: TStringField
      FieldName = 'if_bing'
      OnGetText = ADOQuery2if_bingGetText
      Size = 1
    end
    object ADOQuery2dest: TStringField
      FieldName = 'dest'
    end
    object ADOQuery2KM: TIntegerField
      FieldName = 'KM'
    end
    object ADOQuery2over_cate: TStringField
      FieldName = 'over_cate'
      OnGetText = ADOQuery2over_cateGetText
      Size = 1
    end
    object ADOQuery2over_time: TIntegerField
      FieldName = 'over_time'
    end
    object ADOQuery2repair_pay: TBCDField
      FieldName = 'repair_pay'
      Precision = 19
    end
    object ADOQuery2road_pay: TBCDField
      FieldName = 'road_pay'
      Precision = 19
    end
    object ADOQuery2meal_pay: TBCDField
      FieldName = 'meal_pay'
      Precision = 19
    end
    object ADOQuery2park_pay: TBCDField
      FieldName = 'park_pay'
      Precision = 19
    end
    object ADOQuery2driver_name: TTntWideStringField
      FieldKind = fkLookup
      FieldName = 'driver_name'
      LookupDataSet = qry_driver
      LookupKeyFields = 'driver'
      LookupResultField = 'COLUMN1'
      KeyFields = 'driver'
      Lookup = True
    end
    object ADOQuery2dept_name: TTntWideStringField
      FieldKind = fkLookup
      FieldName = 'dept_name'
      LookupDataSet = ADOQuery3
      LookupKeyFields = 'dept_code'
      LookupResultField = 'dept_titl'
      KeyFields = 'use_dept'
      Lookup = True
    end
  end
  object qry_driver: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select driver,driver+'#39' '#39'+name_chs from hrd_car_driver')
    Left = 16
    Top = 32
  end
  object ADOQuery3: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select dept_code,dept_code+'#39' '#39'+abbr_titl as dept_titl from hrd_d' +
        'ept ')
    Left = 48
    Top = 32
  end
  object qry_pub: TADOQuery
    Connection = DMHrdsys.conn
    Parameters = <>
    SQL.Strings = (
      'select car_no from hrd_car_no')
    Left = 356
  end
  object CDSCarCost: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 400
    Data = {
      860100009619E0BD010000001800000009000000000003000000860106636172
      5F6E6F0100490000000100055749445448020002000A0006616D6F6E74680100
      4900000001000557494454480200020006000773616C5F7061790C0005000000
      020008444543494D414C53020002000400055749445448020002001300087069
      63635F7061790C0005000000020008444543494D414C53020002000400055749
      44544802000200130007796F755F7061790C0005000000020008444543494D41
      4C530200020004000557494454480200020013000A646566696E655F7061790C
      0005000000020008444543494D414C5302000200040005574944544802000200
      1300076669785F7061790C0005000000020008444543494D414C530200020004
      000557494454480200020013000C646570726563696174696F6E0C0005000000
      020008444543494D414C53020002000400055749445448020002001300076C69
      4368656E670C0005000000020008444543494D414C5302000200040005574944
      54480200020013000000}
  end
  object qry_temp: TADOQuery
    Connection = DMHrdsys.conn
    Parameters = <>
    SQL.Strings = (
      'select car_no,'
      'driver as amonth,'
      'road_pay as sal_pay,'
      'road_pay as picc_pay,'
      'road_pay as you_pay,'
      'road_pay as define_pay,'
      'road_pay as fix_pay,'
      'road_pay as depreciation,'
      'road_pay as liCheng '
      ' from hrd_car_out')
    Left = 436
    object qry_tempcar_no: TStringField
      FieldName = 'car_no'
      Size = 10
    end
    object qry_tempamonth: TStringField
      FieldName = 'amonth'
      Size = 6
    end
    object qry_tempsal_pay: TBCDField
      FieldName = 'sal_pay'
      Precision = 19
    end
    object qry_temppicc_pay: TBCDField
      FieldName = 'picc_pay'
      Precision = 19
    end
    object qry_tempyou_pay: TBCDField
      FieldName = 'you_pay'
      Precision = 19
    end
    object qry_tempdefine_pay: TBCDField
      FieldName = 'define_pay'
      Precision = 19
    end
    object qry_tempfix_pay: TBCDField
      FieldName = 'fix_pay'
      Precision = 19
    end
    object qry_tempdepreciation: TBCDField
      FieldName = 'depreciation'
      Precision = 19
    end
    object qry_templiCheng: TBCDField
      FieldName = 'liCheng'
      Precision = 19
    end
  end
end
