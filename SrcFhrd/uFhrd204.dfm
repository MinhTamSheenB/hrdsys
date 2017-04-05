object FormFhrd204: TFormFhrd204
  Left = 194
  Top = 178
  Width = 809
  Height = 521
  Caption = 'FormFhrd204'
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
  object TntPageControl1: TTntPageControl
    Left = 0
    Top = 33
    Width = 801
    Height = 454
    ActivePage = TntTabSheet2
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Palatino Linotype'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object TntTabSheet1: TTntTabSheet
      Caption = 'query'
      object TntGroupBox1: TTntGroupBox
        Left = 0
        Top = 0
        Width = 793
        Height = 89
        Align = alTop
        Caption = 'search_condition'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object TntLabel1: TTntLabel
          Left = 8
          Top = 20
          Width = 89
          Height = 17
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'fld_tms_mon'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object sb_ChoseEmp1: TTntSpeedButton
          Left = 352
          Top = 14
          Width = 23
          Height = 22
          Caption = '...'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          OnClick = sb_ChoseEmp1Click
        end
        object TntLabel5: TTntLabel
          Left = 292
          Top = 67
          Width = 73
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'fld_epindt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object me_Month1: TMaskEdit
          Left = 104
          Top = 16
          Width = 57
          Height = 21
          EditMask = '9999/99;0;_'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
          MaxLength = 7
          ParentFont = False
          TabOrder = 0
          OnChange = me_Month1Change
        end
        object rb_ByEmp1: TTntRadioButton
          Left = 208
          Top = 16
          Width = 81
          Height = 17
          BiDiMode = bdLeftToRight
          Caption = 'by_empid'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentBiDiMode = False
          ParentFont = False
          TabOrder = 1
          OnClick = rb_ByEmp1Click
        end
        object EditEmp1: TTntEdit
          Left = 294
          Top = 14
          Width = 57
          Height = 21
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
          ParentFont = False
          TabOrder = 2
        end
        object rb_ByDept1: TTntRadioButton
          Left = 208
          Top = 42
          Width = 81
          Height = 17
          BiDiMode = bdLeftToRight
          Caption = 'by_deptcode'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentBiDiMode = False
          ParentFont = False
          TabOrder = 3
        end
        object cob_DeptBeg1: TTntComboBox
          Left = 294
          Top = 40
          Width = 161
          Height = 21
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
          ItemHeight = 13
          ParentFont = False
          TabOrder = 4
          OnChange = cob_DeptBeg1Change
        end
        object cob_DeptEnd1: TTntComboBox
          Left = 462
          Top = 40
          Width = 161
          Height = 21
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
          ItemHeight = 13
          ParentFont = False
          TabOrder = 5
        end
        object bbtn_Confirm1: TTntBitBtn
          Left = 632
          Top = 37
          Width = 65
          Height = 25
          Caption = 'ok'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          OnClick = bbtn_Confirm1Click
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
        object bbtn_Reset1: TTntBitBtn
          Left = 704
          Top = 37
          Width = 65
          Height = 25
          Caption = 'reset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          OnClick = bbtn_Reset1Click
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
            33333333333F8888883F33330000324334222222443333388F3833333388F333
            000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
            F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
            223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
            3338888300003AAAAAAA33333333333888888833333333330000333333333333
            333333333333333333FFFFFF000033333333333344444433FFFF333333888888
            00003A444333333A22222438888F333338F3333800003A2243333333A2222438
            F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
            22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
            33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
            3333333333338888883333330000333333333333333333333333333333333333
            0000}
          NumGlyphs = 2
        end
        object TntStaticText3: TTntStaticText
          Left = 8
          Top = 43
          Width = 193
          Height = 17
          AutoSize = False
          Caption = 'input_month_info'
          Color = clYellow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 8
        end
        object dtp_beg1: TTntDateTimePicker
          Left = 374
          Top = 63
          Width = 81
          Height = 21
          Date = 37257.449101006940000000
          Time = 37257.449101006940000000
          Enabled = False
          ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
          TabOrder = 9
        end
        object dtp_end1: TTntDateTimePicker
          Left = 464
          Top = 63
          Width = 81
          Height = 21
          Date = 38769.449101006940000000
          Time = 38769.449101006940000000
          Enabled = False
          ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
          TabOrder = 10
        end
      end
      object TntGroupBox2: TTntGroupBox
        Left = 0
        Top = 89
        Width = 195
        Height = 334
        Align = alClient
        Caption = 'hrd08_base_info'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object dbg_emp1: TTntDBGrid
          Left = 2
          Top = 15
          Width = 191
          Height = 317
          Align = alClient
          DataSource = ds_emp1
          FixedColor = clSkyBlue
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clRed
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = dbg_emp1CellClick
          Columns = <
            item
              Expanded = False
              FieldName = 'dept_code'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 51
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'emp_id'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 47
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'emp_name'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 65
              Visible = True
            end>
        end
      end
      object TntPanel4: TTntPanel
        Left = 195
        Top = 89
        Width = 598
        Height = 334
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 2
        object TntGroupBox4: TTntGroupBox
          Left = 0
          Top = 0
          Width = 598
          Height = 169
          Align = alTop
          Caption = 'tms_date_detail'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object lbl_day101: TTntLabel
            Left = 12
            Top = 21
            Width = 17
            Height = 16
            Alignment = taRightJustify
            Caption = '01'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_day102: TTntLabel
            Left = 116
            Top = 21
            Width = 17
            Height = 16
            Alignment = taRightJustify
            Caption = '02'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_day104: TTntLabel
            Left = 324
            Top = 21
            Width = 17
            Height = 16
            Alignment = taRightJustify
            BiDiMode = bdLeftToRight
            Caption = '04'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentBiDiMode = False
            ParentFont = False
          end
          object lbl_day103: TTntLabel
            Left = 220
            Top = 21
            Width = 17
            Height = 16
            Alignment = taRightJustify
            Caption = '03'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_day105: TTntLabel
            Left = 428
            Top = 21
            Width = 17
            Height = 16
            Alignment = taRightJustify
            Caption = '05'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_day106: TTntLabel
            Left = 10
            Top = 45
            Width = 17
            Height = 16
            Alignment = taRightJustify
            Caption = '06'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_day107: TTntLabel
            Left = 116
            Top = 45
            Width = 17
            Height = 16
            Alignment = taRightJustify
            Caption = '07'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_day108: TTntLabel
            Left = 220
            Top = 45
            Width = 17
            Height = 16
            Alignment = taRightJustify
            BiDiMode = bdLeftToRight
            Caption = '08'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentBiDiMode = False
            ParentFont = False
          end
          object lbl_day109: TTntLabel
            Left = 324
            Top = 45
            Width = 17
            Height = 16
            Alignment = taRightJustify
            Caption = '09'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_day110: TTntLabel
            Left = 428
            Top = 45
            Width = 17
            Height = 16
            Alignment = taRightJustify
            Caption = '10'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_day111: TTntLabel
            Left = 12
            Top = 69
            Width = 17
            Height = 16
            Alignment = taRightJustify
            Caption = '11'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_day112: TTntLabel
            Left = 116
            Top = 69
            Width = 17
            Height = 16
            Alignment = taRightJustify
            BiDiMode = bdLeftToRight
            Caption = '12'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentBiDiMode = False
            ParentFont = False
          end
          object lbl_day113: TTntLabel
            Left = 220
            Top = 69
            Width = 17
            Height = 16
            Alignment = taRightJustify
            Caption = '13'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_day114: TTntLabel
            Left = 324
            Top = 69
            Width = 17
            Height = 16
            Alignment = taRightJustify
            Caption = '14'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_day115: TTntLabel
            Left = 428
            Top = 69
            Width = 17
            Height = 16
            Alignment = taRightJustify
            Caption = '15'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_day116: TTntLabel
            Left = 12
            Top = 93
            Width = 17
            Height = 16
            Alignment = taRightJustify
            BiDiMode = bdLeftToRight
            Caption = '16'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentBiDiMode = False
            ParentFont = False
          end
          object lbl_day117: TTntLabel
            Left = 116
            Top = 93
            Width = 17
            Height = 16
            Alignment = taRightJustify
            Caption = '17'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_day118: TTntLabel
            Left = 220
            Top = 93
            Width = 17
            Height = 16
            Alignment = taRightJustify
            Caption = '18'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_day119: TTntLabel
            Left = 324
            Top = 93
            Width = 17
            Height = 16
            Alignment = taRightJustify
            Caption = '19'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_day120: TTntLabel
            Left = 428
            Top = 93
            Width = 17
            Height = 16
            Alignment = taRightJustify
            BiDiMode = bdLeftToRight
            Caption = '20'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentBiDiMode = False
            ParentFont = False
          end
          object lbl_day121: TTntLabel
            Left = 12
            Top = 117
            Width = 17
            Height = 16
            Alignment = taRightJustify
            Caption = '21'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_day122: TTntLabel
            Left = 116
            Top = 117
            Width = 17
            Height = 16
            Alignment = taRightJustify
            Caption = '22'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_day123: TTntLabel
            Left = 220
            Top = 117
            Width = 17
            Height = 16
            Alignment = taRightJustify
            Caption = '23'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_day124: TTntLabel
            Left = 324
            Top = 117
            Width = 17
            Height = 16
            Alignment = taRightJustify
            BiDiMode = bdLeftToRight
            Caption = '24'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentBiDiMode = False
            ParentFont = False
          end
          object lbl_day125: TTntLabel
            Left = 428
            Top = 117
            Width = 17
            Height = 16
            Alignment = taRightJustify
            Caption = '25'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_day126: TTntLabel
            Left = 12
            Top = 141
            Width = 17
            Height = 16
            Alignment = taRightJustify
            Caption = '26'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_day127: TTntLabel
            Left = 116
            Top = 141
            Width = 17
            Height = 16
            Alignment = taRightJustify
            Caption = '27'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_day128: TTntLabel
            Left = 220
            Top = 141
            Width = 17
            Height = 16
            Alignment = taRightJustify
            BiDiMode = bdLeftToRight
            Caption = '28'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentBiDiMode = False
            ParentFont = False
          end
          object lbl_day129: TTntLabel
            Left = 324
            Top = 141
            Width = 17
            Height = 16
            Alignment = taRightJustify
            Caption = '29'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_day130: TTntLabel
            Left = 428
            Top = 141
            Width = 17
            Height = 16
            Alignment = taRightJustify
            Caption = '30'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_day131: TTntLabel
            Left = 12
            Top = 165
            Width = 17
            Height = 16
            Alignment = taRightJustify
            Caption = '31'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object me_day101: TMaskEdit
            Tag = 1
            Left = 40
            Top = 16
            Width = 65
            Height = 21
            EditMask = '99:99:99:99;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            OnChange = me_day101Change
            OnClick = me_day101Click
            OnEnter = me_day101Enter
          end
          object me_day102: TMaskEdit
            Tag = 2
            Left = 144
            Top = 16
            Width = 66
            Height = 21
            EditMask = '99:99:99:99;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            OnClick = me_day101Click
            OnEnter = me_day101Enter
          end
          object me_day104: TMaskEdit
            Tag = 4
            Left = 352
            Top = 16
            Width = 66
            Height = 21
            EditMask = '99:99:99:99;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
            OnClick = me_day101Click
            OnEnter = me_day101Enter
          end
          object me_day103: TMaskEdit
            Tag = 3
            Left = 248
            Top = 16
            Width = 66
            Height = 21
            EditMask = '99:99:99:99;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
            OnClick = me_day101Click
            OnEnter = me_day101Enter
          end
          object me_day105: TMaskEdit
            Tag = 5
            Left = 456
            Top = 16
            Width = 66
            Height = 21
            EditMask = '99:99:99:99;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
            OnClick = me_day101Click
            OnEnter = me_day101Enter
          end
          object me_day106: TMaskEdit
            Tag = 6
            Left = 40
            Top = 40
            Width = 66
            Height = 21
            EditMask = '99:99:99:99;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
            OnClick = me_day101Click
            OnEnter = me_day101Enter
          end
          object me_day107: TMaskEdit
            Tag = 7
            Left = 144
            Top = 40
            Width = 66
            Height = 21
            EditMask = '99:99:99:99;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            ReadOnly = True
            TabOrder = 6
            OnClick = me_day101Click
            OnEnter = me_day101Enter
          end
          object me_day108: TMaskEdit
            Tag = 8
            Left = 248
            Top = 40
            Width = 66
            Height = 21
            EditMask = '99:99:99:99;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            ReadOnly = True
            TabOrder = 7
            OnClick = me_day101Click
            OnEnter = me_day101Enter
          end
          object me_day109: TMaskEdit
            Tag = 9
            Left = 352
            Top = 40
            Width = 66
            Height = 21
            EditMask = '99:99:99:99;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            ReadOnly = True
            TabOrder = 8
            OnClick = me_day101Click
            OnEnter = me_day101Enter
          end
          object me_day110: TMaskEdit
            Tag = 10
            Left = 456
            Top = 40
            Width = 66
            Height = 21
            EditMask = '99:99:99:99;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            ReadOnly = True
            TabOrder = 9
            OnClick = me_day101Click
            OnEnter = me_day101Enter
          end
          object me_day111: TMaskEdit
            Tag = 11
            Left = 40
            Top = 64
            Width = 66
            Height = 21
            EditMask = '99:99:99:99;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            ReadOnly = True
            TabOrder = 10
            OnClick = me_day101Click
            OnEnter = me_day101Enter
          end
          object me_day112: TMaskEdit
            Tag = 12
            Left = 144
            Top = 64
            Width = 66
            Height = 21
            EditMask = '99:99:99:99;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            ReadOnly = True
            TabOrder = 11
            OnClick = me_day101Click
            OnEnter = me_day101Enter
          end
          object me_day113: TMaskEdit
            Tag = 13
            Left = 248
            Top = 64
            Width = 66
            Height = 21
            EditMask = '99:99:99:99;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            ReadOnly = True
            TabOrder = 12
            OnClick = me_day101Click
            OnEnter = me_day101Enter
          end
          object me_day114: TMaskEdit
            Tag = 14
            Left = 352
            Top = 64
            Width = 66
            Height = 21
            EditMask = '99:99:99:99;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            ReadOnly = True
            TabOrder = 13
            OnClick = me_day101Click
            OnEnter = me_day101Enter
          end
          object me_day115: TMaskEdit
            Tag = 15
            Left = 456
            Top = 64
            Width = 66
            Height = 21
            EditMask = '99:99:99:99;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            ReadOnly = True
            TabOrder = 14
            OnClick = me_day101Click
            OnEnter = me_day101Enter
          end
          object me_day116: TMaskEdit
            Tag = 16
            Left = 40
            Top = 88
            Width = 66
            Height = 21
            EditMask = '99:99:99:99;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            ReadOnly = True
            TabOrder = 15
            OnClick = me_day101Click
            OnEnter = me_day101Enter
          end
          object me_day117: TMaskEdit
            Tag = 17
            Left = 144
            Top = 88
            Width = 66
            Height = 21
            EditMask = '99:99:99:99;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            ReadOnly = True
            TabOrder = 16
            OnClick = me_day101Click
            OnEnter = me_day101Enter
          end
          object me_day118: TMaskEdit
            Tag = 18
            Left = 248
            Top = 88
            Width = 66
            Height = 21
            EditMask = '99:99:99:99;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            ReadOnly = True
            TabOrder = 17
            OnClick = me_day101Click
            OnEnter = me_day101Enter
          end
          object me_day119: TMaskEdit
            Tag = 19
            Left = 352
            Top = 88
            Width = 66
            Height = 21
            EditMask = '99:99:99:99;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            ReadOnly = True
            TabOrder = 18
            OnClick = me_day101Click
            OnEnter = me_day101Enter
          end
          object me_day120: TMaskEdit
            Tag = 20
            Left = 456
            Top = 88
            Width = 66
            Height = 21
            EditMask = '99:99:99:99;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            ReadOnly = True
            TabOrder = 19
            OnClick = me_day101Click
            OnEnter = me_day101Enter
          end
          object me_day121: TMaskEdit
            Tag = 21
            Left = 40
            Top = 112
            Width = 66
            Height = 21
            EditMask = '99:99:99:99;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            ReadOnly = True
            TabOrder = 20
            OnClick = me_day101Click
            OnEnter = me_day101Enter
          end
          object me_day122: TMaskEdit
            Tag = 22
            Left = 144
            Top = 112
            Width = 66
            Height = 21
            EditMask = '99:99:99:99;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            ReadOnly = True
            TabOrder = 21
            OnClick = me_day101Click
            OnEnter = me_day101Enter
          end
          object me_day123: TMaskEdit
            Tag = 23
            Left = 248
            Top = 112
            Width = 66
            Height = 21
            EditMask = '99:99:99:99;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            ReadOnly = True
            TabOrder = 22
            OnClick = me_day101Click
            OnEnter = me_day101Enter
          end
          object me_day124: TMaskEdit
            Tag = 24
            Left = 352
            Top = 112
            Width = 66
            Height = 21
            EditMask = '99:99:99:99;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            ReadOnly = True
            TabOrder = 23
            OnClick = me_day101Click
            OnEnter = me_day101Enter
          end
          object me_day125: TMaskEdit
            Tag = 25
            Left = 456
            Top = 112
            Width = 66
            Height = 21
            EditMask = '99:99:99:99;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            ReadOnly = True
            TabOrder = 24
            OnClick = me_day101Click
            OnEnter = me_day101Enter
          end
          object me_day126: TMaskEdit
            Tag = 26
            Left = 40
            Top = 136
            Width = 66
            Height = 21
            EditMask = '99:99:99:99;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            ReadOnly = True
            TabOrder = 25
            OnClick = me_day101Click
            OnEnter = me_day101Enter
          end
          object me_day127: TMaskEdit
            Tag = 27
            Left = 144
            Top = 136
            Width = 66
            Height = 21
            EditMask = '99:99:99:99;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            ReadOnly = True
            TabOrder = 26
            OnClick = me_day101Click
            OnEnter = me_day101Enter
          end
          object me_day128: TMaskEdit
            Tag = 28
            Left = 248
            Top = 136
            Width = 66
            Height = 21
            EditMask = '99:99:99:99;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            ReadOnly = True
            TabOrder = 27
            OnClick = me_day101Click
            OnEnter = me_day101Enter
          end
          object me_day129: TMaskEdit
            Tag = 29
            Left = 352
            Top = 136
            Width = 66
            Height = 21
            EditMask = '99:99:99:99;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            ReadOnly = True
            TabOrder = 28
            OnClick = me_day101Click
            OnEnter = me_day101Enter
          end
          object me_day130: TMaskEdit
            Tag = 30
            Left = 456
            Top = 136
            Width = 66
            Height = 21
            EditMask = '99:99:99:99;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            ReadOnly = True
            TabOrder = 29
            OnClick = me_day101Click
            OnEnter = me_day101Enter
          end
          object me_day131: TMaskEdit
            Tag = 31
            Left = 40
            Top = 160
            Width = 66
            Height = 21
            EditMask = '99:99:99:99;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            ReadOnly = True
            TabOrder = 30
            OnClick = me_day101Click
            OnEnter = me_day101Enter
          end
        end
        object TntGroupBox3: TTntGroupBox
          Left = 0
          Top = 169
          Width = 598
          Height = 124
          Align = alClient
          Caption = 'seg_day_detail'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object dbg_seg1: TTntDBGrid
            Left = 2
            Top = 15
            Width = 594
            Height = 107
            Align = alClient
            DataSource = ds_CurSeg
            FixedColor = clSkyBlue
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clRed
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'now_day'
                Title.Caption = 'date'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 41
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'clas_code'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 56
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'clas_name'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 62
                Visible = True
              end
              item
                Expanded = False
                FieldName = 's_start'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 56
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'start_b'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 48
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'start_e'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 48
                Visible = True
              end
              item
                Expanded = False
                FieldName = 's_end'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 56
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'end_b'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 49
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'end_e'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 43
                Visible = True
              end>
          end
        end
        object PanelPrint: TTntPanel
          Left = 0
          Top = 293
          Width = 598
          Height = 41
          Align = alBottom
          TabOrder = 2
          object bbtn_Print: TTntBitBtn
            Left = 168
            Top = 8
            Width = 75
            Height = 25
            Caption = 'print'
            Enabled = False
            TabOrder = 0
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
          object bbtn_Close: TTntBitBtn
            Left = 248
            Top = 8
            Width = 75
            Height = 25
            Caption = 'close'
            TabOrder = 1
            OnClick = bbtn_CloseClick
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
        end
      end
    end
    object TntTabSheet2: TTntTabSheet
      Caption = 'weihu'
      object TntGroupBox5: TTntGroupBox
        Left = 0
        Top = 0
        Width = 793
        Height = 77
        Align = alTop
        Caption = 'search_condition'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object TntLabel2: TTntLabel
          Left = 8
          Top = 16
          Width = 89
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'fld_tms_mon'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object sb_ChoseEmp2: TTntSpeedButton
          Left = 352
          Top = 8
          Width = 23
          Height = 22
          Caption = '...'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          OnClick = sb_ChoseEmp2Click
        end
        object TntLabel3: TTntLabel
          Left = 277
          Top = 56
          Width = 73
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'fld_epindt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object me_Month2: TMaskEdit
          Left = 104
          Top = 12
          Width = 57
          Height = 21
          EditMask = '9999/99;0;_'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
          MaxLength = 7
          ParentFont = False
          TabOrder = 0
          OnChange = me_Month2Change
        end
        object rb_ByEmp2: TTntRadioButton
          Left = 208
          Top = 11
          Width = 81
          Height = 17
          BiDiMode = bdLeftToRight
          Caption = 'by_empid'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentBiDiMode = False
          ParentFont = False
          TabOrder = 1
          OnClick = rb_ByEmp2Click
        end
        object EditEmp2: TTntEdit
          Left = 294
          Top = 9
          Width = 57
          Height = 21
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
          ParentFont = False
          TabOrder = 2
        end
        object rb_ByDept2: TTntRadioButton
          Left = 208
          Top = 33
          Width = 81
          Height = 17
          BiDiMode = bdLeftToRight
          Caption = 'by_deptcode'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentBiDiMode = False
          ParentFont = False
          TabOrder = 3
          OnClick = rb_ByDept2Click
        end
        object cob_DeptBeg2: TTntComboBox
          Left = 294
          Top = 31
          Width = 147
          Height = 21
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
          ItemHeight = 13
          ParentFont = False
          TabOrder = 4
          OnChange = cob_DeptBeg2Change
        end
        object cob_DeptEnd2: TTntComboBox
          Left = 448
          Top = 31
          Width = 147
          Height = 21
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
          ItemHeight = 13
          ParentFont = False
          TabOrder = 5
        end
        object bbtn_Confirm2: TTntBitBtn
          Left = 640
          Top = 12
          Width = 65
          Height = 25
          Caption = 'ok'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          OnClick = bbtn_Confirm2Click
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
        object bbtn_Reset2: TTntBitBtn
          Left = 640
          Top = 43
          Width = 65
          Height = 25
          Caption = 'reset'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          OnClick = bbtn_Reset2Click
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
            33333333333F8888883F33330000324334222222443333388F3833333388F333
            000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
            F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
            223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
            3338888300003AAAAAAA33333333333888888833333333330000333333333333
            333333333333333333FFFFFF000033333333333344444433FFFF333333888888
            00003A444333333A22222438888F333338F3333800003A2243333333A2222438
            F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
            22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
            33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
            3333333333338888883333330000333333333333333333333333333333333333
            0000}
          NumGlyphs = 2
        end
        object TntStaticText2: TTntStaticText
          Left = 8
          Top = 36
          Width = 173
          Height = 17
          AutoSize = False
          Caption = 'input_month_info'
          Color = clYellow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 8
        end
        object dtp_begin: TTntDateTimePicker
          Left = 359
          Top = 52
          Width = 81
          Height = 21
          Date = 37257.449101006940000000
          Time = 37257.449101006940000000
          Enabled = False
          ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
          TabOrder = 9
        end
        object dtp_end: TTntDateTimePicker
          Left = 449
          Top = 52
          Width = 81
          Height = 21
          Date = 38769.449101006940000000
          Time = 38769.449101006940000000
          Enabled = False
          ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
          TabOrder = 10
        end
      end
      object TntPanel2: TTntPanel
        Left = 148
        Top = 77
        Width = 645
        Height = 346
        Align = alClient
        BevelOuter = bvNone
        Caption = 'TntPanel2'
        TabOrder = 1
        object TntGroupBox7: TTntGroupBox
          Left = 0
          Top = 0
          Width = 645
          Height = 60
          Align = alTop
          Caption = 'pub_setting'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object sb_WorkDay: TTntSpeedButton
            Left = 197
            Top = 9
            Width = 23
            Height = 22
            Caption = '...'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object sb_Sunday: TTntSpeedButton
            Left = 435
            Top = 11
            Width = 23
            Height = 22
            Caption = '...'
            Enabled = False
          end
          object sb_weekwork: TTntSpeedButton
            Left = 197
            Top = 34
            Width = 22
            Height = 22
            Caption = '...'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object sb_weeksunday: TTntSpeedButton
            Left = 435
            Top = 32
            Width = 23
            Height = 22
            Caption = '...'
            Enabled = False
          end
          object cb_WorkDay: TTntCheckBox
            Left = 14
            Top = 14
            Width = 105
            Height = 17
            Caption = 'month_workday'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnClick = cb_WorkDayClick
          end
          object me_WorkDay: TMaskEdit
            Left = 132
            Top = 10
            Width = 65
            Height = 21
            BevelInner = bvNone
            BevelOuter = bvSpace
            Enabled = False
            EditMask = 'cc:cc:cc:cc;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            TabOrder = 1
            OnChange = me_day101Change
            OnClick = me_day101Click
            OnDblClick = me_day206DblClick
            OnEnter = me_day101Enter
          end
          object cb_Sunday: TTntCheckBox
            Left = 256
            Top = 13
            Width = 105
            Height = 17
            Caption = 'month_sunday'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            OnClick = cb_SundayClick
          end
          object me_Sunday: TMaskEdit
            Left = 368
            Top = 11
            Width = 65
            Height = 21
            BevelOuter = bvSpace
            Enabled = False
            EditMask = 'cc:cc:cc:cc;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            TabOrder = 3
            OnChange = me_day101Change
            OnClick = me_day101Click
            OnDblClick = me_day206DblClick
            OnEnter = me_day101Enter
          end
          object bbtn_Set: TTntBitBtn
            Left = 466
            Top = 11
            Width = 75
            Height = 22
            Caption = 'set'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            OnClick = bbtn_SetClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333333333333333333333333333333333FFF333333333333000333333333
              3333777FFF3FFFFF33330B000300000333337F777F777773F333000E00BFBFB0
              3333777F773333F7F333000E0BFBF0003333777F7F3337773F33000E0FBFBFBF
              0333777F7F3333FF7FFF000E0BFBF0000003777F7F3337777773000E0FBFBFBF
              BFB0777F7F33FFFFFFF7000E0BF000000003777F7FF777777773000000BFB033
              33337777773FF733333333333300033333333333337773333333333333333333
              3333333333333333333333333333333333333333333333333333333333333333
              3333333333333333333333333333333333333333333333333333}
            NumGlyphs = 2
          end
          object cb_weekwork: TTntCheckBox
            Left = 14
            Top = 36
            Width = 103
            Height = 17
            Caption = 'week_workday'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            OnClick = cb_weekworkClick
          end
          object me_weekwork: TMaskEdit
            Left = 132
            Top = 35
            Width = 64
            Height = 21
            BevelInner = bvNone
            BevelOuter = bvSpace
            Enabled = False
            EditMask = 'cc:cc:cc:cc;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            TabOrder = 6
            OnChange = me_day101Change
            OnClick = me_day101Click
            OnDblClick = me_day206DblClick
            OnEnter = me_day101Enter
          end
          object cb_weekSunday: TTntCheckBox
            Left = 256
            Top = 36
            Width = 104
            Height = 17
            Caption = 'week_sunday'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 7
            OnClick = cb_weekSundayClick
          end
          object me_weeksunday: TMaskEdit
            Left = 368
            Top = 33
            Width = 65
            Height = 21
            BevelOuter = bvSpace
            Enabled = False
            EditMask = 'cc:cc:cc:cc;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            TabOrder = 8
            OnChange = me_day101Change
            OnClick = me_day101Click
            OnDblClick = me_day206DblClick
            OnEnter = me_day101Enter
          end
          object bbtn_setw: TTntBitBtn
            Left = 467
            Top = 35
            Width = 75
            Height = 21
            Caption = 'set'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 9
            OnClick = bbtn_setwClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333333333333333333333333333333333FFF333333333333000333333333
              3333777FFF3FFFFF33330B000300000333337F777F777773F333000E00BFBFB0
              3333777F773333F7F333000E0BFBF0003333777F7F3337773F33000E0FBFBFBF
              0333777F7F3333FF7FFF000E0BFBF0000003777F7F3337777773000E0FBFBFBF
              BFB0777F7F33FFFFFFF7000E0BF000000003777F7FF777777773000000BFB033
              33337777773FF733333333333300033333333333337773333333333333333333
              3333333333333333333333333333333333333333333333333333333333333333
              3333333333333333333333333333333333333333333333333333}
            NumGlyphs = 2
          end
        end
        object TntGroupBox8: TTntGroupBox
          Left = 0
          Top = 60
          Width = 645
          Height = 241
          Align = alClient
          Caption = 'tms_date_detail'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object lbl_Day208: TTntLabel
            Left = 40
            Top = 46
            Width = 17
            Height = 16
            Alignment = taRightJustify
            BiDiMode = bdLeftToRight
            Caption = '08'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentBiDiMode = False
            ParentFont = False
          end
          object lbl_Day207: TTntLabel
            Left = 549
            Top = 15
            Width = 17
            Height = 16
            Alignment = taRightJustify
            Caption = '07'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_Day206: TTntLabel
            Left = 464
            Top = 16
            Width = 17
            Height = 16
            Alignment = taRightJustify
            Caption = '06'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_Day205: TTntLabel
            Left = 379
            Top = 17
            Width = 17
            Height = 16
            Alignment = taRightJustify
            Caption = '05'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_Day203: TTntLabel
            Left = 208
            Top = 21
            Width = 17
            Height = 16
            Alignment = taRightJustify
            Caption = '03'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_Day204: TTntLabel
            Left = 294
            Top = 21
            Width = 17
            Height = 16
            Alignment = taRightJustify
            BiDiMode = bdLeftToRight
            Caption = '04'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentBiDiMode = False
            ParentFont = False
          end
          object lbl_Day231: TTntLabel
            Left = 207
            Top = 114
            Width = 17
            Height = 16
            Alignment = taRightJustify
            Caption = '31'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_Day230: TTntLabel
            Left = 125
            Top = 114
            Width = 17
            Height = 16
            Alignment = taRightJustify
            Caption = '30'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_Day229: TTntLabel
            Left = 37
            Top = 114
            Width = 17
            Height = 16
            Alignment = taRightJustify
            Caption = '29'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_Day202: TTntLabel
            Left = 124
            Top = 21
            Width = 17
            Height = 16
            Alignment = taRightJustify
            Caption = '02'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_Day228: TTntLabel
            Left = 549
            Top = 90
            Width = 17
            Height = 16
            Alignment = taRightJustify
            BiDiMode = bdLeftToRight
            Caption = '28'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentBiDiMode = False
            ParentFont = False
          end
          object lbl_Day227: TTntLabel
            Left = 466
            Top = 88
            Width = 17
            Height = 16
            Alignment = taRightJustify
            Caption = '27'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_Day226: TTntLabel
            Left = 381
            Top = 90
            Width = 17
            Height = 16
            Alignment = taRightJustify
            Caption = '26'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_Day225: TTntLabel
            Left = 293
            Top = 90
            Width = 17
            Height = 16
            Alignment = taRightJustify
            Caption = '25'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_Day224: TTntLabel
            Left = 207
            Top = 90
            Width = 17
            Height = 16
            Alignment = taRightJustify
            BiDiMode = bdLeftToRight
            Caption = '24'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentBiDiMode = False
            ParentFont = False
          end
          object lbl_Day223: TTntLabel
            Left = 125
            Top = 90
            Width = 17
            Height = 16
            Alignment = taRightJustify
            Caption = '23'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_Day222: TTntLabel
            Left = 37
            Top = 89
            Width = 17
            Height = 16
            Alignment = taRightJustify
            Caption = '22'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_Day221: TTntLabel
            Left = 549
            Top = 66
            Width = 17
            Height = 16
            Alignment = taRightJustify
            Caption = '21'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_Day220: TTntLabel
            Left = 466
            Top = 64
            Width = 17
            Height = 16
            Alignment = taRightJustify
            BiDiMode = bdLeftToRight
            Caption = '20'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentBiDiMode = False
            ParentFont = False
          end
          object lbl_Day219: TTntLabel
            Left = 381
            Top = 66
            Width = 17
            Height = 16
            Alignment = taRightJustify
            Caption = '19'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_Day201: TTntLabel
            Left = 41
            Top = 20
            Width = 17
            Height = 16
            Alignment = taRightJustify
            Caption = '01'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_Day218: TTntLabel
            Left = 294
            Top = 64
            Width = 17
            Height = 16
            Alignment = taRightJustify
            Caption = '18'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_Day217: TTntLabel
            Left = 209
            Top = 63
            Width = 17
            Height = 16
            Alignment = taRightJustify
            Caption = '17'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_Day216: TTntLabel
            Left = 125
            Top = 64
            Width = 17
            Height = 16
            Alignment = taRightJustify
            BiDiMode = bdLeftToRight
            Caption = '16'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentBiDiMode = False
            ParentFont = False
          end
          object lbl_Day215: TTntLabel
            Left = 39
            Top = 65
            Width = 17
            Height = 16
            Alignment = taRightJustify
            Caption = '15'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_Day214: TTntLabel
            Left = 549
            Top = 40
            Width = 17
            Height = 16
            Alignment = taRightJustify
            Caption = '14'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_Day213: TTntLabel
            Left = 464
            Top = 37
            Width = 17
            Height = 16
            Alignment = taRightJustify
            Caption = '13'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_Day212: TTntLabel
            Left = 379
            Top = 39
            Width = 17
            Height = 16
            Alignment = taRightJustify
            BiDiMode = bdLeftToRight
            Caption = '12'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentBiDiMode = False
            ParentFont = False
          end
          object lbl_Day211: TTntLabel
            Left = 295
            Top = 40
            Width = 17
            Height = 16
            Alignment = taRightJustify
            Caption = '11'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_Day210: TTntLabel
            Left = 205
            Top = 42
            Width = 17
            Height = 16
            Alignment = taRightJustify
            Caption = '10'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_Day209: TTntLabel
            Left = 125
            Top = 41
            Width = 17
            Height = 16
            Alignment = taRightJustify
            Caption = '09'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object me_day208: TMaskEdit
            Tag = 8
            Left = 59
            Top = 40
            Width = 65
            Height = 21
            Enabled = False
            EditMask = 'cc:cc:cc:cc;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            TabOrder = 7
            OnChange = me_day101Change
            OnClick = me_day101Click
            OnDblClick = me_day206DblClick
            OnEnter = me_day101Enter
            OnKeyDown = me_day201KeyDown
          end
          object me_day207: TMaskEdit
            Tag = 7
            Left = 567
            Top = 12
            Width = 65
            Height = 21
            Enabled = False
            EditMask = 'cc:cc:cc:cc;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            TabOrder = 6
            OnChange = me_day101Change
            OnClick = me_day101Click
            OnDblClick = me_day206DblClick
            OnEnter = me_day101Enter
            OnKeyDown = me_day201KeyDown
          end
          object me_day206: TMaskEdit
            Tag = 6
            Left = 484
            Top = 12
            Width = 65
            Height = 21
            Enabled = False
            EditMask = 'cc:cc:cc:cc;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            TabOrder = 5
            OnChange = me_day101Change
            OnClick = me_day101Click
            OnDblClick = me_day206DblClick
            OnEnter = me_day101Enter
            OnKeyDown = me_day201KeyDown
          end
          object me_day205: TMaskEdit
            Tag = 5
            Left = 399
            Top = 13
            Width = 65
            Height = 21
            Enabled = False
            EditMask = 'cc:cc:cc:cc;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            TabOrder = 4
            OnChange = me_day101Change
            OnClick = me_day101Click
            OnDblClick = me_day206DblClick
            OnEnter = me_day101Enter
            OnKeyDown = me_day201KeyDown
          end
          object me_day203: TMaskEdit
            Tag = 3
            Left = 228
            Top = 16
            Width = 65
            Height = 21
            Enabled = False
            EditMask = 'cc:cc:cc:cc;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            TabOrder = 2
            OnChange = me_day101Change
            OnClick = me_day101Click
            OnDblClick = me_day206DblClick
            OnEnter = me_day101Enter
            OnKeyDown = me_day201KeyDown
          end
          object me_day204: TMaskEdit
            Tag = 4
            Left = 314
            Top = 14
            Width = 65
            Height = 21
            Enabled = False
            EditMask = 'cc:cc:cc:cc;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            TabOrder = 3
            OnChange = me_day101Change
            OnClick = me_day101Click
            OnDblClick = me_day206DblClick
            OnEnter = me_day101Enter
            OnKeyDown = me_day201KeyDown
          end
          object me_day231: TMaskEdit
            Tag = 31
            Left = 226
            Top = 109
            Width = 65
            Height = 21
            Enabled = False
            EditMask = 'cc:cc:cc:cc;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            TabOrder = 30
            OnChange = me_day101Change
            OnClick = me_day101Click
            OnDblClick = me_day206DblClick
            OnEnter = me_day101Enter
            OnKeyDown = me_day201KeyDown
          end
          object me_day230: TMaskEdit
            Tag = 30
            Left = 144
            Top = 109
            Width = 65
            Height = 21
            Enabled = False
            EditMask = 'cc:cc:cc:cc;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            TabOrder = 29
            OnChange = me_day101Change
            OnClick = me_day101Click
            OnDblClick = me_day206DblClick
            OnEnter = me_day101Enter
            OnKeyDown = me_day201KeyDown
          end
          object me_day229: TMaskEdit
            Tag = 29
            Left = 56
            Top = 109
            Width = 65
            Height = 21
            Enabled = False
            EditMask = 'cc:cc:cc:cc;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            TabOrder = 28
            OnChange = me_day101Change
            OnClick = me_day101Click
            OnDblClick = me_day206DblClick
            OnEnter = me_day101Enter
            OnKeyDown = me_day201KeyDown
          end
          object me_day202: TMaskEdit
            Tag = 2
            Left = 143
            Top = 16
            Width = 65
            Height = 21
            Enabled = False
            EditMask = 'cc:cc:cc:cc;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            TabOrder = 1
            OnChange = me_day101Change
            OnClick = me_day101Click
            OnDblClick = me_day206DblClick
            OnEnter = me_day101Enter
            OnKeyDown = me_day201KeyDown
          end
          object me_day228: TMaskEdit
            Tag = 28
            Left = 568
            Top = 85
            Width = 65
            Height = 21
            Enabled = False
            EditMask = 'cc:cc:cc:cc;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            TabOrder = 27
            OnChange = me_day101Change
            OnClick = me_day101Click
            OnDblClick = me_day206DblClick
            OnEnter = me_day101Enter
            OnKeyDown = me_day201KeyDown
          end
          object me_day227: TMaskEdit
            Tag = 27
            Left = 484
            Top = 85
            Width = 65
            Height = 21
            Enabled = False
            EditMask = 'cc:cc:cc:cc;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            TabOrder = 26
            OnChange = me_day101Change
            OnClick = me_day101Click
            OnDblClick = me_day206DblClick
            OnEnter = me_day101Enter
            OnKeyDown = me_day201KeyDown
          end
          object me_day226: TMaskEdit
            Tag = 26
            Left = 400
            Top = 85
            Width = 65
            Height = 21
            Enabled = False
            EditMask = 'cc:cc:cc:cc;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            TabOrder = 25
            OnChange = me_day101Change
            OnClick = me_day101Click
            OnDblClick = me_day206DblClick
            OnEnter = me_day101Enter
            OnKeyDown = me_day201KeyDown
          end
          object me_day225: TMaskEdit
            Tag = 25
            Left = 312
            Top = 85
            Width = 65
            Height = 21
            Enabled = False
            EditMask = 'cc:cc:cc:cc;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            TabOrder = 24
            OnChange = me_day101Change
            OnClick = me_day101Click
            OnDblClick = me_day206DblClick
            OnEnter = me_day101Enter
            OnKeyDown = me_day201KeyDown
          end
          object me_day224: TMaskEdit
            Tag = 24
            Left = 226
            Top = 85
            Width = 65
            Height = 21
            Enabled = False
            EditMask = 'cc:cc:cc:cc;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            TabOrder = 23
            OnChange = me_day101Change
            OnClick = me_day101Click
            OnDblClick = me_day206DblClick
            OnEnter = me_day101Enter
            OnKeyDown = me_day201KeyDown
          end
          object me_day223: TMaskEdit
            Tag = 23
            Left = 144
            Top = 85
            Width = 65
            Height = 21
            Enabled = False
            EditMask = 'cc:cc:cc:cc;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            TabOrder = 22
            OnChange = me_day101Change
            OnClick = me_day101Click
            OnDblClick = me_day206DblClick
            OnEnter = me_day101Enter
            OnKeyDown = me_day201KeyDown
          end
          object me_day222: TMaskEdit
            Tag = 22
            Left = 56
            Top = 85
            Width = 65
            Height = 21
            Enabled = False
            EditMask = 'cc:cc:cc:cc;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            TabOrder = 21
            OnChange = me_day101Change
            OnClick = me_day101Click
            OnDblClick = me_day206DblClick
            OnEnter = me_day101Enter
            OnKeyDown = me_day201KeyDown
          end
          object me_day221: TMaskEdit
            Tag = 21
            Left = 568
            Top = 61
            Width = 65
            Height = 21
            Enabled = False
            EditMask = 'cc:cc:cc:cc;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            TabOrder = 20
            OnChange = me_day101Change
            OnClick = me_day101Click
            OnDblClick = me_day206DblClick
            OnEnter = me_day101Enter
            OnKeyDown = me_day201KeyDown
          end
          object me_day220: TMaskEdit
            Tag = 20
            Left = 485
            Top = 61
            Width = 65
            Height = 21
            Enabled = False
            EditMask = 'cc:cc:cc:cc;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            TabOrder = 19
            OnChange = me_day101Change
            OnClick = me_day101Click
            OnDblClick = me_day206DblClick
            OnEnter = me_day101Enter
            OnKeyDown = me_day201KeyDown
          end
          object me_day219: TMaskEdit
            Tag = 19
            Left = 400
            Top = 61
            Width = 65
            Height = 21
            Enabled = False
            EditMask = 'cc:cc:cc:cc;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            TabOrder = 18
            OnChange = me_day101Change
            OnClick = me_day101Click
            OnDblClick = me_day206DblClick
            OnEnter = me_day101Enter
            OnKeyDown = me_day201KeyDown
          end
          object me_day201: TMaskEdit
            Tag = 1
            Left = 60
            Top = 16
            Width = 65
            Height = 21
            Enabled = False
            EditMask = 'cc:cc:cc:cc;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -8
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            TabOrder = 0
            OnChange = me_day101Change
            OnClick = me_day101Click
            OnDblClick = me_day206DblClick
            OnEnter = me_day101Enter
            OnKeyDown = me_day201KeyDown
          end
          object me_day218: TMaskEdit
            Tag = 18
            Left = 313
            Top = 61
            Width = 65
            Height = 21
            Enabled = False
            EditMask = 'cc:cc:cc:cc;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            TabOrder = 17
            OnChange = me_day101Change
            OnClick = me_day101Click
            OnDblClick = me_day206DblClick
            OnEnter = me_day101Enter
            OnKeyDown = me_day201KeyDown
          end
          object me_day217: TMaskEdit
            Tag = 17
            Left = 227
            Top = 61
            Width = 65
            Height = 21
            Enabled = False
            EditMask = 'cc:cc:cc:cc;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            TabOrder = 16
            OnChange = me_day101Change
            OnClick = me_day101Click
            OnDblClick = me_day206DblClick
            OnEnter = me_day101Enter
            OnKeyDown = me_day201KeyDown
          end
          object me_day216: TMaskEdit
            Tag = 16
            Left = 144
            Top = 61
            Width = 65
            Height = 21
            Enabled = False
            EditMask = 'cc:cc:cc:cc;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            TabOrder = 15
            OnChange = me_day101Change
            OnClick = me_day101Click
            OnDblClick = me_day206DblClick
            OnEnter = me_day101Enter
            OnKeyDown = me_day201KeyDown
          end
          object me_day215: TMaskEdit
            Tag = 15
            Left = 59
            Top = 61
            Width = 65
            Height = 21
            Enabled = False
            EditMask = 'cc:cc:cc:cc;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            TabOrder = 14
            OnChange = me_day101Change
            OnClick = me_day101Click
            OnDblClick = me_day206DblClick
            OnEnter = me_day101Enter
            OnKeyDown = me_day201KeyDown
          end
          object me_day214: TMaskEdit
            Tag = 14
            Left = 568
            Top = 37
            Width = 65
            Height = 21
            Enabled = False
            EditMask = 'cc:cc:cc:cc;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            TabOrder = 13
            OnChange = me_day101Change
            OnClick = me_day101Click
            OnDblClick = me_day206DblClick
            OnEnter = me_day101Enter
            OnKeyDown = me_day201KeyDown
          end
          object me_day213: TMaskEdit
            Tag = 13
            Left = 484
            Top = 36
            Width = 65
            Height = 21
            Enabled = False
            EditMask = 'cc:cc:cc:cc;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            TabOrder = 12
            OnChange = me_day101Change
            OnClick = me_day101Click
            OnDblClick = me_day206DblClick
            OnEnter = me_day101Enter
            OnKeyDown = me_day201KeyDown
          end
          object me_day212: TMaskEdit
            Tag = 12
            Left = 400
            Top = 37
            Width = 65
            Height = 21
            Enabled = False
            EditMask = 'cc:cc:cc:cc;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            TabOrder = 11
            OnChange = me_day101Change
            OnClick = me_day101Click
            OnDblClick = me_day206DblClick
            OnEnter = me_day101Enter
            OnKeyDown = me_day201KeyDown
          end
          object me_day211: TMaskEdit
            Tag = 11
            Left = 313
            Top = 37
            Width = 65
            Height = 21
            Enabled = False
            EditMask = 'cc:cc:cc:cc;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            TabOrder = 10
            OnChange = me_day101Change
            OnClick = me_day101Click
            OnDblClick = me_day206DblClick
            OnEnter = me_day101Enter
            OnKeyDown = me_day201KeyDown
          end
          object me_day210: TMaskEdit
            Tag = 10
            Left = 228
            Top = 39
            Width = 65
            Height = 21
            Enabled = False
            EditMask = 'cc:cc:cc:cc;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            TabOrder = 9
            OnChange = me_day101Change
            OnClick = me_day101Click
            OnDblClick = me_day206DblClick
            OnEnter = me_day101Enter
            OnKeyDown = me_day201KeyDown
          end
          object me_day209: TMaskEdit
            Tag = 9
            Left = 143
            Top = 39
            Width = 65
            Height = 21
            Enabled = False
            EditMask = 'cc:cc:cc:cc;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            TabOrder = 8
            OnChange = me_day101Change
            OnClick = me_day101Click
            OnDblClick = me_day206DblClick
            OnEnter = me_day101Enter
            OnKeyDown = me_day201KeyDown
          end
          object dbg_seg3: TTntDBGrid
            Left = 2
            Top = 178
            Width = 641
            Height = 61
            Align = alBottom
            DataSource = ds_CurSeg
            FixedColor = clSkyBlue
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            ParentFont = False
            ReadOnly = True
            TabOrder = 31
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clRed
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnTitleClick = dbg_seg3TitleClick
            Columns = <
              item
                Expanded = False
                FieldName = 'now_day'
                Title.Caption = 'date'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 41
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'clas_code'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 56
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'clas_name'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 62
                Visible = True
              end
              item
                Expanded = False
                FieldName = 's_start'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 56
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'start_b'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 48
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'start_e'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 48
                Visible = True
              end
              item
                Expanded = False
                FieldName = 's_end'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 56
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'end_b'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 49
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'end_e'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 43
                Visible = True
              end>
          end
        end
        object TntGroupBox9: TTntGroupBox
          Left = 0
          Top = 301
          Width = 645
          Height = 45
          Align = alBottom
          Caption = 'action'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          object bbtn_Save: TTntBitBtn
            Left = 183
            Top = 12
            Width = 75
            Height = 25
            Caption = 'save'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnClick = bbtn_SaveClick
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
          object bbtn_Close2: TTntBitBtn
            Left = 263
            Top = 12
            Width = 75
            Height = 25
            Caption = 'cancel'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnClick = bbtn_Close2Click
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
      end
      object TntGroupBox6: TTntGroupBox
        Left = 0
        Top = 77
        Width = 148
        Height = 346
        Align = alLeft
        Caption = 'choose_emp'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object clb_Emp: TTntCheckListBox
          Left = 2
          Top = 15
          Width = 144
          Height = 286
          Align = alClient
          Color = clSkyBlue
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
          ItemHeight = 13
          ParentFont = False
          TabOrder = 0
          OnClick = clb_EmpClick
        end
        object TntPanel3: TTntPanel
          Left = 2
          Top = 301
          Width = 144
          Height = 43
          Align = alBottom
          BevelOuter = bvLowered
          TabOrder = 1
          object sb_All: TTntSpeedButton
            Left = 3
            Top = 11
            Width = 68
            Height = 22
            Caption = 'choose_all'
            Enabled = False
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            OnClick = sb_AllClick
          end
          object sb_NotAll: TTntSpeedButton
            Left = 73
            Top = 11
            Width = 69
            Height = 22
            Caption = 'choose_none'
            Enabled = False
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            OnClick = sb_NotAllClick
          end
        end
      end
    end
    object TntTabSheet3: TTntTabSheet
      Caption = 'tms_tpl'
      object TntPanel6: TTntPanel
        Left = 0
        Top = 0
        Width = 793
        Height = 423
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 0
        object TntGroupBox10: TTntGroupBox
          Left = 1
          Top = 1
          Width = 791
          Height = 58
          Align = alTop
          Caption = 'search_condition'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Palatino Linotype'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
          object TntLabel4: TTntLabel
            Left = 8
            Top = 26
            Width = 89
            Height = 15
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'dept_code'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Palatino Linotype'
            Font.Style = []
            ParentFont = False
          end
          object cob_DeptBeg3: TTntComboBox
            Left = 104
            Top = 22
            Width = 161
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Palatino Linotype'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            ItemHeight = 16
            ParentFont = False
            TabOrder = 0
          end
          object cob_DeptEnd3: TTntComboBox
            Left = 272
            Top = 22
            Width = 161
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Palatino Linotype'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            ItemHeight = 16
            ParentFont = False
            TabOrder = 1
          end
          object TntBitBtn1: TTntBitBtn
            Left = 472
            Top = 20
            Width = 65
            Height = 25
            Caption = 'ok'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Palatino Linotype'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
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
        end
        object TntGroupBox11: TTntGroupBox
          Left = 1
          Top = 59
          Width = 456
          Height = 363
          Align = alLeft
          Caption = 'tms_dept'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Palatino Linotype'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object TntSpeedButton1: TTntSpeedButton
            Left = 56
            Top = 296
            Width = 81
            Height = 22
            Caption = 'choose_all'
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object TntSpeedButton2: TTntSpeedButton
            Left = 152
            Top = 296
            Width = 81
            Height = 22
            Caption = 'choose_none'
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object TntDBGrid1: TTntDBGrid
            Left = 2
            Top = 18
            Width = 452
            Height = 343
            Align = alClient
            DataSource = ds_DeptTpl
            FixedColor = clSkyBlue
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Palatino Linotype'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clRed
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'dept_code'
                ReadOnly = True
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'abbr_titl'
                ReadOnly = True
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 180
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'tms_work_day'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 77
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'tms_holiday'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 74
                Visible = True
              end>
          end
        end
        object TntGroupBox12: TTntGroupBox
          Left = 457
          Top = 59
          Width = 335
          Height = 363
          Align = alClient
          Caption = 'set'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Palatino Linotype'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          object cb_SetWork: TTntCheckBox
            Left = 16
            Top = 120
            Width = 97
            Height = 17
            Caption = 'workday_set'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Palatino Linotype'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object MaskEdit1: TMaskEdit
            Left = 113
            Top = 117
            Width = 83
            Height = 24
            BevelInner = bvNone
            BevelOuter = bvSpace
            Enabled = False
            EditMask = 'cc:cc:cc:cc;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Palatino Linotype'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            TabOrder = 1
          end
          object cb_SetHol: TTntCheckBox
            Left = 16
            Top = 160
            Width = 96
            Height = 17
            Caption = 'holiday_set'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Palatino Linotype'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object MaskEdit2: TMaskEdit
            Left = 113
            Top = 156
            Width = 83
            Height = 24
            BevelOuter = bvSpace
            Enabled = False
            EditMask = 'cc:cc:cc:cc;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Palatino Linotype'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 11
            ParentFont = False
            TabOrder = 3
          end
          object rb_single: TTntRadioButton
            Left = 17
            Top = 72
            Width = 109
            Height = 17
            Caption = 'single_dept'
            Checked = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Palatino Linotype'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            TabStop = True
          end
          object rb_all: TTntRadioButton
            Left = 143
            Top = 72
            Width = 101
            Height = 17
            Caption = 'all_dept'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Palatino Linotype'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
          end
          object TntBitBtn5: TTntBitBtn
            Left = 176
            Top = 119
            Width = 18
            Height = 19
            Caption = '...'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Palatino Linotype'
            Font.Style = []
            ParentFont = False
            TabOrder = 6
          end
          object TntBitBtn6: TTntBitBtn
            Left = 176
            Top = 158
            Width = 18
            Height = 19
            Caption = '...'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Palatino Linotype'
            Font.Style = []
            ParentFont = False
            TabOrder = 7
          end
          object TntBitBtn2: TTntBitBtn
            Left = 16
            Top = 280
            Width = 75
            Height = 25
            Caption = 'save'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Palatino Linotype'
            Font.Style = []
            ParentFont = False
            TabOrder = 8
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
          object TntBitBtn4: TTntBitBtn
            Left = 215
            Top = 155
            Width = 75
            Height = 25
            Caption = 'set'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Palatino Linotype'
            Font.Style = []
            ParentFont = False
            TabOrder = 9
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333333333333333333333333333333333FFF333333333333000333333333
              3333777FFF3FFFFF33330B000300000333337F777F777773F333000E00BFBFB0
              3333777F773333F7F333000E0BFBF0003333777F7F3337773F33000E0FBFBFBF
              0333777F7F3333FF7FFF000E0BFBF0000003777F7F3337777773000E0FBFBFBF
              BFB0777F7F33FFFFFFF7000E0BF000000003777F7FF777777773000000BFB033
              33337777773FF733333333333300033333333333337773333333333333333333
              3333333333333333333333333333333333333333333333333333333333333333
              3333333333333333333333333333333333333333333333333333}
            NumGlyphs = 2
          end
        end
      end
    end
  end
  object TntPanel1: TTntPanel
    Left = 0
    Top = 0
    Width = 801
    Height = 33
    Align = alTop
    Caption = 'fhrd204_titl'
    Color = clCream
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object PanelFlow: TTntPanel
    Left = 173
    Top = 138
    Width = 593
    Height = 323
    BorderWidth = 3
    ParentShowHint = False
    ShowHint = False
    TabOrder = 2
    Visible = False
    object PanelFlowTitle: TTntPanel
      Left = 4
      Top = 4
      Width = 585
      Height = 28
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvLowered
      BorderWidth = 2
      Caption = 'choose_seg_code'
      Color = clGradientActiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object ImageClose: TImage
        Left = 563
        Top = 3
        Width = 21
        Height = 21
        Picture.Data = {
          07544269746D61702E040000424D2E0400000000000036020000280000001500
          0000150000000100080000000000F8010000C40E0000C40E0000800000008000
          00005464E500FCC48E001943DA00CDD2F300FFFFF9003758DB00224CE6002E4B
          BC00F9FFFF004764DC00475CE5001938B0001B53E5001547E900FFFAFF006983
          E9001C38A800F8BB90000445DF007685F100758CEC00FCF6EC000237D9000A3D
          E3003B61E400909BEE004B6AEC005B76EA000429AC00FAFEF500F7FDFE00FEFC
          FF00617FE300384EE3004D6BE5000625B500586AEF002B45CF007B94E8005370
          E100F2FEFF006979F300FFFEF6004D70E700FBFFFB005F7CE5003C5AE300103D
          D500F1FAFF004165E7000C46E4005971E7003464E400556BDB00152DB2002450
          DB002B53E5006A7BED00042AD700FFFDFF003455E1006474E2006174EC002E5C
          DC00345CEC00F2FFFA001C49CF005374EA004363EC00ADB8F100234BD6002B52
          DC005E82E600547BE1005C79E7003D69E2002646DC0096AAF2002B4BD6003B55
          EB002D59E500F7FFFA001D4DDF00244FE3004866E6003762EB00FFFBFB008DA2
          EE000531A5003659E400FFFFFC00FDFFFC001132A0003361DE007F97F10090AB
          E300FFF8F0002859D9000C41CE00284EEB00F3F3FF002055ED003B5FE700235C
          EE000B51DE003E5CDF003960F200E7DEFF00FCFFFF002A63E4001D4DF2009CB1
          FF00456ADF00FBFBFB005C75F5004E62EB00456DEB002F4BCE00FFFCFC00F8FF
          F700EAFFFF000526C900193AC6005075DE00294BDA002144D2006974ED00FFFF
          FF007F013B1F04300E0E0E1F6C080E2C5108043B60017F000000010307585C10
          5C5C0B3658363636231C231C10030100000015427A2F4225754C62427D7D4262
          2F62163A79101D000000082F4C21213C052105383F630C0D321717163A1C2800
          000077174638662E1840185D4067650C066E121216233B0000000E0247690945
          784409550A6D50180E6F6817161C770000002C024F18006C2A281A54346A671E
          04280D0D2F1C080000005A46665422247F0E1D314B34087F5A680C0D2F360400
          00005A53313543272B7F0E0E343B3B6463650D0D0236040000005B3C541B7B2B
          2727082A0E085138380D5352020B5A0000005B692433221B3300735A2A0E3F0C
          52060653460B5A0000005A2E4A4A393D2B7B300E086C1F6352060637460B5A00
          00005A4B297E492B241D0441591E2A3B37523747460B5A0000005B540F0F482D
          3B08510A0A507F1D1E7C63474E0B5A0000002C350F143928560E5409550A611F
          762C533C4E0B5B0000001E33135E0F03303D7373350A500930453F614E0B3B00
          00000E4919572614132D20431A1A7409000A593C750B410000002A484D4D5726
          131320200F203E4A1A2B736942360E0000003B14575F19140F290F203E1B727B
          22706621420715000000116B134A1B1A7069094B2E663F3F4F3C374C07030100
          00007F111508713B5A3B1F76045A5A3B560E1F1E04117F000000}
      end
    end
    object dbg_seg2: TTntDBGrid
      Left = 4
      Top = 32
      Width = 585
      Height = 252
      Align = alClient
      Ctl3D = False
      DataSource = ds_Seg
      FixedColor = clSkyBlue
      ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = dbg_seg2CellClick
      OnDrawColumnCell = dbg_seg2DrawColumnCell
      OnTitleClick = dbg_seg2TitleClick
      Columns = <
        item
          ButtonStyle = cbsNone
          Expanded = False
          FieldName = 'flag'
          Title.Caption = 'choose'
          Width = 22
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'seg_code'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'clas_code'
          ReadOnly = True
          Width = 54
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'clas_chs'
          ReadOnly = True
          Width = 69
          Visible = True
        end
        item
          Expanded = False
          FieldName = 's_start'
          ReadOnly = True
          Width = 57
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'start_b'
          ReadOnly = True
          Title.Caption = 'start_time'
          Width = 48
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'start_e'
          ReadOnly = True
          Title.Caption = 'end_time'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 's_end'
          ReadOnly = True
          Width = 58
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'end_b'
          ReadOnly = True
          Title.Caption = 'start_time'
          Width = 53
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'end_e'
          ReadOnly = True
          Title.Caption = 'end_time'
          Width = 51
          Visible = True
        end>
    end
    object TntPanel5: TTntPanel
      Left = 4
      Top = 284
      Width = 585
      Height = 35
      Align = alBottom
      BevelOuter = bvLowered
      Color = clMoneyGreen
      TabOrder = 2
      object bbtn_SegClose: TTntBitBtn
        Left = 282
        Top = 5
        Width = 71
        Height = 25
        Caption = 'cancel'
        TabOrder = 0
        OnClick = bbtn_SegCloseClick
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
      object bbtn_SegOK: TTntBitBtn
        Left = 208
        Top = 5
        Width = 71
        Height = 25
        Caption = 'ok'
        TabOrder = 1
        OnClick = bbtn_SegOKClick
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
    end
  end
  object qry_emp1: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    CommandTimeout = 0
    Parameters = <>
    Left = 4
    Top = 2
  end
  object ds_emp1: TDataSource
    DataSet = qry_emp1
    Left = 36
    Top = 2
  end
  object dst_tms1: TADODataSet
    AutoCalcFields = False
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    CommandTimeout = 0
    DataSource = ds_emp1
    IndexFieldNames = 'emp_id'
    MasterFields = 'emp_id'
    Parameters = <>
    Left = 100
    Top = 2
  end
  object qry_CurSeg: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    CommandTimeout = 0
    Parameters = <>
    Left = 144
  end
  object ds_CurSeg: TDataSource
    DataSet = qry_CurSeg
    Left = 172
    Top = 1
  end
  object ds_Seg: TDataSource
    DataSet = qry_seg
    Left = 568
  end
  object cds_Seg: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 532
    Top = 1
    object cds_Segflag: TBooleanField
      FieldName = 'flag'
    end
    object cds_Segseg_code: TStringField
      FieldName = 'seg_code'
      Size = 2
    end
    object cds_Segclas_code: TStringField
      FieldName = 'clas_code'
      FixedChar = True
      Size = 2
    end
    object cds_Segclas_chs: TWideStringField
      FieldName = 'clas_chs'
      Size = 10
    end
    object cds_Segs_start: TStringField
      FieldName = 's_start'
      FixedChar = True
      Size = 4
    end
    object cds_Segstart_b: TStringField
      FieldName = 'start_b'
      FixedChar = True
      Size = 4
    end
    object cds_Segstart_e: TStringField
      FieldName = 'start_e'
      FixedChar = True
      Size = 4
    end
    object cds_Segs_end: TStringField
      FieldName = 's_end'
      FixedChar = True
      Size = 4
    end
    object cds_Segend_b: TStringField
      FieldName = 'end_b'
      FixedChar = True
      Size = 4
    end
    object cds_Segend_e: TStringField
      FieldName = 'end_e'
      FixedChar = True
      Size = 4
    end
  end
  object qry_DeptTpl: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandTimeout = 0
    Parameters = <>
    Left = 629
    Top = 2
  end
  object ds_DeptTpl: TDataSource
    DataSet = qry_DeptTpl
    Left = 661
    Top = 2
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 1
    Left = 296
  end
  object qry_seg: TADOQuery
    Connection = DMHrdsys.conn
    LockType = ltBatchOptimistic
    CommandTimeout = 0
    Parameters = <>
    SQL.Strings = (
      
        'select a.upd_user as flag,a.*,b.*  from hrd_dut_seg a,hrd_dut_cl' +
        'ass b where 1<0')
    Left = 472
    object qry_segupd_user: TStringField
      FieldName = 'flag'
      Size = 16
    end
    object qry_segseg_code: TStringField
      FieldName = 'seg_code'
      Size = 2
    end
    object qry_segclas_code: TStringField
      FieldName = 'clas_code'
      FixedChar = True
      Size = 2
    end
    object qry_segclas_chs: TWideStringField
      FieldName = 'clas_chs'
      Size = 10
    end
    object qry_segs_start: TStringField
      FieldName = 's_start'
      FixedChar = True
      Size = 4
    end
    object qry_segstart_b: TStringField
      FieldName = 'start_b'
      FixedChar = True
      Size = 4
    end
    object qry_segstart_e: TStringField
      FieldName = 'start_e'
      FixedChar = True
      Size = 4
    end
    object qry_segs_end: TStringField
      FieldName = 's_end'
      FixedChar = True
      Size = 4
    end
    object qry_segend_b: TStringField
      FieldName = 'end_b'
      FixedChar = True
      Size = 4
    end
    object qry_segend_e: TStringField
      FieldName = 'end_e'
      FixedChar = True
      Size = 4
    end
  end
end
