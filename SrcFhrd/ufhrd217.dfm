object FormFhrd217: TFormFhrd217
  Left = 181
  Top = 196
  Width = 794
  Height = 503
  Caption = 'FormFhrd217'
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
      Caption = 'dut16_titl'
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
        Height = 73
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object TntGroupBox1: TTntGroupBox
          Left = 0
          Top = 0
          Width = 786
          Height = 73
          Align = alClient
          Caption = 'query_condition'
          TabOrder = 0
          object Label_month: TTntLabel
            Left = 442
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
          object RbEmp: TTntRadioButton
            Left = 32
            Top = 14
            Width = 80
            Height = 17
            Caption = 'by_empid'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object EditEmpBegin: TTntEdit
            Left = 115
            Top = 10
            Width = 57
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 6
            ParentFont = False
            TabOrder = 1
            OnChange = EditEmpBeginChange
          end
          object EditEmpEnd: TTntEdit
            Left = 179
            Top = 10
            Width = 57
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 6
            ParentFont = False
            TabOrder = 2
          end
          object RbDept: TTntRadioButton
            Left = 32
            Top = 43
            Width = 80
            Height = 17
            Caption = 'by_deptcode'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
          object CobDeptBegin: TTntComboBox
            Left = 115
            Top = 44
            Width = 150
            Height = 21
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            ItemHeight = 13
            ParentFont = False
            TabOrder = 4
            OnChange = CobDeptBeginChange
          end
          object CobDeptEnd: TTntComboBox
            Left = 267
            Top = 44
            Width = 150
            Height = 21
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            ItemHeight = 13
            ParentFont = False
            TabOrder = 5
          end
          object Panel2: TPanel
            Left = 431
            Top = 35
            Width = 338
            Height = 34
            BevelOuter = bvNone
            TabOrder = 6
            object BtnQuery: TTntButton
              Left = 89
              Top = 5
              Width = 75
              Height = 25
              Caption = 'query'
              Default = True
              TabOrder = 0
              OnClick = BtnQueryClick
            end
            object BtnPrint: TTntBitBtn
              Left = 167
              Top = 5
              Width = 75
              Height = 25
              Caption = 'print'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnClick = BtnPrintClick
            end
            object BtnCancel: TTntButton
              Left = 12
              Top = 5
              Width = 75
              Height = 25
              Caption = 'cancel'
              Default = True
              TabOrder = 2
              OnClick = BtnCancelClick
            end
            object BtnPrtExcel: TTntBitBtn
              Left = 246
              Top = 5
              Width = 75
              Height = 25
              Caption = 'Print  Excel'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
              OnClick = BtnPrtExcelClick
            end
          end
          object DTPickBegin: TTntDateTimePicker
            Left = 539
            Top = 14
            Width = 90
            Height = 21
            Date = 38565.000000000000000000
            Time = 38565.000000000000000000
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            TabOrder = 7
          end
          object DTPickEnd: TTntDateTimePicker
            Left = 635
            Top = 14
            Width = 90
            Height = 21
            Date = 38595.000000000000000000
            Time = 38595.000000000000000000
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            TabOrder = 8
          end
          object TntRadioGroup1: TTntRadioGroup
            Left = 266
            Top = 4
            Width = 204
            Height = 34
            Caption = #36039#26009#24180#20221
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              '0 - '#26412#24180#24230#36039#26009
              '1 - '#27511#21490#36039#26009)
            TabOrder = 9
            Visible = False
          end
        end
      end
      object PanelGrid: TPanel
        Left = 0
        Top = 73
        Width = 786
        Height = 360
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object TntDBGrid1: TTntDBGrid
          Left = 0
          Top = 0
          Width = 786
          Height = 360
          Align = alClient
          DataSource = DataSource1
          FixedColor = clSkyBlue
          ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'emp_id'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'emp_chs'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'department'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'work_date'
              Width = 69
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'clas_chs'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'casting_b'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'casting_e'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'late'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'early'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'work_time'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'over_time'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'left_time'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'out_time'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ab_time'
              Width = 43
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ab_code'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'week_day'
              Visible = True
            end>
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
    OnCalcFields = ADOQuery1CalcFields
    Parameters = <>
    SQL.Strings = (
      'select  * from [tempdbf].[dbo].Tmp_hrd_fhrd217_report')
    Left = 168
    object ADOQuery1emp_id: TWideStringField
      FieldName = 'emp_id'
      Size = 6
    end
    object ADOQuery1emp_chs: TWideStringField
      DisplayWidth = 8
      FieldName = 'emp_chs'
    end
    object ADOQuery1department: TWideStringField
      DisplayWidth = 20
      FieldName = 'department'
      Size = 50
    end
    object ADOQuery1work_date: TDateTimeField
      DisplayWidth = 7
      FieldName = 'work_date'
    end
    object ADOQuery1clas_chs: TWideStringField
      DisplayWidth = 6
      FieldName = 'clas_chs'
      Size = 8
    end
    object ADOQuery1casting_b: TStringField
      FieldName = 'casting_b'
      Size = 4
    end
    object ADOQuery1casting_e: TStringField
      FieldName = 'casting_e'
      Size = 4
    end
    object ADOQuery1late: TStringField
      FieldName = 'late'
      FixedChar = True
      Size = 1
    end
    object ADOQuery1early: TStringField
      FieldName = 'early'
      FixedChar = True
      Size = 1
    end
    object ADOQuery1work_time: TStringField
      FieldName = 'work_time'
      Size = 4
    end
    object ADOQuery1over_time: TStringField
      FieldName = 'over_time'
      Size = 4
    end
    object ADOQuery1left_time: TStringField
      FieldName = 'left_time'
      Size = 4
    end
    object ADOQuery1out_time: TStringField
      FieldName = 'out_time'
      Size = 4
    end
    object ADOQuery1ab_time: TStringField
      FieldName = 'ab_time'
      Size = 4
    end
    object ADOQuery1ab_code: TStringField
      FieldName = 'ab_code'
      Size = 4
    end
    object ADOQuery1week_day: TWideStringField
      FieldName = 'week_day'
      OnGetText = ADOQuery1week_dayGetText
      Size = 2
    end
  end
  object PrintDialog1: TPrintDialog
    Left = 664
    Top = 180
  end
  object ADOStoredProc1: TADOStoredProc
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    ProcedureName = 'fproc_emp;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
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
        Name = '@emp_name'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 10
        Value = Null
      end
      item
        Name = '@sex_code'
        Attributes = [paNullable]
        DataType = ftString
        Size = 1
        Value = Null
      end>
    Left = 136
    Top = 2
  end
end
