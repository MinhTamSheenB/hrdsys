object FormSal26: TFormSal26
  Left = 123
  Top = 157
  Width = 793
  Height = 490
  Caption = 'FormSal26'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 785
    Height = 456
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object PanelTitle: TTntPanel
      Left = 0
      Top = 0
      Width = 785
      Height = 36
      Align = alTop
      BevelOuter = bvNone
      Caption = #21729#24037#22522#26412#34218#36039#35519#25972#26126#32048
      Color = clCream
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object num: TTntLabel
        Left = 536
        Top = 16
        Width = 4
        Height = 20
        Visible = False
      end
    end
    object PanelMain: TPanel
      Left = 0
      Top = 36
      Width = 785
      Height = 420
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object PanelQuery: TPanel
        Left = 0
        Top = 0
        Width = 785
        Height = 97
        Align = alTop
        TabOrder = 0
        object TntGroupBox1: TTntGroupBox
          Left = -7
          Top = 1
          Width = 920
          Height = 96
          Align = alCustom
          Caption = 'query_condition'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object TntLabel1: TTntLabel
            Left = 10
            Top = 65
            Width = 39
            Height = 13
            Caption = #26376#20221#65306' '
          end
          object TntLabel2: TTntLabel
            Left = 110
            Top = 66
            Width = 39
            Height = 13
            Caption = #37096#38272#65306' '
          end
          object TntLabel3: TTntLabel
            Left = 487
            Top = 67
            Width = 36
            Height = 13
            Caption = #24037#34399#65306
          end
          object Btn_Search: TTntBitBtn
            Left = 655
            Top = 61
            Width = 63
            Height = 25
            Caption = '(&q)uery'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
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
          object BtnPrint: TTntBitBtn
            Left = 719
            Top = 61
            Width = 68
            Height = 25
            Caption = #36681'EXCEL'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Palatino Linotype'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
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
            Left = 51
            Top = 63
            Width = 55
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = '????EXE???'
            MaxLength = 6
            ParentFont = False
            TabOrder = 2
          end
          object dept: TTntComboBox
            Left = 313
            Top = 64
            Width = 166
            Height = 21
            ImeName = '????EXE???'
            ItemHeight = 13
            TabOrder = 3
          end
          object cond: TTntComboBox
            Left = 151
            Top = 64
            Width = 161
            Height = 21
            ImeName = '????EXE???'
            ItemHeight = 13
            TabOrder = 4
          end
          object TntEdit1: TTntEdit
            Left = 524
            Top = 63
            Width = 65
            Height = 21
            ImeName = '????EXE???'
            TabOrder = 5
            Text = '0'
            OnChange = TntEdit1Change
          end
          object TntEdit2: TTntEdit
            Left = 590
            Top = 63
            Width = 62
            Height = 21
            ImeName = '????EXE???'
            TabOrder = 6
            Text = '999999'
          end
          object TntRadioGroup2: TTntRadioGroup
            Left = 8
            Top = 16
            Width = 481
            Height = 40
            Caption = #26597#35426#39006#22411
            Columns = 5
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemIndex = 4
            Items.Strings = (
              #20840#37096
              #26032#36914#21729#24037
              #28415#35430#29992#26399
              #30070#26376#35519#21319
              #30070#26376'+45000')
            ParentFont = False
            TabOrder = 7
          end
          object TntRadioGroup3: TTntRadioGroup
            Left = 489
            Top = 15
            Width = 160
            Height = 41
            Align = alCustom
            Caption = #26597#35426#26781#20214
            Columns = 2
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemIndex = 0
            Items.Strings = (
              'D - '#25353#37096#38272
              'E - '#25353#24037#34399' ')
            ParentFont = False
            TabOrder = 8
            OnClick = TntRadioGroup3Click
          end
          object btnSave: TTntButton
            Left = 655
            Top = 24
            Width = 62
            Height = 25
            Caption = '??'
            TabOrder = 9
            OnClick = btnSaveClick
          end
          object btn_show_hand: TTntButton
            Left = 720
            Top = 24
            Width = 65
            Height = 25
            Caption = #21482#39023#25163#25913
            TabOrder = 10
            OnClick = Btn_SearchClick
          end
        end
      end
      object PanelGrid: TPanel
        Left = 0
        Top = 97
        Width = 785
        Height = 323
        Align = alClient
        TabOrder = 1
        object TntStatusBar1: TTntStatusBar
          Left = 1
          Top = 291
          Width = 783
          Height = 31
          Panels = <>
        end
        object TntDBGrid1: TTntDBGrid
          Left = 1
          Top = 1
          Width = 783
          Height = 290
          Align = alClient
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ImeName = '????EXE???'
          ParentFont = False
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = TntDBGrid1DblClick
          OnTitleClick = TntDBGrid1TitleClick
          Columns = <
            item
              Expanded = False
              FieldName = 'dept_code'
              Title.Alignment = taCenter
              Title.Caption = #37096#38272#20195#34399
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'abbr_titl'
              Title.Alignment = taCenter
              Title.Caption = #37096#38272#21517#31281
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'emp_id'
              Title.Alignment = taCenter
              Title.Caption = #24037#34399
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'emp_chs'
              Title.Alignment = taCenter
              Title.Caption = #22995#21517
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'epindt'
              Title.Alignment = taCenter
              Title.Caption = #36914#24288#26085#26399
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'pst_code'
              Title.Alignment = taCenter
              Title.Caption = #32887#31281
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'pst_old'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clTeal
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Title.Caption = #33290#32887#31281
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clTeal
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'sal_base'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = #24213#34218
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlue
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 50
              Visible = True
            end
            item
              Color = clHighlightText
              Expanded = False
              FieldName = 'sal_5s'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = '+ 5%'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clRed
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'base_pay'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = #32317#35336
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clMaroon
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'valid_date'
              Title.Alignment = taCenter
              Title.Caption = #29983#25928#26085#26399
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'name_vim'
              Title.Caption = #36234#25991#22995#21517
              Visible = True
            end>
        end
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 160
    Top = 208
  end
  object ADOQuery1: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select a.emp_id , a.emp_chs, a.dept_code, a.pst_code, a.edu_code' +
        ', a.epindt , b.abbr_titl  from hrd_emp as a, hrd_dept as b  wher' +
        'e a.dept_code=b.dept_code')
    Left = 128
    Top = 202
    object ADOQuery1dept_code: TTntStringField
      FieldName = 'dept_code'
      Size = 6
    end
    object ADOQuery1abbr_titl: TTntWideStringField
      FieldName = 'abbr_titl'
    end
    object ADOQuery1emp_id: TTntStringField
      FieldName = 'emp_id'
      Size = 6
    end
    object ADOQuery1emp_chs: TTntWideStringField
      FieldName = 'emp_chs'
    end
    object ADOQuery1pst_code: TTntStringField
      FieldName = 'pst_code'
      Size = 10
    end
    object ADOQuery1pst_old: TTntStringField
      FieldName = 'pst_old'
      Size = 2
    end
    object ADOQuery1epindt: TDateTimeField
      FieldName = 'epindt'
    end
    object ADOQuery1sal_base: TFloatField
      FieldName = 'sal_base'
    end
    object ADOQuery1sal_45s: TFloatField
      FieldName = 'sal_5s'
    end
    object ADOQuery1base_pay: TFloatField
      FieldName = 'base_pay'
    end
    object ADOQuery1valid_date: TDateTimeField
      FieldName = 'valid_date'
    end
    object ADOQuery1name_vim: TWideStringField
      FieldName = 'name_vim'
      Size = 100
    end
  end
  object ADOQuery2: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select a.emp_id , b.emp_chs, b.dept_code,  c.abbr_titl, a.pst_co' +
        'de, b.epindt , a.base_pay, a.valid_date, b.edu_code  from hrd_sa' +
        'l_base as a, hrd_emp as b, hrd_dept as c  where a.emp_id=b.emp_i' +
        'd and b.dept_code=c.dept_code')
    Left = 208
    Top = 208
  end
  object TntSaveDialog1: TTntSaveDialog
    Left = 496
    Top = 24
  end
  object ADOQuery3: TADOQuery
    Connection = DMHrdsys.conn
    Parameters = <>
    SQL.Strings = (
      'select emp_chs, dept_code from hrd_emp')
    Left = 248
    Top = 205
  end
  object ADOQuery4: TADOQuery
    Connection = DMHrdsys.conn
    Parameters = <>
    Left = 304
    Top = 205
  end
  object ADOQuery5: TADOQuery
    Connection = DMHrdsys.conn
    Parameters = <>
    SQL.Strings = (
      
        'select  distinct emp_id, pst_old  from hrd_emp_upd order by vali' +
        'd_date')
    Left = 400
    Top = 213
  end
end
