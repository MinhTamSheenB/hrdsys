unit uFhrd306ReportA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, StdCtrls, TntStdCtrls, DB, ADODB, QRCtrls;

type
  TFhrd306ReportA = class(TForm)
    Fhrd306QRep: TQuickRep;
    DetailBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    QRLabel19: TQRLabel;
    QRLabel21: TQRLabel;
    TitleBand1: TQRBand;
    QRShape2: TQRShape;
    QRShape6: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape3: TQRShape;
    QRShape5: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel11: TQRLabel;
    QRShape1: TQRShape;
    QRShape4: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    ColumnHeaderBand1: TQRBand;
    QRShape25: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel77: TQRLabel;
    QRDBText1: TQRDBText;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRShape59: TQRShape;
    QRShape60: TQRShape;
    SummaryBand1: TQRBand;
    QRLabel117: TQRLabel;
    QRLabel120: TQRLabel;
    QRLabel123: TQRLabel;
    QRLabel124: TQRLabel;
    QRLabel125: TQRLabel;
    QRLabel126: TQRLabel;
    QRLabel127: TQRLabel;
    QRLabel128: TQRLabel;
    QRLabel129: TQRLabel;
    QRLabel130: TQRLabel;
    QRLabel131: TQRLabel;
    QRLabel132: TQRLabel;
    QRLabel118: TQRLabel;
    QRLabel121: TQRLabel;
    QRLabel119: TQRLabel;
    QRLabel122: TQRLabel;
    QRShape55: TQRShape;
    QRShape56: TQRShape;
    QRShape57: TQRShape;
    QRShape58: TQRShape;
    QRShape52: TQRShape;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRShape51: TQRShape;
    QRLabel103: TQRLabel;
    QRLabel133: TQRLabel;
    QRLabel108: TQRLabel;
    QRLabel143: TQRLabel;
    QRLabel104: TQRLabel;
    QRLabel134: TQRLabel;
    QRLabel109: TQRLabel;
    QRLabel141: TQRLabel;
    QRLabel105: TQRLabel;
    QRLabel135: TQRLabel;
    QRLabel110: TQRLabel;
    QRLabel140: TQRLabel;
    QRLabel106: TQRLabel;
    QRLabel136: TQRLabel;
    QRLabel111: TQRLabel;
    QRLabel139: TQRLabel;
    QRLabel107: TQRLabel;
    QRLabel137: TQRLabel;
    QRLabel112: TQRLabel;
    QRLabel138: TQRLabel;
    QRShape46: TQRShape;
    QRShape42: TQRShape;
    QRShape47: TQRShape;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRShape49: TQRShape;
    QRShape45: TQRShape;
    QRShape50: TQRShape;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRLabel113: TQRLabel;
    QRLabel144: TQRLabel;
    QRLabel145: TQRLabel;
    QRLabel114: TQRLabel;
    QRLabel146: TQRLabel;
    QRLabel147: TQRLabel;
    QRLabel115: TQRLabel;
    QRLabel148: TQRLabel;
    QRLabel149: TQRLabel;
    QRLabel116: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRShape48: TQRShape;
    QRShape61: TQRShape;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel29: TQRLabel;
    QRShape10: TQRShape;
    QRLabel16: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel41: TQRLabel;
    QRShape9: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel35: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fhrd306ReportA: TFhrd306ReportA;

implementation

uses
  uFhrd306;
{$R *.dfm}


end.
