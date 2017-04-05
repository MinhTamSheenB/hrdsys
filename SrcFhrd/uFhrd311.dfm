object FormFhrd311: TFormFhrd311
  Left = 191
  Top = 152
  Width = 793
  Height = 499
  Caption = 'FormFhrd311'
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
    Width = 785
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
    Width = 785
    Height = 432
    ActivePage = ts_tran
    Align = alClient
    TabOrder = 1
    object ts_tran: TTntTabSheet
      Caption = 'transferfiles'
      object TntPanel7: TTntPanel
        Left = 0
        Top = 0
        Width = 777
        Height = 404
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 0
        object TntGroupBox1: TTntGroupBox
          Left = 1
          Top = 1
          Width = 775
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
          object TntLabel1: TTntLabel
            Left = 32
            Top = 44
            Width = 145
            Height = 16
            AutoSize = False
            Caption = 'TntLabel1'
            Color = clYellow
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Visible = False
          end
          object TntLabel5: TTntLabel
            Left = 191
            Top = 21
            Width = 74
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = #24037#34399
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object TntLabel6: TTntLabel
            Left = 191
            Top = 45
            Width = 74
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = #37096#38272
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object cob_DeptBeg2: TTntComboBox
            Left = 270
            Top = 42
            Width = 161
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = #20013#25991' ('#31777#39636') - '#24494#36575#25340#38899#36664#20837#27861' 3.0'
            ItemHeight = 13
            ParentFont = False
            TabOrder = 3
          end
          object cob_DeptEnd2: TTntComboBox
            Left = 435
            Top = 42
            Width = 161
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = #20013#25991' ('#31777#39636') - '#24494#36575#25340#38899#36664#20837#27861' 3.0'
            ItemHeight = 13
            ParentFont = False
            TabOrder = 4
          end
          object EditEmpEnd2: TTntEdit
            Left = 354
            Top = 16
            Width = 47
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = #20013#25991' ('#31777#39636') - '#24494#36575#25340#38899#36664#20837#27861' 3.0'
            MaxLength = 6
            ParentFont = False
            TabOrder = 2
            Text = '999999'
          end
          object EditEmpBeg2: TTntEdit
            Left = 270
            Top = 16
            Width = 47
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = #20013#25991' ('#31777#39636') - '#24494#36575#25340#38899#36664#20837#27861' 3.0'
            MaxLength = 6
            ParentFont = False
            TabOrder = 1
            Text = '001300'
            OnChange = EditEmpBeg2Change
          end
          object bbtn_Reset2: TTntBitBtn
            Left = 654
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
            TabOrder = 6
            OnClick = bbtn_Reset2Click
            Kind = bkRetry
          end
          object bbtn_OK2: TTntBitBtn
            Left = 654
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
            TabOrder = 5
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
            TabOrder = 0
          end
        end
        object TntGroupBox2: TTntGroupBox
          Left = 1
          Top = 73
          Width = 775
          Height = 225
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
            Width = 771
            Height = 208
            Align = alClient
            DataSource = ds_sal
            FixedColor = clSkyBlue
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
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'dept_code'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'pst_code'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 45
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'sal_bas'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 45
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'sal_frn'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 45
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'fix_add'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 45
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'f_award'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 45
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'adjust'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 45
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ask_pay'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'night_amt'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 45
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'dinner_price'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 45
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'actu_sal'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 45
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'local_amt'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 45
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'bank_sal'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 45
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'night1_duty'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 45
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'night2_duty'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 45
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'night3_duty'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 45
                Visible = True
              end>
          end
        end
        object TntGroupBox3: TTntGroupBox
          Left = 1
          Top = 298
          Width = 775
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
            Width = 771
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
    object query: TTntTabSheet
      Caption = 'query'
      object TntPanel4: TTntPanel
        Left = 0
        Top = 0
        Width = 777
        Height = 45
        Align = alTop
        Caption = #28023#22806#24185#37096#31649#29702'___'#34218#36039#26597#35426
        Color = clCream
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object TntGroupBox4: TTntGroupBox
        Left = 0
        Top = 45
        Width = 777
        Height = 75
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
          777
          75)
        object TntLabel7: TTntLabel
          Left = 8
          Top = 16
          Width = 65
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = #26376#20221
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object TntLabel8: TTntLabel
          Left = 145
          Top = 48
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
          Left = 125
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
        object TntLabel2: TTntLabel
          Left = 336
          Top = 48
          Width = 51
          Height = 13
          Caption = #32317#20154#25976#65306' '
        end
        object TntLabel4: TTntLabel
          Left = 392
          Top = 48
          Width = 6
          Height = 13
          Caption = '0'
        end
        object month: TTntEdit
          Left = 72
          Top = 13
          Width = 44
          Height = 21
          Hint = 'yyyymm'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
          MaxLength = 6
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
        end
        object deptBegCob: TTntComboBox
          Left = 217
          Top = 13
          Width = 137
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
          ItemHeight = 0
          ParentFont = False
          TabOrder = 1
        end
        object deptEndCob: TTntComboBox
          Left = 360
          Top = 13
          Width = 141
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
          ItemHeight = 0
          ParentFont = False
          TabOrder = 2
        end
        object empIdBeg: TTntEdit
          Left = 217
          Top = 43
          Width = 44
          Height = 21
          Hint = 'ssssss'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
          MaxLength = 6
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnChange = empIdBegChange
        end
        object empIdEnd: TTntEdit
          Left = 280
          Top = 43
          Width = 44
          Height = 21
          Hint = 'ssssss'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
          MaxLength = 6
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
        end
        object selectData: TTntBitBtn
          Left = 687
          Top = 15
          Width = 75
          Height = 22
          Anchors = [akTop, akRight]
          Caption = #26597#35426
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          OnClick = selectDataClick
        end
        object PrintPanel: TTntPanel
          Left = 516
          Top = 11
          Width = 173
          Height = 59
          BevelOuter = bvNone
          TabOrder = 6
          object totalBill: TTntRadioButton
            Left = 10
            Top = 1
            Width = 97
            Height = 17
            Caption = #34218#36039#21295#32317#34920
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object salaryBill: TTntRadioButton
            Left = 10
            Top = 20
            Width = 97
            Height = 17
            Caption = #34218#36039#26781
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
          object nightBill: TTntRadioButton
            Left = 10
            Top = 38
            Width = 97
            Height = 17
            Caption = #22812#29677#27941#36028#34920
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            Visible = False
          end
        end
        object TntBitBtn1: TTntBitBtn
          Left = 696
          Top = 40
          Width = 75
          Height = 25
          Caption = 'Print'
          TabOrder = 7
          OnClick = TntBitBtn1Click
        end
      end
      object TntGroupBox5: TTntGroupBox
        Left = 0
        Top = 120
        Width = 777
        Height = 284
        Align = alClient
        Caption = #28687#35261#25976#25818
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object salGrid: TTntDBGrid
          Left = 2
          Top = 15
          Width = 773
          Height = 267
          Align = alClient
          DataSource = salaryDataSource
          FixedColor = clSkyBlue
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
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
              FieldName = 'dept_code'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'emp_id'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'emp_name'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'pst_code'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 45
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'actu_sal'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 46
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'sal_bas'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'sal_frn'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'fix_add'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'f_award'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'adjust'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ask_pay'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'night_amt'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 46
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'dinner_price'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 46
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'actu_sal'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 46
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'night1_duty'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'night2_duty'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'night3_duty'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Visible = True
            end>
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
      'select * from fhrd_salary where 1=2')
    Left = 325
    Top = 2
    object qry_salupd_user: TStringField
      FieldName = 'upd_user'
      Size = 16
    end
    object qry_salupd_date: TDateTimeField
      FieldName = 'upd_date'
    end
    object qry_salsal_month: TWideStringField
      FieldName = 'sal_month'
      FixedChar = True
      Size = 6
    end
    object qry_salemp_id: TStringField
      FieldName = 'emp_id'
      Size = 6
    end
    object qry_saldept_code: TStringField
      FieldName = 'dept_code'
      Size = 6
    end
    object qry_salpst_code: TStringField
      FieldName = 'pst_code'
      Size = 2
    end
    object qry_salsal_bas: TBCDField
      FieldName = 'sal_bas'
      Precision = 6
      Size = 2
    end
    object qry_salsal_frn: TBCDField
      FieldName = 'sal_frn'
      Precision = 6
      Size = 2
    end
    object qry_salfix_add: TBCDField
      FieldName = 'fix_add'
      Precision = 6
      Size = 2
    end
    object qry_salf_award: TBCDField
      FieldName = 'f_award'
      Precision = 6
      Size = 2
    end
    object qry_saladjust: TBCDField
      FieldName = 'adjust'
      Precision = 6
      Size = 2
    end
    object qry_salask_pay: TBCDField
      FieldName = 'ask_pay'
      Precision = 6
      Size = 2
    end
    object qry_salnight_amt: TBCDField
      FieldName = 'night_amt'
      Precision = 6
      Size = 2
    end
    object qry_saldinner_price: TIntegerField
      FieldName = 'dinner_price'
    end
    object qry_salactu_sal: TBCDField
      FieldName = 'actu_sal'
      Precision = 9
      Size = 2
    end
    object qry_sallocal_amt: TBCDField
      FieldName = 'local_amt'
      Precision = 6
      Size = 2
    end
    object qry_salbank_sal: TBCDField
      FieldName = 'bank_sal'
      Precision = 9
      Size = 2
    end
    object qry_salon_duty: TBCDField
      FieldName = 'on_duty'
      Precision = 4
      Size = 1
    end
    object qry_saloff_duty: TBCDField
      FieldName = 'off_duty'
      Precision = 4
      Size = 1
    end
    object qry_salnight1_duty: TBCDField
      FieldName = 'night1_duty'
      Precision = 6
      Size = 1
    end
    object qry_salnight2_duty: TBCDField
      FieldName = 'night2_duty'
      Precision = 6
      Size = 1
    end
    object qry_salnight3_duty: TIntegerField
      FieldName = 'night3_duty'
    end
    object qry_salnight3_price: TIntegerField
      FieldName = 'night3_price'
    end
    object qry_salnight2_price: TIntegerField
      FieldName = 'night2_price'
    end
    object qry_salnight1_price: TBCDField
      FieldName = 'night1_price'
      Precision = 6
      Size = 2
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
    Params = <>
    Left = 661
    Top = 10
    Data = {
      A70300009619E0BD010000001800000019000000000003000000A70308757064
      5F757365720100490000000100055749445448020002001000087570645F6461
      746508000800000000000973616C5F6D6F6E746801004A000000010005574944
      5448020002000C0006656D705F69640100490000000100055749445448020002
      00060009646570745F636F646501004900000001000557494454480200020006
      00087073745F636F646501004900000001000557494454480200020002000773
      616C5F626173050005000000020008444543494D414C53020002000200055749
      4454480200020006000773616C5F66726E050005000000020008444543494D41
      4C53020002000200055749445448020002000600076669785F61646405000500
      0000020008444543494D414C5302000200020005574944544802000200060007
      665F6177617264050005000000020008444543494D414C530200020002000557
      494454480200020006000661646A757374050005000000020008444543494D41
      4C530200020002000557494454480200020006000761736B5F70617905000500
      0000020008444543494D414C5302000200020005574944544802000200060009
      6E696768745F616D74050005000000020008444543494D414C53020002000200
      0557494454480200020006000C64696E6E65725F707269636504000100000000
      0008616374755F73616C070005000000020008444543494D414C530200020002
      00055749445448020002000900096C6F63616C5F616D74050005000000020008
      444543494D414C530200020002000557494454480200020006000862616E6B5F
      73616C070005000000020008444543494D414C53020002000200055749445448
      020002000900076F6E5F64757479040005000000020008444543494D414C5302
      0002000100055749445448020002000400086F66665F64757479040005000000
      020008444543494D414C530200020001000557494454480200020004000B6E69
      676874315F64757479050005000000020008444543494D414C53020002000100
      0557494454480200020006000B6E69676874325F647574790500050000000200
      08444543494D414C530200020001000557494454480200020006000B6E696768
      74335F6475747904000100000000000C6E69676874335F707269636504000100
      000000000C6E69676874325F707269636504000100000000000C6E6967687431
      5F7072696365050005000000020008444543494D414C53020002000200055749
      4454480200020006000000}
    object ClientDataSet1upd_user: TStringField
      FieldName = 'upd_user'
      Size = 16
    end
    object ClientDataSet1upd_date: TDateTimeField
      FieldName = 'upd_date'
    end
    object ClientDataSet1sal_month: TWideStringField
      FieldName = 'sal_month'
      Size = 6
    end
    object ClientDataSet1emp_id: TStringField
      FieldName = 'emp_id'
      Size = 6
    end
    object ClientDataSet1dept_code: TStringField
      FieldName = 'dept_code'
      Size = 6
    end
    object ClientDataSet1pst_code: TStringField
      FieldName = 'pst_code'
      Size = 2
    end
    object ClientDataSet1sal_bas: TBCDField
      DisplayWidth = 9
      FieldName = 'sal_bas'
      Precision = 6
      Size = 2
    end
    object ClientDataSet1sal_frn: TBCDField
      FieldName = 'sal_frn'
      Precision = 6
      Size = 2
    end
    object ClientDataSet1fix_add: TBCDField
      FieldName = 'fix_add'
      Precision = 6
      Size = 2
    end
    object ClientDataSet1f_award: TBCDField
      FieldName = 'f_award'
      Precision = 6
      Size = 2
    end
    object ClientDataSet1adjust: TBCDField
      FieldName = 'adjust'
      Precision = 6
      Size = 2
    end
    object ClientDataSet1ask_pay: TBCDField
      FieldName = 'ask_pay'
      Precision = 6
      Size = 2
    end
    object ClientDataSet1night_amt: TBCDField
      FieldName = 'night_amt'
      Precision = 6
      Size = 2
    end
    object ClientDataSet1dinner_price: TIntegerField
      FieldName = 'dinner_price'
    end
    object ClientDataSet1actu_sal: TBCDField
      FieldName = 'actu_sal'
      Precision = 9
      Size = 2
    end
    object ClientDataSet1local_amt: TBCDField
      FieldName = 'local_amt'
      Precision = 6
      Size = 2
    end
    object ClientDataSet1bank_sal: TBCDField
      FieldName = 'bank_sal'
      Precision = 9
      Size = 2
    end
    object ClientDataSet1on_duty: TBCDField
      FieldName = 'on_duty'
      Precision = 4
      Size = 1
    end
    object ClientDataSet1off_duty: TBCDField
      FieldName = 'off_duty'
      Precision = 4
      Size = 1
    end
    object ClientDataSet1night1_duty: TBCDField
      FieldName = 'night1_duty'
      Precision = 6
      Size = 1
    end
    object ClientDataSet1night2_duty: TBCDField
      FieldName = 'night2_duty'
      Precision = 6
      Size = 1
    end
    object ClientDataSet1night3_duty: TIntegerField
      FieldName = 'night3_duty'
    end
    object ClientDataSet1night3_price: TIntegerField
      FieldName = 'night3_price'
    end
    object ClientDataSet1night2_price: TIntegerField
      FieldName = 'night2_price'
    end
    object ClientDataSet1night1_price: TBCDField
      FieldName = 'night1_price'
      Precision = 6
      Size = 2
    end
    object ClientDataSet1curr_cate: TStringField
      FieldKind = fkCalculated
      FieldName = 'curr_cate'
      Size = 3
      Calculated = True
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
    Left = 472
    Top = 48
  end
  object salaryQry: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select top 1 * from fhrd_salary A')
    Left = 112
    Top = 220
    object salaryQryupd_user: TWideStringField
      FieldName = 'upd_user'
    end
    object salaryQryupd_date: TDateTimeField
      FieldName = 'upd_date'
    end
    object salaryQrysal_month: TWideStringField
      FieldName = 'sal_month'
      FixedChar = True
      Size = 6
    end
    object salaryQryemp_id: TWideStringField
      FieldName = 'emp_id'
      FixedChar = True
      Size = 6
    end
    object salaryQryemp_name: TStringField
      FieldName = 'emp_name'
    end
    object salaryQrypst_code: TStringField
      FieldName = 'pst_code'
      Size = 2
    end
    object salaryQrypst_name: TStringField
      FieldKind = fkCalculated
      FieldName = 'pst_name'
      Calculated = True
    end
    object salaryQrydept_code: TStringField
      FieldName = 'dept_code'
      Size = 6
    end
    object salaryQrydept_name: TStringField
      FieldKind = fkCalculated
      FieldName = 'dept_name'
      Calculated = True
    end
    object salaryQryemp_etdt: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'emp_etdt'
      Calculated = True
    end
    object salaryQryemp_gvdt: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'emp_gvdt'
      Calculated = True
    end
    object salaryQrysal_bas: TBCDField
      FieldName = 'sal_bas'
      Precision = 6
      Size = 2
    end
    object salaryQrysal_frn: TBCDField
      FieldName = 'sal_frn'
      Precision = 6
      Size = 2
    end
    object salaryQryfix_add: TBCDField
      FieldName = 'fix_add'
      Precision = 6
      Size = 2
    end
    object salaryQryf_award: TBCDField
      FieldName = 'f_award'
      Precision = 6
      Size = 2
    end
    object salaryQryadjust: TBCDField
      FieldName = 'adjust'
      Precision = 6
      Size = 2
    end
    object salaryQryask_pay: TBCDField
      FieldName = 'ask_pay'
      Precision = 6
      Size = 2
    end
    object salaryQrynight_amt: TBCDField
      FieldName = 'night_amt'
      Precision = 6
      Size = 2
    end
    object salaryQrydinner_price: TBCDField
      FieldName = 'dinner_price'
      Precision = 6
      Size = 2
    end
    object salaryQryactu_sal: TBCDField
      FieldName = 'actu_sal'
      Precision = 9
      Size = 2
    end
    object salaryQrynight1_price: TBCDField
      FieldName = 'night1_price'
      Precision = 6
      Size = 2
    end
    object salaryQrynight2_price: TBCDField
      FieldName = 'night2_price'
      Precision = 6
      Size = 2
    end
    object salaryQrynight3_price: TBCDField
      FieldName = 'night3_price'
      Precision = 6
      Size = 2
    end
    object salaryQrynight1_duty: TBCDField
      FieldName = 'night1_duty'
      Precision = 6
      Size = 1
    end
    object salaryQrynight2_duty: TBCDField
      FieldName = 'night2_duty'
      Precision = 6
      Size = 1
    end
    object salaryQrynight3_duty: TBCDField
      FieldName = 'night3_duty'
      Precision = 6
      Size = 1
    end
  end
  object salaryDataSource: TDataSource
    DataSet = salaryQry
    Left = 152
    Top = 220
  end
end
