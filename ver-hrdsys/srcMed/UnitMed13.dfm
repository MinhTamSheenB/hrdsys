object FormMed13: TFormMed13
  Left = 1
  Top = 18
  Width = 794
  Height = 504
  Caption = 'FormMed13'
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
      Caption = 'med13_titl'
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
          object TntLabel1: TTntLabel
            Left = 369
            Top = 19
            Width = 95
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'fld_department'
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
          object Panel2: TPanel
            Left = 431
            Top = 43
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
            object BtnPrint: TTntButton
              Left = 197
              Top = 3
              Width = 75
              Height = 25
              Caption = 'print'
              Default = True
              TabOrder = 1
              Visible = False
              OnClick = BtnPrintClick
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
          object CobDeptBegin: TTntComboBox
            Left = 467
            Top = 15
            Width = 150
            Height = 21
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            TabOrder = 3
          end
          object CobDeptEnd: TTntComboBox
            Left = 619
            Top = 15
            Width = 150
            Height = 21
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            TabOrder = 4
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
            TabOrder = 5
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
          Width = 341
          Height = 353
          Align = alLeft
          Caption = 'mdp_mast'
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
            Width = 337
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
                FieldName = 'mdp_code'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'mdp_date'
                Width = 73
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'dept_code'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'department'
                Visible = True
              end>
          end
        end
        object TntGroupBox3: TTntGroupBox
          Left = 341
          Top = 0
          Width = 445
          Height = 353
          Align = alClient
          Caption = 'mdp_detl'
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
            Width = 441
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
                FieldName = 'dru_code'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'dru_name'
                Width = 120
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'unit_name'
                Width = 52
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'dru_price'
                Width = 56
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'med_qty'
                Width = 55
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'money'
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
      'select * from hrd_mdp_mast')
    Left = 8
    object ADOQuery1upd_user: TWideStringField
      FieldName = 'upd_user'
      Size = 10
    end
    object ADOQuery1upd_date: TDateTimeField
      FieldName = 'upd_date'
    end
    object ADOQuery1mdp_code: TWideStringField
      FieldName = 'mdp_code'
      Size = 10
    end
    object ADOQuery1mdp_date: TDateTimeField
      FieldName = 'mdp_date'
    end
    object ADOQuery1dept_code: TWideStringField
      FieldName = 'dept_code'
      Size = 6
    end
    object ADOQuery1department: TTntWideStringField
      FieldKind = fkCalculated
      FieldName = 'department'
      Calculated = True
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
    OnCalcFields = ADOQuery1CalcFields
    Parameters = <>
    SQL.Strings = (
      'select * from hrd_med_mon where 2=1')
    Left = 96
    Top = 3
    object StringField1: TStringField
      FieldName = 'dru_code'
      Size = 6
    end
    object IntegerField1: TIntegerField
      FieldName = 'first_inv'
    end
    object IntegerField2: TIntegerField
      FieldName = 'in_inv'
    end
    object IntegerField3: TIntegerField
      FieldName = 'out_inv'
    end
    object IntegerField4: TIntegerField
      FieldName = 'tun_inv'
    end
    object IntegerField5: TIntegerField
      FieldName = 'dis_inv'
    end
    object IntegerField6: TIntegerField
      FieldName = 'end_inv'
    end
    object StringField2: TStringField
      FieldName = 'rea_code'
      Size = 2
    end
    object BCDField1: TBCDField
      FieldName = 'old_price'
      Precision = 15
      Size = 0
    end
    object BCDField2: TBCDField
      FieldName = 'new_price'
      Precision = 15
      Size = 0
    end
    object TntWideStringField1: TTntWideStringField
      FieldKind = fkCalculated
      FieldName = 'dru_name'
      Calculated = True
    end
    object TntWideStringField2: TTntWideStringField
      FieldKind = fkCalculated
      FieldName = 'unit_name'
      Calculated = True
    end
    object StringField3: TStringField
      FieldName = 'upd_user'
      Size = 16
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'upd_date'
    end
    object StringField4: TStringField
      FieldName = 'month'
      Size = 6
    end
  end
  object ADODataSetDetl: TADODataSet
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    OnCalcFields = ADODataSetDetlCalcFields
    CommandText = 'select * from hrd_mdp_detl'
    DataSource = DataSource1
    IndexFieldNames = 'mdp_code'
    MasterFields = 'mdp_code'
    Parameters = <>
    Left = 152
    object ADODataSetDetlupd_user: TWideStringField
      FieldName = 'upd_user'
      Size = 10
    end
    object ADODataSetDetlupd_date: TDateTimeField
      FieldName = 'upd_date'
    end
    object ADODataSetDetlmdp_code: TWideStringField
      FieldName = 'mdp_code'
      Size = 10
    end
    object ADODataSetDetldru_code: TWideStringField
      FieldName = 'dru_code'
      Size = 6
    end
    object ADODataSetDetldru_price: TFloatField
      FieldName = 'dru_price'
    end
    object ADODataSetDetlmed_qty: TFloatField
      FieldName = 'med_qty'
    end
    object ADODataSetDetldru_name: TTntWideStringField
      FieldKind = fkCalculated
      FieldName = 'dru_name'
      Calculated = True
    end
    object ADODataSetDetlunit_name: TTntWideStringField
      FieldKind = fkCalculated
      FieldName = 'unit_name'
      Calculated = True
    end
    object ADODataSetDetlmoney: TFloatField
      FieldKind = fkCalculated
      FieldName = 'money'
      Calculated = True
    end
  end
  object DataSource2: TDataSource
    DataSet = ADODataSetDetl
    Left = 192
  end
end
