object FormFhrd102A: TFormFhrd102A
  Left = 199
  Top = 122
  Width = 465
  Height = 385
  Caption = 'FormFhrd102A'
  Color = clBtnFace
  Constraints.MaxWidth = 465
  Constraints.MinWidth = 465
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    457
    351)
  PixelsPerInch = 96
  TextHeight = 13
  object TntPanel1: TTntPanel
    Left = 0
    Top = 0
    Width = 457
    Height = 322
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object TntGroupBox1: TTntGroupBox
      Left = 1
      Top = 1
      Width = 455
      Height = 320
      Align = alClient
      Caption = #31777#27511
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object resumeMemo: TTntMemo
        Left = 2
        Top = 15
        Width = 451
        Height = 303
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Lines.Strings = (
          'resumeMemo')
        ParentFont = False
        TabOrder = 0
      end
    end
  end
  object TntPanel2: TTntPanel
    Left = 0
    Top = 321
    Width = 457
    Height = 30
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    object saveData: TTntBitBtn
      Left = 128
      Top = 4
      Width = 85
      Height = 22
      Caption = #20445#23384
      TabOrder = 0
      OnClick = saveDataClick
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
    end
    object closeSubForm: TTntBitBtn
      Left = 248
      Top = 4
      Width = 85
      Height = 22
      Caption = #38364#38281
      TabOrder = 1
      OnClick = closeSubFormClick
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
    object empid: TEdit
      Left = 16
      Top = 4
      Width = 55
      Height = 21
      TabOrder = 2
      Visible = False
    end
  end
  object resumeQry: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      '')
    Left = 161
    Top = 73
  end
  object fetchQry: TADOQuery
    Connection = DMHrdsys.conn
    Parameters = <>
    Left = 129
    Top = 73
  end
end
