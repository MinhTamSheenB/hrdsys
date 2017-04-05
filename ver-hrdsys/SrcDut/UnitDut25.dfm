object FormDut25: TFormDut25
  Left = 85
  Top = 164
  Width = 794
  Height = 504
  Caption = 'FormDut25'
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
    Width = 786
    Height = 470
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object PanelTitle: TTntPanel
      Left = 0
      Top = 0
      Width = 786
      Height = 36
      Align = alTop
      BevelOuter = bvNone
      Caption = 'dut25_titl'
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
      Width = 786
      Height = 434
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 786
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object TntGroupBox1: TTntGroupBox
          Left = 0
          Top = 0
          Width = 786
          Height = 41
          Align = alClient
          Caption = 'query_condition'
          TabOrder = 0
          object TntLabel2: TTntLabel
            Left = 115
            Top = 18
            Width = 78
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'seg_code'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'MS PGothic'
            Font.Style = []
            ParentFont = False
          end
          object Panel2: TPanel
            Left = 344
            Top = 11
            Width = 433
            Height = 30
            BevelOuter = bvNone
            TabOrder = 0
            object BtnQuery: TTntButton
              Left = 13
              Top = 3
              Width = 75
              Height = 25
              Caption = 'query'
              Default = True
              TabOrder = 0
              OnClick = BtnQueryClick
            end
            object BtnPrint: TTntBitBtn
              Left = 352
              Top = 3
              Width = 75
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
            object btnEdit: TTntButton
              Left = 94
              Top = 3
              Width = 75
              Height = 25
              Caption = '(&m)odify'
              Enabled = False
              TabOrder = 2
              OnClick = btnEditClick
            end
            object BtnSave: TTntButton
              Left = 270
              Top = 3
              Width = 75
              Height = 25
              Caption = '(&s)ave'
              Enabled = False
              TabOrder = 3
              OnClick = BtnSaveClick
            end
            object btndel: TTntButton
              Left = 176
              Top = 3
              Width = 75
              Height = 25
              Caption = '(&d)elete'
              Enabled = False
              TabOrder = 4
              OnClick = btndelClick
            end
          end
          object EditBegin: TTntEdit
            Left = 198
            Top = 13
            Width = 60
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 6
            ParentFont = False
            TabOrder = 1
          end
          object EditEnd: TTntEdit
            Left = 262
            Top = 13
            Width = 60
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 6
            ParentFont = False
            TabOrder = 2
          end
        end
      end
      object PanelGrid: TPanel
        Left = 0
        Top = 41
        Width = 786
        Height = 393
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object DBGrid1: TTntDBGrid
          Left = 0
          Top = 0
          Width = 786
          Height = 393
          Align = alClient
          DataSource = DataSource1
          FixedColor = clSkyBlue
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnTitleClick = DBGrid1TitleClick
          Columns = <
            item
              Expanded = False
              FieldName = 'seg_code'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'clas_code'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'clas_name'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 's_start'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 's_end'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'start_b'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'start_e'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'end_b'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'end_e'
              Visible = True
            end>
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
    AfterScroll = ADOQuery1AfterScroll
    OnCalcFields = ADOQuery1CalcFields
    Parameters = <>
    SQL.Strings = (
      'select top 1 * from hrd_dut_seg')
    Left = 168
    object ADOQuery1upd_user: TStringField
      FieldName = 'upd_user'
      Visible = False
      Size = 16
    end
    object ADOQuery1upd_date: TDateTimeField
      FieldName = 'upd_date'
      Visible = False
    end
    object ADOQuery1seg_code: TStringField
      FieldName = 'seg_code'
      Size = 2
    end
    object ADOQuery1clas_code: TStringField
      FieldName = 'clas_code'
      FixedChar = True
      Size = 2
    end
    object ADOQuery1clas_name: TWideStringField
      FieldKind = fkCalculated
      FieldName = 'clas_name'
      Calculated = True
    end
    object ADOQuery1s_start: TStringField
      FieldName = 's_start'
      FixedChar = True
      Size = 4
    end
    object ADOQuery1s_end: TStringField
      FieldName = 's_end'
      FixedChar = True
      Size = 4
    end
    object ADOQuery1start_b: TStringField
      FieldName = 'start_b'
      FixedChar = True
      Size = 4
    end
    object ADOQuery1start_e: TStringField
      FieldName = 'start_e'
      FixedChar = True
      Size = 4
    end
    object ADOQuery1end_b: TStringField
      FieldName = 'end_b'
      FixedChar = True
      Size = 4
    end
    object ADOQuery1end_e: TStringField
      FieldName = 'end_e'
      FixedChar = True
      Size = 4
    end
  end
end
