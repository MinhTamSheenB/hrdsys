object Formfhrd212: TFormfhrd212
  Left = 143
  Top = 210
  Width = 870
  Height = 500
  Caption = 'Formfhrd212'
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
  object TntPanel1: TTntPanel
    Left = 0
    Top = 0
    Width = 862
    Height = 37
    Align = alTop
    Caption = 'dut13_titl'
    Color = clCream
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object TntPageControl1: TTntPageControl
    Left = 0
    Top = 37
    Width = 862
    Height = 429
    ActivePage = TntTabSheet3
    Align = alClient
    TabOrder = 1
    object TntTabSheet2: TTntTabSheet
      Caption = 'weihu'
      object TntPanel2: TTntPanel
        Left = 0
        Top = 74
        Width = 854
        Height = 291
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 0
        object TntGroupBox4: TTntGroupBox
          Left = 1
          Top = 1
          Width = 852
          Height = 289
          Align = alClient
          Caption = 'dut_mon_dtl'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
          object dbg_Dut2_Q: TTntDBGrid
            Left = 2
            Top = 161
            Width = 848
            Height = 126
            Align = alClient
            DataSource = ds_mon_Q
            FixedColor = clSkyBlue
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Palatino Linotype'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            ParentFont = False
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clRed
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnCellClick = dbg_Dut1_QCellClick
            OnColExit = dbg_Dut1_QColExit
            OnExit = me_Month_QExit
            Columns = <
              item
                Expanded = False
                FieldName = 'clas_name'
                Title.Caption = 'cls_hol_name'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 88
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'day16'
                Title.Alignment = taCenter
                Title.Caption = '16'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'day17'
                Title.Alignment = taCenter
                Title.Caption = '17'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'day18'
                Title.Alignment = taCenter
                Title.Caption = '18'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'day19'
                Title.Alignment = taCenter
                Title.Caption = '19'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'day20'
                Title.Alignment = taCenter
                Title.Caption = '20'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'day21'
                Title.Alignment = taCenter
                Title.Caption = '21'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'day22'
                Title.Alignment = taCenter
                Title.Caption = '22'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'day23'
                Title.Alignment = taCenter
                Title.Caption = '23'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'day24'
                Title.Alignment = taCenter
                Title.Caption = '24'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'day25'
                Title.Alignment = taCenter
                Title.Caption = '25'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'day26'
                Title.Alignment = taCenter
                Title.Caption = '26'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'day27'
                Title.Alignment = taCenter
                Title.Caption = '27'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'day28'
                Title.Alignment = taCenter
                Title.Caption = '28'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'day29'
                Title.Alignment = taCenter
                Title.Caption = '29'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'day30'
                Title.Alignment = taCenter
                Title.Caption = '30'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'day31'
                Title.Alignment = taCenter
                Title.Caption = '31'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 40
                Visible = True
              end>
          end
          object dbg_Dut1_Q: TTntDBGrid
            Left = 2
            Top = 15
            Width = 848
            Height = 146
            Align = alTop
            DataSource = ds_mon_Q
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
            OnCellClick = dbg_Dut1_QCellClick
            OnColExit = dbg_Dut1_QColExit
            OnKeyDown = dbg_Dut1_QKeyDown
            Columns = <
              item
                Color = clWhite
                Expanded = False
                FieldName = 'clas_name'
                Title.Caption = 'cls_hol_name'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 88
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'day01'
                Title.Alignment = taCenter
                Title.Caption = '01'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 42
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'day02'
                Title.Alignment = taCenter
                Title.Caption = '02'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 42
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'day03'
                Title.Alignment = taCenter
                Title.Caption = '03'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 42
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'day04'
                Title.Alignment = taCenter
                Title.Caption = '04'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 42
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'day05'
                Title.Alignment = taCenter
                Title.Caption = '05'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 42
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'day06'
                Title.Alignment = taCenter
                Title.Caption = '06'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 42
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'day07'
                Title.Alignment = taCenter
                Title.Caption = '07'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 42
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'day08'
                Title.Alignment = taCenter
                Title.Caption = '08'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 42
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'day09'
                Title.Alignment = taCenter
                Title.Caption = '09'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 42
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'day10'
                Title.Alignment = taCenter
                Title.Caption = '10'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 42
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'day11'
                Title.Alignment = taCenter
                Title.Caption = '11'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 42
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'day12'
                Title.Alignment = taCenter
                Title.Caption = '12'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 42
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'day13'
                Title.Alignment = taCenter
                Title.Caption = '13'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 42
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'day14'
                Title.Alignment = taCenter
                Title.Caption = '14'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 42
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'day15'
                Title.Alignment = taCenter
                Title.Caption = '15'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 42
                Visible = True
              end>
          end
        end
      end
      object TntPanel6: TTntPanel
        Left = 0
        Top = 0
        Width = 854
        Height = 74
        Align = alTop
        BevelOuter = bvLowered
        Caption = 'TntPanel6'
        TabOrder = 1
        object TntGroupBox3: TTntGroupBox
          Left = 1
          Top = 1
          Width = 852
          Height = 72
          Align = alClient
          Caption = 'search_condition'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
          object TntLabel3: TTntLabel
            Left = 163
            Top = 20
            Width = 80
            Height = 17
            Alignment = taRightJustify
            AutoSize = False
            BiDiMode = bdLeftToRight
            Caption = 'fld_emp_id'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentBiDiMode = False
            ParentFont = False
          end
          object TntLabel6: TTntLabel
            Left = 8
            Top = 20
            Width = 70
            Height = 17
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'month'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object TntLabel19: TTntLabel
            Left = 8
            Top = 46
            Width = 70
            Height = 17
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'fld_pstname'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object TntLabel20: TTntLabel
            Left = 327
            Top = 46
            Width = 80
            Height = 17
            Alignment = taRightJustify
            AutoSize = False
            BiDiMode = bdLeftToRight
            Caption = 'fld_dept_code'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentBiDiMode = False
            ParentFont = False
          end
          object TntLabel21: TTntLabel
            Left = 327
            Top = 20
            Width = 80
            Height = 17
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'fld_emp_name'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object TntLabel22: TTntLabel
            Left = 163
            Top = 46
            Width = 80
            Height = 17
            Alignment = taRightJustify
            AutoSize = False
            BiDiMode = bdLeftToRight
            Caption = 'fld_spc_id'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentBiDiMode = False
            ParentFont = False
          end
          object sb_FindEmp: TTntSpeedButton
            Left = 300
            Top = 16
            Width = 23
            Height = 22
            Caption = '...'
          end
          object TntLabel4: TTntLabel
            Left = 533
            Top = 20
            Width = 80
            Height = 17
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
          object TntLabel5: TTntLabel
            Left = 536
            Top = 44
            Width = 77
            Height = 17
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'fld_epledt'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object EditEmp_Q: TTntEdit
            Left = 244
            Top = 16
            Width = 57
            Height = 21
            Color = clHighlightText
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 6
            ParentFont = False
            TabOrder = 1
            OnChange = EditEmp_QChange
          end
          object me_Month_Q: TMaskEdit
            Left = 82
            Top = 16
            Width = 57
            Height = 21
            Hint = 'yyyy/mm'
            EditMask = '9999/99;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 7
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            OnChange = me_Month_QChange
            OnExit = me_Month_QExit
          end
          object EditEmpDept_Q: TTntEdit
            Left = 408
            Top = 42
            Width = 129
            Height = 21
            BevelKind = bkFlat
            BorderStyle = bsNone
            Color = clSkyBlue
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            ParentFont = False
            ReadOnly = True
            TabOrder = 6
          end
          object EditEmpName_Q: TTntEdit
            Left = 408
            Top = 16
            Width = 81
            Height = 21
            BevelKind = bkFlat
            BorderStyle = bsNone
            Color = clSkyBlue
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
          end
          object EditEmpCard_Q: TTntEdit
            Left = 244
            Top = 42
            Width = 77
            Height = 21
            BevelKind = bkFlat
            BorderStyle = bsNone
            Color = clSkyBlue
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
          end
          object EditEmpPst_Q: TTntEdit
            Left = 82
            Top = 42
            Width = 81
            Height = 21
            BevelKind = bkFlat
            BorderStyle = bsNone
            Color = clSkyBlue
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
          end
          object bbtn_OK: TTntBitBtn
            Left = 702
            Top = 14
            Width = 75
            Height = 25
            Caption = 'ok'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            OnClick = bbtn_OKClick
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
          object bbtn_Reset: TTntBitBtn
            Left = 702
            Top = 42
            Width = 75
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
            OnClick = bbtn_ResetClick
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
          object EditIndt: TTntEdit
            Left = 615
            Top = 16
            Width = 85
            Height = 21
            BevelKind = bkFlat
            BorderStyle = bsNone
            Color = clSkyBlue
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            ParentFont = False
            ReadOnly = True
            TabOrder = 8
          end
          object EditLedt: TTntEdit
            Left = 615
            Top = 40
            Width = 85
            Height = 21
            BevelKind = bkFlat
            BorderStyle = bsNone
            Color = clSkyBlue
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            ParentFont = False
            ReadOnly = True
            TabOrder = 9
          end
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 365
        Width = 854
        Height = 36
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        object sb_Print: TTntSpeedButton
          Left = 136
          Top = 8
          Width = 80
          Height = 25
          Caption = '(&p)rint'
          Enabled = False
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
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
          ParentFont = False
          OnClick = sb_PrintClick
        end
        object sb_Add: TTntSpeedButton
          Left = 216
          Top = 8
          Width = 80
          Height = 25
          Caption = '(&a)dd'
          Enabled = False
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Glyph.Data = {
            E6000000424DE60000000000000076000000280000000F0000000E0000000100
            04000000000070000000130B0000130B00001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8880888888888888888088888888888888808888880008888880888888070888
            8880888888070888888088800007000088808880777777708880888000070000
            8880888888070888888088888807088888808888880008888880888888888888
            88808888888888888880}
          ParentFont = False
          OnClick = sb_AddClick
        end
        object sb_Del: TTntSpeedButton
          Left = 295
          Top = 8
          Width = 80
          Height = 25
          Caption = '(&d)elete'
          Enabled = False
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Glyph.Data = {
            DE000000424DDE0000000000000076000000280000000D0000000D0000000100
            0400000000006800000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            F000FFFFFFFFFFFFF000FFFFFFFFFFFFF000FFFFFFFFFFFFF000FFFFFFFFFFFF
            F000FF000000000FF000FF0FFFFFFF0FF000FF000000000FF000FFFFFFFFFFFF
            F000FFFFFFFFFFFFF000FFFFFFFFFFFFF000FFFFFFFFFFFFF000FFFFFFFFFFFF
            F000}
          ParentFont = False
          OnClick = sb_DelClick
        end
        object sb_Recover: TTntSpeedButton
          Left = 374
          Top = 8
          Width = 80
          Height = 25
          Caption = '(&u)ndo'
          Enabled = False
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            88888888888888888888870000000008888887EFEFEFEF08888887FEFEFE7E08
            888887EF00080788888887FEFEFE0078888887EF000F0B07888887FEFEFE0BB0
            788887EF0000E0BB078887FEFEFEF00BB0888777777800BB0788888888880BBB
            B0788888888870BBBB0888888888800000088888888888888888}
          ParentFont = False
          OnClick = sb_RecoverClick
        end
        object sb_Close: TTntSpeedButton
          Left = 534
          Top = 8
          Width = 80
          Height = 25
          Caption = 'close'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
            33333337777FF377FF3333993370739993333377FF373F377FF3399993000339
            993337777F777F3377F3393999707333993337F77737333337FF993399933333
            399377F3777FF333377F993339903333399377F33737FF33377F993333707333
            399377F333377FF3377F993333101933399377F333777FFF377F993333000993
            399377FF3377737FF7733993330009993933373FF3777377F7F3399933000399
            99333773FF777F777733339993707339933333773FF7FFF77333333999999999
            3333333777333777333333333999993333333333377777333333}
          NumGlyphs = 2
          ParentFont = False
          OnClick = sb_CloseClick
        end
        object sb_Save: TTntSpeedButton
          Left = 454
          Top = 8
          Width = 80
          Height = 25
          Caption = '(&s)ave'
          Enabled = False
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
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
          ParentFont = False
          OnClick = sb_SaveClick
        end
      end
    end
    object TntTabSheet3: TTntTabSheet
      Caption = 'transferfiles'
      object TntPanel3: TTntPanel
        Left = 0
        Top = 0
        Width = 854
        Height = 401
        Align = alClient
        BevelOuter = bvLowered
        Caption = 'TntPanel3'
        TabOrder = 0
        object TntPanel4: TTntPanel
          Left = 88
          Top = 8
          Width = 537
          Height = 353
          BevelOuter = bvLowered
          Caption = 'TntPanel4'
          Color = clSkyBlue
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object TntGroupBox2: TTntGroupBox
            Left = 25
            Top = 130
            Width = 488
            Height = 143
            Caption = 'search_condition'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object TntLabel17: TTntLabel
              Left = 171
              Top = 48
              Width = 36
              Height = 13
              Caption = '______'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowFrame
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object TntLabel18: TTntLabel
              Left = 241
              Top = 104
              Width = 36
              Height = 13
              Caption = '______'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowFrame
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object sb_EmpBeg: TTntSpeedButton
              Left = 147
              Top = 48
              Width = 23
              Height = 22
              Caption = '...'
            end
            object sb_EmpEnd: TTntSpeedButton
              Left = 267
              Top = 48
              Width = 23
              Height = 22
              Caption = '...'
            end
            object cob_Dept_begin: TTntComboBox
              Left = 88
              Top = 104
              Width = 153
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
              ItemHeight = 13
              ParentFont = False
              TabOrder = 2
            end
            object EditEmpBeg_T: TTntEdit
              Left = 88
              Top = 48
              Width = 57
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
              MaxLength = 6
              ParentFont = False
              TabOrder = 0
            end
            object EditEmpEnd_T: TTntEdit
              Left = 208
              Top = 48
              Width = 57
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
              MaxLength = 6
              ParentFont = False
              TabOrder = 1
            end
            object cob_Dept_end: TTntComboBox
              Left = 262
              Top = 104
              Width = 153
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
              ItemHeight = 13
              ParentFont = False
              TabOrder = 3
            end
            object rb_ByEmp_T: TCheckBox
              Left = 32
              Top = 24
              Width = 97
              Height = 17
              Caption = 'by_empid'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
            end
            object rb_ByDept_T: TCheckBox
              Left = 32
              Top = 80
              Width = 97
              Height = 17
              Caption = 'by_deptcode'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 5
            end
          end
          object TntGroupBox1: TTntGroupBox
            Left = 25
            Top = 57
            Width = 488
            Height = 72
            Caption = 'date_range'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object TntLabel1: TTntLabel
              Left = 8
              Top = 36
              Width = 85
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'date_begin'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object TntLabel2: TTntLabel
              Left = 216
              Top = 36
              Width = 85
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'date_end'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object dp_DateBeg_T: TTntDateTimePicker
              Left = 96
              Top = 28
              Width = 105
              Height = 21
              Date = 38581.000000000000000000
              Time = 38581.000000000000000000
              ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
              TabOrder = 0
            end
            object dp_DateEnd_T: TTntDateTimePicker
              Left = 312
              Top = 28
              Width = 105
              Height = 21
              Date = 38581.999988425930000000
              Time = 38581.999988425930000000
              ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
              TabOrder = 1
            end
          end
          object TntStaticText1: TTntStaticText
            Left = 88
            Top = 16
            Width = 361
            Height = 24
            Alignment = taCenter
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = 'dut13_titl_2'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 3
          end
          object BBtn_Tran: TTntBitBtn
            Left = 200
            Top = 280
            Width = 73
            Height = 25
            Caption = 'transferfiles'
            TabOrder = 2
            OnClick = BBtn_TranClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FFFFFFFFFFF
              FFFF33333333333FFFFF3FFFFFFFFF00000F333333333377777F33FFFFFFFF09
              990F33333333337F337F333FFFFFFF09990F33333333337F337F3333FFFFFF09
              990F33333333337FFF7F33333FFFFF00000F3333333333777773333333FFFFFF
              FFFF3333333333333F333333333FFFFF0FFF3333333333337FF333333333FFF0
              00FF33333333333777FF333333333F00000F33FFFFF33777777F300000333000
              0000377777F33777777730EEE033333000FF37F337F3333777F330EEE0333330
              00FF37F337F3333777F330EEE033333000FF37FFF7F333F77733300000333000
              03FF3777773337777333333333333333333F3333333333333333}
            NumGlyphs = 2
          end
          object TntBitBtn1: TTntBitBtn
            Left = 280
            Top = 280
            Width = 75
            Height = 25
            Caption = 'cancel'
            TabOrder = 4
            OnClick = TntBitBtn1Click
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
              3333333777333777FF3333993333339993333377FF3333377FF3399993333339
              993337777FF3333377F3393999333333993337F777FF333337FF993399933333
              399377F3777FF333377F993339993333399377F33777FF33377F993333999333
              399377F333777FF3377F993333399933399377F3333777FF377F993333339993
              399377FF3333777FF7733993333339993933373FF3333777F7F3399933333399
              99333773FF3333777733339993333339933333773FFFFFF77333333999999999
              3333333777333777333333333999993333333333377777333333}
            NumGlyphs = 2
          end
          object pb_tran: TTntProgressBar
            Left = 1
            Top = 312
            Width = 535
            Height = 20
            Align = alBottom
            TabOrder = 5
          end
          object TntStatusBar1: TTntStatusBar
            Left = 1
            Top = 332
            Width = 535
            Height = 20
            Panels = <>
          end
        end
        object GroupBox1: TGroupBox
          Left = 632
          Top = 56
          Width = 137
          Height = 265
          Caption = #29376#24907#35352#37636
          TabOrder = 1
          object Memo1: TMemo
            Left = 2
            Top = 15
            Width = 133
            Height = 248
            Align = alClient
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            ReadOnly = True
            TabOrder = 0
          end
        end
      end
    end
  end
  object qry_mon_Q: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandTimeout = 0
    Parameters = <
      item
        Name = 'emp_id'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 6
        Value = Null
      end
      item
        Name = 'dut_mon'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 6
        Value = Null
      end>
    SQL.Strings = (
      
        'select  *  from  fhrd_dut_mon   where  emp_id=:emp_id and dut_mo' +
        'n=:dut_mon')
    Left = 5
    Top = 10
    object qry_mon_Qupd_user: TStringField
      FieldName = 'upd_user'
      Size = 16
    end
    object qry_mon_Qupd_date: TDateTimeField
      FieldName = 'upd_date'
    end
    object qry_mon_Qemp_id: TStringField
      FieldName = 'emp_id'
      FixedChar = True
      Size = 6
    end
    object qry_mon_Qdut_mon: TStringField
      FieldName = 'dut_mon'
      Size = 6
    end
    object qry_mon_Qclas_code: TStringField
      FieldName = 'clas_code'
      ReadOnly = True
      Visible = False
      FixedChar = True
      Size = 2
    end
    object qry_mon_Qclas_name: TTntWideStringField
      FieldKind = fkLookup
      FieldName = 'clas_name'
      LookupDataSet = ADOQuery1
      LookupKeyFields = 'clas_code'
      LookupResultField = 'clas_name'
      KeyFields = 'clas_code'
      Size = 10
      Lookup = True
    end
    object qry_mon_Qday01: TStringField
      FieldName = 'day01'
      Size = 4
    end
    object qry_mon_Qday02: TStringField
      FieldName = 'day02'
      Size = 4
    end
    object qry_mon_Qday03: TStringField
      FieldName = 'day03'
      Size = 4
    end
    object qry_mon_Qday04: TStringField
      FieldName = 'day04'
      Size = 4
    end
    object qry_mon_Qday05: TStringField
      FieldName = 'day05'
      Size = 4
    end
    object qry_mon_Qday06: TStringField
      FieldName = 'day06'
      Size = 4
    end
    object qry_mon_Qday07: TStringField
      FieldName = 'day07'
      Size = 4
    end
    object qry_mon_Qday08: TStringField
      FieldName = 'day08'
      Size = 4
    end
    object qry_mon_Qday09: TStringField
      FieldName = 'day09'
      Size = 4
    end
    object qry_mon_Qday10: TStringField
      FieldName = 'day10'
      Size = 4
    end
    object qry_mon_Qday11: TStringField
      FieldName = 'day11'
      Size = 4
    end
    object qry_mon_Qday12: TStringField
      FieldName = 'day12'
      Size = 4
    end
    object qry_mon_Qday13: TStringField
      FieldName = 'day13'
      Size = 4
    end
    object qry_mon_Qday14: TStringField
      FieldName = 'day14'
      Size = 4
    end
    object qry_mon_Qday15: TStringField
      FieldName = 'day15'
      Size = 4
    end
    object qry_mon_Qday16: TStringField
      FieldName = 'day16'
      Size = 4
    end
    object qry_mon_Qday17: TStringField
      FieldName = 'day17'
      Size = 4
    end
    object qry_mon_Qday18: TStringField
      FieldName = 'day18'
      Size = 4
    end
    object qry_mon_Qday19: TStringField
      FieldName = 'day19'
      Size = 4
    end
    object qry_mon_Qday20: TStringField
      FieldName = 'day20'
      Size = 4
    end
    object qry_mon_Qday21: TStringField
      FieldName = 'day21'
      Size = 4
    end
    object qry_mon_Qday22: TStringField
      FieldName = 'day22'
      Size = 4
    end
    object qry_mon_Qday23: TStringField
      FieldName = 'day23'
      Size = 4
    end
    object qry_mon_Qday24: TStringField
      FieldName = 'day24'
      Size = 4
    end
    object qry_mon_Qday25: TStringField
      FieldName = 'day25'
      Size = 4
    end
    object qry_mon_Qday26: TStringField
      FieldName = 'day26'
      Size = 4
    end
    object qry_mon_Qday27: TStringField
      FieldName = 'day27'
      Size = 4
    end
    object qry_mon_Qday28: TStringField
      FieldName = 'day28'
      Size = 4
    end
    object qry_mon_Qday29: TStringField
      FieldName = 'day29'
      Size = 4
    end
    object qry_mon_Qday30: TStringField
      FieldName = 'day30'
      Size = 4
    end
    object qry_mon_Qday31: TStringField
      FieldName = 'day31'
      Size = 4
    end
  end
  object ds_mon_Q: TDataSource
    DataSet = qry_mon_Q
    Left = 37
    Top = 10
  end
  object qry_DutDay: TADOQuery
    Connection = DMHrdsys.conn
    CommandTimeout = 0
    Parameters = <>
    Left = 180
    Top = 9
  end
  object sp_T_Emp1: TADOStoredProc
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    CommandTimeout = 0
    ProcedureName = 'fproc_emp;1'
    Parameters = <>
    Left = 212
    Top = 9
    object sp_T_Emp1emp_id: TStringField
      FieldName = 'emp_id'
      FixedChar = True
      Size = 6
    end
    object sp_T_Emp1epledt: TDateTimeField
      FieldName = 'epledt'
    end
    object sp_T_Emp1epindt: TDateTimeField
      FieldName = 'epindt'
    end
  end
  object cmd_Temp: TADOCommand
    CommandTimeout = 0
    Connection = DMHrdsys.conn
    Parameters = <>
    Left = 240
    Top = 8
  end
  object qry_Temp: TADOQuery
    Connection = DMHrdsys.conn
    CommandTimeout = 0
    Parameters = <>
    SQL.Strings = (
      'SELECT top 1 * FROM fhrd_dut_mon ')
    Left = 492
    Top = 9
  end
  object ADOQuery1: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    CommandTimeout = 0
    Parameters = <>
    SQL.Strings = (
      
        'select clas_code,(clas_code+'#39' '#39'+clas_chs) as clas_name from hrd_' +
        'dut_class')
    Left = 173
    Top = 38
  end
  object ADOQueryEmp: TADOQuery
    Connection = DMHrdsys.conn
    CommandTimeout = 0
    Parameters = <>
    SQL.Strings = (
      'select top 1 * from fhrd_emp ')
    Left = 276
    Top = 5
    object ADOQueryEmpemp_id: TStringField
      FieldName = 'emp_id'
      Size = 6
    end
    object ADOQueryEmpepindt: TDateTimeField
      FieldName = 'epindt'
    end
    object ADOQueryEmpepledt: TDateTimeField
      FieldName = 'epledt'
    end
  end
  object qry_mon_QC: TADOQuery
    CommandTimeout = 0
    Parameters = <>
    Left = 72
    Top = 8
  end
end
