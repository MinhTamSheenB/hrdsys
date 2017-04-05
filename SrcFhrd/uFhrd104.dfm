object Formfhrd104: TFormfhrd104
  Left = 0
  Top = 84
  Width = 798
  Height = 564
  Caption = #24185#37096#32771#26680#36039#26009#32173#35703
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = TntFormClose
  OnCreate = TntFormCreate
  DesignSize = (
    790
    537)
  PixelsPerInch = 96
  TextHeight = 13
  object TntPanel_title: TTntPanel
    Left = 0
    Top = 0
    Width = 790
    Height = 45
    Align = alTop
    Caption = #28023#22806#24185#37096#31649#29702#31995#32113'____'#24185#37096#32771#26680#36039#26009#32173#35703
    Color = clCream
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object TntGroupBox_condition: TTntGroupBox
    Left = 0
    Top = 46
    Width = 789
    Height = 81
    Hint = '0'
    Anchors = [akLeft, akTop, akRight]
    Caption = #26781#20214
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 1
    DesignSize = (
      789
      81)
    object TntLabel_assessMonth: TTntLabel
      Left = 12
      Top = 21
      Width = 101
      Height = 22
      Alignment = taRightJustify
      AutoSize = False
      Caption = #32771#26680#26376#20221
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object TntLabel_line1: TTntLabel
      Left = 479
      Top = 14
      Width = 26
      Height = 22
      AutoSize = False
      Caption = #65374
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object TntLabel_line2: TTntLabel
      Left = 480
      Top = 42
      Width = 26
      Height = 22
      AutoSize = False
      Caption = #65374
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object TntLabel_format: TTntLabel
      Left = 43
      Top = 48
      Width = 158
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = '('#26684#24335':yyyymm)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object TntEdit_checkMonth: TTntEdit
      Left = 118
      Top = 21
      Width = 43
      Height = 21
      Hint = 'yyyymm'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
      MaxLength = 6
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Text = '200507'
      OnKeyDown = TntEdit_checkMonthKeyDown
    end
    object TntRadioButton_department: TTntRadioButton
      Left = 208
      Top = 21
      Width = 114
      Height = 17
      BiDiMode = bdLeftToRight
      Caption = #37096#38272
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 1
    end
    object TntRadioButton_emp_id: TTntRadioButton
      Left = 208
      Top = 48
      Width = 114
      Height = 17
      BiDiMode = bdLeftToRight
      Caption = #24037#34399
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 2
    end
    object TntComboBox_department_bgn: TTntComboBox
      Left = 323
      Top = 18
      Width = 145
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
      OnChange = TntComboBox_department_bgnChange
    end
    object TntComboBox_department_end: TTntComboBox
      Left = 515
      Top = 18
      Width = 145
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
      ItemHeight = 13
      ParentFont = False
      TabOrder = 4
      OnChange = TntComboBox_department_endChange
    end
    object TntEdit_emp_id_end: TTntEdit
      Left = 515
      Top = 46
      Width = 43
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
      MaxLength = 6
      ParentFont = False
      TabOrder = 5
      OnChange = TntEdit_emp_id_endChange
    end
    object TntBitBtn_query: TTntBitBtn
      Left = 706
      Top = 47
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
      TabOrder = 6
      OnClick = TntBitBtn_queryClick
      NumGlyphs = 2
    end
    object TntEdit_emp_id_bgn: TTntEdit
      Left = 324
      Top = 47
      Width = 43
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
      MaxLength = 6
      ParentFont = False
      TabOrder = 7
      OnChange = TntEdit_emp_id_bgnChange
    end
  end
  object TntGroupBox_waitAssessCadre: TTntGroupBox
    Left = 1
    Top = 131
    Width = 788
    Height = 132
    Anchors = [akLeft, akTop, akRight]
    Caption = #24453#32771#26680#24185#37096
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    DesignSize = (
      788
      132)
    object TntDBGrid_waitAssess: TTntDBGrid
      Left = 0
      Top = 13
      Width = 786
      Height = 117
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = DataSource_dept
      FixedColor = clSkyBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clRed
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = TntDBGrid_waitAssessCellClick
      OnTitleClick = TntDBGrid_waitAssessTitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'emp_id'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Palatino Linotype'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'emp_name'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Palatino Linotype'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'pst_name'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Palatino Linotype'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dept_abbr'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Palatino Linotype'
          Title.Font.Style = []
          Visible = True
        end>
    end
  end
  object TntGroupBox_maintenanceData: TTntGroupBox
    Left = 1
    Top = 265
    Width = 788
    Height = 84
    Anchors = [akLeft, akTop, akRight]
    Caption = #32173#35703#25976#25818
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    DesignSize = (
      788
      84)
    object TntLabel_emp_id: TTntLabel
      Left = 2
      Top = 24
      Width = 88
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      Caption = #24037#34399
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object TntLabel_assessItems: TTntLabel
      Left = 3
      Top = 50
      Width = 88
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      Caption = #32771#26680#38917#30446
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object TntLabel_name: TTntLabel
      Left = 241
      Top = 24
      Width = 83
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      Caption = #22995#21517'(cn)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object TntLabel_mark: TTntLabel
      Left = 242
      Top = 50
      Width = 83
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      Caption = #20998#25976
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object TntLabel_department: TTntLabel
      Left = 431
      Top = 24
      Width = 88
      Height = 17
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = #37096#38272#21517#31281
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object TntEdit_emp_id: TTntEdit
      Left = 96
      Top = 20
      Width = 43
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
    end
    object TntEdit_name: TTntEdit
      Left = 332
      Top = 20
      Width = 54
      Height = 21
      Color = clSkyBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object TntEdit_department: TTntEdit
      Left = 526
      Top = 20
      Width = 249
      Height = 21
      Anchors = [akTop, akRight]
      Color = clSkyBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object TntComboBox_acs_name: TTntComboBox
      Left = 96
      Top = 47
      Width = 145
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
      OnClick = TntComboBox_acs_nameClick
    end
    object TntEdit_mark: TTntEdit
      Left = 332
      Top = 47
      Width = 54
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
      ParentFont = False
      TabOrder = 4
    end
    object TntBitBtn_save: TTntBitBtn
      Left = 550
      Top = 50
      Width = 75
      Height = 22
      Anchors = [akTop, akRight]
      Caption = #20445#23384
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = TntBitBtn_saveClick
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000120B0000120B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
        4C4C4C4CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4C4C4C4B4B4B4C4C4C4C4C4C4D
        4D4D4C4C4C4C4C4C4D4D4D4C4C4C4D4D4D4C4C4CFFFFFFFFFFFFFFFFFFFFFFFF
        86584CE2BA9786584CFFFFFFFFE2C0FFE2C0FFE2C0FFE2C0FFE2C086584CCBA3
        80C69D7B4C4C4CFFFFFFFFFFFFFFFFFF5A5A5AB7B7B7595959FFFFFFDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDD5959599E9E9E9999994C4C4CFFFFFFFFFFFF86584C
        E2BA97F4C6A986584CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2C086584CD7AE
        8CBA926F4C4C4CFFFFFFFFFFFF5A5A5AB6B6B6C3C3C35A5A5AFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFDDDDDD595959AAAAAA8E8E8E4C4C4CFFFFFFFFFFFF86584C
        F4C6A9F4C6A986584C92644C92644C92644C92644C92644C92644C86584CD7AE
        8CC69D7B4C4C4CFFFFFFFFFFFF585858C4C4C4C4C4C459595963636363636363
        6363636363636363636363595959AAAAAA9999994C4C4CFFFFFFFFFFFF86584C
        FFD1B4FFD1B4E2BA97E2BA97E2BA97E2BA97E2BA97E2BA97E2BA97E2BA97E2BA
        97D1A3864C4C4CFFFFFFFFFFFF585858CECECECFCFCFB6B6B6B5B5B5B5B5B5B6
        B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6A1A1A14C4C4CFFFFFFFFFFFF86584C
        F9D1AEFFD1B4FFD1B4FFD1B4FFD1B4FFD1B4FFD1B4FFD1B4FFD1B4FFD1B4F9D1
        AEC69D7B4C4C4CFFFFFFFFFFFF5A5A5ACCCCCCCECECECECECECECECECECECECE
        CECECFCFCFCFCFCFCECECECECECECDCDCD9999994C4C4CFFFFFFFFFFFF86584C
        F9D1AEAE8664AE8664AE8664AE8664AE8664AE8664AE8664AE8664AE8664B48C
        69D1A3864C4C4CFFFFFFFFFFFF5A5A5ACCCCCC83838382828282828282828282
        8282838383828282838383838383888888A0A0A04D4D4DFFFFFFFFFFFF86584C
        FFDDBA86584CFFFFFFFFE2C6FFE2C6FFE2C6FFE2C6FFE2C6FFE2C6FFE2C6B48C
        69D7A98C4C4C4CFFFFFFFFFFFF595959D8D8D85A5A5AFFFFFFDEDEDEDFDFDFDF
        DFDFDEDEDEDDDDDDDFDFDFDFDFDF888888A7A7A74C4C4CFFFFFFFFFFFF86584C
        FFE8C686584CFFFFFFFFFFF9FFFFF9FFFFF9FFFFF9FFFFF9FFFFF9FFE2C6AE80
        64DDB4924C4C4CFFFFFFFFFFFF5A5A5AE3E3E3595959FFFFFFFEFEFEFEFEFEFE
        FEFEFDFDFDFEFEFEFEFEFEDFDFDF7E7E7EB0B0B04C4C4CFFFFFFFFFFFF86584C
        FFF4D186584CFFFFFFFFFFF9FFFFF9FFFFF9FFFFF9FFFFF9FFFFF9FFE2C6AE80
        64E8BA9D4C4C4CFFFFFFFFFFFF585858EEEEEE5A5A5AFFFFFFFDFDFDFDFDFDFE
        FEFEFEFEFEFEFEFEFDFDFDDEDEDE7E7E7EB8B8B84C4C4CFFFFFFFFFFFF86584C
        FFF9D786584CFFFFFFFFFFF9FFFFF9FFFFF9FFFFF9FFFFF9FFFFF9FFE2C6A980
        5DA374524C4C4CFFFFFFFFFFFF595959F3F3F3595959FFFFFFFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEDFDFDF7C7C7C7272724C4C4CFFFFFFFFFFFF86584C
        FFFFF986584CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDDC0A980
        5DFFDDC04C4C4CFFFFFFFFFFFF595959FEFEFE595959FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFD9D9D97C7C7CDADADA4B4B4BFFFFFFFFFFFFFFFFFF
        86584C86584C86584C86584C86584C86584C86584C86584C86584C86584C8658
        4C86584CFFFFFFFFFFFFFFFFFFFFFFFF5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A58
        58585A5A5A5A5A5A5959595A5A5A5858585A5A5AFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      NumGlyphs = 2
    end
    object TntBitBtn_deleted: TTntBitBtn
      Left = 625
      Top = 50
      Width = 75
      Height = 22
      Anchors = [akTop, akRight]
      Caption = #21034#38500
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnClick = TntBitBtn_deletedClick
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000120B0000120B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        B4924CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFB4924CFFFFFFFFFFFFFFFFFFFFFFFF898989FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF898989FFFFFFFFFFFFFFFFFFE8B44C
        E8B44CB4924CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFA9A9A9A9A9A9898989FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8B44C
        FFEECBE8B44CB4924CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB492
        4CFFFFFFFFFFFFFFFFFFFFFFFFA7A7A7E8E8E8A8A8A8898989FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF8A8A8AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        E8B44CFFC64CB4924CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8B44CFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA9A9A9B8B8B8898989FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFA8A8A8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFE8B44CFFC64CB4924CFFFFFFFFFFFFFFFFFFFFFFFFE8B44CB4924CFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA8A8A8B8B8B8898989FFFFFFFF
        FFFFFFFFFFFFFFFFA7A7A7898989FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFE8B44CE8B44CB4924CFFFFFFFFFFFFE8B44CB4924CFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA9A9A9A8A8A8898989FF
        FFFFFFFFFFA7A7A7888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFE8B44CE8B44CB4924CE8B44CB4924CFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA7A7A7A8A8A889
        8989A8A8A8898989FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFE8B44CE8B44CB4924CFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA9A9A9A9
        A9A9898989FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFE8B44CE8B44CB4924CE8B44CB4924CFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA9A9A9A7A7A789
        8989A7A7A78A8A8AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFE8B44CFFC64CB4924CFFFFFFFFFFFFE8B44CB4924CFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA7A7A7B9B9B98A8A8AFF
        FFFFFFFFFFA8A8A88A8A8AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        E8B44CE8B44CFFC64CB4924CFFFFFFFFFFFFFFFFFFFFFFFFE8B44CB4924CFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA8A8A8A7A7A7B9B9B9888888FFFFFFFF
        FFFFFFFFFFFFFFFFA7A7A7898989FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8B44C
        FFEECBFFC64CB4924CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8B44CB492
        4CFFFFFFFFFFFFFFFFFFFFFFFFA8A8A8E8E8E8B8B8B8888888FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFA7A7A78A8A8AFFFFFFFFFFFFFFFFFFFFFFFFE8B44C
        E8B44CE8B44CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFB4924CFFFFFFFFFFFFFFFFFFA8A8A8A8A8A8A9A9A9FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF888888FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      NumGlyphs = 2
    end
  end
  object TntGroupBox_browseData: TTntGroupBox
    Left = 1
    Top = 352
    Width = 788
    Height = 176
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = #28687#35261#25976#25818
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    DesignSize = (
      788
      176)
    object TntDBGrid_browsData: TTntDBGrid
      Left = 0
      Top = 13
      Width = 786
      Height = 161
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = DataSource_access
      FixedColor = clSkyBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clRed
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = TntDBGrid_browsDataCellClick
      OnTitleClick = TntDBGrid_browsDataTitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'emp_id'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Palatino Linotype'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'emp_name'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Palatino Linotype'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dept_abbr'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Palatino Linotype'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'pst_name'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Palatino Linotype'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'acs_name'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Palatino Linotype'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'mark'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Palatino Linotype'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'chk_month'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Palatino Linotype'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'acs_id'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Palatino Linotype'
          Title.Font.Style = []
          Visible = True
        end>
    end
  end
  object TntBitBtn_exit: TTntBitBtn
    Left = 701
    Top = 315
    Width = 75
    Height = 22
    Anchors = [akTop, akRight]
    Caption = #36864#20986
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = TntBitBtn_exitClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
      03333377777777777F333301111111110333337F333333337F33330111111111
      0333337F333333337F333301111111110333337F333333337F33330111111111
      0333337F333333337F333301111111110333337F333333337F33330111111111
      0333337F3333333F7F333301111111B10333337F333333737F33330111111111
      0333337F333333337F333301111111110333337F33FFFFF37F3333011EEEEE11
      0333337F377777F37F3333011EEEEE110333337F37FFF7F37F3333011EEEEE11
      0333337F377777337F333301111111110333337F333333337F33330111111111
      0333337FFFFFFFFF7F3333000000000003333377777777777333}
    NumGlyphs = 2
  end
  object ADOQuery_waitAssess: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select e.emp_id,e.emp_name,p.pst_name,d.dept_abbr '
      ' from fhrd_emp as e, fhrd_prof as p, fhrd_dept as d '
      '  where e.pst_code=p.pst_code  and  e.dept_code=d.dept_code '
      '  and e.emp_id not in (select emp_id from fhrd_access)')
    Left = 101
    Top = 32
  end
  object ADOQuery_access: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'gChk_month'
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 6
        Value = Null
      end>
    SQL.Strings = (
      
        'select a.emp_id,e.emp_name,d.dept_abbr,p.pst_name,i.acs_name,mar' +
        'k,a.chk_month'
      ',a.acs_id'
      
        ' from fhrd_access as a, fhrd_emp as e,fhrd_dept as d,fhrd_prof a' +
        's p,fhrd_acsid as i'
      ' where a.emp_id=e.emp_id and e.dept_code=d.dept_code and'
      
        ' e.pst_code=p.pst_code and a.acs_id=i.acs_id and a.chk_month=:gC' +
        'hk_month'
      ' order by a.emp_id')
    Left = 173
    Top = 32
  end
  object DataSource_dept: TDataSource
    DataSet = ADOQuery_waitAssess
    Left = 141
    Top = 32
  end
  object DataSource_access: TDataSource
    DataSet = ADOQuery_access
    Left = 205
    Top = 32
  end
end
