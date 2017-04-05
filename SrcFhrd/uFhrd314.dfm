object FormFhrd314: TFormFhrd314
  Left = 230
  Top = 199
  Width = 794
  Height = 504
  Caption = 'FormFhrd314'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Scaled = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 786
    Height = 470
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object PanelTitle: TTntPanel
      Left = 0
      Top = 0
      Width = 786
      Height = 36
      Align = alTop
      BevelOuter = bvNone
      Caption = #32887#34218#30064#21205#36890#30693#21934
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
      Width = 786
      Height = 434
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object Panel7: TPanel
        Left = 150
        Top = 50
        Width = 474
        Height = 269
        Color = clBackground
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object Panel2: TPanel
          Left = 5
          Top = 5
          Width = 465
          Height = 259
          BevelOuter = bvNone
          Color = clSkyBlue
          TabOrder = 0
          object Label1: TLabel
            Left = 0
            Top = 186
            Width = 800
            Height = 3
            AutoSize = False
            Color = clBackground
            ParentColor = False
          end
          object CobDept: TTntComboBox
            Left = 163
            Top = 73
            Width = 150
            Height = 21
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            ItemHeight = 13
            ParentFont = False
            TabOrder = 2
          end
          object BtnPrint: TTntBitBtn
            Left = 238
            Top = 207
            Width = 75
            Height = 25
            Caption = #25171#21360
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            OnClick = BtnPrintClick
          end
          object RbEmp: TTntRadioButton
            Left = 80
            Top = 40
            Width = 80
            Height = 17
            Caption = 'emp'
            Checked = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            TabStop = True
          end
          object RbDept: TTntRadioButton
            Left = 80
            Top = 72
            Width = 80
            Height = 17
            Caption = 'dept'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object BtnPreview: TTntButton
            Left = 152
            Top = 208
            Width = 75
            Height = 25
            Caption = #25171#21360#38928#35261
            TabOrder = 3
            OnClick = BtnPrintClick
          end
          object EditEmp: TTntEdit
            Left = 163
            Top = 37
            Width = 57
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            ParentFont = False
            TabOrder = 5
          end
          object Panel_rub: TPanel
            Left = 74
            Top = 110
            Width = 389
            Height = 53
            BevelOuter = bvNone
            Color = clSkyBlue
            TabOrder = 6
            object r_rea00: TTntRadioButton
              Left = 8
              Top = -2
              Width = 80
              Height = 17
              Caption = 'r_f_yidong_rea00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object r_rea01: TTntRadioButton
              Left = 90
              Top = -2
              Width = 74
              Height = 17
              Caption = 'r_f_yidong_rea01'
              Color = clSkyBlue
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 1
            end
            object r_rea02: TTntRadioButton
              Left = 168
              Top = -1
              Width = 74
              Height = 17
              Caption = 'r_f_yidong_rea02'
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
            object r_rea03: TTntRadioButton
              Left = 242
              Top = -1
              Width = 74
              Height = 17
              Caption = 'r_f_yidong_rea03'
              Color = clSkyBlue
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 3
            end
            object r_rea04: TTntRadioButton
              Left = 314
              Top = -1
              Width = 74
              Height = 17
              Caption = 'r_f_yidong_rea04'
              Color = clSkyBlue
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 4
            end
            object r_rea05: TTntRadioButton
              Left = 8
              Top = 21
              Width = 80
              Height = 17
              Caption = 'r_f_yidong_rea05'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 5
            end
            object r_rea06: TTntRadioButton
              Left = 90
              Top = 21
              Width = 74
              Height = 17
              Caption = 'r_f_yidong_rea06'
              Color = clSkyBlue
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 6
            end
            object r_rea07: TTntRadioButton
              Left = 168
              Top = 22
              Width = 74
              Height = 17
              Caption = 'r_f_yidong_rea07'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 7
            end
            object r_rea08: TTntRadioButton
              Left = 242
              Top = 22
              Width = 74
              Height = 17
              Caption = 'r_f_yidong_rea08'
              Color = clSkyBlue
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 8
            end
            object r_rea09: TTntRadioButton
              Left = 315
              Top = 22
              Width = 74
              Height = 17
              Caption = 'r_f_yidong_rea09'
              Color = clSkyBlue
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 9
            end
          end
        end
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 232
  end
  object ADOQuery1: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    OnCalcFields = ADOQuery1CalcFields
    Parameters = <>
    SQL.Strings = (
      'select top 1 * from fhrd_emp')
    Left = 168
    object ADOQuery1emp_id: TStringField
      FieldName = 'emp_id'
      Size = 6
    end
    object ADOQuery1emp_name: TWideStringField
      FieldName = 'emp_name'
    end
    object ADOQuery1emp_etdt: TDateTimeField
      FieldName = 'emp_etdt'
    end
    object ADOQuery1emp_gvdt: TDateTimeField
      FieldName = 'emp_gvdt'
    end
    object ADOQuery1edu_code: TStringField
      FieldName = 'edu_code'
      Size = 2
    end
    object ADOQuery1dept_code: TStringField
      FieldName = 'dept_code'
      Size = 6
    end
    object ADOQuery1pst_code: TStringField
      FieldName = 'pst_code'
      Size = 2
    end
    object ADOQuery1abbr_titl: TWideStringField
      FieldKind = fkCalculated
      FieldName = 'abbr_titl'
      Calculated = True
    end
    object ADOQuery1position: TWideStringField
      FieldKind = fkCalculated
      FieldName = 'position'
      Calculated = True
    end
    object ADOQuery1edu_chs: TStringField
      FieldKind = fkCalculated
      FieldName = 'edu_chs'
      Calculated = True
    end
    object ADOQuery1base_amt: TFloatField
      FieldKind = fkCalculated
      FieldName = 'base_amt'
      Calculated = True
    end
    object ADOQuery1frn_amt: TFloatField
      FieldKind = fkCalculated
      FieldName = 'frn_amt'
      Calculated = True
    end
    object ADOQuery1faward_amt: TFloatField
      FieldKind = fkCalculated
      FieldName = 'faward_amt'
      Calculated = True
    end
    object ADOQuery1over_amt: TFloatField
      FieldKind = fkCalculated
      FieldName = 'over_amt'
      Calculated = True
    end
    object ADOQuery1total: TFloatField
      FieldKind = fkCalculated
      FieldName = 'total'
      Calculated = True
    end
    object ADOQuery1pre_base_amt: TFloatField
      FieldKind = fkCalculated
      FieldName = 'pre_base_amt'
      Calculated = True
    end
    object ADOQuery1pre_frn_amt: TFloatField
      FieldKind = fkCalculated
      FieldName = 'pre_frn_amt'
      Calculated = True
    end
    object ADOQuery1pre_faward_amt: TFloatField
      FieldKind = fkCalculated
      FieldName = 'pre_faward_amt'
      Calculated = True
    end
    object ADOQuery1pre_over_amt: TFloatField
      FieldKind = fkCalculated
      FieldName = 'pre_over_amt'
      Calculated = True
    end
    object ADOQuery1pre_total: TFloatField
      FieldKind = fkCalculated
      FieldName = 'pre_total'
      Calculated = True
    end
    object ADOQuery1valid_date: TDateField
      FieldKind = fkCalculated
      FieldName = 'valid_date'
      Calculated = True
    end
    object ADOQuery1pre_position: TWideStringField
      FieldKind = fkCalculated
      FieldName = 'pre_position'
      Size = 10
      Calculated = True
    end
  end
  object ADODataSet1: TADODataSet
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select top 1 * from fhrd_tranhist'
    DataSource = DataSource1
    IndexFieldNames = 'emp_id'
    Parameters = <>
    Left = 56
    Top = 164
    object ADODataSet1upd_user: TStringField
      FieldName = 'upd_user'
      Size = 16
    end
    object ADODataSet1upd_date: TDateTimeField
      FieldName = 'upd_date'
    end
    object ADODataSet1emp_id: TStringField
      FieldName = 'emp_id'
      Size = 6
    end
    object ADODataSet1valid_date: TDateTimeField
      FieldName = 'valid_date'
    end
    object ADODataSet1dept_code: TStringField
      FieldName = 'dept_code'
      Size = 6
    end
    object ADODataSet1dept_title: TWideStringField
      FieldName = 'dept_title'
      Size = 50
    end
    object ADODataSet1pst_code: TStringField
      FieldName = 'pst_code'
      Size = 2
    end
    object ADODataSet1pst_name: TStringField
      FieldKind = fkCalculated
      FieldName = 'pst_name'
      Calculated = True
    end
    object ADODataSet1tryout: TStringField
      FieldName = 'tryout'
      FixedChar = True
      Size = 1
    end
    object ADODataSet1base_amt: TBCDField
      FieldName = 'base_amt'
      Precision = 6
      Size = 2
    end
    object ADODataSet1frn_amt: TBCDField
      FieldName = 'frn_amt'
      Precision = 6
      Size = 2
    end
    object ADODataSet1faward_amt: TBCDField
      FieldName = 'faward_amt'
      Precision = 6
      Size = 2
    end
    object ADODataSet1over_amt: TBCDField
      FieldName = 'over_amt'
      Precision = 6
      Size = 2
    end
    object ADODataSet1local_amt: TBCDField
      FieldName = 'local_amt'
      Precision = 6
      Size = 2
    end
    object ADODataSet1sal_bas: TWideStringField
      FieldName = 'sal_bas'
      FixedChar = True
      Size = 2
    end
    object ADODataSet1sal_frn: TWideStringField
      FieldName = 'sal_frn'
      FixedChar = True
      Size = 2
    end
    object ADODataSet1total: TFloatField
      FieldKind = fkCalculated
      FieldName = 'total'
      Calculated = True
    end
    object ADODataSet1id: TLargeintField
      FieldName = 'id'
      ReadOnly = True
    end
  end
  object PrintDialog1: TPrintDialog
    Left = 664
    Top = 180
  end
end
