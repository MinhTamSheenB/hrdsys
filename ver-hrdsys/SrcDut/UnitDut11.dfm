object FormDut11: TFormDut11
  Left = 229
  Top = 158
  Width = 794
  Height = 504
  Caption = 'FormDut11'
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
      Caption = #25171#21360#21152#29677#21934' / '#20572#24037#21934
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
      object Panel7: TPanel
        Left = 150
        Top = 50
        Width = 474
        Height = 269
        Color = clBackground
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object Panel2: TPanel
          Left = 5
          Top = 5
          Width = 465
          Height = 259
          BevelOuter = bvNone
          Color = clSkyBlue
          TabOrder = 0
          object label_dept_begin: TTntLabel
            Left = 74
            Top = 89
            Width = 80
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'dept'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'MS PGothic'
            Font.Style = []
            ParentFont = False
          end
          object Label1: TLabel
            Left = 0
            Top = 186
            Width = 800
            Height = 3
            AutoSize = False
            Color = clBackground
            ParentColor = False
          end
          object label_dept_end: TTntLabel
            Left = 74
            Top = 129
            Width = 80
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'dept'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'MS PGothic'
            Font.Style = []
            ParentFont = False
          end
          object CobDeptBegin: TTntComboBox
            Left = 164
            Top = 84
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
            TabOrder = 2
            OnChange = CobDeptBeginChange
          end
          object CobDeptEnd: TTntComboBox
            Left = 163
            Top = 124
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
            TabOrder = 3
          end
          object BtnPrint: TTntBitBtn
            Left = 238
            Top = 207
            Width = 75
            Height = 25
            Caption = #25171#21360
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            OnClick = BtnPrintClick
          end
          object RbOver: TTntRadioButton
            Left = 128
            Top = 43
            Width = 80
            Height = 17
            Caption = 'over'
            Checked = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            TabStop = True
          end
          object RbStop: TTntRadioButton
            Left = 248
            Top = 43
            Width = 80
            Height = 17
            Caption = 'stop'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object BtnPreview: TTntButton
            Left = 152
            Top = 208
            Width = 75
            Height = 25
            Caption = #25171#21360#38928#35261
            TabOrder = 4
            OnClick = BtnPrintClick
          end
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
    Parameters = <>
    SQL.Strings = (
      'select top 50  * from hrd_emp')
    Left = 168
    object ADOQuery1emp_id: TStringField
      FieldName = 'emp_id'
      Size = 6
    end
    object ADOQuery1emp_chs: TWideStringField
      FieldName = 'emp_chs'
      Size = 10
    end
    object ADOQuery1name_vim: TWideStringField
      FieldName = 'name_vim_en'
    end
  end
end
