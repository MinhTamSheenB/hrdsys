unit uFhrd313;

interface

uses
 Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, TntDbCtrls, ExtCtrls, Grids, DBGrids, TntDBGrids,
  StdCtrls, Buttons, TntButtons, TntStdCtrls, TntExtCtrls, ComCtrls,DateUtils,
  TntDB, DB, ADODB,TntComCtrls,WSDLIntf,TntDialogs,strutils, Qt;


type
  TFormFhrd313 = class(TForm)
    Panel1: TPanel;
    PanelTitle: TTntPanel;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    TntDBGrid1: TTntDBGrid;
    TntPanel1: TTntPanel;
    ADOQuery2: TADOQuery;
    Panel2: TPanel;
    TntBitBtn1: TTntBitBtn;
    pay_mon: TTntEdit;
    TntLabel1: TTntLabel;
    pay_rate: TTntEdit;
    TntLabel3: TTntLabel;
    TntLabel4: TTntLabel;
    procedure FormShow(Sender: TObject);
    procedure TntBitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure InitLang;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormFhrd313: TFormFhrd313;

implementation
uses
  UnitHrdUtils,unitDMHrdsys;
var
  Langstr:TWideStrings;//語言字符串
  pri_arr:TPrvArr;//權限數組
{$R *.dfm}

procedure TFormFhrd313.FormShow(Sender: TObject);
begin
  adoQuery1.SQL.Clear ;
  adoQuery1.SQL.Add( 'select sal_mon, sal_rate from fhrd_sal_rate ') ;
  adoQuery1.Open ;
  
end;

procedure TFormFhrd313.TntBitBtn1Click(Sender: TObject);
var
  sql :string ;
begin
  if ( pay_mon.Text = '' ) or ( pay_rate.Text = '')  then
     begin
        showmessage('請輸入月份和匯率 !! ') ;
     end
  else
    begin
  if messagedlg('確認要保存嗎？', mtcustom,[mbyes,mbno],0)=mryes  then
     begin
       sql := 'select *from fhrd_sal_rate where sal_mon =''' +pay_mon.Text  + '''' ;
       adoQuery2.SQL.Clear ;
       adoQuery2.SQL.Add( sql ) ;
       adoQuery2.Open ;
       if adoQuery2.Eof then
          begin
            adoQuery2.Open ;
            adoQuery2.Append ;
            adoQuery2.FieldByName('up_user').Value:=username;
            adoQuery2.FieldByName('up_date').AsDateTime:=GetServerDatetime;
            adoQuery2.FieldByName('sal_mon').AsString  := pay_mon.Text ;
            adoQuery2.FieldByName('sal_rate').AsFloat := strtofloat( pay_rate.text ) ;
            adoQuery2.Post ;
            adoQuery1.Close ;
            adoQuery1.Open ;
          end
       else
          showmessage('該月匯率已存在 !! ') ;

  end;
  end;
end;

procedure TFormFhrd313.FormCreate(Sender: TObject);
begin
  pri_arr:=GetPrvArr(username,'fhrd313');
 // SetActEnabled(false);
  InitLang;// Init language
 // InitForm;// Init Form
end;
procedure TFormFhrd313.InitLang;
{*************************************************************************
TO DO:初始化語言
*************************************************************************}
var
  keys:String;
  i:integer;
  GetCpt:TComponent;
begin
keys:='supply_again,deduct_money,date,month,fld_department,not_find_data,'
  +'query,print,update,save,cancel,search_condition,hrd09_error1,msg_month_error'
  +'total,current_location,is_valid,choose_all,choose_none,'
  +'msg_confirm_save,msg_confirm_cancel,msg_save_modify_data,'
  +'total,current_location,';
LangStr:=GetLangWideStrs(keys);
SetComponentLang(self);

end;


end.
