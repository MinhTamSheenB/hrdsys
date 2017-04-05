object FormDut15: TFormDut15
  Left = 187
  Top = 165
  Width = 812
  Height = 504
  Caption = 'FormDut15'
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
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 804
    Height = 470
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object PanelTitle: TTntPanel
      Left = 0
      Top = 0
      Width = 804
      Height = 49
      Align = alTop
      BevelOuter = bvNone
      Caption = 'dut15_titl'
      Color = clCream
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Palatino Linotype'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object PanelMain: TPanel
      Left = 0
      Top = 49
      Width = 804
      Height = 421
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object TntGroupBox1: TTntGroupBox
        Left = 0
        Top = 0
        Width = 804
        Height = 97
        Align = alTop
        Caption = 'search_condition'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Palatino Linotype'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object TntLabel1: TTntLabel
          Left = 33
          Top = 26
          Width = 82
          Height = 15
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'date_range'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object TntLabel2: TTntLabel
          Left = 32
          Top = 55
          Width = 82
          Height = 15
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'dept_range'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object dtp_begin: TTntDateTimePicker
          Left = 120
          Top = 24
          Width = 89
          Height = 24
          Date = 38632.622110625000000000
          Time = 38632.622110625000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Palatino Linotype'
          Font.Style = []
          ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
          ParentFont = False
          TabOrder = 0
        end
        object dtp_end: TTntDateTimePicker
          Left = 216
          Top = 24
          Width = 88
          Height = 24
          Date = 38632.622139375000000000
          Time = 38632.622139375000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Palatino Linotype'
          Font.Style = []
          ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
          ParentFont = False
          TabOrder = 1
        end
        object CobDeptBegin: TTntComboBox
          Left = 119
          Top = 53
          Width = 181
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Palatino Linotype'
          Font.Style = []
          ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
          ItemHeight = 16
          ParentFont = False
          TabOrder = 2
        end
        object CobDeptEnd: TTntComboBox
          Left = 318
          Top = 53
          Width = 180
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Palatino Linotype'
          Font.Style = []
          ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
          ItemHeight = 16
          ParentFont = False
          TabOrder = 3
          OnSelect = CobDeptEndSelect
        end
        object bb_reset: TTntBitBtn
          Left = 634
          Top = 25
          Width = 90
          Height = 25
          BiDiMode = bdRightToLeftNoAlign
          Caption = 'reset'
          Default = True
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Palatino Linotype'
          Font.Style = []
          ModalResult = 4
          ParentBiDiMode = False
          ParentFont = False
          TabOrder = 4
          OnClick = bb_resetClick
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
            33333333333F8888883F33330000324334222222443333388F3833333388F333
            000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
            F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
            223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
            3338888300003AAAAAAA33333333333888888833333333330000333333333333
            333333333333333333FFFFFF000033333333333344444433FFFF333333888888
            00003A444333333A22222438888F333338F3333800003A2243333333A2222438
            F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
            22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
            33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
            3333333333338888883333330000333333333333333333333333333333333333
            0000}
          NumGlyphs = 2
        end
        object bb_ok: TTntBitBtn
          Left = 542
          Top = 26
          Width = 90
          Height = 25
          Caption = 'ok'
          Default = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Palatino Linotype'
          Font.Style = []
          ModalResult = 1
          ParentFont = False
          TabOrder = 5
          OnClick = bb_okClick
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
        object Btn_preview: TTntBitBtn
          Left = 542
          Top = 56
          Width = 90
          Height = 25
          Cancel = True
          Caption = 'preview'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Palatino Linotype'
          Font.Style = []
          ModalResult = 7
          ParentFont = False
          TabOrder = 6
          OnClick = Btn_previewClick
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
        object Btn_Print: TTntBitBtn
          Left = 634
          Top = 56
          Width = 90
          Height = 25
          Caption = '(&p)rint'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Palatino Linotype'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          OnClick = Btn_previewClick
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
        object cob_range: TTntComboBox
          Left = 304
          Top = 24
          Width = 145
          Height = 24
          Style = csDropDownList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Palatino Linotype'
          Font.Style = []
          ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
          ItemHeight = 16
          ParentFont = False
          TabOrder = 8
          Items.Strings = (
            #20316#26989#21729
            #38750#20316#26989#21729
            #20840#37096
            #20316#26989#21729'-60'
            #20316#26989#21729'-61'
            #20316#26989#21729'-62'
            #20316#26989#21729'-63')
        end
      end
      object TntDBGrid1: TTntDBGrid
        Left = 0
        Top = 97
        Width = 804
        Height = 324
        Align = alClient
        DataSource = DataSource1
        FixedColor = clSkyBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Palatino Linotype'
        Font.Style = []
        ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'dept_code'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 67
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'abbr_titl'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 142
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'renci'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 54
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'late'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 29
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'early'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 32
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'absentwork'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 32
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'gtrip'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 28
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'gleave'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'inhospital'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'sickleave'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 36
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'maternityleave'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 29
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'affairleave'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 33
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'weddingleave'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 32
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'funeralleave'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 32
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'injureleave'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 31
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'generalhols'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 32
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dayshift'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 28
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'middleshift'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 28
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nightshift'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 29
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'stopwork'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 28
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dayovertime'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 31
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nightovertime'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 27
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'wholeovertime'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 27
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'followovertime'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 28
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ordainovertime'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'feasthols'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 28
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'normalotime'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 28
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ordainotime'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 24
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'feastotime'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 23
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'total'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 34
            Visible = True
          end>
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 200
  end
  object ADOQuery1: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      'select dept_code,abbr_titl from hrd_dept order by dept_code')
    Left = 168
  end
  object ADOQuery2: TADOQuery
    Connection = DMHrdsys.conn
    Parameters = <>
    Left = 232
  end
  object ClientDataSet1: TClientDataSet
    Active = True
    Aggregates = <>
    AutoCalcFields = False
    Params = <>
    Left = 272
    Data = {
      CC0300009619E0BD01000000180000001F000000000003000000CC0309646570
      745F636F6465010049002000010005574944544802000200060009616262725F
      7469746C01004A0000000100055749445448020002001C000572656E63690100
      4A0000000100055749445448020002001C00046C61746501004A000000010005
      5749445448020002001C00056561726C7901004A000000010005574944544802
      0002001C000A616273656E74776F726B01004A00000001000557494454480200
      02001C0005677472697001004A0000000100055749445448020002001C000667
      6C6561766501004A0000000100055749445448020002001C000A696E686F7370
      6974616C01004A0000000100055749445448020002001C00097369636B6C6561
      766501004A0000000100055749445448020002001C000E6D617465726E697479
      6C6561766501004A0000000100055749445448020002001C000B616666616972
      6C6561766501004A0000000100055749445448020002001C000C77656464696E
      676C6561766501004A0000000100055749445448020002001C000C66756E6572
      616C6C6561766501004A0000000100055749445448020002001C000B696E6A75
      72656C6561766501004A0000000100055749445448020002001C000B67656E65
      72616C686F6C7301004A0000000100055749445448020002001C000864617973
      6869667401004A0000000100055749445448020002001C000B6D6964646C6573
      6869667401004A0000000100055749445448020002001C000A6E696768747368
      69667401004A0000000100055749445448020002001C000873746F70776F726B
      01004A0000000100055749445448020002001C000B6461796F76657274696D65
      01004A0000000100055749445448020002001C000D6E696768746F7665727469
      6D6501004A0000000100055749445448020002001C000D77686F6C656F766572
      74696D6501004A0000000100055749445448020002001C000E666F6C6C6F776F
      76657274696D6501004A0000000100055749445448020002001C000E6F726461
      696E6F76657274696D6501004A0000000100055749445448020002001C000966
      65617374686F6C7301004A0000000100055749445448020002001C000B6E6F72
      6D616C6F74696D6501004A0000000100055749445448020002001C000B6F7264
      61696E6F74696D6501004A0000000100055749445448020002001C000A666561
      73746F74696D6501004A0000000100055749445448020002001C0005746F7461
      6C01004A0000000100055749445448020002001C000464657074010049002000
      01000557494454480200020006000000}
    object ClientDataSet1dept_code: TStringField
      FieldName = 'dept_code'
      FixedChar = True
      Size = 6
    end
    object ClientDataSet1abbr_titl: TWideStringField
      FieldName = 'abbr_titl'
      Size = 14
    end
    object ClientDataSet1renci: TWideStringField
      FieldName = 'renci'
      Size = 14
    end
    object ClientDataSet1late: TWideStringField
      FieldName = 'late'
      Size = 14
    end
    object ClientDataSet1early: TWideStringField
      FieldName = 'early'
      Size = 14
    end
    object ClientDataSet1absentwork: TWideStringField
      FieldName = 'absentwork'
      Size = 14
    end
    object ClientDataSet1gtrip: TWideStringField
      FieldName = 'gtrip'
      Size = 14
    end
    object ClientDataSet1gleave: TWideStringField
      FieldName = 'gleave'
      Size = 14
    end
    object ClientDataSet1inhospital: TWideStringField
      FieldName = 'inhospital'
      Size = 14
    end
    object ClientDataSet1sickleave: TWideStringField
      FieldName = 'sickleave'
      Size = 14
    end
    object ClientDataSet1maternityleave: TWideStringField
      FieldName = 'maternityleave'
      Size = 14
    end
    object ClientDataSet1affairleave: TWideStringField
      FieldName = 'affairleave'
      Size = 14
    end
    object ClientDataSet1weddingleave: TWideStringField
      FieldName = 'weddingleave'
      Size = 14
    end
    object ClientDataSet1funeralleave: TWideStringField
      FieldName = 'funeralleave'
      Size = 14
    end
    object ClientDataSet1injureleave: TWideStringField
      FieldName = 'injureleave'
      Size = 14
    end
    object ClientDataSet1generalhols: TWideStringField
      FieldName = 'generalhols'
      Size = 14
    end
    object ClientDataSet1dayshift: TWideStringField
      FieldName = 'dayshift'
      Size = 14
    end
    object ClientDataSet1middleshift: TWideStringField
      FieldName = 'middleshift'
      Size = 14
    end
    object ClientDataSet1nightshift: TWideStringField
      FieldName = 'nightshift'
      Size = 14
    end
    object ClientDataSet1stopwork: TWideStringField
      FieldName = 'stopwork'
      Size = 14
    end
    object ClientDataSet1dayovertime: TWideStringField
      FieldName = 'dayovertime'
      Size = 14
    end
    object ClientDataSet1nightovertime: TWideStringField
      FieldName = 'nightovertime'
      Size = 14
    end
    object ClientDataSet1wholeovertime: TWideStringField
      FieldName = 'wholeovertime'
      Size = 14
    end
    object ClientDataSet1followovertime: TWideStringField
      FieldName = 'followovertime'
      Size = 14
    end
    object ClientDataSet1ordainovertime: TWideStringField
      FieldName = 'ordainovertime'
      Size = 14
    end
    object ClientDataSet1feasthols: TWideStringField
      FieldName = 'feasthols'
      Size = 14
    end
    object ClientDataSet1normalotime: TWideStringField
      FieldName = 'normalotime'
      Size = 14
    end
    object ClientDataSet1ordainotime: TWideStringField
      FieldName = 'ordainotime'
      Size = 14
    end
    object ClientDataSet1feastotime: TWideStringField
      FieldName = 'feastotime'
      Size = 14
    end
    object ClientDataSet1total: TWideStringField
      FieldName = 'total'
      Size = 14
    end
    object ClientDataSet1dept: TStringField
      FieldName = 'dept'
      FixedChar = True
      Size = 6
    end
  end
  object ADOQuery3: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select dept_code,abbr_titl,'
      'abbr_titl as renci,'
      'vim_abbr as late,'
      'vim_abbr as early,'
      'vim_abbr as absentwork,'
      'vim_abbr as gtrip,'
      'vim_abbr as gleave,'
      'vim_abbr as inhospital,'
      'vim_abbr as sickleave,'
      'vim_abbr as maternityleave,'
      'vim_abbr as affairleave,'
      'vim_abbr as weddingleave,'
      'vim_abbr as funeralleave,'
      'vim_abbr as injureleave,'
      'vim_abbr as generalhols,'
      'vim_abbr as dayshift,'
      'vim_abbr as middleshift,'
      'vim_abbr as nightshift,'
      'vim_abbr as stopwork,'
      'vim_abbr as dayovertime,'
      'vim_abbr as nightovertime,'
      'vim_abbr as wholeovertime,'
      'vim_abbr as followovertime,'
      'vim_abbr as ordainovertime,'
      'vim_abbr as feasthols,'
      'vim_abbr as normalotime,'
      'vim_abbr as ordainotime,'
      'vim_abbr as feastotime,'
      'vim_abbr as total,'
      'dept_code  as dept'
      ' from hrd_dept ')
    Left = 312
  end
  object ClientDataSet2: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 344
    object ClientDataSet2dept_code: TStringField
      FieldName = 'dept_code'
      FixedChar = True
      Size = 6
    end
    object ClientDataSet2abbr_titl: TWideStringField
      FieldName = 'abbr_titl'
      Size = 14
    end
    object ClientDataSet2renci: TWideStringField
      FieldName = 'renci'
      Size = 14
    end
    object ClientDataSet2late: TWideStringField
      FieldName = 'late'
    end
    object ClientDataSet2early: TWideStringField
      FieldName = 'early'
    end
    object ClientDataSet2absentwork: TWideStringField
      FieldName = 'absentwork'
    end
    object ClientDataSet2gtrip: TWideStringField
      FieldName = 'gtrip'
    end
    object ClientDataSet2gleave: TWideStringField
      FieldName = 'gleave'
    end
    object ClientDataSet2inhospital: TWideStringField
      FieldName = 'inhospital'
    end
    object ClientDataSet2sickleave: TWideStringField
      FieldName = 'sickleave'
    end
    object ClientDataSet2maternityleave: TWideStringField
      FieldName = 'maternityleave'
    end
    object ClientDataSet2affairleave: TWideStringField
      FieldName = 'affairleave'
    end
    object ClientDataSet2weddingleave: TWideStringField
      FieldName = 'weddingleave'
    end
    object ClientDataSet2funeralleave: TWideStringField
      FieldName = 'funeralleave'
    end
    object ClientDataSet2injureleave: TWideStringField
      FieldName = 'injureleave'
    end
    object ClientDataSet2generalhols: TWideStringField
      FieldName = 'generalhols'
    end
    object ClientDataSet2dayshift: TWideStringField
      FieldName = 'dayshift'
    end
    object ClientDataSet2middleshift: TWideStringField
      FieldName = 'middleshift'
    end
    object ClientDataSet2nightshift: TWideStringField
      FieldName = 'nightshift'
    end
    object ClientDataSet2stopwork: TWideStringField
      FieldName = 'stopwork'
    end
    object ClientDataSet2dayovertime: TWideStringField
      FieldName = 'dayovertime'
    end
    object ClientDataSet2nightovertime: TWideStringField
      FieldName = 'nightovertime'
    end
    object ClientDataSet2wholeovertime: TWideStringField
      FieldName = 'wholeovertime'
    end
    object ClientDataSet2followovertime: TWideStringField
      FieldName = 'followovertime'
    end
    object ClientDataSet2ordainovertime: TWideStringField
      FieldName = 'ordainovertime'
    end
    object ClientDataSet2feasthols: TWideStringField
      FieldName = 'feasthols'
    end
    object ClientDataSet2normalotime: TWideStringField
      FieldName = 'normalotime'
    end
    object ClientDataSet2ordainotime: TWideStringField
      FieldName = 'ordainotime'
    end
    object ClientDataSet2feastotime: TWideStringField
      FieldName = 'feastotime'
    end
    object ClientDataSet2total: TWideStringField
      FieldName = 'total'
    end
  end
  object PrintDialog1: TPrintDialog
    Left = 401
    Top = 1
  end
  object SaveDialog1: TSaveDialog
    Filter = 
      'Excel'#25991#20214'(*.xls)|.xls|'#25991#26412#25991#20214'(*.txt)|.txt|'#36229#25991#26412#25991#20214'(*.html)|.html|CSV'#25991#20214'(*' +
      '.csv)|.csv|'#22577#34920#25991#20214'(*.qrp)|.qrp'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 456
    Top = 6
  end
end
