object Formfhrd305: TFormfhrd305
  Left = 176
  Top = 184
  Width = 797
  Height = 521
  Caption = 'Formfhrd305'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object TntPanel1: TTntPanel
    Left = 0
    Top = 0
    Width = 789
    Height = 45
    Align = alTop
    Caption = #28023#22806#24185#37096#31649#29702'___'#34218#36039#32080#27083#26597#35426
    Color = clCream
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object TntGroupBox1: TTntGroupBox
    Left = 0
    Top = 45
    Width = 789
    Height = 74
    Align = alTop
    Caption = #26781#20214
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object TntLabel10: TTntLabel
      Left = 5
      Top = 16
      Width = 90
      Height = 19
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'fld_department'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Palatino Linotype'
      Font.Style = []
      ParentFont = False
    end
    object TntLabel6: TTntLabel
      Left = 25
      Top = 48
      Width = 69
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
    object selData: TTntBitBtn
      Left = 696
      Top = 12
      Width = 75
      Height = 22
      Caption = #26597#35426
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = selDataClick
    end
    object prnData: TTntBitBtn
      Left = 696
      Top = 42
      Width = 75
      Height = 22
      Caption = #21015#21360
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = prnDataClick
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
    object deptBegCob: TTntComboBox
      Left = 97
      Top = 13
      Width = 137
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 2
    end
    object deptEndCob: TTntComboBox
      Left = 240
      Top = 13
      Width = 141
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 3
    end
    object empIdBeg: TTntEdit
      Left = 97
      Top = 43
      Width = 44
      Height = 21
      Hint = 'ssssss'
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 6
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
    end
    object empIdEnd: TTntEdit
      Left = 160
      Top = 43
      Width = 44
      Height = 21
      Hint = 'ssssss'
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 6
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
    end
    object RbAllWork: TTntRadioButton
      Left = 504
      Top = 48
      Width = 75
      Height = 17
      Caption = 'all'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object RbLeftWork: TTntRadioButton
      Left = 424
      Top = 48
      Width = 75
      Height = 17
      Caption = 'left_work'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
    object RbInWork: TTntRadioButton
      Left = 344
      Top = 48
      Width = 75
      Height = 17
      Caption = 'in_work'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      TabStop = True
    end
  end
  object TntGroupBox2: TTntGroupBox
    Left = 0
    Top = 119
    Width = 789
    Height = 368
    Align = alClient
    Caption = #28687#35261#25976#25818
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object salStrucGrid: TTntDBGrid
      Left = 2
      Top = 15
      Width = 785
      Height = 351
      Align = alClient
      DataSource = empSalStruDataSource
      FixedColor = clSkyBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnTitleClick = salStrucGridTitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'emp_id'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'emp_name'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dept_code'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dept_title'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'pst_code'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'pst_name'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valid_date'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'base_amt'
          Width = 48
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'frn_amt'
          Width = 48
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'faward_amt'
          Width = 48
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'over_amt'
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'actu_sal'
          Width = 48
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'local_amt'
          Width = 48
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'bank_sal'
          Width = 48
          Visible = True
        end>
    end
  end
  object empSalStruQry: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    AfterScroll = empSalStruQryAfterScroll
    OnCalcFields = empSalStruQryCalcFields
    Parameters = <>
    SQL.Strings = (
      'select * from fhrd_tranhist where emp_id='#39'-1'#39';')
    Left = 104
    Top = 203
    object empSalStruQryupd_user: TWideStringField
      FieldName = 'upd_user'
    end
    object empSalStruQryupd_date: TDateTimeField
      FieldName = 'upd_date'
    end
    object empSalStruQryvalid_date: TDateTimeField
      FieldName = 'valid_date'
    end
    object empSalStruQryemp_id: TWideStringField
      FieldName = 'emp_id'
      FixedChar = True
      Size = 6
    end
    object empSalStruQryemp_name: TStringField
      FieldKind = fkCalculated
      FieldName = 'emp_name'
      Calculated = True
    end
    object empSalStruQrydept_code: TWideStringField
      FieldName = 'dept_code'
      FixedChar = True
      Size = 6
    end
    object empSalStruQrydept_title: TWideStringField
      DisplayWidth = 25
      FieldName = 'dept_title'
      Size = 50
    end
    object empSalStruQrypst_code: TWideStringField
      FieldName = 'pst_code'
      FixedChar = True
      Size = 2
    end
    object empSalStruQrypst_name: TStringField
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'pst_name'
      Calculated = True
    end
    object empSalStruQrytryout: TStringField
      FieldName = 'tryout'
      FixedChar = True
      Size = 1
    end
    object empSalStruQrybase_amt: TBCDField
      FieldName = 'base_amt'
      Precision = 6
      Size = 2
    end
    object empSalStruQryfrn_amt: TBCDField
      FieldName = 'frn_amt'
      Precision = 6
      Size = 2
    end
    object empSalStruQryfaward_amt: TBCDField
      FieldName = 'faward_amt'
      Precision = 6
      Size = 2
    end
    object empSalStruQryover_amt: TBCDField
      FieldName = 'over_amt'
      Precision = 6
      Size = 2
    end
    object empSalStruQryactu_sal: TFloatField
      FieldKind = fkCalculated
      FieldName = 'actu_sal'
      Calculated = True
    end
    object empSalStruQrylocal_amt: TBCDField
      FieldName = 'local_amt'
      Precision = 6
      Size = 2
    end
    object empSalStruQrybank_sal: TFloatField
      FieldKind = fkCalculated
      FieldName = 'bank_sal'
      Calculated = True
    end
  end
  object empSalStruDataSource: TDataSource
    DataSet = empSalStruQry
    Left = 144
    Top = 203
  end
end
