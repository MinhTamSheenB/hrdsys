object Formhrd28: TFormhrd28
  Left = 122
  Top = 108
  Width = 799
  Height = 598
  Caption = 'Formhrd28'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    791
    564)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TTntPanel
    Left = 0
    Top = 0
    Width = 791
    Height = 564
    Align = alClient
    TabOrder = 0
    object Panel2: TTntPanel
      Left = 1
      Top = 1
      Width = 789
      Height = 48
      Align = alTop
      Caption = 'hrd28_titl'
      Color = clCream
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object PanelMain: TTntPanel
      Left = 1
      Top = 49
      Width = 789
      Height = 514
      Align = alClient
      TabOrder = 1
      object TntGroupBox2: TTntGroupBox
        Left = 1
        Top = 1
        Width = 787
        Height = 72
        Align = alTop
        Caption = 'search_condition'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object rp_type: TTntCheckBox
          Left = 8
          Top = 21
          Width = 97
          Height = 17
          Caption = 'rp_type'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = rp_typeClick
        end
        object date_range: TTntCheckBox
          Left = 270
          Top = 17
          Width = 97
          Height = 17
          Caption = 'rp_date'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = rp_typeClick
        end
        object dept_code: TTntCheckBox
          Left = 220
          Top = 45
          Width = 97
          Height = 17
          Caption = 'fld_dept_code'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = rp_typeClick
        end
        object code_range: TTntCheckBox
          Left = 8
          Top = 48
          Width = 97
          Height = 17
          Caption = 'fld_emp_id'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = rp_typeClick
        end
        object edt_code_s: TTntEdit
          Left = 109
          Top = 43
          Width = 49
          Height = 21
          AutoSize = False
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
          Text = '000000'
        end
        object edt_code_e: TTntEdit
          Left = 162
          Top = 43
          Width = 49
          Height = 21
          AutoSize = False
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
          MaxLength = 6
          ParentFont = False
          TabOrder = 5
          Text = '999999'
        end
        object cb_rp_s_code: TTntComboBox
          Left = 109
          Top = 17
          Width = 73
          Height = 21
          Style = csDropDownList
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
          ItemHeight = 13
          ParentFont = False
          Sorted = True
          TabOrder = 6
        end
        object cb_rp_e_code: TTntComboBox
          Left = 184
          Top = 17
          Width = 73
          Height = 21
          Style = csDropDownList
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
          ItemHeight = 13
          ParentFont = False
          Sorted = True
          TabOrder = 7
        end
        object cb_dept_s: TTntComboBox
          Left = 317
          Top = 42
          Width = 172
          Height = 21
          Style = csDropDownList
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
          ItemHeight = 13
          ParentFont = False
          TabOrder = 8
        end
        object cb_dept_e: TTntComboBox
          Left = 493
          Top = 42
          Width = 172
          Height = 21
          Style = csDropDownList
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
          ItemHeight = 13
          ParentFont = False
          TabOrder = 9
        end
        object edt_date_s: TTntDateTimePicker
          Left = 330
          Top = 14
          Width = 89
          Height = 21
          Date = 38608.443096226850000000
          Time = 38608.443096226850000000
          Enabled = False
          ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
          TabOrder = 10
        end
        object edt_date_e: TTntDateTimePicker
          Left = 424
          Top = 14
          Width = 89
          Height = 21
          Date = 38608.443096226850000000
          Time = 38608.443096226850000000
          Enabled = False
          ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
          TabOrder = 11
        end
        object Btn_Search: TTntBitBtn
          Left = 673
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
          TabOrder = 12
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
          Left = 673
          Top = 37
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
          TabOrder = 13
          OnClick = Btn_ResetClick
          Kind = bkRetry
        end
        object chs: TTntRadioButton
          Left = 520
          Top = 16
          Width = 113
          Height = 17
          Caption = 'chs'
          TabOrder = 14
        end
        object viet: TTntRadioButton
          Left = 584
          Top = 16
          Width = 49
          Height = 17
          Caption = 'viet'
          Checked = True
          TabOrder = 15
          TabStop = True
        end
      end
      object PanelAct: TTntPanel
        Left = 1
        Top = 470
        Width = 787
        Height = 43
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object sb_Add: TTntSpeedButton
          Left = 152
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
          Left = 400
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
          Left = 480
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
          Left = 312
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
          Left = 232
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
        object sb_Preview: TTntSpeedButton
          Left = 576
          Top = 8
          Width = 80
          Height = 25
          Caption = 'Preview'
          Flat = True
          NumGlyphs = 2
          OnClick = sb_PreviewClick
        end
        object sb_Print: TTntSpeedButton
          Left = 656
          Top = 8
          Width = 80
          Height = 25
          Caption = 'Print '
          Flat = True
          NumGlyphs = 2
          OnClick = sb_PreviewClick
        end
      end
      object DBGridUPD: TTntDBGrid
        Left = 1
        Top = 73
        Width = 787
        Height = 397
        Align = alClient
        DataSource = DataSource2
        FixedColor = clSkyBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlue
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Expanded = False
            FieldName = 'emp_id'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'emp_chs'
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
            FieldName = 'J_date_s'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'J_date_e'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'chengdu_type'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cheng_c'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cheng_v'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'xingtai_type'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'xingtai_c'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'xingtai_v'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dept_titl'
            Visible = True
          end>
      end
    end
  end
  object PanelFlow: TTntPanel
    Left = 192
    Top = 24
    Width = 385
    Height = 481
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelInner = bvRaised
    BevelOuter = bvNone
    BevelWidth = 2
    BorderWidth = 1
    BorderStyle = bsSingle
    TabOrder = 1
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
      Left = 152
      Top = 350
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
    end
    object sbtn_finish: TTntSpeedButton
      Left = 224
      Top = 350
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
      Width = 375
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
      object ImageClose: TImage
        Left = 345
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
      end
    end
    object TntGroupBox5: TTntGroupBox
      Left = 7
      Top = 27
      Width = 346
      Height = 318
      TabOrder = 0
      object TntLabel1: TTntLabel
        Left = 11
        Top = 133
        Width = 86
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'rp_date'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object TntSpeedButton2: TTntSpeedButton
        Left = 187
        Top = 131
        Width = 19
        Height = 17
        Caption = '...'
        OnClick = TntSpeedButton2Click
      end
      object tntlabel4: TTntLabel
        Left = 11
        Top = 157
        Width = 86
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'rp_type'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object TntLabel7: TTntLabel
        Left = 12
        Top = 233
        Width = 86
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'rp_reason'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object TntLabel9: TTntLabel
        Left = 10
        Top = 289
        Width = 88
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'script_vim'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object TntLabel8: TTntLabel
        Left = 12
        Top = 262
        Width = 87
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'script_chs'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object TntLabel10: TTntLabel
        Left = 11
        Top = 23
        Width = 88
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'fld_emp_id'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object sbtn_emp: TTntSpeedButton
        Left = 165
        Top = 24
        Width = 19
        Height = 17
        Caption = '...'
      end
      object TntLabel11: TTntLabel
        Left = 12
        Top = 83
        Width = 85
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'fld_dept'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object TntLabel12: TTntLabel
        Left = 194
        Top = 26
        Width = 68
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'fld_emp_chs'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object TntSpeedButton1: TTntSpeedButton
        Left = 296
        Top = 131
        Width = 17
        Height = 17
        Caption = '...'
        OnClick = TntSpeedButton1Click
      end
      object TntLabel2: TTntLabel
        Left = 14
        Top = 107
        Width = 85
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'fld_dept'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object TntLabel13: TTntLabel
        Left = 31
        Top = 58
        Width = 68
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'fld_emp_chs'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object TntLabel5: TTntLabel
        Left = 12
        Top = 182
        Width = 87
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'script_chs'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object TntLabel6: TTntLabel
        Left = 10
        Top = 209
        Width = 88
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'script_vim'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object J_date_s: TTntDBEdit
        Left = 103
        Top = 128
        Width = 73
        Height = 21
        DataField = 'J_date_s'
        DataSource = DataSource2
        ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
        TabOrder = 0
      end
      object prs_type: TTntDBComboBox
        Left = 103
        Top = 225
        Width = 125
        Height = 21
        DataField = 'xingtai_type'
        DataSource = DataSource2
        ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
        ItemHeight = 13
        TabOrder = 1
        OnChange = prs_typeChange
      end
      object cheng_c: TTntDBEdit
        Left = 103
        Top = 180
        Width = 226
        Height = 21
        DataField = 'cheng_c'
        DataSource = DataSource2
        ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
        TabOrder = 2
      end
      object prs_code: TTntDBComboBox
        Left = 104
        Top = 150
        Width = 233
        Height = 21
        DataField = 'chengdu_type'
        DataSource = DataSource2
        ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
        ItemHeight = 13
        TabOrder = 3
        OnChange = prs_codeChange
      end
      object xingtai_v: TTntDBEdit
        Left = 105
        Top = 283
        Width = 234
        Height = 21
        DataField = 'xingtai_v'
        DataSource = DataSource2
        ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
        TabOrder = 4
      end
      object xingtai_c: TTntDBEdit
        Left = 105
        Top = 257
        Width = 234
        Height = 21
        DataField = 'xingtai_c'
        DataSource = DataSource2
        ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
        TabOrder = 5
      end
      object EDT_ID: TTntDBEdit
        Left = 103
        Top = 19
        Width = 53
        Height = 21
        DataField = 'emp_id'
        DataSource = DataSource2
        ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
        TabOrder = 6
      end
      object TntDBEdit1: TTntDBEdit
        Left = 266
        Top = 19
        Width = 53
        Height = 21
        Color = clSkyBlue
        DataField = 'emp_chs'
        DataSource = DataSource2
        ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
        ReadOnly = True
        TabOrder = 7
      end
      object TntDBEdit2: TTntDBEdit
        Left = 103
        Top = 78
        Width = 225
        Height = 21
        Color = clSkyBlue
        DataField = 'dept_titl'
        DataSource = DataSource2
        ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
        ReadOnly = True
        TabOrder = 8
      end
      object J_date_e: TTntDBEdit
        Left = 215
        Top = 128
        Width = 73
        Height = 21
        DataField = 'J_date_e'
        DataSource = DataSource2
        ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
        TabOrder = 9
      end
      object TntDBEdit4: TTntDBEdit
        Left = 103
        Top = 102
        Width = 225
        Height = 21
        Color = clSkyBlue
        DataField = 'vim_titl'
        DataSource = DataSource2
        ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
        ReadOnly = True
        TabOrder = 10
      end
      object TntDBEdit5: TTntDBEdit
        Left = 104
        Top = 51
        Width = 225
        Height = 21
        Color = clSkyBlue
        DataField = 'name_vim'
        DataSource = DataSource2
        ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
        ReadOnly = True
        TabOrder = 11
      end
      object cheng_v: TTntDBEdit
        Left = 103
        Top = 203
        Width = 226
        Height = 21
        DataField = 'cheng_v'
        DataSource = DataSource2
        ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
        TabOrder = 12
      end
    end
    object Nvg: TDBNavigator
      Left = 22
      Top = 350
      Width = 112
      Height = 25
      DataSource = DataSource2
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      TabOrder = 2
    end
  end
  object mcd: TTntMonthCalendar
    Left = 248
    Top = 219
    Width = 267
    Height = 154
    CalColors.TitleBackColor = clBlue
    Date = 40381.000000000000000000
    ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
    TabOrder = 2
    Visible = False
    OnDblClick = mcdDblClick
  end
  object ADOQuery1: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    OnCalcFields = ADOQuery1CalcFields
    CommandTimeout = 0
    Parameters = <>
    SQL.Strings = (
      'select * from hrd_prs_pun ')
    Left = 17
    Top = 9
    object ADOQuery1upd_user: TStringField
      FieldName = 'up_user'
      FixedChar = True
      Size = 6
    end
    object ADOQuery1upd_date: TDateTimeField
      FieldName = 'up_date'
    end
    object ADOQuery1emp_id: TStringField
      FieldName = 'emp_id'
      FixedChar = True
      Size = 6
    end
    object ADOQuery1p_p_date: TDateTimeField
      FieldName = 'J_date_s'
    end
    object ADOQuery1J_date_e: TDateTimeField
      FieldName = 'J_date_e'
    end
    object ADOQuery1p_p_type: TStringField
      DisplayWidth = 4
      FieldName = 'chengdu_type'
      LookupDataSet = qry_rp_type
      KeyFields = 'chengdu_type'
      FixedChar = True
      Size = 4
    end
    object ADOQuery1prs_code: TStringField
      DisplayWidth = 40
      FieldKind = fkCalculated
      FieldName = 'cheng_c'
      FixedChar = True
      Size = 40
      Calculated = True
    end
    object ADOQuery1chs_remark: TWideStringField
      DisplayWidth = 200
      FieldKind = fkCalculated
      FieldName = 'cheng_v'
      FixedChar = True
      Size = 200
      Calculated = True
    end
    object ADOQuery1xingtzi_type: TTntStringField
      FieldName = 'xingtai_type'
      Size = 4
    end
    object ADOQuery1vim_remark: TWideStringField
      FieldKind = fkCalculated
      FieldName = 'xingtai_c'
      FixedChar = True
      Size = 40
      Calculated = True
    end
    object ADOQuery1xing_v: TTntWideStringField
      FieldKind = fkCalculated
      FieldName = 'xingtai_v'
      Size = 200
      Calculated = True
    end
    object ADOQuery1dept_code: TTntStringField
      FieldKind = fkCalculated
      FieldName = 'dept_code'
      Size = 6
      Calculated = True
    end
    object ADOQuery1dept_titl: TTntWideStringField
      FieldKind = fkCalculated
      FieldName = 'dept_titl'
      Size = 50
      Calculated = True
    end
    object ADOQuery1vim_titl: TTntWideStringField
      FieldKind = fkCalculated
      FieldName = 'vim_titl'
      Size = 50
      Calculated = True
    end
    object ADOQuery1emp_chs: TTntWideStringField
      FieldKind = fkCalculated
      FieldName = 'emp_chs'
      Calculated = True
    end
    object ADOQuery1name_vim: TTntWideStringField
      FieldKind = fkCalculated
      FieldName = 'name_vim'
      Size = 100
      Calculated = True
    end
    object ADOQuery1pst_chs: TTntWideStringField
      FieldKind = fkCalculated
      FieldName = 'pst_chs'
      Size = 10
      Calculated = True
    end
    object ADOQuery1pst_vim: TTntWideStringField
      FieldKind = fkCalculated
      FieldName = 'pst_vim'
      Calculated = True
    end
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery1
    Left = 217
    Top = 9
  end
  object qry_rp_type: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    CommandTimeout = 0
    Parameters = <>
    SQL.Strings = (
      
        'select cheng_type  from hrd_emp_chengdu_cate  order by cheng_typ' +
        'e')
    Left = 81
    Top = 9
  end
  object qry_reason: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    CommandTimeout = 0
    Parameters = <>
    SQL.Strings = (
      
        'select cheng_type   from hrd_emp_chengdu_cate  order by cheng_ty' +
        'pe')
    Left = 121
    Top = 9
  end
  object qry_pub: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    CommandTimeout = 0
    Parameters = <>
    Left = 153
    Top = 9
  end
  object PrintDialog1: TPrintDialog
    Left = 640
    Top = 4
  end
end
