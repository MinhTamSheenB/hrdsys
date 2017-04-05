object formhrd11: Tformhrd11
  Left = -3
  Top = 41
  Width = 798
  Height = 521
  Caption = 'formhrd11'
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
  object privilege: TTntPageControl
    Left = 0
    Top = 36
    Width = 790
    Height = 451
    ActivePage = transfer
    Align = alClient
    MultiLine = True
    ParentShowHint = False
    RaggedRight = True
    ShowHint = False
    TabOrder = 0
    TabStop = False
    OnChange = privilegeChange
    object select: TTntTabSheet
      Caption = #26597#35426
      object GB_Select: TTntGroupBox
        Left = 586
        Top = 0
        Width = 196
        Height = 363
        Align = alRight
        Caption = #26597#35426#26781#20214
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object RD_NAME: TTntRadioButton
          Left = 16
          Top = 174
          Width = 137
          Height = 17
          Caption = #25353#22995#21517
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = RD_monthClick
        end
        object RD_ID: TTntRadioButton
          Left = 16
          Top = 124
          Width = 137
          Height = 17
          Caption = #25353#24037#34399
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = RD_monthClick
        end
        object EDT_name: TTntEdit
          Left = 40
          Top = 193
          Width = 73
          Height = 21
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
          ParentFont = False
          TabOrder = 2
        end
        object ID_B: TTntEdit
          Left = 40
          Top = 143
          Width = 57
          Height = 21
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
          MaxLength = 6
          ParentFont = False
          TabOrder = 3
          Text = '000000'
          OnDblClick = ID_EDblClick
        end
        object ID_E: TTntEdit
          Left = 112
          Top = 143
          Width = 57
          Height = 21
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
          MaxLength = 6
          ParentFont = False
          TabOrder = 4
          Text = '999999'
          OnDblClick = ID_EDblClick
        end
        object BB_find: TTntBitBtn
          Left = 57
          Top = 297
          Width = 75
          Height = 25
          Caption = #26597#35426
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          OnClick = BB_findClick
          Kind = bkOK
        end
        object RD_month: TTntRadioButton
          Left = 16
          Top = 23
          Width = 145
          Height = 17
          Caption = #21443#20445#24180#26376
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          OnClick = RD_monthClick
        end
        object RD_LVMON: TTntRadioButton
          Left = 16
          Top = 73
          Width = 137
          Height = 17
          Caption = #25353#36864#20445#24180#26376
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          OnClick = RD_monthClick
        end
        object lmonth_b: TTntEdit
          Left = 40
          Top = 91
          Width = 57
          Height = 21
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
          MaxLength = 6
          ParentFont = False
          TabOrder = 8
        end
        object lmonth_e: TTntEdit
          Left = 112
          Top = 91
          Width = 57
          Height = 21
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
          MaxLength = 6
          ParentFont = False
          TabOrder = 9
        end
        object DEPT_S: TTntComboBox
          Left = 41
          Top = 245
          Width = 139
          Height = 21
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
          ItemHeight = 0
          ParentFont = False
          TabOrder = 10
          OnChange = DEPT_SChange
        end
        object DEPT_E: TTntComboBox
          Left = 41
          Top = 269
          Width = 139
          Height = 21
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
          ItemHeight = 0
          ParentFont = False
          TabOrder = 11
        end
        object RD_DEPT: TTntRadioButton
          Left = 16
          Top = 223
          Width = 137
          Height = 17
          Caption = #37096#38272#20195#34399
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 12
          OnClick = RD_monthClick
        end
        object month_b: TMaskEdit
          Left = 40
          Top = 43
          Width = 46
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
          TabOrder = 13
        end
        object month_e: TMaskEdit
          Left = 96
          Top = 43
          Width = 47
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
          TabOrder = 14
        end
      end
      object TntDBGrid1: TTntDBGrid
        Left = 0
        Top = 0
        Width = 586
        Height = 363
        Align = alClient
        DataSource = DataSource1
        ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnTitleClick = TntDBGrid1TitleClick
        Columns = <
          item
            Color = clWhite
            Expanded = False
            FieldName = 'insur_seq'
            Title.Caption = #24207#34399
            Title.Color = clSkyBlue
            Width = 60
            Visible = True
          end
          item
            Color = clWhite
            Expanded = False
            FieldName = 'emp_id'
            Title.Caption = #24037#34399
            Title.Color = clSkyBlue
            Visible = True
          end
          item
            Color = clWhite
            Expanded = False
            FieldName = 'emp_chs'
            Title.Caption = #22995#21517
            Title.Color = clSkyBlue
            Width = 71
            Visible = True
          end
          item
            Color = clWhite
            Expanded = False
            FieldName = 'abbr_titl'
            Title.Caption = #37096#38272#31777#31281
            Title.Color = clSkyBlue
            Width = 60
            Visible = True
          end
          item
            Color = clWhite
            Expanded = False
            FieldName = 'picc_mons'
            Title.Caption = #21443#20445#24180#26376
            Title.Color = clSkyBlue
            Width = 95
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'picc_mone'
            Title.Caption = #36864#20445#24180#26376
            Title.Color = clSkyBlue
            Width = 87
            Visible = True
          end
          item
            Color = clWhite
            Expanded = False
            FieldName = 'picc_pay'
            Title.Caption = #20445#38570#32258#37329#38989
            Title.Color = clSkyBlue
            Width = 106
            Visible = True
          end>
      end
      object TntPanel2: TTntPanel
        Left = 0
        Top = 363
        Width = 782
        Height = 60
        Align = alBottom
        Enabled = False
        TabOrder = 2
        object LB_ID: TTntLabel
          Left = 24
          Top = 11
          Width = 97
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          Caption = #36523#20221#35657#34399#30908
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object LB_POST: TTntLabel
          Left = 280
          Top = 12
          Width = 73
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = #32887#31281
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object LB_DEPT_CODE: TTntLabel
          Left = 480
          Top = 13
          Width = 89
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = #37096#38272#20195#34399
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object LB_workdate: TTntLabel
          Left = 24
          Top = 35
          Width = 97
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = #21443#21152#24037#20316#26178#38291
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object LB_leavedate: TTntLabel
          Left = 264
          Top = 36
          Width = 89
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = #38626#32887#26178#38291
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object LB_TOTAL: TTntLabel
          Left = 488
          Top = 36
          Width = 81
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = #21512#35336
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object TntDBEdit1: TTntDBEdit
          Left = 128
          Top = 8
          Width = 121
          Height = 21
          Color = clSkyBlue
          DataField = 'epid_no'
          DataSource = DataSource1
          ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
          ReadOnly = True
          TabOrder = 0
        end
        object TntDBEdit2: TTntDBEdit
          Left = 360
          Top = 8
          Width = 121
          Height = 21
          Color = clSkyBlue
          DataField = 'pst_chs'
          DataSource = DataSource1
          ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
          ReadOnly = True
          TabOrder = 1
        end
        object TntDBEdit3: TTntDBEdit
          Left = 576
          Top = 8
          Width = 65
          Height = 21
          Color = clSkyBlue
          DataField = 'dept_code'
          DataSource = DataSource1
          ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
          ReadOnly = True
          TabOrder = 2
        end
        object EDT_FIRSTDATE: TTntDBEdit
          Left = 128
          Top = 32
          Width = 121
          Height = 21
          Color = clSkyBlue
          DataField = 'epindt'
          DataSource = DataSource1
          ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
          ReadOnly = True
          TabOrder = 3
        end
        object EDT_LEAVE: TTntDBEdit
          Left = 360
          Top = 32
          Width = 121
          Height = 21
          Color = clSkyBlue
          DataField = 'epledt'
          DataSource = DataSource1
          ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
          ReadOnly = True
          TabOrder = 4
        end
        object EDT_TOTAL: TTntEdit
          Left = 576
          Top = 32
          Width = 57
          Height = 21
          Color = clSkyBlue
          ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
          TabOrder = 5
        end
      end
    end
    object transfer: TTntTabSheet
      Caption = #36681#27284
      object TntPanel3: TTntPanel
        Left = 600
        Top = 0
        Width = 182
        Height = 423
        Align = alRight
        TabOrder = 0
        object sb_Save: TTntSpeedButton
          Left = 10
          Top = 271
          Width = 164
          Height = 42
          Caption = #35336#31639#20445#38570#32258#37329#38989#20006#36716#26723
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            04000000000080000000C40E0000C40E00001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000FFF000
            00000888870F011111900887770F01111190087000FF01111190080FF0001111
            1190080F011111111190080F011111111190080F011111111190080F01111111
            1190080F019911111190080FF00091111190088000FF011111900888870F0111
            11900888870F011111900777780F09999910000000FFF0000000}
          ParentFont = False
          OnClick = sb_SaveClick
        end
        object TntLabel1: TTntLabel
          Left = 29
          Top = 388
          Width = 81
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = #21512#35336
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object bb_search: TTntBitBtn
          Left = 12
          Top = 224
          Width = 164
          Height = 42
          Caption = #26597#35426#38656#35201#36681#27284#30340#36039#26009
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = bb_searchClick
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
            B78183B78183B78183B78183B78183B78183B78183B78183B78183B78183B781
            83B78183B78183FF00FFFF00FFFF00FF636E7BFEEED4F7E3C5F6DFBCF5DBB4F3
            D7ABF3D3A2F1CF9AF0CF97F0CF98F0CF98F5D49AB78183FF00FFFF00FF5E98C7
            3489D07F859DF6E3CBF5DFC2F4DBBAF2D7B2F1D4A9F1D0A2EECC99EECC97EECC
            97F3D199B78183FF00FFFF00FFFF00FF4BB6FF288BE0858498F5E3CBF5DFC3F3
            DBBBF2D7B2F1D4ABF0D0A3EECC9AEECC97F3D199B78183FF00FFFF00FFFF00FF
            B481764DB5FF278BDE79819AF6E3CAF5DFC2F4DBB9F2D7B2F1D4AAF0D0A1EFCD
            99F3D198B78183FF00FFFF00FFFF00FFBA8E85FFFCF44CB9FF5A91BFA48179BE
            978EAC7E79BE9589D6B49BF1D3AAF0D0A1F3D29BB78183FF00FFFF00FFFF00FF
            BA8E85FFFFFDFBF4ECBFA19FC7A59CE1C9B8F2DFC6E0C3ADC59F90D7B49BF0D4
            A9F5D5A3B78183FF00FFFF00FFFF00FFCB9A82FFFFFFFEF9F5C09C97E3CEC4F9
            EADAF8E7D2FFFFF7E0C2ADBE9589F2D8B2F6D9ACB78183FF00FFFF00FFFF00FF
            CB9A82FFFFFFFFFEFDAC7F7BF8EEE7F9EFE3F8EADAFFFFF0F3DEC7AC7E79F4DB
            B9F8DDB4B78183FF00FFFF00FFFF00FFDCA887FFFFFFFFFFFFC19F9CE6D6D1FB
            F3EBFAEFE2FFFFDEE2C8B8BE978DF7E1C2F0DAB7B78183FF00FFFF00FFFF00FF
            DCA887FFFFFFFFFFFFDFCDCBC9ACA9E6D6D1F8EEE6E3CEC4C7A59CC3A394E6D9
            C4C6BCA9B78183FF00FFFF00FFFF00FFE3B18EFFFFFFFFFFFFFFFFFFDFCDCBC1
            9F9CAC7F7BC09D97D6BAB1B8857AB8857AB8857AB78183FF00FFFF00FFFF00FF
            E3B18EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFFFEF9E3CFC9B8857AE8B2
            70ECA54AC58768FF00FFFF00FFFF00FFEDBD92FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFE4D4D2B8857AFAC577CD9377FF00FFFF00FFFF00FFFF00FF
            EDBD92FCF7F4FCF7F3FBF6F3FBF6F3FAF5F3F9F5F3F9F5F3E1D0CEB8857ACF9B
            86FF00FFFF00FFFF00FFFF00FFFF00FFEDBD92DCA887DCA887DCA887DCA887DC
            A887DCA887DCA887DCA887B8857AFF00FFFF00FFFF00FFFF00FF}
        end
        object TntEdit1: TTntEdit
          Left = 117
          Top = 384
          Width = 57
          Height = 21
          Color = clSkyBlue
          ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
          TabOrder = 1
        end
        object TntCheckBox1: TTntCheckBox
          Left = 8
          Top = 48
          Width = 89
          Height = 17
          Caption = #36864#20445#24180#26376
          Checked = True
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Palatino Linotype'
          Font.Style = []
          ParentFont = False
          State = cbChecked
          TabOrder = 2
        end
        object edt_bgn: TTntEdit
          Left = 24
          Top = 120
          Width = 73
          Height = 21
          MaxLength = 6
          TabOrder = 3
        end
        object TntCheckBox2: TTntCheckBox
          Left = 8
          Top = 96
          Width = 97
          Height = 17
          Caption = #24037#34399
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Palatino Linotype'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object edt_end: TTntEdit
          Left = 104
          Top = 120
          Width = 65
          Height = 21
          MaxLength = 6
          TabOrder = 5
        end
        object me_bgn: TMaskEdit
          Left = 40
          Top = 72
          Width = 50
          Height = 21
          EditMask = '0000/00;0;_'
          MaxLength = 7
          TabOrder = 6
        end
        object me_end: TMaskEdit
          Left = 96
          Top = 72
          Width = 50
          Height = 21
          EditMask = '0000/00;0;_'
          MaxLength = 7
          TabOrder = 7
        end
        object rb_shoe: TTntRadioButton
          Left = 8
          Top = 24
          Width = 73
          Height = 17
          Caption = #38795#24288
          Checked = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Palatino Linotype'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
          TabStop = True
        end
        object rb_noshoe: TTntRadioButton
          Left = 96
          Top = 24
          Width = 65
          Height = 17
          Caption = #21270#24037
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Palatino Linotype'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
        end
      end
      object TntPanel4: TTntPanel
        Left = 0
        Top = 0
        Width = 593
        Height = 423
        Align = alLeft
        TabOrder = 1
        object TntGroupBox1: TTntGroupBox
          Left = 1
          Top = 1
          Width = 591
          Height = 192
          Align = alTop
          Caption = #38656#35201#36681#27284#30340#36039#26009
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object TntDBGrid2: TTntDBGrid
            Left = 2
            Top = 15
            Width = 587
            Height = 175
            Align = alClient
            DataSource = DataSource2
            FixedColor = clSkyBlue
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnTitleClick = TntDBGrid1TitleClick
            Columns = <
              item
                Expanded = False
                FieldName = 'insur_seq'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Palatino Linotype'
                Font.Style = []
                Title.Caption = #24207#34399
                Title.Font.Charset = ANSI_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'Palatino Linotype'
                Title.Font.Style = []
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'emp_id'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Palatino Linotype'
                Font.Style = []
                Title.Caption = #24037#34399
                Title.Font.Charset = ANSI_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'Palatino Linotype'
                Title.Font.Style = []
                Width = 63
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'emp_chs'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Palatino Linotype'
                Font.Style = []
                Title.Caption = #20013#25991#21517
                Width = 59
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'name_vim'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Palatino Linotype'
                Font.Style = []
                Title.Caption = #36234#25991#21517
                Width = 63
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'dept'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Palatino Linotype'
                Font.Style = []
                Title.Caption = #37096#38272
                Width = 76
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'picc_mon'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Palatino Linotype'
                Font.Style = []
                Title.Caption = #21443#20445#24180#26376
                Title.Font.Charset = ANSI_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'Palatino Linotype'
                Title.Font.Style = []
                Width = 51
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'pst_name'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Palatino Linotype'
                Font.Style = []
                Title.Caption = #32887#31281
                Width = 37
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'epledt'
                Title.Caption = #38626#32887#26085#26399
                Width = 66
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'insu_cod'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Palatino Linotype'
                Font.Style = []
                Title.Caption = #20445#38570#20195#34399
                Title.Font.Charset = ANSI_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'Palatino Linotype'
                Title.Font.Style = []
                Width = 53
                Visible = True
              end>
          end
        end
        object TntGroupBox2: TTntGroupBox
          Left = 1
          Top = 208
          Width = 591
          Height = 214
          Align = alBottom
          Caption = #36681#27284#30340#36039#26009
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object TntDBGrid3: TTntDBGrid
            Left = 2
            Top = 15
            Width = 587
            Height = 197
            Align = alClient
            DataSource = DataSource3
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnTitleClick = TntDBGrid1TitleClick
            Columns = <
              item
                Color = clWhite
                Expanded = False
                FieldName = 'insur_seq'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Palatino Linotype'
                Font.Style = []
                Title.Caption = #24207#34399
                Title.Color = clSkyBlue
                Title.Font.Charset = ANSI_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'Palatino Linotype'
                Title.Font.Style = []
                Width = 60
                Visible = True
              end
              item
                Color = clWhite
                Expanded = False
                FieldName = 'emp_id'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Palatino Linotype'
                Font.Style = []
                Title.Caption = #24037#34399
                Title.Color = clSkyBlue
                Title.Font.Charset = ANSI_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'Palatino Linotype'
                Title.Font.Style = []
                Visible = True
              end
              item
                Color = clWhite
                Expanded = False
                FieldName = 'picc_mons'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Palatino Linotype'
                Font.Style = []
                Title.Caption = #21443#20445#24180#26376
                Title.Color = clSkyBlue
                Title.Font.Charset = ANSI_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'Palatino Linotype'
                Title.Font.Style = []
                Width = 95
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'picc_mone'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Palatino Linotype'
                Font.Style = []
                Title.Caption = #36864#20445#24180#26376
                Title.Color = clSkyBlue
                Title.Font.Charset = ANSI_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'Palatino Linotype'
                Title.Font.Style = []
                Width = 87
                Visible = True
              end
              item
                Color = clWhite
                Expanded = False
                FieldName = 'picc_pay'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Palatino Linotype'
                Font.Style = []
                Title.Caption = #20445#38570#32258#37329#38989
                Title.Color = clSkyBlue
                Title.Font.Charset = ANSI_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'Palatino Linotype'
                Title.Font.Style = []
                Width = 106
                Visible = True
              end>
          end
        end
      end
    end
  end
  object TntPanel1: TTntPanel
    Left = 0
    Top = 0
    Width = 790
    Height = 36
    Align = alTop
    Caption = #20154#21729#20445#38570#36039#26009#26680#28187
    Color = clCream
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object DataSource1: TDataSource
    DataSet = sqlQuery1
    Left = 112
    Top = 16
  end
  object sqlQuery1: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterScroll = sqlQuery1AfterScroll
    Parameters = <>
    SQL.Strings = (
      'select a.*,b.*,c.abbr_titl,d.pst_chs'
      
        '    from hrd_leav_picc as a,hrd_emp as b,hrd_dept as c,hrd_prof ' +
        'as d'
      
        '    where a.emp_id=b.emp_id and b.dept_code=c.dept_code and b.ps' +
        't_code=d.pst_code')
    Left = 72
    Top = 16
  end
  object sqlQuery2: TADOQuery
    Connection = DMHrdsys.conn
    LockType = ltBatchOptimistic
    AfterOpen = sqlQuery2AfterOpen
    AfterClose = sqlQuery2AfterClose
    AfterScroll = sqlQuery1AfterScroll
    OnCalcFields = sqlQuery2CalcFields
    Parameters = <>
    SQL.Strings = (
      'select a.*,b.* from hrd_picc as a,hrd_emp as b where 1<0')
    Left = 152
    Top = 16
    object sqlQuery2insur_seq: TStringField
      FieldName = 'insur_seq'
      Size = 10
    end
    object sqlQuery2picc_mon: TStringField
      FieldName = 'picc_mon'
      Size = 6
    end
    object sqlQuery2insu_cod: TWideStringField
      FieldName = 'insu_cod'
      Size = 1
    end
    object sqlQuery2notes: TWideStringField
      FieldName = 'notes'
    end
    object sqlQuery2emp_chs: TWideStringField
      FieldName = 'emp_chs'
      Size = 30
    end
    object sqlQuery2edu_code: TStringField
      FieldName = 'edu_code'
      Size = 2
    end
    object sqlQuery2dept_code: TStringField
      FieldName = 'dept_code'
      Size = 6
    end
    object sqlQuery2epindt: TDateTimeField
      FieldName = 'epindt'
    end
    object sqlQuery2epledt: TDateTimeField
      FieldName = 'epledt'
    end
    object sqlQuery2pst_code: TStringField
      FieldName = 'pst_code'
      Size = 2
    end
    object sqlQuery2name_eng: TWideStringField
      FieldName = 'name_eng'
      Size = 50
    end
    object sqlQuery2name_vim: TWideStringField
      FieldName = 'name_vim'
      Size = 50
    end
    object sqlQuery2pst_name: TWideStringField
      FieldKind = fkCalculated
      FieldName = 'pst_name'
      Calculated = True
    end
    object sqlQuery2dept: TWideStringField
      FieldKind = fkCalculated
      FieldName = 'dept'
      Size = 30
      Calculated = True
    end
    object sqlQuery2emp_id_1: TStringField
      FieldName = 'emp_id'
      Size = 6
    end
  end
  object DataSource2: TDataSource
    DataSet = sqlQuery2
    Left = 192
    Top = 16
  end
  object sqlQuery3: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterScroll = sqlQuery1AfterScroll
    Parameters = <>
    SQL.Strings = (
      'select * from hrd_leav_picc where 1<0;')
    Left = 248
    Top = 16
  end
  object DataSource3: TDataSource
    DataSet = sqlQuery3
    Left = 288
    Top = 16
  end
  object qry_dept: TADOQuery
    Connection = DMHrdsys.conn
    Parameters = <>
    Left = 480
    Top = 16
  end
end
