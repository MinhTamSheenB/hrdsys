object FormDut27: TFormDut27
  Left = 149
  Top = 109
  Width = 808
  Height = 578
  Caption = 'FormDut27'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Scaled = False
  OnCreate = FormCreate
  DesignSize = (
    800
    544)
  PixelsPerInch = 96
  TextHeight = 13
  object edit_Panel: TPanel
    Left = 0
    Top = 0
    Width = 800
    Height = 544
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object PanelTitle: TTntPanel
      Left = 0
      Top = 0
      Width = 800
      Height = 36
      Align = alTop
      BevelOuter = bvNone
      Caption = #37096#38272#20195#34399#21644#37096#38272#24037#34399#20301#32622#32173#35703
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
      Width = 800
      Height = 508
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 800
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object TntGroupBox1: TTntGroupBox
          Left = 0
          Top = 0
          Width = 800
          Height = 41
          Align = alClient
          Caption = 'query_condition'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object TntLabel2: TTntLabel
            Left = 449
            Top = 18
            Width = 78
            Height = 14
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'fld_dept_code'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object TntLabel1: TTntLabel
            Left = 272
            Top = 18
            Width = 24
            Height = 13
            Caption = #20301#32622
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object TntLabel3: TTntLabel
            Left = 635
            Top = 18
            Width = 24
            Height = 13
            Caption = #20301#32622
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object TntRadioButton1: TTntRadioButton
            Left = 8
            Top = 17
            Width = 73
            Height = 17
            Caption = #37096#38272#20195#34399
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnClick = TntRadioButton1Click
          end
          object TntComboBox1: TTntComboBox
            Left = 532
            Top = 13
            Width = 101
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
            ItemHeight = 13
            ParentFont = False
            TabOrder = 1
            OnChange = TntComboBox1Change
          end
          object TntRadioButton2: TTntRadioButton
            Left = 381
            Top = 17
            Width = 73
            Height = 16
            Caption = #37096#38272#24037#34399
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            OnClick = TntRadioButton2Click
          end
          object BtnQuery: TTntButton
            Left = 722
            Top = 11
            Width = 63
            Height = 25
            Caption = 'query'
            Default = True
            TabOrder = 3
            OnClick = BtnQueryClick
          end
          object TntComboBox2: TTntComboBox
            Left = 88
            Top = 13
            Width = 153
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
            TabOrder = 4
            OnChange = TntComboBox2Change
          end
          object TntEdit1: TTntEdit
            Left = 310
            Top = 13
            Width = 51
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
            ParentFont = False
            TabOrder = 5
            OnChange = TntEdit1Change
          end
          object TntEdit2: TTntEdit
            Left = 664
            Top = 12
            Width = 45
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
            ParentFont = False
            TabOrder = 6
            OnChange = TntEdit2Change
          end
        end
      end
      object PanelGrid: TPanel
        Left = 0
        Top = 41
        Width = 800
        Height = 467
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object PanelAct: TTntPanel
          Left = 0
          Top = 344
          Width = 800
          Height = 123
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 0
          object sb_Save: TTntSpeedButton
            Left = 549
            Top = 71
            Width = 79
            Height = 25
            Caption = '(&s)ave'
            Enabled = False
            Flat = True
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
            OnClick = sb_SaveClick
          end
          object sb_Recover: TTntSpeedButton
            Left = 469
            Top = 71
            Width = 80
            Height = 25
            Caption = '(&u)ndo'
            Enabled = False
            Flat = True
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
            OnClick = sb_RecoverClick
          end
          object TntBitBtn1: TTntSpeedButton
            Left = 226
            Top = 71
            Width = 82
            Height = 25
            Caption = '(&R)ead file'
            Flat = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
              55555555FFFFFFFFFF55555000000000055555577777777775F55500B8B8B8B8
              B05555775F555555575F550F0B8B8B8B8B05557F75F555555575550BF0B8B8B8
              B8B0557F575FFFFFFFF7550FBF0000000000557F557777777777500BFBFBFBFB
              0555577F555555557F550B0FBFBFBFBF05557F7F555555FF75550F0BFBFBF000
              55557F75F555577755550BF0BFBF0B0555557F575FFF757F55550FB700007F05
              55557F557777557F55550BFBFBFBFB0555557F555555557F55550FBFBFBFBF05
              55557FFFFFFFFF7555550000000000555555777777777755555550FBFB055555
              5555575FFF755555555557000075555555555577775555555555}
            NumGlyphs = 2
            OnClick = TntBitBtn1Click
          end
          object clear_check: TTntSpeedButton
            Left = 366
            Top = 36
            Width = 89
            Height = 25
            Caption = 'None'
            Flat = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              333333333333333333333333333333333333333FFF33FF333FFF339993370733
              999333777FF37FF377733339993000399933333777F777F77733333399970799
              93333333777F7377733333333999399933333333377737773333333333990993
              3333333333737F73333333333331013333333333333777FF3333333333910193
              333333333337773FF3333333399000993333333337377737FF33333399900099
              93333333773777377FF333399930003999333337773777F777FF339993370733
              9993337773337333777333333333333333333333333333333333333333333333
              3333333333333333333333333333333333333333333333333333}
            NumGlyphs = 2
            OnClick = clear_checkClick
          end
          object check_all: TTntSpeedButton
            Left = 277
            Top = 36
            Width = 89
            Height = 25
            Caption = '&All'
            Flat = True
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
            OnClick = check_allClick
          end
          object sb_edit: TTntSpeedButton
            Left = 389
            Top = 71
            Width = 80
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
          object sb_Add: TTntSpeedButton
            Left = 309
            Top = 71
            Width = 80
            Height = 25
            Caption = '(&a)dd'
            Enabled = False
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
          object StatusBar1: TTntStatusBar
            Left = 0
            Top = 98
            Width = 800
            Height = 25
            Panels = <
              item
                Text = ' Current State :'
                Width = 80
              end
              item
                Text = 'TTntStatusPanel1'
                Width = 300
              end>
          end
        end
        object DBGrid1: TTntDBGrid
          Left = 0
          Top = 0
          Width = 377
          Height = 344
          Align = alLeft
          DataSource = DataSource1
          FixedColor = clSkyBlue
          ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBGrid1CellClick
          OnDrawColumnCell = DBGrid1DrawColumnCell
          OnTitleClick = DBGrid1TitleClick
          Columns = <
            item
              Expanded = False
              Width = 21
              Visible = True
            end
            item
              Color = cl3DLight
              Expanded = False
              FieldName = 'dept_code'
              ReadOnly = True
              Width = 47
              Visible = True
            end
            item
              Color = cl3DLight
              Expanded = False
              FieldName = 'dept_titl'
              ReadOnly = True
              Width = 152
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'new_local'
              Width = 56
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'valid_date'
              Visible = True
            end>
        end
        object DBGrid2: TTntDBGrid
          Left = 392
          Top = 0
          Width = 408
          Height = 344
          Align = alRight
          DataSource = DataSource2
          FixedColor = clSkyBlue
          ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBGrid2CellClick
          OnDrawColumnCell = DBGrid2DrawColumnCell
          OnTitleClick = DBGrid2TitleClick
          Columns = <
            item
              Expanded = False
              Width = 19
              Visible = True
            end
            item
              Color = cl3DLight
              Expanded = False
              FieldName = 'emp_id'
              ReadOnly = True
              Visible = True
            end
            item
              Color = cl3DLight
              Expanded = False
              FieldName = 'emp_chs'
              ReadOnly = True
              Width = 159
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'new_local'
              Width = 42
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'valid_date'
              Visible = True
            end>
        end
      end
    end
  end
  object dept_Panel: TTntPanel
    Left = 21
    Top = 152
    Width = 297
    Height = 313
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelInner = bvRaised
    BevelOuter = bvNone
    BevelWidth = 2
    BorderWidth = 1
    BorderStyle = bsSingle
    TabOrder = 1
    Visible = False
    object TntLabel4: TTntLabel
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
      Width = 287
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
      TabOrder = 1
      OnMouseDown = PanelFlowTitleMouseDown
      object ImageClose: TImage
        Left = 265
        Top = 1
        Width = 21
        Height = 22
        Align = alRight
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
    object TntGroupBox5: TTntGroupBox
      Left = 13
      Top = 37
      Width = 267
      Height = 229
      Align = alClient
      TabOrder = 0
      object Label_emp_id: TTntLabel
        Left = 5
        Top = 14
        Width = 100
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'dept_code'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label_s_ask_h: TTntLabel
        Left = 5
        Top = 42
        Width = 100
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'dept_titl'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label_e_ask_h: TTntLabel
        Left = 5
        Top = 67
        Width = 100
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'new_local'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object TntLabel8: TTntLabel
        Left = 213
        Top = 21
        Width = 15
        Height = 16
        AutoSize = False
        Caption = '*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object TntLabel5: TTntLabel
        Left = 5
        Top = 92
        Width = 100
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'old_local'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object TntLabel6: TTntLabel
        Left = 5
        Top = 115
        Width = 100
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'valid_date'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object EditFlow0: TTntDBEdit
        Left = 110
        Top = 12
        Width = 100
        Height = 21
        Color = cl3DLight
        DataField = 'dept_code'
        DataSource = DataSource1
        ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
        ReadOnly = True
        TabOrder = 0
      end
      object EditFlow1: TTntDBEdit
        Left = 110
        Top = 37
        Width = 100
        Height = 21
        Color = cl3DLight
        DataField = 'dept_titl'
        DataSource = DataSource1
        ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
        ReadOnly = True
        TabOrder = 1
      end
      object EditFlow2: TTntDBEdit
        Left = 110
        Top = 61
        Width = 100
        Height = 21
        DataField = 'new_local'
        DataSource = DataSource1
        ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
        TabOrder = 2
      end
      object TntDBEdit1: TTntDBEdit
        Left = 110
        Top = 86
        Width = 100
        Height = 21
        Color = cl3DLight
        DataField = 'old_local'
        DataSource = DataSource1
        ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
        ReadOnly = True
        TabOrder = 3
      end
      object TntDBEdit2: TTntDBEdit
        Left = 110
        Top = 113
        Width = 100
        Height = 21
        DataField = 'valid_date'
        DataSource = DataSource1
        ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
        TabOrder = 4
      end
    end
    object Panel2: TPanel
      Left = 3
      Top = 266
      Width = 287
      Height = 40
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object bbtn_ok: TTntBitBtn
        Left = 113
        Top = 8
        Width = 65
        Height = 25
        Caption = 'finish'
        TabOrder = 0
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
    end
    object Panel3: TPanel
      Left = 3
      Top = 27
      Width = 287
      Height = 10
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 3
    end
    object Panel4: TPanel
      Left = 3
      Top = 37
      Width = 10
      Height = 229
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 4
    end
    object Panel6: TPanel
      Left = 280
      Top = 37
      Width = 10
      Height = 229
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 5
    end
  end
  object emp_Panel: TTntPanel
    Left = 243
    Top = 136
    Width = 297
    Height = 313
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelInner = bvRaised
    BevelOuter = bvNone
    BevelWidth = 2
    BorderWidth = 1
    BorderStyle = bsSingle
    TabOrder = 2
    Visible = False
    object TntLabel7: TTntLabel
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
    object TntPanel2: TTntPanel
      Left = 3
      Top = 3
      Width = 287
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
      TabOrder = 1
      OnMouseDown = TntPanel2MouseDown
      object Image1: TImage
        Left = 265
        Top = 1
        Width = 21
        Height = 22
        Align = alRight
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
    object TntGroupBox2: TTntGroupBox
      Left = 13
      Top = 37
      Width = 267
      Height = 229
      Align = alClient
      TabOrder = 0
      object TntLabel9: TTntLabel
        Left = 5
        Top = 14
        Width = 100
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'emp_id'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object TntLabel10: TTntLabel
        Left = 5
        Top = 42
        Width = 100
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'emp_chs'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object TntLabel11: TTntLabel
        Left = 5
        Top = 67
        Width = 100
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'new_local'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object TntLabel12: TTntLabel
        Left = 213
        Top = 21
        Width = 15
        Height = 16
        AutoSize = False
        Caption = '*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object TntLabel13: TTntLabel
        Left = 5
        Top = 92
        Width = 100
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'old_local'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object TntLabel14: TTntLabel
        Left = 5
        Top = 115
        Width = 100
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'valid_date'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object TntDBEdit3: TTntDBEdit
        Left = 110
        Top = 12
        Width = 100
        Height = 21
        Color = cl3DLight
        DataField = 'emp_id'
        DataSource = DataSource2
        ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
        ReadOnly = True
        TabOrder = 0
      end
      object TntDBEdit4: TTntDBEdit
        Left = 110
        Top = 37
        Width = 100
        Height = 21
        Color = cl3DLight
        DataField = 'emp_chs'
        DataSource = DataSource2
        ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
        ReadOnly = True
        TabOrder = 1
      end
      object TntDBEdit5: TTntDBEdit
        Left = 110
        Top = 61
        Width = 100
        Height = 21
        DataField = 'new_local'
        DataSource = DataSource2
        ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
        TabOrder = 2
      end
      object TntDBEdit6: TTntDBEdit
        Left = 110
        Top = 86
        Width = 100
        Height = 21
        Color = cl3DLight
        DataField = 'old_local'
        DataSource = DataSource2
        ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
        ReadOnly = True
        TabOrder = 3
      end
      object TntDBEdit7: TTntDBEdit
        Left = 110
        Top = 113
        Width = 100
        Height = 21
        DataField = 'valid_date'
        DataSource = DataSource2
        ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
        TabOrder = 4
      end
    end
    object Panel1: TPanel
      Left = 3
      Top = 266
      Width = 287
      Height = 40
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object bbtn_ok2: TTntBitBtn
        Left = 113
        Top = 8
        Width = 65
        Height = 25
        Caption = 'finish'
        TabOrder = 0
        OnClick = bbtn_ok2Click
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
    end
    object Panel7: TPanel
      Left = 3
      Top = 27
      Width = 287
      Height = 10
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 3
    end
    object Panel8: TPanel
      Left = 3
      Top = 37
      Width = 10
      Height = 229
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 4
    end
    object Panel9: TPanel
      Left = 280
      Top = 37
      Width = 10
      Height = 229
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 5
    end
  end
  object insert_Panel: TTntPanel
    Left = 421
    Top = 115
    Width = 297
    Height = 305
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelInner = bvRaised
    BevelOuter = bvNone
    BevelWidth = 2
    BorderWidth = 1
    BorderStyle = bsSingle
    TabOrder = 3
    Visible = False
    object TntLabel15: TTntLabel
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
    object TntPanel3: TTntPanel
      Left = 3
      Top = 3
      Width = 287
      Height = 24
      Align = alTop
      Alignment = taLeftJustify
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'insert_area'
      Color = clGradientActiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Palatino Linotype'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnMouseDown = TntPanel3MouseDown
      object Image2: TImage
        Left = 265
        Top = 1
        Width = 21
        Height = 22
        Align = alRight
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
    object TntGroupBox3: TTntGroupBox
      Left = 13
      Top = 37
      Width = 267
      Height = 221
      Align = alClient
      TabOrder = 0
      object TntLabel16: TTntLabel
        Left = 11
        Top = 17
        Width = 85
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'dept_code'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object TntLabel17: TTntLabel
        Left = 11
        Top = 42
        Width = 85
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'dept_titl'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object TntLabel18: TTntLabel
        Left = 11
        Top = 67
        Width = 85
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'new_local'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object TntLabel19: TTntLabel
        Left = 229
        Top = 21
        Width = 15
        Height = 16
        AutoSize = False
        Caption = '*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object TntLabel21: TTntLabel
        Left = 11
        Top = 90
        Width = 85
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'valid_date'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object TntDBEdit9: TTntDBEdit
        Left = 100
        Top = 37
        Width = 131
        Height = 21
        Color = cl3DLight
        DataField = 'dept_titl'
        DataSource = DataSource1
        ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
        ReadOnly = True
        TabOrder = 0
      end
      object TntDBEdit10: TTntDBEdit
        Left = 100
        Top = 61
        Width = 93
        Height = 21
        DataField = 'new_local'
        DataSource = DataSource1
        ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
        TabOrder = 1
        OnChange = TntDBEdit10Change
      end
      object TntDBComboBox1: TTntDBComboBox
        Left = 100
        Top = 11
        Width = 131
        Height = 21
        DataField = 'dept_code'
        DataSource = DataSource1
        ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
        ItemHeight = 13
        TabOrder = 2
      end
      object TntDateTimePicker1: TTntDateTimePicker
        Left = 100
        Top = 84
        Width = 93
        Height = 21
        Date = 38943.590700567130000000
        Time = 38943.590700567130000000
        ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
        TabOrder = 3
        OnChange = TntDateTimePicker1Change
      end
    end
    object Panel10: TPanel
      Left = 3
      Top = 258
      Width = 287
      Height = 40
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object sb_add2: TTntSpeedButton
        Left = 75
        Top = 7
        Width = 80
        Height = 25
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
        OnClick = sb_add2Click
      end
      object TntBitBtn2: TTntBitBtn
        Left = 156
        Top = 7
        Width = 80
        Height = 25
        Caption = 'finish'
        TabOrder = 0
        OnClick = TntBitBtn2Click
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
    end
    object Panel11: TPanel
      Left = 3
      Top = 27
      Width = 287
      Height = 10
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 3
    end
    object Panel12: TPanel
      Left = 3
      Top = 37
      Width = 10
      Height = 221
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 4
    end
    object Panel13: TPanel
      Left = 280
      Top = 37
      Width = 10
      Height = 221
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 5
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 32
  end
  object ADOQuery1: TADOQuery
    Connection = DMHrdsys.conn
    LockType = ltBatchOptimistic
    BeforeEdit = ADOQuery1BeforeEdit
    BeforePost = ADOQuery1BeforePost
    OnCalcFields = ADOQuery1AfterScroll
    Parameters = <>
    SQL.Strings = (
      'select * from hrd_dut_dept_local where 1>2')
    Left = 144
    object ADOQuery1up_user: TStringField
      FieldName = 'up_user'
      Size = 10
    end
    object ADOQuery1up_time: TDateTimeField
      FieldName = 'up_time'
    end
    object ADOQuery1dept_code: TStringField
      FieldName = 'dept_code'
      Size = 6
    end
    object ADOQuery1dept_titl: TTntWideStringField
      FieldKind = fkLookup
      FieldName = 'dept_titl'
      LookupDataSet = ADOQuery2
      LookupKeyFields = 'dept_code'
      LookupResultField = 'abbr_titl'
      KeyFields = 'dept_code'
      Size = 30
      Lookup = True
    end
    object ADOQuery1old_local: TStringField
      FieldName = 'old_local'
      Size = 8
    end
    object ADOQuery1new_local: TStringField
      FieldName = 'new_local'
      OnChange = ADOQuery1new_localChange
      Size = 8
    end
    object ADOQuery1valid_date: TDateTimeField
      FieldName = 'valid_date'
    end
  end
  object ADOQuery2: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from hrd_dept order by dept_code')
    Left = 256
    Top = 8
    object ADOQuery2dept_code: TStringField
      FieldName = 'dept_code'
      FixedChar = True
      Size = 6
    end
    object ADOQuery2dept_titl: TWideStringField
      FieldName = 'dept_titl'
      Size = 40
    end
    object ADOQuery2abbr_titl: TWideStringField
      FieldName = 'abbr_titl'
      Size = 14
    end
    object ADOQuery2vim_titl: TWideStringField
      FieldName = 'vim_titl'
      Size = 40
    end
    object ADOQuery2vim_abbr: TWideStringField
      FieldName = 'vim_abbr'
      Size = 14
    end
    object ADOQuery2eng_titl: TWideStringField
      FieldName = 'eng_titl'
      Size = 40
    end
    object ADOQuery2eng_abbr: TWideStringField
      FieldName = 'eng_abbr'
      Size = 14
    end
    object ADOQuery2org_num: TIntegerField
      FieldName = 'org_num'
    end
    object ADOQuery2act_num: TIntegerField
      FieldName = 'act_num'
    end
    object ADOQuery2factory: TStringField
      FieldName = 'factory'
      FixedChar = True
      Size = 1
    end
    object ADOQuery2dept_cls: TStringField
      FieldName = 'dept_cls'
      FixedChar = True
      Size = 2
    end
    object ADOQuery2updator: TStringField
      FieldName = 'updator'
      Size = 10
    end
    object ADOQuery2update_time: TDateTimeField
      FieldName = 'update_time'
    end
    object ADOQuery2is_del: TStringField
      FieldName = 'is_del'
      FixedChar = True
      Size = 1
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 104
    Top = 4
  end
  object ADOCommand1: TADOCommand
    Connection = DMHrdsys.conn
    Parameters = <>
    Left = 184
    Top = 8
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery3
    Left = 416
    Top = 8
  end
  object ADOQuery4: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from hrd_emp where 1=1')
    Left = 520
  end
  object ADOQuery3: TADOQuery
    Connection = DMHrdsys.conn
    LockType = ltBatchOptimistic
    BeforePost = ADOQuery3BeforePost
    Parameters = <>
    SQL.Strings = (
      'select * from hrd_dut_dept_local2  where 2<1'
      '')
    Left = 472
    Top = 8
    object ADOQuery3up_user: TWideStringField
      FieldName = 'up_user'
      Size = 50
    end
    object ADOQuery3up_time: TDateTimeField
      FieldName = 'up_time'
    end
    object ADOQuery3emp_id: TStringField
      FieldName = 'emp_id'
      Size = 8
    end
    object ADOQuery3emp_chs: TTntWideStringField
      FieldKind = fkLookup
      FieldName = 'emp_chs'
      LookupDataSet = ADOQuery4
      LookupKeyFields = 'emp_id'
      LookupResultField = 'emp_chs'
      KeyFields = 'emp_id'
      Size = 30
      Lookup = True
    end
    object ADOQuery3old_local: TStringField
      FieldName = 'old_local'
      Size = 8
    end
    object ADOQuery3new_local: TStringField
      FieldName = 'new_local'
      Size = 8
    end
    object ADOQuery3valid_date: TDateTimeField
      FieldName = 'valid_date'
    end
  end
  object ADOCommand2: TADOCommand
    Connection = DMHrdsys.conn
    Parameters = <>
    Left = 608
    Top = 8
  end
  object ADOQuery5: TADOQuery
    Connection = DMHrdsys.conn
    Parameters = <>
    Left = 696
    Top = 16
  end
end
