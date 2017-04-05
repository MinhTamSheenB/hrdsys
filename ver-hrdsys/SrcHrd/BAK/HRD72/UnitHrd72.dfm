object FormHrd72: TFormHrd72
  Left = 251
  Top = 79
  Width = 883
  Height = 602
  Caption = 'FormHrd72'
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
    Width = 875
    Height = 36
    Align = alTop
    Caption = 'hrd72_titl'
    Color = clCream
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object TntPanel2: TTntPanel
    Left = 0
    Top = 36
    Width = 875
    Height = 532
    Align = alClient
    TabOrder = 1
    object PanelAct: TTntPanel
      Left = 1
      Top = 486
      Width = 873
      Height = 45
      Align = alBottom
      BevelOuter = bvLowered
      TabOrder = 0
      object sb_save: TTntSpeedButton
        Left = 525
        Top = 10
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
        OnClick = sb_saveClick
      end
      object sb_undo: TTntSpeedButton
        Left = 440
        Top = 10
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
        OnClick = sb_undoClick
      end
      object sb_edit: TTntSpeedButton
        Left = 355
        Top = 10
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
      object sb_del: TTntSpeedButton
        Left = 270
        Top = 10
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
        OnClick = sb_delClick
      end
      object sb_Add: TTntSpeedButton
        Left = 185
        Top = 10
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
      object sb_print: TTntSpeedButton
        Left = 608
        Top = 10
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
        OnClick = sb_printClick
      end
    end
    object pnlSearch: TTntPanel
      Left = 1
      Top = 1
      Width = 873
      Height = 76
      Align = alTop
      TabOrder = 1
      DesignSize = (
        873
        76)
      object GbCond: TTntGroupBox
        Left = 1
        Top = 1
        Width = 776
        Height = 74
        Align = alLeft
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = 'search_condition'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object EditEmp_B: TTntEdit
          Left = 97
          Top = 14
          Width = 57
          Height = 21
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 6
          ParentFont = False
          TabOrder = 0
          Text = '000000'
          OnChange = EditEmp_BChange
        end
        object EditEmp_E: TTntEdit
          Left = 161
          Top = 14
          Width = 57
          Height = 21
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 6
          ParentFont = False
          TabOrder = 1
          Text = '999999'
        end
        object cbEmp: TTntCheckBox
          Left = 5
          Top = 16
          Width = 81
          Height = 17
          Caption = 'fld_emp_id'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = cbEmpClick
        end
        object cbDept: TTntCheckBox
          Left = 5
          Top = 48
          Width = 81
          Height = 17
          Caption = 'fld_dept'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = cbDeptClick
        end
        object CbbDept_B: TTntComboBox
          Left = 95
          Top = 46
          Width = 179
          Height = 21
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 4
          OnChange = CbbDept_EChange
        end
        object CbbDept_E: TTntComboBox
          Left = 275
          Top = 46
          Width = 179
          Height = 21
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 5
          OnChange = CbbDept_EChange
        end
        object TntPanel3: TTntPanel
          Left = 221
          Top = 8
          Width = 233
          Height = 33
          TabOrder = 6
          object RbAll: TTntRadioButton
            Left = 8
            Top = 8
            Width = 70
            Height = 17
            Caption = #20840#37096
            Checked = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            TabStop = True
          end
          object RbYes: TTntRadioButton
            Left = 83
            Top = 8
            Width = 70
            Height = 17
            Caption = #24050#25903#20184
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object RbNo: TTntRadioButton
            Left = 158
            Top = 8
            Width = 70
            Height = 17
            Caption = #26410#25903#20184
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            OnClick = RbNoClick
          end
        end
        object cbMonth: TTntCheckBox
          Left = 460
          Top = 16
          Width = 60
          Height = 17
          Caption = #26376#20221
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          OnClick = cbMonthClick
        end
        object cbDate: TTntCheckBox
          Left = 460
          Top = 48
          Width = 60
          Height = 17
          Caption = #26085#26399
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
          OnClick = cbDateClick
        end
        object EditMonth: TTntEdit
          Left = 528
          Top = 14
          Width = 121
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
        object dtpDate_B: TTntDateTimePicker
          Left = 528
          Top = 46
          Width = 90
          Height = 21
          Date = 42077.014752233790000000
          Time = 42077.014752233790000000
          Enabled = False
          TabOrder = 10
          OnChange = dtpDate_BChange
        end
        object dtpDate_E: TTntDateTimePicker
          Left = 624
          Top = 46
          Width = 90
          Height = 21
          Date = 42077.014961099550000000
          Time = 42077.014961099550000000
          Enabled = False
          TabOrder = 11
        end
      end
      object bbtn_search: TTntBitBtn
        Left = 786
        Top = 10
        Width = 81
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'find'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = bbtn_searchClick
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
      object bbtn_reset: TTntBitBtn
        Left = 786
        Top = 37
        Width = 81
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'reset'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = bbtn_resetClick
        Kind = bkRetry
      end
    end
    object DBGrid1: TTntDBGrid
      Left = 1
      Top = 77
      Width = 873
      Height = 409
      Align = alClient
      DataSource = DataSource1
      FixedColor = clSkyBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Palatino Linotype'
      Font.Style = []
      ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnTitleClick = DBGrid1TitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'insur_month'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'emp_id'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'name_vim'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'epid_no'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'epindt'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'base_pay'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'insur_money1'
          Title.Caption = 'insur_money'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'date_b'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'date_e'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'insur_days'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'insur_class'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'print_date'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'print_user'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'remark'
          Width = 200
          Visible = True
        end>
    end
    object mmTitle: TTntMemo
      Left = 600
      Top = 128
      Width = 273
      Height = 337
      Lines.Strings = (
        'DANH S'#193'CH NG'#431#7900'I LAO '#272#7896'NG H'#431#7902'NG CH'#7870' '#272#7896' THAI S'#7842'N- '#7889'm '#273'au'
        #20139#26377#29986#20551#20445#38570#21046#24230#30340#21214#21205#32773#26126#32048#21934
        'STT'
        #27425#24207
        'S'#7889' th'#7867
        #24037#34399
        'B'#7897' ph'#7853'n'
        #37096#38272
        'H'#7885' & T'#234'n'
        #22995#21517
        'M'#7913'c l'#432#417'ng h'#432#7903'ng BHXH'
        #21443#21152#31038#26371#20445#38570#34218#36039
        'S'#7889' ng'#224'y h'#432#7903'ng BHXH'
        #21443#21152#31038#26371#20445#38570#22825#25976
        'T'#7881' l'#7879
        #27604#29575
        'S'#7889' ti'#7873'n'
        #37329#38989
        'K'#253' t'#234'n/ Ng'#224'y, gi'#7901' nh'#7853'n ti'#7873'n'
        #31805#21517#26085#26399','#26178#38291
        'Ghi ch'#250
        #20633#35387)
      TabOrder = 3
      Visible = False
      WordWrap = False
    end
    object mmTitle2: TTntMemo
      Left = 8
      Top = 240
      Width = 217
      Height = 161
      Lines.Strings = (
        '"Ng'#224'y" DD "Th'#225'ng" MM "N'#259'm" YYYY'
        'Xet Duy'#7879't'
        #23529'      '#26680
        'Ng'#432#7901'i t'#7921'c hi'#7879'n'
        #32147' '#36774)
      TabOrder = 4
      Visible = False
      WordWrap = False
    end
  end
  object PanelFlow: TTntPanel
    Left = 229
    Top = 60
    Width = 372
    Height = 477
    BevelInner = bvRaised
    BevelOuter = bvNone
    BevelWidth = 2
    BorderWidth = 1
    BorderStyle = bsSingle
    TabOrder = 2
    Visible = False
    object TntLabel6: TTntLabel
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
      Left = 142
      Top = 423
      Width = 66
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
      Left = 212
      Top = 423
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
      Width = 362
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
      OnMouseDown = TntPanel6MouseDown
      object ImageClose: TImage
        Left = 340
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
    object gbVisible: TTntGroupBox
      Left = 14
      Top = 27
      Width = 339
      Height = 382
      TabOrder = 1
      object TntLabel4: TTntLabel
        Left = 10
        Top = 15
        Width = 80
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'insur_month'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object TntLabel5: TTntLabel
        Left = 10
        Top = 40
        Width = 80
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
      object TntLabel8: TTntLabel
        Left = 10
        Top = 116
        Width = 80
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'fld_epid_no'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object TLB_NO: TTntLabel
        Left = 10
        Top = 141
        Width = 80
        Height = 13
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
      object TLB_MONTH: TTntLabel
        Left = 10
        Top = 292
        Width = 80
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'insur_money'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object TLB_TYPE: TTntLabel
        Left = 10
        Top = 191
        Width = 80
        Height = 15
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'fld_base_pay'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object TLB_REMARK: TTntLabel
        Left = 10
        Top = 217
        Width = 80
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
      object TntLabel3: TTntLabel
        Left = 10
        Top = 65
        Width = 80
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
      object TntLabel1: TTntLabel
        Left = 10
        Top = 242
        Width = 80
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
      object TntLabel2: TTntLabel
        Left = 10
        Top = 267
        Width = 80
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'insur_days'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object TntLabel7: TTntLabel
        Left = 10
        Top = 166
        Width = 80
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'insur_class'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object TntLabel11: TTntLabel
        Left = 10
        Top = 318
        Width = 80
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
      object TntSpeedButton1: TTntSpeedButton
        Left = 280
        Top = 212
        Width = 23
        Height = 22
        Caption = '...'
        OnClick = TntSpeedButton1Click
      end
      object TntSpeedButton2: TTntSpeedButton
        Left = 280
        Top = 238
        Width = 23
        Height = 22
        Caption = '...'
        OnClick = TntSpeedButton2Click
      end
      object TntLabel12: TTntLabel
        Left = 10
        Top = 90
        Width = 80
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
      object TntLabel9: TTntLabel
        Left = 281
        Top = 13
        Width = 7
        Height = 16
        Caption = '*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object TntLabel10: TTntLabel
        Left = 281
        Top = 39
        Width = 7
        Height = 16
        Caption = '*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object TntLabel13: TTntLabel
        Left = 281
        Top = 165
        Width = 7
        Height = 16
        Caption = '*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object TntLabel14: TTntLabel
        Left = 281
        Top = 190
        Width = 7
        Height = 16
        Caption = '*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object TntLabel15: TTntLabel
        Left = 281
        Top = 265
        Width = 7
        Height = 16
        Caption = '*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object TntLabel16: TTntLabel
        Left = 306
        Top = 215
        Width = 7
        Height = 16
        Caption = '*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object TntLabel17: TTntLabel
        Left = 306
        Top = 241
        Width = 7
        Height = 16
        Caption = '*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object TntLabel18: TTntLabel
        Left = 10
        Top = 344
        Width = 80
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'apply_date'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object TntSpeedButton3: TTntSpeedButton
        Left = 280
        Top = 338
        Width = 23
        Height = 22
        Caption = '...'
        OnClick = TntSpeedButton3Click
      end
      object TntDBEdit1: TTntDBEdit
        Left = 100
        Top = 9
        Width = 180
        Height = 24
        DataField = 'insur_month'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Palatino Linotype'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object TntDBEdit2: TTntDBEdit
        Left = 100
        Top = 34
        Width = 180
        Height = 24
        DataField = 'emp_id'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Palatino Linotype'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object TntDBEdit3: TTntDBEdit
        Left = 100
        Top = 59
        Width = 180
        Height = 24
        DataField = 'name_vim'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Palatino Linotype'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object TntDBEdit4: TTntDBEdit
        Left = 100
        Top = 110
        Width = 180
        Height = 24
        DataField = 'epid_no'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Palatino Linotype'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object TntDBEdit5: TTntDBEdit
        Left = 100
        Top = 135
        Width = 180
        Height = 24
        DataField = 'epindt'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Palatino Linotype'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
      end
      object TntDBEdit6: TTntDBEdit
        Left = 100
        Top = 185
        Width = 180
        Height = 24
        DataField = 'base_pay'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Palatino Linotype'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object TntDBEdit7: TTntDBEdit
        Left = 100
        Top = 286
        Width = 180
        Height = 24
        DataField = 'insur_money1'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Palatino Linotype'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
      object TntDBEdit8: TTntDBEdit
        Left = 100
        Top = 261
        Width = 180
        Height = 24
        DataField = 'insur_days'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Palatino Linotype'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
      end
      object cbbClass: TTntComboBox
        Left = 100
        Top = 160
        Width = 180
        Height = 24
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Palatino Linotype'
        Font.Style = []
        ItemHeight = 16
        ParentFont = False
        TabOrder = 8
        OnChange = cbbClassChange
      end
      object TntDBEdit11: TTntDBEdit
        Left = 100
        Top = 312
        Width = 180
        Height = 24
        DataField = 'remark'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Palatino Linotype'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
      end
      object DbEditDate_B: TTntDBEdit
        Left = 100
        Top = 211
        Width = 180
        Height = 24
        DataField = 'date_b'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Palatino Linotype'
        Font.Style = []
        ParentFont = False
        TabOrder = 10
      end
      object DbEditDate_E: TTntDBEdit
        Left = 100
        Top = 236
        Width = 180
        Height = 24
        DataField = 'date_e'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Palatino Linotype'
        Font.Style = []
        ParentFont = False
        TabOrder = 11
      end
      object TntDBEdit14: TTntDBEdit
        Left = 100
        Top = 84
        Width = 180
        Height = 24
        DataField = 'department'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Palatino Linotype'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 12
      end
      object DBEditDate_Apply: TTntDBEdit
        Left = 100
        Top = 338
        Width = 180
        Height = 24
        DataField = 'apply_date'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Palatino Linotype'
        Font.Style = []
        ParentFont = False
        TabOrder = 13
      end
      object mcDate: TTntMonthCalendar
        Left = 316
        Top = 200
        Width = 267
        Height = 154
        Date = 42077.000000000000000000
        TabOrder = 14
        Visible = False
        OnDblClick = mcDateDblClick
      end
    end
    object NVG: TDBNavigator
      Left = 91
      Top = 423
      Width = 112
      Height = 25
      DataSource = DataSource1
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      TabOrder = 2
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 224
    Top = 8
  end
  object ADOQuery1: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterOpen = sqlQuery1AfterOpen
    AfterClose = sqlQuery1AfterClose
    BeforePost = sqlQuery1BeforePost
    AfterScroll = ADOQuery1AfterScroll
    OnCalcFields = ADOQuery1CalcFields
    OnNewRecord = ADOQuery1NewRecord
    OnWillChangeRecord = sqlQuery1WillChangeRecord
    Parameters = <>
    SQL.Strings = (
      'select * from hrd_emp_insurance')
    Left = 192
    Top = 8
    object ADOQuery1upd_user: TStringField
      FieldName = 'upd_user'
      Size = 16
    end
    object ADOQuery1upd_date: TDateTimeField
      FieldName = 'upd_date'
    end
    object ADOQuery1insur_month: TStringField
      FieldName = 'insur_month'
      FixedChar = True
      Size = 6
    end
    object ADOQuery1emp_id: TStringField
      FieldName = 'emp_id'
      FixedChar = True
      Size = 10
    end
    object ADOQuery1name_vim: TWideStringField
      FieldKind = fkCalculated
      FieldName = 'name_vim'
      Size = 200
      Calculated = True
    end
    object ADOQuery1department: TWideStringField
      FieldKind = fkCalculated
      FieldName = 'department'
      Size = 300
      Calculated = True
    end
    object ADOQuery1epid_no: TStringField
      FieldKind = fkCalculated
      FieldName = 'epid_no'
      Size = 10
      Calculated = True
    end
    object ADOQuery1epindt: TDateField
      FieldKind = fkCalculated
      FieldName = 'epindt'
      Calculated = True
    end
    object ADOQuery1base_pay: TBCDField
      FieldName = 'base_pay'
      Precision = 19
    end
    object ADOQuery1insur_money: TBCDField
      FieldName = 'insur_money'
      Precision = 19
    end
    object ADOQuery1date_b: TDateTimeField
      DisplayLabel = 'date_begin'
      FieldName = 'date_b'
    end
    object ADOQuery1date_e: TDateTimeField
      DisplayLabel = 'date_end'
      FieldName = 'date_e'
    end
    object ADOQuery1insur_days: TIntegerField
      FieldName = 'insur_days'
    end
    object ADOQuery1insur_class: TStringField
      FieldName = 'insur_class'
      OnGetText = ADOQuery1insur_classGetText
      FixedChar = True
      Size = 2
    end
    object ADOQuery1print_date: TDateTimeField
      FieldName = 'print_date'
    end
    object ADOQuery1print_user: TStringField
      FieldName = 'print_user'
      FixedChar = True
      Size = 7
    end
    object ADOQuery1remark: TWideStringField
      FieldName = 'remark'
      Size = 200
    end
    object ADOQuery1insur_money1: TBCDField
      FieldKind = fkCalculated
      FieldName = 'insur_money1'
      Precision = 19
      Size = 19
      Calculated = True
    end
    object ADOQuery1insur_rate: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'insur_rate'
      Calculated = True
    end
    object ADOQuery1apply_date: TDateTimeField
      FieldName = 'apply_date'
    end
  end
end
