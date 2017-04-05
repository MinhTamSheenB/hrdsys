object FormFhrd404: TFormFhrd404
  Left = 169
  Top = 159
  Width = 800
  Height = 500
  Caption = 'FormFhrd404'
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
      Caption = 'Fhrd404_titl'
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
        Height = 48
        Align = alTop
        TabOrder = 0
        object TntGroupBox1: TTntGroupBox
          Left = 1
          Top = 1
          Width = 790
          Height = 46
          Align = alClient
          Caption = 'query_condition'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object TntLabel2: TTntLabel
            Left = 2
            Top = 18
            Width = 55
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'date'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Palatino Linotype'
            Font.Style = []
            ParentFont = False
          end
          object TntLabel10: TTntLabel
            Left = 302
            Top = 16
            Width = 75
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
          object TntLabel6: TTntLabel
            Left = 142
            Top = 18
            Width = 55
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
          object DTPick1: TTntDateTimePicker
            Left = 57
            Top = 15
            Width = 85
            Height = 21
            Date = 38571.000000000000000000
            Time = 38571.000000000000000000
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            TabOrder = 0
          end
          object CobDeptBegin: TTntComboBox
            Left = 380
            Top = 14
            Width = 120
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            ItemHeight = 13
            ParentFont = False
            TabOrder = 1
            OnChange = CobDeptBeginChange
          end
          object CobDeptEnd: TTntComboBox
            Left = 500
            Top = 14
            Width = 120
            Height = 21
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
          object Btn_Search: TTntBitBtn
            Left = 622
            Top = 12
            Width = 81
            Height = 25
            Caption = '(&q)uery'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
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
            Left = 705
            Top = 12
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
            TabOrder = 4
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
          object edit_begin: TTntEdit
            Left = 198
            Top = 14
            Width = 50
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 6
            ParentFont = False
            TabOrder = 5
          end
          object edit_end: TTntEdit
            Left = 250
            Top = 14
            Width = 50
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 6
            ParentFont = False
            TabOrder = 6
          end
        end
      end
      object PanelGrid: TPanel
        Left = 0
        Top = 48
        Width = 792
        Height = 382
        Align = alClient
        TabOrder = 1
        object DBGrid1: TTntDBGrid
          Left = 1
          Top = 1
          Width = 790
          Height = 380
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
          ReadOnly = True
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
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'emp_id'
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'emp_name'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'emp_etdt'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'date_41'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'date_37'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'date_33'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'date_28'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'date_22'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'date_19'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'date_18'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'date_14'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'date_12'
              Width = 65
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
      
        'SELECT         A.dept_code,A.emp_id,A.emp_name,A.pst_code,A.emp_' +
        'etdt,'
      
        '(select min(valid_date) from fhrd_tranhist where emp_id=A.emp_id' +
        ' and pst_code in('#39'41'#39','#39'42'#39' )) as date_41,'
      
        '(select min(valid_date) from fhrd_tranhist where emp_id=A.emp_id' +
        ' and pst_code in('#39'37'#39','#39'38'#39' )) as date_37,'
      
        '(select min(valid_date) from fhrd_tranhist where emp_id=A.emp_id' +
        ' and pst_code in('#39'33'#39','#39'34'#39' )) as date_33,'
      
        '(select min(valid_date) from fhrd_tranhist where emp_id=A.emp_id' +
        ' and pst_code in('#39'28'#39','#39'29'#39' )) as date_28,'
      
        '(select min(valid_date) from fhrd_tranhist where emp_id=A.emp_id' +
        ' and pst_code in('#39'22'#39','#39'23'#39' )) as date_22,'
      
        '(select min(valid_date) from fhrd_tranhist where emp_id=A.emp_id' +
        ' and pst_code='#39'19'#39') as date_19,'
      
        '(select min(valid_date) from fhrd_tranhist where emp_id=A.emp_id' +
        ' and pst_code='#39'18'#39') as date_18'
      'FROM             fhrd_emp A'
      
        'WHERE         (A.emp_ledt is null or A.emp_ledt>getdate()) and A' +
        '.emp_etdt<getdate()')
    Left = 200
    Top = 2
    object ADOQuery1dept_code: TStringField
      FieldName = 'dept_code'
      Size = 6
    end
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
    object ADOQuery1date_41: TDateTimeField
      FieldName = 'date_41'
      ReadOnly = True
    end
    object ADOQuery1date_37: TDateTimeField
      FieldName = 'date_37'
      ReadOnly = True
    end
    object ADOQuery1date_33: TDateTimeField
      FieldName = 'date_33'
      ReadOnly = True
    end
    object ADOQuery1date_28: TDateTimeField
      FieldName = 'date_28'
      ReadOnly = True
    end
    object ADOQuery1date_22: TDateTimeField
      FieldName = 'date_22'
      ReadOnly = True
    end
    object ADOQuery1date_19: TDateTimeField
      FieldName = 'date_19'
      ReadOnly = True
    end
    object ADOQuery1date_18: TDateTimeField
      FieldName = 'date_18'
      ReadOnly = True
    end
    object ADOQuery1date_14: TDateField
      FieldName = 'date_14'
    end
    object ADOQuery1date_12: TDateField
      FieldName = 'date_12'
    end
  end
end
