object FormDut07: TFormDut07
  Left = 290
  Top = 172
  Width = 793
  Height = 530
  Caption = 'FormDut07'
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
  object TntPanel1: TTntPanel
    Left = 0
    Top = 0
    Width = 785
    Height = 33
    Align = alTop
    Caption = #21047#21345#36039#26009#25505#38598#32173#35703
    Color = clCream
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object TntPageControl1: TTntPageControl
    Left = 0
    Top = 33
    Width = 785
    Height = 463
    ActivePage = TntTabSheet3
    Align = alClient
    TabOrder = 1
    object TntTabSheet1: TTntTabSheet
      Caption = #21345#26426#36039#26009#32173#35703
      OnShow = TntTabSheet1Show
      object TntPanel2: TTntPanel
        Left = 0
        Top = 0
        Width = 777
        Height = 435
        Align = alClient
        BevelOuter = bvLowered
        Caption = 'TntPanel2'
        TabOrder = 0
        object TntGroupBox1: TTntGroupBox
          Left = 1
          Top = 1
          Width = 775
          Height = 64
          Align = alTop
          Caption = #36890#35338#21443#25976#35373#32622
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object TntLabel1: TTntLabel
            Left = 32
            Top = 32
            Width = 36
            Height = 13
            Caption = #31471#21475#65306
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object TntLabel2: TTntLabel
            Left = 160
            Top = 32
            Width = 48
            Height = 13
            Caption = #27874#29305#29575#65306
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object TntLabel3: TTntLabel
            Left = 308
            Top = 32
            Width = 48
            Height = 13
            Caption = #26657#39511#20301#65306
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object TntLabel4: TTntLabel
            Left = 571
            Top = 32
            Width = 48
            Height = 13
            Caption = #25976#25818#20301#65306
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object TntLabel5: TTntLabel
            Left = 448
            Top = 32
            Width = 48
            Height = 13
            Caption = #20572#27490#20301#65306
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object cob_Com: TTntComboBox
            Left = 80
            Top = 24
            Width = 57
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ItemIndex = 0
            ParentFont = False
            TabOrder = 0
            Text = 'COM1'
            Items.Strings = (
              'COM1'
              'COM2'
              'COM3'
              'COM4')
          end
          object TntBitBtn3: TTntBitBtn
            Left = 688
            Top = 22
            Width = 65
            Height = 25
            Caption = #35373#32622
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clDefault
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnClick = TntBitBtn3Click
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333333333333333333333333333333333FFF333333333333000333333333
              3333777FFF3FFFFF33330B000300000333337F777F777773F333000E00BFBFB0
              3333777F773333F7F333000E0BFBF0003333777F7F3337773F33000E0FBFBFBF
              0333777F7F3333FF7FFF000E0BFBF0000003777F7F3337777773000E0FBFBFBF
              BFB0777F7F33FFFFFFF7000E0BF000000003777F7FF777777773000000BFB033
              33337777773FF733333333333300033333333333337773333333333333333333
              3333333333333333333333333333333333333333333333333333333333333333
              3333333333333333333333333333333333333333333333333333}
            NumGlyphs = 2
          end
          object cob_BaudRate: TTntComboBox
            Left = 216
            Top = 24
            Width = 73
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            TabOrder = 2
            Items.Strings = (
              '110'
              '300'
              '600'
              '1200'
              '2400'
              '4800'
              '9600'
              '19200'
              '38400'
              '57600')
          end
          object cob_Parity: TTntComboBox
            Left = 365
            Top = 24
            Width = 65
            Height = 21
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            TabOrder = 3
            Items.Strings = (
              'None'
              'Odd'
              'Even')
          end
          object cob_DataBit: TTntComboBox
            Left = 624
            Top = 24
            Width = 49
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            TabOrder = 4
            Items.Strings = (
              '7'
              '8')
          end
          object cob_StopBit: TTntComboBox
            Left = 504
            Top = 24
            Width = 49
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            TabOrder = 5
            Items.Strings = (
              '0'
              '1')
          end
        end
        object TntGroupBox2: TTntGroupBox
          Left = 1
          Top = 65
          Width = 438
          Height = 369
          Align = alClient
          Caption = #21345#26426#36039#26009#32173#35703
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object sb_Add: TTntSpeedButton
            Left = 7
            Top = 296
            Width = 66
            Height = 25
            Caption = #28155#21152
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Glyph.Data = {
              E6000000424DE60000000000000076000000280000000F0000000E0000000100
              04000000000070000000130B0000130B00001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8880888888888888888088888888888888808888880008888880888888070888
              8880888888070888888088800007000088808880777777708880888000070000
              8880888888070888888088888807088888808888880008888880888888888888
              88808888888888888880}
            ParentFont = False
            OnClick = sb_AddClick
          end
          object sb_Del: TTntSpeedButton
            Left = 79
            Top = 296
            Width = 66
            Height = 25
            Caption = #21034#38500
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Glyph.Data = {
              DE000000424DDE0000000000000076000000280000000D0000000D0000000100
              0400000000006800000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
              F000FFFFFFFFFFFFF000FFFFFFFFFFFFF000FFFFFFFFFFFFF000FFFFFFFFFFFF
              F000FF000000000FF000FF0FFFFFFF0FF000FF000000000FF000FFFFFFFFFFFF
              F000FFFFFFFFFFFFF000FFFFFFFFFFFFF000FFFFFFFFFFFFF000FFFFFFFFFFFF
              F000}
            ParentFont = False
            OnClick = sb_DelClick
          end
          object sb_Save: TTntSpeedButton
            Left = 295
            Top = 296
            Width = 66
            Height = 25
            Caption = #20445#23384
            Enabled = False
            Flat = True
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
            OnClick = sb_SaveClick
          end
          object sb_post: TTntSpeedButton
            Left = 143
            Top = 296
            Width = 66
            Height = 25
            Caption = #25552#20132
            Enabled = False
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
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
            OnClick = sb_postClick
          end
          object sb_Recover: TTntSpeedButton
            Left = 223
            Top = 296
            Width = 66
            Height = 25
            Caption = #24674#24489
            Enabled = False
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              88888888888888888888870000000008888887EFEFEFEF08888887FEFEFE7E08
              888887EF00080788888887FEFEFE0078888887EF000F0B07888887FEFEFE0BB0
              788887EF0000E0BB078887FEFEFEF00BB0888777777800BB0788888888880BBB
              B0788888888870BBBB0888888888800000088888888888888888}
            ParentFont = False
            OnClick = sb_RecoverClick
          end
          object dbg_machine: TTntDBGrid
            Left = 2
            Top = 15
            Width = 434
            Height = 274
            Align = alTop
            DataSource = ds_machine
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clDefault
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clRed
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'mac_addr'
                Title.Caption = #32771#21220#26426#22320#22336
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlue
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 69
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'mac_pos'
                Title.Caption = #32771#21220#26426#20301#32622
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlue
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 164
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'mac_remark'
                Title.Caption = #20854#20182#25551#36848
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlue
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 158
                Visible = True
              end>
          end
        end
        object TntGroupBox3: TTntGroupBox
          Left = 439
          Top = 65
          Width = 337
          Height = 369
          Align = alRight
          Caption = #21345#26426#36899#32171#28204#35430
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          object mm_TestInfo: TTntMemo
            Left = 3
            Top = 16
            Width = 330
            Height = 274
            Color = clSkyBlue
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object rb_TestSingle: TTntRadioButton
            Left = 104
            Top = 300
            Width = 97
            Height = 17
            Caption = #21934#19968#21345#26426
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object rb_TestAll: TTntRadioButton
            Left = 8
            Top = 300
            Width = 81
            Height = 17
            Caption = #20840#37096#21345#26426
            Checked = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            TabStop = True
          end
          object bbtn_TestConn: TTntBitBtn
            Left = 192
            Top = 294
            Width = 65
            Height = 25
            Caption = #28204#35430
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clDefault
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            OnClick = bbtn_TestConnClick
            Glyph.Data = {
              36040000424D3604000000000000360000002800000010000000100000000100
              2000000000000004000000000000000000000000000000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF00FFFFFF0000000000FF00
              FF00FF00FF000000FF00000080000000FF00FF00FF0000000000FF00FF007F7F
              7F00000000000000000000000000FFFFFF00FFFFFF0000000000FF00FF00FF00
              FF00FF00FF000000FF00000080000000FF0000000000008080007F7F7F000000
              0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00
              FF00FF00FF000000FF00000080000000FF00008080000080800000000000FFFF
              FF000000000000000000FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00
              FF00FF00FF000000FF00000080000000FF000080800000808000000000000000
              0000FF00FF00FF00FF0000000000FFFFFF0000000000FF00FF00FF00FF00FF00
              FF00FF00FF000000FF00000080000000FF0000808000FF00FF00000000007F7F
              7F00FF00FF00FF00FF0000000000FFFFFF0000000000FF00FF00FF00FF00FF00
              FF000000FF000000FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00
              FF007F7F7F0000000000FFFFFF00000000007F7F7F00FF00FF00FF00FF000000
              00000000800000008000000080000000800000008000FF00FF00FF00FF00FF00
              FF000000000000000000000000007F7F7F00FF00FF00FF00FF00000000000080
              8000008080000080800000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000008080000080
              800000808000FF00FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF000000000000000000FF00FF00FF00FF000000000000808000008080000080
              8000FF00FF00FF00FF0000000000FF00FF00FF00FF00FF00FF00FF00FF000000
              0000FF00FF0000000000FF00FF0000000000008080000080800000808000FF00
              FF00FF00FF00FF00FF0000000000FF00FF00FF00FF00FF00FF0000000000FF00
              FF00000000000000000000000000008080000080800000808000FF00FF00FF00
              FF00FF00FF00FF00FF0000000000FF00FF00FF00FF00FF00FF00000000000000
              00000000000000000000000000000000000000808000FF00FF00FF00FF00FF00
              FF00FF00FF007F7F7F00000000007F7F7F00FF00FF00FF00FF00FF00FF00FF00
              FF000000000000000000000000000000000000000000FF00FF00FF00FF00FF00
              FF00FF00FF007F7F7F00000000007F7F7F00FF00FF00FF00FF00FF00FF00FF00
              FF0000808000000000000000000000000000000000007F7F7F00FF00FF00FF00
              FF00FF00FF007F7F7F00000000007F7F7F00FF00FF00FF00FF00FF00FF00FF00
              FF000080800000808000FF00FF00000000000000000000000000000000000000
              0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          end
          object bbtn_ClearMemo: TTntBitBtn
            Left = 264
            Top = 294
            Width = 65
            Height = 25
            Caption = #28165#31354
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clDefault
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            OnClick = bbtn_ClearMemoClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
              555557777F777555F55500000000555055557777777755F75555005500055055
              555577F5777F57555555005550055555555577FF577F5FF55555500550050055
              5555577FF77577FF555555005050110555555577F757777FF555555505099910
              555555FF75777777FF555005550999910555577F5F77777775F5500505509990
              3055577F75F77777575F55005055090B030555775755777575755555555550B0
              B03055555F555757575755550555550B0B335555755555757555555555555550
              BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
              50BB555555555555575F555555555555550B5555555555555575}
            NumGlyphs = 2
          end
        end
      end
    end
    object TntTabSheet2: TTntTabSheet
      Caption = #21047#21345#36039#26009#25505#38598
      object TntPanel3: TTntPanel
        Left = 0
        Top = 0
        Width = 777
        Height = 435
        Align = alClient
        BevelOuter = bvLowered
        Caption = 'TntPanel3'
        TabOrder = 0
        object TntGroupBox4: TTntGroupBox
          Left = 1
          Top = 1
          Width = 775
          Height = 160
          Align = alTop
          Caption = #25505#38598#35373#32622
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object TntLabel6: TTntLabel
            Left = 24
            Top = 32
            Width = 93
            Height = 13
            Caption = #25976#25818#20358#28304#26041#24335':      '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object sb_SrcFile: TTntSpeedButton
            Left = 456
            Top = 48
            Width = 23
            Height = 22
            Caption = '...'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            OnClick = sb_SrcFileClick
          end
          object TntLabel8: TTntLabel
            Left = 24
            Top = 76
            Width = 225
            Height = 17
            AutoSize = False
            Caption = #25976#25818#34389#29702#23436#30050#21518','#21407#22987#36039#26009#34389#29702#26041#24335':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object TntLabel9: TTntLabel
            Left = 24
            Top = 100
            Width = 225
            Height = 17
            AutoSize = False
            Caption = #25976#25818#20633#20221#25991#20214#36335#24465':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object sb_SavePath: TTntSpeedButton
            Left = 456
            Top = 96
            Width = 23
            Height = 22
            Caption = '...'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            OnClick = sb_SavePathClick
          end
          object lb_isdel: TTntLabel
            Left = 464
            Top = 28
            Width = 161
            Height = 13
            AutoSize = False
            Caption = #34389#29702#21518#26159#21542#21034#38500#21345#26426#20013#30340#36039#26009
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object rb_ByMch: TTntRadioButton
            Left = 128
            Top = 28
            Width = 113
            Height = 17
            BiDiMode = bdRightToLeft
            Caption = #32771#21220#26426
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentBiDiMode = False
            ParentFont = False
            TabOrder = 0
            OnClick = rb_ByMchClick
          end
          object rb_ByFile: TTntRadioButton
            Left = 128
            Top = 52
            Width = 113
            Height = 17
            BiDiMode = bdLeftToRight
            Caption = #25976#25818#25991#20214
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentBiDiMode = False
            ParentFont = False
            TabOrder = 1
            OnClick = rb_ByFileClick
          end
          object EditDataFile: TTntEdit
            Left = 248
            Top = 48
            Width = 209
            Height = 21
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object cob_DealData: TTntComboBox
            Left = 248
            Top = 72
            Width = 233
            Height = 21
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ItemIndex = 0
            ParentFont = False
            TabOrder = 3
            Text = #25505#38598#21518#20633#20221#21047#21345#36039#26009
            OnSelect = cob_DealDataSelect
            Items.Strings = (
              #25505#38598#21518#20633#20221#21047#21345#36039#26009
              #25505#38598#21518#19981#20445#23384#21047#21345#36039#26009)
          end
          object EditSavePath: TTntEdit
            Left = 248
            Top = 96
            Width = 209
            Height = 21
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
          end
          object cb_RealGet: TTntCheckBox
            Left = 24
            Top = 126
            Width = 217
            Height = 17
            Caption = #23526#26178#25505#38598
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            OnClick = rb_ByMchClick
          end
          object cob_Machine: TTntComboBox
            Left = 248
            Top = 24
            Width = 209
            Height = 21
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 0
            ParentFont = False
            TabOrder = 6
          end
          object bbtn_Start: TTntBitBtn
            Left = 248
            Top = 125
            Width = 75
            Height = 25
            Caption = #38283#22987
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 7
            OnClick = bbtn_StartClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              33333333333333333333EEEEEEEEEEEEEEE333FFFFFFFFFFFFF3E00000000000
              00E337777777777777F3E0F77777777770E337F33333333337F3E0F333333333
              70E337F3333F333337F3E0F33303333370E337F3337FF33337F3E0F333003333
              70E337F33377FF3337F3E0F33300033370E337F333777FF337F3E0F333000033
              70E337F33377773337F3E0F33300033370E337F33377733337F3E0F333003333
              70E337F33377333337F3E0F33303333370E337F33373333337F3E0F333333333
              70E337F33333333337F3E0FFFFFFFFFFF0E337FFFFFFFFFFF7F3E00000000000
              00E33777777777777733EEEEEEEEEEEEEEE33333333333333333}
            NumGlyphs = 2
          end
          object bbtn_Stop: TTntBitBtn
            Left = 336
            Top = 126
            Width = 75
            Height = 25
            Caption = #20572#27490
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 8
            OnClick = bbtn_StopClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              33333333333333333333EEEEEEEEEEEEEEE333FFFFFFFFFFFFF3E00000000000
              00E337777777777777F3E0F77777777770E337F33333333337F3E0F333333333
              70E337F33333333337F3E0F33333333370E337F333FFFFF337F3E0F330000033
              70E337F3377777F337F3E0F33000003370E337F3377777F337F3E0F330000033
              70E337F3377777F337F3E0F33000003370E337F3377777F337F3E0F330000033
              70E337F33777773337F3E0F33333333370E337F33333333337F3E0F333333333
              70E337F33333333337F3E0FFFFFFFFFFF0E337FFFFFFFFFFF7F3E00000000000
              00E33777777777777733EEEEEEEEEEEEEEE33333333333333333}
            NumGlyphs = 2
          end
          object bbtn_Clear: TTntBitBtn
            Left = 440
            Top = 126
            Width = 97
            Height = 25
            Caption = #28165#31354#23631#24149
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 9
            OnClick = bbtn_ClearClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
              555557777F777555F55500000000555055557777777755F75555005500055055
              555577F5777F57555555005550055555555577FF577F5FF55555500550050055
              5555577FF77577FF555555005050110555555577F757777FF555555505099910
              555555FF75777777FF555005550999910555577F5F77777775F5500505509990
              3055577F75F77777575F55005055090B030555775755777575755555555550B0
              B03055555F555757575755550555550B0B335555755555757555555555555550
              BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
              50BB555555555555575F555555555555550B5555555555555575}
            NumGlyphs = 2
          end
          object cob_isdel: TTntComboBox
            Left = 631
            Top = 22
            Width = 42
            Height = 21
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ItemIndex = 0
            ParentFont = False
            TabOrder = 10
            Text = #26159
            Items.Strings = (
              #26159
              #21542)
          end
        end
        object TntGroupBox5: TTntGroupBox
          Left = 1
          Top = 161
          Width = 775
          Height = 273
          Align = alClient
          Caption = #32771#21220#36039#26009#26126#32048
          TabOrder = 1
          object dbg_DutDtl: TTntDBGrid
            Left = 2
            Top = 15
            Width = 771
            Height = 256
            Align = alClient
            DataSource = ds_DutDtl
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'spc_id'
                Title.Caption = #21345#34399
                Width = 98
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'user_id'
                Title.Caption = #21729#24037#24037#34399
                Width = 72
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'user_name'
                Title.Caption = #21729#24037#22995#21517
                Width = 74
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'user_dept'
                Title.Caption = #37096#38272
                Width = 206
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'trt_date'
                Title.Caption = #21047#21345#26085#26399
                Width = 103
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'trt_time'
                Title.Caption = #21047#21345#26178#38291
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'trt_addr'
                Title.Caption = #21345#26426#22320#22336
                Visible = True
              end>
          end
        end
      end
    end
    object TntTabSheet3: TTntTabSheet
      Caption = #21047#21345#36039#26009#26597#35426
      object TntPanel4: TTntPanel
        Left = 0
        Top = 0
        Width = 777
        Height = 435
        Align = alClient
        BevelOuter = bvLowered
        Caption = 'TntPanel4'
        TabOrder = 0
        object TntGroupBox6: TTntGroupBox
          Left = 1
          Top = 1
          Width = 775
          Height = 72
          Align = alTop
          Caption = #26597#35426#26781#20214
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object TntLabel7: TTntLabel
            Left = 30
            Top = 18
            Width = 48
            Height = 13
            Caption = #32771#21220#26085#26399
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object sb_Emp: TTntSpeedButton
            Left = 161
            Top = 40
            Width = 23
            Height = 22
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            OnClick = sb_EmpClick
          end
          object dtp_DutDay: TTntDateTimePicker
            Left = 96
            Top = 13
            Width = 89
            Height = 21
            Date = 0.380243587962468200
            Time = 0.380243587962468200
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object cob_DeptBeg: TTntComboBox
            Left = 280
            Top = 40
            Width = 169
            Height = 21
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            TabOrder = 1
          end
          object cob_DeptEnd: TTntComboBox
            Left = 450
            Top = 40
            Width = 169
            Height = 21
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            TabOrder = 2
          end
          object cb_Mach: TTntCheckBox
            Left = 216
            Top = 18
            Width = 65
            Height = 17
            Caption = #32771#21220#26426
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
          object cob_QryMch: TTntComboBox
            Left = 280
            Top = 13
            Width = 169
            Height = 21
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            TabOrder = 4
          end
          object bbtn_ConfirmQry: TTntBitBtn
            Left = 656
            Top = 12
            Width = 75
            Height = 25
            Caption = #30906#23450
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            OnClick = bbtn_ConfirmQryClick
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
          object cb_Dept: TTntCheckBox
            Left = 216
            Top = 45
            Width = 57
            Height = 17
            Caption = #37096#38272
            Checked = True
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            State = cbChecked
            TabOrder = 6
          end
          object cb_Emp: TTntCheckBox
            Left = 13
            Top = 45
            Width = 97
            Height = 17
            Caption = #21729#24037#24037#34399
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 7
          end
          object EditEmp: TTntEdit
            Left = 96
            Top = 40
            Width = 64
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 6
            ParentFont = False
            TabOrder = 8
          end
          object bbtn_Reset: TTntBitBtn
            Left = 656
            Top = 40
            Width = 75
            Height = 25
            Caption = #37325#32622
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 9
            OnClick = bbtn_ResetClick
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
        end
        object TntGroupBox7: TTntGroupBox
          Left = 1
          Top = 73
          Width = 775
          Height = 320
          Align = alClient
          Caption = #21047#21345#36039#26009#26126#32048
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object dbg_TrtQry: TTntDBGrid
            Left = 2
            Top = 15
            Width = 771
            Height = 303
            Align = alClient
            DataSource = ds_TrtQry
            FixedColor = clSkyBlue
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clRed
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnTitleClick = dbg_TrtQryTitleClick
            Columns = <
              item
                Expanded = False
                FieldName = 'emp_id'
                Title.Caption = #21729#24037#24037#34399
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'emp_chs'
                Title.Caption = #21729#24037#22995#21517
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'dept_code'
                Title.Caption = #37096#38272#20195#34399
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 67
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'abbr_titl'
                Title.Caption = #37096#38272#31777#31281
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 157
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'spc_id'
                Title.Caption = #35672#21029#21345#34399
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 81
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'trt_date'
                Title.Caption = #21047#21345#26085#26399
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 90
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'trt_time'
                Title.Caption = #21047#21345#26178#38291
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 77
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'trt_station'
                Title.Caption = #21345#26426#22320#22336
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 53
                Visible = True
              end>
          end
        end
        object TntPanel6: TTntPanel
          Left = 1
          Top = 393
          Width = 775
          Height = 41
          Align = alBottom
          TabOrder = 2
          object TntBitBtn2: TTntBitBtn
            Left = 320
            Top = 8
            Width = 75
            Height = 25
            Caption = #25171#21360
            TabOrder = 0
            OnClick = TntBitBtn2Click
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
          object TntBitBtn4: TTntBitBtn
            Left = 400
            Top = 8
            Width = 75
            Height = 25
            Caption = #38364#38281
            TabOrder = 1
            Visible = False
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
          end
        end
      end
    end
    object TntTabSheet4: TTntTabSheet
      Caption = #21047#21345#36039#26009#21034#38500
      object TntPanel5: TTntPanel
        Left = 0
        Top = 0
        Width = 777
        Height = 435
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 0
        object TntGroupBox8: TTntGroupBox
          Left = 1
          Top = 1
          Width = 775
          Height = 104
          Align = alTop
          Caption = #36984#25799#35201#21034#38500#30340#36039#26009
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object TntLabel12: TTntLabel
            Left = 200
            Top = 22
            Width = 24
            Height = 13
            Caption = '____'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object TntSpeedButton1: TTntSpeedButton
            Left = 648
            Top = 24
            Width = 25
            Height = 22
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object TntLabel14: TTntLabel
            Left = 224
            Top = 56
            Width = 3
            Height = 13
          end
          object TntLabel13: TTntLabel
            Left = 680
            Top = 32
            Width = 90
            Height = 13
            Caption = '('#24453#25844#23637#65292#26410#23526#29694')'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object TntLabel10: TTntLabel
            Left = 24
            Top = 29
            Width = 51
            Height = 13
            Caption = #26085#26399#31684#22285':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object TntBitBtn1: TTntBitBtn
            Left = 16
            Top = 61
            Width = 75
            Height = 25
            Caption = #21034#38500
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnClick = TntBitBtn1Click
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              333333333333333333FF33333333333330003333333333333777333333333333
              300033FFFFFF3333377739999993333333333777777F3333333F399999933333
              3300377777733333337733333333333333003333333333333377333333333333
              3333333333333333333F333333333333330033333F33333333773333C3333333
              330033337F3333333377333CC3333333333333F77FFFFFFF3FF33CCCCCCCCCC3
              993337777777777F77F33CCCCCCCCCC399333777777777737733333CC3333333
              333333377F33333333FF3333C333333330003333733333333777333333333333
              3000333333333333377733333333333333333333333333333333}
            NumGlyphs = 2
          end
          object dtp_DelDateBeg: TTntDateTimePicker
            Left = 104
            Top = 24
            Width = 89
            Height = 21
            Date = 38596.422033946760000000
            Time = 38596.422033946760000000
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object dtp_DelDateEnd: TTntDateTimePicker
            Left = 234
            Top = 24
            Width = 89
            Height = 21
            Date = 38596.422108275470000000
            Time = 38596.422108275470000000
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object TntCheckBox1: TTntCheckBox
            Left = 392
            Top = 32
            Width = 97
            Height = 17
            Caption = #20633#20221#36039#26009#21040
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
          object TntEdit1: TTntEdit
            Left = 480
            Top = 24
            Width = 169
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
          end
          object TntBitBtn5: TTntBitBtn
            Left = 104
            Top = 61
            Width = 121
            Height = 25
            Caption = #28165#31354#21034#38500#20449#24687
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            OnClick = TntBitBtn5Click
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
              555557777F777555F55500000000555055557777777755F75555005500055055
              555577F5777F57555555005550055555555577FF577F5FF55555500550050055
              5555577FF77577FF555555005050110555555577F757777FF555555505099910
              555555FF75777777FF555005550999910555577F5F77777775F5500505509990
              3055577F75F77777575F55005055090B030555775755777575755555555550B0
              B03055555F555757575755550555550B0B335555755555757555555555555550
              BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
              50BB555555555555575F555555555555550B5555555555555575}
            NumGlyphs = 2
          end
        end
        object TntGroupBox9: TTntGroupBox
          Left = 1
          Top = 105
          Width = 775
          Height = 329
          Align = alClient
          Caption = #21034#38500#20449#24687
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object TntMemo1: TTntMemo
            Left = 2
            Top = 15
            Width = 771
            Height = 312
            Align = alClient
            BevelInner = bvLowered
            BevelKind = bkSoft
            BevelOuter = bvNone
            BorderStyle = bsNone
            Color = clSkyBlue
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
        end
      end
    end
  end
  object qry_machine: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterInsert = qry_machineAfterInsert
    AfterEdit = qry_machineAfterEdit
    AfterPost = qry_machineAfterPost
    AfterCancel = qry_machineAfterCancel
    AfterDelete = qry_machineAfterDelete
    Parameters = <>
    SQL.Strings = (
      'select * from hrd_dut_machine')
    Left = 5
    Top = 10
    object qry_machinemac_addr: TStringField
      FieldName = 'mac_addr'
      FixedChar = True
      Size = 1
    end
    object qry_machinemac_pos: TWideStringField
      FieldName = 'mac_pos'
      Size = 50
    end
    object qry_machinemac_remark: TWideStringField
      FieldName = 'mac_remark'
      Size = 50
    end
  end
  object ds_machine: TDataSource
    DataSet = qry_machine
    Left = 37
    Top = 10
  end
  object OpenDialog: TTntOpenDialog
    Left = 101
    Top = 10
  end
  object cmd_Temp: TADOCommand
    Connection = DMHrdsys.conn
    Parameters = <>
    Left = 208
    Top = 8
  end
  object qry_Temp: TADOQuery
    Connection = DMHrdsys.conn
    Parameters = <>
    Left = 237
    Top = 10
  end
  object ds_DutDtl: TDataSource
    DataSet = qry_tmp
    Left = 165
    Top = 10
  end
  object qry_TrtQry: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    AfterScroll = qry_TrtQryAfterScroll
    Parameters = <>
    Left = 469
    Top = 10
  end
  object ds_TrtQry: TDataSource
    DataSet = qry_TrtQry
    Left = 501
    Top = 10
  end
  object qry_Del: TADOQuery
    Connection = DMHrdsys.conn
    Parameters = <>
    Left = 560
    Top = 8
  end
  object qry_tmp: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterScroll = cds_DutDtlAfterScroll
    Parameters = <>
    SQL.Strings = (
      'select '
      'b.spc_id,'
      'a.emp_id as user_id,'
      'a.emp_chs as user_name,'
      'a.dept_code as user_dept,'
      'b.trt_date,'
      'b.trt_time,'
      'b.trt_station as trt_addr '
      'from hrd_emp a,hrd_dut_trt b '
      'where 1<0')
    Left = 624
    Top = 8
    object qry_tmpspc_id: TStringField
      FieldName = 'spc_id'
      Size = 10
    end
    object qry_tmpuser_id: TStringField
      FieldName = 'user_id'
      Size = 6
    end
    object qry_tmpuser_name: TWideStringField
      FieldName = 'user_name'
      Size = 10
    end
    object qry_tmpuser_dept: TStringField
      FieldName = 'user_dept'
      Size = 6
    end
    object qry_tmptrt_date: TDateTimeField
      FieldName = 'trt_date'
    end
    object qry_tmptrt_time: TStringField
      FieldName = 'trt_time'
      FixedChar = True
      Size = 8
    end
    object qry_tmptrt_addr: TStringField
      FieldName = 'trt_addr'
      Size = 1
    end
  end
end
