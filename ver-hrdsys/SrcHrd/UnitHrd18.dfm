object FormHrd18: TFormHrd18
  Left = 1
  Top = 19
  Width = 794
  Height = 503
  Caption = 'FormHrd18'
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
      Caption = 'hrd18_titl'
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
            Left = 282
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
            Left = 7
            Top = 21
            Width = 34
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'No.'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'MS PGothic'
            Font.Style = []
            ParentFont = False
          end
          object EditEmpBegin: TTntEdit
            Left = 43
            Top = 16
            Width = 90
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            TabOrder = 0
          end
          object EditEmpEnd: TTntEdit
            Left = 139
            Top = 16
            Width = 90
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            TabOrder = 1
          end
          object DTPickBegin: TTntDateTimePicker
            Left = 379
            Top = 14
            Width = 90
            Height = 21
            Date = 38565.000000000000000000
            Time = 38565.000000000000000000
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            TabOrder = 2
          end
          object DTPickEnd: TTntDateTimePicker
            Left = 475
            Top = 14
            Width = 90
            Height = 21
            Date = 38595.000000000000000000
            Time = 38595.000000000000000000
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            TabOrder = 3
          end
          object BtnQuery: TTntButton
            Left = 692
            Top = 13
            Width = 75
            Height = 25
            Caption = 'query'
            Default = True
            TabOrder = 4
            OnClick = BtnQueryClick
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
        object TntDBGrid1: TTntDBGrid
          Left = 0
          Top = 0
          Width = 512
          Height = 384
          Align = alClient
          DataSource = DataSource1
          FixedColor = clSkyBlue
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Palatino Linotype'
          Font.Style = []
          ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Palatino Linotype'
          TitleFont.Style = []
          OnTitleClick = TntDBGrid1TitleClick
          Columns = <
            item
              Expanded = False
              FieldName = 'data_id'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'emp_chs'
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'name_vim'
              Width = 166
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'epid_no'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'epbirth'
              Width = 75
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'epsexd'
              Visible = True
            end>
        end
        object Panel2: TPanel
          Left = 512
          Top = 0
          Width = 274
          Height = 384
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 1
          object Panel3: TPanel
            Left = 0
            Top = 343
            Width = 274
            Height = 41
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 0
            object BtnSave: TTntBitBtn
              Left = 104
              Top = 8
              Width = 75
              Height = 25
              Caption = '(&s)ave'
              Enabled = False
              TabOrder = 0
              OnClick = BtnSaveClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
                00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
                00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
                00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
                00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
                00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
                00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
                0003737FFFFFFFFF7F7330099999999900333777777777777733}
              NumGlyphs = 2
            end
          end
          object TntGroupBox3: TTntGroupBox
            Left = 0
            Top = 0
            Width = 274
            Height = 343
            Align = alClient
            Caption = 'hrd08_commany_info'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 1
            object TntLabel45: TTntLabel
              Left = 10
              Top = 82
              Width = 100
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'fld_dept_code'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -13
              Font.Name = 'MS PGothic'
              Font.Style = []
              ParentFont = False
            end
            object TntLabel47: TTntLabel
              Left = 10
              Top = 118
              Width = 100
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'fld_epindt'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -13
              Font.Name = 'MS PGothic'
              Font.Style = []
              ParentFont = False
            end
            object TntLabel46: TTntLabel
              Left = 10
              Top = 228
              Width = 100
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'fld_spc_id'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -13
              Font.Name = 'MS PGothic'
              Font.Style = []
              ParentFont = False
            end
            object TntLabel48: TTntLabel
              Left = 10
              Top = 270
              Width = 100
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'fld_epledt'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -13
              Font.Name = 'MS PGothic'
              Font.Style = []
              ParentFont = False
            end
            object TntLabel49: TTntLabel
              Left = 10
              Top = 192
              Width = 100
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'fld_pst_code'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -13
              Font.Name = 'MS PGothic'
              Font.Style = []
              ParentFont = False
            end
            object sb_epledt: TTntSpeedButton
              Left = 215
              Top = 264
              Width = 23
              Height = 22
              Caption = '...'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object TntLabel11: TTntLabel
              Left = 241
              Top = 83
              Width = 5
              Height = 16
              Caption = '*'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object TntLabel12: TTntLabel
              Left = 249
              Top = 194
              Width = 5
              Height = 16
              Caption = '*'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object TntLabel13: TTntLabel
              Left = 215
              Top = 112
              Width = 5
              Height = 16
              Caption = '*'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object TntLabel15: TTntLabel
              Left = 10
              Top = 307
              Width = 100
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'fld_left_reason'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -13
              Font.Name = 'MS PGothic'
              Font.Style = []
              ParentFont = False
            end
            object TntLabel16: TTntLabel
              Left = 703
              Top = 16
              Width = 5
              Height = 16
              Caption = '*'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              Visible = False
            end
            object TntLabel50: TTntLabel
              Left = 10
              Top = 155
              Width = 100
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'fld_info_code'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -13
              Font.Name = 'MS PGothic'
              Font.Style = []
              ParentFont = False
            end
            object TntLabel2: TTntLabel
              Left = 2
              Top = 52
              Width = 100
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'fld_emp_id'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -13
              Font.Name = 'MS PGothic'
              Font.Style = []
              ParentFont = False
            end
            object TntLabel3: TTntLabel
              Left = 2
              Top = 28
              Width = 100
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'fld_data_id'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -13
              Font.Name = 'MS PGothic'
              Font.Style = []
              ParentFont = False
            end
            object DBEditSpcId: TTntDBEdit
              Left = 115
              Top = 223
              Width = 100
              Height = 21
              DataField = 'spc_id'
              DataSource = DataSource2
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 5
            end
            object DTPickEpindt: TTntDateTimePicker
              Left = 112
              Top = 113
              Width = 100
              Height = 21
              Date = 31048.000000000000000000
              Time = 31048.000000000000000000
              TabOrder = 1
            end
            object DBEditLedt: TTntDBEdit
              Left = 115
              Top = 264
              Width = 100
              Height = 21
              DataField = 'epledt'
              DataSource = DataSource2
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
            end
            object TntDBEdit1: TTntDBEdit
              Left = 115
              Top = 300
              Width = 150
              Height = 21
              DataField = 'left_reason'
              DataSource = DataSource2
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
              ParentFont = False
              TabOrder = 6
            end
            object CobInfo: TTntComboBox
              Left = 113
              Top = 150
              Width = 100
              Height = 21
              Style = csDropDownList
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 13
              ParentFont = False
              TabOrder = 2
            end
            object CobDept: TTntComboBox
              Left = 110
              Top = 79
              Width = 130
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 13
              ParentFont = False
              TabOrder = 0
            end
            object CobProf: TTntComboBox
              Left = 114
              Top = 188
              Width = 130
              Height = 21
              Style = csDropDownList
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 13
              ParentFont = False
              TabOrder = 3
            end
            object TntDBEdit2: TTntDBEdit
              Left = 110
              Top = 47
              Width = 75
              Height = 21
              Color = clSkyBlue
              DataField = 'emp_id'
              DataSource = DataSource2
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 7
            end
            object TntDBEdit3: TTntDBEdit
              Left = 110
              Top = 23
              Width = 100
              Height = 21
              Color = clSkyBlue
              DataField = 'data_id'
              DataSource = DataSource1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 8
            end
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
      'select  * from hrd_person')
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
    object ADOQuery1epbirth: TDateTimeField
      FieldName = 'epbirth'
    end
    object ADOQuery1epsexd: TStringField
      FieldName = 'epsexd'
      Size = 1
    end
    object ADOQuery1ifmarry: TStringField
      FieldName = 'ifmarry'
      Size = 1
    end
    object ADOQuery1epAddrchs: TWideStringField
      FieldName = 'epAddrchs'
      Size = 120
    end
    object ADOQuery1tpAddrchs: TWideStringField
      FieldName = 'tpAddrchs'
      Size = 120
    end
    object ADOQuery1edu_code: TStringField
      FieldName = 'edu_code'
      Size = 2
    end
    object ADOQuery1chs_status: TStringField
      FieldName = 'chs_status'
      FixedChar = True
      Size = 1
    end
    object ADOQuery1eng_status: TStringField
      FieldName = 'eng_status'
      FixedChar = True
      Size = 1
    end
    object ADOQuery1epid_date: TDateTimeField
      FieldName = 'epid_date'
    end
    object ADOQuery1epid_area: TWideStringField
      FieldName = 'epid_area'
    end
    object ADOQuery1name_eng: TWideStringField
      FieldName = 'name_eng'
      Size = 50
    end
    object ADOQuery1name_vim: TWideStringField
      FieldName = 'name_vim'
      Size = 30
    end
    object ADOQuery1epAddrvim: TWideStringField
      FieldName = 'epAddrvim'
      Size = 200
    end
    object ADOQuery1epAddreng: TWideStringField
      FieldName = 'epAddreng'
      Size = 120
    end
    object ADOQuery1tpAddrvim: TWideStringField
      FieldName = 'tpAddrvim'
      Size = 200
    end
    object ADOQuery1tpAddreng: TWideStringField
      FieldName = 'tpAddreng'
      Size = 120
    end
    object ADOQuery1epid_vim: TWideStringField
      FieldName = 'epid_vim'
      Size = 50
    end
    object ADOQuery1epid_eng: TWideStringField
      FieldName = 'epid_eng'
      Size = 50
    end
    object ADOQuery1emp_phone: TStringField
      FieldName = 'emp_phone'
      Size = 30
    end
    object ADOQuery1nation: TWideStringField
      FieldName = 'nation'
      Size = 10
    end
    object ADOQuery1country: TWideStringField
      FieldName = 'country'
      Size = 10
    end
    object ADOQuery1work_year: TWideStringField
      FieldName = 'work_year'
      Size = 10
    end
    object ADOQuery1hope_salary: TBCDField
      FieldName = 'hope_salary'
      Precision = 18
      Size = 0
    end
    object ADOQuery1speciality: TWideStringField
      FieldName = 'speciality'
      Size = 30
    end
    object ADOQuery1mail_date: TDateTimeField
      FieldName = 'mail_date'
    end
    object ADOQuery1re_date: TDateTimeField
      FieldName = 're_date'
    end
    object ADOQuery1matr_date: TDateTimeField
      FieldName = 'matr_date'
    end
  end
  object ADOQuery2: TADOQuery
    Connection = DMHrdsys.conn
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'select top 1 * from hrd_emp')
    Left = 264
    Top = 3
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery2
    Left = 296
    Top = 3
  end
end
