object FormMed02: TFormMed02
  Left = 1
  Top = 18
  Width = 794
  Height = 504
  Caption = 'FormMed02'
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
      Caption = 'med02_titl'
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
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 786
        Height = 44
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object TntGroupBox1: TTntGroupBox
          Left = 0
          Top = 0
          Width = 786
          Height = 44
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
            object BtnQuery: TTntButton
              Left = 109
              Top = 3
              Width = 75
              Height = 25
              Caption = 'query'
              Default = True
              TabOrder = 0
              OnClick = BtnQueryClick
            end
            object BtnTrans: TTntButton
              Left = 197
              Top = 3
              Width = 75
              Height = 25
              Caption = 'transferfiles'
              Default = True
              TabOrder = 1
              OnClick = BtnTransClick
            end
          end
          object DTPickBegin: TTntDateTimePicker
            Left = 115
            Top = 14
            Width = 90
            Height = 21
            Date = 38565.000000000000000000
            Time = 38565.000000000000000000
            TabOrder = 1
          end
          object DTPickEnd: TTntDateTimePicker
            Left = 211
            Top = 14
            Width = 90
            Height = 21
            Date = 38595.000000000000000000
            Time = 38595.000000000000000000
            TabOrder = 2
          end
        end
      end
      object Panel6: TPanel
        Left = 0
        Top = 44
        Width = 786
        Height = 390
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object TntGroupBox2: TTntGroupBox
          Left = 0
          Top = 0
          Width = 786
          Height = 176
          Align = alClient
          Caption = 'med02_transing_data'
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
            Width = 782
            Height = 159
            Align = alClient
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
                FieldName = 'rul_code'
                Width = 106
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'dru_code'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'dru_name'
                Width = 140
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'dru_price'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'unit_name'
                Width = 58
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'pro_code'
                Width = 33
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'acpt_date'
                Width = 66
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'acpt_no'
                Width = 67
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'acpt_qty'
                Width = 49
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'acpt_prce'
                Visible = True
              end>
          end
        end
        object TntGroupBox3: TTntGroupBox
          Left = 0
          Top = 176
          Width = 786
          Height = 214
          Align = alBottom
          Caption = 'med02_transed_data'
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
            Width = 782
            Height = 197
            Align = alClient
            DataSource = DataSource2
            FixedColor = clSkyBlue
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
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
                FieldName = 'into_date'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'dru_code'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'into_qty'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'dru_price'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'acpt_no'
                Visible = True
              end>
          end
        end
      end
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
    AfterScroll = ADOQuery1AfterScroll
    OnCalcFields = ADOQuery1CalcFields
    Parameters = <>
    SQL.Strings = (
      
        'select * from hrd_dru_mast as A,inv_acpt as B where A.rul_code=B' +
        '.item_no')
    Left = 8
    object ADOQuery1dru_code: TWideStringField
      FieldName = 'dru_code'
      Size = 6
    end
    object ADOQuery1dru_name: TWideStringField
      FieldName = 'dru_name'
      Size = 40
    end
    object ADOQuery1dru_price: TFloatField
      FieldName = 'dru_price'
    end
    object ADOQuery1unit_code: TWideStringField
      FieldName = 'unit_code'
      Size = 2
    end
    object ADOQuery1unit_name: TTntWideStringField
      FieldKind = fkCalculated
      FieldName = 'unit_name'
      Calculated = True
    end
    object ADOQuery1rul_code: TWideStringField
      FieldName = 'rul_code'
      Size = 14
    end
    object ADOQuery1pro_code: TFloatField
      FieldName = 'pro_code'
    end
    object ADOQuery1ACPT_DATE: TDateTimeField
      FieldName = 'acpt_date'
    end
    object ADOQuery1DEPARTMENT: TWideStringField
      FieldName = 'department'
      Size = 7
    end
    object ADOQuery1ACPT_QTY: TFloatField
      FieldName = 'acpt_qty'
    end
    object ADOQuery1ACPT_NO: TWideStringField
      FieldName = 'acpt_no'
      Size = 10
    end
    object ADOQuery1ACPT_PRCE: TFloatField
      FieldName = 'acpt_prce'
    end
    object ADOQuery1PROC_DATE: TDateTimeField
      FieldName = 'PROC_DATE'
    end
  end
  object PrintDialog1: TPrintDialog
    Left = 664
    Top = 180
  end
  object ADOQuery2: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterScroll = ADOQuery1AfterScroll
    Parameters = <>
    SQL.Strings = (
      'select * from hrd_med_into where 1=2')
    Left = 80
    object ADOQuery2into_date: TDateTimeField
      DisplayWidth = 19
      FieldName = 'into_date'
    end
    object ADOQuery2dru_code: TStringField
      DisplayWidth = 9
      FieldName = 'dru_code'
      Size = 6
    end
    object ADOQuery2into_qty: TIntegerField
      DisplayWidth = 12
      FieldName = 'into_qty'
    end
    object ADOQuery2dru_price: TBCDField
      DisplayWidth = 13
      FieldName = 'dru_price'
      Precision = 10
      Size = 0
    end
    object ADOQuery2acpt_no: TStringField
      DisplayWidth = 12
      FieldName = 'acpt_no'
      Size = 10
    end
    object ADOQuery2upd_user: TStringField
      FieldName = 'upd_user'
      Size = 16
    end
    object ADOQuery2upd_date: TDateTimeField
      FieldName = 'upd_date'
    end
  end
  object ADOQuery3: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from hrd_med_mon ')
    Left = 152
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery2
    Left = 112
  end
end
