object FormCosSal01: TFormCosSal01
  Left = 3
  Top = 27
  Width = 783
  Height = 501
  Caption = 'FormCosSal01'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 775
    Height = 467
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object PanelTitle: TTntPanel
      Left = 0
      Top = 0
      Width = 775
      Height = 36
      Align = alTop
      BevelOuter = bvNone
      Caption = 'CosSal01_titl'
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
      Width = 775
      Height = 431
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object PanelPre: TPanel
        Left = 0
        Top = 0
        Width = 775
        Height = 105
        Align = alTop
        TabOrder = 0
        object PanelQuery: TTntPanel
          Left = 1
          Top = 1
          Width = 773
          Height = 103
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object GrpBoxQuery: TTntGroupBox
            Left = 0
            Top = 0
            Width = 773
            Height = 103
            Align = alClient
            Caption = 'query_condition'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object BtnQuery: TTntBitBtn
              Left = 596
              Top = 40
              Width = 73
              Height = 25
              BiDiMode = bdLeftToRight
              Caption = 'query'
              Default = True
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentBiDiMode = False
              ParentFont = False
              TabOrder = 0
              OnClick = BtnQueryClick
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                B78183B78183B78183B78183B78183B78183B78183B78183B78183B78183B781
                83B78183B78183FF00FFFF00FFFF00FF636E7BFEEED4F7E3C5F6DFBCF5DBB4F3
                D7ABF3D3A2F1CF9AF0CF97F0CF98F0CF98F5D49AB78183FF00FFFF00FF5E98C7
                3489D07F859DF6E3CBF5DFC2F4DBBAF2D7B2F1D4A9F1D0A2EECC99EECC97EECC
                97F3D199B78183FF00FFFF00FFFF00FF4BB6FF288BE0858498F5E3CBF5DFC3F3
                DBBBF2D7B2F1D4ABF0D0A3EECC9AEECC97F3D199B78183FF00FFFF00FFFF00FF
                B481764DB5FF278BDE79819AF6E3CAF5DFC2F4DBB9F2D7B2F1D4AAF0D0A1EFCD
                99F3D198B78183FF00FFFF00FFFF00FFBA8E85FFFCF44CB9FF5A91BFA48179BE
                978EAC7E79BE9589D6B49BF1D3AAF0D0A1F3D29BB78183FF00FFFF00FFFF00FF
                BA8E85FFFFFDFBF4ECBFA19FC7A59CE1C9B8F2DFC6E0C3ADC59F90D7B49BF0D4
                A9F5D5A3B78183FF00FFFF00FFFF00FFCB9A82FFFFFFFEF9F5C09C97E3CEC4F9
                EADAF8E7D2FFFFF7E0C2ADBE9589F2D8B2F6D9ACB78183FF00FFFF00FFFF00FF
                CB9A82FFFFFFFFFEFDAC7F7BF8EEE7F9EFE3F8EADAFFFFF0F3DEC7AC7E79F4DB
                B9F8DDB4B78183FF00FFFF00FFFF00FFDCA887FFFFFFFFFFFFC19F9CE6D6D1FB
                F3EBFAEFE2FFFFDEE2C8B8BE978DF7E1C2F0DAB7B78183FF00FFFF00FFFF00FF
                DCA887FFFFFFFFFFFFDFCDCBC9ACA9E6D6D1F8EEE6E3CEC4C7A59CC3A394E6D9
                C4C6BCA9B78183FF00FFFF00FFFF00FFE3B18EFFFFFFFFFFFFFFFFFFDFCDCBC1
                9F9CAC7F7BC09D97D6BAB1B8857AB8857AB8857AB78183FF00FFFF00FFFF00FF
                E3B18EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFFFEF9E3CFC9B8857AE8B2
                70ECA54AC58768FF00FFFF00FFFF00FFEDBD92FFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFE4D4D2B8857AFAC577CD9377FF00FFFF00FFFF00FFFF00FF
                EDBD92FCF7F4FCF7F3FBF6F3FBF6F3FAF5F3F9F5F3F9F5F3E1D0CEB8857ACF9B
                86FF00FFFF00FFFF00FFFF00FFFF00FFEDBD92DCA887DCA887DCA887DCA887DC
                A887DCA887DCA887DCA887B8857AFF00FFFF00FFFF00FFFF00FF}
            end
            object PanelInput: TPanel
              Left = 8
              Top = 13
              Width = 500
              Height = 76
              BevelOuter = bvNone
              TabOrder = 1
              object PanelSts1: TPanel
                Left = 14
                Top = 17
                Width = 450
                Height = 30
                TabOrder = 0
                object Label_dept: TTntLabel
                  Left = 1
                  Top = 7
                  Width = 70
                  Height = 13
                  Alignment = taRightJustify
                  AutoSize = False
                  Caption = 'fld_dept'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlue
                  Font.Height = -13
                  Font.Name = 'MS PGothic'
                  Font.Style = []
                  ParentFont = False
                end
                object Label_month: TTntLabel
                  Left = 300
                  Top = 5
                  Width = 64
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
                object Edit_Dept_code: TTntComboBox
                  Left = 72
                  Top = 5
                  Width = 130
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ItemHeight = 13
                  ParentFont = False
                  TabOrder = 0
                end
                object edit_month: TMaskEdit
                  Left = 367
                  Top = 5
                  Width = 47
                  Height = 21
                  Hint = 'yyyy/mm'
                  EditMask = '9999/99;0;_'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  MaxLength = 7
                  ParentFont = False
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 1
                end
              end
              object PanelSts2: TPanel
                Left = 14
                Top = 25
                Width = 450
                Height = 30
                TabOrder = 1
                object TntLabel3: TTntLabel
                  Left = 1
                  Top = 7
                  Width = 70
                  Height = 13
                  Alignment = taRightJustify
                  AutoSize = False
                  Caption = 'fld_upd_user'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlue
                  Font.Height = -13
                  Font.Name = 'MS PGothic'
                  Font.Style = []
                  ParentFont = False
                end
                object TntLabel4: TTntLabel
                  Left = 292
                  Top = 4
                  Width = 63
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
                object Edit_User: TTntEdit
                  Left = 72
                  Top = 5
                  Width = 65
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                end
                object edit_month2: TMaskEdit
                  Left = 359
                  Top = 5
                  Width = 47
                  Height = 21
                  Hint = 'yyyy/mm'
                  EditMask = '9999/99;0;_'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  MaxLength = 7
                  ParentFont = False
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 1
                end
              end
              object PanelSts3: TPanel
                Left = 14
                Top = 33
                Width = 450
                Height = 30
                TabOrder = 2
                object TntLabel1: TTntLabel
                  Left = 1
                  Top = 7
                  Width = 70
                  Height = 13
                  Alignment = taRightJustify
                  AutoSize = False
                  Caption = 'fld_dept'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlue
                  Font.Height = -13
                  Font.Name = 'MS PGothic'
                  Font.Style = []
                  ParentFont = False
                end
                object TntLabel2: TTntLabel
                  Left = 267
                  Top = 6
                  Width = 68
                  Height = 13
                  Alignment = taRightJustify
                  AutoSize = False
                  Caption = 'emp_id'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlue
                  Font.Height = -13
                  Font.Name = 'MS PGothic'
                  Font.Style = []
                  ParentFont = False
                end
                object Edit_Dept_code2: TTntComboBox
                  Left = 72
                  Top = 5
                  Width = 130
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ItemHeight = 13
                  ParentFont = False
                  TabOrder = 0
                end
                object Edit_empid: TTntEdit
                  Left = 336
                  Top = 5
                  Width = 65
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                end
              end
              object RbSts3: TTntRadioButton
                Left = 205
                Top = 0
                Width = 90
                Height = 17
                Caption = 'sal_re_put'
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 3
                OnClick = RbSts1Click
              end
              object RbSts2: TTntRadioButton
                Left = 110
                Top = 0
                Width = 90
                Height = 17
                Caption = 'back_confirm'
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 4
                OnClick = RbSts1Click
              end
              object RbSts1: TTntRadioButton
                Left = 15
                Top = 0
                Width = 90
                Height = 17
                Caption = 'sal_back'
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 5
                OnClick = RbSts1Click
              end
              object RbSts4: TTntRadioButton
                Left = 300
                Top = 0
                Width = 90
                Height = 17
                Caption = 'put_confirm'
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 6
                OnClick = RbSts1Click
              end
              object RbSts5: TTntRadioButton
                Left = 395
                Top = 0
                Width = 94
                Height = 17
                Caption = 'cossal01_status9'
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 7
                OnClick = RbSts1Click
              end
              object PanelSts5: TPanel
                Left = 14
                Top = 41
                Width = 450
                Height = 30
                TabOrder = 8
                Visible = False
                object TntLabel5: TTntLabel
                  Left = 11
                  Top = 9
                  Width = 64
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
                object Edit_Month5: TMaskEdit
                  Left = 79
                  Top = 5
                  Width = 47
                  Height = 21
                  Hint = 'yyyy/mm'
                  EditMask = '9999/99;0;_'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  MaxLength = 7
                  ParentFont = False
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 0
                end
              end
            end
            object BtnLeEmp: TTntBitBtn
              Left = 596
              Top = 10
              Width = 73
              Height = 25
              BiDiMode = bdLeftToRight
              Caption = #38626#32887#36681#20837
              Default = True
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentBiDiMode = False
              ParentFont = False
              TabOrder = 2
              OnClick = BtnLeEmpClick
            end
          end
        end
      end
      object PanelGrid: TPanel
        Left = 0
        Top = 105
        Width = 775
        Height = 283
        Align = alClient
        TabOrder = 1
        object DBGrid1: TTntDBGrid
          Left = 1
          Top = 1
          Width = 773
          Height = 281
          Align = alClient
          DataSource = DataSource1
          Enabled = False
          FixedColor = clSkyBlue
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBGrid1CellClick
          OnDrawColumnCell = DBGrid1DrawColumnCell
          OnKeyDown = DBGrid1KeyDown
          OnTitleClick = DBGrid1TitleClick
          Columns = <
            item
              Expanded = False
              Width = 50
              Visible = True
            end
            item
              Color = cl3DLight
              Expanded = False
              FieldName = 'emp_id'
              ReadOnly = True
              Width = 50
              Visible = True
            end
            item
              Color = cl3DLight
              Expanded = False
              FieldName = 'name_vim'
              ReadOnly = True
              Width = 128
              Visible = True
            end
            item
              Color = cl3DLight
              Expanded = False
              FieldName = 'dept_code'
              ReadOnly = True
              Visible = True
            end
            item
              Color = cl3DLight
              Expanded = False
              FieldName = 'info_code'
              ReadOnly = True
              Width = 73
              Visible = True
            end
            item
              Color = cl3DLight
              Expanded = False
              FieldName = 'sal_mon'
              ReadOnly = True
              Visible = True
            end
            item
              Color = cl3DLight
              Expanded = False
              FieldName = 'full_salary'
              Visible = True
            end
            item
              Color = cl3DLight
              Expanded = False
              FieldName = 'upd_user'
              Width = 62
              Visible = True
            end
            item
              Color = cl3DLight
              Expanded = False
              FieldName = 'status'
              ReadOnly = True
              Width = 61
              Visible = True
            end>
        end
      end
      object PanelTail: TTntPanel
        Left = 0
        Top = 388
        Width = 775
        Height = 43
        Align = alBottom
        TabOrder = 2
        object BtnCancel: TTntSpeedButton
          Left = 582
          Top = 12
          Width = 80
          Height = 25
          Caption = '(&u)ndo'
          Enabled = False
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Palatino Linotype'
          Font.Style = []
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
            3333333777333777FF3333993333339993333377FF3333377FF3399993333339
            993337777FF3333377F3393999333333993337F777FF333337FF993399933333
            399377F3777FF333377F993339993333399377F33777FF33377F993333999333
            399377F333777FF3377F993333399933399377F3333777FF377F993333339993
            399377FF3333777FF7733993333339993933373FF3333777F7F3399933333399
            99333773FF3333777733339993333339933333773FFFFFF77333333999999999
            3333333777333777333333333999993333333333377777333333}
          NumGlyphs = 2
          ParentFont = False
          OnClick = BtnCancelClick
        end
        object BtnSubmit: TTntSpeedButton
          Left = 662
          Top = 12
          Width = 80
          Height = 25
          Caption = '(&s)ave'
          Enabled = False
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Palatino Linotype'
          Font.Style = []
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
            00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
            00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
            00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
            00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
            00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
            00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
            0003737FFFFFFFFF7F7330099999999900333777777777777733}
          NumGlyphs = 2
          ParentFont = False
          OnClick = BtnSubmitClick
        end
        object BtnChooseAll: TTntBitBtn
          Left = 4
          Top = 10
          Width = 75
          Height = 25
          Caption = 'choose_all'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ModalResult = 8
          ParentFont = False
          TabOrder = 0
          OnClick = BtnChooseAllClick
          NumGlyphs = 2
        end
        object BtnChooseNone: TTntBitBtn
          Left = 88
          Top = 10
          Width = 75
          Height = 25
          Caption = 'choose_none'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ModalResult = 1
          ParentFont = False
          TabOrder = 1
          OnClick = BtnChooseAllClick
          NumGlyphs = 2
        end
        object TntStaticText2: TTntStaticText
          Left = 256
          Top = 18
          Width = 150
          Height = 17
          AutoSize = False
          Caption = 'msg_key_choose'
          Color = clYellow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 2
        end
        object TntBitBtn1: TTntBitBtn
          Left = 172
          Top = 10
          Width = 75
          Height = 25
          Caption = 'clear'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ModalResult = 8
          ParentFont = False
          TabOrder = 3
          OnClick = BtnChooseAllClick
          NumGlyphs = 2
        end
        object Edit_tot: TMaskEdit
          Left = 448
          Top = 14
          Width = 90
          Height = 21
          EditMask = '!999,999,999,999;0;_'
          MaxLength = 15
          ReadOnly = True
          TabOrder = 4
        end
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 201
    Top = 4
  end
  object ADOQuery1: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterOpen = ADOQuery1AfterOpen
    AfterClose = ADOQuery1AfterClose
    BeforePost = ADOQuery1BeforePost
    AfterScroll = ADOQuery1AfterScroll
    OnCalcFields = ADOQuery1CalcFields
    Parameters = <>
    SQL.Strings = (
      'select top 1 * from cos_sal_no_put')
    Left = 168
    object ADOQuery1upd_user: TStringField
      FieldName = 'upd_user'
      Size = 10
    end
    object ADOQuery1upd_date: TDateTimeField
      FieldName = 'upd_date'
    end
    object ADOQuery1sal_mon: TStringField
      FieldName = 'sal_mon'
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
      DisplayWidth = 15
      FieldKind = fkCalculated
      FieldName = 'emp_chs'
      Calculated = True
    end
    object ADOQuery1name_vim: TWideStringField
      DisplayWidth = 30
      FieldName = 'name_vim'
    end
    object ADOQuery1info_code: TStringField
      FieldName = 'info_code'
      OnGetText = ADOQuery1info_codeGetText
      FixedChar = True
      Size = 1
    end
    object ADOQuery1full_salary: TFloatField
      FieldName = 'full_salary'
      OnGetText = ADOQuery1full_salaryGetText
    end
    object ADOQuery1status: TStringField
      DisplayWidth = 10
      FieldName = 'status'
      OnGetText = ADOQuery1statusGetText
      FixedChar = True
      Size = 1
    end
    object ADOQuery1user_sts1: TStringField
      FieldName = 'user_sts1'
      Size = 10
    end
    object ADOQuery1date_sts1: TDateTimeField
      FieldName = 'date_sts1'
    end
    object ADOQuery1user_sts2: TStringField
      FieldName = 'user_sts2'
      Size = 10
    end
    object ADOQuery1date_sts2: TDateTimeField
      FieldName = 'date_sts2'
    end
    object ADOQuery1user_sts3: TStringField
      FieldName = 'user_sts3'
      Size = 10
    end
    object ADOQuery1date_sts3: TDateTimeField
      FieldName = 'date_sts3'
    end
    object ADOQuery1user_sts4: TStringField
      FieldName = 'user_sts4'
      Size = 10
    end
    object ADOQuery1date_sts4: TDateTimeField
      FieldName = 'date_sts4'
    end
    object ADOQuery1user_sts9: TStringField
      FieldName = 'user_sts9'
      Size = 10
    end
    object ADOQuery1date_sts9: TDateTimeField
      FieldName = 'date_sts9'
    end
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = ADOQuery1
    Left = 240
    Top = 5
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 288
    Top = 5
    object ClientDataSet1upd_user: TStringField
      FieldName = 'upd_user'
      Size = 10
    end
    object ClientDataSet1upd_date: TDateTimeField
      FieldName = 'upd_date'
    end
    object ClientDataSet1sal_mon: TStringField
      FieldName = 'sal_mon'
      Size = 6
    end
    object ClientDataSet1dept_code: TStringField
      FieldName = 'dept_code'
      Size = 6
    end
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
    end
    object ClientDataSet1info_code: TStringField
      FieldName = 'info_code'
      FixedChar = True
      Size = 1
    end
    object ClientDataSet1full_salary: TFloatField
      FieldName = 'full_salary'
    end
    object ClientDataSet1status: TStringField
      FieldName = 'status'
      FixedChar = True
      Size = 1
    end
    object ClientDataSet1user_sts1: TStringField
      FieldName = 'user_sts1'
      Size = 10
    end
    object ClientDataSet1date_sts1: TDateTimeField
      FieldName = 'date_sts1'
    end
    object ClientDataSet1user_sts2: TStringField
      FieldName = 'user_sts2'
      Size = 10
    end
    object ClientDataSet1date_sts2: TDateTimeField
      FieldName = 'date_sts2'
    end
    object ClientDataSet1user_sts3: TStringField
      FieldName = 'user_sts3'
      Size = 10
    end
    object ClientDataSet1date_sts3: TDateTimeField
      FieldName = 'date_sts3'
    end
    object ClientDataSet1user_sts4: TStringField
      FieldName = 'user_sts4'
      Size = 10
    end
    object ClientDataSet1date_sts4: TDateTimeField
      FieldName = 'date_sts4'
    end
    object ClientDataSet1user_sts9: TStringField
      FieldName = 'user_sts9'
      Size = 10
    end
    object ClientDataSet1date_sts9: TDateTimeField
      FieldName = 'date_sts9'
    end
    object ClientDataSet1tot_money: TAggregateField
      FieldName = 'tot_money'
      Active = True
      Expression = 'sum(full_salary)'
    end
  end
end
