object FormSal02: TFormSal02
  Left = 211
  Top = 101
  Width = 798
  Height = 528
  Caption = 'FormSal02'
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
  object TntPanel1: TTntPanel
    Left = 0
    Top = 0
    Width = 790
    Height = 49
    Align = alTop
    Caption = #21729#24037#21151#32318#29518#37329#20316#26989
    Color = clCream
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object TntPageControl1: TTntPageControl
    Left = 0
    Top = 49
    Width = 790
    Height = 445
    ActivePage = addpage
    Align = alClient
    TabOrder = 1
    object update: TTntTabSheet
      Caption = #20462#25913
      object TntGroupBox3: TTntGroupBox
        Left = 0
        Top = 0
        Width = 782
        Height = 81
        Align = alTop
        Caption = #26597#35426#26781#20214
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object Label6: TLabel
          Left = 268
          Top = 19
          Width = 18
          Height = 13
          Caption = '------'
        end
        object TntLabel13: TTntLabel
          Left = 288
          Top = 19
          Width = 145
          Height = 13
          AutoSize = False
        end
        object id_s: TTntEdit
          Left = 169
          Top = 17
          Width = 51
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
          MaxLength = 6
          ParentFont = False
          TabOrder = 0
          Text = '000000'
          OnDblClick = id_sDblClick
        end
        object ID_E: TTntEdit
          Left = 237
          Top = 16
          Width = 51
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
          MaxLength = 6
          ParentFont = False
          TabOrder = 1
          Text = '999999'
          OnDblClick = id_sDblClick
        end
        object bb_search: TTntBitBtn
          Left = 627
          Top = 30
          Width = 78
          Height = 23
          Caption = #26597#25214
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          WordWrap = True
          OnClick = bb_searchClick
          Kind = bkOK
        end
        object DEPT_E: TTntComboBox
          Left = 367
          Top = 44
          Width = 191
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
        object DEPT_S: TTntComboBox
          Left = 170
          Top = 45
          Width = 191
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
        object ID_RANGE: TTntCheckBox
          Left = 73
          Top = 19
          Width = 80
          Height = 17
          Caption = #24037#34399#31684#22285
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          State = cbChecked
          TabOrder = 5
          OnClick = ID_RANGEClick
        end
        object DEPT_RANGE: TTntCheckBox
          Left = 73
          Top = 47
          Width = 80
          Height = 17
          Caption = #37096#38272#31684#22285
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          State = cbChecked
          TabOrder = 6
          OnClick = ID_RANGEClick
        end
        object EDT_name: TTntEdit
          Left = 510
          Top = 16
          Width = 71
          Height = 21
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
          MaxLength = 6
          ParentFont = False
          TabOrder = 7
          OnDblClick = EDT_nameDblClick
        end
        object cb_name: TTntCheckBox
          Left = 428
          Top = 18
          Width = 77
          Height = 17
          Caption = #22995#21517
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          State = cbChecked
          TabOrder = 8
          OnClick = ID_RANGEClick
        end
      end
      object TntPanel2: TTntPanel
        Left = 0
        Top = 81
        Width = 782
        Height = 336
        Align = alClient
        TabOrder = 1
        object TntDBGrid1: TTntDBGrid
          Left = 1
          Top = 1
          Width = 517
          Height = 334
          Align = alClient
          DataSource = DataSource1
          FixedColor = clSkyBlue
          ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
          ReadOnly = True
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
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'valid_date'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'sal_spec'
              Width = 94
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'sal_achi'
              Width = 89
              Visible = True
            end>
        end
        object TntPanel3: TTntPanel
          Left = 518
          Top = 1
          Width = 263
          Height = 334
          Align = alRight
          TabOrder = 1
          object TntLabel1: TTntLabel
            Left = 16
            Top = 21
            Width = 73
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
          object TntLabel2: TTntLabel
            Left = 16
            Top = 144
            Width = 73
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = #29983#25928#26085#36215
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object TntLabel3: TTntLabel
            Left = 14
            Top = 180
            Width = 73
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = #29305#21029#29518#37329
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object TntLabel4: TTntLabel
            Left = 13
            Top = 216
            Width = 73
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = #21151#32318#29518#37329
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label1: TLabel
            Left = 6
            Top = 50
            Width = 300
            Height = 3
            AutoSize = False
            Color = clBackground
            ParentColor = False
          end
          object Label2: TLabel
            Left = 6
            Top = 246
            Width = 298
            Height = 3
            AutoSize = False
            Color = clBackground
            ParentColor = False
          end
          object sb_Recover: TTntSpeedButton
            Left = 73
            Top = 266
            Width = 66
            Height = 25
            Caption = #24674#24489
            Enabled = False
            Flat = True
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              88888888888888888888870000000008888887EFEFEFEF08888887FEFEFE7E08
              888887EF00080788888887FEFEFE0078888887EF000F0B07888887FEFEFE0BB0
              788887EF0000E0BB078887FEFEFEF00BB0888777777800BB0788888888880BBB
              B0788888888870BBBB0888888888800000088888888888888888}
            OnClick = sb_RecoverClick
          end
          object sb_Save: TTntSpeedButton
            Left = 153
            Top = 266
            Width = 66
            Height = 25
            Caption = #20445#23384
            Enabled = False
            Flat = True
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              04000000000080000000C40E0000C40E00001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000FFF000
              00000888870F011111900887770F01111190087000FF01111190080FF0001111
              1190080F011111111190080F011111111190080F011111111190080F01111111
              1190080F019911111190080FF00091111190088000FF011111900888870F0111
              11900888870F011111900777780F09999910000000FFF0000000}
            OnClick = sb_SaveClick
          end
          object Label3: TLabel
            Left = 6
            Top = 127
            Width = 298
            Height = 3
            AutoSize = False
            Color = clBackground
            ParentColor = False
          end
          object TntLabel5: TTntLabel
            Left = 4
            Top = 67
            Width = 87
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = #22995#21517
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object TntLabel6: TTntLabel
            Left = 4
            Top = 98
            Width = 87
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
          object TntDBEdit1: TTntDBEdit
            Left = 97
            Top = 17
            Width = 65
            Height = 21
            Color = clSkyBlue
            DataField = 'emp_id'
            DataSource = DataSource1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            OnChange = TntDBEdit1Change
          end
          object TntDBEdit2: TTntDBEdit
            Left = 96
            Top = 140
            Width = 65
            Height = 21
            DataField = 'valid_date'
            DataSource = DataSource1
            ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
            TabOrder = 1
          end
          object TntDBEdit3: TTntDBEdit
            Left = 94
            Top = 175
            Width = 65
            Height = 21
            DataField = 'sal_spec'
            DataSource = DataSource1
            ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
            MaxLength = 8
            TabOrder = 2
            OnClick = me_specEnter
          end
          object TntDBEdit4: TTntDBEdit
            Left = 93
            Top = 213
            Width = 65
            Height = 21
            DataField = 'sal_achi'
            DataSource = DataSource1
            ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
            MaxLength = 8
            TabOrder = 3
            OnClick = me_specEnter
          end
          object TntEdit1: TTntEdit
            Left = 97
            Top = 62
            Width = 65
            Height = 21
            Color = clSkyBlue
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
          end
          object TntEdit2: TTntEdit
            Left = 97
            Top = 94
            Width = 161
            Height = 21
            Color = clSkyBlue
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
          end
        end
      end
    end
    object addpage: TTntTabSheet
      Caption = #26032#22686
      object TntPanel4: TTntPanel
        Left = 0
        Top = 0
        Width = 782
        Height = 417
        Align = alClient
        BevelOuter = bvLowered
        Caption = 'TntPanel3'
        TabOrder = 0
        object panel1: TTntPanel
          Left = 136
          Top = 24
          Width = 537
          Height = 337
          BevelOuter = bvLowered
          Color = clSkyBlue
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object TntLabel7: TTntLabel
            Left = 156
            Top = 41
            Width = 73
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
          object TntLabel8: TTntLabel
            Left = 144
            Top = 115
            Width = 87
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = #22995#21517
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object TntLabel9: TTntLabel
            Left = 144
            Top = 143
            Width = 87
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
          object TntLabel10: TTntLabel
            Left = 97
            Top = 210
            Width = 73
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = #29983#25928#26085#26399
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object TntLabel11: TTntLabel
            Left = 97
            Top = 246
            Width = 73
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = #29305#21029#29518#37329
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object TntLabel12: TTntLabel
            Left = 264
            Top = 246
            Width = 73
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = #21151#32318#29518#37329
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object TntLabel15: TTntLabel
            Left = 312
            Top = 42
            Width = 177
            Height = 13
            AutoSize = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object bb_add: TTntBitBtn
            Left = 184
            Top = 283
            Width = 73
            Height = 25
            Caption = #26032#22686
            Enabled = False
            TabOrder = 0
            OnClick = bb_addClick
            Kind = bkOK
          end
          object tedt_name: TTntEdit
            Left = 237
            Top = 110
            Width = 65
            Height = 21
            Color = clSkyBlue
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object tedt_dept: TTntEdit
            Left = 237
            Top = 139
            Width = 161
            Height = 21
            Color = clSkyBlue
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
          object edt_emp: TTntEdit
            Left = 238
            Top = 36
            Width = 65
            Height = 21
            ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
            MaxLength = 6
            TabOrder = 3
            OnChange = edt_empChange
            OnDblClick = id_sDblClick
          end
          object date_valid: TTntDateTimePicker
            Left = 179
            Top = 205
            Width = 89
            Height = 21
            Date = 38601.560860995370000000
            Time = 38601.560860995370000000
            Enabled = False
            ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
            TabOrder = 4
          end
          object TntPanel5: TTntPanel
            Left = 0
            Top = 84
            Width = 537
            Height = 3
            Color = clActiveCaption
            TabOrder = 5
          end
          object TntPanel6: TTntPanel
            Left = 0
            Top = 176
            Width = 537
            Height = 3
            Color = clActiveCaption
            TabOrder = 6
          end
          object me_spec: TMaskEdit
            Left = 180
            Top = 240
            Width = 59
            Height = 21
            CharCase = ecUpperCase
            Enabled = False
            EditMask = '!99999999;1; '
            ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
            MaxLength = 8
            TabOrder = 7
            Text = '        '
            OnClick = me_specEnter
          end
          object me_achi: TMaskEdit
            Left = 346
            Top = 240
            Width = 59
            Height = 21
            CharCase = ecUpperCase
            Enabled = False
            EditMask = '!99999999;1; '
            ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
            MaxLength = 8
            TabOrder = 8
            Text = '        '
            OnClick = me_specEnter
          end
          object bb_reset: TTntBitBtn
            Left = 272
            Top = 283
            Width = 73
            Height = 25
            Caption = #37325#32622
            Enabled = False
            TabOrder = 9
            OnClick = bb_resetClick
            Kind = bkRetry
          end
        end
      end
    end
  end
  object ADOCommand1: TADOCommand
    Connection = DMHrdsys.conn
    Parameters = <>
    Left = 248
    Top = 8
  end
  object ADOQuery1: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    OnWillChangeField = ADOQuery1WillChangeField
    Parameters = <>
    SQL.Strings = (
      'select * from hrd_sal_spec')
    Left = 216
    Top = 8
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 288
    Top = 8
  end
  object ADOQuery2: TADOQuery
    Connection = DMHrdsys.conn
    Parameters = <>
    Left = 488
    Top = 8
  end
end
