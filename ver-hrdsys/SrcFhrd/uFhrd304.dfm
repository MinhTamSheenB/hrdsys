object Formfhrd304: TFormfhrd304
  Left = 118
  Top = 132
  Width = 800
  Height = 515
  Caption = 'Formfhrd304'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object TntPanel1: TTntPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 45
    Align = alTop
    Caption = #28023#22806#24185#37096#31649#29702'___'#35336#31639#34218#36039
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
    Width = 792
    Height = 78
    Align = alTop
    Caption = #26781#20214
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    DesignSize = (
      792
      78)
    object TntLabel1: TTntLabel
      Left = 21
      Top = 19
      Width = 81
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #35336#31639#26376#20221
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object month: TTntEdit
      Left = 104
      Top = 16
      Width = 43
      Height = 21
      Hint = 'yyyymm'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 6
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnChange = monthChange
    end
    object deptRadio: TTntRadioButton
      Left = 168
      Top = 19
      Width = 94
      Height = 17
      Anchors = [akTop, akRight]
      Caption = #37096#38272
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object empRadio: TTntRadioButton
      Left = 168
      Top = 46
      Width = 94
      Height = 17
      Anchors = [akTop, akRight]
      Caption = #24037#34399
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object deptBegCob: TTntComboBox
      Left = 265
      Top = 16
      Width = 173
      Height = 21
      Anchors = [akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 3
      OnChange = deptBegCobChange
    end
    object deptEndCob: TTntComboBox
      Left = 461
      Top = 16
      Width = 172
      Height = 21
      Anchors = [akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 4
      OnChange = deptEndCobChange
    end
    object empBegId: TTntEdit
      Left = 265
      Top = 45
      Width = 43
      Height = 21
      Hint = 'ssssss'
      Anchors = [akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 6
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnChange = empBegIdChange
    end
    object empEndId: TTntEdit
      Left = 331
      Top = 45
      Width = 43
      Height = 21
      Hint = 'ssssss'
      Anchors = [akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 6
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnChange = empEndIdChange
    end
    object saveData: TTntBitBtn
      Left = 633
      Top = 46
      Width = 75
      Height = 22
      Anchors = [akTop, akRight]
      Caption = #35336#31639
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      OnClick = saveDataClick
      NumGlyphs = 2
    end
    object exitSubForm: TTntBitBtn
      Left = 708
      Top = 46
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
      TabOrder = 8
      OnClick = exitSubFormClick
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
  end
  object TntGroupBox2: TTntGroupBox
    Left = 0
    Top = 123
    Width = 792
    Height = 358
    Align = alClient
    Caption = #28687#35261#25976#25818
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 2
    object salGrid: TTntDBGrid
      Left = 2
      Top = 15
      Width = 788
      Height = 341
      Align = alClient
      DataSource = salDataSource
      FixedColor = clSkyBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
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
          Title.Alignment = taCenter
          Title.Caption = #24037#34399
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'emp_name'
          Title.Alignment = taCenter
          Title.Caption = #22995#21517
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'on_duty'
          Title.Alignment = taCenter
          Title.Caption = #19978#29677#26178#25976
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'off_duty'
          Title.Alignment = taCenter
          Title.Caption = #26410#19978#26178#25976
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'night1_duty'
          Title.Alignment = taCenter
          Title.Caption = #23567#22812#29677#26178
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'night1_price'
          Title.Alignment = taCenter
          Title.Caption = #23567#22812#27941#36028
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'night2_duty'
          Title.Caption = #22823#22812'(8H)'#29677#26178
          Width = 76
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'night2_price'
          Title.Alignment = taCenter
          Title.Caption = #22823#22812'(8H)'#27941#36028
          Width = 76
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'night3_duty'
          Title.Caption = #22823#22812'(12H)'#29677#26178
          Width = 76
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'night3_price'
          Title.Caption = #22823#22812'(12H)'#27941#36028
          Width = 76
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'sal_bas'
          Title.Alignment = taCenter
          Title.Caption = #26412#34218
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'sal_frn'
          Title.Alignment = taCenter
          Title.Caption = #28023#22806#27941#36028
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'fix_add'
          Title.Alignment = taCenter
          Title.Caption = #22266#23450#21152#29677
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'f_award'
          Title.Alignment = taCenter
          Title.Caption = #20840#21220#29518
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'adjust'
          Title.Alignment = taCenter
          Title.Caption = #19978#26376#35519#25972
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dinner_price'
          Title.Alignment = taCenter
          Title.Caption = #22812#40670#35036#36028
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'local_amt'
          Title.Alignment = taCenter
          Title.Caption = #26376#38646#29992#37329
          Visible = True
        end>
    end
  end
  object saveSalQry: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'upd_user'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end
      item
        Name = 'sal_month'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 6
        Value = Null
      end
      item
        Name = 'emp_id'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 6
        Value = Null
      end
      item
        Name = 'on_duty'
        Attributes = [paSigned, paNullable]
        DataType = ftBCD
        NumericScale = 1
        Precision = 4
        Size = 19
        Value = Null
      end
      item
        Name = 'off_duty'
        Attributes = [paSigned, paNullable]
        DataType = ftBCD
        NumericScale = 1
        Precision = 4
        Size = 19
        Value = Null
      end
      item
        Name = 'night1_duty'
        Attributes = [paSigned, paNullable]
        DataType = ftBCD
        NumericScale = 1
        Precision = 6
        Size = 19
        Value = Null
      end
      item
        Name = 'night1_price'
        Attributes = [paSigned, paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 6
        Size = 19
        Value = Null
      end
      item
        Name = 'night2_duty'
        Attributes = [paSigned, paNullable]
        DataType = ftBCD
        NumericScale = 1
        Precision = 6
        Size = 19
        Value = Null
      end
      item
        Name = 'night2_price'
        Attributes = [paSigned, paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 6
        Size = 19
        Value = Null
      end
      item
        Name = 'night3_duty'
        Attributes = [paSigned, paNullable]
        DataType = ftBCD
        Precision = 6
        Size = 19
        Value = Null
      end
      item
        Name = 'night3_price'
        Attributes = [paSigned, paNullable]
        DataType = ftBCD
        Precision = 6
        Size = 19
        Value = Null
      end
      item
        Name = 'sal_bas'
        Attributes = [paSigned, paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 6
        Size = 19
        Value = Null
      end
      item
        Name = 'sal_frn'
        Attributes = [paSigned, paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 6
        Size = 19
        Value = Null
      end
      item
        Name = 'fix_add'
        Attributes = [paSigned, paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 6
        Size = 19
        Value = Null
      end
      item
        Name = 'f_award'
        Attributes = [paSigned, paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 6
        Size = 19
        Value = Null
      end
      item
        Name = 'adjust'
        Attributes = [paSigned, paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 6
        Size = 19
        Value = Null
      end
      item
        Name = 'local_amt'
        Attributes = [paSigned, paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 6
        Size = 19
        Value = Null
      end
      item
        Name = 'dinner_price'
        Attributes = [paSigned, paNullable]
        DataType = ftBCD
        Precision = 6
        Size = 19
        Value = Null
      end>
    SQL.Strings = (
      
        'insert into fhrd_salary (upd_user,sal_month,emp_id,on_duty,off_d' +
        'uty,'
      
        'night1_duty,night1_price,night2_duty,night2_price,night3_duty,ni' +
        'ght3_price,'
      'sal_bas,sal_frn,fix_add,f_award,adjust,local_amt,dinner_price)'
      
        'values (:upd_user,:sal_month,:emp_id,:on_duty,:off_duty,:night1_' +
        'duty,'
      
        ':night1_price,:night2_duty,:night2_price,:night3_duty,:night3_pr' +
        'ice,'
      
        ':sal_bas,:sal_frn,:fix_add,:f_award,:adjust,:local_amt,:dinner_p' +
        'rice)')
    Left = 184
    Top = 177
  end
  object fetchEmpQry: TADOQuery
    Connection = DMHrdsys.conn
    Parameters = <>
    Left = 224
    Top = 177
  end
  object fetchSalQry: TADOQuery
    Connection = DMHrdsys.conn
    Parameters = <>
    Left = 264
    Top = 177
    object fetchSalQryemp_id: TStringField
      FieldName = 'emp_id'
      Size = 6
    end
    object fetchSalQryemp_name: TStringField
      FieldName = 'emp_name'
    end
    object fetchSalQryon_duty: TFloatField
      FieldName = 'on_duty'
    end
    object fetchSalQryoff_duty: TFloatField
      FieldName = 'off_duty'
    end
    object fetchSalQrynight1_duty: TFloatField
      FieldName = 'night1_duty'
    end
    object fetchSalQrynight1_price: TFloatField
      FieldName = 'night1_price'
    end
    object fetchSalQrynight2_duty: TFloatField
      FieldName = 'night2_duty'
    end
    object fetchSalQrynight2_price: TFloatField
      FieldName = 'night2_price'
    end
    object fetchSalQrysal_bas: TFloatField
      FieldName = 'sal_bas'
    end
    object fetchSalQrysal_frn: TFloatField
      FieldName = 'sal_frn'
    end
    object fetchSalQryfix_add: TFloatField
      FieldName = 'fix_add'
    end
    object fetchSalQryf_award: TFloatField
      FieldName = 'f_award'
    end
    object fetchSalQryadjust: TFloatField
      FieldName = 'adjust'
    end
    object fetchSalQrylocal_amt: TFloatField
      FieldName = 'local_amt'
    end
  end
  object salDataSource: TDataSource
    DataSet = fetchSalQry
    Left = 304
    Top = 177
  end
  object doClsQry: TADOQuery
    Connection = DMHrdsys.conn
    Parameters = <>
    Left = 184
    Top = 217
  end
  object doSalQry: TADOQuery
    Connection = DMHrdsys.conn
    Parameters = <>
    Left = 224
    Top = 217
  end
  object chkDtQry: TADOQuery
    Connection = DMHrdsys.conn
    Parameters = <>
    Left = 264
    Top = 217
  end
  object getHoursQry: TADOQuery
    Connection = DMHrdsys.conn
    Parameters = <>
    Left = 304
    Top = 217
  end
  object getHolQry: TADOQuery
    Connection = DMHrdsys.conn
    Parameters = <>
    Left = 448
    Top = 243
  end
end
