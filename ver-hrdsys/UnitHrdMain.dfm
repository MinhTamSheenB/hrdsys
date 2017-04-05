object hrdMainForm: ThrdMainForm
  Left = 236
  Top = 101
  Width = 808
  Height = 620
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  Caption = 'Hrdsys'
  Color = clBtnFace
  DefaultMonitor = dmDesktop
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  OnClose = TntFormClose
  OnCreate = FormCreate
  OnKeyDown = TntFormKeyDown
  DesignSize = (
    792
    561)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 540
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel2'
    TabOrder = 0
    object PageControl1: TTntPageControl
      Left = 0
      Top = 0
      Width = 792
      Height = 540
      ActivePage = SheetMain
      Align = alClient
      PopupMenu = PopupMenu1
      TabOrder = 0
      TabPosition = tpBottom
      OnChange = PageControl1Change
      object SheetMain: TTntTabSheet
        Caption = #23376#30059#38754
        OnHide = SheetMainHide
        OnShow = SheetMainShow
        object TntPanel1: TTntPanel
          Left = 0
          Top = 0
          Width = 784
          Height = 67
          Align = alTop
          Color = 3972607
          TabOrder = 0
          object Label1: TLabel
            Left = 1
            Top = 33
            Width = 782
            Height = 33
            Align = alClient
            Alignment = taCenter
            Caption = 'SHEEN BRIDGE CO., LTD.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBackground
            Font.Height = -24
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label2: TLabel
            Left = 1
            Top = 1
            Width = 782
            Height = 32
            Align = alTop
            Alignment = taCenter
            AutoSize = False
            Caption = #38918#20625#36012#20219#26377#38480#20844#21496
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBackground
            Font.Height = -27
            Font.Name = #27161#26999#39636
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlBottom
          end
        end
        object TntPanel2: TTntPanel
          Left = 0
          Top = 67
          Width = 784
          Height = 447
          Align = alClient
          Caption = 'TntPanel2'
          TabOrder = 1
          object TntPageControl1: TTntPageControl
            Left = 1
            Top = 1
            Width = 782
            Height = 445
            ActivePage = TntTabSheet8
            Align = alClient
            TabOrder = 0
            TabPosition = tpBottom
            object TntTabSheet7: TTntTabSheet
              Caption = 'syshrd'
              object TntGroupBox1: TTntGroupBox
                Left = 128
                Top = 8
                Width = 505
                Height = 249
                Caption = 'maint._area'
                Color = clBtnFace
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMaroon
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentColor = False
                ParentFont = False
                TabOrder = 0
                object Formhrd07: TTntStaticText
                  Left = 16
                  Top = 184
                  Width = 89
                  Height = 41
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = 'btn_hrd07'
                  TabOrder = 0
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
                object Formhrd12: TTntStaticText
                  Left = 144
                  Top = 184
                  Width = 89
                  Height = 41
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = 'btn_hrd12'
                  TabOrder = 1
                  OnDblClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
                object FormHrd10: TTntStaticText
                  Left = 264
                  Top = 184
                  Width = 89
                  Height = 41
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = 'btn_hrd10'
                  TabOrder = 2
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
                object Formhrd11: TTntStaticText
                  Left = 392
                  Top = 184
                  Width = 89
                  Height = 41
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = 'btn_hrd11'
                  TabOrder = 3
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
                object Formhrd17: TTntStaticText
                  Left = 208
                  Top = 40
                  Width = 89
                  Height = 41
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = 'btn_hrd17'
                  TabOrder = 4
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
                object TntPanel3: TTntPanel
                  Left = 64
                  Top = 143
                  Width = 373
                  Height = 1
                  BevelOuter = bvNone
                  Caption = 'TntPanel1'
                  Color = clBlack
                  TabOrder = 5
                end
                object TntPanel4: TTntPanel
                  Left = 63
                  Top = 143
                  Width = 1
                  Height = 42
                  BevelOuter = bvNone
                  Caption = 'TntPanel2'
                  Color = clBlack
                  TabOrder = 6
                end
                object TntPanel5: TTntPanel
                  Left = 190
                  Top = 143
                  Width = 1
                  Height = 42
                  BevelOuter = bvNone
                  Caption = 'TntPanel2'
                  Color = clBlack
                  TabOrder = 7
                end
                object TntPanel6: TTntPanel
                  Left = 311
                  Top = 143
                  Width = 1
                  Height = 42
                  BevelOuter = bvNone
                  Caption = 'TntPanel2'
                  Color = clBlack
                  TabOrder = 8
                end
                object TntPanel7: TTntPanel
                  Left = 437
                  Top = 143
                  Width = 1
                  Height = 42
                  BevelOuter = bvNone
                  Caption = 'TntPanel2'
                  Color = clBlack
                  TabOrder = 9
                end
                object TntPanel8: TTntPanel
                  Left = 252
                  Top = 81
                  Width = 1
                  Height = 63
                  BevelOuter = bvNone
                  Caption = 'TntPanel2'
                  Color = clBlack
                  TabOrder = 10
                end
              end
              object TntGroupBox2: TTntGroupBox
                Left = 128
                Top = 264
                Width = 505
                Height = 89
                Caption = 'reports_area'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                object Formhrd14: TTntStaticText
                  Left = 168
                  Top = 24
                  Width = 120
                  Height = 41
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = 'btn_hrd14'
                  TabOrder = 0
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
                object FormHrd13: TTntStaticText
                  Left = 32
                  Top = 24
                  Width = 120
                  Height = 41
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = 'btn_hrd13'
                  TabOrder = 1
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
              end
            end
            object TntTabSheet8: TTntTabSheet
              Caption = 'sysdut'
              object TntGroupBox3: TTntGroupBox
                Left = 112
                Top = 16
                Width = 530
                Height = 249
                Caption = 'maint._area'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clPurple
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                object FormDut05: TTntStaticText
                  Left = 132
                  Top = 185
                  Width = 89
                  Height = 35
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = 'btn_dut05'
                  TabOrder = 0
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
                object FormDut10: TTntStaticText
                  Left = 268
                  Top = 185
                  Width = 89
                  Height = 35
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = 'btn_dut10'
                  TabOrder = 1
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
                object FormDut06: TTntStaticText
                  Left = 408
                  Top = 182
                  Width = 88
                  Height = 36
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = 'btn_dut06'
                  TabOrder = 2
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
                object FormDut08: TTntStaticText
                  Left = 128
                  Top = 101
                  Width = 95
                  Height = 36
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = 'btn_dut08'
                  TabOrder = 3
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
                object TntPanel9: TTntPanel
                  Left = 60
                  Top = 158
                  Width = 391
                  Height = 1
                  BevelOuter = bvNone
                  Caption = 'TntPanel1'
                  Color = clBlack
                  TabOrder = 4
                end
                object TntPanel10: TTntPanel
                  Left = 59
                  Top = 159
                  Width = 1
                  Height = 26
                  BevelOuter = bvNone
                  Caption = 'TntPanel2'
                  Color = clBlack
                  TabOrder = 5
                end
                object TntPanel11: TTntPanel
                  Left = 176
                  Top = 159
                  Width = 1
                  Height = 25
                  BevelOuter = bvNone
                  Caption = 'TntPanel2'
                  Color = clBlack
                  TabOrder = 6
                end
                object TntPanel12: TTntPanel
                  Left = 312
                  Top = 159
                  Width = 1
                  Height = 26
                  BevelOuter = bvNone
                  Caption = 'TntPanel2'
                  Color = clBlack
                  TabOrder = 7
                end
                object TntPanel13: TTntPanel
                  Left = 451
                  Top = 158
                  Width = 1
                  Height = 24
                  BevelOuter = bvNone
                  Caption = 'TntPanel2'
                  Color = clBlack
                  TabOrder = 8
                end
                object TntPanel14: TTntPanel
                  Left = 176
                  Top = 137
                  Width = 1
                  Height = 20
                  BevelOuter = bvNone
                  Caption = 'TntPanel2'
                  Color = clBlack
                  TabOrder = 9
                end
                object FormDut01: TTntStaticText
                  Left = 16
                  Top = 24
                  Width = 89
                  Height = 35
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = 'btn_dut01'
                  TabOrder = 10
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
                object FormDut03: TTntStaticText
                  Left = 137
                  Top = 24
                  Width = 89
                  Height = 35
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = 'btn_dut03'
                  TabOrder = 11
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
                object FormDut02: TTntStaticText
                  Left = 263
                  Top = 24
                  Width = 89
                  Height = 35
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = 'btn_dut02'
                  TabOrder = 12
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
                object FormDut04: TTntStaticText
                  Left = 400
                  Top = 24
                  Width = 89
                  Height = 35
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = 'btn_dut04'
                  TabOrder = 13
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
                object FormDut07: TTntStaticText
                  Left = 15
                  Top = 187
                  Width = 89
                  Height = 35
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = 'btn_dut07'
                  TabOrder = 14
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
                object TntPanel15: TTntPanel
                  Left = 56
                  Top = 79
                  Width = 396
                  Height = 1
                  BevelOuter = bvNone
                  Caption = 'TntPanel1'
                  Color = clBlack
                  TabOrder = 15
                end
                object TntPanel16: TTntPanel
                  Left = 178
                  Top = 80
                  Width = 1
                  Height = 20
                  BevelOuter = bvNone
                  Caption = 'TntPanel2'
                  Color = clBlack
                  TabOrder = 16
                end
                object TntPanel17: TTntPanel
                  Left = 56
                  Top = 59
                  Width = 1
                  Height = 20
                  BevelOuter = bvNone
                  Caption = 'TntPanel2'
                  Color = clBlack
                  TabOrder = 17
                end
                object TntPanel18: TTntPanel
                  Left = 451
                  Top = 59
                  Width = 1
                  Height = 20
                  BevelOuter = bvNone
                  Caption = 'TntPanel2'
                  Color = clBlack
                  TabOrder = 18
                end
                object TntPanel19: TTntPanel
                  Left = 308
                  Top = 59
                  Width = 1
                  Height = 20
                  BevelOuter = bvNone
                  Caption = 'TntPanel2'
                  Color = clBlack
                  TabOrder = 19
                end
                object TntPanel20: TTntPanel
                  Left = 178
                  Top = 58
                  Width = 1
                  Height = 20
                  BevelOuter = bvNone
                  Caption = 'TntPanel2'
                  Color = clBlack
                  TabOrder = 20
                end
                object TntPanel21: TTntPanel
                  Left = 224
                  Top = 116
                  Width = 30
                  Height = 1
                  BevelOuter = bvNone
                  Caption = 'TntPanel1'
                  Color = clBlack
                  TabOrder = 21
                end
                object FormDut13: TTntStaticText
                  Left = 254
                  Top = 101
                  Width = 91
                  Height = 36
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = 'btn_dut13'
                  TabOrder = 22
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
                object FormDut20: TTntStaticText
                  Left = 375
                  Top = 101
                  Width = 89
                  Height = 36
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = 'btn_dut20'
                  TabOrder = 23
                  Visible = False
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
                object TntPanel22: TTntPanel
                  Left = 343
                  Top = 118
                  Width = 30
                  Height = 1
                  BevelOuter = bvNone
                  Caption = 'TntPanel1'
                  Color = clBlack
                  TabOrder = 24
                  Visible = False
                end
              end
              object TntGroupBox4: TTntGroupBox
                Left = 112
                Top = 268
                Width = 530
                Height = 89
                Caption = 'reports_area'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                object FormDut16: TTntStaticText
                  Left = 144
                  Top = 24
                  Width = 120
                  Height = 18
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = 'btn_dut16'
                  TabOrder = 0
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
                object FormDut12: TTntStaticText
                  Left = 8
                  Top = 24
                  Width = 129
                  Height = 17
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = 'btn_dut11'
                  TabOrder = 1
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
                object FormDut21: TTntStaticText
                  Left = 8
                  Top = 56
                  Width = 129
                  Height = 17
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = 'btn_dut21'
                  TabOrder = 2
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
                object FormDut18: TTntStaticText
                  Left = 144
                  Top = 56
                  Width = 120
                  Height = 17
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = 'btn_dut18'
                  TabOrder = 3
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
                object FormDut19: TTntStaticText
                  Left = 400
                  Top = 24
                  Width = 120
                  Height = 17
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BiDiMode = bdLeftToRight
                  BorderStyle = sbsSingle
                  Caption = 'btn_dut19'
                  ParentBiDiMode = False
                  TabOrder = 4
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
                object FormDut17: TTntStaticText
                  Left = 272
                  Top = 24
                  Width = 120
                  Height = 17
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = 'btn_dut17'
                  TabOrder = 5
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
                object FormDut14: TTntStaticText
                  Left = 272
                  Top = 56
                  Width = 120
                  Height = 17
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = 'btn_dut14'
                  TabOrder = 6
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
                object TntStaticText26: TTntStaticText
                  Left = 401
                  Top = 57
                  Width = 120
                  Height = 17
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = 'btn_other'
                  TabOrder = 7
                end
              end
            end
            object TntTabSheet9: TTntTabSheet
              Caption = 'syssal'
              object TntGroupBox5: TTntGroupBox
                Left = 124
                Top = 12
                Width = 506
                Height = 249
                Caption = 'maint._area'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clPurple
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                object FormSal01: TTntStaticText
                  Left = 19
                  Top = 168
                  Width = 89
                  Height = 41
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = 'btn_sal01'
                  TabOrder = 0
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
                object FormSal04: TTntStaticText
                  Left = 144
                  Top = 168
                  Width = 89
                  Height = 41
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = 'btn_sal04'
                  TabOrder = 1
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
                object FormSal06: TTntStaticText
                  Left = 266
                  Top = 169
                  Width = 89
                  Height = 41
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = 'btn_sal06'
                  TabOrder = 2
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
                object FormSal03: TTntStaticText
                  Left = 394
                  Top = 170
                  Width = 89
                  Height = 41
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = 'btn_sal03'
                  TabOrder = 3
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
                object FormSal08: TTntStaticText
                  Left = 146
                  Top = 55
                  Width = 89
                  Height = 41
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = 'btn_sal08'
                  TabOrder = 4
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
                object TntPanel23: TTntPanel
                  Left = 65
                  Top = 129
                  Width = 373
                  Height = 1
                  BevelOuter = bvNone
                  Caption = 'TntPanel1'
                  Color = clBlack
                  TabOrder = 5
                  object TntPanel24: TTntPanel
                    Left = 0
                    Top = 0
                    Width = 373
                    Height = 1
                    BevelOuter = bvNone
                    Caption = 'TntPanel1'
                    Color = clBlack
                    TabOrder = 0
                  end
                end
                object TntPanel25: TTntPanel
                  Left = 64
                  Top = 130
                  Width = 1
                  Height = 37
                  BevelOuter = bvNone
                  Caption = 'TntPanel2'
                  Color = clBlack
                  TabOrder = 6
                end
                object TntPanel26: TTntPanel
                  Left = 190
                  Top = 128
                  Width = 1
                  Height = 41
                  BevelOuter = bvNone
                  Caption = 'TntPanel2'
                  Color = clBlack
                  TabOrder = 7
                end
                object TntPanel27: TTntPanel
                  Left = 311
                  Top = 130
                  Width = 1
                  Height = 40
                  BevelOuter = bvNone
                  Caption = 'TntPanel2'
                  Color = clBlack
                  TabOrder = 8
                end
                object TntPanel28: TTntPanel
                  Left = 438
                  Top = 130
                  Width = 1
                  Height = 40
                  BevelOuter = bvNone
                  Caption = 'TntPanel2'
                  Color = clBlack
                  TabOrder = 9
                end
                object TntPanel29: TTntPanel
                  Left = 190
                  Top = 95
                  Width = 1
                  Height = 33
                  BevelOuter = bvNone
                  Caption = 'TntPanel2'
                  Color = clBlack
                  TabOrder = 10
                end
                object TntPanel30: TTntPanel
                  Left = 235
                  Top = 73
                  Width = 60
                  Height = 1
                  BevelOuter = bvNone
                  Caption = 'TntPanel1'
                  Color = clBlack
                  TabOrder = 11
                end
                object FormSal09: TTntStaticText
                  Left = 296
                  Top = 53
                  Width = 89
                  Height = 41
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = 'btn_sal09'
                  TabOrder = 12
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
              end
              object TntGroupBox6: TTntGroupBox
                Left = 126
                Top = 260
                Width = 502
                Height = 86
                Caption = 'reports_area'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                object FormSal10: TTntStaticText
                  Left = 64
                  Top = 27
                  Width = 120
                  Height = 38
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = 'btn_sal10'
                  TabOrder = 0
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
                object FormSal11: TTntStaticText
                  Left = 192
                  Top = 27
                  Width = 120
                  Height = 38
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = 'btn_sal11'
                  TabOrder = 1
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
                object FormSal12: TTntStaticText
                  Left = 320
                  Top = 27
                  Width = 120
                  Height = 38
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = 'btn_sal12'
                  TabOrder = 2
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
              end
            end
            object TntTabSheet12: TTntTabSheet
              Caption = 'sysmed'
              object TntGroupBox7: TTntGroupBox
                Left = 112
                Top = 10
                Width = 505
                Height = 249
                Caption = 'maint._area'
                Color = clBtnFace
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clPurple
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentColor = False
                ParentFont = False
                TabOrder = 0
                object Formmed08: TTntStaticText
                  Left = 132
                  Top = 185
                  Width = 89
                  Height = 35
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = 'btn_med08'
                  TabOrder = 0
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
                object TntStaticText37: TTntStaticText
                  Left = 268
                  Top = 185
                  Width = 89
                  Height = 35
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = '                                     '#24235#23384#26376#32080
                  TabOrder = 1
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
                object TntStaticText38: TTntStaticText
                  Left = 408
                  Top = 182
                  Width = 88
                  Height = 36
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = '                                     '#20854#20182#32173#35703
                  TabOrder = 2
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
                object TntStaticText39: TTntStaticText
                  Left = 134
                  Top = 101
                  Width = 89
                  Height = 36
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = '                                     '#34277#21697#29376#27841
                  TabOrder = 3
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
                object TntPanel31: TTntPanel
                  Left = 60
                  Top = 158
                  Width = 391
                  Height = 1
                  BevelOuter = bvNone
                  Caption = 'TntPanel1'
                  Color = clBlack
                  TabOrder = 4
                end
                object TntPanel32: TTntPanel
                  Left = 59
                  Top = 159
                  Width = 1
                  Height = 26
                  BevelOuter = bvNone
                  Caption = 'TntPanel2'
                  Color = clBlack
                  TabOrder = 5
                end
                object TntPanel33: TTntPanel
                  Left = 176
                  Top = 159
                  Width = 1
                  Height = 25
                  BevelOuter = bvNone
                  Caption = 'TntPanel2'
                  Color = clBlack
                  TabOrder = 6
                end
                object TntPanel34: TTntPanel
                  Left = 312
                  Top = 159
                  Width = 1
                  Height = 26
                  BevelOuter = bvNone
                  Caption = 'TntPanel2'
                  Color = clBlack
                  TabOrder = 7
                end
                object TntPanel35: TTntPanel
                  Left = 451
                  Top = 158
                  Width = 1
                  Height = 24
                  BevelOuter = bvNone
                  Caption = 'TntPanel2'
                  Color = clBlack
                  TabOrder = 8
                end
                object TntPanel36: TTntPanel
                  Left = 176
                  Top = 137
                  Width = 1
                  Height = 20
                  BevelOuter = bvNone
                  Caption = 'TntPanel2'
                  Color = clBlack
                  TabOrder = 9
                end
                object Formmed01: TTntStaticText
                  Left = 16
                  Top = 24
                  Width = 97
                  Height = 35
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = 'btn_med01'
                  TabOrder = 10
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
                object Formmed02: TTntStaticText
                  Left = 137
                  Top = 24
                  Width = 89
                  Height = 35
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = 'btn_med02'
                  TabOrder = 11
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
                object Formmed05: TTntStaticText
                  Left = 263
                  Top = 24
                  Width = 89
                  Height = 35
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = 'btn_med05'
                  TabOrder = 12
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
                object Formmed06: TTntStaticText
                  Left = 400
                  Top = 24
                  Width = 89
                  Height = 35
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = 'btn_med06'
                  TabOrder = 13
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
                object Formmed04: TTntStaticText
                  Left = 15
                  Top = 187
                  Width = 89
                  Height = 35
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = 'btn_med04'
                  TabOrder = 14
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
                object TntPanel37: TTntPanel
                  Left = 56
                  Top = 79
                  Width = 396
                  Height = 1
                  BevelOuter = bvNone
                  Caption = 'TntPanel1'
                  Color = clBlack
                  TabOrder = 15
                end
                object TntPanel38: TTntPanel
                  Left = 178
                  Top = 80
                  Width = 1
                  Height = 20
                  BevelOuter = bvNone
                  Caption = 'TntPanel2'
                  Color = clBlack
                  TabOrder = 16
                end
                object TntPanel39: TTntPanel
                  Left = 56
                  Top = 59
                  Width = 1
                  Height = 20
                  BevelOuter = bvNone
                  Caption = 'TntPanel2'
                  Color = clBlack
                  TabOrder = 17
                end
                object TntPanel40: TTntPanel
                  Left = 451
                  Top = 59
                  Width = 1
                  Height = 20
                  BevelOuter = bvNone
                  Caption = 'TntPanel2'
                  Color = clBlack
                  TabOrder = 18
                end
                object TntPanel41: TTntPanel
                  Left = 308
                  Top = 59
                  Width = 1
                  Height = 20
                  BevelOuter = bvNone
                  Caption = 'TntPanel2'
                  Color = clBlack
                  TabOrder = 19
                end
                object TntPanel42: TTntPanel
                  Left = 178
                  Top = 58
                  Width = 1
                  Height = 20
                  BevelOuter = bvNone
                  Caption = 'TntPanel2'
                  Color = clBlack
                  TabOrder = 20
                end
                object TntPanel43: TTntPanel
                  Left = 224
                  Top = 116
                  Width = 30
                  Height = 1
                  BevelOuter = bvNone
                  Caption = 'TntPanel1'
                  Color = clBlack
                  TabOrder = 21
                end
                object TntStaticText45: TTntStaticText
                  Left = 254
                  Top = 101
                  Width = 89
                  Height = 36
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = '                                     '#35386#26039#38283#26041
                  TabOrder = 22
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
                object TntStaticText46: TTntStaticText
                  Left = 375
                  Top = 101
                  Width = 89
                  Height = 36
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = '                                     '#38936#34277#30331#35352
                  TabOrder = 23
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
                object TntPanel44: TTntPanel
                  Left = 343
                  Top = 118
                  Width = 30
                  Height = 1
                  BevelOuter = bvNone
                  Caption = 'TntPanel1'
                  Color = clBlack
                  TabOrder = 24
                end
              end
              object TntGroupBox8: TTntGroupBox
                Left = 112
                Top = 268
                Width = 505
                Height = 89
                Caption = 'reports_area'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                object Formmed09: TTntStaticText
                  Left = 144
                  Top = 24
                  Width = 111
                  Height = 18
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = 'btn_med09'
                  TabOrder = 0
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
                object Formmed07: TTntStaticText
                  Left = 8
                  Top = 24
                  Width = 113
                  Height = 17
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = 'btn_med07'
                  TabOrder = 1
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
                object Formmed12: TTntStaticText
                  Left = 8
                  Top = 56
                  Width = 113
                  Height = 17
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = 'btn_med12'
                  TabOrder = 2
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
                object Formmed15: TTntStaticText
                  Left = 384
                  Top = 24
                  Width = 113
                  Height = 17
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = 'btn_med15'
                  TabOrder = 3
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
                object Formmed13: TTntStaticText
                  Left = 264
                  Top = 24
                  Width = 113
                  Height = 17
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = 'btn_med13'
                  TabOrder = 4
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
                object TntStaticText52: TTntStaticText
                  Left = 145
                  Top = 57
                  Width = 113
                  Height = 17
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = 'btn_other'
                  TabOrder = 5
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
              end
            end
            object TntTabSheet13: TTntTabSheet
              Caption = 'sysfhrd'
              object TntGroupBox9: TTntGroupBox
                Left = 88
                Top = 10
                Width = 561
                Height = 249
                Caption = 'maint._area'
                Color = clBtnFace
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clPurple
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentColor = False
                ParentFont = False
                TabOrder = 0
                object formfhrd105: TTntStaticText
                  Left = 132
                  Top = 185
                  Width = 89
                  Height = 35
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = 'btn_fhrd105'
                  TabOrder = 0
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
                object formfhrd304: TTntStaticText
                  Left = 268
                  Top = 185
                  Width = 89
                  Height = 35
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = 'btn_fhrd304'
                  TabOrder = 1
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
                object formfhrd301: TTntStaticText
                  Left = 408
                  Top = 182
                  Width = 88
                  Height = 36
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = 'btn_fhrd301'
                  TabOrder = 2
                  Visible = False
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
                object formfhrd102: TTntStaticText
                  Left = 120
                  Top = 101
                  Width = 105
                  Height = 36
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = 'btn_fhrd102'
                  TabOrder = 3
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
                object TntPanel45: TTntPanel
                  Left = 176
                  Top = 158
                  Width = 137
                  Height = 1
                  BevelOuter = bvNone
                  Caption = 'TntPanel1'
                  Color = clBlack
                  TabOrder = 4
                end
                object TntPanel47: TTntPanel
                  Left = 176
                  Top = 159
                  Width = 1
                  Height = 26
                  BevelOuter = bvNone
                  Caption = 'TntPanel2'
                  Color = clBlack
                  TabOrder = 5
                end
                object TntPanel48: TTntPanel
                  Left = 312
                  Top = 159
                  Width = 1
                  Height = 26
                  BevelOuter = bvNone
                  Caption = 'TntPanel2'
                  Color = clBlack
                  TabOrder = 6
                end
                object TntPanel49: TTntPanel
                  Left = 451
                  Top = 158
                  Width = 1
                  Height = 24
                  BevelOuter = bvNone
                  Caption = 'TntPanel2'
                  Color = clBlack
                  TabOrder = 7
                  Visible = False
                end
                object TntPanel50: TTntPanel
                  Left = 176
                  Top = 137
                  Width = 1
                  Height = 21
                  BevelOuter = bvNone
                  Caption = 'TntPanel2'
                  Color = clBlack
                  TabOrder = 8
                end
                object formfhrd103: TTntStaticText
                  Left = 16
                  Top = 24
                  Width = 97
                  Height = 35
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = 'btn_fhrd103'
                  TabOrder = 9
                  Visible = False
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
                object formfhrd104: TTntStaticText
                  Left = 136
                  Top = 24
                  Width = 97
                  Height = 35
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = 'btn_fhrd104'
                  TabOrder = 10
                  Visible = False
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
                object formfhrd302: TTntStaticText
                  Left = 263
                  Top = 24
                  Width = 98
                  Height = 35
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = 'btn_fhrd302'
                  TabOrder = 11
                  Visible = False
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
                object formfhrd303: TTntStaticText
                  Left = 400
                  Top = 24
                  Width = 97
                  Height = 35
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = 'btn_fhrd303'
                  TabOrder = 12
                  Visible = False
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
                object formfhrd101: TTntStaticText
                  Left = 15
                  Top = 187
                  Width = 89
                  Height = 35
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = 'btn_fhrd101'
                  TabOrder = 13
                  Visible = False
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
                object TntPanel51: TTntPanel
                  Left = 56
                  Top = 79
                  Width = 396
                  Height = 1
                  BevelOuter = bvNone
                  Caption = 'TntPanel1'
                  Color = clBlack
                  TabOrder = 14
                  Visible = False
                end
                object TntPanel52: TTntPanel
                  Left = 178
                  Top = 80
                  Width = 1
                  Height = 20
                  BevelOuter = bvNone
                  Caption = 'TntPanel2'
                  Color = clBlack
                  TabOrder = 15
                  Visible = False
                end
                object TntPanel53: TTntPanel
                  Left = 56
                  Top = 59
                  Width = 1
                  Height = 20
                  BevelOuter = bvNone
                  Caption = 'TntPanel2'
                  Color = clBlack
                  TabOrder = 16
                  Visible = False
                end
                object TntPanel54: TTntPanel
                  Left = 451
                  Top = 59
                  Width = 1
                  Height = 20
                  BevelOuter = bvNone
                  Caption = 'TntPanel2'
                  Color = clBlack
                  TabOrder = 17
                  Visible = False
                end
                object TntPanel55: TTntPanel
                  Left = 308
                  Top = 59
                  Width = 1
                  Height = 20
                  BevelOuter = bvNone
                  Caption = 'TntPanel2'
                  Color = clBlack
                  TabOrder = 18
                  Visible = False
                end
                object TntPanel56: TTntPanel
                  Left = 178
                  Top = 58
                  Width = 1
                  Height = 20
                  BevelOuter = bvNone
                  Caption = 'TntPanel2'
                  Color = clBlack
                  TabOrder = 19
                  Visible = False
                end
                object TntPanel57: TTntPanel
                  Left = 224
                  Top = 116
                  Width = 30
                  Height = 1
                  BevelOuter = bvNone
                  Caption = 'TntPanel1'
                  Color = clBlack
                  TabOrder = 20
                end
                object formfhrd201: TTntStaticText
                  Left = 254
                  Top = 101
                  Width = 89
                  Height = 36
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = 'btn_fhrd201'
                  TabOrder = 21
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
                object formfhrd203: TTntStaticText
                  Left = 375
                  Top = 101
                  Width = 89
                  Height = 36
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = 'btn_fhrd203'
                  TabOrder = 22
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
                object TntPanel58: TTntPanel
                  Left = 343
                  Top = 118
                  Width = 30
                  Height = 1
                  BevelOuter = bvNone
                  Caption = 'TntPanel1'
                  Color = clBlack
                  TabOrder = 23
                end
              end
              object TntGroupBox10: TTntGroupBox
                Left = 88
                Top = 268
                Width = 561
                Height = 89
                Caption = 'reports_area'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                object formfhrd306: TTntStaticText
                  Left = 144
                  Top = 24
                  Width = 130
                  Height = 18
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = 'btn_fhrd306'
                  TabOrder = 0
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
                object formfhrd401: TTntStaticText
                  Left = 8
                  Top = 24
                  Width = 130
                  Height = 17
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = 'btn_fhrd401'
                  TabOrder = 1
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
                object formfhrd305: TTntStaticText
                  Left = 416
                  Top = 24
                  Width = 130
                  Height = 17
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = 'btn_fhrd305'
                  TabOrder = 2
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
                object formfhrd307: TTntStaticText
                  Left = 280
                  Top = 24
                  Width = 130
                  Height = 17
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = 'btn_fhrd307'
                  TabOrder = 3
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
                object formfhrd402: TTntStaticText
                  Left = 280
                  Top = 56
                  Width = 130
                  Height = 17
                  Cursor = crHandPoint
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = 'btn_fhrd402'
                  TabOrder = 4
                  Visible = False
                  OnClick = showSubForm
                  OnMouseMove = TitleMouseMove
                end
                object TntStaticText19: TTntStaticText
                  Left = 145
                  Top = 57
                  Width = 130
                  Height = 17
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSingle
                  Caption = 'btn_other'
                  TabOrder = 5
                  Visible = False
                end
              end
            end
            object TntTabSheet1: TTntTabSheet
              Caption = #32318#25928#32771#35413
              object BtnJixiao: TTntBitBtn
                Left = 272
                Top = 136
                Width = 233
                Height = 57
                Caption = #36914#20837#32318#25928#32771#35413
                TabOrder = 0
                OnClick = BtnJixiaoClick
              end
            end
          end
        end
      end
    end
  end
  object PanelTopIcon: TPanel
    Left = 763
    Top = 4
    Width = 30
    Height = 15
    Anchors = [akTop, akRight]
    BevelOuter = bvNone
    TabOrder = 1
    Visible = False
    object ImageMin: TImage
      Left = 0
      Top = 0
      Width = 15
      Height = 15
      Align = alLeft
      Picture.Data = {
        07544269746D617026050000424D260500000000000036040000280000000F00
        00000F0000000100080000000000F0000000C40E0000C40E0000000100000000
        0000F4C28000F98C6300EC783300F99A7400FFE7D000F9771A00FFFFF300F385
        5200FB7B4D00F5794600F46D3300F77F5400F57D4B00FFFAE400F58D5E00BB47
        0E00F9825900E96E3900F2744400F3DACA00E4580600F36C2A00FAA68900C14A
        1700E35E2100FFFEF900FB825300FFFEFE00C3490B00F3571600FD6D0B00EB6B
        2D00EF743800F97B4200F36D2000F4723C00F2FFFE00FA6B3200EA742400EE9C
        7800F6804B00EF855400F6FEFD00F76D1C00BA4E2800E85D1800DD521A00FC94
        6C00EA936100D95D2700F65D0500F6FFF800FBFFFF00FC875B00FC743D00F4BE
        9500FEBC9400FA743500F56B1200C0421200FC9C8000E8612D00D8510000E961
        2700FFFCFF00EF803E00FDFFFF00F2916B00FC811F00FE792400EE6A2500FC91
        6600FC754500C83D0200FA6D3B00F2652A00DB470200F4601C00FFF8FF00F165
        2400FCB28C00F6732400FA691E00FFFFFB00F8FFFC00F07A3B00F5630F00EC6E
        1B00FC672500F0722C00F8FFFF00F1683200FBFFF900BC3F0300FAFDFF00FB63
        2B00F0711900F6AE9100FEB49800FEC09B00FFF3F300EE764200E0624000F297
        6900FF6C2F00FBFFFC00F2885C00FC9C7000F2772F00F3895400F57A6000F26A
        4800FAA67600F44F1000BC622B00AF501F00F4B89A00FD7B3600D85F1C00D863
        2000FA633000F4653800FDFFFC00FEFDFF00FBF9FF00FD691500F8651D00F473
        4C00000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00002F131304131313041313131313137500042C5D49493E4949493E4949493E
        1300137172781E1E713E1E781E1E1E4904001371786E631637162F78781E3E49
        1300137172161B1B1B1B63441E781E491300131E2F16241313133778721E7549
        040004716E7578667578781E44781E49130024782F307875787878781E721E49
        130004756E756E756E7244727278783E130013782F6E3078757878781E1E7249
        13000441162F2F6E6E417878727878711300132F002F756E4178756E7875782C
        13001B2F1616272F2F6E2F2F7566783E1300132F302F786E75417878781E7172
        1300410413040413041304131B1313133000}
      Stretch = True
      OnClick = ImageMinClick
    end
    object ImageClose: TImage
      Left = 15
      Top = 0
      Width = 15
      Height = 455
      Picture.Data = {
        07544269746D617026050000424D260500000000000036040000280000000F00
        00000F0000000100080000000000F0000000C40E0000C40E0000000100000000
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
        FF00000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000150303150303031503030303031515001525165816165879165879167958
        03006F165D635D5D255D251716161679030003165D7257256A6A671719681679
        030003166A457F195D5D256F7F1916580300035D6A256F7F6F256F7F14166779
        030078257235256F7F6F7F0316631616150003356A74355D037F6F175D675D79
        0300786A7220636F7F6F7F6F162563100300036A20726F7F5F256F7F5F256716
        0300155D72197F19636A635F7F14251003006B145F19036A5D356A6319352516
        78007820191414203572356A356A6A580300155F14355D735D6A635D635D2516
        1500150303157803036B0303780303151500}
      OnClick = NPCloseClick
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 540
    Width = 792
    Height = 21
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'Panel4'
    TabOrder = 2
    object StatusBar1: TTntStatusBar
      Left = 0
      Top = 0
      Width = 592
      Height = 21
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = '????'
      Font.Style = []
      Panels = <>
      UseSystemFont = False
    end
    object StatusBar2: TTntStatusBar
      Left = 592
      Top = 0
      Width = 200
      Height = 21
      Align = alRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = '????'
      Font.Style = []
      Panels = <
        item
          Width = 100
        end
        item
          Width = 100
        end>
      UseSystemFont = False
    end
    object ProgressBar1: TProgressBar
      Left = 395
      Top = 2
      Width = 200
      Height = 19
      Step = 1
      TabOrder = 2
    end
  end
  object MainMenu1: TTntMainMenu
    BiDiMode = bdLeftToRight
    OwnerDraw = True
    ParentBiDiMode = False
    Left = 676
    Top = 164
    object N1: TTntMenuItem
      Caption = #31995#32113#33756#21934
      object N2: TTntMenuItem
        Caption = #20027#30059#38754
        OnClick = N2Click
      end
      object N3: TTntMenuItem
        Caption = #36864#20986
        OnClick = N3Click
      end
    end
  end
  object PopupMenu1: TTntPopupMenu
    Left = 714
    Top = 165
    object NPClose: TTntMenuItem
      Caption = #38364#38281
      OnClick = NPCloseClick
    end
  end
  object PopupMenuNil: TTntPopupMenu
    Left = 749
    Top = 165
  end
end
