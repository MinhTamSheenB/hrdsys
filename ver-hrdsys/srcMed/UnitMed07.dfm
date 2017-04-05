object FormMed07: TFormMed07
  Left = 3
  Top = 26
  Width = 794
  Height = 504
  Caption = 'FormMed07'
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
    object PanelTitle: TTntPanel
      Left = 0
      Top = 0
      Width = 786
      Height = 36
      Align = alTop
      BevelOuter = bvNone
      Caption = 'med07_titl'
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
      Width = 786
      Height = 434
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object PanelQuery: TPanel
        Left = 0
        Top = 0
        Width = 786
        Height = 49
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object TntGroupBox1: TTntGroupBox
          Left = 0
          Top = 0
          Width = 786
          Height = 49
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
            Left = 34
            Top = 17
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
          object Panel2: TPanel
            Left = 439
            Top = 11
            Width = 338
            Height = 30
            BevelOuter = bvNone
            TabOrder = 0
            object BtnQuery: TTntBitBtn
              Left = 95
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
              OnClick = BtnQueryClick
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
              Left = 175
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
              TabOrder = 1
              OnClick = BtnPrintClick
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
          object DTPickBegin: TTntDateTimePicker
            Left = 117
            Top = 15
            Width = 90
            Height = 21
            Date = 38571.000000000000000000
            Time = 38571.000000000000000000
            TabOrder = 1
          end
          object DTPickEnd: TTntDateTimePicker
            Left = 213
            Top = 15
            Width = 90
            Height = 21
            Date = 38573.999988425930000000
            Time = 38573.999988425930000000
            TabOrder = 2
          end
        end
      end
      object PanelGrid: TPanel
        Left = 0
        Top = 49
        Width = 786
        Height = 385
        Align = alClient
        TabOrder = 1
        object DBGrid1: TTntDBGrid
          Left = 1
          Top = 1
          Width = 784
          Height = 383
          Align = alClient
          Color = clWhite
          DataSource = DataSource1
          FixedColor = clSkyBlue
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete]
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
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'dru_name'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'unit_name'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'new_price'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'first_inv'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'in_inv'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'inv_out1'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'inv_out2'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'tun_inv'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'dis_inv'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'end_inv'
              Width = 60
              Visible = True
            end>
        end
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 144
  end
  object ADOQuery1: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterScroll = ADOQuery1AfterScroll
    OnCalcFields = ADOQuery1CalcFields
    Parameters = <>
    SQL.Strings = (
      'select *  from hrd_med_mon')
    Left = 8
    object ADOQuery1dru_code: TStringField
      FieldName = 'dru_code'
      Size = 6
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
    object ADOQuery1new_price: TBCDField
      DisplayWidth = 7
      FieldName = 'new_price'
      Precision = 15
      Size = 0
    end
    object ADOQuery1first_inv: TIntegerField
      DisplayWidth = 6
      FieldName = 'first_inv'
    end
    object ADOQuery1in_inv: TIntegerField
      DisplayWidth = 5
      FieldName = 'in_inv'
    end
    object ADOQuery1inv_out1: TIntegerField
      DisplayWidth = 5
      FieldName = 'inv_out1'
    end
    object ADOQuery1inv_out2: TIntegerField
      DisplayWidth = 5
      FieldName = 'inv_out2'
    end
    object ADOQuery1tun_inv: TIntegerField
      DisplayWidth = 5
      FieldName = 'tun_inv'
    end
    object ADOQuery1dis_inv: TIntegerField
      DisplayWidth = 5
      FieldName = 'dis_inv'
    end
    object ADOQuery1end_inv: TIntegerField
      DisplayWidth = 6
      FieldName = 'end_inv'
    end
  end
  object ADOQuery2: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'select *  from hrd_med_mon')
    Left = 40
  end
end
