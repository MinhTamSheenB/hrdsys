object FormDut17: TFormDut17
  Left = 169
  Top = 133
  Width = 794
  Height = 504
  Caption = 'FormDut17'
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
      Caption = 'dut17_titl'
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
        Height = 70
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object TntGroupBox1: TTntGroupBox
          Left = 0
          Top = 0
          Width = 786
          Height = 70
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
          object TntLabel1: TTntLabel
            Left = 34
            Top = 44
            Width = 78
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'department'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'MS PGothic'
            Font.Style = []
            ParentFont = False
          end
          object CobDeptBegin: TTntComboBox
            Left = 115
            Top = 39
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
            TabOrder = 0
            OnChange = CobDeptBeginChange
          end
          object CobDeptEnd: TTntComboBox
            Left = 267
            Top = 39
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
            TabOrder = 1
          end
          object Panel2: TPanel
            Left = 439
            Top = 35
            Width = 338
            Height = 30
            BevelOuter = bvNone
            TabOrder = 2
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
            object BtnPrint: TTntBitBtn
              Left = 216
              Top = 3
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
          object DTPickDate: TTntDateTimePicker
            Left = 115
            Top = 14
            Width = 90
            Height = 21
            Date = 38565.000000000000000000
            Time = 38565.000000000000000000
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            TabOrder = 3
          end
          object RbNormal: TTntRadioButton
            Left = 248
            Top = 13
            Width = 125
            Height = 17
            Caption = 'dut17_normal_class'
            Checked = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            TabStop = True
          end
          object RbAbnormal: TTntRadioButton
            Left = 503
            Top = 13
            Width = 125
            Height = 17
            Caption = 'dut17_over_abnormal'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
          end
          object RbNone: TTntRadioButton
            Left = 376
            Top = 13
            Width = 125
            Height = 17
            Caption = 'dut17_over_none'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 6
          end
          object RbLocal: TTntRadioButton
            Left = 632
            Top = 13
            Width = 125
            Height = 17
            Caption = 'dut17_local_abnormal'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 7
          end
        end
      end
      object PanelGrid: TPanel
        Left = 0
        Top = 70
        Width = 786
        Height = 364
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object DBGrid1: TTntDBGrid
          Left = 0
          Top = 0
          Width = 786
          Height = 364
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
          OnTitleClick = DBGrid1TitleClick
          Columns = <
            item
              Expanded = False
              FieldName = 'department'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Palatino Linotype'
              Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'spc_id'
              Visible = True
            end
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
              FieldName = 'name_vim'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Palatino Linotype'
              Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'clas_chs'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'seg_code'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 's_start'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 's_end'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'real_start'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'real_end'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'early'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'late'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'left_time'
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
    AfterScroll = ADOQuery1AfterScroll
    OnCalcFields = ADOQuery1CalcFields
    Parameters = <>
    SQL.Strings = (
      
        'select top 1 C.dept_code+'#39'---'#39'+C.abbr_titl as department,* from ' +
        'hrd_dut_day as A,hrd_emp as B,hrd_dept as C '
      ' where A.emp_id=B.emp_id and B.dept_code=C.dept_code')
    Left = 168
    object ADOQuery1dept_code: TStringField
      FieldName = 'dept_code'
      Visible = False
      Size = 6
    end
    object ADOQuery1department: TWideStringField
      FieldName = 'department'
    end
    object ADOQuery1spc_id: TStringField
      FieldName = 'spc_id'
      Size = 10
    end
    object ADOQuery1emp_id: TStringField
      FieldName = 'emp_id'
      FixedChar = True
      Size = 6
    end
    object ADOQuery1emp_chs: TWideStringField
      FieldName = 'emp_chs'
      Size = 10
    end
    object ADOQuery1name_vim: TWideStringField
      FieldName = 'name_vim'
    end
    object ADOQuery1clas_chs: TStringField
      FieldKind = fkCalculated
      FieldName = 'clas_chs'
      Size = 10
      Calculated = True
    end
    object ADOQuery1clas_code: TStringField
      FieldName = 'clas_code'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object ADOQuery1seg_code: TStringField
      DisplayWidth = 6
      FieldName = 'seg_code'
      FixedChar = True
      Size = 2
    end
    object ADOQuery1s_start: TStringField
      FieldName = 's_start'
      FixedChar = True
      Size = 4
    end
    object ADOQuery1s_end: TStringField
      FieldName = 's_end'
      FixedChar = True
      Size = 4
    end
    object ADOQuery1real_start: TStringField
      DisplayLabel = 'casting_b'
      FieldName = 'real_start'
      FixedChar = True
      Size = 4
    end
    object ADOQuery1real_end: TStringField
      DisplayLabel = 'casting_e'
      FieldName = 'real_end'
      FixedChar = True
      Size = 4
    end
    object ADOQuery1late: TStringField
      FieldName = 'late'
      FixedChar = True
      Size = 2
    end
    object ADOQuery1early: TStringField
      FieldName = 'early'
      FixedChar = True
      Size = 2
    end
    object ADOQuery1wrk_sts: TStringField
      FieldName = 'wrk_sts'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object ADOQuery1left_time: TStringField
      DisplayWidth = 5
      FieldKind = fkCalculated
      FieldName = 'left_time'
      Calculated = True
    end
  end
  object PrintDialog1: TPrintDialog
    Left = 664
    Top = 180
  end
end
