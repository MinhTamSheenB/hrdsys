object FormMed06: TFormMed06
  Left = 1
  Top = 18
  Width = 794
  Height = 504
  Caption = 'FormMed06'
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
      Caption = 'med06_titl'
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
        Height = 44
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object TntGroupBox1: TTntGroupBox
          Left = 0
          Top = 0
          Width = 786
          Height = 44
          Align = alClient
          Caption = 'query_condition'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object Label_month: TTntLabel
            Left = 34
            Top = 17
            Width = 78
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
          object Panel2: TPanel
            Left = 439
            Top = 11
            Width = 338
            Height = 30
            BevelOuter = bvNone
            TabOrder = 0
            object BtnQuery: TTntButton
              Left = 109
              Top = 3
              Width = 75
              Height = 25
              Caption = 'query'
              Default = True
              TabOrder = 0
              OnClick = BtnQueryClick
            end
            object BtnTrans: TTntButton
              Left = 197
              Top = 3
              Width = 75
              Height = 25
              Caption = 'transferfiles'
              Default = True
              TabOrder = 1
              OnClick = BtnTransClick
            end
          end
          object EditMonth: TMaskEdit
            Left = 128
            Top = 15
            Width = 47
            Height = 21
            Hint = 'yyyy/mm'
            EditMask = '9999/99;0;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = 'Chinese (Simplified) - Microsoft Pinyin IME 3.0'
            MaxLength = 7
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
          end
        end
      end
      object Panel6: TPanel
        Left = 0
        Top = 44
        Width = 786
        Height = 390
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object DBGrid1: TTntDBGrid
          Left = 0
          Top = 0
          Width = 786
          Height = 390
          Align = alClient
          DataSource = DataSource1
          FixedColor = clSkyBlue
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete]
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
              FieldName = 'dru_code'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'first_inv'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'in_inv'
              Width = 58
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'out_inv'
              Width = 54
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'tun_inv'
              Width = 58
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'dis_inv'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'end_inv'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'rea_code'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'dru_name'
              Width = 107
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'new_price'
              Width = 57
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'unit_name'
              Width = 72
              Visible = True
            end>
        end
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 40
  end
  object ADOQuery1: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterScroll = ADOQuery1AfterScroll
    OnCalcFields = ADOQuery1CalcFields
    Parameters = <>
    SQL.Strings = (
      'select * from hrd_med_mon')
    Left = 8
    object ADOQuery1dru_code: TStringField
      FieldName = 'dru_code'
      Size = 6
    end
    object ADOQuery1first_inv: TIntegerField
      FieldName = 'first_inv'
    end
    object ADOQuery1in_inv: TIntegerField
      FieldName = 'in_inv'
    end
    object ADOQuery1out_inv: TIntegerField
      FieldName = 'out_inv'
    end
    object ADOQuery1tun_inv: TIntegerField
      FieldName = 'tun_inv'
    end
    object ADOQuery1dis_inv: TIntegerField
      FieldName = 'dis_inv'
    end
    object ADOQuery1end_inv: TIntegerField
      FieldName = 'end_inv'
    end
    object ADOQuery1rea_code: TStringField
      FieldName = 'rea_code'
      Size = 2
    end
    object ADOQuery1old_price: TBCDField
      FieldName = 'old_price'
      Precision = 15
      Size = 0
    end
    object ADOQuery1new_price: TBCDField
      FieldName = 'new_price'
      Precision = 15
      Size = 0
    end
    object ADOQuery1dru_name: TTntWideStringField
      FieldKind = fkCalculated
      FieldName = 'dru_name'
      Calculated = True
    end
    object ADOQuery1unit_name: TTntWideStringField
      FieldKind = fkCalculated
      FieldName = 'unit_name'
      Calculated = True
    end
    object ADOQuery1upd_user: TStringField
      FieldName = 'upd_user'
      Size = 16
    end
    object ADOQuery1upd_date: TDateTimeField
      FieldName = 'upd_date'
    end
    object ADOQuery1month: TStringField
      FieldName = 'month'
      Size = 6
    end
  end
  object PrintDialog1: TPrintDialog
    Left = 664
    Top = 180
  end
  object ADOQuery2: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterScroll = ADOQuery1AfterScroll
    OnCalcFields = ADOQuery1CalcFields
    Parameters = <>
    SQL.Strings = (
      'select * from hrd_med_mon where 2=1')
    Left = 96
    Top = 3
    object StringField1: TStringField
      FieldName = 'dru_code'
      Size = 6
    end
    object IntegerField1: TIntegerField
      FieldName = 'first_inv'
    end
    object IntegerField2: TIntegerField
      FieldName = 'in_inv'
    end
    object IntegerField3: TIntegerField
      FieldName = 'out_inv'
    end
    object IntegerField4: TIntegerField
      FieldName = 'tun_inv'
    end
    object IntegerField5: TIntegerField
      FieldName = 'dis_inv'
    end
    object IntegerField6: TIntegerField
      FieldName = 'end_inv'
    end
    object StringField2: TStringField
      FieldName = 'rea_code'
      Size = 2
    end
    object BCDField1: TBCDField
      FieldName = 'old_price'
      Precision = 15
      Size = 0
    end
    object BCDField2: TBCDField
      FieldName = 'new_price'
      Precision = 15
      Size = 0
    end
    object TntWideStringField1: TTntWideStringField
      FieldKind = fkCalculated
      FieldName = 'dru_name'
      Calculated = True
    end
    object TntWideStringField2: TTntWideStringField
      FieldKind = fkCalculated
      FieldName = 'unit_name'
      Calculated = True
    end
    object StringField3: TStringField
      FieldName = 'upd_user'
      Size = 16
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'upd_date'
    end
    object StringField4: TStringField
      FieldName = 'month'
      Size = 6
    end
  end
end
