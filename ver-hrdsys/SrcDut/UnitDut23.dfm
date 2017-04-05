object FormDut23: TFormDut23
  Left = 1
  Top = 18
  Width = 794
  Height = 504
  Caption = 'FormDut23'
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
      Caption = 'dut23_titl'
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
          object DTBegin: TTntDateTimePicker
            Left = 115
            Top = 14
            Width = 90
            Height = 21
            Date = 38565.000000000000000000
            Time = 38565.000000000000000000
            TabOrder = 3
          end
          object DTEnd: TTntDateTimePicker
            Left = 211
            Top = 14
            Width = 90
            Height = 21
            Date = 38565.000000000000000000
            Time = 38565.000000000000000000
            TabOrder = 4
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
              FieldName = 'emp_id'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'emp_chs'
              Width = 66
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'spc_id'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'er_date'
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'clas_chs'
              Width = 58
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'seg_code'
              Width = 44
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
              FieldName = 'er_time'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ps_time'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'err_chs'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'upd_user'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'upd_date'
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
      'select * from hrd_dut_erhist A,hrd_emp B where A.emp_id=B.emp_id')
    Left = 168
    object ADOQuery1dept_code: TStringField
      FieldName = 'dept_code'
      Size = 6
    end
    object ADOQuery1emp_id: TStringField
      FieldName = 'emp_id'
      Size = 6
    end
    object ADOQuery1spc_id: TStringField
      FieldName = 'spc_id'
      Size = 10
    end
    object ADOQuery1emp_chs: TWideStringField
      FieldName = 'emp_chs'
      Size = 10
    end
    object ADOQuery1er_date: TDateTimeField
      DisplayWidth = 10
      FieldName = 'er_date'
    end
    object ADOQuery1clas_code: TStringField
      FieldName = 'clas_code'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object ADOQuery1clas_chs: TStringField
      DisplayWidth = 7
      FieldKind = fkCalculated
      FieldName = 'clas_chs'
      Size = 10
      Calculated = True
    end
    object ADOQuery1seg_code: TStringField
      DisplayWidth = 6
      FieldName = 'seg_code'
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
    object ADOQuery1er_time: TStringField
      FieldName = 'er_time'
      Size = 4
    end
    object ADOQuery1ps_time: TStringField
      FieldName = 'ps_time'
      Size = 4
    end
    object ADOQuery1late: TStringField
      FieldName = 'late'
      Size = 2
    end
    object ADOQuery1early: TStringField
      FieldName = 'early'
      Size = 2
    end
    object ADOQuery1status: TStringField
      FieldName = 'status'
      Size = 1
    end
    object ADOQuery1er_reason: TStringField
      FieldName = 'er_reason'
      Visible = False
      Size = 2
    end
    object ADOQuery1err_chs: TWideStringField
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'err_chs'
      Calculated = True
    end
    object ADOQuery1upd_user: TStringField
      DisplayWidth = 6
      FieldName = 'upd_user'
      Size = 16
    end
    object ADOQuery1upd_date: TDateTimeField
      FieldName = 'upd_date'
    end
  end
  object PrintDialog1: TPrintDialog
    Left = 664
    Top = 180
  end
end
