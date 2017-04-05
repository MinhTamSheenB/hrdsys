object FormMed12: TFormMed12
  Left = 0
  Top = 34
  Width = 800
  Height = 497
  Caption = 'FormMed12'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 463
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object PanelTitle: TTntPanel
      Left = 0
      Top = 0
      Width = 792
      Height = 36
      Align = alTop
      BevelOuter = bvNone
      Caption = 'med12_titl'
      Color = clCream
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object PanelMain: TPanel
      Left = 0
      Top = 36
      Width = 792
      Height = 427
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object PageControl1: TTntPageControl
        Left = 0
        Top = 0
        Width = 792
        Height = 427
        ActivePage = TabSheetSick
        Align = alClient
        TabOrder = 0
        OnChange = PageControl1Change
        object TabSheetSick: TTntTabSheet
          Caption = 'by_sick_sum'
          object PanelSick: TTntPanel
            Left = 0
            Top = 0
            Width = 784
            Height = 35
            Align = alTop
            BevelOuter = bvNone
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object TntLabel11: TTntLabel
              Left = 4
              Top = 11
              Width = 75
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
            object Btn_Search_Sick: TTntBitBtn
              Left = 560
              Top = 5
              Width = 75
              Height = 25
              Caption = 'find'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnClick = Btn_Search_SickClick
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
            object MonthSick: TMaskEdit
              Left = 88
              Top = 6
              Width = 47
              Height = 21
              Hint = 'yyyy/mm'
              EditMask = '9999/99;0;_'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              MaxLength = 7
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
            end
            object BtnPrintSick: TTntBitBtn
              Left = 670
              Top = 5
              Width = 75
              Height = 25
              Caption = 'print'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Palatino Linotype'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              OnClick = BtnPrintSickClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000130B0000130B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
                00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
                8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
                8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
                8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
                03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
                03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
                33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
                33333337FFFF7733333333300000033333333337777773333333}
              NumGlyphs = 2
            end
          end
          object PanelGrid: TPanel
            Left = 0
            Top = 35
            Width = 784
            Height = 364
            Align = alClient
            TabOrder = 1
            object DBGrid1: TTntDBGrid
              Left = 1
              Top = 1
              Width = 782
              Height = 362
              Align = alClient
              DataSource = DataSource1
              FixedColor = clSkyBlue
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Palatino Linotype'
              Font.Style = []
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete]
              ParentFont = False
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnTitleClick = DBGrid1TitleClick
              Columns = <
                item
                  Expanded = False
                  FieldName = 'sick_code'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'sick_name'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'total'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = '1'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = '2'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = '3'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = '4'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = '5'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = '6'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = '7'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = '8'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = '9'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = '10'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = '11'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = '12'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = '13'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = '14'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = '15'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = '16'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = '17'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = '18'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = '19'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = '20'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = '21'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = '22'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = '23'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = '24'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = '25'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = '26'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = '27'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = '28'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = '29'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = '30'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = '31'
                  Visible = True
                end>
            end
          end
        end
        object TabSheetDept: TTntTabSheet
          Caption = 'by_dept_sum'
          object PanelUnit: TTntPanel
            Left = 0
            Top = 0
            Width = 784
            Height = 35
            Align = alTop
            BevelOuter = bvNone
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object TntLabel1: TTntLabel
              Left = 4
              Top = 11
              Width = 74
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
            object Btn_Search_Dept: TTntBitBtn
              Left = 560
              Top = 5
              Width = 75
              Height = 25
              Caption = 'find'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnClick = Btn_Search_DeptClick
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
            object MonthDept: TMaskEdit
              Left = 88
              Top = 6
              Width = 47
              Height = 21
              Hint = 'yyyy/mm'
              EditMask = '9999/99;0;_'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              MaxLength = 7
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
            end
            object BtnPrintDept: TTntBitBtn
              Left = 670
              Top = 5
              Width = 75
              Height = 25
              Caption = 'print'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Palatino Linotype'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              OnClick = BtnPrintDeptClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000130B0000130B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
                00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
                8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
                8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
                8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
                03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
                03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
                33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
                33333337FFFF7733333333300000033333333337777773333333}
              NumGlyphs = 2
            end
          end
          object Panel2: TPanel
            Left = 0
            Top = 35
            Width = 784
            Height = 364
            Align = alClient
            TabOrder = 1
            object DBGrid2: TTntDBGrid
              Left = 1
              Top = 1
              Width = 782
              Height = 362
              Align = alClient
              DataSource = DataSource2
              FixedColor = clSkyBlue
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Palatino Linotype'
              Font.Style = []
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete]
              ParentFont = False
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnTitleClick = DBGrid1TitleClick
              Columns = <
                item
                  Expanded = False
                  FieldName = 'dept_code'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'dept_name'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'total'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = '1'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = '2'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = '3'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = '4'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = '5'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = '6'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = '7'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = '8'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = '9'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = '10'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = '11'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = '12'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = '13'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = '14'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = '15'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = '16'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = '17'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = '18'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = '19'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = '20'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = '21'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = '22'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = '23'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = '24'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = '25'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = '26'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = '27'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = '28'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = '29'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = '30'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = '31'
                  Visible = True
                end>
            end
          end
        end
        object TabSheetDru: TTntTabSheet
          Caption = 'by_dru_sum'
          object PanelUse: TTntPanel
            Left = 0
            Top = 0
            Width = 784
            Height = 35
            Align = alTop
            BevelOuter = bvNone
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object Label_month: TTntLabel
              Left = 19
              Top = 11
              Width = 78
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'date'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -13
              Font.Name = 'MS PGothic'
              Font.Style = []
              ParentFont = False
            end
            object Btn_Search_Dru: TTntBitBtn
              Left = 560
              Top = 5
              Width = 75
              Height = 25
              Caption = 'find'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnClick = Btn_Search_DruClick
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
            object DatePickerBegin: TTntDateTimePicker
              Left = 104
              Top = 6
              Width = 100
              Height = 21
              Date = 38650.000000000000000000
              Time = 38650.000000000000000000
              TabOrder = 1
            end
            object DatePickerEnd: TTntDateTimePicker
              Left = 216
              Top = 6
              Width = 100
              Height = 21
              Date = 38650.999988425930000000
              Time = 38650.999988425930000000
              TabOrder = 2
            end
            object BtnPrintDru: TTntBitBtn
              Left = 670
              Top = 5
              Width = 75
              Height = 25
              Caption = 'print'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Palatino Linotype'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
              OnClick = BtnPrintDruClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000130B0000130B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
                00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
                8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
                8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
                8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
                03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
                03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
                33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
                33333337FFFF7733333333300000033333333337777773333333}
              NumGlyphs = 2
            end
          end
          object Panel3: TPanel
            Left = 0
            Top = 35
            Width = 784
            Height = 364
            Align = alClient
            TabOrder = 1
            object DBGrid3: TTntDBGrid
              Left = 1
              Top = 1
              Width = 782
              Height = 362
              Align = alClient
              DataSource = DataSource3
              FixedColor = clSkyBlue
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Palatino Linotype'
              Font.Style = []
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete]
              ParentFont = False
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnTitleClick = DBGrid1TitleClick
              Columns = <
                item
                  Expanded = False
                  FieldName = 'dept_cate_name'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'dept_dru_qty'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'normal_dru_qty'
                  Visible = True
                end>
            end
          end
        end
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuerySick
    Left = 168
    Top = 168
  end
  object ADOQuery1: TADOQuery
    Connection = DMHrdsys.conn
    LockType = ltBatchOptimistic
    AfterScroll = ADOQuery1AfterScroll
    Parameters = <>
    SQL.Strings = (
      'select sick_code,med_date,emp_id,count(*) as num '
      'from hrd_med_mast where 1=2'
      'group by sick_code,med_date,emp_id')
    Left = 240
    Top = 2
  end
  object ADOQuerySick2: TADOQuery
    Connection = DMHrdsys.conn
    LockType = ltBatchOptimistic
    AfterScroll = ADOQuery1AfterScroll
    Parameters = <>
    SQL.Strings = (
      'select * from hrd_dru_mast')
    Left = 128
    Top = 2
  end
  object ADOQuerySick: TADOQuery
    Connection = DMHrdsys.conn
    LockType = ltBatchOptimistic
    AfterScroll = ADOQuery1AfterScroll
    OnCalcFields = ADOQuerySickCalcFields
    Parameters = <>
    SQL.Strings = (
      'select sick_code,med_date,emp_id,count(*) as total '
      'from hrd_med_mast where 1=2'
      'group by sick_code,med_date,emp_id')
    Left = 8
    Top = 2
    object WideStringField1: TWideStringField
      FieldName = 'sick_code'
      Size = 4
    end
    object TntWideStringField1: TTntWideStringField
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'sick_name'
      Calculated = True
    end
    object ADOQuerySicktotal: TIntegerField
      FieldName = 'total'
      ReadOnly = True
    end
    object IntegerField2: TIntegerField
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = '1'
      Calculated = True
    end
    object IntegerField3: TIntegerField
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = '2'
      Calculated = True
    end
    object IntegerField4: TIntegerField
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = '3'
      Calculated = True
    end
    object IntegerField5: TIntegerField
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = '4'
      Calculated = True
    end
    object IntegerField6: TIntegerField
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = '5'
      Calculated = True
    end
    object IntegerField7: TIntegerField
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = '6'
      Calculated = True
    end
    object IntegerField8: TIntegerField
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = '7'
      Calculated = True
    end
    object IntegerField9: TIntegerField
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = '8'
      Calculated = True
    end
    object IntegerField10: TIntegerField
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = '9'
      Calculated = True
    end
    object IntegerField11: TIntegerField
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = '10'
      Calculated = True
    end
    object IntegerField12: TIntegerField
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = '11'
      Calculated = True
    end
    object IntegerField13: TIntegerField
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = '12'
      Calculated = True
    end
    object IntegerField14: TIntegerField
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = '13'
      Calculated = True
    end
    object IntegerField15: TIntegerField
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = '14'
      Calculated = True
    end
    object IntegerField16: TIntegerField
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = '15'
      Calculated = True
    end
    object IntegerField17: TIntegerField
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = '16'
      Calculated = True
    end
    object IntegerField18: TIntegerField
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = '17'
      Calculated = True
    end
    object IntegerField19: TIntegerField
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = '18'
      Calculated = True
    end
    object IntegerField20: TIntegerField
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = '19'
      Calculated = True
    end
    object IntegerField21: TIntegerField
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = '20'
      Calculated = True
    end
    object IntegerField22: TIntegerField
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = '21'
      Calculated = True
    end
    object IntegerField23: TIntegerField
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = '22'
      Calculated = True
    end
    object IntegerField24: TIntegerField
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = '23'
      Calculated = True
    end
    object IntegerField25: TIntegerField
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = '24'
      Calculated = True
    end
    object IntegerField26: TIntegerField
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = '25'
      Calculated = True
    end
    object IntegerField27: TIntegerField
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = '26'
      Calculated = True
    end
    object IntegerField28: TIntegerField
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = '27'
      Calculated = True
    end
    object IntegerField29: TIntegerField
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = '28'
      Calculated = True
    end
    object IntegerField30: TIntegerField
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = '29'
      Calculated = True
    end
    object IntegerField31: TIntegerField
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = '30'
      Calculated = True
    end
    object IntegerField32: TIntegerField
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = '31'
      Calculated = True
    end
  end
  object ADOQueryDept: TADOQuery
    Connection = DMHrdsys.conn
    LockType = ltBatchOptimistic
    AfterScroll = ADOQuery1AfterScroll
    OnCalcFields = ADOQueryDeptCalcFields
    Parameters = <>
    SQL.Strings = (
      'select dept_code,med_date,count(*) as total '
      'from hrd_med_mast  as A,'
      ' hrd_emp as B where A.emp_id=B.emp_id'
      'group by dept_code,med_date')
    Left = 48
    Top = 2
    object ADOQueryDeptdept_code: TStringField
      FieldName = 'dept_code'
      Size = 6
    end
    object TntWideStringField2: TTntWideStringField
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'dept_name'
      Calculated = True
    end
    object IntegerField33: TIntegerField
      FieldName = 'total'
      ReadOnly = True
    end
    object IntegerField34: TIntegerField
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = '1'
      Calculated = True
    end
    object IntegerField35: TIntegerField
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = '2'
      Calculated = True
    end
    object IntegerField36: TIntegerField
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = '3'
      Calculated = True
    end
    object IntegerField37: TIntegerField
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = '4'
      Calculated = True
    end
    object IntegerField38: TIntegerField
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = '5'
      Calculated = True
    end
    object IntegerField39: TIntegerField
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = '6'
      Calculated = True
    end
    object IntegerField40: TIntegerField
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = '7'
      Calculated = True
    end
    object IntegerField41: TIntegerField
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = '8'
      Calculated = True
    end
    object IntegerField42: TIntegerField
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = '9'
      Calculated = True
    end
    object IntegerField43: TIntegerField
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = '10'
      Calculated = True
    end
    object IntegerField44: TIntegerField
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = '11'
      Calculated = True
    end
    object IntegerField45: TIntegerField
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = '12'
      Calculated = True
    end
    object IntegerField46: TIntegerField
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = '13'
      Calculated = True
    end
    object IntegerField47: TIntegerField
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = '14'
      Calculated = True
    end
    object IntegerField48: TIntegerField
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = '15'
      Calculated = True
    end
    object IntegerField49: TIntegerField
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = '16'
      Calculated = True
    end
    object IntegerField50: TIntegerField
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = '17'
      Calculated = True
    end
    object IntegerField51: TIntegerField
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = '18'
      Calculated = True
    end
    object IntegerField52: TIntegerField
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = '19'
      Calculated = True
    end
    object IntegerField53: TIntegerField
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = '20'
      Calculated = True
    end
    object IntegerField54: TIntegerField
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = '21'
      Calculated = True
    end
    object IntegerField55: TIntegerField
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = '22'
      Calculated = True
    end
    object IntegerField56: TIntegerField
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = '23'
      Calculated = True
    end
    object IntegerField57: TIntegerField
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = '24'
      Calculated = True
    end
    object IntegerField58: TIntegerField
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = '25'
      Calculated = True
    end
    object IntegerField59: TIntegerField
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = '26'
      Calculated = True
    end
    object IntegerField60: TIntegerField
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = '27'
      Calculated = True
    end
    object IntegerField61: TIntegerField
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = '28'
      Calculated = True
    end
    object IntegerField62: TIntegerField
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = '29'
      Calculated = True
    end
    object IntegerField63: TIntegerField
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = '30'
      Calculated = True
    end
    object IntegerField64: TIntegerField
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = '31'
      Calculated = True
    end
  end
  object ADOQueryDru: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterScroll = ADOQuery1AfterScroll
    OnCalcFields = ADOQueryDruCalcFields
    Parameters = <>
    SQL.Strings = (
      'select * from hrd_dept_cate')
    Left = 88
    Top = 2
    object ADOQueryDrudept_cate_code: TStringField
      FieldName = 'dept_cate_code'
      Size = 6
    end
    object ADOQueryDrudept_cate_name: TWideStringField
      DisplayWidth = 20
      FieldName = 'dept_cate_name'
      Size = 50
    end
    object ADOQueryDrudept_dru_qty: TFloatField
      FieldKind = fkCalculated
      FieldName = 'dept_dru_qty'
      Calculated = True
    end
    object ADOQuerynormal_dru_qty: TFloatField
      FieldKind = fkCalculated
      FieldName = 'normal_dru_qty'
      Calculated = True
    end
  end
  object ADOQueryDept2: TADOQuery
    Connection = DMHrdsys.conn
    LockType = ltBatchOptimistic
    AfterScroll = ADOQuery1AfterScroll
    Parameters = <>
    SQL.Strings = (
      'select * from hrd_dru_mast')
    Left = 160
    Top = 2
  end
  object ADOQueryDru2: TADOQuery
    Connection = DMHrdsys.conn
    LockType = ltBatchOptimistic
    AfterScroll = ADOQuery1AfterScroll
    Parameters = <>
    SQL.Strings = (
      'select * from hrd_dru_mast')
    Left = 192
    Top = 2
  end
  object DataSource2: TDataSource
    DataSet = ADOQueryDept
    Left = 200
    Top = 168
  end
  object DataSource3: TDataSource
    DataSet = ADOQueryDru
    Left = 232
    Top = 168
  end
end
