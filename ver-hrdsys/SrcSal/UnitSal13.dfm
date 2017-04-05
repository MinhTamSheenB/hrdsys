object FormSal13: TFormSal13
  Left = 80
  Top = 140
  Width = 800
  Height = 570
  Caption = 'FormSal13'
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
  object Panel1: TTntPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 536
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 0
    object PanelTitle: TTntPanel
      Left = 1
      Top = 1
      Width = 790
      Height = 48
      Align = alTop
      Caption = #24037#24207'   '#32173'   '#35703
      Color = clCream
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object TntPageControl1: TTntPageControl
      Left = 1
      Top = 49
      Width = 790
      Height = 486
      ActivePage = TabSheeInq
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MultiLine = True
      ParentFont = False
      ScrollOpposite = True
      TabOrder = 1
      OnChange = TntPageControl1Change
      object TabSheeInq: TTntTabSheet
        Caption = #26597#35426
        object TTntPanel
          Left = 0
          Top = 0
          Width = 782
          Height = 41
          Align = alTop
          TabOrder = 0
          object LabelInqDept: TTntLabel
            Left = 8
            Top = 16
            Width = 73
            Height = 16
            AutoSize = False
            Caption = #24037#24207#37096#38272
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object TntLabel1: TTntLabel
            Left = 120
            Top = 10
            Width = 41
            Height = 24
            Caption = '---->'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object ButtonInqOk: TTntSpeedButton
            Left = 481
            Top = 17
            Width = 57
            Height = 22
            Caption = #30906#23450
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
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
            ParentFont = False
            OnClick = ButtonInqOkClick
          end
          object ButtonQuickFind1: TTntSpeedButton
            Left = 571
            Top = 17
            Width = 81
            Height = 22
            Caption = #24555#36895#26597#35426
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Glyph.Data = {
              F6060000424DF606000000000000360000002800000018000000180000000100
              180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FF8E5D598E5D598E5D598E5D598E5D598E5D598E5D59
              8E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D
              5980504BFF00FFFF00FFFF00FFFF00FF646365314B62AC7D7EF6DAB6F3D5ADF2
              D1A5F0CE9EEFCB97EFC791EEC589EBC182EBC080EBC080EBC080EBC080EBC080
              EBC080EDC180EABF7F80504BFF00FFFF00FFFF00FFFF00FF5084B20F6FE1325F
              8CB87E7AF2D5B1F0D1AAEFCFA3EECB9DEDC796EDC58FEBC188EABF82E9BD7FE9
              BD7FE9BD7FE9BD7FE9BD7FEABF7FE7BC7E80504BFF00FFFF00FFFF00FFFF00FF
              32A0FE37A1FF106FE2325F8BB67D79F2D4B1F0D1AAEFCFA4EECB9DEDC796EDC5
              8FEBC189EABF82E9BD7FE9BD7FE9BD7FE9BD7FEABF7FE7BC7E80504BFF00FFFF
              00FFFF00FFFF00FFFF00FF37A4FE379FFF0E6DDE355F89BB7F79F2D4B0F0D1AA
              EFCEA3EECB9CEDC795EDC58FEBC189E9BD81E9BD7FE9BD7FE9BD7FEABF7FE7BC
              7E80504BFF00FFFF00FFFF00FFFF00FFFF00FF93656037A4FE359EFF0F6FDE35
              608BA67B7FF2D5B1F0D1AAEFCEA3EECB9CEDC796EDC590EBC189E9BF82E9BD7F
              E9BD7FEABF7FE7BC7E80504BFF00FFFF00FFFF00FFFF00FFFF00FF956660F2E2
              D338A5FE329DFF156DCE444F5BDAB8A0925D5A986660935E5B9A6663B88A74D7
              AB82EBC189E9BD81E9BD7FEABF7FE7BC7E80504BFF00FFFF00FFFF00FFFF00FF
              FF00FF986963F2E6DAFAEEDE3BABFFA1CAE78F6D6B96665FC2A38CE9DCB7FBF8
              CBE7DCB6BF9A899D6B66CB9E7BEBC189E9BD81EABF7FE7BC7E80504BFF00FFFF
              00FFFF00FFFF00FFFF00FF9E6E64F4EAE1FBF2E6F8EADCB49291A06D66EDD4A4
              FFFCCAFFFFCFFFFFCFFFFFD5FFFFEAE3D3CC96635FD5AB82EBC188EABF82E7BB
              7E80504BFF00FFFF00FFFF00FFFF00FFFF00FFA37266F6EEE9FCF6EDF8EFE3A1
              6C67C79F81F6D095FCF4C2FFFFCFFFFFD8FFFFEEFFFFFAFFFFFFB79387B88A73
              EBC48EEBC288E7BC8080504BFF00FFFF00FFFF00FFFF00FFFF00FFA77568F8F3
              F0FEFBF6FBF3EB9D6A64E7C28EEEB87FFBF0BDFFFFD0FFFFDCFFFFF7FFFFFAFF
              FFE6DCCEAD996560EDC795EDC58FE9BF8780504BFF00FFFF00FFFF00FFFF00FF
              FF00FFAC7969FAF6F4FFFFFEFEF8F3935F5BF7D495EAA76CF7DAA3FFFFCEFFFF
              D4FFFFE1FFFFE3FFFFD7F6F2C9935E5BEECB9CEEC996EAC18E80504BFF00FFFF
              00FFFF00FFFF00FFFF00FFB17E6BFAF6F4FFFFFFFFFEFB9E6B65E9C793EAA96A
              EFBD80FAE9B4FFFFD0FFFFD3FFFFD1FFFFD1E1D1B0996660EFCEA1EECB9CEBC5
              9280504BFF00FFFF00FFFF00FFFF00FFFF00FFB6816CFAF6F4FFFFFFFFFFFFA4
              706BCBA989F8E2B5F0C690F0C286F7DCA5FEF3C1FEF8C6FFFFCFBB9984BB8F7E
              F0D1A9F0CFA3EDC99980504BFF00FFFF00FFFF00FFFF00FFFF00FFBB846EFAF6
              F4FFFFFFFFFFFFE5D5D5A07068EDE3E2FFF4E2EFBD80EBAB6FF0C086FBDEA3EB
              D9A9986760DAB89FF0D4AFEFD0A7CEB49180504BFF00FFFF00FFFF00FFFF00FF
              FF00FFC0896FFBF7F4FFFFFFFFFFFFFFFFFFD7C0BF9E6F6BC6A999EAD19EFADA
              9CE9C793C59D829D6A64D0AC9CF3DCBDE5CEAFC4B096A1927F80504BFF00FFFF
              00FFFF00FFFF00FFFF00FFC58C70FBF7F4FFFFFFFFFFFFFFFFFFFFFFFFE5D5D5
              A4766A9A6862935F5B9E6A64BD988FE0C4B5FAE9D0E0D0BAB8AB9AA79C8BA497
              8680504BFF00FFFF00FFFF00FFFF00FFFF00FFCB9173FBF7F4FFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFEFBFCF7F0FBF2E9FBF2E5E9D3C49E675B98665B
              95655B96655B96655B986859FF00FFFF00FFFF00FFFF00FFFF00FFCF9674FBF7
              F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFAFCF7F0FFFAEFDA
              C0B69F675BDAA16BDD984FE2903AEA8923A5686BFF00FFFF00FFFF00FFFF00FF
              FF00FFD49875FCF8F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFCFBFFFEF7DDC4BC9F675BEAB474EFA952F6A036A5686BFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFD49875FCF8F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDDC7C29F675BEAB273EFA751A5686BFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD49875FFFEFEFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2D0CE9F675BEDB572
              A5686BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCF8E68CF8E
              68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF
              8E689F675BA5686BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            ParentFont = False
          end
          object LabelInq: TTntLabel
            Left = 691
            Top = 27
            Width = 24
            Height = 13
            Caption = #24037#24207
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LabelInqcode: TTntLabel
            Left = 228
            Top = 17
            Width = 65
            Height = 16
            AutoSize = False
            Caption = #24037#24207#20195#34399
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object TntLabel4: TTntLabel
            Left = 348
            Top = 11
            Width = 41
            Height = 24
            Caption = '---->'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object EditInputInq01: TTntEdit
            Left = 88
            Top = 13
            Width = 28
            Height = 21
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 2
            TabOrder = 0
            Text = 'F0'
          end
          object EditInputInq02: TTntEdit
            Left = 158
            Top = 14
            Width = 28
            Height = 21
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 2
            TabOrder = 1
            Text = 'FZ'
            OnExit = EditInputInq02Exit
          end
          object EditFindcar1: TTntEdit
            Left = 657
            Top = 17
            Width = 32
            Height = 21
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 3
            TabOrder = 4
            OnChange = EditFindcar1Change
          end
          object EditInputInq03: TTntEdit
            Left = 307
            Top = 13
            Width = 30
            Height = 21
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 3
            TabOrder = 2
          end
          object EditInputInq04: TTntEdit
            Left = 390
            Top = 13
            Width = 27
            Height = 21
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 3
            TabOrder = 3
            OnExit = EditInputInq04Exit
          end
        end
        object PanelNote: TTntPanel
          Left = 0
          Top = 41
          Width = 782
          Height = 417
          Align = alClient
          Caption = 'PanelInqNote'
          TabOrder = 1
          object PanelInqBottom: TTntPanel
            Left = 1
            Top = 375
            Width = 780
            Height = 41
            Align = alBottom
            TabOrder = 0
            object ButtonInqPrint: TTntSpeedButton
              Left = 632
              Top = 11
              Width = 65
              Height = 27
              Caption = #21015#21360
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
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
              ParentFont = False
              OnClick = ButtonInqPrintClick
            end
            object ButtonRefresh: TTntSpeedButton
              Left = 528
              Top = 11
              Width = 65
              Height = 27
              Caption = #21047#26032
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              OnClick = ButtonRefreshClick
            end
          end
          object DBGridInqData: TTntDBGrid
            Left = 1
            Top = 1
            Width = 780
            Height = 374
            Align = alClient
            DataSource = DataSourceInq
            FixedColor = clSkyBlue
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clTeal
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnTitleClick = DBGridInqDataTitleClick
            Columns = <
              item
                Color = clWhite
                Expanded = False
                FieldName = 'part_code'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 50
                Visible = True
              end
              item
                Color = clWhite
                Expanded = False
                FieldName = 'part_grad'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 50
                Visible = True
              end
              item
                Color = clWhite
                Expanded = False
                FieldName = 'part_dept'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 50
                Visible = True
              end
              item
                Color = clWhite
                Expanded = False
                FieldName = 'part_chs'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 200
                Visible = True
              end
              item
                Color = clWhite
                Expanded = False
                FieldName = 'part_vim'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 200
                Visible = True
              end
              item
                Color = clWhite
                Expanded = False
                FieldName = 'part_eng'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 120
                Visible = True
              end>
          end
        end
      end
      object TabSheetUpd: TTntTabSheet
        Caption = #20462#25913
        object PanelUpdTop: TTntPanel
          Left = 0
          Top = 0
          Width = 782
          Height = 41
          Align = alTop
          Caption = 'PanelUpdTop'
          TabOrder = 0
          object LabelUpdDept: TTntLabel
            Left = 7
            Top = 15
            Width = 105
            Height = 16
            AutoSize = False
            Caption = #24037#24207#37096#38272
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object TntLabel2: TTntLabel
            Left = 119
            Top = 11
            Width = 41
            Height = 24
            Caption = '---->'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object TntSpeedButton1: TTntSpeedButton
            Left = 487
            Top = 17
            Width = 58
            Height = 22
            Caption = #30906#23450
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
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
            ParentFont = False
            OnClick = TntSpeedButton1Click
          end
          object ButtonQuickFind2: TTntSpeedButton
            Left = 564
            Top = 17
            Width = 81
            Height = 22
            Caption = #24555#36895#26597#35426
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Glyph.Data = {
              F6060000424DF606000000000000360000002800000018000000180000000100
              180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FF8E5D598E5D598E5D598E5D598E5D598E5D598E5D59
              8E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D
              5980504BFF00FFFF00FFFF00FFFF00FF646365314B62AC7D7EF6DAB6F3D5ADF2
              D1A5F0CE9EEFCB97EFC791EEC589EBC182EBC080EBC080EBC080EBC080EBC080
              EBC080EDC180EABF7F80504BFF00FFFF00FFFF00FFFF00FF5084B20F6FE1325F
              8CB87E7AF2D5B1F0D1AAEFCFA3EECB9DEDC796EDC58FEBC188EABF82E9BD7FE9
              BD7FE9BD7FE9BD7FE9BD7FEABF7FE7BC7E80504BFF00FFFF00FFFF00FFFF00FF
              32A0FE37A1FF106FE2325F8BB67D79F2D4B1F0D1AAEFCFA4EECB9DEDC796EDC5
              8FEBC189EABF82E9BD7FE9BD7FE9BD7FE9BD7FEABF7FE7BC7E80504BFF00FFFF
              00FFFF00FFFF00FFFF00FF37A4FE379FFF0E6DDE355F89BB7F79F2D4B0F0D1AA
              EFCEA3EECB9CEDC795EDC58FEBC189E9BD81E9BD7FE9BD7FE9BD7FEABF7FE7BC
              7E80504BFF00FFFF00FFFF00FFFF00FFFF00FF93656037A4FE359EFF0F6FDE35
              608BA67B7FF2D5B1F0D1AAEFCEA3EECB9CEDC796EDC590EBC189E9BF82E9BD7F
              E9BD7FEABF7FE7BC7E80504BFF00FFFF00FFFF00FFFF00FFFF00FF956660F2E2
              D338A5FE329DFF156DCE444F5BDAB8A0925D5A986660935E5B9A6663B88A74D7
              AB82EBC189E9BD81E9BD7FEABF7FE7BC7E80504BFF00FFFF00FFFF00FFFF00FF
              FF00FF986963F2E6DAFAEEDE3BABFFA1CAE78F6D6B96665FC2A38CE9DCB7FBF8
              CBE7DCB6BF9A899D6B66CB9E7BEBC189E9BD81EABF7FE7BC7E80504BFF00FFFF
              00FFFF00FFFF00FFFF00FF9E6E64F4EAE1FBF2E6F8EADCB49291A06D66EDD4A4
              FFFCCAFFFFCFFFFFCFFFFFD5FFFFEAE3D3CC96635FD5AB82EBC188EABF82E7BB
              7E80504BFF00FFFF00FFFF00FFFF00FFFF00FFA37266F6EEE9FCF6EDF8EFE3A1
              6C67C79F81F6D095FCF4C2FFFFCFFFFFD8FFFFEEFFFFFAFFFFFFB79387B88A73
              EBC48EEBC288E7BC8080504BFF00FFFF00FFFF00FFFF00FFFF00FFA77568F8F3
              F0FEFBF6FBF3EB9D6A64E7C28EEEB87FFBF0BDFFFFD0FFFFDCFFFFF7FFFFFAFF
              FFE6DCCEAD996560EDC795EDC58FE9BF8780504BFF00FFFF00FFFF00FFFF00FF
              FF00FFAC7969FAF6F4FFFFFEFEF8F3935F5BF7D495EAA76CF7DAA3FFFFCEFFFF
              D4FFFFE1FFFFE3FFFFD7F6F2C9935E5BEECB9CEEC996EAC18E80504BFF00FFFF
              00FFFF00FFFF00FFFF00FFB17E6BFAF6F4FFFFFFFFFEFB9E6B65E9C793EAA96A
              EFBD80FAE9B4FFFFD0FFFFD3FFFFD1FFFFD1E1D1B0996660EFCEA1EECB9CEBC5
              9280504BFF00FFFF00FFFF00FFFF00FFFF00FFB6816CFAF6F4FFFFFFFFFFFFA4
              706BCBA989F8E2B5F0C690F0C286F7DCA5FEF3C1FEF8C6FFFFCFBB9984BB8F7E
              F0D1A9F0CFA3EDC99980504BFF00FFFF00FFFF00FFFF00FFFF00FFBB846EFAF6
              F4FFFFFFFFFFFFE5D5D5A07068EDE3E2FFF4E2EFBD80EBAB6FF0C086FBDEA3EB
              D9A9986760DAB89FF0D4AFEFD0A7CEB49180504BFF00FFFF00FFFF00FFFF00FF
              FF00FFC0896FFBF7F4FFFFFFFFFFFFFFFFFFD7C0BF9E6F6BC6A999EAD19EFADA
              9CE9C793C59D829D6A64D0AC9CF3DCBDE5CEAFC4B096A1927F80504BFF00FFFF
              00FFFF00FFFF00FFFF00FFC58C70FBF7F4FFFFFFFFFFFFFFFFFFFFFFFFE5D5D5
              A4766A9A6862935F5B9E6A64BD988FE0C4B5FAE9D0E0D0BAB8AB9AA79C8BA497
              8680504BFF00FFFF00FFFF00FFFF00FFFF00FFCB9173FBF7F4FFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFEFBFCF7F0FBF2E9FBF2E5E9D3C49E675B98665B
              95655B96655B96655B986859FF00FFFF00FFFF00FFFF00FFFF00FFCF9674FBF7
              F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFAFCF7F0FFFAEFDA
              C0B69F675BDAA16BDD984FE2903AEA8923A5686BFF00FFFF00FFFF00FFFF00FF
              FF00FFD49875FCF8F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFCFBFFFEF7DDC4BC9F675BEAB474EFA952F6A036A5686BFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFD49875FCF8F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDDC7C29F675BEAB273EFA751A5686BFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD49875FFFEFEFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2D0CE9F675BEDB572
              A5686BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCF8E68CF8E
              68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF
              8E689F675BA5686BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            ParentFont = False
          end
          object LabelUpd: TTntLabel
            Left = 681
            Top = 27
            Width = 24
            Height = 13
            Caption = #24037#24207
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LabelUpdcode: TTntLabel
            Left = 231
            Top = 16
            Width = 82
            Height = 16
            AutoSize = False
            Caption = #24037#24207#20195#34399
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object TntLabel5: TTntLabel
            Left = 352
            Top = 11
            Width = 41
            Height = 24
            Caption = '---->'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object EditInputUpd01: TTntEdit
            Left = 85
            Top = 12
            Width = 28
            Height = 21
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 2
            TabOrder = 0
          end
          object EditInputUpd02: TTntEdit
            Left = 161
            Top = 12
            Width = 28
            Height = 21
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 2
            TabOrder = 1
            OnExit = EditInputUpd02Exit
          end
          object EditFindCar2: TTntEdit
            Left = 652
            Top = 17
            Width = 29
            Height = 21
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 3
            TabOrder = 4
            OnChange = EditFindCar2Change
          end
          object EditInputUpd03: TTntEdit
            Left = 312
            Top = 13
            Width = 33
            Height = 21
            AutoSize = False
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 3
            TabOrder = 2
          end
          object EditInputUpd04: TTntEdit
            Left = 392
            Top = 13
            Width = 33
            Height = 21
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 3
            TabOrder = 3
            OnExit = EditInputUpd04Exit
          end
        end
        object TntPanel2: TTntPanel
          Left = 0
          Top = 41
          Width = 782
          Height = 417
          Align = alClient
          Caption = 'PanelUpdNote'
          TabOrder = 1
          object DBGridUpdData: TTntDBGrid
            Left = 1
            Top = 1
            Width = 780
            Height = 374
            Align = alClient
            DataSource = DataSourceUpd
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clTeal
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnTitleClick = DBGridUpdDataTitleClick
            Columns = <
              item
                Color = clWhite
                Expanded = False
                FieldName = 'part_code'
                Title.Color = clSkyBlue
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 50
                Visible = True
              end
              item
                Color = clWhite
                Expanded = False
                FieldName = 'part_grad'
                Title.Color = clSkyBlue
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 50
                Visible = True
              end
              item
                Color = clWhite
                Expanded = False
                FieldName = 'part_dept'
                Title.Color = clSkyBlue
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 50
                Visible = True
              end
              item
                Color = clWhite
                Expanded = False
                FieldName = 'part_chs'
                Title.Color = clSkyBlue
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 200
                Visible = True
              end
              item
                Color = clWhite
                Expanded = False
                FieldName = 'part_vim'
                Title.Color = clSkyBlue
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 200
                Visible = True
              end
              item
                Color = clWhite
                Expanded = False
                FieldName = 'part_eng'
                Title.Color = clSkyBlue
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 120
                Visible = True
              end>
          end
          object TntPanel1: TTntPanel
            Left = 1
            Top = 375
            Width = 780
            Height = 41
            Align = alBottom
            TabOrder = 1
            object TntSpeedButton5: TTntSpeedButton
              Left = 654
              Top = 11
              Width = 65
              Height = 27
              Caption = #20445#23384
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
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
              ParentFont = False
              OnClick = TntSpeedButton5Click
            end
            object ButtonDelete: TTntSpeedButton
              Left = 528
              Top = 11
              Width = 65
              Height = 27
              Caption = ' '#21034#38500
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              OnClick = ButtonDeleteClick
            end
          end
        end
      end
      object TabSheetAdd: TTntTabSheet
        Caption = #26032#22686
        object DBGridAddData: TTntDBGrid
          Left = 0
          Top = 99
          Width = 782
          Height = 359
          Align = alClient
          DataSource = DataSource2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clTeal
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Color = clBtnShadow
              Expanded = False
              FieldName = 'upd_user'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clInfoText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Title.Color = clSkyBlue
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Visible = False
            end
            item
              Color = clGradientInactiveCaption
              Expanded = False
              FieldName = 'upd_date'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clInfoText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Title.Color = clSkyBlue
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'part_code'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clInfoText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Title.Color = clSkyBlue
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
              FieldName = 'part_grad'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clInfoText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Title.Color = clSkyBlue
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
              FieldName = 'part_dept'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clInfoText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Title.Color = clSkyBlue
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
              FieldName = 'part_chs'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clInfoText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Title.Color = clSkyBlue
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 180
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'part_vim'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clInfoText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Title.Color = clSkyBlue
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 180
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'part_eng'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clInfoText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Title.Color = clSkyBlue
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 180
              Visible = True
            end>
        end
        object PanelAdd: TTntPanel
          Left = 0
          Top = 0
          Width = 782
          Height = 99
          Align = alTop
          AutoSize = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object LabelCode: TTntLabel
            Left = 21
            Top = 2
            Width = 52
            Height = 16
            AutoSize = False
            Caption = #24037#31278#20195#34399' '
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object LabelGrad: TTntLabel
            Left = 24
            Top = 36
            Width = 57
            Height = 16
            AutoSize = False
            Caption = #24037#31278#31561#32026
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object LabelDept: TTntLabel
            Left = 24
            Top = 77
            Width = 57
            Height = 16
            AutoSize = False
            Caption = #24037#31278#37096#38272
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object LabelCname: TTntLabel
            Left = 273
            Top = 5
            Width = 56
            Height = 16
            AutoSize = False
            Caption = #24037#31278#20013#25991
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object LabelVname: TTntLabel
            Left = 273
            Top = 33
            Width = 56
            Height = 16
            AutoSize = False
            Caption = #24037#31278#36234#25991
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object LabelEname: TTntLabel
            Left = 272
            Top = 70
            Width = 57
            Height = 16
            AutoSize = False
            Caption = #24037#31278#33521#25991
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object TntSpeedButton3: TTntSpeedButton
            Left = 712
            Top = 66
            Width = 65
            Height = 30
            Caption = #20445#23384
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
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
            ParentFont = False
            OnClick = TntSpeedButton3Click
          end
          object EditCode: TTntEdit
            Left = 80
            Top = 1
            Width = 121
            Height = 24
            ImeName = '????EXE???'
            TabOrder = 0
          end
          object DBLookupComboBox1: TTntComboBox
            Left = 80
            Top = 33
            Width = 57
            Height = 24
            ImeName = '????EXE???'
            ItemHeight = 16
            TabOrder = 1
            Items.Strings = (
              'A'
              'B'
              'C'
              'D')
          end
          object EditDept: TTntEdit
            Left = 80
            Top = 73
            Width = 121
            Height = 24
            ImeName = '????EXE???'
            TabOrder = 2
          end
          object EditCname: TTntEdit
            Left = 336
            Top = 1
            Width = 273
            Height = 24
            ImeName = '????EXE???'
            TabOrder = 3
          end
          object EditVname: TTntEdit
            Left = 336
            Top = 33
            Width = 273
            Height = 24
            ImeName = '????EXE???'
            TabOrder = 4
          end
          object EditEname: TTntEdit
            Left = 336
            Top = 65
            Width = 273
            Height = 24
            ImeName = '????EXE???'
            TabOrder = 5
          end
          object add: TTntButton
            Left = 624
            Top = 65
            Width = 75
            Height = 33
            Caption = 'add'
            TabOrder = 6
            OnClick = addClick
          end
        end
      end
    end
  end
  object DataSourceUpd: TDataSource
    DataSet = ADODataSetUpd
    Left = 225
    Top = 9
  end
  object ADOQueryGrad: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'select * from  hrd_wrkpay_grad')
    Left = 505
    Top = 9
    object ADOQueryGradgrad_code: TStringField
      FieldName = 'grad_code'
      FixedChar = True
      Size = 1
    end
    object ADOQueryGradgrad_money: TBCDField
      FieldName = 'grad_money'
      Precision = 18
      Size = 0
    end
  end
  object ADODataSetInq: TADODataSet
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    CommandText = 
      'select part_code, part_grad, part_dept, part_chs, part_vim, part' +
      '_eng from hrd_wrkpart'
    Parameters = <>
    Left = 33
    Top = 9
    object ADODataSetInqpart_code: TStringField
      FieldName = 'part_code'
      Size = 3
    end
    object ADODataSetInqpart_grad: TStringField
      FieldName = 'part_grad'
      Size = 1
    end
    object ADODataSetInqpart_dept: TStringField
      FieldName = 'part_dept'
      Size = 2
    end
    object ADODataSetInqpart_chs: TWideStringField
      FieldName = 'part_chs'
    end
    object ADODataSetInqpart_vim: TWideStringField
      FieldName = 'part_vim'
      Size = 30
    end
    object ADODataSetInqpart_eng: TWideStringField
      FieldName = 'part_eng'
      Size = 30
    end
  end
  object ADODataSetUpd: TADODataSet
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    CommandText = 
      'select part_code, part_grad, part_dept, part_chs, part_vim, part' +
      '_eng from hrd_wrkpart'
    Parameters = <>
    Left = 81
    Top = 9
  end
  object DataSourceInq: TDataSource
    DataSet = ADODataSetInq
    Left = 177
    Top = 9
  end
  object DataSource1: TDataSource
    DataSet = ADOQueryGrad
    Left = 561
    Top = 9
  end
  object ADOQuery1: TADOQuery
    Parameters = <>
    Left = 137
    Top = 17
  end
  object ADOQuery2: TADOQuery
    Connection = DMHrdsys.conn
    LockType = ltBatchOptimistic
    DataSource = DataSource1
    Parameters = <>
    SQL.Strings = (
      'SELECT *FROM  hrd_WRKPART')
    Left = 237
    Top = 257
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery2
    Left = 285
    Top = 257
  end
  object ADODataSetAdd: TADODataSet
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    CommandText = 'select  *  from  hrd_wrkpart where part_code='#39'qing'#39
    Parameters = <>
    Left = 49
    Top = 441
    object ADODataSetAddupd_user: TStringField
      FieldName = 'upd_user'
      Size = 16
    end
    object ADODataSetAddupd_date: TDateTimeField
      FieldName = 'upd_date'
    end
    object ADODataSetAddpart_code: TStringField
      FieldName = 'part_code'
      Size = 3
    end
    object ADODataSetAddpart_grad: TStringField
      FieldName = 'part_grad'
      Size = 1
    end
    object ADODataSetAddpart_dept: TStringField
      FieldName = 'part_dept'
      Size = 2
    end
    object ADODataSetAddpart_chs: TWideStringField
      FieldName = 'part_chs'
    end
    object ADODataSetAddpart_vim: TWideStringField
      FieldName = 'part_vim'
      Size = 30
    end
    object ADODataSetAddpart_eng: TWideStringField
      FieldName = 'part_eng'
      Size = 30
    end
    object ADODataSetAddgrad: TStringField
      FieldKind = fkLookup
      FieldName = 'grad'
      LookupDataSet = ADOQueryGrad
      LookupKeyFields = 'grad_code'
      LookupResultField = 'grad_code'
      KeyFields = 'part_grad'
      LookupCache = True
      Lookup = True
    end
  end
end
