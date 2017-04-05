object Formfhrd203: TFormfhrd203
  Left = 75
  Top = 142
  Width = 798
  Height = 521
  Caption = #32771#21220#26376#32080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = TntFormClose
  OnCreate = TntFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object TntPanel_title: TTntPanel
    Left = 0
    Top = 0
    Width = 790
    Height = 45
    Align = alTop
    Caption = #28023#22806#24185#37096#31649#29702#31995#32113'____'#32771#21220#26376#32080
    Color = clCream
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object TntGroupBox1: TTntGroupBox
    Left = 0
    Top = 45
    Width = 790
    Height = 59
    Align = alTop
    TabOrder = 1
    DesignSize = (
      790
      59)
    object TntLabel_month: TTntLabel
      Left = 32
      Top = 27
      Width = 113
      Height = 15
      Alignment = taRightJustify
      AutoSize = False
      Caption = #26376#32080#26376#20221
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object TntEdit_month: TTntEdit
      Left = 148
      Top = 24
      Width = 42
      Height = 21
      Color = clSkyBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
      MaxLength = 6
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = False
      TabOrder = 0
      Text = '200507'
    end
    object TntBitBtn_exit: TTntBitBtn
      Left = 699
      Top = 21
      Width = 75
      Height = 22
      Anchors = [akTop, akRight]
      Caption = #36864#20986
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = TntBitBtn_exitClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
        03333377777777777F333301111111110333337F333333337F33330111111111
        0333337F333333337F333301111111110333337F333333337F33330111111111
        0333337F333333337F333301111111110333337F333333337F33330111111111
        0333337F3333333F7F333301111111B10333337F333333737F33330111111111
        0333337F333333337F333301111111110333337F33FFFFF37F3333011EEEEE11
        0333337F377777F37F3333011EEEEE110333337F37FFF7F37F3333011EEEEE11
        0333337F377777337F333301111111110333337F333333337F33330111111111
        0333337FFFFFFFFF7F3333000000000003333377777777777333}
      NumGlyphs = 2
    end
    object TntBitBtn_month: TTntBitBtn
      Left = 623
      Top = 22
      Width = 75
      Height = 22
      Anchors = [akTop, akRight]
      Caption = #26376#32080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = TntBitBtn_monthClick
      NumGlyphs = 2
    end
  end
  object TntGroupBox_browseData: TTntGroupBox
    Left = 0
    Top = 104
    Width = 790
    Height = 383
    Align = alClient
    Caption = #28687#35261#25976#25818
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    DesignSize = (
      790
      383)
    object TntStringGrid_attend: TTntStringGrid
      Left = 1
      Top = 14
      Width = 787
      Height = 374
      Anchors = [akLeft, akTop, akRight, akBottom]
      ColCount = 10
      Ctl3D = True
      DefaultColWidth = 21
      DefaultRowHeight = 18
      FixedColor = clSkyBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      ColWidths = (
        21
        21
        21
        21
        21
        21
        21
        21
        21
        21)
    end
  end
  object holidayQry: TADOQuery
    Connection = DMHrdsys.conn
    Parameters = <>
    Left = 305
    Top = 140
  end
  object checkQry: TADOQuery
    Connection = DMHrdsys.conn
    Parameters = <>
    Left = 361
    Top = 140
  end
end
