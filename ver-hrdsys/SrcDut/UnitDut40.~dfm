object FormDut40: TFormDut40
  Left = 381
  Top = 180
  Width = 800
  Height = 513
  Caption = 'FormDut40'
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
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 479
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
      Caption = #21608#24037#26178#22577#34920
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
      Height = 443
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 792
        Height = 52
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object TntGroupBox1: TTntGroupBox
          Left = 0
          Top = 0
          Width = 792
          Height = 52
          Align = alClient
          Caption = 'query_condition'
          TabOrder = 0
          object Label_month: TTntLabel
            Left = 10
            Top = 21
            Width = 100
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
          object TntLabel2: TTntLabel
            Left = 260
            Top = 21
            Width = 9
            Height = 13
            Caption = '->'
          end
          object DTPickDate_Begin: TTntDateTimePicker
            Left = 110
            Top = 17
            Width = 150
            Height = 21
            Date = 38565.000000000000000000
            Time = 38565.000000000000000000
            ImeName = '1'
            TabOrder = 0
            OnChange = DTPickDate_BeginChange
          end
          object DTPickDate_End: TTntDateTimePicker
            Left = 270
            Top = 17
            Width = 150
            Height = 21
            Date = 41530.445943807870000000
            Time = 41530.445943807870000000
            TabOrder = 1
          end
          object BtnQuery: TTntButton
            Left = 490
            Top = 15
            Width = 75
            Height = 25
            Caption = 'query'
            Default = True
            TabOrder = 2
            OnClick = BtnQueryClick
          end
          object TntButton1: TTntButton
            Left = 573
            Top = 15
            Width = 75
            Height = 25
            Caption = 'print'
            TabOrder = 3
            OnClick = TntButton1Click
          end
        end
      end
      object PanelGrid: TPanel
        Left = 0
        Top = 52
        Width = 792
        Height = 391
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object DBGridWeek: TTntDBGrid
          Left = 0
          Top = 0
          Width = 792
          Height = 161
          Align = alTop
          DataSource = dsWeek
          FixedColor = clSkyBlue
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Palatino Linotype'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Palatino Linotype'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'HOURS_CLASS'
              Width = 135
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COUNT_N'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COUNT_W'
              Visible = True
            end>
        end
        object DBGridDay: TTntDBGrid
          Left = 0
          Top = 161
          Width = 792
          Height = 230
          Align = alClient
          DataSource = dsDay
          FixedColor = clSkyBlue
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Palatino Linotype'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Palatino Linotype'
          TitleFont.Style = []
        end
      end
    end
  end
  object dsWeek: TDataSource
    DataSet = cdsWeek
    Left = 385
    Top = 192
  end
  object ADOQuery1: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterScroll = ADOQuery1AfterScroll
    Parameters = <>
    SQL.Strings = (
      
        'select top 1 C.dept_code+'#39'---'#39'+C.abbr_titl as department,* from ' +
        'hrd_dut_day as A,hrd_emp as B,hrd_dept as C '
      ' where A.emp_id=B.emp_id and B.dept_code=C.dept_code')
    Left = 168
  end
  object cdsWeek: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'HOURS_CLASS'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'COUNT_N'
        DataType = ftInteger
      end
      item
        Name = 'COUNT_W'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterScroll = cdsWeekAfterScroll
    Left = 352
    Top = 194
    object cdsWeekHOURS_CLASS: TStringField
      DisplayLabel = #24037#26178#25976
      FieldName = 'HOURS_CLASS'
      OnGetText = cdsWeekHOURS_CLASSGetText
      Size = 50
    end
    object cdsWeekCOUNT_N: TIntegerField
      DisplayLabel = #24288#21209
      FieldName = 'COUNT_N'
    end
    object cdsWeekCOUNT_W: TIntegerField
      DisplayLabel = #32218#22806
      FieldName = 'COUNT_W'
    end
  end
  object cdsDay: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 248
    Top = 384
  end
  object dsDay: TDataSource
    DataSet = cdsDay
    Left = 280
    Top = 384
  end
end
