object FormDut20: TFormDut20
  Left = 2
  Top = 4
  Width = 798
  Height = 566
  Caption = 'FormDut20'
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
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 790
    Height = 532
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object PanelTitle: TTntPanel
      Left = 0
      Top = 0
      Width = 790
      Height = 49
      Align = alTop
      BevelOuter = bvNone
      Caption = 'dut20_titl'
      Color = clCream
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Palatino Linotype'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object PanelMain: TPanel
      Left = 0
      Top = 49
      Width = 790
      Height = 483
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object pc1: TTntPageControl
        Left = 0
        Top = 0
        Width = 790
        Height = 483
        ActivePage = TntTabSheet1
        Align = alClient
        TabOrder = 0
        OnChange = pc1Change
        object TntTabSheet1: TTntTabSheet
          Caption = 'query'
          object TntGroupBox1: TTntGroupBox
            Left = 0
            Top = 0
            Width = 782
            Height = 73
            Align = alTop
            Caption = 'search_condition'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Palatino Linotype'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object TntLabel2: TTntLabel
              Left = 8
              Top = 33
              Width = 68
              Height = 16
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'fld_year'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Palatino Linotype'
              Font.Style = []
              ParentFont = False
            end
            object CobDeptBegin: TTntComboBox
              Left = 248
              Top = 43
              Width = 181
              Height = 24
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Palatino Linotype'
              Font.Style = []
              ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
              ItemHeight = 16
              ParentFont = False
              TabOrder = 0
              OnChange = CobDeptBeginChange
            end
            object CobDeptEnd: TTntComboBox
              Left = 431
              Top = 43
              Width = 180
              Height = 24
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Palatino Linotype'
              Font.Style = []
              ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
              ItemHeight = 16
              ParentFont = False
              TabOrder = 1
              OnChange = CobDeptBeginChange
            end
            object bb_reset: TTntBitBtn
              Left = 691
              Top = 13
              Width = 77
              Height = 25
              BiDiMode = bdRightToLeftNoAlign
              Caption = 'reset'
              Default = True
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Palatino Linotype'
              Font.Style = []
              ModalResult = 4
              ParentBiDiMode = False
              ParentFont = False
              TabOrder = 2
              OnClick = bb_resetClick
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
            object bb_ok: TTntBitBtn
              Left = 612
              Top = 14
              Width = 77
              Height = 25
              Caption = 'ok'
              Default = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Palatino Linotype'
              Font.Style = []
              ModalResult = 1
              ParentFont = False
              TabOrder = 3
              OnClick = bb_okClick
              Glyph.Data = {
                DE010000424DDE01000000000000760000002800000024000000120000000100
                0400000000006801000000000000000000001000000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                3333333333333333333333330000333333333333333333333333F33333333333
                00003333344333333333333333388F3333333333000033334224333333333333
                338338F3333333330000333422224333333333333833338F3333333300003342
                222224333333333383333338F3333333000034222A22224333333338F338F333
                8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
                33333338F83338F338F33333000033A33333A222433333338333338F338F3333
                0000333333333A222433333333333338F338F33300003333333333A222433333
                333333338F338F33000033333333333A222433333333333338F338F300003333
                33333333A222433333333333338F338F00003333333333333A22433333333333
                3338F38F000033333333333333A223333333333333338F830000333333333333
                333A333333333333333338330000333333333333333333333333333333333333
                0000}
              NumGlyphs = 2
            end
            object Btn_Print: TTntBitBtn
              Left = 612
              Top = 42
              Width = 77
              Height = 25
              Caption = '(&p)rint'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Palatino Linotype'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
              OnClick = Btn_PrintClick
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
            object EditEmpBegin: TTntEdit
              Left = 248
              Top = 14
              Width = 51
              Height = 24
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Palatino Linotype'
              Font.Style = []
              ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
              MaxLength = 6
              ParentFont = False
              TabOrder = 5
              OnDblClick = EditEmpBeginDblClick
            end
            object EditEmpEnd: TTntEdit
              Left = 299
              Top = 14
              Width = 52
              Height = 24
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Palatino Linotype'
              Font.Style = []
              ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
              MaxLength = 6
              ParentFont = False
              TabOrder = 6
              OnDblClick = EditEmpBeginDblClick
            end
            object TntCheckBox1: TTntCheckBox
              Left = 150
              Top = 20
              Width = 97
              Height = 17
              Caption = 'fld_emp_id'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Palatino Linotype'
              Font.Style = []
              ParentFont = False
              TabOrder = 7
              OnClick = TntCheckBox1Click
            end
            object TntCheckBox2: TTntCheckBox
              Left = 150
              Top = 46
              Width = 97
              Height = 17
              Caption = 'dept_range'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Palatino Linotype'
              Font.Style = []
              ParentFont = False
              TabOrder = 8
              OnClick = TntCheckBox1Click
            end
            object me_year: TMaskEdit
              Left = 81
              Top = 31
              Width = 32
              Height = 24
              EditMask = '0000;1; '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Palatino Linotype'
              Font.Style = []
              ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
              MaxLength = 4
              ParentFont = False
              TabOrder = 9
              Text = '    '
              OnClick = me_yearClick
            end
            object RbInWork: TTntRadioButton
              Left = 448
              Top = 16
              Width = 75
              Height = 17
              Caption = 'in_work'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 10
            end
            object RbLeftWork: TTntRadioButton
              Left = 528
              Top = 16
              Width = 75
              Height = 17
              Caption = 'left_work'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 11
            end
            object Rball: TTntRadioButton
              Left = 360
              Top = 16
              Width = 75
              Height = 17
              Caption = 'all'
              Checked = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 12
              TabStop = True
            end
          end
          object TntDBGrid1: TTntDBGrid
            Left = 0
            Top = 73
            Width = 782
            Height = 382
            Align = alClient
            DataSource = DataSource1
            FixedColor = clSkyBlue
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Palatino Linotype'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnCellClick = TntDBGrid1CellClick
            OnTitleClick = TntDBGrid1TitleClick
            Columns = <
              item
                Expanded = False
                FieldName = 'emp_id'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'emp_chs'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'dept_code'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'year'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'january'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'february'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'march'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'april'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'may'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'june'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'july'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'august'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'september'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'october'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'november'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'december'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'tot_hour'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'remainhours'
                Visible = True
              end>
          end
          object PanelShow: TTntPanel
            Left = 224
            Top = 128
            Width = 257
            Height = 209
            Color = clWindow
            DragMode = dmAutomatic
            TabOrder = 2
            Visible = False
            object TntPanel2: TTntPanel
              Left = 1
              Top = 1
              Width = 255
              Height = 24
              Align = alTop
              Alignment = taLeftJustify
              BevelInner = bvLowered
              BevelOuter = bvNone
              Caption = 'edit_area'
              Color = clGradientActiveCaption
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindow
              Font.Height = -11
              Font.Name = 'Palatino Linotype'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              OnMouseDown = TntPanel2MouseDown
              object Image1: TImage
                Left = 233
                Top = 1
                Width = 21
                Height = 21
                Picture.Data = {
                  07544269746D61702E040000424D2E0400000000000036020000280000001500
                  0000150000000100080000000000F8010000C40E0000C40E0000800000008000
                  00005464E500FCC48E001943DA00CDD2F300FFFFF9003758DB00224CE6002E4B
                  BC00F9FFFF004764DC00475CE5001938B0001B53E5001547E900FFFAFF006983
                  E9001C38A800F8BB90000445DF007685F100758CEC00FCF6EC000237D9000A3D
                  E3003B61E400909BEE004B6AEC005B76EA000429AC00FAFEF500F7FDFE00FEFC
                  FF00617FE300384EE3004D6BE5000625B500586AEF002B45CF007B94E8005370
                  E100F2FEFF006979F300FFFEF6004D70E700FBFFFB005F7CE5003C5AE300103D
                  D500F1FAFF004165E7000C46E4005971E7003464E400556BDB00152DB2002450
                  DB002B53E5006A7BED00042AD700FFFDFF003455E1006474E2006174EC002E5C
                  DC00345CEC00F2FFFA001C49CF005374EA004363EC00ADB8F100234BD6002B52
                  DC005E82E600547BE1005C79E7003D69E2002646DC0096AAF2002B4BD6003B55
                  EB002D59E500F7FFFA001D4DDF00244FE3004866E6003762EB00FFFBFB008DA2
                  EE000531A5003659E400FFFFFC00FDFFFC001132A0003361DE007F97F10090AB
                  E300FFF8F0002859D9000C41CE00284EEB00F3F3FF002055ED003B5FE700235C
                  EE000B51DE003E5CDF003960F200E7DEFF00FCFFFF002A63E4001D4DF2009CB1
                  FF00456ADF00FBFBFB005C75F5004E62EB00456DEB002F4BCE00FFFCFC00F8FF
                  F700EAFFFF000526C900193AC6005075DE00294BDA002144D2006974ED00FFFF
                  FF007F013B1F04300E0E0E1F6C080E2C5108043B60017F000000010307585C10
                  5C5C0B3658363636231C231C10030100000015427A2F4225754C62427D7D4262
                  2F62163A79101D000000082F4C21213C052105383F630C0D321717163A1C2800
                  000077174638662E1840185D4067650C066E121216233B0000000E0247690945
                  784409550A6D50180E6F6817161C770000002C024F18006C2A281A54346A671E
                  04280D0D2F1C080000005A46665422247F0E1D314B34087F5A680C0D2F360400
                  00005A53313543272B7F0E0E343B3B6463650D0D0236040000005B3C541B7B2B
                  2727082A0E085138380D5352020B5A0000005B692433221B3300735A2A0E3F0C
                  52060653460B5A0000005A2E4A4A393D2B7B300E086C1F6352060637460B5A00
                  00005A4B297E492B241D0441591E2A3B37523747460B5A0000005B540F0F482D
                  3B08510A0A507F1D1E7C63474E0B5A0000002C350F143928560E5409550A611F
                  762C533C4E0B5B0000001E33135E0F03303D7373350A500930453F614E0B3B00
                  00000E4919572614132D20431A1A7409000A593C750B410000002A484D4D5726
                  131320200F203E4A1A2B736942360E0000003B14575F19140F290F203E1B727B
                  22706621420715000000116B134A1B1A7069094B2E663F3F4F3C374C07030100
                  00007F111508713B5A3B1F76045A5A3B560E1F1E04117F000000}
                OnClick = Image1Click
              end
            end
            object TntDBGrid2: TTntDBGrid
              Left = 1
              Top = 25
              Width = 255
              Height = 183
              Align = alClient
              DataSource = DataSource2
              FixedColor = clSkyBlue
              ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
              ReadOnly = True
              TabOrder = 1
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
                  FieldName = 'over_date'
                  Width = 57
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'clas_code'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'time_count'
                  Visible = True
                end>
            end
          end
        end
        object TntTabSheet2: TTntTabSheet
          Caption = 'transferfiles'
          object TntPanel3: TTntPanel
            Left = 0
            Top = 0
            Width = 782
            Height = 455
            Align = alClient
            BevelOuter = bvLowered
            Caption = 'TntPanel3'
            TabOrder = 0
            object TntPanel4: TTntPanel
              Left = 120
              Top = 24
              Width = 537
              Height = 337
              BevelOuter = bvLowered
              Caption = 'TntPanel4'
              Color = clSkyBlue
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              object TntGroupBox2: TTntGroupBox
                Left = 25
                Top = 72
                Width = 488
                Height = 201
                Caption = 'search_condition'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clRed
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                object TntLabel17: TTntLabel
                  Left = 196
                  Top = 113
                  Width = 36
                  Height = 13
                  Caption = '______'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowFrame
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object TntLabel18: TTntLabel
                  Left = 266
                  Top = 169
                  Width = 36
                  Height = 13
                  Caption = '______'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowFrame
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object sb_EmpBeg: TTntSpeedButton
                  Left = 172
                  Top = 113
                  Width = 23
                  Height = 22
                  Caption = '...'
                  Enabled = False
                  OnClick = EditEmpBeginDblClick
                end
                object sb_EmpEnd: TTntSpeedButton
                  Left = 292
                  Top = 113
                  Width = 23
                  Height = 22
                  Caption = '...'
                  Enabled = False
                  OnClick = EditEmpBeginDblClick
                end
                object TntLabel1: TTntLabel
                  Left = 53
                  Top = 43
                  Width = 67
                  Height = 16
                  Alignment = taRightJustify
                  AutoSize = False
                  Caption = 'fld_month'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlue
                  Font.Height = -11
                  Font.Name = 'Palatino Linotype'
                  Font.Style = []
                  ParentFont = False
                end
                object rb_ByEmp_T: TTntRadioButton
                  Left = 57
                  Top = 89
                  Width = 113
                  Height = 17
                  Caption = 'by_empid'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlue
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  OnClick = rb_ByEmp_TClick
                end
                object rb_ByDept_T: TTntRadioButton
                  Left = 57
                  Top = 145
                  Width = 113
                  Height = 17
                  Caption = 'by_deptcode'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlue
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 3
                  OnClick = rb_ByEmp_TClick
                end
                object cob_DeptBeg: TTntComboBox
                  Left = 113
                  Top = 169
                  Width = 153
                  Height = 21
                  Enabled = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
                  ItemHeight = 0
                  ParentFont = False
                  TabOrder = 4
                  OnChange = cob_DeptBegChange
                end
                object EditEmpBeg_T: TTntEdit
                  Left = 113
                  Top = 113
                  Width = 57
                  Height = 21
                  Enabled = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
                  MaxLength = 6
                  ParentFont = False
                  TabOrder = 1
                end
                object EditEmpEnd_T: TTntEdit
                  Left = 233
                  Top = 113
                  Width = 57
                  Height = 21
                  Enabled = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
                  MaxLength = 6
                  ParentFont = False
                  TabOrder = 2
                end
                object cob_DeptEnd: TTntComboBox
                  Left = 287
                  Top = 169
                  Width = 153
                  Height = 21
                  Enabled = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
                  ItemHeight = 0
                  ParentFont = False
                  TabOrder = 5
                  OnChange = cob_DeptBegChange
                end
                object me_month: TMaskEdit
                  Left = 134
                  Top = 35
                  Width = 46
                  Height = 24
                  EditMask = '0000/00;0;_'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Palatino Linotype'
                  Font.Style = []
                  ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
                  MaxLength = 7
                  ParentFont = False
                  TabOrder = 6
                  OnClick = me_monthClick
                end
              end
              object TntStaticText1: TTntStaticText
                Left = 88
                Top = 24
                Width = 361
                Height = 24
                Alignment = taCenter
                AutoSize = False
                BorderStyle = sbsSingle
                Caption = 'dut20_titl'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -16
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentColor = False
                ParentFont = False
                TabOrder = 2
              end
              object BBtn_Tran: TTntBitBtn
                Left = 208
                Top = 296
                Width = 81
                Height = 25
                Caption = 'transferfiles'
                TabOrder = 1
                OnClick = BBtn_TranClick
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  04000000000000010000120B0000120B00001000000000000000000000000000
                  800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FFFFFFFFFFF
                  FFFF33333333333FFFFF3FFFFFFFFF00000F333333333377777F33FFFFFFFF09
                  990F33333333337F337F333FFFFFFF09990F33333333337F337F3333FFFFFF09
                  990F33333333337FFF7F33333FFFFF00000F3333333333777773333333FFFFFF
                  FFFF3333333333333F333333333FFFFF0FFF3333333333337FF333333333FFF0
                  00FF33333333333777FF333333333F00000F33FFFFF33777777F300000333000
                  0000377777F33777777730EEE033333000FF37F337F3333777F330EEE0333330
                  00FF37F337F3333777F330EEE033333000FF37FFF7F333F77733300000333000
                  03FF3777773337777333333333333333333F3333333333333333}
                NumGlyphs = 2
              end
            end
          end
        end
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 120
    Top = 32
  end
  object ADOQuery1: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterScroll = ADOQuery1AfterScroll
    OnCalcFields = ADOQuery1CalcFields
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      'select a.*,b.emp_chs,b.dept_code+'#39' '#39'+c.abbr_titl as dept_code  '
      '     from hrd_dut_empovr a,hrd_emp b,hrd_dept c  '
      '     where a.emp_id=b.emp_id and b.dept_code=c.dept_code')
    Left = 120
    object ADOQuery1emp_id: TStringField
      FieldName = 'emp_id'
      Size = 6
    end
    object ADOQuery1emp_chs: TWideStringField
      FieldName = 'emp_chs'
      OnGetText = ADOQuery1emp_chsGetText
      Size = 10
    end
    object ADOQuery1dept_code: TWideStringField
      FieldName = 'dept_code'
      ReadOnly = True
      Size = 21
    end
    object ADOQuery1year: TStringField
      FieldName = 'year'
      FixedChar = True
      Size = 4
    end
    object ADOQuery1january: TFloatField
      FieldName = 'january'
    end
    object ADOQuery1february: TFloatField
      FieldName = 'february'
    end
    object ADOQuery1march: TFloatField
      FieldName = 'march'
    end
    object ADOQuery1april: TFloatField
      FieldName = 'april'
    end
    object ADOQuery1may: TFloatField
      FieldName = 'may'
    end
    object ADOQuery1june: TFloatField
      FieldName = 'june'
    end
    object ADOQuery1july: TFloatField
      FieldName = 'july'
    end
    object ADOQuery1august: TFloatField
      FieldName = 'august'
    end
    object ADOQuery1september: TFloatField
      FieldName = 'september'
    end
    object ADOQuery1october: TFloatField
      FieldName = 'october'
    end
    object ADOQuery1november: TFloatField
      FieldName = 'november'
    end
    object ADOQuery1december: TFloatField
      FieldName = 'december'
    end
    object ADOQuery1tot_hour: TFloatField
      FieldName = 'tot_hour'
    end
    object ADOQuery1remaindays: TFloatField
      FieldKind = fkCalculated
      FieldName = 'remainhours'
      Calculated = True
    end
  end
  object qry_pub: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    Prepared = True
    Left = 304
  end
  object ADOQuery2: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    OnCalcFields = ADOQuery1CalcFields
    Parameters = <>
    Prepared = True
    Left = 232
  end
  object ADOCommand1: TADOCommand
    Connection = DMHrdsys.conn
    Parameters = <>
    Left = 360
  end
  object qry_detail: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select *       from hrd_dut_mon')
    Left = 440
    object qry_detailemp_id: TStringField
      FieldName = 'emp_id'
      Size = 6
    end
    object qry_detaildut_mon: TStringField
      FieldName = 'dut_mon'
      Size = 6
    end
    object qry_detailclas_code: TStringField
      FieldName = 'clas_code'
      FixedChar = True
      Size = 2
    end
    object qry_detailday01: TStringField
      FieldName = 'day01'
      Size = 4
    end
    object qry_detailday02: TStringField
      FieldName = 'day02'
      Size = 4
    end
    object qry_detailday03: TStringField
      FieldName = 'day03'
      Size = 4
    end
    object qry_detailday04: TStringField
      FieldName = 'day04'
      Size = 4
    end
    object qry_detailday05: TStringField
      FieldName = 'day05'
      Size = 4
    end
    object qry_detailday06: TStringField
      FieldName = 'day06'
      Size = 4
    end
    object qry_detailday07: TStringField
      FieldName = 'day07'
      Size = 4
    end
    object qry_detailday08: TStringField
      FieldName = 'day08'
      Size = 4
    end
    object qry_detailday09: TStringField
      FieldName = 'day09'
      Size = 4
    end
    object qry_detailday10: TStringField
      FieldName = 'day10'
      Size = 4
    end
    object qry_detailday11: TStringField
      FieldName = 'day11'
      Size = 4
    end
    object qry_detailday12: TStringField
      FieldName = 'day12'
      Size = 4
    end
    object qry_detailday13: TStringField
      FieldName = 'day13'
      Size = 4
    end
    object qry_detailday14: TStringField
      FieldName = 'day14'
      Size = 4
    end
    object qry_detailday15: TStringField
      FieldName = 'day15'
      Size = 4
    end
    object qry_detailday16: TStringField
      FieldName = 'day16'
      Size = 4
    end
    object qry_detailday17: TStringField
      FieldName = 'day17'
      Size = 4
    end
    object qry_detailday18: TStringField
      FieldName = 'day18'
      Size = 4
    end
    object qry_detailday19: TStringField
      FieldName = 'day19'
      Size = 4
    end
    object qry_detailday20: TStringField
      FieldName = 'day20'
      Size = 4
    end
    object qry_detailday21: TStringField
      FieldName = 'day21'
      Size = 4
    end
    object qry_detailday22: TStringField
      FieldName = 'day22'
      Size = 4
    end
    object qry_detailday23: TStringField
      FieldName = 'day23'
      Size = 4
    end
    object qry_detailday24: TStringField
      FieldName = 'day24'
      Size = 4
    end
    object qry_detailday25: TStringField
      FieldName = 'day25'
      Size = 4
    end
    object qry_detailday26: TStringField
      FieldName = 'day26'
      Size = 4
    end
    object qry_detailday27: TStringField
      FieldName = 'day27'
      Size = 4
    end
    object qry_detailday28: TStringField
      FieldName = 'day28'
      Size = 4
    end
    object qry_detailday29: TStringField
      FieldName = 'day29'
      Size = 4
    end
    object qry_detailday30: TStringField
      FieldName = 'day30'
      Size = 4
    end
    object qry_detailday31: TStringField
      FieldName = 'day31'
      Size = 4
    end
  end
  object DataSource2: TDataSource
    DataSet = ClientDataSet1
    Left = 568
    Top = 32
  end
  object ADOQuery3: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select a.emp_id,a.epledt as over_date,c.clas_code,c.day01 as tim' +
        'e_count'
      'from hrd_emp a,hrd_dut_mon c where 1<0')
    Left = 512
    object ADOQuery3emp_id: TStringField
      FieldName = 'emp_id'
      Size = 6
    end
    object ADOQuery3over_date: TDateTimeField
      FieldName = 'over_date'
    end
    object ADOQuery3clas_code: TStringField
      FieldName = 'clas_code'
      FixedChar = True
      Size = 2
    end
    object ADOQuery3time_count: TStringField
      FieldName = 'time_count'
      Size = 4
    end
  end
  object ClientDataSet1: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 568
    Data = {
      840000009619E0BD010000001800000004000000000003000000840006656D70
      5F69640100490000000100055749445448020002000600096F7665725F646174
      65080008000000000009636C61735F636F646501004900200001000557494454
      480200020002000A74696D655F636F756E740100490000000100055749445448
      0200020004000000}
  end
end
