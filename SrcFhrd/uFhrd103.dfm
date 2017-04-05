object Formfhrd103: TFormfhrd103
  Left = 140
  Top = 108
  Width = 798
  Height = 510
  Caption = 'Formfhrd103'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = TntFormClose
  OnCreate = TntFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object TntPanel1: TTntPanel
    Left = 0
    Top = 0
    Width = 790
    Height = 45
    Align = alTop
    Caption = 'Qu'#7843'n l'#253' c'#225'n b'#7897' ng'#432#7901'i n'#432#7899'c ngo'#224'i_____L'#224'm t'#224'i li'#7879'u th'#7883' th'#7921'c (Visa)'
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
    Width = 790
    Height = 431
    Align = alClient
    TabOrder = 1
    object TntGroupBox3: TTntGroupBox
      Left = 1
      Top = 233
      Width = 788
      Height = 197
      Align = alClient
      Caption = 'Duy'#7879't d'#7919' li'#7879'u'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      DesignSize = (
        788
        197)
      object TntDBGrid2: TTntDBGrid
        Left = 0
        Top = 13
        Width = 785
        Height = 189
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = DataSource1
        FixedColor = clSkyBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        PopupMenu = TntPopupMenu1
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBackground
        TitleFont.Height = -13
        TitleFont.Name = 'Arial'
        TitleFont.Style = [fsBold]
        OnMouseDown = TntDBGrid2MouseDown
        Columns = <
          item
            Expanded = False
            FieldName = 'emp_passport'
            Title.Alignment = taCenter
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Palatino Linotype'
            Title.Font.Style = []
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'emp_id'
            Title.Alignment = taCenter
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Palatino Linotype'
            Title.Font.Style = []
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'emp_name'
            Title.Alignment = taCenter
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Palatino Linotype'
            Title.Font.Style = []
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dept_title'
            Title.Alignment = taCenter
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Palatino Linotype'
            Title.Font.Style = []
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'visa_type'
            Title.Alignment = taCenter
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Palatino Linotype'
            Title.Font.Style = []
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'from_vsdt'
            Title.Alignment = taCenter
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Palatino Linotype'
            Title.Font.Style = []
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'due_vsdt'
            Title.Alignment = taCenter
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Palatino Linotype'
            Title.Font.Style = []
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'visa_serial'
            Title.Alignment = taCenter
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Palatino Linotype'
            Title.Font.Style = []
            Visible = True
          end>
      end
    end
    object TntPanel3: TTntPanel
      Left = 1
      Top = 1
      Width = 788
      Height = 232
      Align = alTop
      TabOrder = 1
      object TntGroupBox2: TTntGroupBox
        Left = 1
        Top = 123
        Width = 786
        Height = 108
        Align = alClient
        Caption = 'Duy tr'#236' d'#7919' li'#7879'u'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object TntLabel1: TTntLabel
          Left = 33
          Top = 22
          Width = 33
          Height = 13
          Alignment = taRightJustify
          Caption = 'S'#7889' Th'#7867
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object TntLabel2: TTntLabel
          Left = 166
          Top = 22
          Width = 69
          Height = 13
          Alignment = taRightJustify
          Caption = 'T'#234'n Nh'#226'n Vi'#234'n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object TntLabel3: TTntLabel
          Left = 463
          Top = 22
          Width = 60
          Height = 13
          Alignment = taRightJustify
          Caption = 'T'#234'n B'#7897' Ph'#7853'n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object TntLabel4: TTntLabel
          Left = 23
          Top = 52
          Width = 43
          Height = 13
          Alignment = taRightJustify
          Caption = 'H'#7897' Chi'#7871'u'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object TntLabel5: TTntLabel
          Left = 272
          Top = 52
          Width = 65
          Height = 13
          Alignment = taRightJustify
          Caption = 'Ng'#224'y hi'#7879'u l'#7921'c'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object TntLabel6: TTntLabel
          Left = 457
          Top = 52
          Width = 65
          Height = 13
          Alignment = taRightJustify
          Caption = 'Ng'#224'y h'#7871't h'#7841'n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object TntLabel7: TTntLabel
          Left = 25
          Top = 81
          Width = 41
          Height = 13
          Alignment = taRightJustify
          Caption = 'Lo'#7841'i Visa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object TntLabel8: TTntLabel
          Left = 303
          Top = 81
          Width = 34
          Height = 13
          Alignment = taRightJustify
          Caption = 'S'#7889' Visa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object TntRadioButton_StyleSingle: TTntRadioButton
          Left = 72
          Top = 81
          Width = 62
          Height = 17
          Caption = '&Single'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          TabStop = True
        end
        object TntRadioButton_StyleMulti: TTntRadioButton
          Left = 134
          Top = 81
          Width = 60
          Height = 17
          Caption = 'M&ulti'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object TntEdit_EmpID: TTntEdit
          Left = 72
          Top = 19
          Width = 42
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 6
          ParentFont = False
          TabOrder = 2
          Text = 'TntEdit_EmpID'
          OnChange = TntEdit_EmpIDChange
          OnClick = TntEdit_EmpIDClick
        end
        object TntEdit_EmpName: TTntEdit
          Left = 242
          Top = 19
          Width = 104
          Height = 21
          Color = clSkyBlue
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 20
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
          Text = 'TntEdit_EmpName'
        end
        object TntEdit_DeptName: TTntEdit
          Left = 530
          Top = 19
          Width = 225
          Height = 21
          Color = clSkyBlue
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
          Text = 'TntEdit_DeptName'
        end
        object TntEditEmpPassport: TTntEdit
          Left = 72
          Top = 49
          Width = 97
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 15
          ParentFont = False
          TabOrder = 5
          OnChange = TntEditEmpPassportChange
        end
        object TntEdit_VisaID: TTntEdit
          Left = 344
          Top = 77
          Width = 65
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          TabOrder = 6
        end
        object TntButton_Save: TTntBitBtn
          Left = 530
          Top = 77
          Width = 75
          Height = 22
          Caption = 'L'#432'u'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          OnClick = TntButton_SaveClick
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
        object TntButtonDelete: TTntBitBtn
          Left = 605
          Top = 77
          Width = 75
          Height = 22
          Caption = 'Xo'#225
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
          OnClick = TntButtonDeleteClick
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
        object TntButton_Quit: TTntBitBtn
          Left = 680
          Top = 77
          Width = 75
          Height = 22
          Caption = 'Tho'#225't'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
          OnClick = TntButton_QuitClick
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
        object fromDate: TTntDateTimePicker
          Left = 344
          Top = 49
          Width = 79
          Height = 21
          Date = 38594.341256145830000000
          Time = 38594.341256145830000000
          TabOrder = 10
        end
        object endDate: TTntDateTimePicker
          Left = 530
          Top = 48
          Width = 79
          Height = 21
          Date = 38594.343589224540000000
          Time = 38594.343589224540000000
          TabOrder = 11
        end
      end
      object TntGroupBox1: TTntGroupBox
        Left = 1
        Top = 1
        Width = 786
        Height = 122
        Align = alTop
        Caption = 'Nh'#226'n vi'#234'n m'#7899'i'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        DesignSize = (
          786
          122)
        object TntDBGrid1: TTntDBGrid
          Left = 2
          Top = 13
          Width = 782
          Height = 107
          Anchors = [akLeft, akTop, akRight, akBottom]
          DataSource = passportDataSource
          FixedColor = clSkyBlue
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBackground
          TitleFont.Height = -13
          TitleFont.Name = 'Arial'
          TitleFont.Style = [fsBold]
          OnCellClick = dbgetRows
          OnKeyDown = TntDBGrid1KeyDown
          OnKeyUp = TntDBGrid1KeyUp
          Columns = <
            item
              Expanded = False
              FieldName = 'emp_passport'
              Title.Alignment = taCenter
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Palatino Linotype'
              Title.Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'emp_id'
              Title.Alignment = taCenter
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Palatino Linotype'
              Title.Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'emp_name'
              Title.Alignment = taCenter
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Palatino Linotype'
              Title.Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'pst_name'
              Title.Alignment = taCenter
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Palatino Linotype'
              Title.Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'dept_title'
              Title.Alignment = taCenter
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Palatino Linotype'
              Title.Font.Style = []
              Visible = True
            end>
        end
      end
    end
  end
  object passportQuery: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT         emp_passport, emp_id, emp_name, pst_name, dept_ab' +
        'br as dept_title'
      'FROM             vfhrdemp e'
      'WHERE         (emp_passport NOT IN'
      '                              (SELECT         passport'
      
        '                                FROM              fhrd_passport)' +
        ')')
    Left = 8
    Top = 104
  end
  object detailsQuery: TADOQuery
    Connection = DMHrdsys.conn
    Parameters = <
      item
        Name = 'upd_user'
        DataType = ftString
        Size = 20
        Value = Null
      end
      item
        Name = 'passport'
        DataType = ftString
        Size = 15
        Value = Null
      end
      item
        Name = 'from_vsdt'
        DataType = ftDateTime
        Size = 10
        Value = Null
      end
      item
        Name = 'due_vsdt'
        DataType = ftDateTime
        Size = 10
        Value = Null
      end
      item
        Name = 'visa_type'
        DataType = ftString
        Size = 1
        Value = Null
      end
      item
        Name = 'visa_serial'
        DataType = ftString
        Size = 15
        Value = Null
      end>
    Left = 392
    Top = 368
  end
  object passportDataSource: TDataSource
    DataSet = passportQuery
    Left = 40
    Top = 104
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 208
    Top = 368
  end
  object SelectQuery: TADOQuery
    Connection = DMHrdsys.conn
    Parameters = <>
    Left = 264
    Top = 104
  end
  object ADOQuery1: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    AfterScroll = ADOQuery1AfterScroll
    Parameters = <>
    SQL.Strings = (
      'SELECT e.emp_passport,e.emp_id,e.emp_name,'
      
        'd.dept_title,case p.visa_type when '#39'1'#39' then '#39'single'#39' when '#39'2'#39' th' +
        'en '#39'multi'#39' end as visa_type,'
      'p.from_vsdt,p.due_vsdt,p.visa_serial'
      'FROM fhrd_emp e, fhrd_dept d, fhrd_passport p'
      'WHERE e.dept_code=d.dept_code and e.emp_passport=p.passport')
    Left = 176
    Top = 368
    object ADOQuery1emp_passport: TWideStringField
      FieldName = 'emp_passport'
      FixedChar = True
      Size = 15
    end
    object ADOQuery1emp_id: TWideStringField
      FieldName = 'emp_id'
      FixedChar = True
      Size = 6
    end
    object ADOQuery1emp_name: TWideStringField
      FieldName = 'emp_name'
    end
    object ADOQuery1dept_title: TWideStringField
      FieldName = 'dept_title'
      Size = 30
    end
    object ADOQuery1visa_type: TWideStringField
      FieldName = 'visa_type'
      FixedChar = True
      Size = 1
    end
    object ADOQuery1from_vsdt: TDateTimeField
      FieldName = 'from_vsdt'
      OnGetText = ADOQuery1from_vsdtGetText
      OnSetText = ADOQuery1from_vsdtSetText
    end
    object ADOQuery1due_vsdt: TDateTimeField
      FieldName = 'due_vsdt'
      OnGetText = ADOQuery1due_vsdtGetText
      OnSetText = ADOQuery1due_vsdtSetText
    end
    object ADOQuery1visa_serial: TWideStringField
      FieldName = 'visa_serial'
      FixedChar = True
      Size = 10
    end
  end
  object ADOQuery2: TADOQuery
    Connection = DMHrdsys.conn
    Parameters = <>
    Left = 297
    Top = 104
  end
  object ADOQuery3: TADOQuery
    Connection = DMHrdsys.conn
    Parameters = <
      item
        Name = 'emp_passport'
        DataType = ftString
        Size = 15
        Value = Null
      end>
    Left = 329
    Top = 104
  end
  object TntPopupMenu1: TTntPopupMenu
    Images = ImageList1
    Left = 513
    Top = 65
    object delete_rec: TTntMenuItem
      Caption = 'Delete'
      ImageIndex = 0
      OnClick = delete_recClick
    end
    object close_form: TTntMenuItem
      Caption = 'Close'
    end
  end
  object ADOQuery4: TADOQuery
    Connection = DMHrdsys.conn
    Parameters = <>
    Left = 361
    Top = 105
  end
  object ImageList1: TImageList
    Left = 553
    Top = 64
    Bitmap = {
      494C010101000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8000000080008080800000000000000000000000000000000000000000000000
      0000000080000000800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8000000080000000800080808000000000000000000000000000000000000000
      8000000080008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000080000000800000008000808080000000000000000000000080000000
      8000000080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000800000008000000080008080800000008000000080000000
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000008000000080000000800000008000000080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000080000000800000008000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000008000000080000000800000008000000080008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000800000008000000080000000000000008000000080000000
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000080000000800000008000000000000000000000000000000080000000
      8000000080008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8000000080000000800000000000000000000000000000000000000000000000
      8000000080000000800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8000000080000000000000000000000000000000000000000000000000000000
      0000000080000000800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFF000000000000FFFF000000000000
      FFFF000000000000E3F3000000000000E1E3000000000000F0C7000000000000
      F80F000000000000FC1F000000000000FE1F000000000000FC0F000000000000
      F887000000000000F1C3000000000000E3E3000000000000E7F3000000000000
      FFFF000000000000FFFF00000000000000000000000000000000000000000000
      000000000000}
  end
end
