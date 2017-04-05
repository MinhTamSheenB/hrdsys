object FormHrd21: TFormHrd21
  Left = 204
  Top = 174
  Width = 794
  Height = 503
  Caption = 'FormHrd21'
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
      Caption = 'hrd21_titl'
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
          object RbEmp: TTntRadioButton
            Left = 216
            Top = 19
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
            Left = 299
            Top = 16
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
          end
          object EditEmpEnd: TTntEdit
            Left = 363
            Top = 16
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
            Visible = False
          end
          object RbDept: TTntRadioButton
            Left = 440
            Top = 19
            Width = 80
            Height = 17
            Caption = 'by_deptcode'
            Checked = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            TabStop = True
          end
          object CobDeptBegin: TTntComboBox
            Left = 523
            Top = 17
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
          end
          object Panel2: TPanel
            Left = 683
            Top = 11
            Width = 89
            Height = 34
            BevelOuter = bvNone
            TabOrder = 5
            object BtnQuery: TTntButton
              Left = 4
              Top = 5
              Width = 75
              Height = 25
              Caption = 'query'
              Default = True
              TabOrder = 0
              OnClick = BtnQueryClick
            end
          end
          object Panel7: TPanel
            Left = 2
            Top = 15
            Width = 185
            Height = 32
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 6
            object Rb_out: TTntRadioButton
              Left = 8
              Top = 8
              Width = 73
              Height = 17
              Caption = 'hrd21_chg_out'
              Checked = True
              TabOrder = 0
              TabStop = True
            end
            object Rb_in: TTntRadioButton
              Left = 104
              Top = 7
              Width = 73
              Height = 17
              Caption = 'hrd21_chg_in'
              TabOrder = 1
            end
          end
        end
      end
      object PanelGrid: TPanel
        Left = 0
        Top = 49
        Width = 786
        Height = 343
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object TntDBGrid1: TTntDBGrid
          Left = 0
          Top = 0
          Width = 786
          Height = 343
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
          OnTitleClick = TntDBGrid1TitleClick
          Columns = <
            item
              Expanded = False
              FieldName = 'dept_code'
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
              Width = 79
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'name_vim'
              Width = 169
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'epid_no'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'epindt'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'pst_code'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'spc_id'
              Visible = True
            end>
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 392
        Width = 786
        Height = 41
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        object Panel6: TPanel
          Left = 185
          Top = 0
          Width = 601
          Height = 41
          Align = alClient
          TabOrder = 0
          object TntLabel1: TTntLabel
            Left = 149
            Top = 16
            Width = 180
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            BiDiMode = bdLeftToRight
            Caption = 'hrd21_new_dept'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentBiDiMode = False
            ParentFont = False
          end
          object CobNewDept: TTntComboBox
            Left = 339
            Top = 12
            Width = 150
            Height = 21
            Color = clWhite
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            ItemHeight = 13
            ParentFont = False
            TabOrder = 0
          end
          object BtnIn: TTntBitBtn
            Left = 494
            Top = 8
            Width = 90
            Height = 25
            Caption = 'hrd21_chg_in'
            Enabled = False
            TabOrder = 1
            OnClick = BtnInClick
            Kind = bkOK
          end
        end
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 185
          Height = 41
          Align = alLeft
          TabOrder = 1
          object BtnOut: TTntBitBtn
            Left = 38
            Top = 8
            Width = 90
            Height = 25
            Caption = 'hrd21_chg_out'
            Enabled = False
            TabOrder = 0
            OnClick = BtnOutClick
            Kind = bkOK
          end
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
    Parameters = <>
    SQL.Strings = (
      'select  * from hrd_emp')
    Left = 168
    object ADOQuery1upd_user: TStringField
      FieldName = 'upd_user'
      Size = 16
    end
    object ADOQuery1upd_date: TDateTimeField
      FieldName = 'upd_date'
    end
    object ADOQuery1dept_code: TStringField
      FieldName = 'dept_code'
      Size = 6
    end
    object ADOQuery1emp_id: TStringField
      FieldName = 'emp_id'
      Size = 6
    end
    object ADOQuery1emp_chs: TWideStringField
      FieldName = 'emp_chs'
      Size = 30
    end
    object ADOQuery1name_vim: TWideStringField
      FieldName = 'name_vim'
      Size = 50
    end
    object ADOQuery1epid_no: TStringField
      FieldName = 'epid_no'
      Size = 10
    end
    object ADOQuery1epindt: TDateTimeField
      FieldName = 'epindt'
    end
    object ADOQuery1pst_code: TStringField
      FieldName = 'pst_code'
      Size = 2
    end
    object ADOQuery1spc_id: TStringField
      FieldName = 'spc_id'
      Size = 10
    end
  end
  object PrintDialog1: TPrintDialog
    Left = 664
    Top = 180
  end
  object ADOQuery2: TADOQuery
    Connection = DMHrdsys.conn
    LockType = ltBatchOptimistic
    Parameters = <>
    Left = 248
  end
  object ADOQuery3: TADOQuery
    Connection = DMHrdsys.conn
    LockType = ltBatchOptimistic
    Parameters = <>
    Left = 288
  end
end
