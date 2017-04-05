object Formfhrd307: TFormfhrd307
  Left = 149
  Top = 192
  Width = 799
  Height = 518
  Caption = 'Formfhrd307'
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
    Width = 791
    Height = 45
    Align = alTop
    Caption = #28023#22806#24185#37096#31649#29702'___'#34218#36039#26597#35426
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
    Width = 791
    Height = 75
    Align = alTop
    Caption = #26781#20214
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    DesignSize = (
      791
      75)
    object TntLabel1: TTntLabel
      Left = 8
      Top = 16
      Width = 65
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #26376#20221
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object TntLabel6: TTntLabel
      Left = 145
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
    object TntLabel10: TTntLabel
      Left = 125
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
    object TntLabel2: TTntLabel
      Left = 360
      Top = 48
      Width = 63
      Height = 13
      Caption = #30070#26376#21295#29575#65306' '
    end
    object month: TTntEdit
      Left = 72
      Top = 13
      Width = 44
      Height = 21
      Hint = 'yyyymm'
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
      MaxLength = 6
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object deptBegCob: TTntComboBox
      Left = 217
      Top = 13
      Width = 137
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
      ItemHeight = 13
      ParentFont = False
      TabOrder = 1
    end
    object deptEndCob: TTntComboBox
      Left = 360
      Top = 13
      Width = 141
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
      ItemHeight = 13
      ParentFont = False
      TabOrder = 2
    end
    object empIdBeg: TTntEdit
      Left = 217
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
      ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
      MaxLength = 6
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
    end
    object empIdEnd: TTntEdit
      Left = 280
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
      ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
      MaxLength = 6
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
    end
    object selectData: TTntBitBtn
      Left = 703
      Top = 15
      Width = 75
      Height = 22
      Anchors = [akTop, akRight]
      Caption = #26597#35426
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = selectDataClick
    end
    object prnData: TTntBitBtn
      Left = 703
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
      TabOrder = 6
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
    object PrintPanel: TTntPanel
      Left = 516
      Top = 11
      Width = 173
      Height = 59
      BevelOuter = bvNone
      TabOrder = 7
      OnClick = PrintPanelClick
      object totalBill: TTntRadioButton
        Left = 10
        Top = 1
        Width = 97
        Height = 17
        Caption = #34218#36039#21295#32317#34920
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object salaryBill: TTntRadioButton
        Left = 10
        Top = 20
        Width = 97
        Height = 17
        Caption = #34218#36039#26781
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        TabStop = True
      end
      object nightBill: TTntRadioButton
        Left = 10
        Top = 38
        Width = 97
        Height = 17
        Caption = #22812#29677#27941#36028#34920
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Visible = False
      end
    end
    object TntEdit1: TTntEdit
      Left = 428
      Top = 44
      Width = 71
      Height = 21
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
    end
  end
  object TntGroupBox2: TTntGroupBox
    Left = 0
    Top = 120
    Width = 791
    Height = 364
    Align = alClient
    Caption = #28687#35261#25976#25818
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object salGrid: TTntDBGrid
      Left = 2
      Top = 15
      Width = 787
      Height = 347
      Align = alClient
      DataSource = salaryDataSource
      FixedColor = clSkyBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clRed
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnTitleClick = salGridTitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'dept_code'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'emp_id'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'emp_name'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'pst_code'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 45
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'actu_sal'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 46
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'sal_bas'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'sal_frn'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'fix_add'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'f_award'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'adjust'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ask_pay'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'night_amt'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 46
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dinner_price'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 46
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'actu_sal'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 46
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'actu_usd'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'local_uamt'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'bank_usal'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'night1_duty'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'night2_duty'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'night3_duty'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Visible = True
        end>
    end
  end
  object salaryQry: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    AfterScroll = salaryQryAfterScroll
    OnCalcFields = salaryQryCalcFields
    Parameters = <>
    SQL.Strings = (
      'select top 1 * from fhrd_salary A')
    Left = 112
    Top = 220
    object salaryQrysal_month: TWideStringField
      FieldName = 'sal_month'
      FixedChar = True
      Size = 6
    end
    object salaryQryemp_id: TWideStringField
      FieldName = 'emp_id'
      FixedChar = True
      Size = 6
    end
    object salaryQryemp_name: TStringField
      FieldKind = fkCalculated
      FieldName = 'emp_name'
      Calculated = True
    end
    object salaryQrypst_code: TStringField
      FieldName = 'pst_code'
      Size = 2
    end
    object salaryQrypst_name: TStringField
      FieldKind = fkCalculated
      FieldName = 'pst_name'
      Calculated = True
    end
    object salaryQrydept_code: TStringField
      FieldName = 'dept_code'
      Size = 6
    end
    object salaryQrydept_name: TStringField
      FieldKind = fkCalculated
      FieldName = 'dept_name'
      Calculated = True
    end
    object salaryQryemp_etdt: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'emp_etdt'
      Calculated = True
    end
    object salaryQryemp_gvdt: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'emp_gvdt'
      Calculated = True
    end
    object salaryQrysal_bas: TBCDField
      FieldName = 'sal_bas'
      Precision = 6
      Size = 2
    end
    object salaryQrysal_frn: TBCDField
      FieldName = 'sal_frn'
      Precision = 6
      Size = 2
    end
    object salaryQryf_award: TBCDField
      FieldName = 'f_award'
      Precision = 6
      Size = 2
    end
    object salaryQryfix_add: TFloatField
      FieldName = 'fix_add'
    end
    object salaryQryadjust: TBCDField
      FieldName = 'adjust'
      Precision = 6
      Size = 2
    end
    object salaryQryask_pay: TBCDField
      FieldName = 'ask_pay'
      Precision = 6
      Size = 2
    end
    object salaryQrynight_amt: TBCDField
      FieldName = 'night_amt'
      Precision = 6
      Size = 2
    end
    object salaryQrydinner_price: TBCDField
      FieldName = 'dinner_price'
      Precision = 6
      Size = 2
    end
    object salaryQryactu_sal: TBCDField
      FieldName = 'actu_sal'
      Precision = 9
      Size = 2
    end
    object salaryQrylocal_amt: TBCDField
      FieldName = 'local_amt'
      Precision = 6
      Size = 2
    end
    object salaryQryactu_usd: TFloatField
      FieldName = 'actu_usd'
    end
    object salaryQrybank_sal: TBCDField
      FieldName = 'bank_sal'
      Precision = 9
      Size = 2
    end
    object salaryQrynight1_price: TBCDField
      FieldName = 'night1_price'
      Precision = 6
      Size = 2
    end
    object salaryQrynight2_price: TBCDField
      FieldName = 'night2_price'
      Precision = 6
      Size = 2
    end
    object salaryQrynight3_price: TBCDField
      FieldName = 'night3_price'
      Precision = 6
      Size = 2
    end
    object salaryQrynight1_duty: TBCDField
      FieldName = 'night1_duty'
      Precision = 6
      Size = 1
    end
    object salaryQrynight2_duty: TBCDField
      FieldName = 'night2_duty'
      Precision = 6
      Size = 1
    end
    object salaryQrynight3_duty: TBCDField
      FieldName = 'night3_duty'
      Precision = 6
      Size = 1
    end
    object salaryQrylocal_uamt: TFloatField
      FieldName = 'local_uamt'
    end
    object salaryQrybank_usal: TFloatField
      FieldName = 'bank_usal'
    end
  end
  object salaryDataSource: TDataSource
    DataSet = salaryQry
    Left = 152
    Top = 220
  end
  object TntSaveDialog1: TTntSaveDialog
    Left = 320
    Top = 208
  end
end
