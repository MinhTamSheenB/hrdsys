unit uFhrd307ReportB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, StdCtrls, TntStdCtrls, DB, ADODB, QRCtrls;

type
  TFhrd307ReportB = class(TForm)
    Fhrd307QRep: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    ColumnHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    TitleBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    PageFooterBand1: TQRBand;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
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
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel65: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    std_sal: TQRLabel;
    QRDBText10: TQRDBText;
    nightprice: TQRLabel;
    realSal: TQRLabel;
    procedure QRLabel68Print(sender: TObject; var Value: WideString);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fhrd307ReportB: TFhrd307ReportB;

implementation

uses
  uFhrd307;

{$R *.dfm}


procedure TFhrd307ReportB.QRLabel68Print(sender: TObject;
  var Value: WideString);
begin
  //QRLabel68.Caption := IntToStr(Fhrd307Qrep.PageNumber);
end;

procedure TFhrd307ReportB.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  {std_sal.Caption :=
  FloatToStr(strToFloat(QRDBText5.DataSet.FieldValues['sal_bas'])+
  strToFloat(QRDBText5.DataSet.FieldValues['sal_frn'])+
  strToFloat(QRDBText5.DataSet.FieldValues['fix_add'])+
  strToFloat(QRDBText5.DataSet.FieldValues['f_award']));
  nightprice.Caption :=
  FloatToStr(strToFloat(QRDBText5.DataSet.FieldValues['night1_price'])+
  strToFloat(QRDBText5.DataSet.FieldValues['night2_price'])+
  strToFloat(QRDBText5.DataSet.FieldValues['night3_price']));
  realSal.Caption :=
  FloatToStr(strToFloat(std_sal.Caption)+
  strToFloat(nightprice.Caption)+
  strToFloat(QRDBText5.DataSet.FieldValues['dinner_price']));}
end;

end.
