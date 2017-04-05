object FormFhrd215: TFormFhrd215
  Left = 204
  Top = 181
  Width = 796
  Height = 510
  Caption = 'FormFhrd215'
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
    Width = 788
    Height = 476
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object PanelTitle: TTntPanel
      Left = 0
      Top = 0
      Width = 788
      Height = 36
      Align = alTop
      BevelOuter = bvNone
      Caption = 'dut22_titl'
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
      Width = 788
      Height = 440
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 788
        Height = 70
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object TntGroupBox1: TTntGroupBox
          Left = 0
          Top = 0
          Width = 788
          Height = 70
          Align = alClient
          Caption = 'query_condition'
          TabOrder = 0
          object Label_month: TTntLabel
            Left = 2
            Top = 17
            Width = 78
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'date'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'MS PGothic'
            Font.Style = []
            ParentFont = False
          end
          object TntLabel1: TTntLabel
            Left = 2
            Top = 44
            Width = 78
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'department'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'MS PGothic'
            Font.Style = []
            ParentFont = False
          end
          object TntLabel2: TTntLabel
            Left = 267
            Top = 18
            Width = 78
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
          object TntLabel3: TTntLabel
            Left = 496
            Top = 8
            Width = 257
            Height = 13
            AutoSize = False
            Caption = ' **'#35498#26126#65306#20381#29031#35201#27714#21729#24037#21152#29677#21295#32317#21517#21934#20013
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object TntLabel4: TTntLabel
            Left = 554
            Top = 22
            Width = 199
            Height = 13
            AutoSize = False
            Caption = #40643#33394#20195#34920#21152#29677#32317#26178#25976#36229#36942'150'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clYellow
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object TntLabel5: TTntLabel
            Left = 555
            Top = 52
            Width = 206
            Height = 13
            AutoSize = False
            Caption = #32005#33394#20195#34920#21152#29677#32317#26178#25976#36229#36942'250'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object TntLabel6: TTntLabel
            Left = 554
            Top = 37
            Width = 215
            Height = 13
            AutoSize = False
            Caption = #26691#32005#33394#20195#34920#21152#29677#32317#26178#25976#36229#36942'200 '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clFuchsia
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object CobDeptBegin: TTntComboBox
            Left = 83
            Top = 39
            Width = 150
            Height = 21
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
            ItemHeight = 13
            ParentFont = False
            TabOrder = 0
            OnChange = CobDeptBeginChange
          end
          object CobDeptEnd: TTntComboBox
            Left = 235
            Top = 39
            Width = 134
            Height = 21
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
            ItemHeight = 13
            ParentFont = False
            TabOrder = 1
          end
          object Panel2: TPanel
            Left = 368
            Top = 35
            Width = 129
            Height = 30
            BevelOuter = bvNone
            TabOrder = 2
            object BtnQuery: TTntButton
              Left = 5
              Top = 3
              Width = 60
              Height = 25
              Caption = 'query'
              Default = True
              TabOrder = 0
              OnClick = BtnQueryClick
            end
            object BtnPrint: TTntBitBtn
              Left = 66
              Top = 3
              Width = 57
              Height = 25
              Caption = 'print'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnClick = BtnPrintClick
            end
          end
          object DTBegin: TTntDateTimePicker
            Left = 83
            Top = 14
            Width = 90
            Height = 21
            Date = 38565.000000000000000000
            Time = 38565.000000000000000000
            ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
            TabOrder = 3
          end
          object DTEnd: TTntDateTimePicker
            Left = 179
            Top = 14
            Width = 90
            Height = 21
            Date = 38565.000000000000000000
            Time = 38565.000000000000000000
            ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
            TabOrder = 4
          end
          object EditEmpBegin: TTntEdit
            Left = 350
            Top = 13
            Width = 60
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
            MaxLength = 6
            ParentFont = False
            TabOrder = 5
          end
          object EditEmpEnd: TTntEdit
            Left = 422
            Top = 13
            Width = 60
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
            MaxLength = 6
            ParentFont = False
            TabOrder = 6
          end
          object TntBitBtn1: TTntBitBtn
            Left = 493
            Top = 37
            Width = 65
            Height = 25
            Caption = 'Excel '
            TabOrder = 7
            OnClick = TntBitBtn1Click
          end
        end
      end
      object PanelGrid: TPanel
        Left = 0
        Top = 70
        Width = 788
        Height = 370
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object PageControl1: TPageControl
          Left = 0
          Top = 0
          Width = 788
          Height = 370
          ActivePage = TabSheet3
          Align = alClient
          TabOrder = 0
          object TabSheet1: TTabSheet
            Caption = #21729#24037#26085#21152#29677#26126#32048
            object TntDBGrid1: TTntDBGrid
              Left = 0
              Top = 0
              Width = 780
              Height = 342
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
              OnTitleClick = TntDBGrid1TitleClick
              Columns = <
                item
                  Expanded = False
                  FieldName = 'over_date'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'dept_code'
                  Width = 80
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'abbr_titl'
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
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ot_hour'
                  Title.Caption = 'fld_over_time'
                  Visible = True
                end>
            end
          end
          object TabSheet2: TTabSheet
            Caption = #37096#38272#26085#21152#29677#21295#32317
            ImageIndex = 1
            object TntDBGrid2: TTntDBGrid
              Left = 0
              Top = 0
              Width = 780
              Height = 342
              Align = alClient
              DataSource = DataSource2
              FixedColor = clSkyBlue
              ImeName = #19975#33021#20116#31558'EXE'#22806#25346#29256
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnTitleClick = TntDBGrid1TitleClick
              Columns = <
                item
                  Expanded = False
                  FieldName = 'over_date'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'dept_code'
                  Width = 80
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'abbr_titl'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'sum'
                  Title.Caption = 'peopleovr'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ot_hour'
                  Title.Caption = 'fld_over_time'
                  Visible = True
                end>
            end
          end
          object TabSheet3: TTabSheet
            Caption = #21729#24037#21152#29677#21295#32317
            ImageIndex = 2
            object DBGrid1: TDBGrid
              Left = 0
              Top = 0
              Width = 780
              Height = 342
              Align = alClient
              DataSource = DataSource3
              FixedColor = clSkyBlue
              ImeName = #20013#25991' (?'#20307') - '#35895#27468#25340#38899'?'#20837#27861
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnDrawColumnCell = DBGrid1DrawColumnCell
              OnTitleClick = TntDBGrid1TitleClick
              Columns = <
                item
                  Expanded = False
                  FieldName = 'dept_code'
                  Width = 80
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'abbr_titl'
                  Width = 124
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
                  Width = 80
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ot_hour'
                  Visible = True
                end>
            end
          end
          object TabSheet4: TTabSheet
            Caption = #37096#38272#21152#29677#21295#32317
            ImageIndex = 3
            object TntDBGrid4: TTntDBGrid
              Left = 0
              Top = 0
              Width = 780
              Height = 342
              Align = alClient
              DataSource = DataSource4
              FixedColor = clSkyBlue
              ImeName = #20013#25991' (?'#20307') - '#35895#27468#25340#38899'?'#20837#27861
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnTitleClick = TntDBGrid1TitleClick
              Columns = <
                item
                  Expanded = False
                  FieldName = 'dept_code'
                  Width = 80
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'abbr_titl'
                  Width = 124
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'mans'
                  Title.Caption = 'fld_people_num'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ot_hour'
                  Title.Caption = 'fld_over_time'
                  Visible = True
                end>
            end
          end
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
    Parameters = <>
    SQL.Strings = (
      
        'select top 1 * from hrd_dut_day A,hrd_emp B where A.emp_id=B.emp' +
        '_id')
    Left = 168
    object ADOQuery1wrk_date: TDateTimeField
      FieldName = 'over_date'
    end
    object ADOQuery1dept_code: TStringField
      FieldName = 'dept_code'
      Size = 6
    end
    object ADOQuery1department: TWideStringField
      FieldName = 'abbr_titl'
    end
    object ADOQuery1emp_id: TStringField
      FieldName = 'emp_id'
      FixedChar = True
      Size = 6
    end
    object ADOQuery1emp_chs: TWideStringField
      FieldName = 'emp_chs'
      Size = 10
    end
    object ADOQuery1ot_hour: TFloatField
      FieldName = 'ot_hour'
    end
  end
  object PrintDialog1: TPrintDialog
    Left = 664
    Top = 180
  end
  object ADOQuery2: TADOQuery
    Connection = DMHrdsys.conn
    Parameters = <>
    SQL.Strings = (
      'select top 1 * from hrd_emp')
    Left = 240
    object ADOQuery2over_date: TDateTimeField
      FieldName = 'over_date'
    end
    object ADOQuery2dept_code: TStringField
      FieldName = 'dept_code'
      Size = 6
    end
    object ADOQuery2department: TWideStringField
      FieldName = 'abbr_titl'
    end
    object ADOQuery2sum: TIntegerField
      FieldName = 'sum'
    end
    object ADOQuery2ot_hour: TFloatField
      FieldName = 'ot_hour'
    end
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery2
    Left = 280
    Top = 8
  end
  object ADOQuery3: TADOQuery
    Connection = DMHrdsys.conn
    Parameters = <>
    Left = 616
    Top = 4
  end
  object ADOQuery4: TADOQuery
    Connection = DMHrdsys.conn
    Parameters = <>
    Left = 623
    Top = 103
  end
  object DataSource3: TDataSource
    Left = 664
    Top = 12
  end
  object DataSource4: TDataSource
    Left = 648
    Top = 106
  end
end
