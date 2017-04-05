object FormFhrd310: TFormFhrd310
  Left = 230
  Top = 199
  Width = 794
  Height = 504
  Caption = 'FormFhrd310'
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
      Caption = #28023#22806#21729#24037#34218#36039#35519#21205#32771#26680#34920
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
          object Panel3: TPanel
            Left = 73
            Top = 111
            Width = 338
            Height = 20
            BevelOuter = bvNone
            Color = clSkyBlue
            TabOrder = 6
            Visible = False
            object TntRadioButton_face: TTntRadioButton
              Left = 8
              Top = 2
              Width = 80
              Height = 17
              Caption = 'sal_face'
              Checked = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              TabStop = True
              Visible = False
              OnClick = TntRadioButton_faceClick
            end
            object TntRadioButton_rub: TTntRadioButton
              Left = 90
              Top = 2
              Width = 80
              Height = 17
              Caption = 'sal_rub'
              Color = clSkyBlue
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 1
              Visible = False
              OnClick = TntRadioButton_rubClick
            end
          end
          object Panel_rub: TPanel
            Left = 74
            Top = 145
            Width = 389
            Height = 16
            BevelOuter = bvNone
            Color = clSkyBlue
            TabOrder = 7
            Visible = False
            object TntRadioButton_new: TTntRadioButton
              Left = 8
              Top = -2
              Width = 80
              Height = 17
              Caption = 'r_new'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              Visible = False
            end
            object TntRadioButton_adjust: TTntRadioButton
              Left = 90
              Top = -2
              Width = 74
              Height = 17
              Caption = 'r_adjust'
              Checked = True
              Color = clSkyBlue
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 1
              TabStop = True
              Visible = False
            end
            object TntRadioButton_move: TTntRadioButton
              Left = 168
              Top = -1
              Width = 74
              Height = 17
              Caption = 'r_move'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              Visible = False
            end
            object TntRadioButton_rise: TTntRadioButton
              Left = 242
              Top = -1
              Width = 74
              Height = 17
              Caption = 'sal_rise'
              Color = clSkyBlue
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 3
              Visible = False
            end
            object TntRadioButton_drop: TTntRadioButton
              Left = 314
              Top = -1
              Width = 74
              Height = 17
              Caption = 'r_drop'
              Color = clSkyBlue
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 4
              Visible = False
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
  end
  object ADODataSet1: TADODataSet
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    OnCalcFields = ADODataSet1CalcFields
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
  object ADOQuery2: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    OnCalcFields = ADOQuery2CalcFields
    Parameters = <>
    SQL.Strings = (
      'select top 1 * from hrd_emp')
    Left = 552
    Top = 8
    object ADOQuery2emp_id: TStringField
      FieldName = 'emp_id'
      Size = 6
    end
    object ADOQuery2emp_chs: TWideStringField
      FieldName = 'emp_chs'
      Size = 30
    end
    object ADOQuery2epid_no: TStringField
      FieldName = 'epid_no'
      Size = 10
    end
    object ADOQuery2edu_code: TStringField
      FieldName = 'edu_code'
      Size = 2
    end
    object ADOQuery2chs_status: TStringField
      FieldName = 'chs_status'
      FixedChar = True
      Size = 1
    end
    object ADOQuery2eng_status: TStringField
      FieldName = 'eng_status'
      FixedChar = True
      Size = 1
    end
    object ADOQuery2epid_date: TDateTimeField
      FieldName = 'epid_date'
    end
    object ADOQuery2epid_area: TWideStringField
      FieldName = 'epid_area'
    end
    object ADOQuery2factory: TStringField
      FieldName = 'factory'
      Size = 1
    end
    object ADOQuery2dept_code: TStringField
      FieldName = 'dept_code'
      Size = 6
    end
    object ADOQuery2epindt: TDateTimeField
      FieldName = 'epindt'
    end
    object ADOQuery2epledt: TDateTimeField
      FieldName = 'epledt'
    end
    object ADOQuery2left_reason: TWideStringField
      FieldName = 'left_reason'
      Size = 200
    end
    object ADOQuery2pst_code: TStringField
      FieldName = 'pst_code'
      Size = 2
    end
    object ADOQuery2info_code: TStringField
      FieldName = 'info_code'
      Size = 1
    end
    object ADOQuery2name_vim: TWideStringField
      FieldName = 'name_vim'
      Size = 50
    end
    object ADOQuery2epid_vim: TWideStringField
      FieldName = 'epid_vim'
      Size = 50
    end
    object ADOQuery2epid_eng: TWideStringField
      FieldName = 'epid_eng'
      Size = 50
    end
    object ADOQuery2chk1: TStringField
      FieldKind = fkCalculated
      FieldName = 'chk1'
      Calculated = True
    end
    object ADOQuery2chk22: TStringField
      FieldKind = fkCalculated
      FieldName = 'chk2'
      Calculated = True
    end
    object ADOQuery2chk12: TStringField
      FieldKind = fkCalculated
      FieldName = 'chk3'
      Calculated = True
    end
    object ADOQuery2chk13: TStringField
      FieldKind = fkCalculated
      FieldName = 'chk4'
      Calculated = True
    end
    object ADOQuery2chk2: TStringField
      FieldKind = fkCalculated
      FieldName = 'chk5'
      Calculated = True
    end
    object ADOQuery2emp_cn_vn: TWideStringField
      FieldKind = fkCalculated
      FieldName = 'emp_cn_vn'
      Calculated = True
    end
    object ADOQuery2abbr_titl10: TStringField
      FieldKind = fkCalculated
      FieldName = 'edu_name'
      Calculated = True
    end
    object ADOQuery2abbr_titl92: TStringField
      FieldKind = fkCalculated
      FieldName = 'abbr_titl'
      Calculated = True
    end
    object ADOQuery2prd_grade: TStringField
      FieldKind = fkCalculated
      FieldName = 'prd_grade'
      Calculated = True
    end
    object ADOQuery2position9: TStringField
      FieldKind = fkCalculated
      FieldName = 'position'
      Calculated = True
    end
    object ADOQuery2sal_base: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'sal_base'
      Calculated = True
    end
    object ADOQuery2grade_pay: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'grade_pay'
      Calculated = True
    end
    object ADOQuery2pst_pay: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'pst_pay'
      Calculated = True
    end
    object ADOQuery2sal_mgmt: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'sal_mgmt'
      Calculated = True
    end
    object ADOQuery2sal_tech: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'sal_tech'
      Calculated = True
    end
    object ADOQuery2ton_pay: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'ton_pay'
      Calculated = True
    end
    object ADOQuery2prd_pay: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'prd_pay'
      Calculated = True
    end
    object ADOQuery2envir_pay: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'envir_pay'
      Calculated = True
    end
    object ADOQuery2full_awd: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'full_awd'
      Calculated = True
    end
    object ADOQuery2total0: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'total0'
      Calculated = True
    end
    object ADOQuery2valid_date1: TDateField
      FieldKind = fkCalculated
      FieldName = 'valid_date1'
      Calculated = True
    end
    object ADOQuery2valid_date2: TDateField
      FieldKind = fkCalculated
      FieldName = 'valid_date2'
      Calculated = True
    end
    object ADOQuery2valid_date3: TDateField
      FieldKind = fkCalculated
      FieldName = 'valid_date3'
      Calculated = True
    end
    object ADOQuery2valid_date4: TDateField
      FieldKind = fkCalculated
      FieldName = 'valid_date4'
      Calculated = True
    end
    object ADOQuery2valid_date5: TDateField
      FieldKind = fkCalculated
      FieldName = 'valid_date5'
      Calculated = True
    end
    object ADOQuery2abbr_titl14: TStringField
      FieldKind = fkCalculated
      FieldName = 'abbr_titl1'
      Calculated = True
    end
    object ADOQuery2abbr_titl13: TStringField
      FieldKind = fkCalculated
      FieldName = 'abbr_titl2'
      Calculated = True
    end
    object ADOQuery2abbr_titl12: TStringField
      FieldKind = fkCalculated
      FieldName = 'abbr_titl3'
      Calculated = True
    end
    object ADOQuery2abbr_titl1: TStringField
      FieldKind = fkCalculated
      FieldName = 'abbr_titl4'
      Calculated = True
    end
    object ADOQuery2aaa6: TStringField
      FieldKind = fkCalculated
      FieldName = 'abbr_titl5'
      Calculated = True
    end
    object ADOQuery2prd_grade1: TStringField
      FieldKind = fkCalculated
      FieldName = 'prd_grade1'
      Calculated = True
    end
    object ADOQuery2prd_grade2: TStringField
      FieldKind = fkCalculated
      FieldName = 'prd_grade2'
      Calculated = True
    end
    object ADOQuery2prd_grade3: TStringField
      FieldKind = fkCalculated
      FieldName = 'prd_grade3'
      Calculated = True
    end
    object ADOQuery2prd_grade4: TStringField
      FieldKind = fkCalculated
      FieldName = 'prd_grade4'
      Calculated = True
    end
    object ADOQuery2prd_grade5: TStringField
      FieldKind = fkCalculated
      FieldName = 'prd_grade5'
      Calculated = True
    end
    object ADOQuery2position14: TStringField
      FieldKind = fkCalculated
      FieldName = 'position1'
      Calculated = True
    end
    object ADOQuery2position13: TStringField
      FieldKind = fkCalculated
      FieldName = 'position2'
      Calculated = True
    end
    object ADOQuery2position12: TStringField
      FieldKind = fkCalculated
      FieldName = 'position3'
      Calculated = True
    end
    object ADOQuery2position1: TStringField
      FieldKind = fkCalculated
      FieldName = 'position4'
      Calculated = True
    end
    object ADOQuery2abbr_titl9: TStringField
      FieldKind = fkCalculated
      FieldName = 'position5'
      Calculated = True
    end
    object ADOQuery2sal_base1: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'sal_base1'
      Calculated = True
    end
    object ADOQuery2sal_base2: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'sal_base2'
      Calculated = True
    end
    object ADOQuery2sal_base3: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'sal_base3'
      Calculated = True
    end
    object ADOQuery2sal_base4: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'sal_base4'
      Calculated = True
    end
    object ADOQuery2sal_base5: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'sal_base5'
      Calculated = True
    end
    object ADOQuery2grade_pay1: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'grade_pay1'
      Calculated = True
    end
    object ADOQuery2grade_pay2: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'grade_pay2'
      Calculated = True
    end
    object ADOQuery2grade_pay3: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'grade_pay3'
      Calculated = True
    end
    object ADOQuery2grade_pay4: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'grade_pay4'
      Calculated = True
    end
    object ADOQuery2grade_pay5: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'grade_pay5'
      Calculated = True
    end
    object ADOQuery2pst_pay1: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'pst_pay1'
      Calculated = True
    end
    object ADOQuery2pst_pay2: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'pst_pay2'
      Calculated = True
    end
    object ADOQuery2pst_pay3: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'pst_pay3'
      Calculated = True
    end
    object ADOQuery2pst_pay4: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'pst_pay4'
      Calculated = True
    end
    object ADOQuery2pst_pay5: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'pst_pay5'
      Calculated = True
    end
    object ADOQuery2sal_mgmt1: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'sal_mgmt1'
      Calculated = True
    end
    object ADOQuery2sal_mgmt2: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'sal_mgmt2'
      Calculated = True
    end
    object ADOQuery2sal_mgmt3: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'sal_mgmt3'
      Calculated = True
    end
    object ADOQuery2sal_mgmt4: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'sal_mgmt4'
      Calculated = True
    end
    object ADOQuery2sal_mgmt5: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'sal_mgmt5'
      Calculated = True
    end
    object ADOQuery2sal_tech1: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'sal_tech1'
      Calculated = True
    end
    object ADOQuery2sal_tech2: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'sal_tech2'
      Calculated = True
    end
    object ADOQuery2sal_tech3: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'sal_tech3'
      Calculated = True
    end
    object ADOQuery2sal_tech4: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'sal_tech4'
      Calculated = True
    end
    object ADOQuery2sal_tech5: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'sal_tech5'
      Calculated = True
    end
    object ADOQuery2ton_pay1: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'ton_pay1'
      Calculated = True
    end
    object ADOQuery2ton_pay2: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'ton_pay2'
      Calculated = True
    end
    object ADOQuery2ton_pay3: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'ton_pay3'
      Calculated = True
    end
    object ADOQuery2ton_pay4: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'ton_pay4'
      Calculated = True
    end
    object ADOQuery2ton_pay5: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'ton_pay5'
      Calculated = True
    end
    object ADOQuery2prd_pay1: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'prd_pay1'
      Calculated = True
    end
    object ADOQuery2prd_pay2: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'prd_pay2'
      Calculated = True
    end
    object ADOQuery2prd_pay3: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'prd_pay3'
      Calculated = True
    end
    object ADOQuery2prd_pay4: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'prd_pay4'
      Calculated = True
    end
    object ADOQuery2prd_pay5: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'prd_pay5'
      Calculated = True
    end
    object ADOQuery2p_date1: TDateField
      FieldKind = fkCalculated
      FieldName = 'p_date1'
      Calculated = True
    end
    object ADOQuery2p_date2: TDateField
      FieldKind = fkCalculated
      FieldName = 'p_date2'
      Calculated = True
    end
    object ADOQuery2p_date3: TDateField
      FieldKind = fkCalculated
      FieldName = 'p_date3'
      Calculated = True
    end
    object ADOQuery2p_date4: TDateField
      FieldKind = fkCalculated
      FieldName = 'p_date4'
      Calculated = True
    end
    object ADOQuery2p_date5: TDateField
      FieldKind = fkCalculated
      FieldName = 'p_date5'
      Calculated = True
    end
    object ADOQuery2aaa: TStringField
      FieldKind = fkCalculated
      FieldName = 'p_name1'
      Calculated = True
    end
    object ADOQuery2aaa2: TStringField
      FieldKind = fkCalculated
      FieldName = 'p_name2'
      Calculated = True
    end
    object ADOQuery2aaa3: TStringField
      FieldKind = fkCalculated
      FieldName = 'p_name3'
      Calculated = True
    end
    object ADOQuery2aaa4: TStringField
      FieldKind = fkCalculated
      FieldName = 'p_name4'
      Calculated = True
    end
    object ADOQuery2aaa5: TStringField
      FieldKind = fkCalculated
      FieldName = 'p_name5'
      Calculated = True
    end
  end
end
