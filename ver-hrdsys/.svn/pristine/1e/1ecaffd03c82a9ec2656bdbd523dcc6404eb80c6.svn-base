object FormMed05: TFormMed05
  Left = 1
  Top = 18
  Width = 794
  Height = 504
  Caption = 'FormMed05'
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
      Caption = 'med05_titl'
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
      object PanelQuery: TPanel
        Left = 0
        Top = 0
        Width = 786
        Height = 49
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object TntGroupBox1: TTntGroupBox
          Left = 0
          Top = 0
          Width = 786
          Height = 49
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
      object PanelGrid: TPanel
        Left = 0
        Top = 49
        Width = 786
        Height = 335
        Align = alClient
        TabOrder = 1
        object DBGrid1: TTntDBGrid
          Left = 1
          Top = 1
          Width = 784
          Height = 333
          Align = alClient
          Color = cl3DLight
          DataSource = DataSource1
          FixedColor = clSkyBlue
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete]
          ParentFont = False
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
              ReadOnly = True
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'first_inv'
              ReadOnly = True
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'in_inv'
              ReadOnly = True
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'out_inv'
              ReadOnly = True
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'tun_inv'
              ReadOnly = True
              Width = 50
              Visible = True
            end
            item
              Color = clWhite
              Expanded = False
              FieldName = 'end_inv'
              Width = 50
              Visible = True
            end
            item
              Color = clWhite
              Expanded = False
              FieldName = 'rea_code'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'rea_name'
              ReadOnly = True
              Width = 88
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'dis_inv'
              ReadOnly = True
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'dru_name'
              ReadOnly = True
              Width = 129
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'new_price'
              ReadOnly = True
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'unit_name'
              ReadOnly = True
              Width = 57
              Visible = True
            end>
        end
      end
      object PanelAct: TTntPanel
        Left = 0
        Top = 384
        Width = 786
        Height = 50
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        object sb_Add: TTntSpeedButton
          Left = 110
          Top = 12
          Width = 80
          Height = 25
          Caption = '(&a)dd'
          Enabled = False
          Flat = True
          Glyph.Data = {
            E6000000424DE60000000000000076000000280000000F0000000E0000000100
            04000000000070000000130B0000130B00001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8880888888888888888088888888888888808888880008888880888888070888
            8880888888070888888088800007000088808880777777708880888000070000
            8880888888070888888088888807088888808888880008888880888888888888
            88808888888888888880}
          Visible = False
        end
        object sb_Recover: TTntSpeedButton
          Left = 470
          Top = 12
          Width = 80
          Height = 25
          Caption = '(&u)ndo'
          Enabled = False
          Flat = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
            3333333777333777FF3333993333339993333377FF3333377FF3399993333339
            993337777FF3333377F3393999333333993337F777FF333337FF993399933333
            399377F3777FF333377F993339993333399377F33777FF33377F993333999333
            399377F333777FF3377F993333399933399377F3333777FF377F993333339993
            399377FF3333777FF7733993333339993933373FF3333777F7F3399933333399
            99333773FF3333777733339993333339933333773FFFFFF77333333999999999
            3333333777333777333333333999993333333333377777333333}
          NumGlyphs = 2
          OnClick = sb_RecoverClick
        end
        object sb_Save: TTntSpeedButton
          Left = 550
          Top = 12
          Width = 80
          Height = 25
          Caption = '(&s)ave'
          Enabled = False
          Flat = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
            00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
            00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
            00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
            00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
            00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
            00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
            0003737FFFFFFFFF7F7330099999999900333777777777777733}
          NumGlyphs = 2
          OnClick = sb_SaveClick
        end
        object sb_edit: TTntSpeedButton
          Left = 270
          Top = 12
          Width = 80
          Height = 25
          Caption = '(&m)odify'
          Enabled = False
          Flat = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
            000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
            00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
            F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
            0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
            FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
            FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
            0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
            00333377737FFFFF773333303300000003333337337777777333}
          NumGlyphs = 2
          Visible = False
        end
        object sb_Del: TTntSpeedButton
          Left = 190
          Top = 12
          Width = 80
          Height = 25
          Caption = '(&d)elete'
          Enabled = False
          Flat = True
          Glyph.Data = {
            DE000000424DDE0000000000000076000000280000000D0000000D0000000100
            0400000000006800000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            F000FFFFFFFFFFFFF000FFFFFFFFFFFFF000FFFFFFFFFFFFF000FFFFFFFFFFFF
            F000FF000000000FF000FF0FFFFFFF0FF000FF000000000FF000FFFFFFFFFFFF
            F000FFFFFFFFFFFFF000FFFFFFFFFFFFF000FFFFFFFFFFFFF000FFFFFFFFFFFF
            F000}
          Visible = False
        end
        object sb_Print: TTntSpeedButton
          Left = 390
          Top = 12
          Width = 80
          Height = 25
          Caption = '(&p)rint'
          Enabled = False
          Flat = True
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
          OnClick = sb_PrintClick
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
    AfterOpen = ADOQuery1AfterOpen
    AfterClose = ADOQuery1AfterClose
    BeforePost = ADOQuery1BeforePost
    AfterScroll = ADOQuery1AfterScroll
    OnCalcFields = ADOQuery1CalcFields
    OnWillChangeRecord = ADOQuery1WillChangeRecord
    Parameters = <>
    SQL.Strings = (
      'select * from hrd_med_mon')
    Left = 8
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
      OnChange = ADOQuery1end_invChange
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
    object ADOQuery1rea_name: TTntWideStringField
      FieldKind = fkCalculated
      FieldName = 'rea_name'
      Calculated = True
    end
  end
end
