object FormFHrd401: TFormFHrd401
  Left = 182
  Top = 100
  Width = 795
  Height = 502
  Caption = 'FormFHrd401'
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
    Width = 787
    Height = 468
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object PanelTitle: TTntPanel
      Left = 0
      Top = 0
      Width = 787
      Height = 36
      Align = alTop
      BevelOuter = bvNone
      Caption = 'fhrd401_titl'
      Color = clCream
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object PanelCondition: TPanel
      Left = 0
      Top = 36
      Width = 787
      Height = 40
      Align = alTop
      BevelInner = bvLowered
      TabOrder = 1
      object TntLabel19: TTntLabel
        Left = 244
        Top = 15
        Width = 85
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'fast_find'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Palatino Linotype'
        Font.Style = []
        ParentFont = False
      end
      object BtnPrint: TTntBitBtn
        Left = 134
        Top = 7
        Width = 75
        Height = 25
        Caption = #25171#21360
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Palatino Linotype'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
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
      object EditLocation: TTntEdit
        Left = 331
        Top = 9
        Width = 80
        Height = 21
        CharCase = ecUpperCase
        Color = clBtnFace
        Enabled = False
        ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
        MaxLength = 6
        TabOrder = 1
        OnChange = EditLocationChange
      end
      object TntBitBtn1: TTntBitBtn
        Left = 16
        Top = 7
        Width = 105
        Height = 25
        Caption = 'query_condition'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Palatino Linotype'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = TntBitBtn1Click
      end
    end
    object PanelGrid: TPanel
      Left = 0
      Top = 76
      Width = 787
      Height = 252
      Align = alClient
      TabOrder = 2
      object DBGrid1: TTntDBGrid
        Left = 1
        Top = 1
        Width = 785
        Height = 250
        Align = alClient
        DataSource = DataSource1
        FixedColor = clSkyBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Palatino Linotype'
        Font.Style = []
        ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
        ParentFont = False
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
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 49
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
            Width = 57
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'emp_tpid'
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'emp_bidt'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'epsexd'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ifmarry'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'edu_code'
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
            FieldName = 'department'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Palatino Linotype'
            Font.Style = []
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 112
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'pstname'
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
            FieldName = 'emp_etdt'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 67
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'emp_gvdt'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'emp_ledt'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'emp_passport'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'jueding_exp'
            Visible = True
          end>
      end
      object rbInWork: TTntRadioButton
        Left = 4
        Top = 63
        Width = 70
        Height = 17
        Caption = #22312#32887
        Checked = True
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 1
        TabStop = True
        Visible = False
        OnKeyDown = EditMonthKeyDown
      end
      object rbLeftWork: TTntRadioButton
        Left = 100
        Top = 63
        Width = 70
        Height = 17
        Caption = #38626#32887
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 2
        Visible = False
        OnKeyDown = EditMonthKeyDown
      end
      object RbAllWork: TTntRadioButton
        Left = 180
        Top = 63
        Width = 70
        Height = 17
        Caption = #20840#37096
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 3
        Visible = False
        OnKeyDown = EditMonthKeyDown
      end
    end
    object PanelDetail: TPanel
      Left = 0
      Top = 328
      Width = 787
      Height = 140
      Align = alBottom
      TabOrder = 3
      object TntGroupBox4: TTntGroupBox
        Left = 1
        Top = 4
        Width = 785
        Height = 135
        Align = alBottom
        Caption = 'hrd08_detail_info'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Palatino Linotype'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 0
        object TntLabel57: TTntLabel
          Left = 22
          Top = 56
          Width = 100
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'fld_tpAddrvim'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Palatino Linotype'
          Font.Style = []
          ParentFont = False
        end
        object ImagePhoto: TImage
          Left = 680
          Top = 10
          Width = 90
          Height = 120
          Align = alCustom
          Stretch = True
        end
        object TntLabel7: TTntLabel
          Left = 342
          Top = 18
          Width = 100
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'fld_phone'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'MS PGothic'
          Font.Style = []
          ParentFont = False
        end
        object TntLabel8: TTntLabel
          Left = 14
          Top = 21
          Width = 100
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'fld_epid_no'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Palatino Linotype'
          Font.Style = []
          ParentFont = False
        end
        object TntLabel13: TTntLabel
          Left = 22
          Top = 88
          Width = 100
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'fld_emp_airport'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Palatino Linotype'
          Font.Style = []
          ParentFont = False
        end
        object DBEditTaddrVim: TTntDBEdit
          Left = 122
          Top = 51
          Width = 200
          Height = 24
          DataField = 'emp_addr'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Palatino Linotype'
          Font.Style = []
          ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object TntDBEdit2: TTntDBEdit
          Left = 442
          Top = 15
          Width = 120
          Height = 21
          DataField = 'emp_phone'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
          ParentFont = False
          TabOrder = 1
        end
        object TntDBEdit1: TTntDBEdit
          Tag = 20
          Left = 124
          Top = 16
          Width = 120
          Height = 24
          DataField = 'emp_tpid'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Palatino Linotype'
          Font.Style = []
          ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object TntDBEdit3: TTntDBEdit
          Left = 122
          Top = 83
          Width = 200
          Height = 24
          DataField = 'emp_airport'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Palatino Linotype'
          Font.Style = []
          ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
      end
    end
  end
  object TntPanel1: TTntPanel
    Left = 232
    Top = 72
    Width = 417
    Height = 361
    BevelInner = bvLowered
    BevelWidth = 2
    BorderStyle = bsSingle
    TabOrder = 1
    Visible = False
    object TntLabel17: TTntLabel
      Left = 4
      Top = 235
      Width = 79
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'fld_epledt'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Palatino Linotype'
      Font.Style = []
      ParentFont = False
    end
    object TntLabel14: TTntLabel
      Left = 4
      Top = 211
      Width = 79
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'fld_epindt'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Palatino Linotype'
      Font.Style = []
      ParentFont = False
    end
    object TntLabel6: TTntLabel
      Left = 4
      Top = 260
      Width = 79
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'fld_epbirth'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Palatino Linotype'
      Font.Style = []
      ParentFont = False
    end
    object TntLabel10: TTntLabel
      Left = 4
      Top = 86
      Width = 79
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'department'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Palatino Linotype'
      Font.Style = []
      ParentFont = False
    end
    object TntLabel3: TTntLabel
      Left = 4
      Top = 165
      Width = 79
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'fld_epid_no'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Palatino Linotype'
      Font.Style = []
      ParentFont = False
    end
    object TntLabel5: TTntLabel
      Left = 4
      Top = 138
      Width = 79
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'fld_edu_code'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Palatino Linotype'
      Font.Style = []
      ParentFont = False
    end
    object TntLabel11: TTntLabel
      Left = 4
      Top = 112
      Width = 79
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
    object TntLabel4: TTntLabel
      Left = 4
      Top = 59
      Width = 79
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'emp_id'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Palatino Linotype'
      Font.Style = []
      ParentFont = False
    end
    object TntLabel58: TTntLabel
      Left = 5
      Top = 308
      Width = 80
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'fld_epsexd'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'MS PGothic'
      Font.Style = []
      ParentFont = False
    end
    object TntLabel1: TTntLabel
      Left = 4
      Top = 189
      Width = 79
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'fld_spc_id'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Palatino Linotype'
      Font.Style = []
      ParentFont = False
    end
    object TntLabel12: TTntLabel
      Left = 7
      Top = 36
      Width = 79
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'date'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Palatino Linotype'
      Font.Style = []
      ParentFont = False
    end
    object TntLabel50: TTntLabel
      Left = 197
      Top = 35
      Width = 80
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
      Left = 4
      Top = 284
      Width = 79
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'fld_emp_chs'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Palatino Linotype'
      Font.Style = []
      ParentFont = False
    end
    object EditLedtEnd: TTntDateTimePicker
      Left = 189
      Top = 231
      Width = 99
      Height = 21
      Date = 36161.000000000000000000
      Time = 36161.000000000000000000
      ShowCheckbox = True
      Checked = False
      ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
      TabOrder = 13
      OnKeyDown = EditMonthKeyDown
    end
    object EditLedtBegin: TTntDateTimePicker
      Left = 86
      Top = 231
      Width = 99
      Height = 21
      Date = 37622.000000000000000000
      Time = 37622.000000000000000000
      ShowCheckbox = True
      Checked = False
      ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
      TabOrder = 12
      OnKeyDown = EditMonthKeyDown
    end
    object EditIndtBegin: TTntDateTimePicker
      Left = 86
      Top = 207
      Width = 99
      Height = 21
      Date = 36526.000000000000000000
      Time = 36526.000000000000000000
      ShowCheckbox = True
      Checked = False
      ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
      TabOrder = 10
      OnKeyDown = EditMonthKeyDown
    end
    object EditIndtEnd: TTntDateTimePicker
      Left = 189
      Top = 207
      Width = 99
      Height = 21
      Date = 36161.000000000000000000
      Time = 36161.000000000000000000
      ShowCheckbox = True
      Checked = False
      ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
      TabOrder = 11
      OnKeyDown = EditMonthKeyDown
    end
    object EditBirthEnd: TTntDateTimePicker
      Left = 189
      Top = 256
      Width = 99
      Height = 21
      Date = 36161.000000000000000000
      Time = 36161.000000000000000000
      ShowCheckbox = True
      Checked = False
      ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
      TabOrder = 15
      OnKeyDown = EditMonthKeyDown
    end
    object EditBirthBegin: TTntDateTimePicker
      Left = 86
      Top = 256
      Width = 99
      Height = 21
      Date = 14611.000000000000000000
      Time = 14611.000000000000000000
      ShowCheckbox = True
      Checked = False
      ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
      TabOrder = 14
      OnKeyDown = EditMonthKeyDown
    end
    object CobDeptBegin: TTntComboBox
      Left = 86
      Top = 82
      Width = 120
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
      ItemHeight = 13
      ParentFont = False
      TabOrder = 2
      OnChange = CobDeptBeginChange
      OnKeyDown = EditMonthKeyDown
    end
    object CobDeptEnd: TTntComboBox
      Left = 208
      Top = 81
      Width = 120
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
      ItemHeight = 13
      ParentFont = False
      TabOrder = 3
      OnKeyDown = EditMonthKeyDown
    end
    object EditIdnoEnd: TTntEdit
      Left = 180
      Top = 160
      Width = 90
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
      ParentFont = False
      TabOrder = 9
      OnKeyDown = EditMonthKeyDown
    end
    object EditIdnoBegin: TTntEdit
      Left = 86
      Top = 160
      Width = 90
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
      ParentFont = False
      TabOrder = 8
      OnKeyDown = EditMonthKeyDown
    end
    object CobEduBegin: TTntComboBox
      Left = 86
      Top = 134
      Width = 91
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
      TabOrder = 6
      OnKeyDown = EditMonthKeyDown
    end
    object CobEduEnd: TTntComboBox
      Left = 181
      Top = 134
      Width = 91
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
      TabOrder = 7
      OnKeyDown = EditMonthKeyDown
    end
    object CobPstEnd: TTntComboBox
      Left = 181
      Top = 109
      Width = 91
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
      TabOrder = 5
      OnKeyDown = EditMonthKeyDown
    end
    object CobPstBegin: TTntComboBox
      Left = 86
      Top = 109
      Width = 91
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
      OnKeyDown = EditMonthKeyDown
    end
    object EditEmpBegin: TTntEdit
      Left = 86
      Top = 55
      Width = 59
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
      MaxLength = 6
      ParentFont = False
      TabOrder = 0
      OnKeyDown = EditMonthKeyDown
    end
    object EditEmpEnd: TTntEdit
      Left = 154
      Top = 55
      Width = 59
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
      OnKeyDown = EditMonthKeyDown
    end
    object TntPanel2: TTntPanel
      Left = 4
      Top = 4
      Width = 405
      Height = 24
      Align = alTop
      Alignment = taLeftJustify
      Caption = 'query_condition'
      Color = clGradientActiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 17
      OnMouseDown = TntPanel2MouseDown
    end
    object Panel2: TPanel
      Left = 4
      Top = 326
      Width = 405
      Height = 27
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 18
      object BtnQuery: TTntBitBtn
        Left = 82
        Top = 1
        Width = 71
        Height = 25
        Caption = 'ok'
        Default = True
        TabOrder = 0
        OnClick = BtnQueryClick
        OnKeyDown = EditMonthKeyDown
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
      object TntBitBtn2: TTntBitBtn
        Left = 178
        Top = 1
        Width = 71
        Height = 25
        Caption = 'cancel'
        TabOrder = 1
        OnClick = TntBitBtn2Click
        OnKeyDown = EditMonthKeyDown
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
          F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
          000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
          338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
          45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
          3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
          F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
          000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
          338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
          4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
          8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
          333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
          0000}
        NumGlyphs = 2
      end
    end
    object CobSex: TTntComboBox
      Left = 86
      Top = 303
      Width = 100
      Height = 21
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
      ItemHeight = 13
      ParentFont = False
      TabOrder = 16
      OnKeyDown = EditMonthKeyDown
    end
    object EditSpcBegin: TTntEdit
      Left = 86
      Top = 184
      Width = 90
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
      ParentFont = False
      TabOrder = 19
      OnKeyDown = EditMonthKeyDown
    end
    object EditSpcEnd: TTntEdit
      Left = 180
      Top = 184
      Width = 90
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
      ParentFont = False
      TabOrder = 20
      OnKeyDown = EditMonthKeyDown
    end
    object QryDate: TTntDateTimePicker
      Left = 87
      Top = 32
      Width = 100
      Height = 21
      Date = 38943.342976342600000000
      Time = 38943.342976342600000000
      ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
      TabOrder = 21
    end
    object CobInfo: TTntComboBox
      Left = 279
      Top = 32
      Width = 100
      Height = 21
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
      ItemHeight = 13
      ParentFont = False
      TabOrder = 22
    end
    object EditNameChs: TTntEdit
      Left = 86
      Top = 280
      Width = 98
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
      ParentFont = False
      TabOrder = 23
      OnKeyDown = EditMonthKeyDown
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 96
    Top = 221
  end
  object ADODataSetPic: TADODataSet
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    CommandText = 'select * from hrd_epPict'
    DataSource = DataSource1
    IndexFieldNames = 'emp_id'
    MasterFields = 'emp_id'
    Parameters = <>
    Left = 689
    Top = 421
  end
  object ADOQuery1: TADOQuery
    Connection = DMHrdsys.conn
    LockType = ltBatchOptimistic
    AfterScroll = ADOQuery1AfterScroll
    OnCalcFields = ADOQuery1CalcFields
    Parameters = <>
    SQL.Strings = (
      'select top 1 * from fhrd_emp')
    Left = 56
    Top = 220
    object ADOQuery1department: TWideStringField
      DisplayWidth = 40
      FieldKind = fkCalculated
      FieldName = 'department'
      Calculated = True
    end
    object ADOQuery1pstname: TWideStringField
      FieldKind = fkCalculated
      FieldName = 'pstname'
      Calculated = True
    end
    object ADOQuery1info_name: TWideStringField
      FieldKind = fkCalculated
      FieldName = 'info_name'
      Calculated = True
    end
    object ADOQuery1upd_user: TWideStringField
      FieldName = 'upd_user'
    end
    object ADOQuery1upd_date: TDateTimeField
      FieldName = 'upd_date'
    end
    object ADOQuery1emp_id: TStringField
      FieldName = 'emp_id'
      Size = 6
    end
    object ADOQuery1emp_name: TWideStringField
      FieldName = 'emp_name'
    end
    object ADOQuery1emp_name_en: TWideStringField
      FieldName = 'emp_name_en'
      Size = 30
    end
    object ADOQuery1emp_name_vn: TWideStringField
      FieldName = 'emp_name_vn'
      Size = 35
    end
    object ADOQuery1emp_bidt: TDateTimeField
      FieldName = 'emp_bidt'
    end
    object ADOQuery1emp_gender: TStringField
      FieldName = 'emp_gender'
      FixedChar = True
      Size = 1
    end
    object ADOQuery1emp_tpid: TStringField
      FieldName = 'emp_tpid'
    end
    object ADOQuery1edu_code: TStringField
      FieldName = 'edu_code'
      Size = 2
    end
    object ADOQuery1emp_marry: TStringField
      FieldName = 'emp_marry'
      FixedChar = True
      Size = 1
    end
    object ADOQuery1emp_passport: TStringField
      FieldName = 'emp_passport'
      Size = 15
    end
    object ADOQuery1dept_code: TStringField
      FieldName = 'dept_code'
      Size = 6
    end
    object ADOQuery1pst_code: TStringField
      FieldName = 'pst_code'
      Size = 2
    end
    object ADOQuery1emp_info: TStringField
      FieldName = 'emp_info'
      Size = 1
    end
    object ADOQuery1spc_id: TStringField
      FieldName = 'spc_id'
      Size = 10
    end
    object ADOQuery1emp_etdt: TDateTimeField
      FieldName = 'emp_etdt'
    end
    object ADOQuery1emp_gvdt: TDateTimeField
      FieldName = 'emp_gvdt'
    end
    object ADOQuery1emp_ledt: TDateTimeField
      FieldName = 'emp_ledt'
    end
    object ADOQuery1emp_phone: TWideStringField
      FieldName = 'emp_phone'
      Size = 30
    end
    object ADOQuery1emp_addr: TWideStringField
      FieldName = 'emp_addr'
      Size = 60
    end
    object ADOQuery1emp_airport: TWideStringField
      FieldName = 'emp_airport'
      Size = 60
    end
    object ADOQuery1jueding_exp: TWideStringField
      FieldName = 'jueding_exp'
      Size = 60
    end
  end
  object ADOQuery2: TADOQuery
    Connection = DMHrdsys.conn
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'select top 1 * from fhrd_emp')
    Left = 160
    Top = 260
    object ADOQuery2upd_user: TStringField
      FieldName = 'upd_user'
      Size = 16
    end
    object ADOQuery2upd_date: TDateTimeField
      FieldName = 'upd_date'
    end
    object ADOQuery2emp_id: TStringField
      FieldName = 'emp_id'
      Size = 6
    end
    object ADOQuery2emp_chs: TWideStringField
      FieldName = 'emp_chs'
      Size = 30
    end
    object ADOQuery2epid_no: TStringField
      FieldName = 'epid_no'
      Size = 10
    end
    object ADOQuery2epbirth: TDateTimeField
      FieldName = 'epbirth'
    end
    object ADOQuery2epsexd: TStringField
      FieldName = 'epsexd'
      Size = 1
    end
    object ADOQuery2ifmarry: TStringField
      FieldName = 'ifmarry'
      Size = 1
    end
    object ADOQuery2epAddrchs: TWideStringField
      FieldName = 'epAddrchs'
      Size = 120
    end
    object ADOQuery2tpAddrchs: TWideStringField
      FieldName = 'tpAddrchs'
      Size = 120
    end
    object ADOQuery2edu_code: TStringField
      FieldName = 'edu_code'
      Size = 2
    end
    object ADOQuery2chs_status: TStringField
      FieldName = 'chs_status'
      FixedChar = True
      Size = 1
    end
    object ADOQuery2eng_status: TStringField
      FieldName = 'eng_status'
      FixedChar = True
      Size = 1
    end
    object ADOQuery2epid_date: TDateTimeField
      FieldName = 'epid_date'
    end
    object ADOQuery2epid_area: TWideStringField
      FieldName = 'epid_area'
    end
    object ADOQuery2factory: TStringField
      FieldName = 'factory'
      Size = 1
    end
    object ADOQuery2dept_code: TStringField
      FieldName = 'dept_code'
      Size = 6
    end
    object ADOQuery2epindt: TDateTimeField
      FieldName = 'epindt'
    end
    object ADOQuery2epledt: TDateTimeField
      FieldName = 'epledt'
    end
    object ADOQuery2left_reason: TWideStringField
      FieldName = 'left_reason'
      Size = 200
    end
    object ADOQuery2pst_code: TStringField
      FieldName = 'pst_code'
      Size = 2
    end
    object ADOQuery2info_code: TStringField
      FieldName = 'info_code'
      Size = 1
    end
    object ADOQuery2spc_id: TStringField
      FieldName = 'spc_id'
      Size = 10
    end
    object ADOQuery2name_eng: TWideStringField
      FieldName = 'name_eng'
      Size = 50
    end
    object ADOQuery2name_vim: TWideStringField
      FieldName = 'name_vim'
      Size = 50
    end
    object ADOQuery2epAddrvim: TWideStringField
      FieldName = 'epAddrvim'
      Size = 200
    end
    object ADOQuery2epAddreng: TWideStringField
      FieldName = 'epAddreng'
      Size = 120
    end
    object ADOQuery2tpAddrvim: TWideStringField
      FieldName = 'tpAddrvim'
      Size = 200
    end
    object ADOQuery2tpAddreng: TWideStringField
      FieldName = 'tpAddreng'
      Size = 120
    end
    object ADOQuery2epid_vim: TWideStringField
      FieldName = 'epid_vim'
      Size = 50
    end
    object ADOQuery2epid_eng: TWideStringField
      FieldName = 'epid_eng'
      Size = 50
    end
    object ADOQuery2emp_phone: TStringField
      FieldName = 'emp_phone'
      Size = 30
    end
    object ADOQuery2birth_addr: TWideStringField
      FieldName = 'birth_addr'
    end
  end
end
