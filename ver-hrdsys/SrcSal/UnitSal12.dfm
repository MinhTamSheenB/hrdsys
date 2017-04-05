object FormSal12: TFormSal12
  Left = 392
  Top = 225
  Width = 815
  Height = 554
  Caption = '???/?????'
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
    Width = 807
    Height = 520
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object PanelTitle: TTntPanel
      Left = 0
      Top = 0
      Width = 807
      Height = 36
      Align = alTop
      BevelOuter = bvNone
      Caption = 'sal12_titl'
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
      Width = 807
      Height = 484
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 807
        Height = 146
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object TntGroupBox1: TTntGroupBox
          Left = 0
          Top = 0
          Width = 807
          Height = 146
          Align = alClient
          Caption = 'query_condition'
          TabOrder = 0
          object Label_month: TTntLabel
            Left = 5
            Top = 25
            Width = 80
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'month'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'MS PGothic'
            Font.Style = []
            ParentFont = False
          end
          object edit_month: TMaskEdit
            Left = 91
            Top = 21
            Width = 47
            Height = 21
            Hint = 'yyyy/mm'
            EditMask = '9999/99;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 7
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            OnChange = edit_monthChange
          end
          object RbEmp: TTntRadioButton
            Left = 5
            Top = 49
            Width = 80
            Height = 17
            Caption = 'by_empid'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object EditEmpBegin: TTntEdit
            Left = 91
            Top = 47
            Width = 57
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = '????EXE???'
            ParentFont = False
            TabOrder = 2
            OnChange = EditEmpBeginChange
          end
          object EditEmpEnd: TTntEdit
            Left = 155
            Top = 47
            Width = 57
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = '????EXE???'
            ParentFont = False
            TabOrder = 3
          end
          object RbDept: TTntRadioButton
            Left = 5
            Top = 75
            Width = 80
            Height = 17
            Caption = 'by_deptcode'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
          end
          object CobDeptBegin: TTntComboBox
            Left = 91
            Top = 73
            Width = 150
            Height = 21
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            TabOrder = 5
          end
          object CobDeptEnd: TTntComboBox
            Left = 243
            Top = 73
            Width = 150
            Height = 21
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            TabOrder = 6
          end
          object Button1: TButton
            Left = 650
            Top = 113
            Width = 75
            Height = 25
            Caption = 'Excel '
            TabOrder = 7
            OnClick = Button1Click
          end
          object chk_full_sal: TTntCheckBox
            Left = 232
            Top = 49
            Width = 153
            Height = 17
            Caption = #21482#39023#31034#23526#30332#37329#38989'<=0'
            TabOrder = 8
          end
          object BtnPrint: TTntBitBtn
            Left = 566
            Top = 113
            Width = 75
            Height = 25
            Caption = 'print'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 9
            OnClick = BtnPrintClick
          end
          object BtnPreview: TTntButton
            Left = 483
            Top = 113
            Width = 75
            Height = 25
            Caption = 'preview'
            Enabled = False
            TabOrder = 10
            OnClick = BtnPrintClick
          end
          object BtnQuery: TTntButton
            Left = 400
            Top = 113
            Width = 75
            Height = 25
            Caption = 'query'
            TabOrder = 11
            OnClick = BtnQueryClick
          end
          object TntPanel1: TTntPanel
            Left = 400
            Top = 10
            Width = 390
            Height = 25
            BevelOuter = bvNone
            TabOrder = 12
            object Rb_direct: TTntRadioButton
              Left = 110
              Top = 5
              Width = 80
              Height = 17
              Caption = 'sal12_direct'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object Rb_bank: TTntRadioButton
              Left = 213
              Top = 5
              Width = 80
              Height = 17
              Caption = 'sal12_bank'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object rbAllWay: TTntRadioButton
              Left = 7
              Top = 5
              Width = 80
              Height = 17
              Caption = 'all'
              Checked = True
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Palatino Linotype'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              TabStop = True
            end
          end
          object TntPanel2: TTntPanel
            Left = 400
            Top = 35
            Width = 390
            Height = 25
            BevelOuter = bvNone
            TabOrder = 13
            object RBAutoLeft: TTntRadioButton
              Left = 316
              Top = 5
              Width = 80
              Height = 17
              Caption = 'auto_left'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object RBNormalLeft: TTntRadioButton
              Left = 213
              Top = 5
              Width = 80
              Height = 17
              Caption = 'normal_left'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object RBInwork: TTntRadioButton
              Left = 110
              Top = 5
              Width = 80
              Height = 17
              Caption = 'in_work'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
            object rbAllEmployee: TTntRadioButton
              Left = 7
              Top = 5
              Width = 80
              Height = 17
              Caption = 'all'
              Checked = True
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Palatino Linotype'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
              TabStop = True
            end
          end
          object TntPanel3: TTntPanel
            Left = 400
            Top = 60
            Width = 390
            Height = 25
            BevelOuter = bvNone
            TabOrder = 14
            object RBTable: TTntRadioButton
              Left = 110
              Top = 5
              Width = 80
              Height = 17
              Caption = 'sal_table'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object RBTip: TTntRadioButton
              Left = 7
              Top = 5
              Width = 80
              Height = 17
              Caption = 'sal_tip'
              Checked = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              TabStop = True
            end
          end
          object TntPanel4: TTntPanel
            Left = 400
            Top = 85
            Width = 390
            Height = 25
            BevelOuter = bvNone
            TabOrder = 15
            object rd_adidas: TTntRadioButton
              Left = 302
              Top = 5
              Width = 80
              Height = 17
              Caption = 'Adidas'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object rd_mizuno: TTntRadioButton
              Left = 7
              Top = 5
              Width = 80
              Height = 17
              Caption = 'Mizuno'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object Rb_SB: TTntRadioButton
              Left = 112
              Top = 5
              Width = 113
              Height = 17
              Caption = 'Sheen Bridge'
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
          end
          object chk_epledt: TTntCheckBox
            Left = 5
            Top = 103
            Width = 80
            Height = 17
            Caption = 'fld_epledt'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Palatino Linotype'
            Font.Style = []
            ParentFont = False
            TabOrder = 16
          end
          object dtp_epledt_bgn: TTntDateTimePicker
            Left = 91
            Top = 99
            Width = 150
            Height = 24
            Date = 41435.310795532410000000
            Time = 41435.310795532410000000
            TabOrder = 17
          end
          object dtp_epledt_end: TTntDateTimePicker
            Left = 243
            Top = 99
            Width = 150
            Height = 24
            Date = 41435.311046539350000000
            Time = 41435.311046539350000000
            TabOrder = 18
          end
          object cbChange: TTntCheckBox
            Left = 5
            Top = 124
            Width = 161
            Height = 17
            Caption = 'Fuluh -> Sheen Bridge'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 19
            Visible = False
          end
        end
      end
      object Panel6: TPanel
        Left = 0
        Top = 146
        Width = 807
        Height = 338
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object TntDBGrid1: TTntDBGrid
          Left = 0
          Top = 0
          Width = 807
          Height = 338
          Align = alClient
          DataSource = DataSource1
          FixedColor = clSkyBlue
          ImeName = '????EXE???'
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'dept_code'
              Width = 58
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'emp_id'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'base_pay'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'mgmt_ofr'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'tech_ofr'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'duty_ofr'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'envr_ofr'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'efft_awd'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'psal_awd'
              Width = 52
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'grad_ofr'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'te_pay'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'duo_awd'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'full_awd'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'longwork_pay'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'over_work'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'gong_pay'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'supp_agai'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'picc_back'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'othe_supp'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'sick_supp'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'deal_pay'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'meal_pay'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ask_pay'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'stop_dedu'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'picc_she'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'picc_yi'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'picc_shiye'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'laun_pay'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'tax_pay'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'sup_dedu'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'actu_pay'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'salary'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'full_sal'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'if_full'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'curr_qty'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'sal50w'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'sal10w'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'sal5w'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'sal2w'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'sal1w'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'sal5s'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'sal2s'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'sal1s'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'sal5h'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'sal2h'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'emp_chs'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'name_vim'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'dept_code'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'dept_abbr'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'pst_code'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'epindt'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'pst_grad'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'total1'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'total2'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'total3'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'hour_price'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'hour_normal'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'pst_name'
              Visible = True
            end>
        end
        object memVim: TTntMemo
          Left = 448
          Top = 72
          Width = 337
          Height = 217
          Lines.Strings = (
            'Tr'#7907' c'#7845'p c'#244'ng vi'#7879'c(c'#244'ng nh'#226'n):'
            'Tr'#7907' c'#7845'p ch'#7913'c v'#7909'(nh'#226'n vi'#234'n/c'#225'n b'#7897'):'
            'Tr'#7915' ti'#7873'n ngh'#7881' l'#7889' ph'#233'p n'#259'm')
          TabOrder = 1
          Visible = False
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
    AfterScroll = ADOQuery1AfterScroll
    OnCalcFields = ADOQuery1CalcFields
    Parameters = <>
    SQL.Strings = (
      'SELECT A.DEPT_CODE,'
      '       *,'
      '       '#39'zuo ye yuan'#39' AS PST_VIM,'
      '       '#39#20316#26989#21729#39' AS PST_CN,'
      '       '#39'2006/01/01'#39' AS TRY_DATE,'
      '       (B.SALARY - B.FULL_SAL) AS SAL_SUB'
      
        '  FROM HRD_SAL_PAYMT AS A, HRD_SAL_CURRENCY AS B, HRD_SAL_BANKCA' +
        'RD AS C'
      ' WHERE A.EMP_ID = B.EMP_ID'
      '   AND A.PAY_MON = B.PAY_MON'
      '   AND A.EMP_ID = C.EMP_ID'
      '   AND A.ACTU_PAY > 0'
      '   AND B.FULL_SAL > 0 AND 1=2')
    Left = 168
    object ADOQuery1emp_id: TStringField
      FieldName = 'emp_id'
      Size = 6
    end
    object ADOQuery1emp_chs: TTntWideStringField
      DisplayWidth = 8
      FieldKind = fkCalculated
      FieldName = 'emp_chs'
      Calculated = True
    end
    object ADOQuery1name_vim: TTntWideStringField
      DisplayWidth = 30
      FieldKind = fkCalculated
      FieldName = 'name_vim'
      Size = 30
      Calculated = True
    end
    object ADOQuery1dept_code: TTntWideStringField
      FieldName = 'dept_code'
    end
    object ADOQuery1dept_abbr: TTntWideStringField
      FieldKind = fkCalculated
      FieldName = 'dept_abbr'
      Calculated = True
    end
    object ADOQuery1info_code: TStringField
      FieldName = 'info_code'
      FixedChar = True
      Size = 1
    end
    object ADOQuery1pst_code: TStringField
      FieldName = 'pst_code'
    end
    object ADOQuery1epindt: TDateField
      FieldKind = fkCalculated
      FieldName = 'epindt'
      Calculated = True
    end
    object ADOQuery1pay_mon: TStringField
      FieldName = 'pay_mon'
      Size = 6
    end
    object ADOQuery1base_pay: TBCDField
      DisplayWidth = 8
      FieldName = 'base_pay'
      Precision = 19
    end
    object ADOQuery1hour_normal: TFloatField
      DisplayWidth = 8
      FieldKind = fkCalculated
      FieldName = 'hour_normal'
      Precision = 2
      Calculated = True
    end
    object ADOQuery1duty_ofr: TBCDField
      DisplayWidth = 8
      FieldName = 'duty_ofr'
      Precision = 19
    end
    object ADOQuery1tech_ofr: TBCDField
      DisplayWidth = 8
      FieldName = 'tech_ofr'
      Precision = 19
    end
    object ADOQuery1mgmt_ofr: TBCDField
      DisplayWidth = 8
      FieldName = 'mgmt_ofr'
      Precision = 19
    end
    object ADOQuery1grad_ofr: TBCDField
      DisplayWidth = 8
      FieldName = 'grad_ofr'
      Precision = 19
    end
    object ADOQuery1stop_pay: TFloatField
      DisplayWidth = 8
      FieldKind = fkCalculated
      FieldName = 'stop_pay'
      Calculated = True
    end
    object ADOQuery1sal_total1: TCurrencyField
      DisplayWidth = 8
      FieldKind = fkCalculated
      FieldName = 'sal_total1'
      Precision = 2
      Calculated = True
    end
    object ADOQuery1full_awd: TBCDField
      DisplayWidth = 8
      FieldName = 'full_awd'
      Precision = 19
    end
    object ADOQuery1envr_ofr: TBCDField
      DisplayWidth = 8
      FieldName = 'envr_ofr'
      Precision = 19
    end
    object ADOQuery1efft_awd: TBCDField
      DisplayWidth = 8
      FieldName = 'efft_awd'
      Precision = 19
    end
    object ADOQuery1leav_pay: TBCDField
      FieldName = 'leav_pay'
      Precision = 18
      Size = 0
    end
    object ADOQuery1te_pay: TBCDField
      DisplayWidth = 8
      FieldName = 'te_pay'
      Precision = 19
    end
    object ADOQuery1stop_supp: TBCDField
      FieldName = 'stop_supp'
      Precision = 19
    end
    object ADOQuery1injury_supp: TBCDField
      FieldName = 'injury_supp'
      Precision = 19
    end
    object ADOQuery1salhol_supp: TBCDField
      FieldName = 'salhol_supp'
      Precision = 19
    end
    object ADOQuery1othe_supp: TBCDField
      FieldName = 'othe_supp'
      Precision = 19
    end
    object ADOQuery1other_temp: TBCDField
      FieldName = 'other_temp'
      Precision = 19
    end
    object ADOQuery1last_addition: TBCDField
      FieldName = 'last_addition'
      Precision = 19
    end
    object ADOQuery1gong_pay: TBCDField
      DisplayWidth = 8
      FieldName = 'gong_pay'
      Precision = 19
    end
    object ADOQuery1sal_night: TBCDField
      DisplayWidth = 8
      FieldName = 'sal_night'
      Precision = 19
    end
    object ADOQuery1over15_sal: TFloatField
      FieldName = 'over15_sal'
    end
    object ADOQuery1over20_sal: TFloatField
      FieldName = 'over20_sal'
    end
    object ADOQuery1over30_sal: TFloatField
      FieldName = 'over30_sal'
    end
    object ADOQuery1over195_sal: TFloatField
      FieldName = 'over195_sal'
    end
    object ADOQuery1picc_back: TBCDField
      DisplayWidth = 8
      FieldName = 'picc_back'
      Precision = 19
    end
    object ADOQuery1supp_agai: TBCDField
      DisplayWidth = 8
      FieldName = 'supp_agai'
      Precision = 19
    end
    object ADOQuery1meal_sal: TFloatField
      FieldName = 'meal_sal'
    end
    object ADOQuery1sick_supp: TBCDField
      DisplayWidth = 8
      FieldName = 'sick_supp'
      Precision = 19
    end
    object ADOQuery1foster_pay: TCurrencyField
      FieldName = 'foster_pay'
    end
    object ADOQuery1sal_total2: TCurrencyField
      DisplayWidth = 8
      FieldKind = fkCalculated
      FieldName = 'sal_total2'
      Precision = 2
      Calculated = True
    end
    object ADOQuery1deal_pay: TBCDField
      DisplayWidth = 8
      FieldName = 'deal_pay'
      Precision = 19
    end
    object ADOQuery1picc_she: TBCDField
      DisplayWidth = 8
      FieldName = 'picc_she'
      Precision = 19
    end
    object ADOQuery1picc_yi: TBCDField
      DisplayWidth = 8
      FieldName = 'picc_yi'
      Precision = 19
    end
    object ADOQuery1picc_shiye: TFloatField
      FieldName = 'picc_shiye'
    end
    object ADOQuery1laun_pay: TBCDField
      DisplayWidth = 8
      FieldName = 'laun_pay'
      Precision = 19
    end
    object ADOQuery1tax_pay: TBCDField
      DisplayWidth = 8
      FieldName = 'tax_pay'
      Precision = 19
    end
    object ADOQuery1ask_pay: TBCDField
      DisplayWidth = 8
      FieldName = 'ask_pay'
      Precision = 19
    end
    object ADOQuery1sup_dedu: TBCDField
      DisplayWidth = 8
      FieldName = 'sup_dedu'
      Precision = 19
    end
    object ADOQuery1meal_pay: TBCDField
      DisplayWidth = 8
      FieldName = 'meal_pay'
      Precision = 19
    end
    object ADOQuery1stop_dedu: TBCDField
      DisplayWidth = 8
      FieldName = 'stop_dedu'
      Precision = 19
    end
    object ADOQuery1yicard_dedu: TCurrencyField
      FieldName = 'yicard_dedu'
    end
    object ADOQuery1zhuishuo_BHXH: TBCDField
      FieldName = 'zhuishuo_BHXH'
      Precision = 18
      Size = 0
    end
    object ADOQuery1duoxiu_koukuan: TBCDField
      FieldName = 'duoxiu_koukuan'
      Precision = 18
      Size = 0
    end
    object ADOQuery1sal_total3: TCurrencyField
      DisplayWidth = 8
      FieldKind = fkCalculated
      FieldName = 'sal_total3'
      Precision = 2
      Calculated = True
    end
    object ADOQuery1actu_pay: TBCDField
      DisplayWidth = 8
      FieldName = 'actu_pay'
      Precision = 19
    end
    object ADOQuery1salary: TBCDField
      DisplayWidth = 8
      FieldName = 'salary'
      Precision = 19
    end
    object ADOQuery1curr_qty: TIntegerField
      DisplayWidth = 5
      FieldName = 'curr_qty'
    end
    object ADOQuery1sal50w: TIntegerField
      DisplayWidth = 5
      FieldName = 'sal50w'
    end
    object ADOQuery1sal10w: TIntegerField
      DisplayWidth = 5
      FieldName = 'sal10w'
    end
    object ADOQuery1sal5w: TIntegerField
      DisplayWidth = 5
      FieldName = 'sal5w'
    end
    object ADOQuery1sal2w: TIntegerField
      DisplayWidth = 5
      FieldName = 'sal2w'
    end
    object ADOQuery1sal1w: TIntegerField
      DisplayWidth = 5
      FieldName = 'sal1w'
    end
    object ADOQuery1sal5s: TIntegerField
      DisplayWidth = 5
      FieldName = 'sal5s'
    end
    object ADOQuery1sal2s: TIntegerField
      DisplayWidth = 5
      FieldName = 'sal2s'
    end
    object ADOQuery1sal1s: TIntegerField
      DisplayWidth = 5
      FieldName = 'sal1s'
    end
    object ADOQuery1sal5h: TIntegerField
      DisplayWidth = 5
      FieldName = 'sal5h'
    end
    object ADOQuery1sal2h: TIntegerField
      DisplayWidth = 5
      FieldName = 'sal2h'
    end
    object ADOQuery1hour_stop: TFloatField
      FieldKind = fkCalculated
      FieldName = 'hour_stop'
      Precision = 2
      Calculated = True
    end
    object ADOQuery1hour_withsal: TFloatField
      FieldKind = fkCalculated
      FieldName = 'hour_withsal'
      Precision = 2
      Calculated = True
    end
    object ADOQuery1hour_sick: TFloatField
      FieldKind = fkCalculated
      FieldName = 'hour_sick'
      Precision = 2
      Calculated = True
    end
    object ADOQuery1hour_suff: TFloatField
      FieldKind = fkCalculated
      FieldName = 'hour_suff'
      Precision = 2
      Calculated = True
    end
    object ADOQuery1hour_late: TFloatField
      FieldKind = fkCalculated
      FieldName = 'hour_late'
      Precision = 2
      Calculated = True
    end
    object ADOQuery1hour_price: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'hour_price'
      Precision = 2
      Calculated = True
    end
    object ADOQuery1hour_overtotal: TFloatField
      FieldKind = fkCalculated
      FieldName = 'hour_overtotal'
      Precision = 2
      Calculated = True
    end
    object ADOQuery1full_sal: TBCDField
      FieldName = 'full_sal'
      Precision = 19
    end
    object ADOQuery1sal_sub: TBCDField
      FieldName = 'sal_sub'
      ReadOnly = True
      Precision = 19
    end
    object ADOQuery1card_no: TTntStringField
      FieldName = 'card_no'
      Size = 25
    end
    object ADOQuery1over15_hour: TFloatField
      FieldName = 'over15_hour'
    end
    object ADOQuery1over20_hour: TFloatField
      FieldName = 'over20_hour'
    end
    object ADOQuery1over30_hour: TFloatField
      FieldName = 'over30_hour'
    end
    object ADOQuery1over195_hour: TFloatField
      FieldName = 'over195_hour'
    end
    object ADOQuery1over15_price: TFloatField
      FieldName = 'over15_price'
    end
    object ADOQuery1over20_price: TFloatField
      FieldName = 'over20_price'
    end
    object ADOQuery1over30_price: TFloatField
      FieldName = 'over30_price'
    end
    object ADOQuery1over195_price: TFloatField
      FieldName = 'over195_price'
    end
    object ADOQuery1ovr_base_pay: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ovr_base_pay'
      Calculated = True
    end
    object ADOQuery1init_base_pay: TFloatField
      FieldKind = fkCalculated
      FieldName = 'init_base_pay'
      Calculated = True
    end
    object ADOQuery1pst_name: TWideStringField
      FieldKind = fkCalculated
      FieldName = 'pst_name'
      Size = 50
      Calculated = True
    end
    object ADOQuery1night_time: TFloatField
      FieldName = 'night_time'
    end
    object ADOQuery1epid_no: TStringField
      FieldKind = fkCalculated
      FieldName = 'epid_no'
      Size = 10
      Calculated = True
    end
    object ADOQuery1grad_money: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'grad_money'
      Calculated = True
    end
  end
  object PrintDialog1: TPrintDialog
    Left = 864
    Top = 324
  end
  object ADOQuery2: TADOQuery
    Connection = DMHrdsys.conn
    Parameters = <>
    Left = 232
    Top = 4
  end
  object ClientDataSet1: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 272
    Top = 8
    Data = {
      EF5000009619E0BD01000000180000003C002200000003000000F30806656D70
      5F6964010049000000010005574944544802000200060007656D705F63687301
      004A00020002000557494454480200020028000B5345525645525F43414C4302
      000380FFFF086E616D655F76696D01004A000200020005574944544802000200
      28000B5345525645525F43414C4302000380FFFF09646570745F636F64650100
      4A00020002000557494454480200020028000B5345525645525F43414C430200
      0380FFFF09646570745F6162627201004A000200020005574944544802000200
      28000B5345525645525F43414C4302000380FFFF087073745F636F6465010049
      00020002000557494454480200020014000B5345525645525F43414C43020003
      80FFFF066570696E647404000600020001000B5345525645525F43414C430200
      0380FFFF077061795F6D6F6E0100490000000100055749445448020002000600
      08626173655F7061790C0005000000020008444543494D414C53020002000400
      0557494454480200020013000B686F75725F6E6F726D616C0800040002000100
      0B5345525645525F43414C4302000380FFFF08647574795F6F66720C00050000
      00020008444543494D414C530200020004000557494454480200020013000874
      6563685F6F66720C0005000000020008444543494D414C530200020004000557
      49445448020002001300086D676D745F6F66720C000500000002000844454349
      4D414C5302000200040005574944544802000200130008677261645F6F66720C
      0005000000020008444543494D414C5302000200040005574944544802000200
      13000873746F705F70617908000400020001000B5345525645525F43414C4302
      000380FFFF0A73616C5F746F74616C3108000400020002000753554254595045
      0200490006004D6F6E6579000B5345525645525F43414C4302000380FFFF0866
      756C6C5F6177640C0005000000020008444543494D414C530200020004000557
      4944544802000200130008656E76725F6F66720C000500000002000844454349
      4D414C5302000200040005574944544802000200130008656666745F6177640C
      0005000000020008444543494D414C5302000200040005574944544802000200
      13000674655F7061790C0005000000020008444543494D414C53020002000400
      055749445448020002001300096F7665725F776F726B0C000500000002000844
      4543494D414C5302000200040005574944544802000200130008676F6E675F70
      61790C0005000000020008444543494D414C5302000200040005574944544802
      00020013000973616C5F6E696768740C0005000000020008444543494D414C53
      02000200040005574944544802000200130009706963635F6261636B0C000500
      0000020008444543494D414C5302000200040005574944544802000200130009
      737570705F616761690C0005000000020008444543494D414C53020002000400
      055749445448020002001300097369636B5F737570700C000500000002000844
      4543494D414C530200020004000557494454480200020013000A73616C5F746F
      74616C32080004000200020007535542545950450200490006004D6F6E657900
      0B5345525645525F43414C4302000380FFFF086465616C5F7061790C00050000
      00020008444543494D414C530200020004000557494454480200020013000870
      6963635F7368650C0005000000020008444543494D414C530200020004000557
      4944544802000200130007706963635F79690C0005000000020008444543494D
      414C53020002000400055749445448020002001300086C61756E5F7061790C00
      05000000020008444543494D414C530200020004000557494454480200020013
      00077461785F7061790C0005000000020008444543494D414C53020002000400
      0557494454480200020013000761736B5F7061790C0005000000020008444543
      494D414C53020002000400055749445448020002001300087375705F64656475
      0C0005000000020008444543494D414C53020002000400055749445448020002
      001300086D65616C5F7061790C0005000000020008444543494D414C53020002
      0004000557494454480200020013000973746F705F646564750C000500000002
      0008444543494D414C530200020004000557494454480200020013000A73616C
      5F746F74616C33080004000200020007535542545950450200490006004D6F6E
      6579000B5345525645525F43414C4302000380FFFF08616374755F7061790C00
      05000000020008444543494D414C530200020004000557494454480200020013
      000673616C6172790C0005000000020008444543494D414C5302000200040005
      574944544802000200130008637572725F71747904000100000000000673616C
      35307704000100000000000673616C31307704000100000000000573616C3577
      04000100000000000573616C327704000100000000000573616C317704000100
      000000000573616C357304000100000000000573616C32730400010000000000
      0573616C317304000100000000000573616C356804000100000000000573616C
      3268040001000000000009686F75725F73746F7008000400020001000B534552
      5645525F43414C4302000380FFFF0C686F75725F7769746873616C0800040002
      0001000B5345525645525F43414C4302000380FFFF09686F75725F7369636B08
      000400020001000B5345525645525F43414C4302000380FFFF09686F75725F73
      75666608000400020001000B5345525645525F43414C4302000380FFFF09686F
      75725F6C61746508000400020001000B5345525645525F43414C4302000380FF
      FF0A686F75725F70726963650800040002000200075355425459504502004900
      06004D6F6E6579000B5345525645525F43414C4302000380FFFF0B686F75725F
      6F766572333008000400020001000B5345525645525F43414C4302000380FFFF
      0B686F75725F6F766572323008000400020001000B5345525645525F43414C43
      02000380FFFF0B686F75725F6F766572313508000400020001000B5345525645
      525F43414C4302000380FFFF0E686F75725F6F766572746F74616C0800040002
      0001000B5345525645525F43414C4302000380FFFF0000005415045000001000
      0001000050555506303630303031063230303630351304000000000594230000
      0013040000000013040000000006230760000013040000000013040000000005
      9250000000130400000000130400000000012115300000130400000000130400
      0000000086538000001304000000001304000000000000000000001304000000
      0013040000000000000000000013040000000013040000000000000000000013
      0400000000130400000000011711500000130400000000130400000000000000
      0000001304000000001304000000000000000000001304000000001304000000
      0000000000000013040000000013040000000001010190000013040000000013
      0400000000000000000000130400000000130400000000000000000000130400
      0000001304000000002235632000001304000000001304000000000000000000
      0013040000000013040000000000000000000013040000000013040000000000
      0000000000130400000000130400000000000000000000130400000000130400
      0000000000000000001304000000001304000000000000000000001304000000
      0013040000000000136000000013040000000013040000000000000000000013
      0400000000130400000000222203200000130400000000130400000000222203
      2000001304000000001800000000000000160000000000000001000000000000
      0000000000010000000000000000000000000000000054150450000010000001
      0000505555063036303030310632303036303613040000000010300000000013
      0400000000130400000000108000000000130400000000130400000000102700
      0000001304000000001304000000000210000000001304000000001304000000
      0001500000000013040000000013040000000001000000000013040000000013
      0400000000000000000000130400000000130400000000000000000000130400
      0000001304000000000203000000001304000000001304000000000000000000
      0013040000000013040000000000000000000013040000000013040000000000
      0000000000130400000000130400000000017510000000130400000000130400
      0000000000000000001304000000001304000000000000000000001304000000
      0013040000000039751000000013040000000013040000000000000000000013
      0400000000130400000000000000000000130400000000130400000000000000
      0000001304000000001304000000000000000000001304000000001304000000
      0000000000000013040000000013040000000000000000000013040000000013
      0400000000002080000000130400000000130400000000000000000000130400
      0000001304000000003954300000001304000000001304000000003954300000
      001304000000002B000000000000002700000001000000000000000000000000
      0000000200000000000000000000000100000000541504500000100000010000
      5055550630363030303106323030363037130400000000103000000000130400
      0000001304000000001080000000001304000000001304000000001027000000
      0013040000000013040000000002100000000013040000000013040000000001
      5000000000130400000000130400000000010000000000130400000000130400
      0000000000000000001304000000001304000000000000000000001304000000
      0013040000000002030000000013040000000013040000000000000000000013
      0400000000130400000000000000000000130400000000130400000000000000
      0000001304000000001304000000000175100000001304000000001304000000
      0000000000000013040000000013040000000000000000000013040000000013
      0400000000397510000000130400000000130400000000000000000000130400
      0000001304000000000000000000001304000000001304000000000000000000
      0013040000000013040000000000000000000013040000000013040000000000
      0000000000130400000000130400000000000000000000130400000000130400
      0000000021600000001304000000001304000000000000000000001304000000
      0013040000000039535000000013040000000013040000000039535000000013
      04000000002B0000000000000027000000010000000000000000000000000000
      0001000000010000000100000000000000005415045000001000000100005055
      5506303630303032063230303630351304000000000250384000001304000000
      0013040000000001884610000013040000000013040000000001680000000013
      0400000000130400000000002153800000130400000000130400000000002423
      0000001304000000001304000000000000000000001304000000001304000000
      0000000000000013040000000013040000000000000000000013040000000013
      0400000000003392300000130400000000130400000000000000000000130400
      0000001304000000000000000000001304000000001304000000000000000000
      0013040000000013040000000000425650000013040000000013040000000000
      0000000000130400000000130400000000000000000000130400000000130400
      0000000729102000001304000000001304000000000000000000001304000000
      0013040000000000000000000013040000000013040000000000000000000013
      0400000000130400000000000000000000130400000000130400000000000000
      0000001304000000001304000000000000000000001304000000001304000000
      0000072000000013040000000013040000000000000000000013040000000013
      0400000000072190200000130400000000130400000000072190200000130400
      0000000C00000000000000070000000000000001000000000000000000000000
      0000000100000001000000020000000054150450000010000001000050555506
      3036303030320632303036303613040000000009300000000013040000000013
      0400000000070000000000130400000000130400000000062400000000130400
      0000001304000000000080000000001304000000001304000000000090000000
      0013040000000013040000000001000000000013040000000013040000000000
      0000000000130400000000130400000000000000000000130400000000130400
      0000000126000000001304000000001304000000000000000000001304000000
      0013040000000000000000000013040000000013040000000000000000000013
      0400000000130400000000015810000000130400000000130400000000000000
      0000001304000000001304000000000000000000001304000000001304000000
      0028081000000013040000000013040000000000000000000013040000000013
      0400000000000000000000130400000000130400000000000000000000130400
      0000001304000000000000000000001304000000001304000000000000000000
      0013040000000013040000000000000000000013040000000013040000000000
      2080000000130400000000130400000000000000000000130400000000130400
      0000002787300000001304000000001304000000002787300000001304000000
      0021000000000000001B00000001000000010000000100000001000000010000
      0000000000000000000100000000541504500000100000010000505555063036
      3030303206323030363037130400000000093000000000130400000000130400
      0000000700000000001304000000001304000000000624000000001304000000
      0013040000000000800000000013040000000013040000000000900000000013
      0400000000130400000000010000000000130400000000130400000000000000
      0000001304000000001304000000000000000000001304000000001304000000
      0001260000000013040000000013040000000000000000000013040000000013
      0400000000000000000000130400000000130400000000000000000000130400
      0000001304000000000158100000001304000000001304000000000000000000
      0013040000000013040000000000000000000013040000000013040000000028
      0810000000130400000000130400000000000000000000130400000000130400
      0000000000000000001304000000001304000000000000000000001304000000
      0013040000000000000000000013040000000013040000000000000000000013
      0400000000130400000000000000000000130400000000130400000000002160
      0000001304000000001304000000000000000000001304000000001304000000
      0027865000000013040000000013040000000027865000000013040000000021
      000000000000001B000000010000000100000001000000010000000000000001
      0000000100000000000000005415045000001000000100005055550630363030
      3033063230303630361304000000000786923000001304000000001304000000
      0007192300000013040000000013040000000008690000000013040000000013
      0400000000013538400000130400000000130400000000010153800000130400
      0000001304000000000000000000001304000000001304000000000000000000
      0013040000000013040000000000000000000013040000000013040000000000
      0000000000130400000000130400000000000000000000130400000000130400
      0000000000000000001304000000001304000000000000000000001304000000
      0013040000000001337760000013040000000013040000000000000000000013
      0400000000130400000000000000000000130400000000130400000000274585
      2000001304000000001304000000000000000000001304000000001304000000
      0000000000000013040000000013040000000000000000000013040000000013
      0400000000000000000000130400000000130400000000023746100000130400
      0000001304000000000000000000001304000000001304000000000016800000
      0013040000000013040000000000000000000013040000000013040000000024
      91590000001304000000001304000000002491590000001304000000001D0000
      0000000000180000000100000002000000000000000000000000000000010000
      0001000000000000000054150450000010000001000050555506303630303033
      0632303036303713040000000009300000000013040000000013040000000008
      5000000000130400000000130400000000102700000000130400000000130400
      0000000160000000001304000000001304000000000120000000001304000000
      0013040000000000000000000013040000000013040000000000000000000013
      0400000000130400000000000000000000130400000000130400000000051300
      0000001304000000001304000000000000000000001304000000001304000000
      0000000000000013040000000013040000000000000000000013040000000013
      0400000000015810000000130400000000130400000000000000000000130400
      0000001304000000000000000000001304000000001304000000003758100000
      0013040000000013040000000000000000000013040000000013040000000000
      0000000000130400000000130400000000000000000000130400000000130400
      0000000000000000001304000000001304000000000276923000001304000000
      0013040000000000000000000013040000000013040000000000192000000013
      0400000000130400000000000000000000130400000000130400000000346197
      6000001304000000001304000000003461976000001304000000002800000000
      0000002200000001000000000000000100000000000000000000000100000001
      0000000200000000541504500000100000010000505555063036303030340632
      3030363036130400000000005461500000130400000000130400000000004615
      3000001304000000001304000000000048000000001304000000001304000000
      0000000000000013040000000013040000000000015380000013040000000013
      0400000000000000000000130400000000130400000000000000000000130400
      0000001304000000000000000000001304000000001304000000000000000000
      0013040000000013040000000000000000000013040000000013040000000000
      0000000000130400000000130400000000000000000000130400000000130400
      0000000009284000001304000000001304000000000000000000001304000000
      0013040000000000000000000013040000000013040000000001595910000013
      0400000000130400000000000000000000130400000000130400000000000000
      0000001304000000001304000000000000000000001304000000001304000000
      0000000000000013040000000013040000000000000000000013040000000013
      0400000000000000000000130400000000130400000000000240000000130400
      0000001304000000000000000000001304000000001304000000000157191000
      0013040000000013040000000001571910000013040000000004000000000000
      0001000000010000000000000000000000010000000100000000000000000000
      0000000000005415045000001000000100005055550630363030303406323030
      3630371304000000000710000000001304000000001304000000000600000000
      0013040000000013040000000006240000000013040000000013040000000000
      0000000000130400000000130400000000002000000000130400000000130400
      0000000020000000001304000000001304000000000000000000001304000000
      0013040000000000000000000013040000000013040000000001960000000013
      0400000000130400000000000000000000130400000000130400000000000000
      0000001304000000001304000000000000000000001304000000001304000000
      0001207000000013040000000013040000000000000000000013040000000013
      0400000000000000000000130400000000130400000000229070000000130400
      0000001304000000000000000000001304000000001304000000000000000000
      0013040000000013040000000000000000000013040000000013040000000000
      0000000000130400000000130400000000008269200000130400000000130400
      0000000000000000001304000000001304000000000020000000001304000000
      0013040000000000000000000013040000000013040000000021880070000013
      04000000001304000000002188007000001304000000001B0000000000000015
      0000000100000001000000010000000100000001000000010000000000000000
      0000000054150450000010000001000050555506303630303035063230303630
      3713040000000006553840000013040000000013040000000003876920000013
      0400000000130400000000000000000000130400000000130400000000000000
      0000001304000000001304000000000018461000001304000000001304000000
      0000000000000013040000000013040000000000000000000013040000000013
      0400000000000000000000130400000000130400000000000000000000130400
      0000001304000000000000000000001304000000001304000000000000000000
      0013040000000013040000000000000000000013040000000013040000000001
      1141500000130400000000130400000000000000000000130400000000130400
      0000000000000000001304000000001304000000001172953000001304000000
      0013040000000000000000000013040000000013040000000000000000000013
      0400000000130400000000000000000000130400000000130400000000000000
      0000001304000000001304000000000000000000001304000000001304000000
      0000000000000013040000000013040000000000208000000013040000000013
      0400000000000000000000130400000000130400000000115215300000130400
      0000001304000000001152153000001304000000000D000000000000000B0000
      0001000000000000000000000000000000010000000000000000000000000000
      0000541504500000100000010000505555063036303030360632303036303713
      0400000000038230700000130400000000130400000000019384600000130400
      0000001304000000000000000000001304000000001304000000000000000000
      0013040000000013040000000000092300000013040000000013040000000000
      0000000000130400000000130400000000000000000000130400000000130400
      0000000000000000001304000000001304000000000000000000001304000000
      0013040000000000000000000013040000000013040000000000000000000013
      0400000000130400000000000000000000130400000000130400000000006499
      2000001304000000001304000000000000000000001304000000001304000000
      0000000000000013040000000013040000000006503760000013040000000013
      0400000000000000000000130400000000130400000000000000000000130400
      0000001304000000000000000000001304000000001304000000000000000000
      0013040000000013040000000000418130000013040000000013040000000000
      0000000000130400000000130400000000001120000000130400000000130400
      0000000000000000001304000000001304000000000597362000001304000000
      001304000000000597362000001304000000000B000000000000000500000001
      0000000200000000000000010000000100000000000000000000000100000000
      5415045000001000000100005055550630363030303706323030363037130400
      0000000327692000001304000000001304000000000157846000001304000000
      0013040000000001500000000013040000000013040000000000000000000013
      0400000000130400000000000923000000130400000000130400000000000000
      0000001304000000001304000000000000000000001304000000001304000000
      0000000000000013040000000013040000000000000000000013040000000013
      0400000000000000000000130400000000130400000000000000000000130400
      0000001304000000000000000000001304000000001304000000000055707000
      0013040000000013040000000000000000000013040000000013040000000000
      0000000000130400000000130400000000070047600000130400000000130400
      0000000000000000001304000000001304000000000000000000001304000000
      0013040000000000000000000013040000000013040000000000000000000013
      0400000000130400000000002686500000130400000000130400000000000000
      0000001304000000001304000000000010400000001304000000001304000000
      0000000000000013040000000013040000000006632100000013040000000013
      04000000000663210000001304000000000B0000000000000006000000010000
      0000000000010000000000000001000000010000000000000001000000005415
      0450000010000001000050555506303630303038063230303630371304000000
      0003276920000013040000000013040000000001578460000013040000000013
      0400000000004800000000130400000000130400000000000000000000130400
      0000001304000000000009230000001304000000001304000000000000000000
      0013040000000013040000000000000000000013040000000013040000000000
      0000000000130400000000130400000000000000000000130400000000130400
      0000000000000000001304000000001304000000000000000000001304000000
      0013040000000000000000000013040000000013040000000000557070000013
      0400000000130400000000000000000000130400000000130400000000000000
      0000001304000000001304000000000598476000001304000000001304000000
      0000000000000013040000000013040000000000000000000013040000000013
      0400000000000000000000130400000000130400000000000000000000130400
      0000001304000000000135692000001304000000001304000000000000000000
      0013040000000013040000000000080000000013040000000013040000000000
      0000000000130400000000130400000000045478300000130400000000130400
      0000000454783000001304000000000900000000000000040000000100000000
      0000000000000000000000020000000000000001000000010000000054150450
      0000100000010000505555063036303030390632303036303713040000000003
      0038400000130400000000130400000000014469200000130400000000130400
      0000000044000000001304000000001304000000000000000000001304000000
      0013040000000000084610000013040000000013040000000000000000000013
      0400000000130400000000000000000000130400000000130400000000000000
      0000001304000000001304000000000000000000001304000000001304000000
      0000000000000013040000000013040000000000000000000013040000000013
      0400000000000000000000130400000000130400000000005106500000130400
      0000001304000000000000000000001304000000001304000000000000000000
      0013040000000013040000000005486030000013040000000013040000000000
      0000000000130400000000130400000000000000000000130400000000130400
      0000000000000000001304000000001304000000000000000000001304000000
      0013040000000000452300000013040000000013040000000000000000000013
      0400000000130400000000000880000000130400000000130400000000000000
      0000001304000000001304000000000494572000001304000000001304000000
      000494572000001304000000000A000000000000000400000001000000020000
      0000000000000000000200000000000000010000000000000000541504500000
      1000000100005055550630363030313006323030363037130400000000030038
      4000001304000000001304000000000177692000001304000000001304000000
      0000000000000013040000000013040000000000000000000013040000000013
      0400000000000846100000130400000000130400000000000000000000130400
      0000001304000000000000000000001304000000001304000000000000000000
      0013040000000013040000000000000000000013040000000013040000000000
      0000000000130400000000130400000000000000000000130400000000130400
      0000000000000000001304000000001304000000000051065000001304000000
      0013040000000000000000000013040000000013040000000000000000000013
      0400000000130400000000053760300000130400000000130400000000000000
      0000001304000000001304000000000000000000001304000000001304000000
      0000000000000013040000000013040000000000000000000013040000000013
      0400000000013269200000130400000000130400000000000000000000130400
      0000001304000000000007200000001304000000001304000000000000000000
      0013040000000013040000000003977100000013040000000013040000000003
      97710000001304000000000A0000000000000003000000010000000200000000
      0000000100000001000000000000000100000001000000005415045000001000
      0001000050555506303630303131063230303630371304000000000300384000
      0013040000000013040000000001776920000013040000000013040000000001
      3750000000130400000000130400000000000000000000130400000000130400
      0000000008461000001304000000001304000000000000000000001304000000
      0013040000000000000000000013040000000013040000000000000000000013
      0400000000130400000000000000000000130400000000130400000000000000
      0000001304000000001304000000000000000000001304000000001304000000
      0000000000000013040000000013040000000000510650000013040000000013
      0400000000000000000000130400000000130400000000000000000000130400
      0000001304000000000675103000001304000000001304000000000000000000
      0013040000000013040000000000000000000013040000000013040000000000
      0000000000130400000000130400000000000000000000130400000000130400
      0000000170192000001304000000001304000000000000000000001304000000
      0013040000000000072000000013040000000013040000000000000000000013
      0400000000130400000000049771000000130400000000130400000000049771
      0000001304000000000B00000000000000040000000100000002000000000000
      0001000000010000000000000001000000010000000054150450000010000001
      0000505555063036303031320632303036303713040000000002730760000013
      0400000000130400000000002923000000130400000000130400000000004000
      0000001304000000001304000000000000000000001304000000001304000000
      0000076920000013040000000013040000000000000000000013040000000013
      0400000000000000000000130400000000130400000000000000000000130400
      0000001304000000000000000000001304000000001304000000000000000000
      0013040000000013040000000000000000000013040000000013040000000000
      0000000000130400000000130400000000004642300000130400000000130400
      0000000000000000001304000000001304000000000000000000001304000000
      0013040000000003964220000013040000000013040000000000000000000013
      0400000000130400000000000000000000130400000000130400000000000000
      0000001304000000001304000000000000000000001304000000001304000000
      0000000000000013040000000013040000000000000000000013040000000013
      0400000000000880000000130400000000130400000000000000000000130400
      0000001304000000000387622000001304000000001304000000000387622000
      001304000000000B000000000000000300000001000000010000000100000001
      0000000100000000000000000000000300000000541504500000100000010000
      5055550630363030313306323030363037130400000000027307600000130400
      0000001304000000000161538000001304000000001304000000000125000000
      0013040000000013040000000000000000000013040000000013040000000000
      0769200000130400000000130400000000000000000000130400000000130400
      0000000000000000001304000000001304000000000000000000001304000000
      0013040000000000000000000013040000000013040000000000000000000013
      0400000000130400000000000000000000130400000000130400000000000000
      0000001304000000001304000000000046423000001304000000001304000000
      0000000000000013040000000013040000000000000000000013040000000013
      0400000000061373000000130400000000130400000000000000000000130400
      0000001304000000000000000000001304000000001304000000000000000000
      0013040000000013040000000000000000000013040000000013040000000000
      0000000000130400000000130400000000000000000000130400000000130400
      0000000008000000001304000000001304000000000000000000001304000000
      0013040000000006057300000013040000000013040000000006057300000013
      0400000000090000000000000006000000000000000000000000000000010000
      0000000000000000000100000001000000005415045000001000000100005055
      5506303630303134063230303630371304000000000245769000001304000000
      0013040000000000263070000013040000000013040000000000360000000013
      0400000000130400000000000000000000130400000000130400000000000692
      3000001304000000001304000000000000000000001304000000001304000000
      0000000000000013040000000013040000000000000000000013040000000013
      0400000000000000000000130400000000130400000000000000000000130400
      0000001304000000000000000000001304000000001304000000000000000000
      0013040000000013040000000000417800000013040000000013040000000000
      0000000000130400000000130400000000000000000000130400000000130400
      0000000356780000001304000000001304000000000000000000001304000000
      0013040000000000000000000013040000000013040000000000000000000013
      0400000000130400000000000000000000130400000000130400000000000000
      0000001304000000001304000000000000000000001304000000001304000000
      0000080000000013040000000013040000000000000000000013040000000013
      0400000000034878000000130400000000130400000000034878000000130400
      0000000A00000000000000030000000000000002000000000000000100000001
      0000000100000001000000010000000054150450000010000001000050555506
      3036303031350632303036303713040000000002457690000013040000000013
      0400000000002630700000130400000000130400000000003600000000130400
      0000001304000000000000000000001304000000001304000000000006923000
      0013040000000013040000000000000000000013040000000013040000000000
      0000000000130400000000130400000000000000000000130400000000130400
      0000000000000000001304000000001304000000000000000000001304000000
      0013040000000000000000000013040000000013040000000000000000000013
      0400000000130400000000004178000000130400000000130400000000000000
      0000001304000000001304000000000000000000001304000000001304000000
      0003567800000013040000000013040000000000000000000013040000000013
      0400000000000000000000130400000000130400000000000000000000130400
      0000001304000000000000000000001304000000001304000000000034999000
      0013040000000013040000000000000000000013040000000013040000000000
      0720000000130400000000130400000000000000000000130400000000130400
      0000000314580000001304000000001304000000000314580000001304000000
      0007000000000000000300000000000000000000000100000000000000020000
      0000000000010000000000000000541504500000100000010000505555063036
      3030313606323030363037130400000000024576900000130400000000130400
      0000000026307000001304000000001304000000000036000000001304000000
      0013040000000000000000000013040000000013040000000000069230000013
      0400000000130400000000000000000000130400000000130400000000000000
      0000001304000000001304000000000000000000001304000000001304000000
      0000000000000013040000000013040000000000000000000013040000000013
      0400000000000000000000130400000000130400000000000000000000130400
      0000001304000000000041780000001304000000001304000000000000000000
      0013040000000013040000000000000000000013040000000013040000000003
      5678000000130400000000130400000000000000000000130400000000130400
      0000000000000000001304000000001304000000000000000000001304000000
      0013040000000000000000000013040000000013040000000000000000000013
      0400000000130400000000000000000000130400000000130400000000000800
      0000001304000000001304000000000000000000001304000000001304000000
      000348780000001304000000001304000000000348780000001304000000000A
      0000000000000003000000000000000200000000000000010000000100000001
      0000000100000001000000005415045000001000000100005055550630363030
      3137063230303630371304000000000245769000001304000000001304000000
      0000263070000013040000000013040000000000360000000013040000000013
      0400000000000000000000130400000000130400000000000692300000130400
      0000001304000000000000000000001304000000001304000000000000000000
      0013040000000013040000000000000000000013040000000013040000000000
      0000000000130400000000130400000000000000000000130400000000130400
      0000000000000000001304000000001304000000000000000000001304000000
      0013040000000000417800000013040000000013040000000000000000000013
      0400000000130400000000000000000000130400000000130400000000035678
      0000001304000000001304000000000000000000001304000000001304000000
      0000000000000013040000000013040000000000000000000013040000000013
      0400000000000000000000130400000000130400000000000000000000130400
      0000001304000000000000000000001304000000001304000000000008000000
      0013040000000013040000000000000000000013040000000013040000000003
      48780000001304000000001304000000000348780000001304000000000A0000
      0000000000030000000000000002000000000000000100000001000000010000
      0001000000010000000054150450000010000001000050555506303630303138
      0632303036303713040000000002457690000013040000000013040000000000
      2630700000130400000000130400000000003600000000130400000000130400
      0000000000000000001304000000001304000000000006923000001304000000
      0013040000000000000000000013040000000013040000000000000000000013
      0400000000130400000000000000000000130400000000130400000000000000
      0000001304000000001304000000000000000000001304000000001304000000
      0000000000000013040000000013040000000000000000000013040000000013
      0400000000004178000000130400000000130400000000000000000000130400
      0000001304000000000000000000001304000000001304000000000356780000
      0013040000000013040000000000000000000013040000000013040000000000
      0000000000130400000000130400000000000000000000130400000000130400
      0000000000000000001304000000001304000000000000000000001304000000
      0013040000000000000000000013040000000013040000000000080000000013
      0400000000130400000000000000000000130400000000130400000000034878
      0000001304000000001304000000000348780000001304000000000A00000000
      0000000300000000000000020000000000000001000000010000000100000001
      0000000100000000541504500000100000010000505555063036303031390632
      3030363037130400000000024576900000130400000000130400000000002630
      7000001304000000001304000000000036000000001304000000001304000000
      0000000000000013040000000013040000000000069230000013040000000013
      0400000000000000000000130400000000130400000000000000000000130400
      0000001304000000000000000000001304000000001304000000000000000000
      0013040000000013040000000000000000000013040000000013040000000000
      0000000000130400000000130400000000000000000000130400000000130400
      0000000041780000001304000000001304000000000000000000001304000000
      0013040000000000000000000013040000000013040000000003567800000013
      0400000000130400000000000000000000130400000000130400000000000000
      0000001304000000001304000000000000000000001304000000001304000000
      0000000000000013040000000013040000000000000000000013040000000013
      0400000000000000000000130400000000130400000000000800000000130400
      0000001304000000000000000000001304000000001304000000000348780000
      001304000000001304000000000348780000001304000000000A000000000000
      0003000000000000000200000000000000010000000100000001000000010000
      0001000000005415045000001000000100005055550630363030323006323030
      3630371304000000000245769000001304000000001304000000000026307000
      0013040000000013040000000000360000000013040000000013040000000000
      0000000000130400000000130400000000000692300000130400000000130400
      0000000000000000001304000000001304000000000000000000001304000000
      0013040000000000000000000013040000000013040000000000000000000013
      0400000000130400000000000000000000130400000000130400000000000000
      0000001304000000001304000000000000000000001304000000001304000000
      0000417800000013040000000013040000000000000000000013040000000013
      0400000000000000000000130400000000130400000000035678000000130400
      0000001304000000000000000000001304000000001304000000000000000000
      0013040000000013040000000000000000000013040000000013040000000000
      0000000000130400000000130400000000000000000000130400000000130400
      0000000000000000001304000000001304000000000008000000001304000000
      0013040000000000000000000013040000000013040000000003487800000013
      04000000001304000000000348780000001304000000000A0000000000000003
      0000000000000002000000000000000100000001000000010000000100000001
      0000000054150450000010000001000050555506303630303231063230303630
      3713040000000002457690000013040000000013040000000000263070000013
      0400000000130400000000003600000000130400000000130400000000000000
      0000001304000000001304000000000006923000001304000000001304000000
      0000000000000013040000000013040000000000000000000013040000000013
      0400000000000000000000130400000000130400000000000000000000130400
      0000001304000000000000000000001304000000001304000000000000000000
      0013040000000013040000000000000000000013040000000013040000000000
      4178000000130400000000130400000000000000000000130400000000130400
      0000000000000000001304000000001304000000000356780000001304000000
      0013040000000000000000000013040000000013040000000000000000000013
      0400000000130400000000000000000000130400000000130400000000000000
      0000001304000000001304000000000000000000001304000000001304000000
      0000000000000013040000000013040000000000080000000013040000000013
      0400000000000000000000130400000000130400000000034878000000130400
      0000001304000000000348780000001304000000000A00000000000000030000
      0000000000020000000000000001000000010000000100000001000000010000
      0000541504500000100000010000505555063036303032320632303036303713
      0400000000024576900000130400000000130400000000002630700000130400
      0000001304000000000036000000001304000000001304000000000000000000
      0013040000000013040000000000069230000013040000000013040000000000
      0000000000130400000000130400000000000000000000130400000000130400
      0000000000000000001304000000001304000000000000000000001304000000
      0013040000000000000000000013040000000013040000000000000000000013
      0400000000130400000000000000000000130400000000130400000000004178
      0000001304000000001304000000000000000000001304000000001304000000
      0000000000000013040000000013040000000003567800000013040000000013
      0400000000000000000000130400000000130400000000000000000000130400
      0000001304000000000000000000001304000000001304000000000000000000
      0013040000000013040000000000000000000013040000000013040000000000
      0000000000130400000000130400000000000800000000130400000000130400
      0000000000000000001304000000001304000000000348780000001304000000
      001304000000000348780000001304000000000A000000000000000300000000
      0000000200000000000000010000000100000001000000010000000100000000
      5415045000001000000100005055550630363030323306323030363037130400
      0000000245769000001304000000001304000000000026307000001304000000
      0013040000000000360000000013040000000013040000000000000000000013
      0400000000130400000000000692300000130400000000130400000000000000
      0000001304000000001304000000000000000000001304000000001304000000
      0000000000000013040000000013040000000000000000000013040000000013
      0400000000000000000000130400000000130400000000000000000000130400
      0000001304000000000000000000001304000000001304000000000041780000
      0013040000000013040000000000000000000013040000000013040000000000
      0000000000130400000000130400000000035678000000130400000000130400
      0000000000000000001304000000001304000000000000000000001304000000
      0013040000000000000000000013040000000013040000000000000000000013
      0400000000130400000000000000000000130400000000130400000000000000
      0000001304000000001304000000000008000000001304000000001304000000
      0000000000000013040000000013040000000003487800000013040000000013
      04000000000348780000001304000000000A0000000000000003000000000000
      0002000000000000000100000001000000010000000100000001000000005415
      0450000010000001000050555506303630303234063230303630371304000000
      0002184610000013040000000013040000000000233840000013040000000013
      0400000000003200000000130400000000130400000000000000000000130400
      0000001304000000000006153000001304000000001304000000000000000000
      0013040000000013040000000000000000000013040000000013040000000000
      0000000000130400000000130400000000000000000000130400000000130400
      0000000000000000001304000000001304000000000000000000001304000000
      0013040000000000000000000013040000000013040000000000371380000013
      0400000000130400000000000000000000130400000000130400000000000000
      0000001304000000001304000000000317137000001304000000001304000000
      0000000000000013040000000013040000000000000000000013040000000013
      0400000000000000000000130400000000130400000000000000000000130400
      0000001304000000000000000000001304000000001304000000000000000000
      0013040000000013040000000000072000000013040000000013040000000000
      0000000000130400000000130400000000030993700000130400000000130400
      0000000309937000001304000000000900000000000000030000000000000000
      0000000000000001000000020000000000000001000000020000000054150450
      0000100000010000505555063036303032350632303036303713040000000001
      9115300000130400000000130400000000016153800000130400000000130400
      0000000168000000001304000000001304000000000000000000001304000000
      0013040000000000053840000013040000000013040000000000000000000013
      0400000000130400000000000000000000130400000000130400000000000000
      0000001304000000001304000000000079692000001304000000001304000000
      0000000000000013040000000013040000000000000000000013040000000013
      0400000000000000000000130400000000130400000000003249600000130400
      0000001304000000000000000000001304000000001304000000000000000000
      0013040000000013040000000006382640000013040000000013040000000000
      0000000000130400000000130400000000000000000000130400000000130400
      0000000000000000001304000000001304000000000000000000001304000000
      0013040000000000782180000013040000000013040000000000000000000013
      0400000000130400000000000560000000130400000000130400000000000000
      0000001304000000001304000000000554445000001304000000001304000000
      000554445000001304000000000A000000000000000500000001000000000000
      0000000000000000000200000000000000000000000200000000541504500000
      1000000100005055550630363030323606323030363037130400000000000000
      0000001304000000001304000000000000000000001304000000001304000000
      0000000000000013040000000013040000000000000000000013040000000013
      0400000000000000000000130400000000130400000000000000000000130400
      0000001304000000000000000000001304000000001304000000000000000000
      0013040000000013040000000000000000000013040000000013040000000000
      0000000000130400000000130400000000000000000000130400000000130400
      0000000000000000001304000000001304000000000000000000001304000000
      0013040000000000000000000013040000000013040000000000000000000013
      0400000000130400000000000000000000130400000000130400000000000000
      0000001304000000001304000000000000000000001304000000001304000000
      0000000000000013040000000013040000000000000000000013040000000013
      0400000000000000000000130400000000130400000000000000000000130400
      0000001304000000000000800000001304000000001304000000000000000000
      0013040000000013040000000000000000000013040000000013040000000000
      0000000000130400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000005415045000001000
      0001000050555506303630303237063230303630371304000000000000000000
      0013040000000013040000000000000000000013040000000013040000000000
      0000000000130400000000130400000000000000000000130400000000130400
      0000000000000000001304000000001304000000000000000000001304000000
      0013040000000000000000000013040000000013040000000000000000000013
      0400000000130400000000000000000000130400000000130400000000000000
      0000001304000000001304000000000000000000001304000000001304000000
      0000000000000013040000000013040000000000000000000013040000000013
      0400000000000000000000130400000000130400000000000000000000130400
      0000001304000000000000000000001304000000001304000000000000000000
      0013040000000013040000000000000000000013040000000013040000000000
      0000000000130400000000130400000000000000000000130400000000130400
      0000000000000000001304000000001304000000000000000000001304000000
      0013040000000000008000000013040000000013040000000000000000000013
      0400000000130400000000000000000000130400000000130400000000000000
      0000001304000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000054150450000010000001
      0000505555063036303034320632303036303713040000000001092300000000
      0000000000130400000000001169200000000000000000130400000000001600
      0000000000000000001304000000000000000000000000000000001304000000
      0000030760000000000000000013040000000000000000000000000000000013
      0400000000000000000000000000000000130400000000000000000000000000
      0000001304000000000000000000000000000000001304000000000000000000
      0000000000000013040000000000000000000000000000000013040000000000
      0000000000000000000000130400000000001856900000000000000000130400
      0000000000000000000000000000001304000000000000000000000000000000
      0013040000000001585680000000000000000013040000000000000000000000
      0000000000130400000000000000000000000000000000130400000000000000
      0000000000000000001304000000000000000000000000000000001304000000
      0000000000000000000000000013040000000000000000000000000000000013
      0400000000000400000000000000000000130400000000000000000000000000
      0000001304000000000154568000000000000000001304000000000154568000
      0000000000000005000000000000000100000001000000000000000000000000
      00000002000000000000000100000000000000}
    object ClientDataSet1emp_id: TStringField
      FieldName = 'emp_id'
      Size = 6
    end
    object ClientDataSet1emp_chs: TWideStringField
      FieldName = 'emp_chs'
      ReadOnly = True
    end
    object ClientDataSet1name_vim: TWideStringField
      FieldName = 'name_vim'
      ReadOnly = True
    end
    object ClientDataSet1dept_code: TWideStringField
      FieldName = 'dept_code'
      ReadOnly = True
    end
    object ClientDataSet1dept_abbr: TWideStringField
      FieldName = 'dept_abbr'
      ReadOnly = True
    end
    object ClientDataSet1pst_code: TStringField
      FieldName = 'pst_code'
      ReadOnly = True
    end
    object ClientDataSet1epindt: TDateField
      FieldName = 'epindt'
      ReadOnly = True
    end
    object ClientDataSet1pay_mon: TStringField
      FieldName = 'pay_mon'
      Size = 6
    end
    object ClientDataSet1base_pay: TBCDField
      FieldName = 'base_pay'
      Precision = 19
    end
    object ClientDataSet1hour_normal: TFloatField
      FieldName = 'hour_normal'
      ReadOnly = True
    end
    object ClientDataSet1duty_ofr: TBCDField
      FieldName = 'duty_ofr'
      Precision = 19
    end
    object ClientDataSet1tech_ofr: TBCDField
      FieldName = 'tech_ofr'
      Precision = 19
    end
    object ClientDataSet1mgmt_ofr: TBCDField
      FieldName = 'mgmt_ofr'
      Precision = 19
    end
    object ClientDataSet1grad_ofr: TBCDField
      FieldName = 'grad_ofr'
      Precision = 19
    end
    object ClientDataSet1stop_pay: TFloatField
      FieldName = 'stop_pay'
      ReadOnly = True
    end
    object ClientDataSet1sal_total1: TCurrencyField
      FieldName = 'sal_total1'
      ReadOnly = True
    end
    object ClientDataSet1full_awd: TBCDField
      FieldName = 'full_awd'
      Precision = 19
    end
    object ClientDataSet1envr_ofr: TBCDField
      FieldName = 'envr_ofr'
      Precision = 19
    end
    object ClientDataSet1efft_awd: TBCDField
      FieldName = 'efft_awd'
      Precision = 19
    end
    object ClientDataSet1te_pay: TBCDField
      FieldName = 'te_pay'
      Precision = 19
    end
    object ClientDataSet1over_work: TBCDField
      FieldName = 'over_work'
      Precision = 19
    end
    object ClientDataSet1gong_pay: TBCDField
      FieldName = 'gong_pay'
      Precision = 19
    end
    object ClientDataSet1sal_night: TBCDField
      FieldName = 'sal_night'
      Precision = 19
    end
    object ClientDataSet1picc_back: TBCDField
      FieldName = 'picc_back'
      Precision = 19
    end
    object ClientDataSet1supp_agai: TBCDField
      FieldName = 'supp_agai'
      Precision = 19
    end
    object ClientDataSet1sick_supp: TBCDField
      FieldName = 'sick_supp'
      Precision = 19
    end
    object ClientDataSet1sal_total2: TCurrencyField
      FieldName = 'sal_total2'
      ReadOnly = True
    end
    object ClientDataSet1deal_pay: TBCDField
      FieldName = 'deal_pay'
      Precision = 19
    end
    object ClientDataSet1picc_she: TBCDField
      FieldName = 'picc_she'
      Precision = 19
    end
    object ClientDataSet1picc_yi: TBCDField
      FieldName = 'picc_yi'
      Precision = 19
    end
    object ClientDataSet1picc_shiye: TFloatField
      FieldKind = fkCalculated
      FieldName = 'picc_shiye'
      Calculated = True
    end
    object ClientDataSet1laun_pay: TBCDField
      FieldName = 'laun_pay'
      Precision = 19
    end
    object ClientDataSet1tax_pay: TBCDField
      FieldName = 'tax_pay'
      Precision = 19
    end
    object ClientDataSet1ask_pay: TBCDField
      FieldName = 'ask_pay'
      Precision = 19
    end
    object ClientDataSet1sup_dedu: TBCDField
      FieldName = 'sup_dedu'
      Precision = 19
    end
    object ClientDataSet1meal_pay: TBCDField
      FieldName = 'meal_pay'
      Precision = 19
    end
    object ClientDataSet1stop_dedu: TBCDField
      FieldName = 'stop_dedu'
      Precision = 19
    end
    object ClientDataSet1sal_total3: TCurrencyField
      FieldName = 'sal_total3'
      ReadOnly = True
    end
    object ClientDataSet1actu_pay: TBCDField
      FieldName = 'actu_pay'
      Precision = 19
    end
    object ClientDataSet1salary: TBCDField
      FieldName = 'salary'
      Precision = 19
    end
    object ClientDataSet1curr_qty: TIntegerField
      FieldName = 'curr_qty'
    end
    object ClientDataSet1sal50w: TIntegerField
      FieldName = 'sal50w'
    end
    object ClientDataSet1sal10w: TIntegerField
      FieldName = 'sal10w'
    end
    object ClientDataSet1sal5w: TIntegerField
      FieldName = 'sal5w'
    end
    object ClientDataSet1sal2w: TIntegerField
      FieldName = 'sal2w'
    end
    object ClientDataSet1sal1w: TIntegerField
      FieldName = 'sal1w'
    end
    object ClientDataSet1sal5s: TIntegerField
      FieldName = 'sal5s'
    end
    object ClientDataSet1sal2s: TIntegerField
      FieldName = 'sal2s'
    end
    object ClientDataSet1sal1s: TIntegerField
      FieldName = 'sal1s'
    end
    object ClientDataSet1sal5h: TIntegerField
      FieldName = 'sal5h'
    end
    object ClientDataSet1sal2h: TIntegerField
      FieldName = 'sal2h'
    end
    object ClientDataSet1hour_stop: TFloatField
      FieldName = 'hour_stop'
      ReadOnly = True
    end
    object ClientDataSet1hour_withsal: TFloatField
      FieldName = 'hour_withsal'
      ReadOnly = True
    end
    object ClientDataSet1hour_sick: TFloatField
      FieldName = 'hour_sick'
      ReadOnly = True
    end
    object ClientDataSet1hour_suff: TFloatField
      FieldName = 'hour_suff'
      ReadOnly = True
    end
    object ClientDataSet1hour_late: TFloatField
      FieldName = 'hour_late'
      ReadOnly = True
    end
    object ClientDataSet1hour_price: TCurrencyField
      FieldName = 'hour_price'
      ReadOnly = True
    end
    object ClientDataSet1hour_over30: TFloatField
      FieldName = 'hour_over30'
      ReadOnly = True
    end
    object ClientDataSet1hour_over20: TFloatField
      FieldName = 'hour_over20'
      ReadOnly = True
    end
    object ClientDataSet1hour_over15: TFloatField
      FieldName = 'hour_over15'
      ReadOnly = True
    end
    object ClientDataSet1hour_overtotal: TFloatField
      FieldName = 'hour_overtotal'
      ReadOnly = True
    end
  end
  object qry_prof: TADOQuery
    Connection = DMHrdsys.conn
    LockType = ltBatchOptimistic
    CommandTimeout = 0
    Parameters = <>
    Left = 112
    Top = 380
  end
end
