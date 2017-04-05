object FormBus01: TFormBus01
  Left = -4
  Top = 81
  Width = 800
  Height = 501
  Caption = 'FormBus01'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = TntFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object TntPageControl1: TTntPageControl
    Left = 0
    Top = 57
    Width = 792
    Height = 374
    ActivePage = TntTabSheet5
    Align = alClient
    TabOrder = 0
    OnChange = TntPageControl1Change
    object TntTabSheet1: TTntTabSheet
      Caption = 'car_base'
      DesignSize = (
        784
        346)
      object TntGroupBox1: TTntGroupBox
        Left = 0
        Top = 0
        Width = 784
        Height = 81
        Align = alTop
        Caption = 'query_condition'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object CobCarNo: TTntComboBox
          Left = 187
          Top = 17
          Width = 120
          Height = 21
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 0
        end
        object Btn_Search: TTntBitBtn
          Left = 559
          Top = 11
          Width = 81
          Height = 25
          Caption = 'find'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
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
        object Btn_Reset: TTntBitBtn
          Left = 559
          Top = 42
          Width = 81
          Height = 25
          Caption = 'reset'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = Btn_ResetClick
          Kind = bkRetry
        end
        object cb_car_no: TTntCheckBox
          Left = 95
          Top = 20
          Width = 85
          Height = 17
          Caption = 'fld_car_no'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = cb_driverClick
        end
        object cb_driver: TTntCheckBox
          Left = 335
          Top = 20
          Width = 85
          Height = 17
          Caption = 'fld_driver'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnClick = cb_driverClick
        end
        object cb_car_model: TTntCheckBox
          Left = 95
          Top = 50
          Width = 85
          Height = 17
          Caption = 'fld_car_model'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          OnClick = cb_driverClick
        end
        object EditCarModel: TTntEdit
          Left = 187
          Top = 45
          Width = 119
          Height = 21
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
        end
        object CobDriver: TTntComboBox
          Left = 425
          Top = 17
          Width = 123
          Height = 21
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 7
        end
        object cb_buy_local: TTntCheckBox
          Left = 336
          Top = 48
          Width = 86
          Height = 17
          Caption = 'fld_buy_local'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
          OnClick = cb_driverClick
        end
        object EditBuyLocal: TTntEdit
          Left = 425
          Top = 44
          Width = 119
          Height = 21
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
        end
      end
      object DBGrid1: TTntDBGrid
        Left = 0
        Top = 81
        Width = 784
        Height = 265
        Align = alClient
        DataSource = ds_carbase
        FixedColor = clSkyBlue
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnTitleClick = TntDBGrid1TitleClick
        Columns = <
          item
            Expanded = False
            FieldName = 'car_no'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'drivername'
            Title.Caption = 'driver'
            Width = 82
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'car_date'
            Width = 83
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'car_model'
            Width = 94
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'buy_local'
            Width = 114
            Visible = True
          end>
      end
      object PanelFlow: TTntPanel
        Left = 456
        Top = 81
        Width = 310
        Height = 240
        Anchors = [akLeft, akTop, akRight, akBottom]
        BevelInner = bvRaised
        BevelOuter = bvNone
        BevelWidth = 2
        BorderWidth = 1
        BorderStyle = bsSingle
        TabOrder = 2
        Visible = False
        object TntLabel3: TTntLabel
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
        object sbtn_add: TTntSpeedButton
          Left = 88
          Top = 195
          Width = 65
          Height = 25
          Caption = 'add'
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
          OnClick = sbtn_addClick
        end
        object sbtn_finish: TTntSpeedButton
          Left = 160
          Top = 195
          Width = 65
          Height = 25
          Caption = 'finish'
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
          OnClick = sbtn_finishClick
        end
        object PanelFlowTitle: TTntPanel
          Left = 3
          Top = 3
          Width = 300
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
        object TntGroupBox5: TTntGroupBox
          Left = 15
          Top = 32
          Width = 262
          Height = 153
          TabOrder = 0
          object Label_car_no: TTntLabel
            Left = 5
            Top = 21
            Width = 100
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'fld_car_no'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label_car_model: TTntLabel
            Left = 5
            Top = 96
            Width = 100
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'fld_car_model'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label_driver: TTntLabel
            Left = 5
            Top = 46
            Width = 100
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'fld_driver'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'MS PGothic'
            Font.Style = []
            ParentFont = False
          end
          object Label_car_date: TTntLabel
            Left = 5
            Top = 72
            Width = 100
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'fld_car_date'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'MS PGothic'
            Font.Style = []
            ParentFont = False
          end
          object label_buy_local: TTntLabel
            Left = 5
            Top = 119
            Width = 100
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'fld_buy_local'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object sb_GetDate: TTntSpeedButton
            Left = 211
            Top = 64
            Width = 23
            Height = 22
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            OnClick = sb_GetDateClick
          end
          object EditCarNo: TTntDBEdit
            Left = 110
            Top = 16
            Width = 123
            Height = 21
            DataField = 'car_no'
            DataSource = ds_carbase
            TabOrder = 1
          end
          object edit_car_date: TTntDBEdit
            Left = 110
            Top = 65
            Width = 91
            Height = 21
            Color = clWhite
            DataField = 'car_date'
            DataSource = ds_carbase
            MaxLength = 10
            TabOrder = 0
          end
          object edit_car_model: TTntDBEdit
            Left = 110
            Top = 90
            Width = 124
            Height = 21
            Color = clWhite
            DataField = 'car_model'
            DataSource = ds_carbase
            TabOrder = 2
          end
          object Edit_buy_local: TTntDBEdit
            Left = 110
            Top = 114
            Width = 124
            Height = 21
            Color = clWhite
            DataField = 'buy_local'
            DataSource = ds_carbase
            TabOrder = 3
          end
          object DBCobDriver: TTntDBComboBox
            Left = 110
            Top = 40
            Width = 125
            Height = 21
            DataField = 'driver'
            DataSource = ds_carbase
            ItemHeight = 13
            TabOrder = 4
          end
        end
        object Nvg1: TDBNavigator
          Left = 38
          Top = 195
          Width = 112
          Height = 25
          DataSource = ds_carbase
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          Flat = True
          TabOrder = 2
        end
      end
      object mcd1: TMonthCalendar
        Left = 208
        Top = 160
        Width = 267
        Height = 154
        Date = 38639.601322152770000000
        TabOrder = 3
        Visible = False
        OnDblClick = mcd1DblClick
      end
    end
    object TntTabSheet2: TTntTabSheet
      Caption = 'car_fix_fee'
      DesignSize = (
        784
        346)
      object TntGroupBox2: TTntGroupBox
        Left = 0
        Top = 0
        Width = 784
        Height = 49
        Align = alTop
        Caption = 'query_condition'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object CobCarNoFix: TTntComboBox
          Left = 131
          Top = 17
          Width = 120
          Height = 21
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 0
        end
        object bbtn_fix_search: TTntBitBtn
          Left = 559
          Top = 13
          Width = 81
          Height = 25
          Caption = 'find'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = bbtn_fix_searchClick
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
        object bbtn_fix_reset: TTntBitBtn
          Left = 647
          Top = 13
          Width = 81
          Height = 25
          Caption = 'reset'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = bbtn_fix_resetClick
          Kind = bkRetry
        end
        object cb_car_no_f: TTntCheckBox
          Left = 39
          Top = 20
          Width = 85
          Height = 17
          Caption = 'fld_car_no'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = cb_repair_dateClick
        end
        object cb_repair_date: TTntCheckBox
          Left = 273
          Top = 20
          Width = 96
          Height = 17
          Caption = 'fld_repair_date'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnClick = cb_repair_dateClick
        end
        object dtp_fix_begin: TDateTimePicker
          Left = 374
          Top = 16
          Width = 86
          Height = 21
          Date = 38639.451901574070000000
          Time = 38639.451901574070000000
          TabOrder = 5
        end
        object dtp_fix_end: TDateTimePicker
          Left = 464
          Top = 16
          Width = 85
          Height = 21
          Date = 38639.452027083330000000
          Time = 38639.452027083330000000
          TabOrder = 6
        end
      end
      object TntDBGrid1: TTntDBGrid
        Left = 0
        Top = 49
        Width = 784
        Height = 297
        Align = alClient
        DataSource = ds_fix
        FixedColor = clSkyBlue
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnTitleClick = TntDBGrid1TitleClick
        Columns = <
          item
            Expanded = False
            FieldName = 'car_no'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'rep_cate'
            Title.Caption = 'repair_cate'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'repair_date'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'repair_rate'
            Visible = True
          end>
      end
      object PanelFlow2: TTntPanel
        Left = 400
        Top = 57
        Width = 310
        Height = 216
        Anchors = [akLeft, akTop, akRight, akBottom]
        BevelInner = bvRaised
        BevelOuter = bvNone
        BevelWidth = 2
        BorderWidth = 1
        BorderStyle = bsSingle
        TabOrder = 2
        Visible = False
        object TntLabel1: TTntLabel
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
        object sbtn_add2: TTntSpeedButton
          Left = 88
          Top = 167
          Width = 65
          Height = 25
          Caption = 'add'
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
          OnClick = sbtn_addClick
        end
        object TntSpeedButton2: TTntSpeedButton
          Left = 160
          Top = 167
          Width = 65
          Height = 25
          Caption = 'finish'
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
          OnClick = sbtn_finishClick
        end
        object TntPanel3: TTntPanel
          Left = 3
          Top = 3
          Width = 300
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
          object Image1: TImage
            Left = 265
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
        object TntGroupBox3: TTntGroupBox
          Left = 15
          Top = 32
          Width = 262
          Height = 129
          TabOrder = 0
          object TntLabel2: TTntLabel
            Left = 5
            Top = 23
            Width = 100
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'fld_car_no'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object TntLabel4: TTntLabel
            Left = 5
            Top = 73
            Width = 100
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'fld_repair_cate'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object TntLabel6: TTntLabel
            Left = 6
            Top = 47
            Width = 100
            Height = 15
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'fld_repair_date'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'MS PGothic'
            Font.Style = []
            ParentFont = False
          end
          object TntLabel7: TTntLabel
            Left = 5
            Top = 99
            Width = 100
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'fld_repair_rate'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object TntSpeedButton3: TTntSpeedButton
            Left = 211
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
            OnClick = TntSpeedButton3Click
          end
          object TntDBEdit2: TTntDBEdit
            Left = 110
            Top = 41
            Width = 91
            Height = 21
            Color = clWhite
            DataField = 'repair_date'
            DataSource = ds_fix
            MaxLength = 10
            TabOrder = 0
          end
          object TntDBEdit4: TTntDBEdit
            Left = 110
            Top = 95
            Width = 124
            Height = 21
            Color = clWhite
            DataField = 'repair_rate'
            DataSource = ds_fix
            TabOrder = 1
          end
          object TntCobCarNo: TTntDBComboBox
            Left = 110
            Top = 16
            Width = 125
            Height = 21
            DataField = 'car_no'
            DataSource = ds_fix
            ItemHeight = 13
            TabOrder = 2
            OnChange = TntCobCarNoChange
          end
          object CobRepCate: TTntDBComboBox
            Left = 110
            Top = 68
            Width = 125
            Height = 21
            DataField = 'repair_cate'
            DataSource = ds_fix
            ItemHeight = 13
            TabOrder = 3
            OnChange = TntCobCarNoChange
          end
        end
        object Nvg2: TDBNavigator
          Left = 38
          Top = 168
          Width = 112
          Height = 25
          DataSource = ds_fix
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          Flat = True
          TabOrder = 2
        end
      end
      object mcd2: TMonthCalendar
        Left = 136
        Top = 136
        Width = 267
        Height = 154
        Date = 38639.601323055550000000
        TabOrder = 3
        Visible = False
        OnDblClick = mcd2DblClick
      end
    end
    object TntTabSheet3: TTntTabSheet
      Caption = 'car_picc_fee'
      DesignSize = (
        784
        346)
      object TntGroupBox4: TTntGroupBox
        Left = 0
        Top = 0
        Width = 784
        Height = 72
        Align = alTop
        Caption = 'query_condition'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object cobCarNoPicc: TTntComboBox
          Left = 131
          Top = 12
          Width = 120
          Height = 21
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 0
        end
        object bb_picc_search: TTntBitBtn
          Left = 575
          Top = 8
          Width = 81
          Height = 25
          Caption = 'find'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = bb_picc_searchClick
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
        object bb_picc_reset: TTntBitBtn
          Left = 575
          Top = 40
          Width = 81
          Height = 25
          Caption = 'reset'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = bb_picc_resetClick
          Kind = bkRetry
        end
        object cbCarNoPicc: TTntCheckBox
          Left = 39
          Top = 15
          Width = 85
          Height = 17
          Caption = 'fld_car_no'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = cbCarNoPiccClick
        end
        object cb_picc_start: TTntCheckBox
          Left = 273
          Top = 15
          Width = 96
          Height = 17
          Caption = 'fld_picc_start'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnClick = cbCarNoPiccClick
        end
        object dtp_s_Start: TDateTimePicker
          Left = 374
          Top = 11
          Width = 86
          Height = 21
          Date = 38639.451901574070000000
          Time = 38639.451901574070000000
          TabOrder = 5
        end
        object dtp_s_End: TDateTimePicker
          Left = 464
          Top = 11
          Width = 85
          Height = 21
          Date = 38639.452027083330000000
          Time = 38639.452027083330000000
          TabOrder = 6
        end
        object dtp_e_end: TDateTimePicker
          Left = 464
          Top = 43
          Width = 85
          Height = 21
          Date = 38639.452027083330000000
          Time = 38639.452027083330000000
          TabOrder = 7
        end
        object dtp_e_start: TDateTimePicker
          Left = 374
          Top = 43
          Width = 86
          Height = 21
          Date = 38639.451901574070000000
          Time = 38639.451901574070000000
          TabOrder = 8
        end
        object cb_picc_end: TTntCheckBox
          Left = 273
          Top = 47
          Width = 96
          Height = 17
          Caption = 'fld_picc_end'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
          OnClick = cbCarNoPiccClick
        end
      end
      object TntDBGrid2: TTntDBGrid
        Left = 0
        Top = 72
        Width = 784
        Height = 274
        Align = alClient
        DataSource = ds_picc
        FixedColor = clSkyBlue
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnTitleClick = TntDBGrid1TitleClick
        Columns = <
          item
            Expanded = False
            FieldName = 'car_no'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'picc_start'
            Width = 71
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'picc_end'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'picc_rate'
            Width = 76
            Visible = True
          end>
      end
      object PanelFlow3: TTntPanel
        Left = 368
        Top = 89
        Width = 297
        Height = 216
        Anchors = [akLeft, akTop, akRight, akBottom]
        BevelInner = bvRaised
        BevelOuter = bvNone
        BevelWidth = 2
        BorderWidth = 1
        BorderStyle = bsSingle
        TabOrder = 2
        Visible = False
        object TntLabel5: TTntLabel
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
        object sbtn_add3: TTntSpeedButton
          Left = 88
          Top = 167
          Width = 65
          Height = 25
          Caption = 'add'
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
          OnClick = sbtn_addClick
        end
        object TntSpeedButton4: TTntSpeedButton
          Left = 160
          Top = 167
          Width = 65
          Height = 25
          Caption = 'finish'
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
          OnClick = sbtn_finishClick
        end
        object TntPanel4: TTntPanel
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
          object Image2: TImage
            Left = 265
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
        object TntGroupBox6: TTntGroupBox
          Left = 15
          Top = 32
          Width = 262
          Height = 129
          TabOrder = 0
          object TntLabel8: TTntLabel
            Left = 5
            Top = 23
            Width = 100
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'fld_car_no'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object TntLabel9: TTntLabel
            Left = 5
            Top = 73
            Width = 100
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'fld_picc_end'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object TntLabel10: TTntLabel
            Left = 6
            Top = 47
            Width = 100
            Height = 15
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'fld_picc_start'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'MS PGothic'
            Font.Style = []
            ParentFont = False
          end
          object TntLabel11: TTntLabel
            Left = 5
            Top = 99
            Width = 100
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'fld_picc_rate'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object TntSpeedButton5: TTntSpeedButton
            Left = 211
            Top = 41
            Width = 23
            Height = 22
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            OnClick = TntSpeedButton5Click
          end
          object TntSpeedButton6: TTntSpeedButton
            Left = 211
            Top = 68
            Width = 23
            Height = 22
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            OnClick = TntSpeedButton6Click
          end
          object TntDBEdit1: TTntDBEdit
            Left = 110
            Top = 41
            Width = 91
            Height = 21
            Color = clWhite
            DataField = 'picc_start'
            DataSource = ds_picc
            MaxLength = 10
            TabOrder = 0
          end
          object TntDBEdit5: TTntDBEdit
            Left = 110
            Top = 68
            Width = 91
            Height = 21
            Color = clWhite
            DataField = 'picc_end'
            DataSource = ds_picc
            TabOrder = 1
          end
          object TntDBEdit6: TTntDBEdit
            Left = 110
            Top = 95
            Width = 124
            Height = 21
            Color = clWhite
            DataField = 'picc_rate'
            DataSource = ds_picc
            TabOrder = 2
          end
          object DBCobCarNoPicc: TTntDBComboBox
            Left = 110
            Top = 16
            Width = 125
            Height = 21
            DataField = 'car_no'
            DataSource = ds_picc
            ItemHeight = 13
            TabOrder = 3
            OnChange = TntCobCarNoChange
          end
        end
        object Nvg3: TDBNavigator
          Left = 38
          Top = 168
          Width = 112
          Height = 25
          DataSource = ds_picc
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          Flat = True
          TabOrder = 2
        end
      end
      object mcd3: TMonthCalendar
        Left = 128
        Top = 128
        Width = 267
        Height = 154
        Date = 38639.601324143520000000
        TabOrder = 3
        Visible = False
        OnDblClick = mcd3DblClick
      end
      object mcd4: TMonthCalendar
        Left = 128
        Top = 152
        Width = 267
        Height = 154
        Date = 38639.601324143520000000
        TabOrder = 4
        Visible = False
        OnDblClick = mcd4DblClick
      end
    end
    object TntTabSheet4: TTntTabSheet
      Caption = 'car_petrol_fee'
      DesignSize = (
        784
        346)
      object TntGroupBox7: TTntGroupBox
        Left = 0
        Top = 0
        Width = 784
        Height = 72
        Align = alTop
        Caption = 'query_condition'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object CobCarNoYou: TTntComboBox
          Left = 131
          Top = 12
          Width = 120
          Height = 21
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 0
        end
        object bbtn_search_you: TTntBitBtn
          Left = 576
          Top = 8
          Width = 81
          Height = 25
          Hint = 'bbtn_you_search'
          Caption = 'find'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = bbtn_search_youClick
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
        object bbtn_reset_you: TTntBitBtn
          Left = 576
          Top = 35
          Width = 81
          Height = 25
          Hint = 'bbtn_you_reset'
          Caption = 'reset'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = bbtn_reset_youClick
          Kind = bkRetry
        end
        object CBCarNoYou: TTntCheckBox
          Left = 39
          Top = 15
          Width = 85
          Height = 17
          Caption = 'fld_car_no'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = CBCarNoYouClick
        end
        object cb_you_date: TTntCheckBox
          Left = 273
          Top = 15
          Width = 96
          Height = 17
          Caption = 'fld_you_date'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnClick = CBCarNoYouClick
        end
        object dtp_you_begin: TDateTimePicker
          Left = 374
          Top = 11
          Width = 86
          Height = 21
          Date = 38639.451901574070000000
          Time = 38639.451901574070000000
          TabOrder = 5
        end
        object dtp_you_end: TDateTimePicker
          Left = 464
          Top = 11
          Width = 85
          Height = 21
          Date = 38639.452027083330000000
          Time = 38639.452027083330000000
          TabOrder = 6
        end
        object CBYouCate: TTntCheckBox
          Left = 39
          Top = 44
          Width = 85
          Height = 17
          Caption = 'fld_you_cate'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          OnClick = CBCarNoYouClick
        end
        object CobYouCate: TTntComboBox
          Left = 131
          Top = 42
          Width = 120
          Height = 21
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 8
        end
      end
      object TntDBGrid3: TTntDBGrid
        Left = 0
        Top = 72
        Width = 784
        Height = 274
        Align = alClient
        DataSource = ds_petrol
        FixedColor = clSkyBlue
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnTitleClick = TntDBGrid1TitleClick
        Columns = <
          item
            Expanded = False
            FieldName = 'car_no'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'you_type'
            Title.Caption = 'you_cate'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'you_date'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'you_qty'
            Visible = True
          end>
      end
      object PanelFlow4: TTntPanel
        Left = 200
        Top = 65
        Width = 297
        Height = 216
        Anchors = [akLeft, akTop, akRight, akBottom]
        BevelInner = bvRaised
        BevelOuter = bvNone
        BevelWidth = 2
        BorderWidth = 1
        BorderStyle = bsSingle
        TabOrder = 2
        Visible = False
        object TntLabel12: TTntLabel
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
        object sbtn_add4: TTntSpeedButton
          Left = 88
          Top = 167
          Width = 65
          Height = 25
          Caption = 'add'
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
          OnClick = sbtn_addClick
        end
        object TntSpeedButton7: TTntSpeedButton
          Left = 160
          Top = 167
          Width = 65
          Height = 25
          Caption = 'finish'
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
          OnClick = sbtn_finishClick
        end
        object TntPanel5: TTntPanel
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
          object Image3: TImage
            Left = 265
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
        object TntGroupBox8: TTntGroupBox
          Left = 15
          Top = 32
          Width = 262
          Height = 129
          TabOrder = 0
          object TntLabel13: TTntLabel
            Left = 5
            Top = 23
            Width = 100
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'fld_car_no'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object TntLabel14: TTntLabel
            Left = 5
            Top = 73
            Width = 100
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'fld_you_date'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object TTntLabel
            Left = 6
            Top = 47
            Width = 100
            Height = 15
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'fld_you_cate'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'MS PGothic'
            Font.Style = []
            ParentFont = False
          end
          object TntLabel16: TTntLabel
            Left = 5
            Top = 99
            Width = 100
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'fld_you_qty'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object TntSpeedButton8: TTntSpeedButton
            Left = 208
            Top = 67
            Width = 23
            Height = 22
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            OnClick = TntSpeedButton8Click
          end
          object TntDBEdit8: TTntDBEdit
            Left = 110
            Top = 68
            Width = 75
            Height = 21
            Color = clWhite
            DataField = 'you_date'
            DataSource = ds_petrol
            TabOrder = 0
          end
          object TntDBEdit9: TTntDBEdit
            Left = 110
            Top = 95
            Width = 124
            Height = 21
            Color = clWhite
            DataField = 'you_qty'
            DataSource = ds_petrol
            MaxLength = 5
            TabOrder = 1
          end
          object DBCobCarNoYou: TTntDBComboBox
            Left = 110
            Top = 16
            Width = 125
            Height = 21
            DataField = 'car_no'
            DataSource = ds_petrol
            ItemHeight = 13
            TabOrder = 2
            OnChange = TntCobCarNoChange
          end
          object DBCobYouCate: TTntDBComboBox
            Left = 110
            Top = 42
            Width = 125
            Height = 21
            DataField = 'you_cate'
            DataSource = ds_petrol
            ItemHeight = 13
            TabOrder = 3
          end
        end
        object Nvg4: TDBNavigator
          Left = 38
          Top = 168
          Width = 112
          Height = 25
          DataSource = ds_petrol
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          Flat = True
          TabOrder = 2
        end
      end
      object mcd5: TMonthCalendar
        Left = 512
        Top = 160
        Width = 267
        Height = 154
        Date = 38639.601325231480000000
        TabOrder = 3
        Visible = False
        OnDblClick = mcd5DblClick
      end
    end
    object TntTabSheet5: TTntTabSheet
      Caption = 'car_pass_fee'
      DesignSize = (
        784
        346)
      object TntGroupBox9: TTntGroupBox
        Left = 0
        Top = 0
        Width = 784
        Height = 72
        Align = alTop
        Caption = 'query_condition'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object CobCarNoPass: TTntComboBox
          Left = 131
          Top = 12
          Width = 120
          Height = 21
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 0
        end
        object bbtn_pass_search: TTntBitBtn
          Left = 576
          Top = 8
          Width = 81
          Height = 25
          Caption = 'find'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = bbtn_pass_searchClick
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
        object bbtn_pass_reset: TTntBitBtn
          Left = 576
          Top = 35
          Width = 81
          Height = 25
          Caption = 'reset'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = bbtn_pass_resetClick
          Kind = bkRetry
        end
        object cb_car_no_pass: TTntCheckBox
          Left = 39
          Top = 15
          Width = 85
          Height = 17
          Caption = 'fld_car_no'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = cb_buy_dateClick
        end
        object cb_buy_date: TTntCheckBox
          Left = 273
          Top = 15
          Width = 96
          Height = 17
          Caption = 'fld_buy_date'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnClick = cb_buy_dateClick
        end
        object dtp_buy_begin: TDateTimePicker
          Left = 374
          Top = 11
          Width = 86
          Height = 21
          Date = 38639.451901574070000000
          Time = 38639.451901574070000000
          TabOrder = 5
        end
        object dtp_buy_end: TDateTimePicker
          Left = 464
          Top = 11
          Width = 85
          Height = 21
          Date = 38639.452027083330000000
          Time = 38639.452027083330000000
          TabOrder = 6
        end
        object cb_end_date: TTntCheckBox
          Left = 273
          Top = 42
          Width = 96
          Height = 17
          Caption = 'fld_end_date'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          OnClick = cb_buy_dateClick
        end
        object dtp_end_begin: TDateTimePicker
          Left = 374
          Top = 39
          Width = 86
          Height = 21
          Date = 38639.451901574070000000
          Time = 38639.451901574070000000
          TabOrder = 8
        end
        object dtp_end_end: TDateTimePicker
          Left = 464
          Top = 39
          Width = 85
          Height = 21
          Date = 38639.452027083330000000
          Time = 38639.452027083330000000
          TabOrder = 9
        end
      end
      object TntDBGrid4: TTntDBGrid
        Left = 0
        Top = 72
        Width = 784
        Height = 274
        Align = alClient
        DataSource = ds_pass
        FixedColor = clSkyBlue
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnTitleClick = TntDBGrid1TitleClick
        Columns = <
          item
            Expanded = False
            FieldName = 'car_no'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'buy_date'
            Width = 62
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'end_date'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'road_fee'
            Width = 57
            Visible = True
          end>
      end
      object PanelFlow5: TTntPanel
        Left = 132
        Top = 64
        Width = 296
        Height = 216
        Anchors = [akLeft, akTop, akRight, akBottom]
        BevelInner = bvRaised
        BevelOuter = bvNone
        BevelWidth = 2
        BorderWidth = 1
        BorderStyle = bsSingle
        TabOrder = 2
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
        object sbtn_add5: TTntSpeedButton
          Left = 88
          Top = 167
          Width = 65
          Height = 25
          Caption = 'add'
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
          OnClick = sbtn_addClick
        end
        object TntSpeedButton9: TTntSpeedButton
          Left = 160
          Top = 167
          Width = 65
          Height = 25
          Caption = 'finish'
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
          OnClick = sbtn_finishClick
        end
        object TntPanel6: TTntPanel
          Left = 3
          Top = 3
          Width = 286
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
          object Image4: TImage
            Left = 265
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
        object TntGroupBox10: TTntGroupBox
          Left = 15
          Top = 32
          Width = 262
          Height = 129
          TabOrder = 0
          object TntLabel17: TTntLabel
            Left = 5
            Top = 23
            Width = 100
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'fld_car_no'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object TntLabel18: TTntLabel
            Left = 5
            Top = 73
            Width = 100
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'fld_end_date'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object TntLabel19: TTntLabel
            Left = 6
            Top = 47
            Width = 100
            Height = 15
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'fld_buy_date'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'MS PGothic'
            Font.Style = []
            ParentFont = False
          end
          object TntLabel20: TTntLabel
            Left = 5
            Top = 99
            Width = 100
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'fld_road_fee'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object TntSpeedButton10: TTntSpeedButton
            Left = 211
            Top = 41
            Width = 23
            Height = 22
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            OnClick = TntSpeedButton10Click
          end
          object TntSpeedButton11: TTntSpeedButton
            Left = 211
            Top = 68
            Width = 23
            Height = 22
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            OnClick = TntSpeedButton11Click
          end
          object TntDBEdit7: TTntDBEdit
            Left = 110
            Top = 41
            Width = 91
            Height = 21
            Color = clWhite
            DataField = 'buy_date'
            DataSource = ds_pass
            MaxLength = 10
            TabOrder = 0
          end
          object TntDBEdit10: TTntDBEdit
            Left = 110
            Top = 68
            Width = 91
            Height = 21
            Color = clWhite
            DataField = 'end_date'
            DataSource = ds_pass
            TabOrder = 1
          end
          object TntDBEdit11: TTntDBEdit
            Left = 110
            Top = 95
            Width = 124
            Height = 21
            Color = clWhite
            DataField = 'road_fee'
            DataSource = ds_pass
            TabOrder = 2
          end
          object DBCobCarNoPass: TTntDBComboBox
            Left = 110
            Top = 16
            Width = 125
            Height = 21
            DataField = 'car_no'
            DataSource = ds_pass
            ItemHeight = 13
            TabOrder = 3
            OnChange = TntCobCarNoChange
          end
        end
        object Nvg5: TDBNavigator
          Left = 38
          Top = 168
          Width = 112
          Height = 25
          DataSource = ds_pass
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          Flat = True
          TabOrder = 2
        end
      end
      object mcd6: TMonthCalendar
        Left = 496
        Top = 136
        Width = 267
        Height = 154
        Date = 38639.601326307870000000
        TabOrder = 3
        Visible = False
        OnDblClick = mcd6DblClick
      end
      object mcd7: TMonthCalendar
        Left = 496
        Top = 168
        Width = 267
        Height = 154
        Date = 38639.601326307870000000
        TabOrder = 4
        Visible = False
        OnDblClick = mcd7DblClick
      end
    end
  end
  object TntPanel1: TTntPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 57
    Align = alTop
    Caption = 'bus01_titl'
    Color = clCream
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object PanelAct: TTntPanel
    Left = 0
    Top = 431
    Width = 792
    Height = 43
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object sb_Add: TTntSpeedButton
      Left = 200
      Top = 8
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
      OnClick = sb_AddClick
    end
    object sb_Recover: TTntSpeedButton
      Left = 440
      Top = 8
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
    object sb_Save: TTntSpeedButton
      Left = 520
      Top = 8
      Width = 80
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
    object sb_edit: TTntSpeedButton
      Left = 360
      Top = 8
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
    object sb_Del: TTntSpeedButton
      Left = 280
      Top = 8
      Width = 80
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
  end
  object qry_carbase: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterOpen = qry_carbaseAfterOpen
    AfterClose = qry_carbaseAfterClose
    BeforePost = qry_carbaseBeforePost
    OnWillChangeRecord = qry_carbaseWillChangeRecord
    Parameters = <>
    SQL.Strings = (
      'select * from hrd_car_no order by car_no')
    Left = 1
    Top = 1
    object qry_carbaseupd_user: TStringField
      FieldName = 'upd_user'
      Size = 7
    end
    object qry_carbaseupd_date: TDateTimeField
      FieldName = 'upd_date'
    end
    object qry_carbasecar_no: TStringField
      FieldName = 'car_no'
      Size = 10
    end
    object qry_carbasedriver: TStringField
      FieldName = 'driver'
      Size = 6
    end
    object qry_carbasecar_date: TDateTimeField
      FieldName = 'car_date'
    end
    object qry_carbasecar_model: TStringField
      FieldName = 'car_model'
      Size = 35
    end
    object qry_carbasebuy_local: TStringField
      FieldName = 'buy_local'
      Size = 30
    end
    object qry_carbasedrivername: TStringField
      FieldKind = fkLookup
      FieldName = 'drivername'
      LookupDataSet = qry_driver
      LookupKeyFields = 'driver'
      LookupResultField = 'chs'
      KeyFields = 'driver'
      Lookup = True
    end
  end
  object qry_driver: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select driver,driver+'#39' '#39'+name_chs as chs,driver+'#39' '#39'+name_eng as ' +
        'eng,driver+'#39' '#39'+name_vim as vim  from hrd_car_driver order by dri' +
        'ver')
    Left = 4
    Top = 29
  end
  object ds_carbase: TDataSource
    DataSet = qry_carbase
    Left = 33
  end
  object ds_fix: TDataSource
    DataSet = qry_fix
    Left = 101
    Top = 65535
  end
  object qry_fix: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterOpen = qry_carbaseAfterOpen
    AfterClose = qry_carbaseAfterClose
    BeforePost = qry_carbaseBeforePost
    OnWillChangeRecord = qry_carbaseWillChangeRecord
    Parameters = <>
    SQL.Strings = (
      'select * from hrd_car_repair order by repair_date')
    Left = 69
    Top = 65535
    object qry_fixupd_user: TStringField
      FieldName = 'upd_user'
      Size = 10
    end
    object qry_fixupd_date: TDateTimeField
      FieldName = 'upd_date'
    end
    object qry_fixserial: TAutoIncField
      FieldName = 'serial'
      ReadOnly = True
    end
    object qry_fixcar_no: TStringField
      FieldName = 'car_no'
      Size = 10
    end
    object qry_fixrepair_date: TDateTimeField
      FieldName = 'repair_date'
    end
    object qry_fixrepair_cate: TStringField
      FieldName = 'repair_cate'
      Size = 2
    end
    object qry_fixrepair_rate: TBCDField
      FieldName = 'repair_rate'
      Precision = 19
    end
    object qry_fixrep_cate: TTntWideStringField
      FieldKind = fkLookup
      FieldName = 'rep_cate'
      LookupDataSet = qry_repair_cate
      LookupKeyFields = 'rep_code'
      LookupResultField = 'name'
      KeyFields = 'repair_cate'
      Lookup = True
    end
  end
  object qry_picc: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterOpen = qry_carbaseAfterOpen
    AfterClose = qry_carbaseAfterClose
    BeforePost = qry_carbaseBeforePost
    OnWillChangeRecord = qry_carbaseWillChangeRecord
    Parameters = <>
    SQL.Strings = (
      'select * from hrd_car_picc  ')
    Left = 141
    Top = 65535
  end
  object qry_petrol: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterOpen = qry_carbaseAfterOpen
    AfterClose = qry_carbaseAfterClose
    BeforePost = qry_carbaseBeforePost
    OnWillChangeRecord = qry_carbaseWillChangeRecord
    Parameters = <>
    SQL.Strings = (
      'select * from hrd_car_you ')
    Left = 221
    Top = 65535
    object qry_petrolupd_user: TStringField
      FieldName = 'upd_user'
      Size = 10
    end
    object qry_petrolupd_date: TDateTimeField
      FieldName = 'upd_date'
    end
    object qry_petrolcar_no: TStringField
      FieldName = 'car_no'
      Size = 10
    end
    object qry_petrolyou_cate: TStringField
      FieldName = 'you_cate'
      Size = 1
    end
    object qry_petrolyou_date: TDateTimeField
      FieldName = 'you_date'
    end
    object qry_petrolyou_qty: TIntegerField
      FieldName = 'you_qty'
    end
    object qry_petrolyou_type: TTntWideStringField
      FieldKind = fkLookup
      FieldName = 'you_type'
      LookupDataSet = qry_you_cate
      LookupKeyFields = 'you_cate'
      LookupResultField = 'name'
      KeyFields = 'you_cate'
      Lookup = True
    end
  end
  object qry_pass: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterOpen = qry_carbaseAfterOpen
    AfterClose = qry_carbaseAfterClose
    BeforePost = qry_carbaseBeforePost
    OnWillChangeRecord = qry_carbaseWillChangeRecord
    Parameters = <>
    SQL.Strings = (
      'select * from hrd_car_buy')
    Left = 301
    Top = 65535
  end
  object ds_picc: TDataSource
    DataSet = qry_picc
    Left = 173
    Top = 65535
  end
  object ds_petrol: TDataSource
    DataSet = qry_petrol
    Left = 245
    Top = 65535
  end
  object ds_pass: TDataSource
    DataSet = qry_pass
    Left = 333
    Top = 65535
  end
  object qry_you_cate: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select you_cate,you_cate+'#39' '#39'+you_name as name  from hrd_car_you_' +
        'cate order by you_cate')
    Left = 220
    Top = 29
  end
  object qry_repair_cate: TADOQuery
    Active = True
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select rep_code,rep_code+'#39' '#39'+rep_name as name  from hrd_car_repa' +
        'ir_cate order by rep_code')
    Left = 68
    Top = 29
  end
end
