object Formfhrd101: TFormfhrd101
  Left = 0
  Top = 51
  Width = 797
  Height = 518
  Caption = 'Formfhrd101'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object TntPanel1: TTntPanel
    Left = 0
    Top = 0
    Width = 789
    Height = 45
    Align = alTop
    Caption = #28023#22806#24185#37096#31649#29702#31995#32113'____'#37096#38272#36039#26009#32173#35703
    Color = clCream
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object TntPanel2: TTntPanel
    Left = 0
    Top = 45
    Width = 227
    Height = 446
    Align = alLeft
    Alignment = taLeftJustify
    AutoSize = True
    BevelOuter = bvNone
    TabOrder = 1
    object TntGroupBox1: TTntGroupBox
      Left = 0
      Top = 0
      Width = 227
      Height = 446
      Align = alClient
      Caption = #37096#38272#32080#27083#22294
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 0
      object deptTree: TTntTreeView
        Left = 2
        Top = 15
        Width = 223
        Height = 429
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNone
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Indent = 19
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        OnClick = deptTreeClick
      end
    end
  end
  object TntPanel5: TTntPanel
    Left = 227
    Top = 45
    Width = 562
    Height = 446
    Align = alClient
    Alignment = taRightJustify
    AutoSize = True
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      562
      446)
    object TntPanel4: TTntPanel
      Left = 0
      Top = 0
      Width = 562
      Height = 128
      Align = alTop
      AutoSize = True
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        562
        128)
      object TntGroupBox2: TTntGroupBox
        Left = 0
        Top = 0
        Width = 561
        Height = 128
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = #32173#35703#25976#25818
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        DesignSize = (
          561
          128)
        object TntLabel1: TTntLabel
          Left = 22
          Top = 16
          Width = 78
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = #21424#21029
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object TntLabel2: TTntLabel
          Left = 22
          Top = 43
          Width = 78
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = #37096#38272#20195#34399
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object TntLabel3: TTntLabel
          Left = 22
          Top = 70
          Width = 78
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = #37096#38272#21517#31281
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object TntLabel5: TTntLabel
          Left = 274
          Top = 70
          Width = 94
          Height = 14
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          AutoSize = False
          Caption = #37096#38272#31777#31281
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object TntLabel6: TTntLabel
          Left = 8
          Top = 98
          Width = 92
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = #32232#21046#20154#25976
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object saveData: TTntBitBtn
          Left = 315
          Top = 95
          Width = 75
          Height = 22
          Anchors = [akTop, akRight]
          Caption = #20445#23384
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnClick = saveDataClick
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
        end
        object delData: TTntBitBtn
          Left = 390
          Top = 95
          Width = 75
          Height = 22
          Anchors = [akTop, akRight]
          Caption = #21034#38500
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          OnClick = delDataClick
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000120B0000120B00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            B4924CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFB4924CFFFFFFFFFFFFFFFFFFFFFFFF898989FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF898989FFFFFFFFFFFFFFFFFFE8B44C
            E8B44CB4924CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFA9A9A9A9A9A9898989FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8B44C
            FFEECBE8B44CB4924CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB492
            4CFFFFFFFFFFFFFFFFFFFFFFFFA7A7A7E8E8E8A8A8A8898989FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF8A8A8AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            E8B44CFFC64CB4924CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8B44CFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA9A9A9B8B8B8898989FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFA8A8A8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFE8B44CFFC64CB4924CFFFFFFFFFFFFFFFFFFFFFFFFE8B44CB4924CFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA8A8A8B8B8B8898989FFFFFFFF
            FFFFFFFFFFFFFFFFA7A7A7898989FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFE8B44CE8B44CB4924CFFFFFFFFFFFFE8B44CB4924CFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA9A9A9A8A8A8898989FF
            FFFFFFFFFFA7A7A7888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFE8B44CE8B44CB4924CE8B44CB4924CFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA7A7A7A8A8A889
            8989A8A8A8898989FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFE8B44CE8B44CB4924CFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA9A9A9A9
            A9A9898989FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFE8B44CE8B44CB4924CE8B44CB4924CFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA9A9A9A7A7A789
            8989A7A7A78A8A8AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFE8B44CFFC64CB4924CFFFFFFFFFFFFE8B44CB4924CFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA7A7A7B9B9B98A8A8AFF
            FFFFFFFFFFA8A8A88A8A8AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            E8B44CE8B44CFFC64CB4924CFFFFFFFFFFFFFFFFFFFFFFFFE8B44CB4924CFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA8A8A8A7A7A7B9B9B9888888FFFFFFFF
            FFFFFFFFFFFFFFFFA7A7A7898989FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8B44C
            FFEECBFFC64CB4924CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8B44CB492
            4CFFFFFFFFFFFFFFFFFFFFFFFFA8A8A8E8E8E8B8B8B8888888FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFA7A7A78A8A8AFFFFFFFFFFFFFFFFFFFFFFFFE8B44C
            E8B44CE8B44CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFB4924CFFFFFFFFFFFFFFFFFFA8A8A8A8A8A8A9A9A9FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF888888FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          NumGlyphs = 2
        end
        object exitSubForm: TTntBitBtn
          Left = 465
          Top = 95
          Width = 75
          Height = 22
          Anchors = [akTop, akRight]
          Caption = #36864#20986
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          OnClick = exitSubFormClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
            03333377777777777F333301111111110333337F333333337F33330111111111
            0333337F333333337F333301111111110333337F333333337F33330111111111
            0333337F333333337F333301111111110333337F333333337F33330111111111
            0333337F3333333F7F333301111111B10333337F333333737F33330111111111
            0333337F333333337F333301111111110333337F33FFFFF37F3333011EEEEE11
            0333337F377777F37F3333011EEEEE110333337F37FFF7F37F3333011EEEEE11
            0333337F377777337F333301111111110333337F333333337F33330111111111
            0333337FFFFFFFFF7F3333000000000003333377777777777333}
          NumGlyphs = 2
        end
        object facCob: TTntComboBox
          Left = 100
          Top = 13
          Width = 119
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMenuText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 7
          OnChange = facCobChange
        end
        object dcodeEdit: TTntEdit
          Left = 100
          Top = 40
          Width = 50
          Height = 21
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 6
          ParentFont = False
          TabOrder = 0
          OnChange = dcodeEditChange
        end
        object dtitleEdit: TTntEdit
          Left = 100
          Top = 67
          Width = 160
          Height = 21
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 30
          ParentFont = False
          TabOrder = 1
        end
        object dauthEdit: TTntEdit
          Left = 100
          Top = 95
          Width = 43
          Height = 21
          Hint = '0000'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 4
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
        end
        object dabbrEdit: TTntEdit
          Left = 370
          Top = 67
          Width = 170
          Height = 21
          Anchors = [akTop, akRight]
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 15
          ParentFont = False
          TabOrder = 2
        end
      end
    end
    object TntPanel3: TTntPanel
      Left = 0
      Top = 129
      Width = 561
      Height = 310
      Anchors = [akLeft, akTop, akRight, akBottom]
      BevelOuter = bvNone
      TabOrder = 1
      object TntGroupBox3: TTntGroupBox
        Left = 0
        Top = 0
        Width = 561
        Height = 310
        Align = alClient
        Caption = #28687#35261#25976#25818
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object dataGrid: TTntDBGrid
          Left = 2
          Top = 15
          Width = 557
          Height = 293
          Align = alClient
          DataSource = DataSourceDept
          FixedColor = clSkyBlue
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = dataGridCellClick
          OnTitleClick = dataGridTitleClick
          Columns = <
            item
              Expanded = False
              FieldName = 'dept_code'
              Title.Caption = #37096#38272#20195#34399
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'dept_title'
              Title.Caption = #37096#38272#21517#31281
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'dept_abbr'
              Title.Caption = #37096#38272#31777#31281
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'dept_auth'
              Title.Caption = #32232#21046#20154#25976
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'dept_act'
              Title.Caption = #23526#38555#20154#25976
              Visible = True
            end>
        end
      end
    end
  end
  object DataSourceDept: TDataSource
    DataSet = deptQuery
    Left = 152
    Top = 284
  end
  object deptQuery: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'pfactory'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 1
        Value = Null
      end>
    SQL.Strings = (
      
        'select * from fhrd_dept where factory=:pfactory order by dept_co' +
        'de')
    Left = 152
    Top = 316
  end
end
