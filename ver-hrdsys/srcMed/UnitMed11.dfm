object FormMed11: TFormMed11
  Left = 1
  Top = 18
  Width = 794
  Height = 504
  Caption = 'FormMed11'
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
      Caption = 'med11_titl'
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
      object PanelAct: TTntPanel
        Left = 0
        Top = 384
        Width = 786
        Height = 50
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
        object sb_Add: TTntSpeedButton
          Left = 310
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
          OnClick = sb_AddClick
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
          Left = 46
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
          Left = 390
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
          OnClick = sb_DelClick
        end
        object sb_Print: TTntSpeedButton
          Left = 230
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
      object PanelDetail: TPanel
        Left = 0
        Top = 0
        Width = 786
        Height = 384
        Align = alClient
        TabOrder = 1
        object PanelInput: TTntPanel
          Left = 32
          Top = 15
          Width = 697
          Height = 360
          BevelOuter = bvNone
          Caption = 'PanelInput'
          TabOrder = 0
          object TntGroupBox1: TTntGroupBox
            Left = 0
            Top = 36
            Width = 697
            Height = 324
            Align = alClient
            Caption = 'take_mdp_tip'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object TntGroupBox4: TTntGroupBox
              Left = 2
              Top = 57
              Width = 693
              Height = 231
              Align = alClient
              Caption = 'take_mdp_detl'
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 0
              object DBGrid1: TTntDBGrid
                Left = 2
                Top = 15
                Width = 689
                Height = 214
                Align = alClient
                DataSource = DataSource2
                FixedColor = clSkyBlue
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clBlack
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'dru_code'
                    Visible = True
                  end
                  item
                    Color = cl3DLight
                    Expanded = False
                    FieldName = 'dru_name'
                    ReadOnly = True
                    Width = 146
                    Visible = True
                  end
                  item
                    Color = cl3DLight
                    Expanded = False
                    FieldName = 'unit_name'
                    ReadOnly = True
                    Width = 110
                    Visible = True
                  end
                  item
                    Color = cl3DLight
                    Expanded = False
                    FieldName = 'dru_price'
                    ReadOnly = True
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'med_qty'
                    Visible = True
                  end
                  item
                    Color = cl3DLight
                    Expanded = False
                    FieldName = 'money'
                    ReadOnly = True
                    Width = 86
                    Visible = True
                  end>
              end
            end
            object PanelMast: TTntPanel
              Left = 2
              Top = 15
              Width = 693
              Height = 42
              Align = alTop
              BevelOuter = bvNone
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              object TntLabel45: TTntLabel
                Left = 28
                Top = 20
                Width = 90
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'dept_code'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlue
                Font.Height = -13
                Font.Name = 'MS PGothic'
                Font.Style = []
                ParentFont = False
              end
              object TntLabel42: TTntLabel
                Left = 328
                Top = 20
                Width = 84
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
              object PickerDate: TTntDateTimePicker
                Left = 416
                Top = 15
                Width = 120
                Height = 21
                Date = 38645.000000000000000000
                Time = 38645.000000000000000000
                TabOrder = 0
                OnChange = PickerDateChange
              end
              object EditDept: TTntEdit
                Left = 120
                Top = 15
                Width = 150
                Height = 21
                TabOrder = 1
                Visible = False
              end
              object CobDept: TTntComboBox
                Left = 119
                Top = 15
                Width = 130
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ItemHeight = 13
                ParentFont = False
                TabOrder = 2
                OnChange = CobDeptChange
              end
            end
            object PanelSum: TTntPanel
              Left = 2
              Top = 288
              Width = 693
              Height = 34
              Align = alBottom
              BevelOuter = bvNone
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              Visible = False
              object TntLabel3: TTntLabel
                Left = 260
                Top = 12
                Width = 90
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'total_money'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlue
                Font.Height = -13
                Font.Name = 'MS PGothic'
                Font.Style = []
                ParentFont = False
              end
              object EditTotal: TTntEdit
                Left = 352
                Top = 7
                Width = 150
                Height = 21
                TabOrder = 0
                Visible = False
              end
            end
          end
          object PanelInputTitl: TPanel
            Left = 0
            Top = 0
            Width = 697
            Height = 36
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            object TntLabel1: TTntLabel
              Left = 34
              Top = 13
              Width = 84
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'fld_mdp_code'
              Color = clBtnFace
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -13
              Font.Name = 'MS PGothic'
              Font.Style = []
              ParentColor = False
              ParentFont = False
            end
            object TntLabel2: TTntLabel
              Left = 330
              Top = 13
              Width = 84
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'doctor'
              Color = clBtnFace
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -13
              Font.Name = 'MS PGothic'
              Font.Style = []
              ParentColor = False
              ParentFont = False
            end
            object EditMdpCode: TTntEdit
              Left = 124
              Top = 9
              Width = 75
              Height = 21
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              MaxLength = 9
              ParentFont = False
              TabOrder = 0
              OnChange = EditMdpCodeChange
            end
            object EditUser: TTntEdit
              Left = 419
              Top = 7
              Width = 130
              Height = 21
              Color = clSkyBlue
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              MaxLength = 6
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
          end
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
    OnWillChangeRecord = ADOQuery1WillChangeRecord
    Parameters = <>
    SQL.Strings = (
      'select  * from hrd_mdp_mast')
    Left = 8
    object ADOQuery1upd_user: TWideStringField
      FieldName = 'upd_user'
      Size = 10
    end
    object ADOQuery1upd_date: TDateTimeField
      FieldName = 'upd_date'
    end
    object ADOQuery1MDP_CODE: TWideStringField
      FieldName = 'MDP_CODE'
      Size = 10
    end
    object ADOQuery1MDP_DATE: TDateTimeField
      FieldName = 'MDP_DATE'
    end
    object ADOQuery1DEPT_CODE: TWideStringField
      FieldName = 'DEPT_CODE'
      Size = 6
    end
  end
  object DataSource2: TDataSource
    DataSet = ADOQueryDetl
    Left = 232
    Top = 3
  end
  object ADOQueryDetl: TADOQuery
    Connection = DMHrdsys.conn
    LockType = ltBatchOptimistic
    BeforePost = ADOQueryDetlBeforePost
    OnCalcFields = ADOQueryDetlCalcFields
    Parameters = <>
    SQL.Strings = (
      'select  * from hrd_mdp_detl')
    Left = 200
    Top = 3
    object ADOQueryDetlupd_user: TWideStringField
      FieldName = 'upd_user'
      Size = 10
    end
    object ADOQueryDetlupd_date: TDateTimeField
      FieldName = 'upd_date'
    end
    object ADOQueryDetlMDP_CODE: TWideStringField
      FieldName = 'mdp_code'
      Size = 10
    end
    object ADOQueryDetlDRU_CODE: TWideStringField
      FieldName = 'dru_code'
      OnChange = ADOQueryDetlDRU_CODEChange
      Size = 6
    end
    object ADOQueryDetlMED_QTY: TFloatField
      FieldName = 'med_qty'
    end
    object ADOQueryDetlDRU_PRICE: TFloatField
      FieldName = 'dru_price'
    end
    object ADOQueryDetlend_inv: TFloatField
      FieldKind = fkCalculated
      FieldName = 'end_inv'
      Calculated = True
    end
    object ADOQueryDetlunit_name: TTntWideStringField
      FieldKind = fkCalculated
      FieldName = 'unit_name'
      Calculated = True
    end
    object ADOQueryDetldru_name: TTntWideStringField
      FieldKind = fkCalculated
      FieldName = 'dru_name'
      Calculated = True
    end
    object ADOQueryDetlmoney: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'money'
      Calculated = True
    end
  end
  object PrintDialog1: TPrintDialog
    Left = 8
    Top = 428
  end
end
