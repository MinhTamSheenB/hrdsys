{*************************************************************************
Name：Prtfhrd314(職薪異動通知單)
Author: tim
Create date:2011-12-14
Modify date:2011-12-14
Commentate:職薪異動通知單
*************************************************************************}
unit uPrtFhrd314;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls;

type
  TFormPrtFhrd314 = class(TForm)
    QuickRep1: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    PageHeaderBand1: TQRBand;
    Label_titleA1: TQRLabel;
    Label_titleA2: TQRLabel;
    RBCtitleB: TQRChildBand;
    RBCtitleC: TQRChildBand;
    QRLabel19: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel62: TQRLabel;
    QRShape4: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape14: TQRShape;
    QRShape17: TQRShape;
    QRShape19: TQRShape;
    QRShape21: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRShape34: TQRShape;
    QRLabel10: TQRLabel;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    qrl_rea00: TQRLabel;
    qrl_rea05: TQRLabel;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel63: TQRLabel;
    qrl_rea01: TQRLabel;
    qrl_rea06: TQRLabel;
    qrl_rea02: TQRLabel;
    qrl_rea07: TQRLabel;
    qrl_rea03: TQRLabel;
    qrl_rea08: TQRLabel;
    qrl_rea04: TQRLabel;
    qrl_rea09: TQRLabel;
    db_pre_01: TQRDBText;
    db_new_01: TQRDBText;
    db_pre_02: TQRDBText;
    db_new_02: TQRDBText;
    db_pre_03: TQRDBText;
    db_new_03: TQRDBText;
    db_pre_04: TQRDBText;
    db_new_04: TQRDBText;
    db_pre_05: TQRDBText;
    db_new_05: TQRDBText;
    db_pre_06: TQRDBText;
    db_new_06: TQRDBText;
    QRShape26: TQRShape;
    QRLabel26: TQRLabel;
    QRLabel81: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel55: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRDBText15: TQRDBText;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel79: TQRLabel;
    QRLabel80: TQRLabel;
    QRLabel82: TQRLabel;
    QRLabel83: TQRLabel;
    QRLabel84: TQRLabel;
    QRLabel85: TQRLabel;
    QRLabel86: TQRLabel;
    QRLabel87: TQRLabel;
    QRLabel88: TQRLabel;
    QRLabel89: TQRLabel;
    QRShape7: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape18: TQRShape;
    QRShape20: TQRShape;
    QRShape22: TQRShape;
    QRShape33: TQRShape;
    QRLabel90: TQRLabel;
    QRLabel91: TQRLabel;
    QRLabel92: TQRLabel;
    QRLabel93: TQRLabel;
    QRShape44: TQRShape;
    QRLabel94: TQRLabel;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    qrl_2rea00: TQRLabel;
    qrl_2rea05: TQRLabel;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
    QRShape49: TQRShape;
    QRShape50: TQRShape;
    QRShape51: TQRShape;
    QRShape52: TQRShape;
    QRShape53: TQRShape;
    QRLabel97: TQRLabel;
    QRLabel98: TQRLabel;
    QRLabel99: TQRLabel;
    QRLabel100: TQRLabel;
    QRLabel101: TQRLabel;
    QRLabel102: TQRLabel;
    QRLabel103: TQRLabel;
    QRLabel104: TQRLabel;
    QRLabel105: TQRLabel;
    QRLabel106: TQRLabel;
    qrl_2rea01: TQRLabel;
    qrl_2rea06: TQRLabel;
    qrl_2rea02: TQRLabel;
    qrl_2rea07: TQRLabel;
    qrl_2rea03: TQRLabel;
    qrl_2rea08: TQRLabel;
    qrl_2rea04: TQRLabel;
    qrl_2rea09: TQRLabel;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRShape54: TQRShape;
    QRShape55: TQRShape;
    QRShape56: TQRShape;
    QRDBText28: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrtFhrd314: TFormPrtFhrd314;

implementation
uses
  UFhrd314;
{$R *.dfm}

end.
