object FormSal34: TFormSal34
  Left = 307
  Top = 149
  Width = 800
  Height = 500
  Caption = #37504#34892#21345#36039#26009#36681#27284
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 466
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object PanelTitle: TTntPanel
      Left = 0
      Top = 0
      Width = 792
      Height = 36
      Align = alTop
      BevelOuter = bvNone
      Caption = 'sal34_titl'
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
      Width = 792
      Height = 430
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object PanelQuery: TPanel
        Left = 0
        Top = 0
        Width = 792
        Height = 57
        Align = alTop
        TabOrder = 0
        object TntPanel1: TTntPanel
          Left = 1
          Top = 1
          Width = 104
          Height = 55
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
        end
        object btn1: TTntButton
          Left = 288
          Top = 18
          Width = 75
          Height = 25
          Caption = 'transferfiles'
          TabOrder = 1
          OnClick = btn1Click
        end
      end
      object PanelGrid: TPanel
        Left = 0
        Top = 57
        Width = 792
        Height = 373
        Align = alClient
        TabOrder = 1
        object DBGrid1: TTntDBGrid
          Left = 1
          Top = 1
          Width = 790
          Height = 371
          Align = alClient
          DataSource = DataSource1
          FixedColor = clSkyBlue
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Palatino Linotype'
          Font.Style = []
          ImeName = #20013#25991' - QQ'#25340#38899'?'#20837#27861
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'emp_id'
              Width = 53
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'emp_name'
              Width = 145
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'dept_titl'
              Width = 248
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'epid_no'
              Width = 96
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'bank_name'
              Width = 132
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'card_no'
              Width = 101
              Visible = True
            end>
        end
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = qryBank
    Left = 128
    Top = 4
  end
  object qryBank: TADOQuery
    Connection = DMHrdsys.conn
    Parameters = <>
    Left = 168
    Top = 4
    object qryBankupd_user: TStringField
      FieldName = 'upd_user'
      Size = 15
    end
    object dtmfldBankupd_date: TDateTimeField
      FieldName = 'upd_date'
    end
    object qryBankemp_id: TStringField
      FieldName = 'emp_id'
      Size = 6
    end
    object qryBankepid_no: TStringField
      FieldName = 'epid_no'
      Size = 10
    end
    object qryBankbank_name: TWideStringField
      FieldName = 'bank_name'
      Size = 30
    end
    object qryBankcard_no: TStringField
      FieldName = 'card_no'
      Size = 25
    end
    object qryBankemp_name: TWideStringField
      FieldKind = fkLookup
      FieldName = 'emp_name'
      LookupDataSet = qryEmp
      LookupKeyFields = 'emp_id'
      LookupResultField = 'emp_name'
      KeyFields = 'emp_id'
      Size = 60
      Lookup = True
    end
    object qryBankdept_titl: TWideStringField
      FieldKind = fkLookup
      FieldName = 'dept_titl'
      LookupDataSet = qryEmp
      LookupKeyFields = 'emp_id'
      LookupResultField = 'dept_titl'
      KeyFields = 'emp_id'
      Size = 100
      Lookup = True
    end
  end
  object qryEmp: TADOQuery
    Connection = DMHrdsys.conn
    Parameters = <>
    Left = 304
    Top = 8
    object qryEmpemp_name: TWideStringField
      FieldName = 'emp_name'
      Size = 60
    end
    object qryEmpdept_titl: TWideStringField
      FieldName = 'dept_titl'
      Size = 100
    end
    object qryEmpemp_id: TStringField
      FieldName = 'emp_id'
      Size = 6
    end
  end
  object conCos: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=web;Persist Security Info=True;User' +
      ' ID=web;Initial Catalog=flu-erp;Data Source=192.168.7.12'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 488
    Top = 8
  end
  object qryCosBank: TADOQuery
    Connection = conCos
    Parameters = <>
    Left = 520
    Top = 8
    object qryCosBankupd_user: TStringField
      FieldName = 'upd_user'
      Size = 15
    end
    object dtmfldCosBankupd_date: TDateTimeField
      FieldName = 'upd_date'
    end
    object qryCosBankemp_id: TStringField
      FieldName = 'emp_id'
      Size = 6
    end
    object qryCosBankepid_no: TStringField
      FieldName = 'epid_no'
      Size = 10
    end
    object qryCosBankbank_name: TWideStringField
      FieldName = 'bank_name'
      Size = 30
    end
    object qryCosBankcard_no: TStringField
      FieldName = 'card_no'
      Size = 25
    end
  end
end
