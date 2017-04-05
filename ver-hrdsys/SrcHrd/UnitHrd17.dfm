object FormHrd17: TFormHrd17
  Left = 197
  Top = 129
  Width = 798
  Height = 555
  Caption = 'FormHrd17'
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
    Width = 790
    Height = 521
    Align = alClient
    BevelOuter = bvLowered
    Caption = 'PanelMain'
    TabOrder = 0
    object PanelFooter: TTntPanel
      Left = 1
      Top = 484
      Width = 788
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
      Width = 788
      Height = 36
      Align = alTop
      Caption = 'hrd17_titl'
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
      Width = 788
      Height = 447
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object PanelInput: TPanel
        Left = 0
        Top = 0
        Width = 788
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
          Left = 274
          Top = 8
          Width = 84
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'fld_emp_id'
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
          Left = 428
          Top = 5
          Width = 23
          Height = 22
          Caption = '...'
          OnClick = sb_FindEmpClick
        end
        object EditEmpId: TTntEdit
          Left = 364
          Top = 5
          Width = 57
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ImeName = #20013#25991' (?'#20307') - '#35895#27468#25340#38899'?'#20837#27861
          MaxLength = 7
          ParentFont = False
          TabOrder = 2
          OnChange = EditEmpIdChange
          OnKeyDown = DBEditNameChsKeyDown
        end
        object rbUpd: TTntRadioButton
          Left = 96
          Top = 8
          Width = 80
          Height = 17
          Caption = '(&m)odify'
          TabOrder = 0
          OnClick = rbUpdClick
        end
        object rbAdd: TTntRadioButton
          Left = 192
          Top = 8
          Width = 80
          Height = 17
          Caption = '(&a)dd'
          TabOrder = 1
          OnClick = rbAddClick
        end
        object TntPanel1: TTntPanel
          Left = 537
          Top = 1
          Width = 240
          Height = 33
          BevelOuter = bvNone
          TabOrder = 3
          object RbShoes: TTntRadioButton
            Left = 0
            Top = 8
            Width = 90
            Height = 17
            Caption = #31119#31103'Mizuno'
            Checked = True
            TabOrder = 0
            TabStop = True
            Visible = False
            OnClick = RbShoesClick
          end
          object RBPrint: TTntRadioButton
            Left = 87
            Top = 8
            Width = 90
            Height = 17
            Caption = #31119#31103'Nike'
            TabOrder = 1
            Visible = False
          end
          object RbAdidas: TTntRadioButton
            Left = 159
            Top = 8
            Width = 90
            Height = 17
            Caption = #31119#31103'Adidas'
            TabOrder = 2
            Visible = False
          end
        end
        object RbInq: TTntRadioButton
          Left = 8
          Top = 8
          Width = 80
          Height = 17
          Caption = '(&q)uery'
          Checked = True
          TabOrder = 4
          TabStop = True
          OnClick = rbUpdClick
        end
      end
      object PanelDetail: TPanel
        Left = 0
        Top = 36
        Width = 788
        Height = 411
        Align = alClient
        TabOrder = 1
        object Panel1: TPanel
          Left = 1
          Top = 249
          Width = 786
          Height = 161
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object Panel5: TPanel
            Left = 0
            Top = 0
            Width = 786
            Height = 5
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
          end
          object Panel10: TPanel
            Left = 648
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
            Width = 786
            Height = 8
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 4
          end
          object TntGroupBox4: TTntGroupBox
            Left = 8
            Top = 5
            Width = 640
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
              Top = 23
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
              Top = 94
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
            end
            object TntLabel10: TTntLabel
              Left = 10
              Top = 67
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
            object TntLabel7: TTntLabel
              Left = 390
              Top = 123
              Width = 120
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'fld_birth_addr'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -13
              Font.Name = 'MS PGothic'
              Font.Style = []
              ParentFont = False
            end
            object TntLabel20: TTntLabel
              Left = 256
              Top = 66
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
              Left = 252
              Top = 93
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
              Top = 120
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
              Left = 390
              Top = 96
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
            object TntLabel17: TTntLabel
              Left = 10
              Top = 47
              Width = 120
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'fld_tpAddrvim2'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -13
              Font.Name = 'MS PGothic'
              Font.Style = []
              ParentFont = False
            end
            object DBEditTaddrVim: TTntDBEdit
              Left = 130
              Top = 17
              Width = 500
              Height = 21
              DataField = 'tpAddrvim'
              DataSource = DataSource1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnKeyDown = DBEditNameChsKeyDown
            end
            object TntDBEdit2: TTntDBEdit
              Left = 130
              Top = 64
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
              Top = 90
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
              OnKeyDown = DBEditNameChsKeyDown
            end
            object TntDBEdit3: TTntDBEdit
              Left = 510
              Top = 119
              Width = 120
              Height = 21
              DataField = 'birth_addr'
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
            object TntDBEdit8: TTntDBEdit
              Left = 344
              Top = 63
              Width = 121
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
              TabOrder = 4
              OnKeyDown = DBEditNameChsKeyDown
            end
            object cobjieshao: TTntComboBox
              Left = 345
              Top = 90
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
              TabOrder = 5
              OnChange = CobSexChange
              OnKeyDown = DBEditNameChsKeyDown
              Items.Strings = (
                'Z - '#20171#32057
                'Y - '#38750#20171#32057)
            end
            object CobArea: TTntComboBox
              Left = 130
              Top = 118
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
              TabOrder = 6
              OnChange = CobSexChange
              OnKeyDown = DBEditNameChsKeyDown
            end
            object TntDBEdit9: TTntDBEdit
              Left = 510
              Top = 95
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
              TabOrder = 7
              OnKeyDown = DBEditNameChsKeyDown
            end
            object TntDBEdit5: TTntDBEdit
              Left = 130
              Top = 41
              Width = 500
              Height = 21
              DataField = 'tpAddrvim2'
              DataSource = DataSource1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 8
              OnKeyDown = DBEditNameChsKeyDown
            end
          end
          object Panel2: TPanel
            Left = 656
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
          Width = 786
          Height = 5
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 2
        end
        object Panel13: TPanel
          Left = 1
          Top = 6
          Width = 786
          Height = 243
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Panel3: TPanel
            Left = 8
            Top = 0
            Width = 770
            Height = 243
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Panel7: TPanel
              Left = 0
              Top = 139
              Width = 770
              Height = 5
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 2
            end
            object TntGroupBox1: TTntGroupBox
              Left = 0
              Top = 0
              Width = 770
              Height = 139
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
                Width = 90
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
                Top = 41
                Width = 90
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
                Left = 550
                Top = 16
                Width = 90
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
                Left = 211
                Top = 17
                Width = 90
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
                Top = 66
                Width = 90
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
                Left = 211
                Top = 65
                Width = 90
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
                Left = 540
                Top = 63
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
                Left = 211
                Top = 92
                Width = 90
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
                Top = 92
                Width = 90
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
                Left = 205
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
              object TntLabel3: TTntLabel
                Left = 205
                Top = 40
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
                Left = 414
                Top = 61
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
                Left = 205
                Top = 64
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
                Left = 539
                Top = 15
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
              object TntLabel9: TTntLabel
                Left = 743
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
                Left = 743
                Top = 63
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
                Left = 211
                Top = 42
                Width = 90
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
                Left = 411
                Top = 36
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
                Left = 540
                Top = 36
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
              object TntLabel14: TTntLabel
                Left = 435
                Top = 89
                Width = 90
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'fld_name_vim_en'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlue
                Font.Height = -13
                Font.Name = 'MS PGothic'
                Font.Style = []
                ParentFont = False
              end
              object TntLabel18: TTntLabel
                Left = 2
                Top = 114
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
              object TntLabel19: TTntLabel
                Left = 211
                Top = 114
                Width = 62
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'fld_emp_id'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object TntLabel24: TTntLabel
                Left = 275
                Top = 114
                Width = 26
                Height = 13
                Caption = '(new)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object DBEditEpIdNo: TTntDBEdit
                Left = 102
                Top = 36
                Width = 100
                Height = 21
                DataField = 'epid_no'
                DataSource = DataSource1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 3
                OnKeyDown = DBEditNameChsKeyDown
              end
              object DBEditNameVim: TTntDBEdit
                Left = 303
                Top = 11
                Width = 234
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
                Left = 102
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
                Left = 102
                Top = 61
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
                Left = 303
                Top = 61
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
              end
              object CobEdu: TTntComboBox
                Tag = 20
                Left = 640
                Top = 61
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
                Left = 303
                Top = 87
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
                Left = 102
                Top = 87
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
                Left = 640
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
                Left = 303
                Top = 36
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
                Left = 640
                Top = 36
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
              object TntDBEdit4: TTntDBEdit
                Left = 527
                Top = 83
                Width = 234
                Height = 21
                DataField = 'name_vim_en'
                DataSource = DataSource1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
                ParentFont = False
                TabOrder = 11
                OnKeyDown = DBEditNameChsKeyDown
              end
              object DBEditBirth: TTntDBEdit
                Left = 102
                Top = 110
                Width = 100
                Height = 21
                DataField = 'epbirth_year'
                DataSource = DataSource1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ImeName = #20013#25991' - QQ'#25340#38899'?'#20837#27861
                ParentFont = False
                TabOrder = 12
              end
              object TntDBEdit6: TTntDBEdit
                Left = 303
                Top = 110
                Width = 97
                Height = 21
                DataField = 'emp_id_new'
                DataSource = DataSource1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 13
              end
            end
            object TntGroupBox3: TTntGroupBox
              Left = 0
              Top = 144
              Width = 770
              Height = 99
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
              TabOrder = 1
              object TntLabel45: TTntLabel
                Left = 2
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
                Left = 352
                Top = 18
                Width = 88
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
                Left = 556
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
                Left = 340
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
                Left = 2
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
                Left = 543
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
                Left = 312
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
                Left = 543
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
                Left = 2
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
                Left = 556
                Top = 72
                Width = 100
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'fld_dut_factory'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlue
                Font.Height = -13
                Font.Name = 'MS PGothic'
                Font.Style = []
                ParentFont = False
                Visible = False
              end
              object TntLabel16: TTntLabel
                Left = 759
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
                Left = 556
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
                Left = 656
                Top = 40
                Width = 100
                Height = 21
                DataField = 'spc_id'
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
                Left = 440
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
                Left = 440
                Top = 40
                Width = 100
                Height = 21
                DataField = 'epledt'
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
                Left = 102
                Top = 68
                Width = 354
                Height = 21
                DataField = 'left_reason'
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
                Left = 656
                Top = 68
                Width = 100
                Height = 21
                Style = csDropDownList
                DataField = 'factory'
                DataSource = DataSource1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ImeName = #20013#25991' (?'#20307') - '#35895#27468#25340#38899'?'#20837#27861
                ItemHeight = 13
                Items.Strings = (
                  'V'
                  'N')
                ParentFont = False
                TabOrder = 7
                Visible = False
                OnKeyDown = DBEditNameChsKeyDown
              end
              object CobInfo: TTntComboBox
                Left = 656
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
                Left = 102
                Top = 12
                Width = 203
                Height = 24
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Palatino Linotype'
                Font.Style = []
                ImeName = #20013#25991' (?'#20307') - '#35895#27468#25340#38899'?'#20837#27861
                ItemHeight = 16
                ParentFont = False
                TabOrder = 0
                OnChange = CobSexChange
                OnKeyDown = DBEditNameChsKeyDown
              end
              object CobProf: TTntComboBox
                Left = 102
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
              object ChkSts: TCheckBox
                Left = 461
                Top = 72
                Width = 25
                Height = 17
                Enabled = False
                TabOrder = 8
                OnClick = ChkStsClick
              end
            end
          end
          object Panel8: TPanel
            Left = 0
            Top = 0
            Width = 8
            Height = 243
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 1
          end
          object Panel9: TPanel
            Left = 778
            Top = 0
            Width = 8
            Height = 243
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 2
          end
        end
      end
    end
  end
  object ChooseCalendar: TTntMonthCalendar
    Left = 496
    Top = 74
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
    CommandText = 'select * from hrd_emp WHERE (emp_id = '#39'-1'#39')'
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
    object ADODataSet1emp_id: TStringField
      FieldName = 'emp_id'
      Size = 6
    end
    object ADODataSet1emp_chs: TWideStringField
      FieldName = 'emp_chs'
      Size = 10
    end
    object ADODataSet1epid_no: TStringField
      FieldName = 'epid_no'
      OnChange = ADODataSet1epid_noChange
      Size = 12
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
      Size = 40
    end
    object ADODataSet1tpAddrchs: TWideStringField
      FieldName = 'tpAddrchs'
      Size = 40
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
    object ADODataSet1factory: TStringField
      FieldName = 'factory'
      Size = 1
    end
    object ADODataSet1dept_code: TStringField
      FieldName = 'dept_code'
      Size = 6
    end
    object ADODataSet1epindt: TDateTimeField
      FieldName = 'epindt'
    end
    object ADODataSet1epledt: TDateTimeField
      FieldName = 'epledt'
    end
    object ADODataSet1pst_code: TStringField
      FieldName = 'pst_code'
      Size = 2
    end
    object ADODataSet1info_code: TStringField
      FieldName = 'info_code'
      Size = 1
    end
    object ADODataSet1spc_id: TStringField
      FieldName = 'spc_id'
      Size = 10
    end
    object ADODataSet1name_eng: TWideStringField
      FieldName = 'name_eng'
    end
    object ADODataSet1name_vim: TWideStringField
      FieldName = 'name_vim'
      Size = 50
    end
    object ADODataSet1name_vim_en: TTntWideStringField
      FieldName = 'name_vim_en'
      Size = 50
    end
    object ADODataSet1epAddrvim: TWideStringField
      FieldName = 'epAddrvim'
      Size = 40
    end
    object ADODataSet1epAddreng: TWideStringField
      FieldName = 'epAddreng'
      Size = 40
    end
    object ADODataSet1tpAddrvim: TWideStringField
      FieldName = 'tpAddrvim'
      Size = 60
    end
    object ADODataSet1tpAddreng: TWideStringField
      FieldName = 'tpAddreng'
      Size = 40
    end
    object ADODataSet1epid_vim: TWideStringField
      FieldName = 'epid_vim'
    end
    object ADODataSet1epid_eng: TWideStringField
      FieldName = 'epid_eng'
    end
    object ADODataSet1left_reason: TWideStringField
      FieldName = 'left_reason'
      Size = 50
    end
    object ADODataSet1emp_phone: TStringField
      FieldName = 'emp_phone'
      Size = 30
    end
    object ADODataSet1birth_addr: TWideStringField
      FieldName = 'birth_addr'
    end
    object ADODataSet1jieshao: TStringField
      FieldName = 'jieshao'
      Size = 1
    end
    object ADODataSet1area_code: TStringField
      FieldName = 'area_code'
      Size = 10
    end
    object ADODataSet1left_sts: TStringField
      FieldName = 'left_sts'
      Size = 1
    end
    object ADODataSet1epbirth_year: TStringField
      FieldName = 'epbirth_year'
      FixedChar = True
      Size = 4
    end
    object ADODataSet1tpAddrvim2: TWideStringField
      FieldName = 'tpAddrvim2'
      Size = 200
    end
    object ADODataSet1emp_id_new: TStringField
      FieldName = 'emp_id_new'
      Size = 6
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
    IndexFieldNames = 'emp_id'
    MasterFields = 'emp_id'
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
