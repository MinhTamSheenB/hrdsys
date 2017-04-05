object FormSal15: TFormSal15
  Left = 192
  Top = 114
  Width = 928
  Height = 480
  Caption = 'FormSal15'
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
    Width = 920
    Height = 65
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object TntLabel1: TTntLabel
      Left = 32
      Top = 18
      Width = 36
      Height = 13
      Caption = #26376#20221#65306
    end
    object lblInfo: TTntLabel
      Left = 654
      Top = 2
      Width = 264
      Height = 61
      Align = alRight
      Alignment = taCenter
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object EditMonth: TTntEdit
      Left = 75
      Top = 14
      Width = 60
      Height = 21
      TabOrder = 0
      Text = '201701'
    end
    object BtnSearch: TTntBitBtn
      Left = 319
      Top = 12
      Width = 75
      Height = 25
      Caption = #26597#35426
      TabOrder = 1
      OnClick = BtnSearchClick
    end
    object btnCalc: TTntBitBtn
      Left = 401
      Top = 12
      Width = 75
      Height = 25
      Caption = #35336#31639
      TabOrder = 2
      OnClick = btnCalcClick
    end
    object btnExcel: TTntBitBtn
      Left = 481
      Top = 12
      Width = 75
      Height = 25
      Caption = 'Excel'
      TabOrder = 3
      OnClick = btnExcelClick
    end
    object cb2017: TTntCheckBox
      Left = 208
      Top = 16
      Width = 97
      Height = 17
      Caption = #28961#24180#32066#29518
      TabOrder = 4
    end
    object rbAll: TTntRadioButton
      Left = 136
      Top = 40
      Width = 80
      Height = 17
      Caption = #20840#37096
      Checked = True
      TabOrder = 5
      TabStop = True
    end
    object rbXianjin: TTntRadioButton
      Left = 192
      Top = 40
      Width = 80
      Height = 17
      Caption = #29694#37329
      TabOrder = 6
    end
    object rbBank: TTntRadioButton
      Left = 251
      Top = 40
      Width = 80
      Height = 17
      Caption = #37504#34892#36681#36076
      TabOrder = 7
    end
  end
  object TntDBGrid1: TTntDBGrid
    Left = 0
    Top = 65
    Width = 920
    Height = 381
    Align = alClient
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
        Expanded = False
        FieldName = 'DEPT_CODE'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABBR_TITL'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VIM_TITL'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMP_ID'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMP_CHS'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAME_VIM'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EPINDT'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EPLEDT'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PST_CODE'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PST_CHS'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PST_VIM'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PAY_MON'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DAYS'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BASE_PAY'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CARD_NO'
        Width = 120
        Visible = True
      end>
  end
  object mmInfo: TTntMemo
    Left = 664
    Top = 216
    Width = 185
    Height = 89
    Lines.Strings = (
      'S'#7889' th'#7867' :'
      'H'#7885' t'#234'n :'
      'B'#7897' ph'#7853'n :'
      'Ng'#224'y v'#224'o :'
      'L'#432#417'ng t'#7841'm '#7913'ng :'
      'T'#7841'm '#7913'ng l'#432#417'ng th'#225'ng 1/2017')
    TabOrder = 2
    Visible = False
  end
  object TntBitBtn1: TTntBitBtn
    Left = 563
    Top = 12
    Width = 75
    Height = 25
    Caption = #25171#21360
    TabOrder = 3
    OnClick = TntBitBtn1Click
  end
  object QrySearch: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT B.DEPT_CODE,'
      '       C.ABBR_TITL,'
      '       C.VIM_TITL,'
      '       B.EMP_ID,'
      '       B.EMP_CHS,'
      '       B.NAME_VIM,'
      '       B.EPINDT,'
      '       B.EPLEDT,'
      '       B.PST_CODE,'
      '       D.PST_CHS,'
      '       D.PST_VIM,'
      '       A.PAY_MON,'
      '       A.DAYS,'
      '       A.BASE_PAY,'
      '       E.CARD_NO'
      
        '  FROM HRD_SAL_PAYMT_HALF A, HRD_EMP B, HRD_DEPT C, HRD_PROF D, ' +
        'hrd_sal_bankcard e'
      ' WHERE A.EMP_ID = B.EMP_ID'
      '   AND B.DEPT_CODE = C.DEPT_CODE'
      '   AND B.PST_CODE = D.PST_CODE'
      '   AND A.EMP_ID=E.EMP_ID'
      '   AND 1=2'
      ' ORDER BY B.DEPT_CODE, B.EMP_ID')
    Left = 800
    Top = 72
    object QrySearchDEPT_CODE: TStringField
      DisplayLabel = #37096#38272#20195#34399
      FieldName = 'DEPT_CODE'
      Size = 6
    end
    object QrySearchABBR_TITL: TWideStringField
      DisplayLabel = #37096#38272#21517#31281'('#20013')'
      FieldName = 'ABBR_TITL'
      Size = 14
    end
    object QrySearchVIM_TITL: TWideStringField
      DisplayLabel = #37096#38272#21517#31281'('#36234')'
      FieldName = 'VIM_TITL'
      Size = 40
    end
    object QrySearchEMP_ID: TStringField
      DisplayLabel = #24037#34399
      FieldName = 'EMP_ID'
      Size = 6
    end
    object QrySearchEMP_CHS: TWideStringField
      DisplayLabel = #22995#21517'('#20013')'
      FieldName = 'EMP_CHS'
      Size = 30
    end
    object QrySearchNAME_VIM: TWideStringField
      DisplayLabel = #22995#21517'('#36234')'
      FieldName = 'NAME_VIM'
      Size = 50
    end
    object QrySearchEPINDT: TDateTimeField
      DisplayLabel = #36914#24288#26085#26399
      FieldName = 'EPINDT'
    end
    object QrySearchEPLEDT: TDateTimeField
      DisplayLabel = #38626#32887#26085#26399
      FieldName = 'EPLEDT'
    end
    object QrySearchPST_CODE: TStringField
      DisplayLabel = #32887#21209#20195#34399
      FieldName = 'PST_CODE'
      Size = 2
    end
    object QrySearchPST_CHS: TWideStringField
      DisplayLabel = #32887#21209'('#20013')'
      FieldName = 'PST_CHS'
      Size = 10
    end
    object QrySearchPST_VIM: TWideStringField
      DisplayLabel = #32887#21209'('#36234')'
      FieldName = 'PST_VIM'
      Size = 30
    end
    object QrySearchPAY_MON: TWideStringField
      DisplayLabel = #26376#20221
      FieldName = 'PAY_MON'
      Size = 6
    end
    object QrySearchDAYS: TFloatField
      DisplayLabel = #22825#25976
      FieldName = 'DAYS'
    end
    object QrySearchBASE_PAY: TBCDField
      DisplayLabel = #34218#36039
      FieldName = 'BASE_PAY'
      Precision = 19
    end
    object QrySearchCARD_NO: TStringField
      DisplayLabel = #37504#34892#21345
      FieldName = 'CARD_NO'
      Size = 25
    end
  end
  object DataSource1: TDataSource
    DataSet = QrySearch
    Left = 840
    Top = 72
  end
  object QrySave: TADOQuery
    Connection = DMHrdsys.conn
    Parameters = <>
    Left = 792
    Top = 112
  end
  object ADOQuery1: TADOQuery
    Connection = DMHrdsys.conn
    Parameters = <>
    Left = 840
    Top = 192
  end
end
