object FormHrd20: TFormHrd20
  Left = 200
  Top = 131
  Width = 858
  Height = 547
  Caption = 'FormHrd20'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 850
    Height = 513
    Align = alClient
    TabOrder = 0
    object StatusBar1: TTntStatusBar
      Left = 1
      Top = 493
      Width = 848
      Height = 19
      Panels = <
        item
          Width = 50
        end>
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 848
      Height = 492
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object PanelTitle: TTntPanel
        Left = 0
        Top = 0
        Width = 848
        Height = 36
        Align = alTop
        BevelOuter = bvNone
        Caption = 'hrd20_titl'
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
        Width = 848
        Height = 456
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object PanelQuery: TPanel
          Left = 0
          Top = 0
          Width = 848
          Height = 65
          Align = alTop
          TabOrder = 0
          object TntGroupBox1: TTntGroupBox
            Left = 1
            Top = 1
            Width = 846
            Height = 63
            Align = alClient
            Caption = 'query_condition'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object TntLabel6: TTntLabel
              Left = 5
              Top = 18
              Width = 80
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'fld_emp_id'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -13
              Font.Name = 'MS PGothic'
              Font.Style = []
              ParentFont = False
            end
            object TntLabel10: TTntLabel
              Left = 220
              Top = 18
              Width = 79
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'fld_department'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Palatino Linotype'
              Font.Style = []
              ParentFont = False
            end
            object TntLabel3: TTntLabel
              Left = 552
              Top = 17
              Width = 49
              Height = 14
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'r_class'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object edit_begin: TTntEdit
              Left = 89
              Top = 14
              Width = 60
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
              MaxLength = 6
              ParentFont = False
              TabOrder = 0
              OnChange = edit_beginChange
            end
            object edit_end: TTntEdit
              Left = 154
              Top = 14
              Width = 60
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
              MaxLength = 6
              ParentFont = False
              TabOrder = 1
            end
            object Btn_Search: TTntBitBtn
              Left = 680
              Top = 11
              Width = 81
              Height = 25
              Caption = '(&q)uery'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
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
            object CobDeptBegin: TTntComboBox
              Left = 302
              Top = 14
              Width = 120
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
            end
            object CobDeptEnd: TTntComboBox
              Left = 424
              Top = 14
              Width = 120
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
            end
            object cate: TTntComboBox
              Left = 600
              Top = 14
              Width = 65
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ImeName = #20013#25991' - QQ'#25340#38899'?'#20837#27861
              ItemHeight = 13
              ItemIndex = 0
              ParentFont = False
              TabOrder = 5
              Text = '0 - '#20840#37096
              Items.Strings = (
                '0 - '#20840#37096
                '1 - '#23381#23142
                '2 - '#34565#20083#26399)
            end
            object chk_date_s: TTntCheckBox
              Left = 11
              Top = 40
              Width = 75
              Height = 17
              Caption = 'DateBegin'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Palatino Linotype'
              Font.Style = []
              ParentFont = False
              TabOrder = 6
            end
            object dtpBegin: TTntDateTimePicker
              Left = 88
              Top = 36
              Width = 84
              Height = 21
              Date = 38674.413328622690000000
              Time = 38674.413328622690000000
              ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
              TabOrder = 7
            end
            object dtpEnd: TTntDateTimePicker
              Left = 176
              Top = 36
              Width = 83
              Height = 21
              Date = 38674.413328622690000000
              Time = 38674.413328622690000000
              ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
              TabOrder = 8
            end
          end
        end
        object PanelGrid: TPanel
          Left = 0
          Top = 65
          Width = 848
          Height = 341
          Align = alClient
          TabOrder = 1
          object DBGrid1: TTntDBGrid
            Left = 1
            Top = 1
            Width = 846
            Height = 339
            Align = alClient
            DataSource = DataSource1
            FixedColor = clSkyBlue
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Palatino Linotype'
            Font.Style = []
            ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete]
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnTitleClick = DBGrid1TitleClick
            Columns = <
              item
                Expanded = False
                FieldName = 'emp_id'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'emp_chs'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'name_vim'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'department'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'emp_cate'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'date_e'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'date_s'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'date_1'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'date_2'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'date_3'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'date_4'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'date_5'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'date_6'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'date_7'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'remarks'
                Title.Caption = 'fld_remark'
                Width = 350
                Visible = True
              end>
          end
        end
        object PanelAct: TTntPanel
          Left = 0
          Top = 406
          Width = 848
          Height = 50
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 2
          object sb_Add: TTntSpeedButton
            Left = 303
            Top = 12
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
          object sb_Recover: TTntSpeedButton
            Left = 546
            Top = 12
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
            Left = 627
            Top = 12
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
            Left = 465
            Top = 12
            Width = 80
            Height = 25
            Caption = '(&m)odify'
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
            Left = 384
            Top = 12
            Width = 80
            Height = 25
            Caption = '(&d)elete'
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
          object sb_Print: TTntSpeedButton
            Left = 222
            Top = 12
            Width = 80
            Height = 25
            Caption = '(&p)rint'
            Enabled = False
            Flat = True
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
            OnClick = sb_PrintClick
          end
          object btnExcel: TTntSpeedButton
            Left = 141
            Top = 13
            Width = 80
            Height = 22
            Caption = 'Excel'
            Enabled = False
            OnClick = btnExcelClick
          end
        end
      end
    end
  end
  object PanelFlow: TTntPanel
    Left = 166
    Top = 54
    Width = 525
    Height = 339
    Caption = 'PanelFlow'
    TabOrder = 1
    Visible = False
    object TntPanel2: TTntPanel
      Left = 1
      Top = 1
      Width = 523
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
      TabOrder = 0
      object Image1: TImage
        Left = 501
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
      Left = 1
      Top = 25
      Width = 523
      Height = 273
      Align = alClient
      TabOrder = 1
      object TntLabel4: TTntLabel
        Left = 52
        Top = 18
        Width = 100
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
      object TntLabel7: TTntLabel
        Left = 5
        Top = 101
        Width = 190
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
      object TntLabel9: TTntLabel
        Left = 264
        Top = 16
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
      object TntLabel11: TTntLabel
        Left = 52
        Top = 43
        Width = 100
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'fld_emp_chs'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object TntLabel12: TTntLabel
        Left = 277
        Top = 43
        Width = 100
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'fld_name_vim'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object TntLabel13: TTntLabel
        Left = 277
        Top = 18
        Width = 100
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'fld_department'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object TntLabel1: TTntLabel
        Left = 52
        Top = 70
        Width = 100
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'r_class'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object TntLabel2: TTntLabel
        Left = 302
        Top = 101
        Width = 110
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
      object hrd20_date_1: TTntLabel
        Left = 5
        Top = 126
        Width = 190
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'hrd20_date_1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object hrd20_date_2: TTntLabel
        Left = 302
        Top = 126
        Width = 110
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'hrd20_date_2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object hrd20_date_3: TTntLabel
        Left = 5
        Top = 152
        Width = 190
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'hrd20_date_3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object hrd20_date_4: TTntLabel
        Left = 302
        Top = 152
        Width = 110
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'hrd20_date_4'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object hrd20_date_5: TTntLabel
        Left = 5
        Top = 177
        Width = 190
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'hrd20_date_5'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object hrd20_date_6: TTntLabel
        Left = 302
        Top = 177
        Width = 110
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'hrd20_date_6'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object hrd20_date_7: TTntLabel
        Left = 5
        Top = 203
        Width = 190
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'hrd20_date_7'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object TntLabel5: TTntLabel
        Left = 5
        Top = 231
        Width = 100
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'fld_remark'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object EditFlow0: TTntDBEdit
        Left = 157
        Top = 14
        Width = 100
        Height = 21
        DataField = 'emp_id'
        DataSource = DataSource1
        ImeName = #20013#25991' - QQ'#25340#38899'?'#20837#27861
        TabOrder = 0
      end
      object TntDBEdit1: TTntDBEdit
        Left = 157
        Top = 39
        Width = 100
        Height = 21
        Color = clSkyBlue
        DataField = 'emp_chs'
        DataSource = DataSource1
        ImeName = #20013#25991' - QQ'#25340#38899'?'#20837#27861
        ReadOnly = True
        TabOrder = 2
      end
      object TntDBEdit2: TTntDBEdit
        Left = 382
        Top = 39
        Width = 130
        Height = 21
        Color = clSkyBlue
        DataField = 'name_vim'
        DataSource = DataSource1
        ImeName = #20013#25991' - QQ'#25340#38899'?'#20837#27861
        ReadOnly = True
        TabOrder = 3
      end
      object TntDBEdit4: TTntDBEdit
        Left = 382
        Top = 14
        Width = 130
        Height = 21
        Color = clSkyBlue
        DataField = 'department'
        DataSource = DataSource1
        ImeName = #20013#25991' - QQ'#25340#38899'?'#20837#27861
        ReadOnly = True
        TabOrder = 1
      end
      object Date_0: TTntDBEdit
        Left = 198
        Top = 97
        Width = 80
        Height = 21
        DataField = 'date_e'
        DataSource = DataSource1
        ImeName = #20013#25991' - QQ'#25340#38899'?'#20837#27861
        TabOrder = 5
      end
      object TntButton1: TTntButton
        Left = 276
        Top = 95
        Width = 20
        Height = 25
        Caption = '...'
        TabOrder = 14
        OnClick = TntButton1Click
      end
      object emp_cate: TTntDBRadioGroup
        Left = 159
        Top = 61
        Width = 353
        Height = 31
        Columns = 2
        DataField = 'emp_cate'
        DataSource = DataSource1
        Items.Strings = (
          '1 - '#23381#23142
          '2 - '#22103#20083#26399)
        TabOrder = 4
        Values.Strings = (
          '1'
          '2')
      end
      object Date_1: TTntDBEdit
        Left = 412
        Top = 97
        Width = 80
        Height = 21
        DataField = 'date_s'
        DataSource = DataSource1
        ImeName = #20013#25991' - QQ'#25340#38899'?'#20837#27861
        TabOrder = 6
      end
      object TntButton2: TTntButton
        Tag = 1
        Left = 492
        Top = 95
        Width = 20
        Height = 25
        Caption = '...'
        TabOrder = 15
        OnClick = TntButton1Click
      end
      object Date_2: TTntDBEdit
        Left = 198
        Top = 122
        Width = 80
        Height = 21
        DataField = 'date_1'
        DataSource = DataSource1
        ImeName = #20013#25991' - QQ'#25340#38899'?'#20837#27861
        TabOrder = 7
      end
      object Date_3: TTntDBEdit
        Left = 412
        Top = 122
        Width = 80
        Height = 21
        DataField = 'date_2'
        DataSource = DataSource1
        ImeName = #20013#25991' - QQ'#25340#38899'?'#20837#27861
        TabOrder = 8
      end
      object Date_4: TTntDBEdit
        Left = 198
        Top = 148
        Width = 80
        Height = 21
        DataField = 'date_3'
        DataSource = DataSource1
        ImeName = #20013#25991' - QQ'#25340#38899'?'#20837#27861
        TabOrder = 9
      end
      object Date_5: TTntDBEdit
        Left = 412
        Top = 148
        Width = 80
        Height = 21
        DataField = 'date_4'
        DataSource = DataSource1
        ImeName = #20013#25991' - QQ'#25340#38899'?'#20837#27861
        TabOrder = 10
      end
      object Date_6: TTntDBEdit
        Left = 198
        Top = 173
        Width = 80
        Height = 21
        DataField = 'date_5'
        DataSource = DataSource1
        ImeName = #20013#25991' - QQ'#25340#38899'?'#20837#27861
        TabOrder = 11
      end
      object Date_7: TTntDBEdit
        Left = 412
        Top = 173
        Width = 80
        Height = 21
        DataField = 'date_6'
        DataSource = DataSource1
        ImeName = #20013#25991' - QQ'#25340#38899'?'#20837#27861
        TabOrder = 12
      end
      object Date_8: TTntDBEdit
        Left = 198
        Top = 199
        Width = 80
        Height = 21
        DataField = 'date_7'
        DataSource = DataSource1
        ImeName = #20013#25991' - QQ'#25340#38899'?'#20837#27861
        ReadOnly = True
        TabOrder = 13
      end
      object TntButton3: TTntButton
        Tag = 2
        Left = 276
        Top = 120
        Width = 20
        Height = 25
        Caption = '...'
        TabOrder = 16
        OnClick = TntButton1Click
      end
      object TntButton4: TTntButton
        Tag = 3
        Left = 492
        Top = 120
        Width = 20
        Height = 25
        Caption = '...'
        TabOrder = 17
        OnClick = TntButton1Click
      end
      object TntButton5: TTntButton
        Tag = 4
        Left = 276
        Top = 146
        Width = 20
        Height = 25
        Caption = '...'
        TabOrder = 18
        OnClick = TntButton1Click
      end
      object TntButton6: TTntButton
        Tag = 5
        Left = 492
        Top = 146
        Width = 20
        Height = 25
        Caption = '...'
        TabOrder = 19
        OnClick = TntButton1Click
      end
      object BtnDate_6: TTntButton
        Tag = 6
        Left = 276
        Top = 171
        Width = 20
        Height = 25
        Caption = '...'
        TabOrder = 20
        OnClick = TntButton1Click
      end
      object BtnDate_7: TTntButton
        Tag = 7
        Left = 492
        Top = 171
        Width = 20
        Height = 25
        Caption = '...'
        TabOrder = 21
        OnClick = TntButton1Click
      end
      object month1: TTntMonthCalendar
        Left = 584
        Top = 56
        Width = 267
        Height = 154
        Date = 41502.000000000000000000
        ImeName = #20013#25991' - QQ'#25340#38899'?'#20837#27861
        TabOrder = 22
        OnDblClick = Month1DblClick
      end
      object TntDBEdit3: TTntDBEdit
        Left = 110
        Top = 227
        Width = 400
        Height = 21
        DataField = 'remarks'
        DataSource = DataSource1
        ImeName = #20013#25991' - QQ'#25340#38899'?'#20837#27861
        TabOrder = 23
      end
    end
    object Panel7: TPanel
      Left = 1
      Top = 298
      Width = 523
      Height = 40
      Align = alBottom
      BevelInner = bvLowered
      TabOrder = 2
      object s_add: TTntBitBtn
        Left = 192
        Top = 8
        Width = 65
        Height = 25
        Caption = '(&a)dd'
        TabOrder = 0
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
      object TntBitBtn2: TTntBitBtn
        Left = 266
        Top = 8
        Width = 65
        Height = 25
        Caption = 'finish'
        TabOrder = 1
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
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 232
  end
  object ADOQuery1: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    OnCalcFields = ADOQuery1CalcFields
    CommandTimeout = 0
    Parameters = <>
    SQL.Strings = (
      'select top 1 * from hrd_emp_chan A')
    Left = 200
    Top = 2
    object ADOQuery1upd_user: TStringField
      FieldName = 'up_user'
      Size = 16
    end
    object ADOQuery1upd_date: TDateTimeField
      FieldName = 'up_date'
    end
    object ADOQuery1emp_id: TStringField
      FieldName = 'emp_id'
      Size = 6
    end
    object ADOQuery1emp_chs: TWideStringField
      FieldKind = fkCalculated
      FieldName = 'emp_chs'
      Calculated = True
    end
    object ADOQuery1name_vim: TWideStringField
      FieldKind = fkCalculated
      FieldName = 'name_vim'
      Calculated = True
    end
    object ADOQuery1department: TWideStringField
      FieldKind = fkCalculated
      FieldName = 'department'
      Calculated = True
    end
    object ADOQuery1emp_cate: TTntStringField
      DisplayLabel = 'r_class'
      FieldName = 'emp_cate'
      Size = 1
    end
    object ADOQuery1date_s: TDateTimeField
      DisplayLabel = 'date_end'
      FieldName = 'date_s'
    end
    object ADOQuery1date_e: TDateTimeField
      DisplayLabel = 'date_begin'
      FieldName = 'date_e'
    end
    object ADOQuery1date_1: TDateTimeField
      DisplayLabel = 'hrd20_date_1'
      FieldName = 'date_1'
    end
    object ADOQuery1date_2: TDateTimeField
      DisplayLabel = 'hrd20_date_2'
      FieldName = 'date_2'
    end
    object ADOQuery1date_3: TDateTimeField
      DisplayLabel = 'hrd20_date_3'
      FieldName = 'date_3'
    end
    object ADOQuery1date_4: TDateTimeField
      DisplayLabel = 'hrd20_date_4'
      FieldName = 'date_4'
    end
    object ADOQuery1date_5: TDateTimeField
      DisplayLabel = 'hrd20_date_5'
      FieldName = 'date_5'
    end
    object ADOQuery1date_6: TDateTimeField
      DisplayLabel = 'hrd20_date_6'
      FieldName = 'date_6'
    end
    object ADOQuery1date_7: TDateTimeField
      DisplayLabel = 'hrd20_date_7'
      FieldKind = fkCalculated
      FieldName = 'date_7'
      Calculated = True
    end
    object ADOQuery1remarks: TWideStringField
      FieldName = 'remarks'
      Size = 500
    end
    object ADOQuery1num_1: TStringField
      DisplayLabel = 'hrd20_num_1'
      FieldName = 'num_1'
      Size = 50
    end
    object ADOQuery1num_2: TStringField
      DisplayLabel = 'hrd20_num_2'
      FieldName = 'num_2'
      Size = 50
    end
    object ADOQuery1num_3: TStringField
      DisplayLabel = 'hrd20_num_3'
      FieldName = 'num_3'
      Size = 50
    end
  end
  object ADOQuery2: TADOQuery
    Connection = DMHrdsys.conn
    Parameters = <>
    Left = 554
    Top = 6
  end
end
