object FormSal28: TFormSal28
  Left = 192
  Top = 114
  Width = 772
  Height = 480
  Caption = 'FormSal28'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object TntPageControl1: TTntPageControl
    Left = 0
    Top = 0
    Width = 764
    Height = 446
    Align = alClient
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 764
    Height = 446
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object PanelTitle: TTntPanel
      Left = 0
      Top = 0
      Width = 764
      Height = 36
      Align = alTop
      BevelOuter = bvNone
      Caption = #34218#36039#21295#32317#34920
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
      Width = 764
      Height = 410
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object PanelGrid: TPanel
        Left = 0
        Top = 81
        Width = 764
        Height = 329
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object TntDBGrid1: TTntDBGrid
          Left = 0
          Top = 0
          Width = 764
          Height = 329
          Align = alClient
          DataSource = DataSource1
          ImeName = #20013#25991' (?'#20307') - '#35895#27468#25340#38899'?'#20837#27861
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 764
        Height = 81
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object TntLabel1: TTntLabel
          Left = 48
          Top = 35
          Width = 65
          Height = 13
          AutoSize = False
          Caption = #34218#36039#26376#20221
        end
        object TntLabel2: TTntLabel
          Left = 264
          Top = 11
          Width = 30
          Height = 13
          Caption = #37096#38272' :'
        end
        object TntLabel5: TTntLabel
          Left = 48
          Top = 11
          Width = 54
          Height = 13
          Caption = #26597#35426#26781#20214'  '
        end
        object TntLabel4: TTntLabel
          Left = 269
          Top = 37
          Width = 30
          Height = 13
          Caption = #24037#34399': '
        end
        object TntEdit1: TTntEdit
          Left = 120
          Top = 32
          Width = 57
          Height = 21
          ImeName = #20013#25991' (?'#20307') - '#35895#27468#25340#38899'?'#20837#27861
          TabOrder = 0
        end
        object TntEdit2: TTntEdit
          Left = 178
          Top = 32
          Width = 57
          Height = 21
          ImeName = #20013#25991' (?'#20307') - '#35895#27468#25340#38899'?'#20837#27861
          TabOrder = 1
        end
        object TntBitBtn1: TTntBitBtn
          Left = 477
          Top = 36
          Width = 75
          Height = 24
          Caption = #26597#35426
          TabOrder = 2
          OnClick = TntBitBtn1Click
        end
        object TntBitBtn2: TTntBitBtn
          Left = 552
          Top = 35
          Width = 75
          Height = 25
          Caption = 'Excel'
          TabOrder = 3
          OnClick = TntBitBtn2Click
        end
        object deptS: TTntComboBox
          Left = 312
          Top = 7
          Width = 153
          Height = 21
          ImeName = #20013#25991' (?'#20307') - '#35895#27468#25340#38899'?'#20837#27861
          ItemHeight = 13
          TabOrder = 4
        end
        object depte: TTntComboBox
          Left = 472
          Top = 7
          Width = 145
          Height = 21
          ImeName = #20013#25991' (?'#20307') - '#35895#27468#25340#38899'?'#20837#27861
          ItemHeight = 13
          TabOrder = 5
        end
        object Cate: TTntComboBox
          Left = 120
          Top = 8
          Width = 117
          Height = 21
          ImeName = #20013#25991' (?'#20307') - '#35895#27468#25340#38899'?'#20837#27861
          ItemHeight = 13
          ItemIndex = 1
          TabOrder = 6
          Text = '1 - '#37096#38272
          Items.Strings = (
            '0 - '#24037#34399
            '1 - '#37096#38272)
        end
        object Edit2: TEdit
          Left = 313
          Top = 35
          Width = 73
          Height = 21
          Enabled = False
          ImeName = #20013#25991' (?'#20307') - '#35895#27468#25340#38899'?'#20837#27861
          TabOrder = 7
        end
        object Edit1: TEdit
          Left = 394
          Top = 36
          Width = 79
          Height = 21
          Enabled = False
          ImeName = #20013#25991' (?'#20307') - '#35895#27468#25340#38899'?'#20837#27861
          TabOrder = 8
        end
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 200
  end
  object ADOQuery1: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    OnCalcFields = ADOQuery1CalcFields
    Parameters = <>
    SQL.Strings = (
      'select  * from [tempdbf].[dbo].Tmp_hrd_dut16_report')
    Left = 168
    object ADOQuery1emp_id: TStringField
      FieldName = 'emp_id'
      Size = 6
    end
    object ADOQuery1emp_name: TTntWideStringField
      FieldKind = fkCalculated
      FieldName = 'emp_name'
      Size = 30
      Calculated = True
    end
    object ADOQuery1tax_num: TTntWideStringField
      FieldKind = fkCalculated
      FieldName = 'tax_num'
      Calculated = True
    end
    object ADOQuery1sal_tot1: TFloatField
      FieldName = 'sal_tot1'
    end
    object ADOQuery1base_pay: TFloatField
      FieldName = 'base_pay'
    end
    object ADOQuery1sal_tot2: TFloatField
      FieldKind = fkCalculated
      FieldName = 'sal_tot2'
      Calculated = True
    end
    object ADOQuery1full_awd: TFloatField
      FieldName = 'full_awd'
    end
    object ADOQuery1over15_sal: TFloatField
      FieldName = 'sick_supp'
    end
    object ADOQuery1sick_back: TFloatField
      FieldName = 'sick_back'
    end
    object ADOQuery1last_addition: TFloatField
      FieldName = 'last_addition'
    end
    object ADOQuery1over20_sal: TFloatField
      FieldName = 'psal_awd'
    end
    object ADOQuery1supp_agai: TFloatField
      FieldName = 'supp_agai'
    end
    object ADOQuery1sal_night: TFloatField
      FieldName = 'sal_night'
    end
    object ADOQuery1over30_sal: TFloatField
      FieldName = 'over_work'
    end
    object ADOQuery1over195_sal: TFloatField
      FieldName = 'envr_ofr'
    end
    object ADOQuery1picc_back: TFloatField
      FieldName = 'picc_back'
    end
    object ADOQuery1other_temp: TFloatField
      FieldName = 'other_temp'
    end
    object ADOQuery1othe_supp: TFloatField
      FieldName = 'longwork_pay'
    end
    object ADOQuery1te_pay: TFloatField
      FieldName = 'te_pay'
    end
    object ADOQuery1gong_pay: TFloatField
      FieldName = 'gong_pay'
    end
    object ADOQuery1sal_tot3: TFloatField
      FieldKind = fkCalculated
      FieldName = 'sal_tot3'
      Calculated = True
    end
    object ADOQuery1picc_she: TFloatField
      FieldName = 'picc_she'
    end
    object ADOQuery1picc_yi: TFloatField
      FieldName = 'picc_yi'
    end
    object ADOQuery1picc_shiye: TFloatField
      FieldName = 'picc_shiye'
    end
    object ADOQuery1laun_pay: TFloatField
      FieldName = 'laun_pay'
    end
    object ADOQuery1tax_pay: TFloatField
      FieldName = 'tax_pay'
    end
    object ADOQuery1ask_sal: TFloatField
      FieldName = 'ask_pay'
    end
    object ADOQuery1stop_dedu: TFloatField
      FieldName = 'stop_dedu'
    end
    object ADOQuery1sup_dedu: TFloatField
      FieldName = 'sup_dedu'
    end
    object ADOQuery1yicard_dedu: TFloatField
      FieldName = 'meal_pay'
    end
    object ADOQuery1full_sal: TFloatField
      FieldKind = fkCalculated
      FieldName = 'full_sal'
      Calculated = True
    end
    object ADOQuery1sal_tot: TFloatField
      FieldKind = fkCalculated
      FieldName = 'sal_tot'
      Calculated = True
    end
    object ADOQuery1marry_id: TTntWideStringField
      FieldKind = fkCalculated
      FieldName = 'marry_id'
      Size = 1
      Calculated = True
    end
    object ADOQuery1marry_mon: TFloatField
      FieldKind = fkCalculated
      FieldName = 'marry_mon'
      Calculated = True
    end
    object ADOQuery1tax_pay1: TFloatField
      FieldName = 'tax_pay1'
    end
    object ADOQuery1svr_nm: TFloatField
      FieldKind = fkCalculated
      FieldName = 'svr_nm'
      Calculated = True
    end
    object ADOQuery1epid_no: TStringField
      FieldKind = fkCalculated
      FieldName = 'epid_no'
      Calculated = True
    end
  end
  object ADOQuery2: TADOQuery
    Connection = DMHrdsys.conn
    Parameters = <>
    Left = 232
    Top = 109
  end
end
