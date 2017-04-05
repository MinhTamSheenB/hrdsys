object FormSal14: TFormSal14
  Left = 201
  Top = 110
  Width = 800
  Height = 500
  Caption = 'FormSal14'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 466
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object PanelTitle: TTntPanel
      Left = 0
      Top = 0
      Width = 792
      Height = 36
      Align = alTop
      BevelOuter = bvNone
      Caption = 'sal14_titl'
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
      Width = 792
      Height = 430
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object PanelQuery: TPanel
        Left = 0
        Top = 0
        Width = 792
        Height = 81
        Align = alTop
        TabOrder = 0
        object TntGroupBox1: TTntGroupBox
          Left = 1
          Top = 1
          Width = 790
          Height = 79
          Align = alClient
          Caption = 'query_condition'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object TntLabel6: TTntLabel
            Left = 8
            Top = 18
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
          object TntLabel1: TTntLabel
            Left = 200
            Top = 16
            Width = 70
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'fld_pst_code'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Palatino Linotype'
            Font.Style = []
            ParentFont = False
          end
          object TntLabel2: TTntLabel
            Left = 443
            Top = 17
            Width = 85
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'fld_valid_date'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Palatino Linotype'
            Font.Style = []
            ParentFont = False
          end
          object TntLabel10: TTntLabel
            Left = 8
            Top = 49
            Width = 81
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
          object edit_begin: TTntEdit
            Left = 80
            Top = 14
            Width = 55
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
            MaxLength = 6
            ParentFont = False
            TabOrder = 0
          end
          object edit_end: TTntEdit
            Left = 138
            Top = 14
            Width = 55
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
            MaxLength = 6
            ParentFont = False
            TabOrder = 1
          end
          object Btn_Search: TTntBitBtn
            Left = 704
            Top = 16
            Width = 81
            Height = 25
            Caption = '(&q)uery'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            OnClick = Btn_SearchClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
              555555555555555555555555555555555555555555FF55555555555559055555
              55555555577FF5555555555599905555555555557777F5555555555599905555
              555555557777FF5555555559999905555555555777777F555555559999990555
              5555557777777FF5555557990599905555555777757777F55555790555599055
              55557775555777FF5555555555599905555555555557777F5555555555559905
              555555555555777FF5555555555559905555555555555777FF55555555555579
              05555555555555777FF5555555555557905555555555555777FF555555555555
              5990555555555555577755555555555555555555555555555555}
            NumGlyphs = 2
          end
          object CobPstBegin: TTntComboBox
            Left = 270
            Top = 12
            Width = 85
            Height = 21
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            ItemHeight = 13
            ParentFont = False
            TabOrder = 3
          end
          object CobPstEnd: TTntComboBox
            Left = 357
            Top = 12
            Width = 85
            Height = 21
            Style = csDropDownList
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
          object RbInWork: TTntRadioButton
            Left = 456
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
            TabOrder = 5
            TabStop = True
          end
          object RbLeftWork: TTntRadioButton
            Left = 536
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
            TabOrder = 6
          end
          object RbAllWork: TTntRadioButton
            Left = 616
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
            TabOrder = 7
          end
          object BtnPrint: TTntBitBtn
            Left = 704
            Top = 47
            Width = 81
            Height = 25
            Caption = #25171#21360
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Palatino Linotype'
            Font.Style = []
            ParentFont = False
            TabOrder = 8
            OnClick = BtnPrintClick
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
          object dt_valid_s: TTntDateTimePicker
            Left = 528
            Top = 13
            Width = 85
            Height = 21
            Date = 36526.583332060190000000
            Time = 36526.583332060190000000
            ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
            TabOrder = 9
          end
          object CobDeptBegin: TTntComboBox
            Left = 94
            Top = 47
            Width = 160
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            ItemHeight = 13
            ParentFont = False
            TabOrder = 10
          end
          object CobDeptEnd: TTntComboBox
            Left = 256
            Top = 47
            Width = 160
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            ItemHeight = 13
            ParentFont = False
            TabOrder = 11
          end
          object dt_valid_e: TTntDateTimePicker
            Left = 614
            Top = 13
            Width = 85
            Height = 21
            Date = 38953.583332060190000000
            Time = 38953.583332060190000000
            ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
            TabOrder = 12
          end
        end
      end
      object PanelGrid: TPanel
        Left = 0
        Top = 81
        Width = 792
        Height = 349
        Align = alClient
        TabOrder = 1
        object DBGrid1: TTntDBGrid
          Left = 1
          Top = 1
          Width = 790
          Height = 347
          Align = alClient
          DataSource = DataSource1
          FixedColor = clSkyBlue
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete]
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
              Width = 68
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'name_vim'
              Width = 109
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'pst_code'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'valid_date'
              Width = 73
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'grade_pay'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'sal_base'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'sal_mgmt'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'sal_tech'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'pst_pay'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'envir_pay'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'sal_spec'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'sal_achi'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'full_awd'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'gong_pay'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'other_pay'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'total'
              Visible = True
            end>
        end
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 232
  end
  object ADOQuery1: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterScroll = ADOQuery1AfterScroll
    OnCalcFields = ADOQuery1CalcFields
    Parameters = <>
    SQL.Strings = (
      'select top 1 * from hrd_emp')
    Left = 200
    Top = 2
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
    object ADOQuery1dept_code: TStringField
      FieldName = 'dept_code'
      Size = 6
    end
    object ADOQuery1pst_code: TStringField
      FieldName = 'pst_code'
      Size = 2
    end
    object ADOQuery1edu_code: TStringField
      FieldName = 'edu_code'
      Visible = False
      Size = 2
    end
    object ADOQuery1epindt: TDateTimeField
      FieldName = 'epindt'
      Visible = False
    end
    object ADOQuery1valid_date: TDateTimeField
      FieldName = 'valid_date'
    end
    object ADOQuery1sal_grade: TStringField
      FieldKind = fkCalculated
      FieldName = 'sal_grade'
      Size = 4
      Calculated = True
    end
    object ADOQuery1sal_base: TBCDField
      FieldKind = fkCalculated
      FieldName = 'sal_base'
      Precision = 19
      Calculated = True
    end
    object ADOQuery1sal_mgmt: TBCDField
      FieldKind = fkCalculated
      FieldName = 'sal_mgmt'
      Precision = 19
      Calculated = True
    end
    object ADOQuery1sal_tech: TBCDField
      FieldKind = fkCalculated
      FieldName = 'sal_tech'
      Precision = 19
      Calculated = True
    end
    object ADOQuery1pst_pay: TBCDField
      FieldKind = fkCalculated
      FieldName = 'pst_pay'
      Precision = 19
      Calculated = True
    end
    object ADOQuery1envir_pay: TBCDField
      FieldKind = fkCalculated
      FieldName = 'envir_pay'
      Precision = 19
      Calculated = True
    end
    object ADOQuery1grade_pay: TBCDField
      FieldKind = fkCalculated
      FieldName = 'grade_pay'
      Precision = 19
      Calculated = True
    end
    object ADOQuery1sal_spec: TBCDField
      FieldKind = fkCalculated
      FieldName = 'sal_spec'
      Precision = 19
      Calculated = True
    end
    object ADOQuery1sal_achi: TBCDField
      FieldKind = fkCalculated
      FieldName = 'sal_achi'
      Precision = 19
      Calculated = True
    end
    object ADOQuery1full_awd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'full_awd'
      Calculated = True
    end
    object ADOQuery1gong_pay: TFloatField
      FieldKind = fkCalculated
      FieldName = 'gong_pay'
      Calculated = True
    end
    object ADOQuery1other_pay: TBCDField
      FieldKind = fkCalculated
      FieldName = 'other_pay'
      Precision = 19
      Calculated = True
    end
    object ADOQuery1total: TFloatField
      FieldKind = fkCalculated
      FieldName = 'total'
      Calculated = True
    end
  end
end
