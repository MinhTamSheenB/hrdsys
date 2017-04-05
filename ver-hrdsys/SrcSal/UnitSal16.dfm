object FormSal16: TFormSal16
  Left = 237
  Top = 135
  Width = 800
  Height = 500
  Caption = 'FormSal16'
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
      Caption = 'sal16_titl'
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
        Height = 97
        Align = alTop
        TabOrder = 0
        object TntGroupBox1: TTntGroupBox
          Left = 1
          Top = 1
          Width = 790
          Height = 95
          Align = alClient
          Caption = 'query_condition'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object TntLabel6: TTntLabel
            Left = 120
            Top = 18
            Width = 69
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'fld_emp_id'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'MS PGothic'
            Font.Style = []
            ParentFont = False
          end
          object TntLabel10: TTntLabel
            Left = 309
            Top = 16
            Width = 90
            Height = 19
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'fld_department'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Palatino Linotype'
            Font.Style = []
            ParentFont = False
          end
          object TntLabel1: TTntLabel
            Left = 8
            Top = 48
            Width = 70
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'fld_pst_code'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Palatino Linotype'
            Font.Style = []
            ParentFont = False
          end
          object TntLabel2: TTntLabel
            Left = 0
            Top = 17
            Width = 65
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'fld_month'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Palatino Linotype'
            Font.Style = []
            ParentFont = False
          end
          object edit_begin: TTntEdit
            Left = 192
            Top = 14
            Width = 55
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 6
            ParentFont = False
            TabOrder = 0
            OnChange = edit_beginChange
          end
          object edit_end: TTntEdit
            Left = 250
            Top = 14
            Width = 55
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 6
            ParentFont = False
            TabOrder = 1
          end
          object Btn_Search: TTntBitBtn
            Left = 635
            Top = 16
            Width = 81
            Height = 25
            Caption = '(&q)uery'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            OnClick = Btn_SearchClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
              555555555555555555555555555555555555555555FF55555555555559055555
              55555555577FF5555555555599905555555555557777F5555555555599905555
              555555557777FF5555555559999905555555555777777F555555559999990555
              5555557777777FF5555557990599905555555777757777F55555790555599055
              55557775555777FF5555555555599905555555555557777F5555555555559905
              555555555555777FF5555555555559905555555555555777FF55555555555579
              05555555555555777FF5555555555557905555555555555777FF555555555555
              5990555555555555577755555555555555555555555555555555}
            NumGlyphs = 2
          end
          object CobDeptBegin: TTntComboBox
            Left = 401
            Top = 13
            Width = 112
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            ItemHeight = 13
            ParentFont = False
            TabOrder = 3
          end
          object CobDeptEnd: TTntComboBox
            Left = 515
            Top = 13
            Width = 112
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            ItemHeight = 13
            ParentFont = False
            TabOrder = 4
          end
          object CobPstBegin: TTntComboBox
            Left = 86
            Top = 44
            Width = 85
            Height = 21
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            ItemHeight = 13
            ParentFont = False
            TabOrder = 5
          end
          object CobPstEnd: TTntComboBox
            Left = 173
            Top = 44
            Width = 85
            Height = 21
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            ItemHeight = 13
            ParentFont = False
            TabOrder = 6
          end
          object BtnPrint: TTntBitBtn
            Left = 635
            Top = 47
            Width = 81
            Height = 25
            Caption = #25171#21360
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Palatino Linotype'
            Font.Style = []
            ParentFont = False
            TabOrder = 7
            OnClick = BtnPrintClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
              00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
              8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
              8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
              8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
              03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
              03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
              33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
              33333337FFFF7733333333300000033333333337777773333333}
            NumGlyphs = 2
          end
          object EditMon: TTntEdit
            Left = 64
            Top = 14
            Width = 55
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 6
            ParentFont = False
            TabOrder = 8
          end
          object TntButton1: TTntButton
            Left = 719
            Top = 46
            Width = 67
            Height = 25
            Caption = 'EXCEL'
            TabOrder = 9
            OnClick = TntButton1Click
          end
          object TntPanel1: TTntPanel
            Left = 312
            Top = 40
            Width = 313
            Height = 33
            BevelOuter = bvNone
            TabOrder = 10
            object Rball: TTntRadioButton
              Left = 6
              Top = 8
              Width = 70
              Height = 17
              Caption = 'all'
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
            object RbInWork: TTntRadioButton
              Left = 80
              Top = 8
              Width = 70
              Height = 17
              Caption = 'in_work'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object RbLeftWork: TTntRadioButton
              Left = 155
              Top = 8
              Width = 70
              Height = 17
              Caption = 'left_work'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
            object RbAbSal: TTntRadioButton
              Left = 230
              Top = 8
              Width = 70
              Height = 17
              Caption = 'abnormal'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
            end
          end
          object TntPanel2: TTntPanel
            Left = 16
            Top = 72
            Width = 249
            Height = 20
            BevelOuter = bvNone
            TabOrder = 11
            object rb_fuluh: TTntRadioButton
              Left = 8
              Top = 1
              Width = 113
              Height = 17
              Caption = 'Fuluh'
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
            object rb_sb: TTntRadioButton
              Left = 128
              Top = 1
              Width = 113
              Height = 17
              Caption = 'Sheen Bridge'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
          end
        end
      end
      object PanelGrid: TPanel
        Left = 0
        Top = 97
        Width = 792
        Height = 333
        Align = alClient
        TabOrder = 1
        object DBGrid1: TTntDBGrid
          Left = 1
          Top = 1
          Width = 790
          Height = 331
          Align = alClient
          DataSource = DataSource1
          FixedColor = clSkyBlue
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnTitleClick = DBGrid1TitleClick
          Columns = <
            item
              Expanded = False
              FieldName = 'dept_code'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'emp_id'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'emp_chs'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'name_vim'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'pst_code'
              Width = 40
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'deal_pay'
              Width = 50
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'actu_pay'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'base_pay'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'mgmt_ofr'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'tech_ofr'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'duty_ofr'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'envr_ofr'
              Width = 50
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
              FieldName = 'efft_awd'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'psal_awd'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'te_pay'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'duo_awd'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'longwork_pay'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'full_awd'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'stop_supp'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'injury_supp'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'salhol_supp'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'stop_work'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'over_work'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'sal_night'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'gong_pay'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'supp_agai'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'picc_back'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'sick_supp'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'sick_back'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'othe_supp'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'other_temp'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'psal'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'award'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ton_pay'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'prd_pay'
              Width = 50
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'deal_pay'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'meal_pay'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ask_pay'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'stop_dedu'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'picc_she'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'picc_yi'
              Width = 50
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
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'tax_pay'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'sup_dedu'
              Width = 58
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'actu_pay'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'insur_seq'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ovr_base_pay'
              Visible = True
            end>
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
    AfterScroll = ADOQuery1AfterScroll
    OnCalcFields = ADOQuery1CalcFields
    Parameters = <>
    SQL.Strings = (
      
        'select top 1 * from hrd_sal_paymt A,hrd_emp B where A.emp_id=B.e' +
        'mp_id')
    Left = 200
    Top = 2
    object ADOQuery1upd_user: TStringField
      FieldName = 'upd_user'
      Size = 16
    end
    object ADOQuery1upd_date: TDateTimeField
      FieldName = 'upd_date'
    end
    object ADOQuery1pay_mon: TStringField
      FieldName = 'pay_mon'
      Visible = False
      Size = 6
    end
    object ADOQuery1dept_code: TStringField
      FieldName = 'dept_code'
      Size = 6
    end
    object ADOQuery1emp_id: TStringField
      FieldName = 'emp_id'
      Size = 6
    end
    object ADOQuery1emp_chs: TWideStringField
      FieldName = 'emp_chs'
      Size = 30
    end
    object ADOQuery1name_vim: TWideStringField
      FieldName = 'name_vim'
      Size = 50
    end
    object ADOQuery1pst_code: TStringField
      FieldName = 'pst_code'
      Size = 2
    end
    object ADOQuery1base_pay: TBCDField
      FieldName = 'base_pay'
      Precision = 19
    end
    object ADOQuery1mgmt_ofr: TBCDField
      FieldName = 'mgmt_ofr'
      Precision = 19
    end
    object ADOQuery1tech_ofr: TBCDField
      FieldName = 'tech_ofr'
      Precision = 19
    end
    object ADOQuery1duty_ofr: TBCDField
      FieldName = 'duty_ofr'
      Precision = 19
    end
    object ADOQuery1envr_ofr: TBCDField
      FieldName = 'envr_ofr'
      Precision = 19
    end
    object ADOQuery1grad_ofr: TBCDField
      FieldName = 'grad_ofr'
      Precision = 19
    end
    object ADOQuery1efft_awd: TBCDField
      FieldName = 'efft_awd'
      Precision = 19
    end
    object ADOQuery1psal_awd: TBCDField
      FieldName = 'psal_awd'
      Precision = 19
    end
    object ADOQuery1longwork_pay: TBCDField
      FieldName = 'longwork_pay'
      Precision = 19
    end
    object ADOQuery1te_pay: TBCDField
      FieldName = 'te_pay'
      Precision = 19
    end
    object ADOQuery1duo_awd: TBCDField
      FieldName = 'duo_awd'
      Precision = 19
    end
    object ADOQuery1full_awd: TBCDField
      FieldName = 'full_awd'
      Precision = 19
    end
    object ADOQuery1over_work: TBCDField
      FieldName = 'over_work'
      Precision = 19
    end
    object ADOQuery1sal_night: TBCDField
      FieldName = 'sal_night'
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
    object ADOQuery1gong_pay: TBCDField
      FieldName = 'gong_pay'
      Precision = 19
    end
    object ADOQuery1supp_agai: TBCDField
      FieldName = 'supp_agai'
      Precision = 19
    end
    object ADOQuery1picc_back: TBCDField
      FieldName = 'picc_back'
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
    object ADOQuery1sick_supp: TBCDField
      FieldName = 'sick_supp'
      Precision = 19
    end
    object ADOQuery1sick_back: TBCDField
      FieldName = 'sick_back'
      Precision = 19
    end
    object ADOQuery1deal_pay: TBCDField
      FieldName = 'deal_pay'
      Precision = 19
    end
    object ADOQuery1meal_pay: TBCDField
      FieldName = 'meal_pay'
      Precision = 19
    end
    object ADOQuery1ask_pay: TBCDField
      FieldName = 'ask_pay'
      Precision = 19
    end
    object ADOQuery1stop_dedu: TBCDField
      FieldName = 'stop_dedu'
      Precision = 19
    end
    object ADOQuery1picc_she: TBCDField
      FieldName = 'picc_she'
      Precision = 19
    end
    object ADOQuery1picc_yi: TBCDField
      FieldName = 'picc_yi'
      Precision = 19
    end
    object ADOQuery1picc_shiye: TFloatField
      FieldName = 'picc_shiye'
    end
    object ADOQuery1laun_pay: TBCDField
      FieldName = 'laun_pay'
      Precision = 19
    end
    object ADOQuery1tax_pay: TBCDField
      FieldName = 'tax_pay'
      Precision = 19
    end
    object ADOQuery1actu_pay: TBCDField
      FieldName = 'actu_pay'
      Precision = 19
    end
    object ADOQuery1sup_dedu: TBCDField
      FieldName = 'sup_dedu'
    end
    object ADOQuery1insur_seq: TStringField
      FieldKind = fkCalculated
      FieldName = 'insur_seq'
      Size = 10
      Calculated = True
    end
    object ADOQuery1ovr_base_pay: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ovr_base_pay'
      Calculated = True
    end
    object ADOQuery1epledt: TDateField
      FieldName = 'epledt'
    end
    object ADOQuery1epindt: TDateField
      FieldName = 'epindt'
    end
  end
end
