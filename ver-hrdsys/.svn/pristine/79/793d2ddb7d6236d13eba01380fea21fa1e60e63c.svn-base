object FormFhrd313: TFormFhrd313
  Left = 276
  Top = 260
  Width = 602
  Height = 478
  Caption = 'FormFhrd313'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 594
    Height = 444
    Align = alClient
    TabOrder = 0
    object PanelTitle: TTntPanel
      Left = 1
      Top = 1
      Width = 592
      Height = 48
      Align = alTop
      BevelOuter = bvNone
      Caption = 'fhrd313_titl'
      Color = clCream
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object TntDBGrid1: TTntDBGrid
      Left = 1
      Top = 49
      Width = 216
      Height = 394
      Align = alLeft
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'sal_mon'
          Title.Alignment = taCenter
          Title.Caption = #34218#36039#26376#20221
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 86
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'sal_rate'
          Title.Alignment = taCenter
          Title.Caption = #21295#29575
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 103
          Visible = True
        end>
    end
    object TntPanel1: TTntPanel
      Left = 217
      Top = 49
      Width = 376
      Height = 394
      Align = alClient
      BevelInner = bvRaised
      TabOrder = 2
      object Panel2: TPanel
        Left = 2
        Top = 2
        Width = 321
        Height = 390
        Align = alLeft
        BevelInner = bvLowered
        TabOrder = 0
        object TntLabel1: TTntLabel
          Left = 48
          Top = 120
          Width = 39
          Height = 13
          Caption = #26376#20221' '#65306
        end
        object TntLabel3: TTntLabel
          Left = 48
          Top = 168
          Width = 39
          Height = 13
          Caption = #21295#29575' '#65306
        end
        object TntLabel4: TTntLabel
          Left = 8
          Top = 16
          Width = 297
          Height = 20
          AutoSize = False
          Caption = #27880' '#65306' '#20197#19979#21295#29575#26159#32654#37329#23565#20154#27665#24163
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object TntBitBtn1: TTntBitBtn
          Left = 104
          Top = 216
          Width = 75
          Height = 25
          Caption = 'Save'
          TabOrder = 0
          OnClick = TntBitBtn1Click
        end
        object pay_mon: TTntEdit
          Left = 104
          Top = 120
          Width = 121
          Height = 21
          TabOrder = 1
        end
        object pay_rate: TTntEdit
          Left = 104
          Top = 160
          Width = 121
          Height = 21
          TabOrder = 2
        end
      end
    end
  end
  object ADOQuery1: TADOQuery
    Connection = DMHrdsys.conn
    CommandTimeout = 0
    Parameters = <>
    SQL.Strings = (
      'select sal_mon, sal_rate from fhrd_sal_rate')
    Left = 57
    Top = 33
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 97
    Top = 33
  end
  object ADOQuery2: TADOQuery
    Connection = DMHrdsys.conn
    Parameters = <>
    SQL.Strings = (
      'select *from fhrd_sal_rate')
    Left = 353
    Top = 89
  end
end
