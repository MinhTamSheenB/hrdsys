object FormHrd16: TFormHrd16
  Left = 1
  Top = 19
  Width = 794
  Height = 503
  Caption = 'FormHrd16'
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
    Height = 469
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
      Caption = 'hrd16_titl'
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
      Height = 433
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object Panel5: TPanel
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
            Height = 34
            BevelOuter = bvNone
            TabOrder = 0
            object BtnQuery: TTntButton
              Left = 172
              Top = 5
              Width = 75
              Height = 25
              Caption = 'query'
              Default = True
              TabOrder = 0
              OnClick = BtnQueryClick
            end
            object BtnPrint: TTntBitBtn
              Left = 256
              Top = 4
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
              TabOrder = 1
              OnClick = BtnPrintClick
            end
          end
          object DTPickBegin: TTntDateTimePicker
            Left = 131
            Top = 14
            Width = 90
            Height = 21
            Date = 38565.000000000000000000
            Time = 38565.000000000000000000
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            TabOrder = 1
          end
          object DTPickEnd: TTntDateTimePicker
            Left = 227
            Top = 14
            Width = 90
            Height = 21
            Date = 38595.000000000000000000
            Time = 38595.000000000000000000
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            TabOrder = 2
          end
        end
      end
      object PanelGrid: TPanel
        Left = 0
        Top = 49
        Width = 786
        Height = 384
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 432
          Height = 384
          Align = alClient
          TabOrder = 0
          object TntGroupBox3: TTntGroupBox
            Left = 1
            Top = 1
            Width = 430
            Height = 341
            Align = alClient
            Caption = 'hrd16_all_person'
            TabOrder = 0
            object DBGrid1: TTntDBGrid
              Left = 2
              Top = 15
              Width = 426
              Height = 324
              Align = alClient
              DataSource = DataSource1
              FixedColor = clSkyBlue
              ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnCellClick = DBGrid1CellClick
              OnDrawColumnCell = DBGrid1DrawColumnCell
              OnTitleClick = DBGrid1TitleClick
              Columns = <
                item
                  Expanded = False
                  Width = 30
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'data_id'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'emp_chs'
                  Width = 68
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'name_vim'
                  Width = 89
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'epid_no'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 're_date'
                  Width = 78
                  Visible = True
                end>
            end
          end
          object TntPanel1: TTntPanel
            Left = 1
            Top = 342
            Width = 430
            Height = 41
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 1
            object BtnAll: TTntButton
              Left = 8
              Top = 8
              Width = 75
              Height = 25
              Caption = 'choose_all'
              TabOrder = 0
              OnClick = BtnAllClick
            end
            object BtnNone: TTntButton
              Left = 88
              Top = 8
              Width = 75
              Height = 25
              Caption = 'choose_none'
              TabOrder = 1
              OnClick = BtnAllClick
            end
          end
        end
        object Panel4: TPanel
          Left = 460
          Top = 0
          Width = 326
          Height = 384
          Align = alRight
          TabOrder = 1
          object TntGroupBox2: TTntGroupBox
            Left = 1
            Top = 1
            Width = 324
            Height = 382
            Align = alClient
            Caption = 'hrd16_re_person'
            TabOrder = 0
            object DBGrid2: TTntDBGrid
              Left = 2
              Top = 15
              Width = 320
              Height = 365
              Align = alClient
              DataSource = DataSource2
              FixedColor = clSkyBlue
              ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
              ReadOnly = True
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
                  FieldName = 'data_id'
                  Width = 74
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'emp_chs'
                  Width = 68
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'name_vim'
                  Width = 90
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'epid_no'
                  Visible = True
                end>
            end
          end
        end
        object Panel6: TPanel
          Left = 432
          Top = 0
          Width = 28
          Height = 384
          Align = alRight
          TabOrder = 2
        end
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 200
  end
  object ADOQuery1: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'select top 1  * from hrd_person')
    Left = 168
    object ADOQuery1upd_user: TStringField
      FieldName = 'upd_user'
      Size = 16
    end
    object ADOQuery1upd_date: TDateTimeField
      FieldName = 'upd_date'
    end
    object ADOQuery1data_id: TStringField
      FieldName = 'data_id'
      Size = 11
    end
    object ADOQuery1emp_chs: TWideStringField
      FieldName = 'emp_chs'
      Size = 30
    end
    object ADOQuery1epid_no: TStringField
      FieldName = 'epid_no'
      Size = 10
    end
    object ADOQuery1name_vim: TWideStringField
      FieldName = 'name_vim'
      Size = 30
    end
    object ADOQuery1mail_date: TDateTimeField
      FieldName = 'mail_date'
    end
    object ADOQuery1re_date: TDateTimeField
      FieldName = 're_date'
      OnChange = ADOQuery1re_dateChange
    end
    object ADOQuery1matr_date: TDateTimeField
      FieldName = 'matr_date'
    end
  end
  object PrintDialog1: TPrintDialog
    Left = 328
    Top = 188
  end
  object ADOStoredProc1: TADOStoredProc
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    ProcedureName = 'proc_emp;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@inwork_flag'
        Attributes = [paNullable]
        DataType = ftString
        Size = 1
        Value = Null
      end
      item
        Name = '@year_month'
        Attributes = [paNullable]
        DataType = ftString
        Size = 6
        Value = Null
      end
      item
        Name = '@emp_begin'
        Attributes = [paNullable]
        DataType = ftString
        Size = 6
        Value = Null
      end
      item
        Name = '@emp_end'
        Attributes = [paNullable]
        DataType = ftString
        Size = 6
        Value = Null
      end
      item
        Name = '@dept_begin'
        Attributes = [paNullable]
        DataType = ftString
        Size = 6
        Value = Null
      end
      item
        Name = '@dept_end'
        Attributes = [paNullable]
        DataType = ftString
        Size = 6
        Value = Null
      end
      item
        Name = '@pst_begin'
        Attributes = [paNullable]
        DataType = ftString
        Size = 2
        Value = Null
      end
      item
        Name = '@pst_end'
        Attributes = [paNullable]
        DataType = ftString
        Size = 2
        Value = Null
      end
      item
        Name = '@edu_begin'
        Attributes = [paNullable]
        DataType = ftString
        Size = 2
        Value = Null
      end
      item
        Name = '@edu_end'
        Attributes = [paNullable]
        DataType = ftString
        Size = 2
        Value = Null
      end
      item
        Name = '@birth_begin'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = Null
      end
      item
        Name = '@birth_end'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = Null
      end
      item
        Name = '@indt_begin'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = Null
      end
      item
        Name = '@indt_end'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = Null
      end
      item
        Name = '@ledt_begin'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = Null
      end
      item
        Name = '@ledt_end'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = Null
      end
      item
        Name = '@idno_begin'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = Null
      end
      item
        Name = '@idno_end'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = Null
      end
      item
        Name = '@name_chs'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 10
        Value = Null
      end>
    Left = 136
    Top = 2
  end
  object ADOQuery2: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'select top 1  * from hrd_person')
    Left = 271
    Top = 3
    object StringField2: TStringField
      FieldName = 'data_id'
      Size = 11
    end
    object WideStringField1: TWideStringField
      FieldName = 'emp_chs'
      Size = 30
    end
    object StringField3: TStringField
      FieldName = 'epid_no'
      Size = 10
    end
    object WideStringField2: TWideStringField
      FieldName = 'name_vim'
      Size = 30
    end
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery2
    Left = 303
    Top = 3
  end
end
