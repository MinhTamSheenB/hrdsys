object FormMed09: TFormMed09
  Left = 1
  Top = 18
  Width = 794
  Height = 504
  Caption = 'FormMed09'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Scaled = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 786
    Height = 470
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object PanelMain: TPanel
      Left = 0
      Top = 36
      Width = 786
      Height = 434
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 786
        Height = 81
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object TntGroupBox1: TTntGroupBox
          Left = 0
          Top = 0
          Width = 786
          Height = 81
          Align = alClient
          Caption = 'query_condition'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object Label_month: TTntLabel
            Left = 43
            Top = 19
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
          object TntLabel2: TTntLabel
            Left = 43
            Top = 51
            Width = 78
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'fld_dru_code'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'MS PGothic'
            Font.Style = []
            ParentFont = False
          end
          object TntLabel1: TTntLabel
            Left = 419
            Top = 19
            Width = 78
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'fld_med_code'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'MS PGothic'
            Font.Style = []
            ParentFont = False
          end
          object Panel2: TPanel
            Left = 431
            Top = 43
            Width = 338
            Height = 30
            BevelOuter = bvNone
            TabOrder = 0
            object Btn_Search: TTntBitBtn
              Left = 60
              Top = 5
              Width = 81
              Height = 25
              Caption = 'find'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
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
            object Btn_Reset: TTntBitBtn
              Left = 155
              Top = 5
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
              TabOrder = 1
              OnClick = Btn_ResetClick
              Kind = bkRetry
            end
            object Btn_Print: TTntBitBtn
              Left = 250
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
              OnClick = Btn_PrintClick
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
          object DatePickerBegin: TTntDateTimePicker
            Left = 128
            Top = 16
            Width = 100
            Height = 21
            Date = 38650.000000000000000000
            Time = 38650.000000000000000000
            TabOrder = 1
          end
          object DatePickerEnd: TTntDateTimePicker
            Left = 240
            Top = 16
            Width = 100
            Height = 21
            Date = 38650.999988425930000000
            Time = 38650.999988425930000000
            TabOrder = 2
          end
          object dru_code_begin: TTntEdit
            Left = 128
            Top = 48
            Width = 100
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 6
            ParentFont = False
            TabOrder = 3
          end
          object dru_code_end: TTntEdit
            Left = 240
            Top = 48
            Width = 100
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 6
            ParentFont = False
            TabOrder = 4
          end
          object med_code_begin: TTntEdit
            Left = 504
            Top = 16
            Width = 100
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 10
            ParentFont = False
            TabOrder = 5
          end
          object med_code_end: TTntEdit
            Left = 616
            Top = 16
            Width = 100
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 10
            ParentFont = False
            TabOrder = 6
          end
        end
      end
      object Panel6: TPanel
        Left = 0
        Top = 81
        Width = 786
        Height = 353
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object TntGroupBox2: TTntGroupBox
          Left = 0
          Top = 0
          Width = 568
          Height = 353
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object DBGrid1: TTntDBGrid
            Left = 2
            Top = 15
            Width = 564
            Height = 336
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
            TitleFont.Color = clBlack
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnTitleClick = DBGrid1TitleClick
            Columns = <
              item
                Expanded = False
                FieldName = 'dru_code'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'dru_name'
                Width = 153
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'unit_name'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'dru_price'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'med_qty'
                Visible = True
              end>
          end
        end
        object TntGroupBox3: TTntGroupBox
          Left = 568
          Top = 0
          Width = 218
          Height = 353
          Align = alRight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object DBGrid2: TTntDBGrid
            Left = 2
            Top = 15
            Width = 214
            Height = 336
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
            TitleFont.Color = clBlack
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnTitleClick = DBGrid1TitleClick
            Columns = <
              item
                Expanded = False
                FieldName = 'med_code'
                Width = 82
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'med_qty'
                Visible = True
              end>
          end
        end
      end
    end
    object PanelTitle: TTntPanel
      Left = 0
      Top = 0
      Width = 786
      Height = 36
      Align = alTop
      BevelOuter = bvNone
      Caption = 'med09_titl'
      Color = clCream
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 40
  end
  object ADOQuery1: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterOpen = ADOQuery1AfterOpen
    AfterScroll = ADOQuery1AfterScroll
    OnCalcFields = ADOQuery1CalcFields
    Parameters = <>
    SQL.Strings = (
      'select * from hrd_med_detl where 1=2')
    Left = 8
    object ADOQuery1dru_code: TWideStringField
      FieldName = 'dru_code'
      Size = 10
    end
    object ADOQuery1dru_name: TTntWideStringField
      FieldKind = fkCalculated
      FieldName = 'dru_name'
      Calculated = True
    end
    object ADOQuery1unit_name: TTntWideStringField
      DisplayWidth = 7
      FieldKind = fkCalculated
      FieldName = 'unit_name'
      Calculated = True
    end
    object ADOQuery1dru_price: TFloatField
      FieldKind = fkCalculated
      FieldName = 'dru_price'
      Calculated = True
    end
    object ADOQuery1med_qty: TFloatField
      FieldName = 'med_qty'
    end
  end
  object PrintDialog1: TPrintDialog
    Left = 664
    Top = 180
  end
  object ADODataSetDetl: TADODataSet
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select * from hrd_med_detl where 1=2'
    Parameters = <>
    Left = 152
    object ADODataSetDetlmed_code: TWideStringField
      FieldName = 'med_code'
      Size = 10
    end
    object ADODataSetDetlmed_qty: TFloatField
      FieldName = 'med_qty'
    end
  end
  object DataSource2: TDataSource
    DataSet = ADODataSetDetl
    Left = 192
  end
end
