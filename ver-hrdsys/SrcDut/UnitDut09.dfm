object formDut09: TformDut09
  Left = 2
  Top = 45
  BorderStyle = bsSingle
  Caption = 'formDut09'
  ClientHeight = 475
  ClientWidth = 790
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  OnKeyDown = sg_addKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object TntPanel1: TTntPanel
    Left = 0
    Top = 0
    Width = 790
    Height = 41
    Align = alTop
    Caption = #21729#24037#32771#21220#25163#24037#31805#21345
    Color = clCream
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object TntPanel2: TTntPanel
    Left = 0
    Top = 41
    Width = 790
    Height = 434
    Align = alClient
    TabOrder = 1
    object TntPanel3: TTntPanel
      Left = 1
      Top = 1
      Width = 788
      Height = 386
      Align = alClient
      TabOrder = 0
      object TntPanel9: TTntPanel
        Left = 1
        Top = 1
        Width = 786
        Height = 37
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object TntLabel3: TTntLabel
          Left = 8
          Top = 11
          Width = 89
          Height = 13
          AutoSize = False
          Caption = #32771#21220#26085#26399
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object att_date: TTntDateTimePicker
          Left = 101
          Top = 6
          Width = 92
          Height = 21
          Date = 38581.454637569440000000
          Time = 38581.454637569440000000
          TabOrder = 0
        end
        object Tbb_reset: TTntBitBtn
          Left = 300
          Top = 5
          Width = 77
          Height = 25
          Caption = '&reset'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = Tbb_resetClick
          Kind = bkRetry
        end
        object bb_ok: TTntBitBtn
          Left = 214
          Top = 5
          Width = 77
          Height = 25
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = bb_okClick
          Kind = bkOK
        end
      end
      object TntDBGrid1: TTntDBGrid
        Left = 1
        Top = 38
        Width = 786
        Height = 347
        Align = alClient
        DataSource = DataSource1
        Enabled = False
        FixedColor = clSkyBlue
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnColEnter = TntDBGrid1ColEnter
        OnEditButtonClick = TntDBGrid1EditButtonClick
        Columns = <
          item
            ButtonStyle = cbsEllipsis
            Expanded = False
            FieldName = 'emp_id'
            Width = 69
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'seg_code'
            PopupMenu = TntPopupMenu1
            Width = 74
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'clascode'
            Width = 84
            Visible = True
          end
          item
            Alignment = taRightJustify
            Color = clBtnFace
            Expanded = False
            FieldName = 's_start'
            ReadOnly = True
            Width = 65
            Visible = True
          end
          item
            Alignment = taRightJustify
            Color = clBtnFace
            Expanded = False
            FieldName = 's_end'
            ReadOnly = True
            Width = 56
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'real_start'
            Width = 92
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'real_end'
            Width = 97
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'wrk_sts'
            Width = 67
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'late'
            Width = 66
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'early'
            Width = 61
            Visible = True
          end>
      end
    end
    object TntPanel6: TTntPanel
      Left = 1
      Top = 387
      Width = 788
      Height = 46
      Align = alBottom
      TabOrder = 1
      object bb_undo: TTntBitBtn
        Left = 304
        Top = 11
        Width = 77
        Height = 25
        Caption = #25764#37559
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = bb_undoClick
        Kind = bkRetry
      end
      object bb_save: TTntBitBtn
        Left = 392
        Top = 11
        Width = 77
        Height = 25
        Caption = 'save'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ModalResult = 4
        ParentFont = False
        TabOrder = 1
        OnClick = bb_saveClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000C40E0000C40E00001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000FFF000
          00000888870F011111900887770F01111190087000FF01111190080FF0001111
          1190080F011111111190080F011111111190080F011111111190080F01111111
          1190080F019911111190080FF00091111190088000FF011111900888870F0111
          11900888870F011111900777780F09999910000000FFF0000000}
      end
    end
  end
  object PanelAdd: TTntPanel
    Left = 248
    Top = 143
    Width = 249
    Height = 221
    BevelOuter = bvLowered
    BorderStyle = bsSingle
    Color = clWindow
    Ctl3D = False
    ParentBackground = True
    ParentCtl3D = False
    TabOrder = 2
    Visible = False
    OnMouseDown = PanelAddMouseDown
    object TntPanel4: TTntPanel
      Left = 1
      Top = 1
      Width = 245
      Height = 20
      Align = alTop
      Alignment = taLeftJustify
      Color = clBackground
      TabOrder = 0
      OnMouseDown = PanelAddMouseDown
      object sb_Close: TTntSpeedButton
        Left = 223
        Top = 1
        Width = 20
        Height = 19
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
          33333337777FF377FF3333993370739993333377FF373F377FF3399993000339
          993337777F777F3377F3393999707333993337F77737333337FF993399933333
          399377F3777FF333377F993339903333399377F33737FF33377F993333707333
          399377F333377FF3377F993333101933399377F333777FFF377F993333000993
          399377FF3377737FF7733993330009993933373FF3777377F7F3399933000399
          99333773FF777F777733339993707339933333773FF7FFF77333333999999999
          3333333777333777333333333999993333333333377777333333}
        NumGlyphs = 2
        OnClick = sb_CloseClick
      end
    end
    object TntPanel5: TTntPanel
      Left = 1
      Top = 21
      Width = 245
      Height = 197
      Align = alClient
      TabOrder = 1
      object TntLabel1: TTntLabel
        Left = 1
        Top = 180
        Width = 243
        Height = 16
        Align = alBottom
        Alignment = taCenter
        AutoSize = False
        Caption = #27880#24847#65306#38617#25802#36984#20013#26178#27573
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object sg_add: TTntStringGrid
        Left = 0
        Top = 0
        Width = 243
        Height = 177
        ColCount = 4
        Ctl3D = False
        DefaultColWidth = 50
        FixedCols = 0
        RowCount = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
        ParentCtl3D = False
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 0
        OnDblClick = sg_addDblClick
        OnKeyDown = sg_addKeyDown
        ColWidths = (
          41
          77
          52
          50)
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 256
    Top = 8
  end
  object ADOQuery2: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from hrd_dut_seg')
    Left = 296
    Top = 8
  end
  object ADOQuery3: TADOQuery
    Connection = DMHrdsys.conn
    Parameters = <>
    Left = 384
    Top = 8
  end
  object TntPopupMenu1: TTntPopupMenu
    Left = 137
    Top = 10
    object N1: TTntMenuItem
      Caption = #26178#27573#36039#26009#26597#35426
      OnClick = N1Click
    end
  end
  object ADOQuery4: TADOQuery
    Connection = DMHrdsys.conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select clas_code,clas_code+'#39#39'+clas_chs as clas_chs  from hrd_dut' +
        '_class')
    Left = 336
    Top = 8
  end
  object ADOQuery1: TADOQuery
    Connection = DMHrdsys.conn
    LockType = ltBatchOptimistic
    BeforeScroll = ADOQuery1BeforeScroll
    AfterScroll = ADOQuery1AfterScroll
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      'select * from hrd_dut_day050801 where 1<0')
    Left = 208
    Top = 8
    object ADOQuery1upd_user: TStringField
      FieldName = 'upd_user'
      Size = 16
    end
    object ADOQuery1upd_date: TDateTimeField
      FieldName = 'upd_date'
    end
    object ADOQuery1wrk_date: TDateTimeField
      FieldName = 'wrk_date'
    end
    object ADOQuery1emp_id: TStringField
      FieldName = 'emp_id'
      FixedChar = True
      Size = 6
    end
    object ADOQuery1seg_code: TStringField
      FieldName = 'seg_code'
      FixedChar = True
      Size = 2
    end
    object ADOQuery1clas_code: TStringField
      FieldName = 'clas_code'
      FixedChar = True
      Size = 2
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
    object ADOQuery1real_start: TStringField
      FieldName = 'real_start'
      FixedChar = True
      Size = 4
    end
    object ADOQuery1real_end: TStringField
      FieldName = 'real_end'
      FixedChar = True
      Size = 4
    end
    object ADOQuery1wrk_sts: TStringField
      FieldName = 'wrk_sts'
      FixedChar = True
      Size = 2
    end
    object ADOQuery1late: TStringField
      FieldName = 'late'
      FixedChar = True
      Size = 2
    end
    object ADOQuery1early: TStringField
      FieldName = 'early'
      FixedChar = True
      Size = 2
    end
    object ADOQuery1over_flag: TStringField
      FieldName = 'over_flag'
      FixedChar = True
      Size = 1
    end
    object ADOQuery1notify: TStringField
      FieldName = 'notify'
      FixedChar = True
      Size = 1
    end
    object ADOQuery1clascode: TStringField
      FieldKind = fkLookup
      FieldName = 'clascode'
      LookupDataSet = ADOQuery4
      LookupKeyFields = 'clas_code'
      LookupResultField = 'clas_chs'
      KeyFields = 'clas_code'
      Size = 10
      Lookup = True
    end
  end
end
