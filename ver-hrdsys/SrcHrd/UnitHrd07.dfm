object Formhrd07: TFormhrd07
  Left = 2
  Top = 19
  Width = 798
  Height = 522
  Caption = 'Formhrd07'
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
  object PanelMain: TPanel
    Left = 0
    Top = 0
    Width = 790
    Height = 488
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      790
      488)
    object TntPanel1: TTntPanel
      Left = 1
      Top = 1
      Width = 788
      Height = 36
      Align = alTop
      Caption = 'hrd07_titl'
      Color = clCream
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object PageControl1: TTntPageControl
      Left = 1
      Top = 37
      Width = 788
      Height = 450
      ActivePage = TabSheet2
      Align = alClient
      TabOrder = 1
      object TabSheet1: TTntTabSheet
        Caption = 'query'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Palatino Linotype'
        Font.Style = []
        ParentFont = False
        object Panel2: TPanel
          Left = 0
          Top = 36
          Width = 780
          Height = 386
          Align = alClient
          BevelOuter = bvLowered
          Caption = 'Panel2'
          TabOrder = 0
          object TntDBGrid2: TTntDBGrid
            Left = 1
            Top = 1
            Width = 778
            Height = 343
            Align = alClient
            DataSource = DataSource2
            FixedColor = clSkyBlue
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Palatino Linotype'
            TitleFont.Style = []
            OnTitleClick = TntDBGrid2TitleClick
            Columns = <
              item
                Expanded = False
                FieldName = 'dept_code'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'dept_titl'
                Width = 175
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'abbr_titl'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'org_num'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'act_num'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'factory'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'dept_cls'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'vim_titl'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'eng_titl'
                Visible = True
              end>
          end
          object TntPanel5: TTntPanel
            Left = 1
            Top = 344
            Width = 778
            Height = 41
            Align = alBottom
            TabOrder = 1
            object TntBitBtn2: TTntBitBtn
              Left = 400
              Top = 9
              Width = 72
              Height = 24
              Caption = 'print'
              Enabled = False
              TabOrder = 0
              OnClick = TntBitBtn3Click
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
            object TntBitBtn3: TTntBitBtn
              Left = 320
              Top = 9
              Width = 71
              Height = 24
              Caption = 'print_preview'
              Enabled = False
              TabOrder = 1
              OnClick = TntBitBtn3Click
            end
          end
        end
        object TntPanel3: TTntPanel
          Left = 0
          Top = 0
          Width = 780
          Height = 36
          Align = alTop
          BevelOuter = bvLowered
          TabOrder = 1
          object TntLabel12: TTntLabel
            Left = 23
            Top = 14
            Width = 29
            Height = 13
            Caption = 'month'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object TntLabel13: TTntLabel
            Left = 149
            Top = 13
            Width = 112
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'dept_begin'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object TntLabel14: TTntLabel
            Left = 333
            Top = 14
            Width = 112
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'dept_end'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object sb_InqOk: TTntSpeedButton
            Left = 576
            Top = 6
            Width = 65
            Height = 25
            Caption = 'ok'
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
            OnClick = sb_InqOkClick
          end
          object sb_close2: TTntSpeedButton
            Left = 648
            Top = 6
            Width = 65
            Height = 25
            Caption = 'close'
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
            OnClick = sb_CloseClick
          end
          object TntEdit2: TTntEdit
            Left = 264
            Top = 6
            Width = 57
            Height = 24
            CharCase = ecUpperCase
            MaxLength = 6
            TabOrder = 0
            Text = 'V00000'
          end
          object TntEdit3: TTntEdit
            Left = 448
            Top = 6
            Width = 57
            Height = 24
            CharCase = ecUpperCase
            MaxLength = 6
            TabOrder = 1
            Text = 'VZZZZZ'
          end
          object MaskEdit1: TMaskEdit
            Left = 62
            Top = 8
            Width = 57
            Height = 24
            EditMask = '9999/99;0;_'
            MaxLength = 7
            TabOrder = 2
          end
        end
      end
      object TabSheet2: TTntTabSheet
        Caption = 'weihu'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Palatino Linotype'
        Font.Style = []
        ParentFont = False
        object TntPanel2: TTntPanel
          Left = 0
          Top = 374
          Width = 780
          Height = 48
          Align = alBottom
          BevelOuter = bvLowered
          TabOrder = 0
          object sb_Add: TTntSpeedButton
            Left = 240
            Top = 15
            Width = 66
            Height = 26
            Caption = '(&a)dd'
            Flat = True
            Glyph.Data = {
              E6000000424DE60000000000000076000000280000000F0000000E0000000100
              04000000000070000000130B0000130B00001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8880888888888888888088888888888888808888880008888880888888070888
              8880888888070888888088800007000088808880777777708880888000070000
              8880888888070888888088888807088888808888880008888880888888888888
              88808888888888888880}
            OnClick = sb_AddClick
          end
          object sb_Del: TTntSpeedButton
            Left = 308
            Top = 15
            Width = 66
            Height = 25
            Caption = '(&d)elete'
            Enabled = False
            Flat = True
            Glyph.Data = {
              DE000000424DDE0000000000000076000000280000000D0000000D0000000100
              0400000000006800000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
              F000FFFFFFFFFFFFF000FFFFFFFFFFFFF000FFFFFFFFFFFFF000FFFFFFFFFFFF
              F000FF000000000FF000FF0FFFFFFF0FF000FF000000000FF000FFFFFFFFFFFF
              F000FFFFFFFFFFFFF000FFFFFFFFFFFFF000FFFFFFFFFFFFF000FFFFFFFFFFFF
              F000}
            OnClick = sb_DelClick
          end
          object sb_Recover: TTntSpeedButton
            Left = 445
            Top = 15
            Width = 66
            Height = 25
            Caption = '(&u)ndo'
            Enabled = False
            Flat = True
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              88888888888888888888870000000008888887EFEFEFEF08888887FEFEFE7E08
              888887EF00080788888887FEFEFE0078888887EF000F0B07888887FEFEFE0BB0
              788887EF0000E0BB078887FEFEFEF00BB0888777777800BB0788888888880BBB
              B0788888888870BBBB0888888888800000088888888888888888}
            OnClick = sb_RecoverClick
          end
          object sb_Save: TTntSpeedButton
            Left = 513
            Top = 15
            Width = 66
            Height = 25
            Caption = '(&s)ave'
            Enabled = False
            Flat = True
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              04000000000080000000C40E0000C40E00001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000FFF000
              00000888870F011111900887770F01111190087000FF01111190080FF0001111
              1190080F011111111190080F011111111190080F011111111190080F01111111
              1190080F019911111190080FF00091111190088000FF011111900888870F0111
              11900888870F011111900777780F09999910000000FFF0000000}
            OnClick = sb_SaveClick
          end
          object sb_Close: TTntSpeedButton
            Left = 581
            Top = 15
            Width = 66
            Height = 25
            Caption = 'close'
            Flat = True
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
            OnClick = sb_CloseClick
          end
          object TntLabel15: TTntLabel
            Left = 2
            Top = 20
            Width = 80
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'fast_find'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object sb_edit: TTntSpeedButton
            Left = 376
            Top = 15
            Width = 66
            Height = 25
            Caption = '(&m)odify'
            Enabled = False
            Flat = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
              000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
              00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
              F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
              0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
              FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
              FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
              0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
              00333377737FFFFF773333303300000003333337337777777333}
            NumGlyphs = 2
            OnClick = sb_editClick
          end
          object TntEdit4: TTntEdit
            Left = 84
            Top = 13
            Width = 105
            Height = 24
            CharCase = ecUpperCase
            MaxLength = 6
            TabOrder = 0
            OnChange = TntEdit4Change
          end
        end
        object TntPanel4: TTntPanel
          Left = 0
          Top = 0
          Width = 780
          Height = 36
          Align = alTop
          BevelOuter = bvLowered
          TabOrder = 1
          object TntLabel16: TTntLabel
            Left = 8
            Top = 12
            Width = 88
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'dept_begin'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object TntLabel17: TTntLabel
            Left = 163
            Top = 12
            Width = 88
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'dept_end'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object TntEdit5: TTntEdit
            Left = 104
            Top = 8
            Width = 57
            Height = 24
            CharCase = ecUpperCase
            MaxLength = 6
            TabOrder = 0
            Text = 'V00000'
          end
          object TntEdit6: TTntEdit
            Left = 259
            Top = 8
            Width = 57
            Height = 24
            CharCase = ecUpperCase
            MaxLength = 6
            TabOrder = 1
            Text = 'VZZZZZ'
          end
          object TntBitBtn1: TTntBitBtn
            Left = 336
            Top = 6
            Width = 73
            Height = 25
            Caption = 'ok'
            TabOrder = 2
            OnClick = TntBitBtn1Click
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
        object TntDBGrid1: TTntDBGrid
          Left = 0
          Top = 36
          Width = 780
          Height = 338
          Align = alClient
          DataSource = DataSource1
          FixedColor = clSkyBlue
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete]
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Palatino Linotype'
          TitleFont.Style = []
          OnTitleClick = TntDBGrid1TitleClick
          Columns = <
            item
              Expanded = False
              FieldName = 'dept_code'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'dept_titl'
              Width = 208
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'abbr_titl'
              Width = 148
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'org_num'
              Width = 62
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'act_num'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'factory'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'dept_cls'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'vim_titl'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'eng_titl'
              Visible = True
            end>
        end
      end
    end
    object PanelFlow: TTntPanel
      Left = 400
      Top = 122
      Width = 341
      Height = 335
      Anchors = [akLeft, akTop, akRight, akBottom]
      BevelInner = bvRaised
      BevelOuter = bvNone
      BevelWidth = 2
      BorderWidth = 1
      BorderStyle = bsSingle
      TabOrder = 2
      Visible = False
      object TntLabel18: TTntLabel
        Left = 120
        Top = 12
        Width = 98
        Height = 13
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object PanelFlowTitle: TTntPanel
        Left = 3
        Top = 3
        Width = 331
        Height = 24
        Align = alTop
        Alignment = taLeftJustify
        BevelInner = bvLowered
        BevelOuter = bvNone
        Caption = 'edit_area'
        Color = clGradientActiveCaption
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -11
        Font.Name = 'Palatino Linotype'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnMouseDown = PanelFlowTitleMouseDown
        object ImageClose: TImage
          Left = 309
          Top = 1
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
          OnClick = ImageCloseClick
        end
      end
      object bbtn_ok: TTntBitBtn
        Left = 170
        Top = 296
        Width = 65
        Height = 25
        Caption = 'finish'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Palatino Linotype'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = bbtn_okClick
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
      end
      object TntGroupBox5: TTntGroupBox
        Left = 15
        Top = 26
        Width = 306
        Height = 263
        TabOrder = 0
        object Label_DeptCode: TTntLabel
          Left = 5
          Top = 21
          Width = 100
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'fld_dept_code'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Palatino Linotype'
          Font.Style = []
          ParentFont = False
        end
        object Label_Factory: TTntLabel
          Left = 5
          Top = 152
          Width = 100
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'fld_factory'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Palatino Linotype'
          Font.Style = []
          ParentFont = False
        end
        object Label_DeptCls: TTntLabel
          Left = 5
          Top = 178
          Width = 100
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'fld_dept_cls'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Palatino Linotype'
          Font.Style = []
          ParentFont = False
        end
        object Label_OrgNum: TTntLabel
          Left = 5
          Top = 100
          Width = 100
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'fld_org_num'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Palatino Linotype'
          Font.Style = []
          ParentFont = False
        end
        object Label_DeptName: TTntLabel
          Left = 5
          Top = 48
          Width = 100
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'fld_dept_name'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Palatino Linotype'
          Font.Style = []
          ParentFont = False
        end
        object Label_DeptAbbr: TTntLabel
          Left = 5
          Top = 74
          Width = 100
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'fld_dept_abbr'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Palatino Linotype'
          Font.Style = []
          ParentFont = False
        end
        object Label_ActNum: TTntLabel
          Left = 5
          Top = 126
          Width = 100
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'fld_act_num'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Palatino Linotype'
          Font.Style = []
          ParentFont = False
        end
        object Label_EngTitl: TTntLabel
          Left = 5
          Top = 204
          Width = 100
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'fld_eng_titl'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Palatino Linotype'
          Font.Style = []
          ParentFont = False
        end
        object Label_VimTitl: TTntLabel
          Left = 5
          Top = 229
          Width = 100
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'fld_vim_titl'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Palatino Linotype'
          Font.Style = []
          ParentFont = False
        end
        object TntDBEdit1: TTntDBEdit
          Left = 112
          Top = 16
          Width = 97
          Height = 24
          CharCase = ecUpperCase
          Color = clBtnFace
          DataField = 'dept_code'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Palatino Linotype'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          OnKeyDown = TntDBEdit1KeyDown
        end
        object TntDBEdit2: TTntDBEdit
          Left = 113
          Top = 42
          Width = 184
          Height = 24
          DataField = 'dept_titl'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Palatino Linotype'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnKeyDown = TntDBEdit1KeyDown
        end
        object TntDBEdit4: TTntDBEdit
          Left = 112
          Top = 95
          Width = 73
          Height = 24
          DataField = 'org_num'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Palatino Linotype'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnKeyDown = TntDBEdit1KeyDown
        end
        object TntDBEdit5: TTntDBEdit
          Left = 113
          Top = 121
          Width = 72
          Height = 24
          Color = clBtnFace
          DataField = 'act_num'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Palatino Linotype'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
          OnKeyDown = TntDBEdit1KeyDown
        end
        object TntDBEdit8: TTntDBEdit
          Left = 113
          Top = 199
          Width = 184
          Height = 24
          DataField = 'eng_titl'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Palatino Linotype'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          OnKeyDown = TntDBEdit1KeyDown
        end
        object TntDBEdit10: TTntDBEdit
          Left = 113
          Top = 227
          Width = 184
          Height = 24
          DataField = 'vim_titl'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Palatino Linotype'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
          OnKeyDown = TntDBEdit1KeyDown
        end
        object TntDBEdit3: TTntDBEdit
          Left = 113
          Top = 69
          Width = 144
          Height = 24
          DataField = 'abbr_titl'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Palatino Linotype'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnKeyDown = TntDBEdit1KeyDown
        end
        object TntDBEdit7: TTntDBEdit
          Left = 113
          Top = 173
          Width = 80
          Height = 24
          DataField = 'dept_cls'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Palatino Linotype'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          OnKeyDown = TntDBEdit1KeyDown
        end
        object TntDBEdit6: TTntDBEdit
          Left = 112
          Top = 147
          Width = 57
          Height = 24
          DataField = 'factory'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Palatino Linotype'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          OnKeyDown = TntDBEdit1KeyDown
        end
      end
      object DBNavigator2: TDBNavigator
        Left = 39
        Top = 296
        Width = 112
        Height = 25
        DataSource = DataSource1
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Flat = True
        TabOrder = 4
        Visible = False
      end
      object bbtn_add: TTntBitBtn
        Left = 96
        Top = 296
        Width = 65
        Height = 25
        Caption = 'add'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Palatino Linotype'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = bbtn_addClick
        Glyph.Data = {
          E6000000424DE60000000000000076000000280000000F0000000E0000000100
          04000000000070000000130B0000130B00001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8880888888888888888088888888888888808888880008888880888888070888
          8880888888070888888088800007000088808880777777708880888000070000
          8880888888070888888088888807088888808888880008888880888888888888
          88808888888888888880}
      end
    end
  end
  object ADOStoredProc1: TADOStoredProc
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    ProcedureName = 'proc_dept;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@dept_begin'
        Attributes = [paNullable]
        DataType = ftString
        Size = 6
        Value = Null
      end
      item
        Name = '@dept_end'
        Attributes = [paNullable]
        DataType = ftString
        Size = 6
        Value = Null
      end
      item
        Name = '@year_month'
        Attributes = [paNullable]
        DataType = ftString
        Size = 6
        Value = Null
      end>
    Prepared = True
    Left = 53
    Top = 17
    object ADOStoredProc1dept_code: TStringField
      FieldName = 'dept_code'
      FixedChar = True
      Size = 6
    end
    object ADOStoredProc1dept_titl: TWideStringField
      FieldName = 'dept_titl'
      Size = 40
    end
    object ADOStoredProc1abbr_titl: TWideStringField
      FieldName = 'abbr_titl'
      Size = 14
    end
    object ADOStoredProc1org_num: TIntegerField
      FieldName = 'org_num'
    end
    object ADOStoredProc1act_num: TIntegerField
      FieldName = 'act_num'
    end
    object ADOStoredProc1factory: TStringField
      FieldName = 'factory'
      FixedChar = True
      Size = 1
    end
    object ADOStoredProc1dept_cls: TStringField
      FieldName = 'dept_cls'
      FixedChar = True
      Size = 2
    end
    object ADOStoredProc1vim_titl: TWideStringField
      FieldName = 'vim_titl'
      Size = 40
    end
    object ADOStoredProc1vim_abbr: TWideStringField
      FieldName = 'vim_abbr'
      Size = 14
    end
    object ADOStoredProc1eng_titl: TWideStringField
      FieldName = 'eng_titl'
      Size = 40
    end
    object ADOStoredProc1eng_abbr: TWideStringField
      FieldName = 'eng_abbr'
      Size = 14
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 533
    Top = 17
  end
  object ADOQuery1: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    AfterInsert = ADOQuery1AfterEdit
    AfterEdit = ADOQuery1AfterEdit
    BeforePost = ADOQuery1BeforePost
    BeforeDelete = ADOQuery1BeforeDelete
    AfterDelete = ADOQuery1AfterEdit
    Parameters = <>
    SQL.Strings = (
      'select top 1 * from hrd_dept')
    Left = 497
    Top = 17
    object ADOQuery1dept_code: TStringField
      FieldName = 'dept_code'
      OnSetText = ADOQuery1dept_codeSetText
      FixedChar = True
      Size = 6
    end
    object ADOQuery1dept_titl: TWideStringField
      FieldName = 'dept_titl'
      Size = 40
    end
    object ADOQuery1abbr_titl: TWideStringField
      FieldName = 'abbr_titl'
      Size = 14
    end
    object ADOQuery1vim_titl: TWideStringField
      FieldName = 'vim_titl'
      Size = 40
    end
    object ADOQuery1vim_abbr: TWideStringField
      FieldName = 'vim_abbr'
      Size = 14
    end
    object ADOQuery1eng_titl: TWideStringField
      FieldName = 'eng_titl'
      Size = 40
    end
    object ADOQuery1eng_abbr: TWideStringField
      FieldName = 'eng_abbr'
      Size = 14
    end
    object ADOQuery1org_num: TIntegerField
      FieldName = 'org_num'
    end
    object ADOQuery1act_num: TIntegerField
      FieldName = 'act_num'
    end
    object ADOQuery1factory: TStringField
      FieldName = 'factory'
      FixedChar = True
      Size = 1
    end
    object ADOQuery1dept_cls: TStringField
      FieldName = 'dept_cls'
      FixedChar = True
      Size = 2
    end
    object ADOQuery1updator: TStringField
      FieldName = 'updator'
      Visible = False
      Size = 10
    end
    object ADOQuery1update_time: TDateTimeField
      FieldName = 'update_time'
      Visible = False
    end
    object ADOQuery1is_del: TStringField
      FieldName = 'is_del'
      FixedChar = True
      Size = 1
    end
  end
  object DataSource2: TDataSource
    DataSet = ADOStoredProc1
    Left = 93
    Top = 17
  end
  object ADOQuery2: TADOQuery
    Connection = DMHrdsys.conn
    Parameters = <>
    Left = 501
    Top = 49
  end
end
