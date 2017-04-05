object FormMed03: TFormMed03
  Left = 209
  Top = 190
  Width = 794
  Height = 504
  Caption = 'FormMed03'
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
    786
    470)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 786
    Height = 470
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object PanelTitle: TTntPanel
      Left = 0
      Top = 0
      Width = 786
      Height = 36
      Align = alTop
      BevelOuter = bvNone
      Caption = 'med03_titl'
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
      Width = 786
      Height = 434
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object PanelQuery: TPanel
        Left = 0
        Top = 0
        Width = 786
        Height = 49
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object TntGroupBox1: TTntGroupBox
          Left = 0
          Top = 0
          Width = 786
          Height = 49
          Align = alClient
          Caption = 'query_condition'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object Label_month: TTntLabel
            Left = 2
            Top = 21
            Width = 78
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'date'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'MS PGothic'
            Font.Style = []
            ParentFont = False
          end
          object TntLabel1: TTntLabel
            Left = 274
            Top = 19
            Width = 78
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'dru_code'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'MS PGothic'
            Font.Style = []
            ParentFont = False
          end
          object TntLabel2: TTntLabel
            Left = 466
            Top = 19
            Width = 78
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'acpt_no'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'MS PGothic'
            Font.Style = []
            ParentFont = False
          end
          object DTPickBegin: TTntDateTimePicker
            Left = 83
            Top = 16
            Width = 90
            Height = 21
            Date = 38565.000000000000000000
            Time = 38565.000000000000000000
            ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
            TabOrder = 0
          end
          object DTPickEnd: TTntDateTimePicker
            Left = 179
            Top = 16
            Width = 90
            Height = 21
            Date = 38595.000000000000000000
            Time = 38595.000000000000000000
            ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
            TabOrder = 1
          end
          object edit_dru_begin: TTntEdit
            Left = 359
            Top = 14
            Width = 50
            Height = 21
            ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
            TabOrder = 2
          end
          object edit_dru_end: TTntEdit
            Left = 412
            Top = 14
            Width = 50
            Height = 21
            ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
            TabOrder = 3
          end
          object edit_acpt_begin: TTntEdit
            Left = 543
            Top = 14
            Width = 70
            Height = 21
            ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
            TabOrder = 4
          end
          object edit_acpt_end: TTntEdit
            Left = 615
            Top = 14
            Width = 70
            Height = 21
            ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
            TabOrder = 5
          end
          object BtnQuery: TTntButton
            Left = 701
            Top = 12
            Width = 75
            Height = 25
            Caption = 'query'
            Default = True
            TabOrder = 6
            OnClick = BtnQueryClick
          end
        end
      end
      object PanelGrid: TPanel
        Left = 0
        Top = 49
        Width = 786
        Height = 335
        Align = alClient
        TabOrder = 1
        object DBGrid1: TTntDBGrid
          Left = 1
          Top = 1
          Width = 784
          Height = 333
          Align = alClient
          DataSource = DataSource1
          FixedColor = clSkyBlue
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnTitleClick = DBGrid1TitleClick
          Columns = <
            item
              Expanded = False
              FieldName = 'into_date'
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'dru_code'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'into_qty'
              Width = 48
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'acpt_no'
              Width = 66
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'item_no'
              Width = 106
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'dru_name'
              Width = 134
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'unit_name'
              Width = 53
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'dru_price'
              Visible = True
            end>
        end
      end
      object PanelAct: TTntPanel
        Left = 0
        Top = 384
        Width = 786
        Height = 50
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        object sb_Add: TTntSpeedButton
          Left = 230
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
          Left = 470
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
          Left = 550
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
          Left = 390
          Top = 12
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
          Left = 310
          Top = 12
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
        object sb_Print: TTntSpeedButton
          Left = 150
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
      end
    end
  end
  object PanelFlow: TTntPanel
    Left = 472
    Top = 125
    Width = 300
    Height = 324
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelInner = bvRaised
    BevelOuter = bvNone
    BevelWidth = 2
    BorderWidth = 1
    BorderStyle = bsSingle
    TabOrder = 1
    Visible = False
    object PanelFlowTitle: TTntPanel
      Left = 3
      Top = 3
      Width = 290
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
    object GroupBoxFlow: TTntGroupBox
      Left = 15
      Top = 32
      Width = 262
      Height = 241
      TabOrder = 0
      object label_Flow0: TTntLabel
        Left = 5
        Top = 18
        Width = 100
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'into_date'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object TntLabel4: TTntLabel
        Left = 5
        Top = 42
        Width = 100
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'dru_code'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object TntLabel5: TTntLabel
        Left = 5
        Top = 122
        Width = 100
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'dru_name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object TntLabel6: TTntLabel
        Left = 5
        Top = 146
        Width = 100
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'item_no'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object TntLabel7: TTntLabel
        Left = 5
        Top = 170
        Width = 100
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'unit_name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object TntLabel8: TTntLabel
        Left = 5
        Top = 194
        Width = 100
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'dru_price'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object TntLabel9: TTntLabel
        Left = 5
        Top = 66
        Width = 100
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'into_qty'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object TntLabel10: TTntLabel
        Left = 5
        Top = 90
        Width = 100
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'acpt_no'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object sb_choose_date: TTntSpeedButton
        Left = 188
        Top = 15
        Width = 23
        Height = 22
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = sb_choose_dateClick
      end
      object edit_Flow0: TTntDBEdit
        Left = 110
        Top = 15
        Width = 75
        Height = 21
        DataField = 'into_date'
        DataSource = DataSource1
        ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
        TabOrder = 0
        OnKeyDown = edit_Flow0KeyDown
      end
      object edit_Flow1: TTntDBEdit
        Left = 110
        Top = 39
        Width = 75
        Height = 21
        DataField = 'dru_code'
        DataSource = DataSource1
        ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
        TabOrder = 1
        OnKeyDown = edit_Flow0KeyDown
      end
      object edit_Flow2: TTntDBEdit
        Left = 110
        Top = 119
        Width = 140
        Height = 21
        Color = clSkyBlue
        DataField = 'dru_name'
        DataSource = DataSource1
        ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
        ReadOnly = True
        TabOrder = 4
        OnKeyDown = edit_Flow0KeyDown
      end
      object edit_Flow3: TTntDBEdit
        Left = 110
        Top = 143
        Width = 100
        Height = 21
        Color = clSkyBlue
        DataField = 'item_no'
        DataSource = DataSource1
        ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
        ReadOnly = True
        TabOrder = 5
        OnKeyDown = edit_Flow0KeyDown
      end
      object edit_Flow4: TTntDBEdit
        Left = 110
        Top = 167
        Width = 50
        Height = 21
        Color = clSkyBlue
        DataField = 'unit_name'
        DataSource = DataSource1
        ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
        ReadOnly = True
        TabOrder = 6
        OnKeyDown = edit_Flow0KeyDown
      end
      object edit_Flow5: TTntDBEdit
        Left = 110
        Top = 191
        Width = 75
        Height = 21
        Color = clSkyBlue
        DataField = 'dru_price'
        DataSource = DataSource1
        ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
        ReadOnly = True
        TabOrder = 7
        OnKeyDown = edit_Flow0KeyDown
      end
      object edit_Flow6: TTntDBEdit
        Left = 110
        Top = 63
        Width = 60
        Height = 21
        DataField = 'into_qty'
        DataSource = DataSource1
        ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
        TabOrder = 2
        OnKeyDown = edit_Flow0KeyDown
      end
      object edit_Flow7: TTntDBEdit
        Left = 110
        Top = 87
        Width = 75
        Height = 21
        DataField = 'acpt_no'
        DataSource = DataSource1
        ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
        TabOrder = 3
        OnKeyDown = edit_Flow0KeyDown
      end
    end
    object PanelFlowBtn: TTntPanel
      Left = 3
      Top = 277
      Width = 290
      Height = 40
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object DBNavigator1: TDBNavigator
        Left = 39
        Top = 8
        Width = 112
        Height = 25
        DataSource = DataSource1
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Flat = True
        TabOrder = 0
        Visible = False
      end
      object bbtn_ok: TTntBitBtn
        Left = 162
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
      object bbtn_add: TTntBitBtn
        Left = 88
        Top = 8
        Width = 65
        Height = 25
        Caption = 'add'
        TabOrder = 2
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
    object Calendar1: TTntMonthCalendar
      Left = 11
      Top = 73
      Width = 267
      Height = 153
      Date = 38623.000000000000000000
      ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
      TabOrder = 3
      Visible = False
      OnDblClick = Calendar1DblClick
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 40
  end
  object ADOQuery1: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterOpen = ADOQuery1AfterOpen
    AfterClose = ADOQuery1AfterClose
    BeforePost = ADOQuery1BeforePost
    BeforeDelete = ADOQuery1BeforeDelete
    AfterScroll = ADOQuery1AfterScroll
    OnCalcFields = ADOQuery1CalcFields
    OnWillChangeRecord = ADOQuery1WillChangeRecord
    Parameters = <>
    SQL.Strings = (
      'select * from hrd_med_into where 1=2')
    Left = 8
    object ADOQuery1into_date: TDateTimeField
      DisplayWidth = 19
      FieldName = 'into_date'
    end
    object ADOQuery1dru_code: TStringField
      DisplayWidth = 9
      FieldName = 'dru_code'
      Size = 6
    end
    object ADOQuery1into_qty: TIntegerField
      DisplayWidth = 12
      FieldName = 'into_qty'
    end
    object ADOQuery1acpt_no: TStringField
      DisplayWidth = 12
      FieldName = 'acpt_no'
      Size = 10
    end
    object ADOQuery1upd_user: TStringField
      FieldName = 'upd_user'
      Size = 16
    end
    object ADOQuery1upd_date: TDateTimeField
      FieldName = 'upd_date'
    end
    object ADOQuery1dru_name: TTntWideStringField
      FieldKind = fkCalculated
      FieldName = 'dru_name'
      Calculated = True
    end
    object ADOQuery1unit_name: TTntWideStringField
      FieldKind = fkCalculated
      FieldName = 'unit_name'
      Calculated = True
    end
    object ADOQuery1item_no: TStringField
      FieldKind = fkCalculated
      FieldName = 'item_no'
      Calculated = True
    end
    object ADOQuery1dru_price: TBCDField
      DisplayWidth = 13
      FieldKind = fkCalculated
      FieldName = 'dru_price'
      Precision = 10
      Size = 0
      Calculated = True
    end
  end
  object ADOQueryMon: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'select * from hrd_med_mon ')
    Left = 152
  end
  object ADOQueryDru: TADOQuery
    Connection = DMHrdsys.conn
    LockType = ltBatchOptimistic
    Parameters = <>
    Left = 200
  end
end
