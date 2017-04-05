{******************************************************************************
name：fhrd307(薪資查詢)
author: tristan
create date:2005-08-23
commentate:薪資查詢
*******************************************************************************}

unit uFhrd307;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, TntStdCtrls, ExtCtrls, TntExtCtrls, Grids,
  DBGrids, TntDBGrids, Buttons, TntButtons, DBCtrls, DB,StrUtils,WSDLIntf,
  Mask, TntDbCtrls, ComCtrls,TntComCtrls, ADODB,tntDialogs, DateUtils,
  TntGrids, CheckLst, TntCheckLst, TntDB;

type
  TFormfhrd307 = class(TForm)
    TntPanel1: TTntPanel;
    TntGroupBox1: TTntGroupBox;
    TntLabel1: TTntLabel;
    month: TTntEdit;
    deptBegCob: TTntComboBox;
    deptEndCob: TTntComboBox;
    empIdBeg: TTntEdit;
    empIdEnd: TTntEdit;
    selectData: TTntBitBtn;
    prnData: TTntBitBtn;
    TntGroupBox2: TTntGroupBox;
    salaryQry: TADOQuery;
    salaryDataSource: TDataSource;
    salGrid: TTntDBGrid;
    salaryQrysal_month: TWideStringField;
    salaryQryemp_id: TWideStringField;
    salaryQrypst_code: TStringField;
    salaryQrydept_code: TStringField;
    salaryQrysal_bas: TBCDField;
    salaryQrysal_frn: TBCDField;
    salaryQryf_award: TBCDField;
    salaryQryadjust: TBCDField;
    salaryQryactu_sal: TBCDField;
    salaryQrylocal_amt: TBCDField;
    salaryQrybank_sal: TBCDField;
    salaryQryemp_name: TStringField;
    salaryQryemp_etdt: TDateTimeField;
    salaryQryemp_gvdt: TDateTimeField;
    salaryQrydept_name: TStringField;
    salaryQrypst_name: TStringField;
    salaryQrynight_amt: TBCDField;
    PrintPanel: TTntPanel;
    totalBill: TTntRadioButton;
    salaryBill: TTntRadioButton;
    nightBill: TTntRadioButton;
    TntLabel6: TTntLabel;
    TntLabel10: TTntLabel;
    salaryQryask_pay: TBCDField;
    salaryQrydinner_price: TBCDField;
    salaryQrynight1_price: TBCDField;
    salaryQrynight2_price: TBCDField;
    salaryQrynight3_price: TBCDField;
    salaryQrynight1_duty: TBCDField;
    salaryQrynight2_duty: TBCDField;
    salaryQrynight3_duty: TBCDField;
    salaryQryactu_usd: TFloatField;
    TntLabel2: TTntLabel;
    TntEdit1: TTntEdit;
    salaryQrylocal_uamt: TFloatField;
    salaryQrybank_usal: TFloatField;
    salaryQryfix_add: TFloatField;
    TntSaveDialog1: TTntSaveDialog;

    // user create function and procedure

    procedure InitLang;

    // system create proceudre

    procedure FormCreate(Sender: TObject);
    procedure selectDataClick(Sender: TObject);
    procedure salaryGridTitleClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure prnDataClick(Sender: TObject);
    procedure PrintPanelClick(Sender: TObject);
    procedure salGridTitleClick(Column: TColumn);
    procedure salaryQryAfterScroll(DataSet: TDataSet);
    procedure salaryQryCalcFields(DataSet: TDataSet);
     procedure PrintTot;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formfhrd307: TFormfhrd307;

implementation

uses
  UnitHrdUtils,unitDMHrdsys,UnitHrdMain,uFhrd307Report,uFhrd307ReportA, COMOBJ;

{$R *.dfm}

{***定義全局變量***}
var
  g_sLangStr : TWideStrings;

{*****************************************
Name: InitLang
Func: 初始化語言變量
Args:
    sKeys->語言變量
*****************************************}

procedure TFormfhrd307.InitLang;
var
  sKeys : string;
begin
  SetComponentLang(self);//set component language text
  sKeys:='fhrd307,emp_id,fld_department,button_query,fhrd104_condition,'+
  'print,quit,browsedata,c_name,sal_bas,sal_frn,local_amt,month,msg_set_dept,'+
  'msg_cho_dept,msg_empid_null,msg_month_null,confirm_close,dut03_dateerror,'+
  'fld_emp_name,fld_s_start,off_duty_time,msg_query_error,'+
  'fix_add,f_award,adjust,lnight_duty,lnight_price,fld_department,position,'+
  'snight_duty,snight_price,msg_no_record,fld_epindt,fld_emp_gvdt,'+
  'anight_duty,anight_price,dinnerPrice,current_location,current_emp_id,total,';

  g_sLangStr:=GetLangWideStrs(sKeys);

  TntPanel1.Caption:=GetLangName(g_sLangStr,'fhrd307');
  TntLabel1.Caption := GetLangName(g_sLangStr,'month');
  prnData.Caption := GetLangName(g_sLangStr,'print');
  selectData.Caption := GetLangName(g_sLangStr,'button_query');
  TntGroupBox1.Caption:=GetLangName(g_sLangStr,'fhrd104_condition');
  TntGroupBox2.Caption:=GetLangName(g_sLangStr,'browsedata');
end;

procedure TFormfhrd307.FormCreate(Sender: TObject);
begin
  InitLang;
  GetDeptRange(deptBegCob);
  GetDeptRange(deptEndCob);
  Month.Text:=formatDateTime('yyyymm',date-25);
  {Application.CreateForm(TFhrd307Report,Fhrd307Report);
  Application.CreateForm(TFhrd307ReportA,Fhrd307ReportA);
  Application.CreateForm(TFhrd307ReportB,Fhrd307ReportB);}
end;

{*****************************************
Name: selectDataClick
Func: 查詢薪資
Args:
    sSelStr->查詢語句
*****************************************}

procedure TFormfhrd307.selectDataClick(Sender: TObject);
var
  sSelStr, sql, a : string;
  lcYear,lcMonth : Integer;
  CurrRate:double;
begin
  if month.Text='' then
  begin
    widemessagedlg(GetLangName(g_sLangStr,'msg_month_null'),mtError,[mbyes],1);
    month.SetFocus;
    exit;
  end
  else
  begin
    Currrate:= 1;
    sql := 'select *from fhrd_sal_rate where sal_mon =''' +month.Text  + '''' ;
    DMHrdsys.SQLQuery3.SQL.Clear ;
    DMHrdsys.SQLQuery3.SQL.Add( sql ) ;
    DMHrdsys.SQLQuery3.Open ;
    if month.Text >'200804'  then
       begin
         if DMHrdsys.SQLQuery3.Eof then
            begin
              showmessage('沒找到該月匯率， 請先輸入 '  +  month.Text  + '月匯率 ????') ;
              exit ;
            end
          else
             CurrRate := DMHrdsys.SQLQuery3.fieldbyname('sal_rate').AsFloat ;
             tntedit1.Text := floattostr( Currrate )  ;
       end;
   // else
    //  CurrRate := 1 ;
    if length(month.Text )<>6 then
    begin
      widemessagedlg(GetLangName(g_sLangStr,'dut03_dateerror'),mtError,[mbyes],1);
      exit;
    end;
    try
      lcYear:=StrToInt(LeftStr(month.Text,4));
      lcMonth:=StrToInt(RightStr(month.Text,2));
    except
      exit;
    end;
    if (lcMonth>12) or (lcMonth<1) or (lcYear>2100) or (lcYear<1900) then
    begin
      widemessagedlg(GetLangName(g_sLangStr,'dut03_dateerror'),mtError,[mbyes],1);
      exit;
    end;
 // end;
     if month.Text <= '200804'  then
       begin

      sSelStr := 'select *, ( a.actu_sal/1 ) as actu_usd, local_amt as local_uamt, bank_amt as bank_usal  from fhrd_salary A, fhrd_emp as b where A.sal_month='''+month.Text+'''';
      if trim(empIdBeg.Text)<>'' then
        sSelStr := sSelStr+' and A.emp_id>='''+empIdBeg.Text+'''';
      if trim(empIdEnd.Text)<>'' then
        sSelStr := sSelStr+' and A.emp_id<='''+empIdEnd.Text+'''';
      if trim(deptBegCob.Text)<>'' then
        sSelStr := sSelStr+' and A.dept_code>='''+LeftStr(deptBegCob.Text,6)+'''';
      if trim(deptEndCob.Text)<>'' then
        sSelStr := sSelStr+' and A.dept_code<='''+LeftStr(deptEndCob.Text,6)+'''';
      sSelStr := sSelStr+' and a.emp_id=b.emp_id and b.emp_info =''0''  order by A.dept_code,A.emp_id';
      end
     else
        begin
        sSelStr := 'select *, round( ( a.actu_sal/c.sal_rate ),2 ) as actu_usd, (local_amt/7.5 ) as local_uamt, ( round( ( a.actu_sal/c.sal_rate ),2 )-(local_amt/7.5 ) )   as bank_usal  from fhrd_salary A, fhrd_emp as b, fhrd_sal_rate as c  where A.sal_month='''+month.Text+'''';
      if trim(empIdBeg.Text)<>'' then
        sSelStr := sSelStr+' and A.emp_id>='''+empIdBeg.Text+'''';
      if trim(empIdEnd.Text)<>'' then
        sSelStr := sSelStr+' and A.emp_id<='''+empIdEnd.Text+'''';
      if trim(deptBegCob.Text)<>'' then
        sSelStr := sSelStr+' and A.dept_code>='''+LeftStr(deptBegCob.Text,6)+'''';
      if trim(deptEndCob.Text)<>'' then
        sSelStr := sSelStr+' and A.dept_code<='''+LeftStr(deptEndCob.Text,6)+'''';
      sSelStr := sSelStr+' and c.sal_mon=''' + month.Text +'''   and a.emp_id=b.emp_id and b.emp_info =''0''  order by A.dept_code,A.emp_id'
     end;
  try
    with salaryQry do
    begin
      close;
      sql.Clear;
      sql.Add(sSelStr);
      open;
      prnData.Enabled := true;
      if RecordCount<=0 then
      begin
        widemessagedlg(GetLangName(g_sLangStr,'msg_no_record'),mtError,[mbyes],1);
      //  prnData.Enabled := false;
      end;
    end;
  except
    widemessagedlg(GetLangName(g_sLangStr,'msg_query_error'),mtError,[mbyes],1);
  end;
 end;

end;

procedure TFormfhrd307.salaryGridTitleClick(Column: TColumn);
begin
  DBGridSortByTitle(Column);
end;

procedure TFormfhrd307.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= caFree;
end;

procedure TFormfhrd307.prnDataClick(Sender: TObject);
var
  tmpFindForm:TComponent;
begin
  if totalBill.Checked then
  begin
   PrintTot ;
    //ShowPrint(salaryQry,'大陸員工薪資匯總');
    {tmpFindForm:=application.FindComponent('Fhrd307ReportB');
    if tmpFindForm=nil then
      Application.CreateForm(TFhrd307ReportB, Fhrd307ReportB);
    Fhrd307ReportB.QRLabel21.Caption := FormatDateTime('yyyy/mm',Date);
    Fhrd307ReportB.QRLabel24.Caption := DateTostr(Date);
    Fhrd307ReportB.Fhrd307QRep.Prepare;
    Fhrd307ReportB.Fhrd307QRep.Preview;}
  end;
  if SalaryBill.Checked then
  begin
    tmpFindForm:=application.FindComponent('Fhrd307ReportA');
    if tmpFindForm=nil then
      Application.CreateForm(TFhrd307ReportA, Fhrd307ReportA);
    Fhrd307ReportA.Fhrd307QRep.Preview;
  end;
  if NightBill.Checked then
  begin
    tmpFindForm:=application.FindComponent('Fhrd307Report');
    if tmpFindForm=nil then
      Application.CreateForm(TFhrd307Report, Fhrd307Report);
    PrintPanel.Visible := false;
    Fhrd307Report.QRLabel21.Caption := FormatDateTime('yyyy/mm',Date);
    Fhrd307Report.QRLabel24.Caption := DateTostr(Date);
    Fhrd307Report.Fhrd307QRep.Prepare;
    Fhrd307Report.Fhrd307QRep.Preview;
  end;
end;

procedure TFormfhrd307.PrintPanelClick(Sender: TObject);
begin
  printPanel.Visible := false;
end;

procedure TFormfhrd307.salGridTitleClick(Column: TColumn);
begin
  DBGridSortByTitle(column);//點擊表格標頭改變排序方式
end;

procedure TFormfhrd307.salaryQryAfterScroll(DataSet: TDataSet);
var
  AText:string;
begin
with DataSet do
  AText:=GetLangName(g_sLangStr,'current_location')+':'+inttostr(RecNo)+'; '
    +GetLangName(g_sLangStr,'total')+':'+inttostr(RecordCount)+'; '
    +GetLangName(g_sLangStr,'cur_emp_id')+':'+FieldByName('emp_id').AsString;
  setStatusText(AText);
end;

procedure TFormfhrd307.salaryQryCalcFields(DataSet: TDataSet);
var
  sqlstr,key:string;
begin
  key:=DataSet.FieldByName('emp_id').AsString;
  sqlstr:='select * from fhrd_emp where emp_id='''+key+'''';
  with DMHrdsys.SQLQuery3 do
  begin
    close;
    sql.Clear;
    sql.Add(sqlstr);
    Open;
    if not Eof then
    begin
      DataSet.FieldByName('emp_name').AsString:=FieldByName('emp_name').AsString;
      DataSet.FieldByName('emp_etdt').AsString:=FieldByName('emp_etdt').AsString;
      DataSet.FieldByName('emp_gvdt').AsString:=FieldByName('emp_gvdt').AsString;
    end;
  end;
  key:=DataSet.FieldByName('dept_code').AsString;
  sqlstr:='select * from hrd_dept where dept_code='''+key+'''';
  with DMHrdsys.SQLQuery3 do
  begin
    close;
    sql.Clear;
    sql.Add(sqlstr);
    Open;
    if not Eof then
    begin
      DataSet.FieldByName('dept_name').AsString:=FieldByName('abbr_titl').AsString;
    end;
  end;
  key:=DataSet.FieldByName('pst_code').AsString;
  sqlstr:='select * from hrd_prof where pst_code='''+key+'''';
  with DMHrdsys.SQLQuery3 do
  begin
    close;
    sql.Clear;
    sql.Add(sqlstr);
    Open;
    if not Eof then
    begin
      DataSet.FieldByName('pst_name').AsString:=FieldByName('pst_chs').AsString;
    end;
  end;
end;
procedure TFormfhrd307.PrintTot;
var
  MSExcel:Variant;
  i,j:integer;
  clSql, clmonth,s :string;
  nlSum :real;
begin


  TntSaveDialog1.Filter:='*.xls|*.xls';
  tntSaveDialog1.DefaultExt:='xls';
  if tntSaveDialog1.Execute then
  begin
    MsExcel:=createOLEobject('excel.application');
    MsExcel.workBooks.add;
    Msexcel.visible:=true;

         Msexcel.cells[1,1].value:='月份';
         Msexcel.cells[1,2].value:='工號';
         Msexcel.cells[1,3].value:='姓名';
         Msexcel.cells[1,4].value:='職稱代號';
         Msexcel.cells[1,5].value:='職稱';
         Msexcel.cells[1,6].value:='部門代號';
         Msexcel.cells[1,7].value:='部門';
         Msexcel.cells[1,8].value:='進廠日期';
         Msexcel.cells[1,9].value:='赴越日期';
         Msexcel.cells[1,10].value:='本薪';
         Msexcel.cells[1,11].value:='海外津貼';
         Msexcel.cells[1,12].value:='全勤獎';
         Msexcel.cells[1,13].value:='固定加班';
         Msexcel.cells[1,14].value:='調整';
         Msexcel.cells[1,15].value:='請假扣款';
         Msexcel.cells[1,16].value:='夜班津貼';
         Msexcel.cells[1,17].value:='夜點餐補';
         Msexcel.cells[1,18].value:='實際薪資';
         Msexcel.cells[1,19].value:='零用金';
         Msexcel.cells[1,20].value:='轉賬金額';
         Msexcel.cells[1,21].value:='小夜班(8h)額';
         Msexcel.cells[1,22].value:='大夜班(8h)額';
         Msexcel.cells[1,23].value:='大夜班(12h)額';
         Msexcel.cells[1,24].value:='小夜班(8h)時';
         Msexcel.cells[1,25].value:='大夜班(8h)時';
         Msexcel.cells[1,26].value:='大夜班(12h)時';
         Msexcel.cells[1,27].value:='零用金（USD）';
         Msexcel.cells[1,28].value:='轉賬薪資（USD）';

         s := 'A'+inttostr( 1 ) + ':AC'+inttostr( 1 );
         Msexcel.worksheets[1].Range[s].Borders.LineStyle := 1;
         Msexcel.worksheets[1].range['A1:AC1'].font.bold:=true;
         MsExcel.worksheets[1].Columns[1].ColumnWidth := 15;
         MsExcel.worksheets[1].Columns[2].ColumnWidth := 10;
         MsExcel.worksheets[1].Columns[3].ColumnWidth := 10;
         MsExcel.worksheets[1].Columns[4].ColumnWidth := 10;
         MsExcel.worksheets[1].Columns[5].ColumnWidth := 10;
         MsExcel.worksheets[1].Columns[6].ColumnWidth := 10;
         MsExcel.worksheets[1].Columns[7].ColumnWidth := 10;
         MsExcel.worksheets[1].Columns[8].ColumnWidth := 10;
         MsExcel.worksheets[1].Columns[9].ColumnWidth := 15;
         MsExcel.worksheets[1].Columns[10].ColumnWidth := 10;
         MsExcel.worksheets[1].Columns[11].ColumnWidth := 10;
         MsExcel.worksheets[1].Columns[12].ColumnWidth := 10;
         MsExcel.worksheets[1].Columns[13].ColumnWidth := 10;
         MsExcel.worksheets[1].Columns[14].ColumnWidth := 10;
         MsExcel.worksheets[1].Columns[15].ColumnWidth := 10;
         MsExcel.worksheets[1].Columns[16].ColumnWidth := 10;
         MsExcel.worksheets[1].Columns[17].ColumnWidth := 15;
         MsExcel.worksheets[1].Columns[18].ColumnWidth := 10;
         MsExcel.worksheets[1].Columns[19].ColumnWidth := 10;
         MsExcel.worksheets[1].Columns[20].ColumnWidth := 10;
         MsExcel.worksheets[1].Columns[21].ColumnWidth := 10;
         MsExcel.worksheets[1].Columns[22].ColumnWidth := 10;
         MsExcel.worksheets[1].Columns[23].ColumnWidth := 10;
         MsExcel.worksheets[1].Columns[24].ColumnWidth := 10;
         MsExcel.worksheets[1].Columns[25].ColumnWidth := 15;
         MsExcel.worksheets[1].Columns[26].ColumnWidth := 10;
         MsExcel.worksheets[1].Columns[27].ColumnWidth := 10;
         MsExcel.worksheets[1].Columns[28].ColumnWidth := 10;
    j:=2;
    salaryQry.First;
    while not salaryQry.eof do
      begin

        for i:=0 to salaryQry.fieldcount-1 do
        begin
         // Msexcel.cells[j,i+1].numberformat:='@';
         // if salaryQry.fields[i].AsVariant >0 then
             Msexcel.cells[j,i+1].value:=salaryQry.fields[i].AsVariant
        //  else
         //    Msexcel.cells[j,i+1].value:=0  ;
        end;
        s := 'A'+inttostr( j ) + ':AC'+inttostr( j ) ;

        Msexcel.worksheets[1].Range[s].Borders.LineStyle := 1;
        MsExcel.worksheets[1].Range[s].Font.Size := 10;
        inc(j);
        salaryQry.next;
      end;

    end;
    MSExcel.ActiveWorkBook.SaveAs(tntSaveDialog1.FileName);
    MSExcel.ActiveWorkBook.Saved:=True;
    MSExcel.Quit;
    showmessage( 'Save Excel OK !!!!! ' ) ;
 end;
end.
