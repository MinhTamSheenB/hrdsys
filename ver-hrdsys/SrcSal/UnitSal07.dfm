object FormSal07: TFormSal07
  Left = 340
  Top = 149
  Width = 835
  Height = 532
  Caption = 'FormSal07'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object TntPanel1: TTntPanel
    Left = 0
    Top = 0
    Width = 827
    Height = 33
    Align = alTop
    Caption = #21729#24037#34218#36039#32080#31639#20316#26989
    Color = clCream
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object pc_prv: TTntPageControl
    Left = 0
    Top = 33
    Width = 827
    Height = 465
    ActivePage = ts_tran
    Align = alClient
    TabOrder = 1
    OnChange = pc_prvChange
    object ts_sel: TTntTabSheet
      Caption = 'query'
      TabVisible = False
      object TntPanel2: TTntPanel
        Left = 0
        Top = 0
        Width = 819
        Height = 34
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 0
        object TntLabel2: TTntLabel
          Left = 15
          Top = 9
          Width = 89
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = #26597#35426#26376#20221
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object tbb_reset: TTntBitBtn
          Left = 252
          Top = 4
          Width = 57
          Height = 22
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = tbb_resetClick
          Kind = bkRetry
        end
        object tbb_ok: TTntBitBtn
          Left = 182
          Top = 4
          Width = 57
          Height = 22
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = tbb_okClick
          Kind = bkOK
        end
        object sel_month: TMaskEdit
          Left = 112
          Top = 5
          Width = 55
          Height = 21
          EditMask = '!9999/99;0;_'
          ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
          MaxLength = 7
          TabOrder = 2
        end
      end
      object TntPanel3: TTntPanel
        Left = 0
        Top = 34
        Width = 819
        Height = 403
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 1
        object TntLabel4: TTntLabel
          Left = 259
          Top = 12
          Width = 254
          Height = 13
          AutoSize = False
          Color = clYellow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object trb_id: TTntRadioButton
          Left = 46
          Top = 10
          Width = 91
          Height = 17
          Caption = #24037#34399
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object Tid_s: TTntEdit
          Left = 142
          Top = 8
          Width = 45
          Height = 21
          Enabled = False
          ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
          MaxLength = 6
          TabOrder = 1
          Text = '000000'
        end
        object Tid_e: TTntEdit
          Left = 194
          Top = 8
          Width = 45
          Height = 21
          Enabled = False
          ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
          MaxLength = 6
          TabOrder = 2
          Text = '999999'
        end
        object cob_DeptBeg1: TTntComboBox
          Left = 142
          Top = 34
          Width = 185
          Height = 21
          Enabled = False
          ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
          ItemHeight = 0
          TabOrder = 3
        end
        object cob_DeptEnd1: TTntComboBox
          Left = 331
          Top = 34
          Width = 190
          Height = 21
          Enabled = False
          ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
          ItemHeight = 0
          TabOrder = 4
        end
        object trb_dept: TTntRadioButton
          Left = 46
          Top = 37
          Width = 91
          Height = 17
          Caption = #37096#38272
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
        object tbb_search: TTntBitBtn
          Left = 560
          Top = 19
          Width = 81
          Height = 25
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          OnClick = tbb_searchClick
          Kind = bkOK
        end
      end
    end
    object ts_tran: TTntTabSheet
      Caption = 'transferfiles'
      object TntPanel7: TTntPanel
        Left = 0
        Top = 0
        Width = 819
        Height = 437
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 0
        object TntGroupBox1: TTntGroupBox
          Left = 1
          Top = 1
          Width = 817
          Height = 72
          Align = alTop
          Caption = #36681#27284#26781#20214
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object TntLabel3: TTntLabel
            Left = 7
            Top = 21
            Width = 74
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = #36681#27284#26376#20221
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object sb_EmpBeg2: TTntSpeedButton
            Left = 317
            Top = 16
            Width = 23
            Height = 22
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            OnClick = sb_EmpBeg2Click
          end
          object sb_EmpEnd2: TTntSpeedButton
            Left = 400
            Top = 16
            Width = 23
            Height = 22
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            OnClick = sb_EmpBeg2Click
          end
          object btn_sal_bao: TTntSpeedButton
            Left = 607
            Top = 40
            Width = 65
            Height = 24
            Caption = #30149#20551#20445#38570
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            OnClick = btn_sal_baoClick
          end
          object cob_DeptBeg2: TTntComboBox
            Left = 270
            Top = 42
            Width = 161
            Height = 21
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = '?? (??) - ??'
            ItemHeight = 13
            ParentFont = False
            TabOrder = 5
          end
          object cob_DeptEnd2: TTntComboBox
            Left = 435
            Top = 42
            Width = 161
            Height = 21
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = '?? (??) - ??'
            ItemHeight = 13
            ParentFont = False
            TabOrder = 6
          end
          object rb_ByDept2: TTntRadioButton
            Left = 190
            Top = 45
            Width = 75
            Height = 17
            Caption = #37096#38272
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnClick = rb_ByEmp2Click
          end
          object EditEmpEnd2: TTntEdit
            Left = 354
            Top = 16
            Width = 47
            Height = 21
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = '?? (??) - ??'
            MaxLength = 6
            ParentFont = False
            TabOrder = 4
            Text = '999999'
          end
          object EditEmpBeg2: TTntEdit
            Left = 270
            Top = 16
            Width = 47
            Height = 21
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = '?? (??) - ??'
            MaxLength = 6
            ParentFont = False
            TabOrder = 3
            Text = '000000'
            OnChange = EditEmpBeg2Change
          end
          object rb_ByEmp2: TTntRadioButton
            Left = 190
            Top = 18
            Width = 67
            Height = 17
            Caption = #24037#34399
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnClick = rb_ByEmp2Click
          end
          object bbtn_Reset2: TTntBitBtn
            Left = 697
            Top = 39
            Width = 74
            Height = 25
            Caption = #37325#32622
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 8
            OnClick = bbtn_Reset2Click
            Kind = bkRetry
          end
          object bbtn_OK2: TTntBitBtn
            Left = 697
            Top = 12
            Width = 74
            Height = 25
            Caption = #30906#23450
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 7
            OnClick = bbtn_OK2Click
            Kind = bkOK
          end
          object me_Month2: TMaskEdit
            Left = 96
            Top = 14
            Width = 55
            Height = 21
            EditMask = '!9999/99;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 7
            ParentFont = False
            TabOrder = 2
          end
          object chk_epledt: TTntCheckBox
            Left = 432
            Top = 15
            Width = 81
            Height = 17
            Caption = 'fld_epledt'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 9
          end
          object dtp_epledt_bgn: TTntDateTimePicker
            Left = 508
            Top = 13
            Width = 89
            Height = 21
            Date = 41432.702266701390000000
            Time = 41432.702266701390000000
            Enabled = False
            ImeName = #20013#25991' - QQ'#25340#38899'?'#20837#27861
            TabOrder = 10
          end
          object dtp_epledt_end: TTntDateTimePicker
            Left = 600
            Top = 13
            Width = 81
            Height = 21
            Date = 41432.703732268520000000
            Time = 41432.703732268520000000
            ImeName = #20013#25991' - QQ'#25340#38899'?'#20837#27861
            TabOrder = 11
          end
          object cbChange: TTntCheckBox
            Left = 16
            Top = 48
            Width = 161
            Height = 17
            Caption = 'Fuluh -> Sheen Bridge'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 12
          end
        end
        object TntGroupBox2: TTntGroupBox
          Left = 1
          Top = 73
          Width = 817
          Height = 258
          Align = alClient
          Caption = #21729#24037#20449#24687
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 1
          object TntDBGrid1: TTntDBGrid
            Left = 2
            Top = 15
            Width = 813
            Height = 241
            Align = alClient
            DataSource = ds_sal
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clRed
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'emp_id'
                Title.Color = clSkyBlue
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'pay_mon'
                Title.Color = clSkyBlue
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'base_pay'
                Title.Color = clSkyBlue
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'mgmt_ofr'
                Title.Color = clSkyBlue
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'tech_ofr'
                Title.Color = clSkyBlue
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'duty_ofr'
                Title.Color = clSkyBlue
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'grad_ofr'
                Title.Color = clSkyBlue
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'envr_ofr'
                Title.Color = clSkyBlue
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'efft_awd'
                Title.Color = clSkyBlue
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'psal_awd'
                Title.Color = clSkyBlue
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'te_pay'
                Title.Color = clSkyBlue
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'gong_pay'
                Title.Color = clSkyBlue
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'duo_awd'
                Title.Color = clSkyBlue
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'full_awd'
                Title.Color = clSkyBlue
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'over_work'
                Title.Color = clSkyBlue
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'sal_night'
                Title.Color = clSkyBlue
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'sup_dedu'
                Title.Color = clSkyBlue
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'picc_back'
                Title.Color = clSkyBlue
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'othe_supp'
                Title.Color = clSkyBlue
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'sick_supp'
                Title.Color = clSkyBlue
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'deal_pay'
                Title.Color = clSkyBlue
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'meal_pay'
                Title.Caption = 'repast_pay'
                Title.Color = clSkyBlue
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ask_pay'
                Title.Color = clSkyBlue
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'stop_dedu'
                Title.Color = clSkyBlue
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'picc_she'
                Title.Color = clSkyBlue
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'picc_yi'
                Title.Color = clSkyBlue
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'laun_pay'
                Title.Color = clSkyBlue
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'tax_pay'
                Title.Color = clSkyBlue
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'supp_agai'
                Title.Color = clSkyBlue
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'zhuishuo_BHXH'
                Title.Color = clSkyBlue
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'actu_pay'
                Title.Color = clSkyBlue
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 60
                Visible = True
              end>
          end
        end
        object TntGroupBox3: TTntGroupBox
          Left = 1
          Top = 331
          Width = 817
          Height = 105
          Align = alBottom
          Caption = #30064#24120#20449#24687'('#21491#37749#28165#31354')'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 2
          object re_Message: TTntRichEdit
            Left = 2
            Top = 15
            Width = 813
            Height = 88
            Align = alClient
            Color = clSkyBlue
            Font.Charset = CHINESEBIG5_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            ParentFont = False
            PopupMenu = TntPopupMenu1
            ReadOnly = True
            TabOrder = 0
          end
        end
      end
    end
  end
  object ADOCommand1: TADOCommand
    Connection = DMHrdsys.conn
    Parameters = <>
    Left = 288
  end
  object ADOQuery1: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'select * from hrd_sal_paymt')
    Left = 8
    Top = 8
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 40
    Top = 8
  end
  object qry_temp: TADOQuery
    Connection = DMHrdsys.conn
    Parameters = <>
    Left = 509
    Top = 10
  end
  object sp_Emp2: TADOStoredProc
    Connection = DMHrdsys.conn
    ProcedureName = 'proc_emp;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@inwork_flag'
        Attributes = [paNullable]
        DataType = ftString
        Size = 1
        Value = Null
      end
      item
        Name = '@year_month'
        Attributes = [paNullable]
        DataType = ftString
        Size = 6
        Value = Null
      end
      item
        Name = '@emp_begin'
        Attributes = [paNullable]
        DataType = ftString
        Size = 6
        Value = Null
      end
      item
        Name = '@emp_end'
        Attributes = [paNullable]
        DataType = ftString
        Size = 6
        Value = Null
      end
      item
        Name = '@dept_begin'
        Attributes = [paNullable]
        DataType = ftString
        Size = 6
        Value = Null
      end
      item
        Name = '@dept_end'
        Attributes = [paNullable]
        DataType = ftString
        Size = 6
        Value = Null
      end
      item
        Name = '@pst_begin'
        Attributes = [paNullable]
        DataType = ftString
        Size = 2
        Value = Null
      end
      item
        Name = '@pst_end'
        Attributes = [paNullable]
        DataType = ftString
        Size = 2
        Value = Null
      end
      item
        Name = '@edu_begin'
        Attributes = [paNullable]
        DataType = ftString
        Size = 2
        Value = Null
      end
      item
        Name = '@edu_end'
        Attributes = [paNullable]
        DataType = ftString
        Size = 2
        Value = Null
      end
      item
        Name = '@birth_begin'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = Null
      end
      item
        Name = '@birth_end'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = Null
      end
      item
        Name = '@indt_begin'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = Null
      end
      item
        Name = '@indt_end'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = Null
      end
      item
        Name = '@ledt_begin'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = Null
      end
      item
        Name = '@ledt_end'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = Null
      end
      item
        Name = '@idno_begin'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = Null
      end
      item
        Name = '@idno_end'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = Null
      end
      item
        Name = '@name_chs'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 10
        Value = Null
      end>
    Left = 477
    Top = 10
  end
  object qry_sal: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from hrd_sal_paymt where 1=2')
    Left = 325
    Top = 2
    object qry_salupd_user: TStringField
      FieldName = 'upd_user'
      Size = 16
    end
    object qry_salupd_date: TDateTimeField
      FieldName = 'upd_date'
    end
    object qry_saldept_code: TStringField
      FieldName = 'dept_code'
      Size = 6
    end
    object qry_salpst_code: TStringField
      FieldName = 'pst_code'
      Size = 2
    end
    object qry_salinfo_code: TStringField
      FieldName = 'info_code'
      FixedChar = True
      Size = 1
    end
    object qry_salemp_id: TStringField
      FieldName = 'emp_id'
      Size = 6
    end
    object qry_salpay_mon: TStringField
      FieldName = 'pay_mon'
      Size = 6
    end
    object qry_salbase_pay: TBCDField
      FieldName = 'base_pay'
      Precision = 19
    end
    object qry_salmgmt_ofr: TBCDField
      FieldName = 'mgmt_ofr'
      Precision = 19
    end
    object qry_saltech_ofr: TBCDField
      FieldName = 'tech_ofr'
      Precision = 19
    end
    object qry_salduty_ofr: TBCDField
      FieldName = 'duty_ofr'
      Precision = 19
    end
    object qry_salenvr_ofr: TBCDField
      FieldName = 'envr_ofr'
      Precision = 19
    end
    object qry_salgrad_ofr: TBCDField
      FieldName = 'grad_ofr'
      Precision = 19
    end
    object qry_salefft_awd: TBCDField
      FieldName = 'efft_awd'
      Precision = 19
    end
    object qry_salte_pay: TBCDField
      FieldName = 'te_pay'
      Precision = 19
    end
    object qry_salduo_awd: TBCDField
      FieldName = 'duo_awd'
      Precision = 19
    end
    object qry_salfull_awd: TBCDField
      FieldName = 'full_awd'
      Precision = 19
    end
    object qry_salover_work: TBCDField
      FieldName = 'over_work'
      Precision = 19
    end
    object qry_salsal_night: TBCDField
      FieldName = 'sal_night'
      Precision = 19
    end
    object qry_salgong_pay: TBCDField
      FieldName = 'gong_pay'
      Precision = 19
    end
    object qry_salsupp_agai: TBCDField
      FieldName = 'supp_agai'
      Precision = 19
    end
    object qry_salpicc_back: TBCDField
      FieldName = 'picc_back'
      Precision = 19
    end
    object qry_salothe_supp: TBCDField
      FieldName = 'othe_supp'
      Precision = 19
    end
    object qry_salother_temp: TBCDField
      FieldName = 'other_temp'
      Precision = 19
    end
    object qry_salsick_supp: TBCDField
      FieldName = 'sick_supp'
      Precision = 19
    end
    object qry_salsick_back: TBCDField
      FieldName = 'sick_back'
      Precision = 19
    end
    object qry_saldeal_pay: TBCDField
      FieldName = 'deal_pay'
      Precision = 19
    end
    object qry_salmeal_pay: TBCDField
      FieldName = 'meal_pay'
      Precision = 19
    end
    object qry_salask_pay: TBCDField
      FieldName = 'ask_pay'
      Precision = 19
    end
    object qry_salstop_dedu: TBCDField
      FieldName = 'stop_dedu'
      Precision = 19
    end
    object qry_salpicc_she: TBCDField
      FieldName = 'picc_she'
      Precision = 19
    end
    object qry_salpicc_yi: TBCDField
      FieldName = 'picc_yi'
      Precision = 19
    end
    object qry_salyicard_dedu: TCurrencyField
      FieldName = 'yicard_dedu'
    end
    object qry_sallaun_pay: TBCDField
      FieldName = 'laun_pay'
      Precision = 19
    end
    object qry_saltax_pay: TBCDField
      FieldName = 'tax_pay'
      Precision = 19
    end
    object qry_salsup_dedu: TBCDField
      FieldName = 'sup_dedu'
      Precision = 19
    end
    object qry_salactu_pay: TBCDField
      FieldName = 'actu_pay'
      Precision = 19
    end
  end
  object ds_sal: TDataSource
    DataSet = ClientDataSet1
    Left = 693
    Top = 10
  end
  object qry_Temp2: TADOQuery
    Connection = DMHrdsys.conn
    Parameters = <>
    Left = 541
    Top = 10
  end
  object qry_Grad: TADOQuery
    Connection = DMHrdsys.conn
    Parameters = <>
    Left = 573
    Top = 10
  end
  object ClientDataSet1: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'upd_user'
        DataType = ftString
        Size = 16
      end
      item
        Name = 'upd_date'
        DataType = ftDateTime
      end
      item
        Name = 'dept_code'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'pst_code'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'info_code'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'emp_id'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'pay_mon'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'base_pay'
        DataType = ftBCD
        Precision = 19
        Size = 4
      end
      item
        Name = 'mgmt_ofr'
        DataType = ftBCD
        Precision = 19
        Size = 4
      end
      item
        Name = 'tech_ofr'
        DataType = ftBCD
        Precision = 19
        Size = 4
      end
      item
        Name = 'duty_ofr'
        DataType = ftBCD
        Precision = 19
        Size = 4
      end
      item
        Name = 'envr_ofr'
        DataType = ftBCD
        Precision = 19
        Size = 4
      end
      item
        Name = 'grad_ofr'
        DataType = ftBCD
        Precision = 19
        Size = 4
      end
      item
        Name = 'efft_awd'
        DataType = ftBCD
        Precision = 19
        Size = 4
      end
      item
        Name = 'te_pay'
        DataType = ftBCD
        Precision = 19
        Size = 4
      end
      item
        Name = 'duo_awd'
        DataType = ftBCD
        Precision = 19
        Size = 4
      end
      item
        Name = 'full_awd'
        DataType = ftBCD
        Precision = 19
        Size = 4
      end
      item
        Name = 'over_work'
        DataType = ftBCD
        Precision = 19
        Size = 4
      end
      item
        Name = 'sal_night'
        DataType = ftBCD
        Precision = 19
        Size = 4
      end
      item
        Name = 'gong_pay'
        DataType = ftBCD
        Precision = 19
        Size = 4
      end
      item
        Name = 'supp_agai'
        DataType = ftBCD
        Precision = 19
        Size = 4
      end
      item
        Name = 'picc_back'
        DataType = ftBCD
        Precision = 19
        Size = 4
      end
      item
        Name = 'othe_supp'
        DataType = ftBCD
        Precision = 19
        Size = 4
      end
      item
        Name = 'other_temp'
        DataType = ftBCD
        Precision = 19
        Size = 4
      end
      item
        Name = 'sick_supp'
        DataType = ftBCD
        Precision = 19
        Size = 4
      end
      item
        Name = 'sick_back'
        DataType = ftBCD
        Precision = 19
        Size = 4
      end
      item
        Name = 'deal_pay'
        DataType = ftBCD
        Precision = 19
        Size = 4
      end
      item
        Name = 'meal_pay'
        DataType = ftBCD
        Precision = 19
        Size = 4
      end
      item
        Name = 'ask_pay'
        DataType = ftBCD
        Precision = 19
        Size = 4
      end
      item
        Name = 'stop_dedu'
        DataType = ftBCD
        Precision = 19
        Size = 4
      end
      item
        Name = 'picc_she'
        DataType = ftBCD
        Precision = 19
        Size = 4
      end
      item
        Name = 'picc_yi'
        DataType = ftBCD
        Precision = 19
        Size = 4
      end
      item
        Name = 'laun_pay'
        DataType = ftBCD
        Precision = 19
        Size = 4
      end
      item
        Name = 'tax_pay'
        DataType = ftBCD
        Precision = 19
        Size = 4
      end
      item
        Name = 'sup_dedu'
        DataType = ftBCD
        Precision = 19
        Size = 4
      end
      item
        Name = 'zhuishuo_BHXH'
        DataType = ftBCD
        Precision = 19
        Size = 4
      end
      item
        Name = 'actu_pay'
        DataType = ftBCD
        Precision = 19
        Size = 4
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 661
    Top = 10
    Data = {
      090600009619E0BD010000001800000025000000000003000000090608757064
      5F757365720100490000000100055749445448020002001000087570645F6461
      7465080008000000000009646570745F636F6465010049000000010005574944
      5448020002000600087073745F636F6465010049000000010005574944544802
      000200020009696E666F5F636F64650100490020000100055749445448020002
      00010006656D705F696401004900000001000557494454480200020006000770
      61795F6D6F6E010049000000010005574944544802000200060008626173655F
      7061790C0005000000020008444543494D414C53020002000400055749445448
      020002001300086D676D745F6F66720C0005000000020008444543494D414C53
      02000200040005574944544802000200130008746563685F6F66720C00050000
      00020008444543494D414C530200020004000557494454480200020013000864
      7574795F6F66720C0005000000020008444543494D414C530200020004000557
      4944544802000200130008656E76725F6F66720C000500000002000844454349
      4D414C5302000200040005574944544802000200130008677261645F6F66720C
      0005000000020008444543494D414C5302000200040005574944544802000200
      130008656666745F6177640C0005000000020008444543494D414C5302000200
      04000557494454480200020013000674655F7061790C00050000000200084445
      43494D414C530200020004000557494454480200020013000764756F5F617764
      0C0005000000020008444543494D414C53020002000400055749445448020002
      0013000866756C6C5F6177640C0005000000020008444543494D414C53020002
      000400055749445448020002001300096F7665725F776F726B0C000500000002
      0008444543494D414C530200020004000557494454480200020013000973616C
      5F6E696768740C0005000000020008444543494D414C53020002000400055749
      44544802000200130008676F6E675F7061790C0005000000020008444543494D
      414C5302000200040005574944544802000200130009737570705F616761690C
      0005000000020008444543494D414C5302000200040005574944544802000200
      130009706963635F6261636B0C0005000000020008444543494D414C53020002
      000400055749445448020002001300096F7468655F737570700C000500000002
      0008444543494D414C530200020004000557494454480200020013000A6F7468
      65725F74656D700C0005000000020008444543494D414C530200020004000557
      49445448020002001300097369636B5F737570700C0005000000020008444543
      494D414C53020002000400055749445448020002001300097369636B5F626163
      6B0C0005000000020008444543494D414C530200020004000557494454480200
      02001300086465616C5F7061790C0005000000020008444543494D414C530200
      02000400055749445448020002001300086D65616C5F7061790C000500000002
      0008444543494D414C530200020004000557494454480200020013000761736B
      5F7061790C0005000000020008444543494D414C530200020004000557494454
      480200020013000973746F705F646564750C0005000000020008444543494D41
      4C5302000200040005574944544802000200130008706963635F7368650C0005
      000000020008444543494D414C53020002000400055749445448020002001300
      07706963635F79690C0005000000020008444543494D414C5302000200040005
      5749445448020002001300086C61756E5F7061790C0005000000020008444543
      494D414C53020002000400055749445448020002001300077461785F7061790C
      0005000000020008444543494D414C5302000200040005574944544802000200
      1300087375705F646564750C0005000000020008444543494D414C5302000200
      04000557494454480200020013000D7A6875697368756F5F424858480C000500
      0000020008444543494D414C5302000200040005574944544802000200130008
      616374755F7061790C0005000000020008444543494D414C5302000200040005
      57494454480200020013000000}
    object ClientDataSet1upd_user: TStringField
      FieldName = 'upd_user'
      Size = 16
    end
    object ClientDataSet1upd_date: TDateTimeField
      FieldName = 'upd_date'
    end
    object ClientDataSet1dept_code: TStringField
      FieldName = 'dept_code'
      Size = 6
    end
    object ClientDataSet1pst_code: TStringField
      FieldName = 'pst_code'
      Size = 2
    end
    object ClientDataSet1info_code: TStringField
      FieldName = 'info_code'
      FixedChar = True
      Size = 1
    end
    object ClientDataSet1emp_id: TStringField
      FieldName = 'emp_id'
      Size = 6
    end
    object ClientDataSet1pay_mon: TStringField
      FieldName = 'pay_mon'
      Size = 6
    end
    object ClientDataSet1base_pay: TBCDField
      FieldName = 'base_pay'
      Precision = 19
    end
    object ClientDataSet1mgmt_ofr: TBCDField
      FieldName = 'mgmt_ofr'
      Precision = 19
    end
    object ClientDataSet1tech_ofr: TBCDField
      FieldName = 'tech_ofr'
      Precision = 19
    end
    object ClientDataSet1duty_ofr: TBCDField
      FieldName = 'duty_ofr'
      Precision = 19
    end
    object ClientDataSet1envr_ofr: TBCDField
      FieldName = 'envr_ofr'
      Precision = 19
    end
    object ClientDataSet1grad_ofr: TBCDField
      FieldName = 'grad_ofr'
      Precision = 19
    end
    object ClientDataSet1efft_awd: TBCDField
      FieldName = 'efft_awd'
      Precision = 19
    end
    object ClientDataSet1psal_awd: TBCDField
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'psal_awd'
      Calculated = True
    end
    object ClientDataSet1te_pay: TBCDField
      FieldName = 'te_pay'
      Precision = 19
    end
    object ClientDataSet1duo_awd: TBCDField
      FieldName = 'duo_awd'
      Precision = 19
    end
    object ClientDataSet1full_awd: TBCDField
      FieldName = 'full_awd'
      Precision = 19
    end
    object ClientDataSet1over_work: TBCDField
      FieldName = 'over_work'
      Precision = 19
    end
    object ClientDataSet1sal_night: TBCDField
      FieldName = 'sal_night'
      Precision = 19
    end
    object ClientDataSet1gong_pay: TBCDField
      FieldName = 'gong_pay'
      Precision = 19
    end
    object ClientDataSet1supp_agai: TBCDField
      FieldName = 'supp_agai'
      Precision = 19
    end
    object ClientDataSet1picc_back: TBCDField
      FieldName = 'picc_back'
      Precision = 19
    end
    object ClientDataSet1othe_supp: TBCDField
      FieldName = 'othe_supp'
      Precision = 19
    end
    object ClientDataSet1other_temp: TBCDField
      FieldName = 'other_temp'
      Precision = 19
    end
    object ClientDataSet1sick_back: TBCDField
      FieldName = 'sick_back'
      Precision = 19
    end
    object ClientDataSet1sick_supp: TBCDField
      FieldName = 'sick_supp'
      Precision = 19
    end
    object ClientDataSet1deal_pay: TBCDField
      FieldName = 'deal_pay'
      Precision = 19
    end
    object ClientDataSet1meal_pay: TBCDField
      FieldName = 'meal_pay'
      Precision = 19
    end
    object ClientDataSet1ask_pay: TBCDField
      FieldName = 'ask_pay'
      Precision = 19
    end
    object ClientDataSet1stop_dedu: TBCDField
      FieldName = 'stop_dedu'
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
    object ClientDataSet1laun_pay: TBCDField
      FieldName = 'laun_pay'
      Precision = 19
    end
    object ClientDataSet1tax_pay: TBCDField
      FieldName = 'tax_pay'
      Precision = 19
    end
    object ClientDataSet1sup_dedu: TBCDField
      FieldName = 'sup_dedu'
      Precision = 19
    end
    object ClientDataSet1actu_pay: TBCDField
      FieldName = 'actu_pay'
      Precision = 19
    end
    object ClientDataSet1zhuishuo_BHXH: TBCDField
      FieldName = 'zhuishuo_BHXH'
    end
  end
  object TntPopupMenu1: TTntPopupMenu
    Left = 21
    Top = 379
    object N1: TTntMenuItem
      Caption = #28165#31354
      OnClick = N1Click
    end
  end
  object QryEmp: TADOQuery
    Connection = DMHrdsys.conn
    Parameters = <>
    Left = 440
    Top = 16
  end
  object qry_hrd_dut_class_13: TADOQuery
    Connection = DMHrdsys.conn
    CommandTimeout = 0
    Parameters = <>
    SQL.Strings = (
      'select *from hrd_sal_base_spc')
    Left = 141
    Top = 418
  end
  object qry_hrd_emp_raise_data: TADOQuery
    Connection = DMHrdsys.conn
    CommandTimeout = 0
    Parameters = <>
    SQL.Strings = (
      'select *from hrd_sal_base_spc')
    Left = 93
    Top = 418
  end
  object qry_cos_data: TADOQuery
    Connection = flu_conn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'select * from   tempdbf.dbo.hrd_sal_bao')
    Left = 632
    Top = 402
  end
  object flu_conn: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 664
    Top = 403
  end
  object qry_sal_bao: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'select * from   tempdbf.dbo.hrd_sal_bao')
    Left = 568
    Top = 402
  end
  object qryLastPaymt: TADOQuery
    Connection = DMHrdsys.conn
    Parameters = <>
    Left = 669
    Top = 234
  end
end
