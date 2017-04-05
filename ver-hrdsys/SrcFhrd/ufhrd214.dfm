object FormFhrd214: TFormFhrd214
  Left = 179
  Top = 160
  Width = 786
  Height = 534
  Caption = 'FormFhrd214'
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
    Width = 778
    Height = 33
    Align = alTop
    Caption = #21047#21345#36039#26009#25505#38598#32173#35703
    Color = clCream
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object TntPageControl1: TTntPageControl
    Left = 0
    Top = 33
    Width = 778
    Height = 467
    ActivePage = TntTabSheet3
    Align = alClient
    TabOrder = 1
    object TntTabSheet3: TTntTabSheet
      Caption = #21047#21345#36039#26009#26597#35426
      object TntPanel4: TTntPanel
        Left = 0
        Top = 0
        Width = 770
        Height = 439
        Align = alClient
        BevelOuter = bvLowered
        Caption = 'TntPanel4'
        TabOrder = 0
        object TntGroupBox6: TTntGroupBox
          Left = 1
          Top = 1
          Width = 768
          Height = 72
          Align = alTop
          Caption = #26597#35426#26781#20214
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object TntLabel7: TTntLabel
            Left = 30
            Top = 18
            Width = 48
            Height = 13
            Caption = #32771#21220#26085#26399
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object sb_Emp: TTntSpeedButton
            Left = 161
            Top = 40
            Width = 23
            Height = 22
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object dtp_DutDay: TTntDateTimePicker
            Left = 96
            Top = 13
            Width = 89
            Height = 21
            Date = 39812.380243587960000000
            Time = 39812.380243587960000000
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
            ParentFont = False
            TabOrder = 0
            OnChange = dtp_DutDayChange
          end
          object cob_DeptBeg: TTntComboBox
            Left = 280
            Top = 40
            Width = 169
            Height = 21
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
            ItemHeight = 13
            ParentFont = False
            TabOrder = 1
            OnChange = cob_DeptBegChange
          end
          object cob_DeptEnd: TTntComboBox
            Left = 450
            Top = 40
            Width = 169
            Height = 21
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
            ItemHeight = 13
            ParentFont = False
            TabOrder = 2
          end
          object cb_Mach: TTntCheckBox
            Left = 384
            Top = 18
            Width = 65
            Height = 17
            Caption = #32771#21220#26426
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
          object cob_QryMch: TTntComboBox
            Left = 448
            Top = 13
            Width = 169
            Height = 21
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
            ItemHeight = 13
            ParentFont = False
            TabOrder = 4
          end
          object bbtn_ConfirmQry: TTntBitBtn
            Left = 656
            Top = 12
            Width = 75
            Height = 25
            Caption = #30906#23450
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            OnClick = bbtn_ConfirmQryClick
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
          object cb_Dept: TTntCheckBox
            Left = 216
            Top = 45
            Width = 57
            Height = 17
            Caption = #37096#38272
            Checked = True
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            State = cbChecked
            TabOrder = 6
          end
          object cb_Emp: TTntCheckBox
            Left = 13
            Top = 45
            Width = 97
            Height = 17
            Caption = #21729#24037#24037#34399
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 7
          end
          object EditEmp: TTntEdit
            Left = 96
            Top = 40
            Width = 64
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
            MaxLength = 6
            ParentFont = False
            TabOrder = 8
          end
          object bbtn_Reset: TTntBitBtn
            Left = 656
            Top = 40
            Width = 75
            Height = 25
            Caption = #37325#32622
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 9
            OnClick = bbtn_ResetClick
            Glyph.Data = {
              DE010000424DDE01000000000000760000002800000024000000120000000100
              0400000000006801000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
              33333333333F8888883F33330000324334222222443333388F3833333388F333
              000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
              F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
              223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
              3338888300003AAAAAAA33333333333888888833333333330000333333333333
              333333333333333333FFFFFF000033333333333344444433FFFF333333888888
              00003A444333333A22222438888F333338F3333800003A2243333333A2222438
              F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
              22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
              33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
              3333333333338888883333330000333333333333333333333333333333333333
              0000}
            NumGlyphs = 2
          end
          object TntDateTimePicker1: TTntDateTimePicker
            Left = 192
            Top = 13
            Width = 89
            Height = 21
            Date = 39812.380243587960000000
            Time = 39812.380243587960000000
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
            ParentFont = False
            TabOrder = 10
          end
        end
        object TntGroupBox7: TTntGroupBox
          Left = 1
          Top = 73
          Width = 768
          Height = 324
          Align = alClient
          Caption = #21047#21345#36039#26009#26126#32048
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object dbg_TrtQry: TTntDBGrid
            Left = 2
            Top = 15
            Width = 764
            Height = 307
            Align = alClient
            DataSource = ds_TrtQry
            FixedColor = clSkyBlue
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
            ParentFont = False
            ReadOnly = True
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
                Title.Caption = #21729#24037#24037#34399
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'emp_name'
                Title.Caption = #21729#24037#22995#21517
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'dept_code'
                Title.Caption = #37096#38272#20195#34399
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 67
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'abbr_titl'
                Title.Caption = #37096#38272#31777#31281
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 157
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'spc_id'
                Title.Caption = #35672#21029#21345#34399
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 81
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'trt_date'
                Title.Caption = #21047#21345#26085#26399
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 90
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'trt_time'
                Title.Caption = #21047#21345#26178#38291
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 77
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'trt_station'
                Title.Caption = #21345#26426#22320#22336
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 53
                Visible = True
              end>
          end
        end
        object TntPanel6: TTntPanel
          Left = 1
          Top = 397
          Width = 768
          Height = 41
          Align = alBottom
          TabOrder = 2
          object TntBitBtn2: TTntBitBtn
            Left = 320
            Top = 8
            Width = 75
            Height = 25
            Caption = #25171#21360
            TabOrder = 0
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
          object TntBitBtn4: TTntBitBtn
            Left = 400
            Top = 8
            Width = 75
            Height = 25
            Caption = #38364#38281
            TabOrder = 1
            Visible = False
            Glyph.Data = {
              DE010000424DDE01000000000000760000002800000024000000120000000100
              0400000000006801000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
              F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
              000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
              338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
              45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
              3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
              F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
              000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
              338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
              4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
              8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
              333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
              0000}
            NumGlyphs = 2
          end
        end
      end
    end
  end
  object qry_machine: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'select * from hrd_dut_machine')
    Left = 5
    Top = 10
    object qry_machinemac_addr: TStringField
      FieldName = 'mac_addr'
      FixedChar = True
      Size = 1
    end
    object qry_machinemac_pos: TWideStringField
      FieldName = 'mac_pos'
      Size = 50
    end
    object qry_machinemac_remark: TWideStringField
      FieldName = 'mac_remark'
      Size = 50
    end
  end
  object ds_machine: TDataSource
    DataSet = qry_machine
    Left = 37
    Top = 10
  end
  object OpenDialog: TTntOpenDialog
    Left = 101
    Top = 10
  end
  object cmd_Temp: TADOCommand
    Connection = DMHrdsys.conn
    Parameters = <>
    Left = 208
    Top = 8
  end
  object qry_Temp: TADOQuery
    Connection = DMHrdsys.conn
    Parameters = <>
    Left = 237
    Top = 10
  end
  object ds_DutDtl: TDataSource
    DataSet = qry_tmp
    Left = 165
    Top = 10
  end
  object qry_TrtQry: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    Parameters = <>
    Left = 469
    Top = 10
  end
  object ds_TrtQry: TDataSource
    DataSet = qry_TrtQry
    Left = 501
    Top = 10
  end
  object qry_Del: TADOQuery
    Connection = DMHrdsys.conn
    Parameters = <>
    Left = 560
    Top = 8
  end
  object qry_tmp: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'select '
      'b.spc_id,'
      'a.emp_id as user_id,'
      'a.emp_chs as user_name,'
      'a.dept_code as user_dept,'
      'b.trt_date,'
      'b.trt_time,'
      'b.trt_station as trt_addr '
      'from hrd_emp a,hrd_dut_trt b '
      'where 1<0')
    Left = 624
    Top = 8
    object qry_tmpspc_id: TStringField
      FieldName = 'spc_id'
      Size = 10
    end
    object qry_tmpuser_id: TStringField
      FieldName = 'user_id'
      Size = 6
    end
    object qry_tmpuser_name: TWideStringField
      FieldName = 'user_name'
      Size = 10
    end
    object qry_tmpuser_dept: TStringField
      FieldName = 'user_dept'
      Size = 6
    end
    object qry_tmptrt_date: TDateTimeField
      FieldName = 'trt_date'
    end
    object qry_tmptrt_time: TStringField
      FieldName = 'trt_time'
      FixedChar = True
      Size = 8
    end
    object qry_tmptrt_addr: TStringField
      FieldName = 'trt_addr'
      Size = 1
    end
  end
end
