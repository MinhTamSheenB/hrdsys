object FormHrd08: TFormHrd08
  Left = 217
  Top = 197
  Width = 795
  Height = 531
  Caption = 'FormHrd08'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel14: TPanel
    Left = 0
    Top = 0
    Width = 787
    Height = 497
    Align = alClient
    BevelOuter = bvLowered
    Caption = 'PanelMain'
    TabOrder = 0
    object PanelFooter: TTntPanel
      Left = 1
      Top = 460
      Width = 785
      Height = 36
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 0
      object BtnCancel: TTntBitBtn
        Left = 384
        Top = 8
        Width = 75
        Height = 25
        Caption = '(&u)ndo'
        TabOrder = 1
        OnClick = BtnCancelClick
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
      object BtnSave: TTntBitBtn
        Left = 296
        Top = 8
        Width = 75
        Height = 25
        Caption = '(&s)ave'
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
      object TntStaticText1: TTntStaticText
        Left = 12
        Top = 11
        Width = 119
        Height = 17
        Caption = 'with_star_cannot_empty'
        Color = clYellow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 2
      end
    end
    object PanelTitle: TTntPanel
      Left = 1
      Top = 1
      Width = 785
      Height = 36
      Align = alTop
      Caption = 'hrd08_titl'
      Color = clCream
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object PanelUpd: TPanel
      Left = 1
      Top = 37
      Width = 785
      Height = 423
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object PanelInput: TPanel
        Left = 0
        Top = 0
        Width = 785
        Height = 36
        Align = alTop
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object TntLabel1: TTntLabel
          Left = 194
          Top = 8
          Width = 84
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'No.'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'MS PGothic'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object sb_FindEmp: TTntSpeedButton
          Left = 388
          Top = 5
          Width = 23
          Height = 22
          Caption = '...'
          Visible = False
          OnClick = sb_FindEmpClick
        end
        object EditEmpId: TTntEdit
          Left = 284
          Top = 5
          Width = 93
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ImeName = #20013#25991' (?'#20307') - '#35895#27468#25340#38899'?'#20837#27861
          MaxLength = 11
          ParentFont = False
          TabOrder = 2
          OnChange = EditEmpIdChange
          OnKeyDown = DBEditNameChsKeyDown
        end
        object rbUpd: TTntRadioButton
          Left = 8
          Top = 8
          Width = 80
          Height = 17
          Caption = '(&m)odify'
          TabOrder = 0
          OnClick = rbUpdClick
        end
        object rbAdd: TTntRadioButton
          Left = 104
          Top = 8
          Width = 80
          Height = 17
          Caption = '(&a)dd'
          TabOrder = 1
          OnClick = rbAddClick
        end
      end
      object PanelDetail: TPanel
        Left = 0
        Top = 36
        Width = 785
        Height = 387
        Align = alClient
        TabOrder = 1
        object Panel1: TPanel
          Left = 1
          Top = 225
          Width = 783
          Height = 161
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object Panel5: TPanel
            Left = 0
            Top = 0
            Width = 783
            Height = 5
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
          end
          object Panel10: TPanel
            Left = 645
            Top = 5
            Width = 8
            Height = 148
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
          end
          object Panel11: TPanel
            Left = 0
            Top = 5
            Width = 8
            Height = 148
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 3
          end
          object Panel12: TPanel
            Left = 0
            Top = 153
            Width = 783
            Height = 8
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 4
          end
          object TntGroupBox4: TTntGroupBox
            Left = 8
            Top = 5
            Width = 637
            Height = 148
            Align = alClient
            Caption = 'hrd08_detail_info'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 2
            object TntLabel57: TTntLabel
              Left = 10
              Top = 39
              Width = 120
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'fld_tpAddrvim'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -13
              Font.Name = 'MS PGothic'
              Font.Style = []
              ParentFont = False
            end
            object Label_picc: TTntLabel
              Left = 10
              Top = 120
              Width = 120
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'is_picc'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -13
              Font.Name = 'MS PGothic'
              Font.Style = []
              ParentFont = False
              Visible = False
            end
            object TntLabel10: TTntLabel
              Left = 10
              Top = 68
              Width = 120
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
            object TntLabel20: TTntLabel
              Left = 377
              Top = 28
              Width = 85
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'fld_name_eng'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -13
              Font.Name = 'MS PGothic'
              Font.Style = []
              ParentFont = False
            end
            object TntLabel21: TTntLabel
              Left = 372
              Top = 57
              Width = 90
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'fld_jieshao'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -13
              Font.Name = 'MS PGothic'
              Font.Style = []
              ParentFont = False
            end
            object TntLabel22: TTntLabel
              Left = 30
              Top = 94
              Width = 100
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'fld_area_code'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -13
              Font.Name = 'MS PGothic'
              Font.Style = []
              ParentFont = False
            end
            object TntLabel23: TTntLabel
              Left = 344
              Top = 90
              Width = 120
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'fld_epid_eng'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -13
              Font.Name = 'MS PGothic'
              Font.Style = []
              ParentFont = False
            end
            object DBEditTaddrVim: TTntDBEdit
              Left = 130
              Top = 33
              Width = 200
              Height = 21
              DataField = 'tpAddrvim'
              DataSource = DataSource1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ImeName = #20013#25991' (?'#20307') - '#35895#27468#25340#38899'?'#20837#27861
              ParentFont = False
              TabOrder = 0
              OnKeyDown = DBEditNameChsKeyDown
            end
            object TntDBEdit2: TTntDBEdit
              Left = 130
              Top = 65
              Width = 120
              Height = 21
              DataField = 'emp_phone'
              DataSource = DataSource1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ImeName = #20013#25991' (?'#20307') - '#35895#27468#25340#38899'?'#20837#27861
              ParentFont = False
              TabOrder = 1
              OnKeyDown = DBEditNameChsKeyDown
            end
            object Edit_picc: TTntEdit
              Left = 130
              Top = 118
              Width = 75
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ImeName = #20013#25991' (?'#20307') - '#35895#27468#25340#38899'?'#20837#27861
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
              Visible = False
              OnKeyDown = DBEditNameChsKeyDown
            end
            object TntDBEdit8: TTntDBEdit
              Left = 465
              Top = 25
              Width = 114
              Height = 21
              DataField = 'name_eng'
              DataSource = DataSource1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
              ParentFont = False
              TabOrder = 3
              OnKeyDown = DBEditNameChsKeyDown
            end
            object cobjieshao: TTntComboBox
              Left = 465
              Top = 54
              Width = 78
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
              ItemHeight = 13
              ParentFont = False
              TabOrder = 4
              OnChange = CobSexChange
              OnKeyDown = DBEditNameChsKeyDown
              Items.Strings = (
                'Z - '#20171#32057
                'Y - '#38750#20171#32057)
            end
            object CobArea: TTntComboBox
              Left = 130
              Top = 92
              Width = 203
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
              ItemHeight = 13
              ParentFont = False
              TabOrder = 5
              OnChange = CobSexChange
              OnKeyDown = DBEditNameChsKeyDown
            end
            object TntDBEdit9: TTntDBEdit
              Left = 464
              Top = 89
              Width = 120
              Height = 21
              DataField = 'epid_eng'
              DataSource = DataSource1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
              ParentFont = False
              TabOrder = 6
              OnKeyDown = DBEditNameChsKeyDown
            end
          end
          object Panel2: TPanel
            Left = 653
            Top = 5
            Width = 130
            Height = 148
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 5
            object TntGroupBox2: TTntGroupBox
              Left = 0
              Top = 0
              Width = 122
              Height = 148
              Align = alClient
              Caption = 'emp_photo'
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 1
              object ImagePhoto: TImage
                Left = 29
                Top = 14
                Width = 90
                Height = 120
                Align = alCustom
                Stretch = True
              end
              object BtnChoosePhoto: TTntButton
                Left = 5
                Top = 62
                Width = 20
                Height = 25
                Caption = '...'
                TabOrder = 0
                OnClick = BtnChoosePhotoClick
              end
            end
            object Panel4: TPanel
              Left = 122
              Top = 0
              Width = 8
              Height = 148
              Align = alRight
              BevelOuter = bvNone
              TabOrder = 0
            end
          end
        end
        object Panel6: TPanel
          Left = 1
          Top = 1
          Width = 783
          Height = 5
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 2
        end
        object Panel13: TPanel
          Left = 1
          Top = 6
          Width = 783
          Height = 219
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Panel3: TPanel
            Left = 8
            Top = 0
            Width = 767
            Height = 219
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Panel7: TPanel
              Left = 0
              Top = 203
              Width = 767
              Height = 5
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 1
            end
            object TntGroupBox1: TTntGroupBox
              Left = 0
              Top = 0
              Width = 767
              Height = 203
              Align = alClient
              Caption = 'hrd08_base_info'
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 0
              object TntLabel39: TTntLabel
                Left = 10
                Top = 17
                Width = 100
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'fld_emp_chs'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlue
                Font.Height = -13
                Font.Name = 'MS PGothic'
                Font.Style = []
                ParentFont = False
              end
              object TntLabel43: TTntLabel
                Left = 10
                Top = 45
                Width = 100
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'fld_epid_no'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlue
                Font.Height = -13
                Font.Name = 'MS PGothic'
                Font.Style = []
                ParentFont = False
              end
              object TntLabel42: TTntLabel
                Left = 500
                Top = 16
                Width = 100
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'fld_epbirth'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlue
                Font.Height = -13
                Font.Name = 'MS PGothic'
                Font.Style = []
                ParentFont = False
              end
              object TntLabel41: TTntLabel
                Left = 260
                Top = 17
                Width = 100
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'fld_name_vim'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlue
                Font.Height = -13
                Font.Name = 'MS PGothic'
                Font.Style = []
                ParentFont = False
              end
              object TntLabel58: TTntLabel
                Left = 10
                Top = 78
                Width = 100
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
              object TntLabel44: TTntLabel
                Left = 260
                Top = 77
                Width = 100
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'fld_ifmarry'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlue
                Font.Height = -13
                Font.Name = 'MS PGothic'
                Font.Style = []
                ParentFont = False
              end
              object TntLabel51: TTntLabel
                Left = 500
                Top = 75
                Width = 100
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'fld_edu_code'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlue
                Font.Height = -13
                Font.Name = 'MS PGothic'
                Font.Style = []
                ParentFont = False
              end
              object TntLabel60: TTntLabel
                Left = 260
                Top = 112
                Width = 100
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'fld_eng_status'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlue
                Font.Height = -13
                Font.Name = 'MS PGothic'
                Font.Style = []
                ParentFont = False
              end
              object TntLabel59: TTntLabel
                Left = 10
                Top = 112
                Width = 100
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'fld_chs_status'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlue
                Font.Height = -13
                Font.Name = 'MS PGothic'
                Font.Style = []
                ParentFont = False
              end
              object TntLabel2: TTntLabel
                Left = 213
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
              object TntLabel3: TTntLabel
                Left = 213
                Top = 44
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
              object TntLabel4: TTntLabel
                Left = 463
                Top = 73
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
              object TntLabel6: TTntLabel
                Left = 213
                Top = 76
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
              object TntLabel8: TTntLabel
                Left = 466
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
              end
              object TntLabel9: TTntLabel
                Left = 703
                Top = 14
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
              object TntLabel5: TTntLabel
                Left = 703
                Top = 75
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
              object TntLabel62: TTntLabel
                Left = 260
                Top = 46
                Width = 100
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'fld_epid_date'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlue
                Font.Height = -13
                Font.Name = 'MS PGothic'
                Font.Style = []
                ParentFont = False
              end
              object sb_epid_date: TTntSpeedButton
                Left = 460
                Top = 40
                Width = 23
                Height = 22
                Caption = '...'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                OnClick = sb_epledtClick
              end
              object TntLabel64: TTntLabel
                Left = 500
                Top = 40
                Width = 100
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'fld_epid_vim'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlue
                Font.Height = -13
                Font.Name = 'MS PGothic'
                Font.Style = []
                ParentFont = False
              end
              object TntLabel7: TTntLabel
                Left = 500
                Top = 108
                Width = 100
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'fld_country'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlue
                Font.Height = -13
                Font.Name = 'MS PGothic'
                Font.Style = []
                ParentFont = False
              end
              object TntLabel14: TTntLabel
                Left = 10
                Top = 144
                Width = 100
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'fld_nation'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlue
                Font.Height = -13
                Font.Name = 'MS PGothic'
                Font.Style = []
                ParentFont = False
              end
              object TntLabel17: TTntLabel
                Left = 260
                Top = 144
                Width = 100
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'fld_work_year'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlue
                Font.Height = -13
                Font.Name = 'MS PGothic'
                Font.Style = []
                ParentFont = False
              end
              object TntLabel18: TTntLabel
                Left = 500
                Top = 144
                Width = 100
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'fld_hope_salary'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlue
                Font.Height = -13
                Font.Name = 'MS PGothic'
                Font.Style = []
                ParentFont = False
              end
              object TntLabel19: TTntLabel
                Left = 10
                Top = 175
                Width = 100
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'fld_speciality'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlue
                Font.Height = -13
                Font.Name = 'MS PGothic'
                Font.Style = []
                ParentFont = False
              end
              object DBEditEpIdNo: TTntDBEdit
                Left = 110
                Top = 40
                Width = 100
                Height = 21
                DataField = 'epid_no'
                DataSource = DataSource1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ImeName = #20013#25991' (?'#20307') - '#35895#27468#25340#38899'?'#20837#27861
                ParentFont = False
                TabOrder = 3
                OnKeyDown = DBEditNameChsKeyDown
              end
              object DBEditNameVim: TTntDBEdit
                Left = 360
                Top = 11
                Width = 100
                Height = 21
                DataField = 'name_vim'
                DataSource = DataSource1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ImeName = #20013#25991' (?'#20307') - '#35895#27468#25340#38899'?'#20837#27861
                ParentFont = False
                TabOrder = 1
                OnKeyDown = DBEditNameChsKeyDown
              end
              object DBEditNameChs: TTntDBEdit
                Left = 110
                Top = 11
                Width = 100
                Height = 21
                DataField = 'emp_chs'
                DataSource = DataSource1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
                ParentFont = False
                TabOrder = 0
                OnKeyDown = DBEditNameChsKeyDown
              end
              object CobSex: TTntComboBox
                Left = 110
                Top = 73
                Width = 100
                Height = 21
                Style = csDropDownList
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ImeName = #20013#25991' (?'#20307') - '#35895#27468#25340#38899'?'#20837#27861
                ItemHeight = 13
                ParentFont = False
                TabOrder = 6
                OnChange = CobSexChange
                OnKeyDown = DBEditNameChsKeyDown
              end
              object CobIfMarry: TTntComboBox
                Tag = 20
                Left = 360
                Top = 73
                Width = 100
                Height = 21
                Style = csDropDownList
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ImeName = #20013#25991' (?'#20307') - '#35895#27468#25340#38899'?'#20837#27861
                ItemHeight = 13
                ParentFont = False
                Sorted = True
                TabOrder = 7
                OnChange = CobSexChange
                OnKeyDown = DBEditNameChsKeyDown
                Items.Strings = (
                  '0 - '#38626#32764
                  '1 - '#24050#23130
                  '2 - '#26410#23130
                  'A - 1'#20491#23567#23401
                  'B - 2'#20491#23567#23401)
              end
              object CobEdu: TTntComboBox
                Tag = 20
                Left = 600
                Top = 73
                Width = 100
                Height = 21
                Style = csDropDownList
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ImeName = #20013#25991' (?'#20307') - '#35895#27468#25340#38899'?'#20837#27861
                ItemHeight = 13
                ParentFont = False
                TabOrder = 8
                OnKeyDown = DBEditNameChsKeyDown
              end
              object DBCobEngStatus: TTntDBComboBox
                Left = 360
                Top = 107
                Width = 100
                Height = 21
                Style = csDropDownList
                DataField = 'eng_status'
                DataSource = DataSource1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ImeName = #20013#25991' (?'#20307') - '#35895#27468#25340#38899'?'#20837#27861
                ItemHeight = 13
                Items.Strings = (
                  'A'
                  'B'
                  'C'
                  'D'
                  'E')
                ParentFont = False
                TabOrder = 10
                OnKeyDown = DBEditNameChsKeyDown
              end
              object DBCobChsStatus: TTntDBComboBox
                Left = 110
                Top = 107
                Width = 100
                Height = 21
                Style = csDropDownList
                DataField = 'chs_status'
                DataSource = DataSource1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ImeName = #20013#25991' (?'#20307') - '#35895#27468#25340#38899'?'#20837#27861
                ItemHeight = 13
                Items.Strings = (
                  'A'
                  'B'
                  'C'
                  'D'
                  'E')
                ParentFont = False
                TabOrder = 9
                OnKeyDown = DBEditNameChsKeyDown
              end
              object DTPickepBirth: TTntDateTimePicker
                Left = 600
                Top = 12
                Width = 100
                Height = 21
                Date = 31048.000000000000000000
                Time = 31048.000000000000000000
                ImeName = #20013#25991' (?'#20307') - '#35895#27468#25340#38899'?'#20837#27861
                TabOrder = 2
                OnChange = CobSexChange
                OnKeyDown = DBEditNameChsKeyDown
              end
              object DBEditIddt: TTntDBEdit
                Left = 360
                Top = 40
                Width = 100
                Height = 21
                DataField = 'epid_date'
                DataSource = DataSource1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ImeName = #20013#25991' (?'#20307') - '#35895#27468#25340#38899'?'#20837#27861
                ParentFont = False
                TabOrder = 4
                OnKeyDown = DBEditNameChsKeyDown
              end
              object DBEditAreaVim: TTntDBEdit
                Left = 600
                Top = 40
                Width = 120
                Height = 21
                DataField = 'epid_vim'
                DataSource = DataSource1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
                ParentFont = False
                TabOrder = 5
                OnKeyDown = DBEditNameChsKeyDown
              end
              object TntDBEdit3: TTntDBEdit
                Left = 600
                Top = 104
                Width = 97
                Height = 21
                DataField = 'country'
                DataSource = DataSource1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
                ParentFont = False
                TabOrder = 11
                OnKeyDown = DBEditNameChsKeyDown
              end
              object TntDBEdit4: TTntDBEdit
                Left = 111
                Top = 140
                Width = 97
                Height = 21
                DataField = 'nation'
                DataSource = DataSource1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
                ParentFont = False
                TabOrder = 12
                OnKeyDown = DBEditNameChsKeyDown
              end
              object TntDBEdit5: TTntDBEdit
                Left = 360
                Top = 140
                Width = 97
                Height = 21
                DataField = 'work_year'
                DataSource = DataSource1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
                ParentFont = False
                TabOrder = 13
                OnKeyDown = DBEditNameChsKeyDown
              end
              object TntDBEdit6: TTntDBEdit
                Left = 600
                Top = 140
                Width = 97
                Height = 21
                DataField = 'hope_salary'
                DataSource = DataSource1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
                ParentFont = False
                TabOrder = 14
                OnKeyDown = DBEditNameChsKeyDown
              end
              object TntDBEdit7: TTntDBEdit
                Left = 111
                Top = 169
                Width = 346
                Height = 21
                DataField = 'speciality'
                DataSource = DataSource1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ImeName = #20013#25991' (?'#20307') - '#35895#27468#25340#38899'?'#20837#27861
                ParentFont = False
                TabOrder = 15
                OnKeyDown = DBEditNameChsKeyDown
              end
            end
            object TntGroupBox3: TTntGroupBox
              Left = 0
              Top = 208
              Width = 767
              Height = 11
              Align = alBottom
              Caption = 'hrd08_commany_info'
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 2
              Visible = False
              object TntLabel45: TTntLabel
                Left = 10
                Top = 18
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
                Left = 260
                Top = 18
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
                Left = 500
                Top = 46
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
                Left = 260
                Top = 44
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
                Top = 45
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
                Left = 463
                Top = 40
                Width = 23
                Height = 22
                Caption = '...'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                OnClick = sb_epledtClick
              end
              object TntLabel11: TTntLabel
                Left = 241
                Top = 19
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
                Left = 241
                Top = 42
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
                Left = 463
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
              end
              object TntLabel15: TTntLabel
                Left = 10
                Top = 75
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
              object TntLabel61: TTntLabel
                Left = 500
                Top = 72
                Width = 100
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'fld_factory'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlue
                Font.Height = -13
                Font.Name = 'MS PGothic'
                Font.Style = []
                ParentFont = False
                Visible = False
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
                Left = 500
                Top = 16
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
              object DBEditSpcId: TTntDBEdit
                Left = 600
                Top = 40
                Width = 100
                Height = 21
                DataSource = DataSource1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ImeName = #20013#25991' (?'#20307') - '#35895#27468#25340#38899'?'#20837#27861
                ParentFont = False
                TabOrder = 5
                OnKeyDown = DBEditNameChsKeyDown
              end
              object DTPickEpindt: TTntDateTimePicker
                Left = 360
                Top = 12
                Width = 100
                Height = 21
                Date = 31048.000000000000000000
                Time = 31048.000000000000000000
                ImeName = #20013#25991' (?'#20307') - '#35895#27468#25340#38899'?'#20837#27861
                TabOrder = 1
                OnChange = CobSexChange
                OnKeyDown = DBEditNameChsKeyDown
              end
              object DBEditLedt: TTntDBEdit
                Left = 360
                Top = 40
                Width = 100
                Height = 21
                DataSource = DataSource1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ImeName = #20013#25991' (?'#20307') - '#35895#27468#25340#38899'?'#20837#27861
                ParentFont = False
                TabOrder = 4
                OnKeyDown = DBEditNameChsKeyDown
              end
              object TntDBEdit1: TTntDBEdit
                Left = 110
                Top = 68
                Width = 354
                Height = 21
                DataSource = DataSource1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
                ParentFont = False
                TabOrder = 6
                OnKeyDown = DBEditNameChsKeyDown
              end
              object CobFactory: TTntDBComboBox
                Left = 600
                Top = 68
                Width = 100
                Height = 21
                Style = csDropDownList
                DataSource = DataSource1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ImeName = #20013#25991' (?'#20307') - '#35895#27468#25340#38899'?'#20837#27861
                ItemHeight = 13
                Items.Strings = (
                  '1'
                  '2'
                  '3'
                  '4'
                  '5'
                  '6'
                  '7'
                  '8'
                  '9')
                ParentFont = False
                TabOrder = 7
                Visible = False
                OnKeyDown = DBEditNameChsKeyDown
              end
              object CobInfo: TTntComboBox
                Left = 600
                Top = 11
                Width = 100
                Height = 21
                Style = csDropDownList
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ImeName = #20013#25991' (?'#20307') - '#35895#27468#25340#38899'?'#20837#27861
                ItemHeight = 13
                ParentFont = False
                TabOrder = 2
                OnChange = CobInfoChange
                OnKeyDown = DBEditNameChsKeyDown
              end
              object CobDept: TTntComboBox
                Left = 110
                Top = 12
                Width = 130
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ImeName = #20013#25991' (?'#20307') - '#35895#27468#25340#38899'?'#20837#27861
                ItemHeight = 13
                ParentFont = False
                TabOrder = 0
                OnChange = CobSexChange
                OnKeyDown = DBEditNameChsKeyDown
              end
              object CobProf: TTntComboBox
                Left = 110
                Top = 40
                Width = 130
                Height = 21
                Style = csDropDownList
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ImeName = #20013#25991' (?'#20307') - '#35895#27468#25340#38899'?'#20837#27861
                ItemHeight = 13
                ParentFont = False
                TabOrder = 3
                OnChange = CobSexChange
                OnKeyDown = DBEditNameChsKeyDown
              end
            end
          end
          object Panel8: TPanel
            Left = 0
            Top = 0
            Width = 8
            Height = 219
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 1
          end
          object Panel9: TPanel
            Left = 775
            Top = 0
            Width = 8
            Height = 219
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 2
          end
        end
      end
    end
  end
  object ChooseCalendar: TTntMonthCalendar
    Left = 416
    Top = 34
    Width = 273
    Height = 159
    Date = 38609.000000000000000000
    ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
    TabOrder = 1
    Visible = False
    OnClick = ChooseCalendarClick
  end
  object ADODataSet1: TADODataSet
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select * from hrd_person WHERE 1=2'
    Parameters = <>
    Left = 12
    Top = 8
    object ADODataSet1upd_user: TStringField
      FieldName = 'upd_user'
      Size = 16
    end
    object ADODataSet1upd_date: TDateTimeField
      FieldName = 'upd_date'
    end
    object ADODataSet1data_id: TStringField
      FieldName = 'data_id'
      Size = 11
    end
    object ADODataSet1emp_chs: TWideStringField
      FieldName = 'emp_chs'
      Size = 30
    end
    object ADODataSet1epid_no: TStringField
      FieldName = 'epid_no'
      Size = 10
    end
    object ADODataSet1epbirth: TDateTimeField
      FieldName = 'epbirth'
    end
    object ADODataSet1epsexd: TStringField
      FieldName = 'epsexd'
      Size = 1
    end
    object ADODataSet1ifmarry: TStringField
      FieldName = 'ifmarry'
      Size = 1
    end
    object ADODataSet1epAddrchs: TWideStringField
      FieldName = 'epAddrchs'
      Size = 120
    end
    object ADODataSet1tpAddrchs: TWideStringField
      FieldName = 'tpAddrchs'
      Size = 120
    end
    object ADODataSet1edu_code: TStringField
      FieldName = 'edu_code'
      Size = 2
    end
    object ADODataSet1chs_status: TStringField
      FieldName = 'chs_status'
      FixedChar = True
      Size = 1
    end
    object ADODataSet1eng_status: TStringField
      FieldName = 'eng_status'
      FixedChar = True
      Size = 1
    end
    object ADODataSet1epid_date: TDateTimeField
      FieldName = 'epid_date'
    end
    object ADODataSet1epid_area: TWideStringField
      FieldName = 'epid_area'
    end
    object ADODataSet1name_eng: TWideStringField
      FieldName = 'name_eng'
      Size = 50
    end
    object ADODataSet1name_vim: TWideStringField
      FieldName = 'name_vim'
      Size = 30
    end
    object ADODataSet1epAddrvim: TWideStringField
      FieldName = 'epAddrvim'
      Size = 200
    end
    object ADODataSet1epAddreng: TWideStringField
      FieldName = 'epAddreng'
      Size = 120
    end
    object ADODataSet1tpAddrvim: TWideStringField
      FieldName = 'tpAddrvim'
      Size = 200
    end
    object ADODataSet1tpAddreng: TWideStringField
      FieldName = 'tpAddreng'
      Size = 120
    end
    object ADODataSet1epid_vim: TWideStringField
      FieldName = 'epid_vim'
      Size = 50
    end
    object ADODataSet1epid_eng: TWideStringField
      FieldName = 'epid_eng'
      Size = 50
    end
    object ADODataSet1emp_phone: TStringField
      FieldName = 'emp_phone'
      Size = 30
    end
    object ADODataSet1mail_date: TDateTimeField
      FieldName = 'mail_date'
    end
    object ADODataSet1matr_date: TDateTimeField
      FieldName = 'matr_date'
    end
    object ADODataSet1nation: TWideStringField
      FieldName = 'nation'
      Size = 10
    end
    object ADODataSet1country: TWideStringField
      FieldName = 'country'
      Size = 10
    end
    object ADODataSet1work_year: TWideStringField
      FieldName = 'work_year'
      Size = 10
    end
    object ADODataSet1hope_salary: TBCDField
      FieldName = 'hope_salary'
      Precision = 18
      Size = 0
    end
    object ADODataSet1speciality: TWideStringField
      FieldName = 'speciality'
      Size = 30
    end
    object ADODataSet1jieshao: TStringField
      FieldName = 'jieshao'
      Size = 1
    end
    object ADODataSet1area_code: TStringField
      FieldName = 'area_code'
      Size = 10
    end
  end
  object DataSource1: TDataSource
    DataSet = ADODataSet1
    OnDataChange = DataSource1DataChange
    Left = 48
    Top = 8
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 692
    Top = 378
  end
  object ADODataSetPic: TADODataSet
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    CommandText = 'select  * from hrd_epPict '
    DataSource = DataSource1
    IndexFieldNames = 'data_id'
    MasterFields = 'data_id'
    Parameters = <>
    Left = 112
    Top = 8
    object ADODataSetPicupd_user: TStringField
      FieldName = 'upd_user'
      Size = 16
    end
    object ADODataSetPicupd_date: TDateTimeField
      FieldName = 'upd_date'
    end
    object ADODataSetPicdata_id: TStringField
      FieldName = 'data_id'
      Size = 11
    end
    object ADODataSetPicemp_id: TStringField
      FieldName = 'emp_id'
      Size = 6
    end
    object ADODataSetPicemp_pict: TBlobField
      FieldName = 'emp_pict'
    end
    object ADODataSetPicpict_road: TStringField
      FieldName = 'pict_road'
    end
  end
end
