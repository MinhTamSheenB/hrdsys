object FormHrd24: TFormHrd24
  Left = 367
  Top = 151
  Width = 794
  Height = 504
  Caption = 'FormHrd24'
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
      Caption = 'hrd24_titl'
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
          object lblemp: TTntLabel
            Left = 107
            Top = 89
            Width = 80
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
          object Label1: TLabel
            Left = 0
            Top = 186
            Width = 800
            Height = 3
            AutoSize = False
            Color = clBackground
            ParentColor = False
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
            TabOrder = 1
            OnClick = BtnPrintClick
          end
          object BtnPreview: TTntButton
            Left = 152
            Top = 208
            Width = 75
            Height = 25
            Caption = #25171#21360#38928#35261
            TabOrder = 0
            OnClick = BtnPrintClick
          end
          object edtEmp: TTntEdit
            Left = 193
            Top = 86
            Width = 121
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = #20013#25991' - QQ'#25340#38899'?'#20837#27861
            MaxLength = 6
            ParentFont = False
            TabOrder = 2
          end
        end
      end
      object mmo1: TTntMemo
        Left = 560
        Top = 192
        Width = 209
        Height = 241
        Lines.Strings = (
          'C'#212'NG TY TNHH SHEEN BRIDGE'
          'C'#7897'ng H'#242'a X'#227' H'#7897'i Ch'#7911' Ngh'#297'a Vi'#7879't Nam'
          'X'#227' T'#226'n Kim, Huy'#7879'n C'#7847'n Giu'#7897'c, T'#7881'nh Long An'
          #272#7897'c l'#7853'p '#8211' T'#7921' do '#8211' H'#7841'nh ph'#250'c'
          'S'#7889':             -2016/Q'#272'TV-SHEEN BRIDGE'
          'Long An, ng'#224'y '
          'th'#225'ng '
          'n'#259'm '
          'QUY'#7870'T '#272#7882'NH'
          'V/v: Ch'#7845'm d'#7913't h'#7907'p '#273#7891'ng lao '#273#7897'ng'
          
            '         -     C'#259'n c'#7913' v'#224'o B'#7897' Lu'#7853't Lao '#273#7897'ng N'#432#7899'c CHXHCN Vi'#7879't Nam;' +
            ' '
          
            '         -     C'#259'n c'#7913' v'#224'o Lu'#7853't B'#7843'o hi'#7875'm X'#227' h'#7897'i N'#432#7899'c CHXHCN Vi'#7879't ' +
            'Nam; '
          
            '         -     C'#259'n c'#7913' v'#224'o Gi'#7845'y Ch'#7913'ng nh'#7853'n '#272#7847'u t'#432' s'#7889' 501043000112' +
            ' do UBND T'#7881'nh Long An c'#7845'p ng'#224'y'
          '               20/06/2008;'
          
            '         -     C'#259'n c'#7913' v'#224'o ch'#7913'c n'#259'ng v'#224' quy'#7873'n h'#7841'n c'#7911'a Gi'#225'm '#273#7889'c C'#244 +
            'ng ty TNHH SHEEN BRIDGE;'
          '         -     C'#259'n c'#7913' '#272#417'n xin th'#244'i vi'#7879'c c'#7911'a nh'#226'n s'#7921'; v'#7853'y nay:'
          'GI'#193'M '#272#7888'C C'#212'NG TY TNHH SHEEN BRIDGE'
          'QUY'#7870'T '#272#7882'NH'
          #272'i'#7873'u 1:  '
          'Ch'#7845'p thu'#7853'n gi'#7843'i quy'#7871't th'#244'i vi'#7879'c '#273#7889'i v'#7899'i '#212'ng/B'#224':'
          '-  Ng'#224'y sinh:'
          '-  S'#7889' CMND: '
          'Ng'#224'y c'#7845'p: '
          'N'#417'i c'#7845'p: '
          '-  S'#7889' th'#7867': '
          'B'#7897' ph'#7853'n c'#244'ng t'#225'c:'
          '-  K'#7875' t'#7915' ng'#224'y: '
          '-  L'#253' do: '
          #272'i'#7873'u 2:  '
          #212'ng/B'#224':'
          'c'#243' quy'#7873'n l'#7907'i v'#224' tr'#225'ch nhi'#7879'm sau:'
          '2.1.  '
          'Quy'#7873'n l'#7907'i:'
          
            '              - '#272#432#7907'c h'#432#7903'ng l'#432#417'ng v'#224' ph'#7909' c'#7845'p theo s'#7889' ng'#224'y th'#7921'c t'#7871 +
            ' l'#224'm vi'#7879'c theo b'#7843'ng ch'#7845'm c'#244'ng;'
          
            '              - '#272#432#7907'c h'#432#7903'ng tr'#7907' c'#7845'p th'#244'i vi'#7879'c, tr'#7907' c'#7845'p BHXH theo ' +
            'lu'#7853't BHXH hi'#7879'n h'#224'nh.'
          '2.2.  '
          'Tr'#225'ch nhi'#7879'm:'
          
            '              - B'#224'n giao c'#244'ng vi'#7879'c, h'#7891' s'#417', t'#224'i li'#7879'u v'#224' trang thi' +
            #7871't b'#7883' '#273'ang s'#7917' d'#7909'ng cho c'#7845'p qu'#7843'n l'#253' tr'#7921'c ti'#7871'p ho'#7863'c'
          '                ng'#432#7901'i thay th'#7871';'
          
            '              - Thanh to'#225'n h'#7871't c'#225'c kho'#7843'n n'#7907' v'#224' t'#7841'm '#7913'ng tr'#432#7899'c v'#224' ' +
            'sau khi th'#244'i vi'#7879'c (n'#7871'u c'#243').'
          #272'i'#7873'u 3: '
          
            'B'#7897' ph'#7853'n Nh'#226'n s'#7921', pho'#768'ng T'#224'i v'#7909', ca'#769'c B'#244#803' ph'#226#803'n li'#234'n quan va'#768' '#212'ng' +
            '/B'#224':'
          ''
          
            '             ch'#7883'u tr'#225'ch nhi'#7879'm thi h'#224'nh quy'#7871't '#273#7883'nh n'#224'y. Quy'#7871't '#273#7883'n' +
            'h c'#243' hi'#7879'u l'#7921'c k'#7875' t'#7915' ng'#224'y k'#253'.'
          'N'#417'i nh'#7853'n:'
          'C'#212'NG TY TNHH SHEEN BRIDGE'
          
            '      -  Nh'#432' '#272'i'#7873'u 3 ('#273#7875' th'#7921'c hi'#7879'n);                             ' +
            '                                      '
          'GI'#193'M '#272#7888'C'
          '      -  L'#432'u VT'
          'FANG CHIEN YAO')
        TabOrder = 1
        Visible = False
        WordWrap = False
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
  end
end
