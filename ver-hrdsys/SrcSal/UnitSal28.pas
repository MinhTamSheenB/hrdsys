unit UnitSal28;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, TntDbCtrls, ExtCtrls, Grids, DBGrids, TntDBGrids,
  StdCtrls, Buttons, TntButtons, TntStdCtrls, TntExtCtrls, ComCtrls,
  TntComCtrls,WSDLIntf, DB, ADODB,TntDialogs,strutils, TntDB,Qt, QuickRpt,
  DBClient,excel97,excel2000, Provider,DateUtils,math;
type
  TExcelThread = class(TThread)
  protected
        procedure execute;override;
  end;
  TFormSal28 = class(TForm)
    TntPageControl1: TTntPageControl;
    Panel1: TPanel;
    PanelTitle: TTntPanel;
    PanelMain: TPanel;
    PanelGrid: TPanel;
    TntDBGrid1: TTntDBGrid;
    Panel5: TPanel;
    TntLabel1: TTntLabel;
    TntLabel2: TTntLabel;
    TntEdit1: TTntEdit;
    TntEdit2: TTntEdit;
    TntBitBtn1: TTntBitBtn;
    TntBitBtn2: TTntBitBtn;
    deptS: TTntComboBox;
    depte: TTntComboBox;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADOQuery1emp_id: TStringField;
    ADOQuery1emp_name: TTntWideStringField;
    ADOQuery1tax_num: TTntWideStringField;
    ADOQuery1sal_tot1: TFloatField;
    ADOQuery1base_pay: TFloatField;
    ADOQuery1sal_tot2: TFloatField;
    ADOQuery1full_awd: TFloatField;
    ADOQuery1sick_back: TFloatField;
    ADOQuery1picc_back: TFloatField;
    ADOQuery1last_addition: TFloatField;
    ADOQuery1supp_agai: TFloatField;
    ADOQuery1sal_night: TFloatField;
    ADOQuery1over15_sal: TFloatField;
    ADOQuery1over20_sal: TFloatField;
    ADOQuery1over30_sal: TFloatField;
    ADOQuery1over195_sal: TFloatField;
    ADOQuery1othe_supp: TFloatField;
    ADOQuery1gong_pay: TFloatField;
    ADOQuery1te_pay: TFloatField;
    ADOQuery1other_temp: TFloatField;
    ADOQuery1sal_tot3: TFloatField;
    ADOQuery1picc_she: TFloatField;
    ADOQuery1picc_yi: TFloatField;
    ADOQuery1picc_shiye: TFloatField;
    ADOQuery1laun_pay: TFloatField;
    ADOQuery1tax_pay: TFloatField;
    ADOQuery1ask_sal: TFloatField;
    ADOQuery1stop_dedu: TFloatField;
    ADOQuery1sup_dedu: TFloatField;
    ADOQuery1yicard_dedu: TFloatField;
    ADOQuery1full_sal: TFloatField;
    ADOQuery1sal_tot: TFloatField;
    ADOQuery1marry_id: TTntWideStringField;
    ADOQuery1marry_mon: TFloatField;
    ADOQuery1tax_pay1: TFloatField;
    ADOQuery2: TADOQuery;
    ADOQuery1svr_nm: TFloatField;
    ADOQuery1epid_no: TStringField;
    TntLabel5: TTntLabel;
    Cate: TTntComboBox;
    TntLabel4: TTntLabel;
    Edit2: TEdit;
    Edit1: TEdit;
    procedure TntBitBtn1Click(Sender: TObject);
    procedure TntBitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSal28: TFormSal28;

implementation
uses
  UnitHrdUtils,unitDMHrdsys,comobj;
var
  Langstr:TWideStrings;//語言字符串
   prv:TPrvArr;
  ExcelThread:TExcelThread;
{$R *.dfm}

procedure TFormSal28.TntBitBtn1Click(Sender: TObject);
 var

    sql :string ;
begin
    sql := ' SELECT emp_id, SUM(base_pay +mgmt_ofr+tech_ofr+duty_ofr+envr_ofr+grad_ofr) AS sal_tot1,  ' +
                   ' sum(base_pay ) as base_pay ,SUM(full_awd) AS full_awd, ' +
                   ' sum( sick_supp)  as sick_supp ,SUM(sick_back) AS sick_back, ' +
                   ' SUM(last_addition) AS last_addition, sum( psal_awd ) as psal_awd  , ' +
                   ' SUM(supp_agai) AS supp_agai, SUM(sal_night) AS sal_night, SUM(over15_sal) AS over15_sal, ' +
                   ' SUM(over20_sal) AS over20_sal, SUM(over30_sal) AS over30_sal, '+
                   ' SUM(over195_sal) AS over195_sal, sum( envr_ofr ) as envr_ofr , SUM(picc_back) AS picc_back ,' +
                   ' SUM(other_temp) AS other_temp,SUM(longwork_pay) AS longwork_pay , SUM(gong_pay) AS gong_pay, SUM(te_pay) AS te_pay, sum( meal_sal ) as meal_sal,  '+
                   ' SUM(picc_she) AS picc_she, SUM(picc_yi) AS picc_yi, SUM(picc_shiye ) AS picc_shiye , SUM(laun_pay) AS laun_pay, '+
                   '  SUM(tax_pay) AS tax_pay, SUM(ask_pay) AS ask_pay, '+
                   ' SUM(stop_dedu) AS stop_dedu, SUM(sup_dedu) AS sup_dedu, sum( meal_pay ) as meal_pay, SUM(tax_pay) AS tax_pay1, dept_code ' +
           ' FROM  hrd_sal_paymt   ' +
           ' WHERE (pay_mon >= '''+tntedit1.Text +''') AND (pay_mon <= '''+tntedit2.Text +''')' ;
         //  ' and dept_code >='''+ copy(depts.text,1,6)+ ''' and dept_code <=''' + copy(depte.text,1,6) + ''' GROUP BY  emp_id, dept_code ' ;
    if cate.ItemIndex = 1 then
         sql :=sql +   ' and dept_code >='''+ copy(depts.text,1,6)+ ''' and dept_code <=''' + copy(depte.text,1,6) + ''' GROUP BY  emp_id ' ;
     if cate.ItemIndex = 0 then
         sql :=sql +   ' and emp_id >='''+ edit1.text+ ''' and emp_id <=''' + edit2.Text  + ''' GROUP BY  emp_id ' ;

    adoQuery1.SQL.Clear ;
    adoQuery1.SQL.Add(sql) ;
    adoQuery1.Open ;
end;

procedure TFormSal28.TntBitBtn2Click(Sender: TObject);
begin
   if (ExcelThread=nil) or (ExcelThread.Terminated) then
      ExcelThread := TExcelThread.Create(false);
end;
procedure TExcelThread.execute;
{-----------轉資料線程-----------}
var
  Excelid: Variant;
  i,j, k:integer ;
  ColStr:string ;
  AQry:TADOQuery;
  Str1,Str2,Str3,Str4:widestring;
  Formsal28:TFormsal28;
  trunggian,pur_no,sqlstr:string;
  sohang,cuoitaptin:Longint;
begin
  ColStr:='N';//xac dinh xem cot co bao nhieu cot
  FormSal28:=TFormsal28(application.FindComponent('Formsal28')); //注意:此處一定要註冊窗体(要不,認不到)
with FormSal28 do
  begin
    try
      Excelid:=CreateOleObject( 'Excel.Application' );
    except
      on Exception do raise exception.Create('無法創建Xls文件，請確認是否安裝EXCEL')
    end;

    Excelid.Visible := True;
    Excelid.WorkBooks.Add;

    Excelid.worksheets[1].range['A1:'+'G1'].Merge(True);
    Excelid.worksheets[1].range['A1:'+'G1'].FONT.UNDERLINE:=TRUE;

   // Excelid.WorkSheets[1].Cells[1,1].Value :=LeftStr(formsal28.Edit_month.Text,4)+' 年 '+RightStr(formsal28.Edit_month.Text,2)+' 月份越南員工薪資轉帳明細表 ';
    Excelid.worksheets[1].range['A1:G1'].VerticalAlignment := xlCenter;
    Excelid.worksheets[1].Range['A1:G1'].font.size:=10;
    Excelid.worksheets[1].Range['A1:G1'].font.bold:=true;
    Excelid.worksheets[1].Columns[1].ColumnWidth := 10;
    Excelid.worksheets[1].Columns[2].ColumnWidth := 20;
    Excelid.worksheets[1].Columns[3].ColumnWidth := 10;
    Excelid.worksheets[1].Columns[4].ColumnWidth := 20;
    Excelid.worksheets[1].Columns[5].ColumnWidth := 20;
    Excelid.worksheets[1].Columns[6].ColumnWidth := 20;
    Excelid.worksheets[1].Columns[7].ColumnWidth := 10;

    Excelid.WorkSheets[1].Cells[2,1].Value :='STT' ;
    Excelid.WorkSheets[1].Cells[2,2].Value :='工號 ' ;
    Excelid.WorkSheets[1].Cells[2,3].Value :='越文姓名' ;
    Excelid.WorkSheets[1].Cells[2,4].Value :='稅號' ;
    Excelid.WorkSheets[1].Cells[2,5].Value :='薪資合計(1)' ;
    Excelid.WorkSheets[1].Cells[2,6].Value :='基本工資' ;
    Excelid.WorkSheets[1].Cells[2,7].Value :='薪資合計(2)' ;
    Excelid.WorkSheets[1].Cells[2,8].Value :='全勤獎金' ;
    Excelid.WorkSheets[1].Cells[2,9].Value :='病假補貼 ' ;
    Excelid.WorkSheets[1].Cells[2,10].Value :='病假返還' ;
    Excelid.WorkSheets[1].Cells[2,11].Value :='Last-addition' ;
    Excelid.WorkSheets[1].Cells[2,12].Value :='件資' ;
    Excelid.WorkSheets[1].Cells[2,13].Value :='上月補發' ;
    Excelid.WorkSheets[1].Cells[2,14].Value :='夜班補貼' ;
    Excelid.WorkSheets[1].Cells[2,16].Value :='Over15-sal' ;
    Excelid.WorkSheets[1].Cells[2,17].Value :='Over20-sal ' ;
    Excelid.WorkSheets[1].Cells[2,18].Value :='Over30-sal' ;
    Excelid.WorkSheets[1].Cells[2,19].Value :='Over195-sal' ;
   // Excelid.WorkSheets[1].Cells[2,15].Value :='加班費' ;
    Excelid.WorkSheets[1].Cells[2,16].Value :='環境津貼 ' ;
    Excelid.WorkSheets[1].Cells[2,17].Value :='保險返還' ;
    Excelid.WorkSheets[1].Cells[2,18].Value :='其他補貼' ;
    Excelid.WorkSheets[1].Cells[2,19].Value :='久任獎金' ;
    Excelid.WorkSheets[1].Cells[2,20].Value :='特別獎金' ;
    Excelid.WorkSheets[1].Cells[2,21].Value :='功績獎金' ;
    Excelid.WorkSheets[1].Cells[2,22].Value :='餐補 '  ;
    Excelid.WorkSheets[1].Cells[2,23].Value :='薪資合計(3)' ;
    Excelid.WorkSheets[1].Cells[2,24].Value :='社保' ;
    Excelid.WorkSheets[1].Cells[2,25].Value :='醫保' ;
    Excelid.WorkSheets[1].Cells[2,26].Value :='失業保險' ;
    Excelid.WorkSheets[1].Cells[2,27].Value :='工團費' ;
    Excelid.WorkSheets[1].Cells[2,28].Value :='個人所得稅' ;
    Excelid.WorkSheets[1].Cells[2,29].Value :='請假扣款 ' ;
    Excelid.WorkSheets[1].Cells[2,30].Value :='停工扣款' ;

    Excelid.WorkSheets[1].Cells[2,31].Value :='上月補扣' ;
    Excelid.WorkSheets[1].Cells[2,32].Value :='餐費' ;
    Excelid.WorkSheets[1].Cells[2,33].Value :='封裝金額 ' ;
    Excelid.WorkSheets[1].Cells[2,34].Value :='(A)+(B)' ;
    Excelid.WorkSheets[1].Cells[2,35].Value :='附屬人數' ;
    Excelid.WorkSheets[1].Cells[2,36].Value :='月數' ;
    Excelid.WorkSheets[1].Cells[2,37].Value :='個人所得稅(合計)' ;
    Excelid.WorkSheets[1].Cells[2,38].Value :='薪資月數' ;
    Excelid.WorkSheets[1].Cells[2,39].Value :='身份證號';
    Excelid.WorkSheets[1].Cells[2,40].Value :='部門代號' ;
    Excelid.WorkSheets[1].Cells[2,41].Value :='部門名稱' ;
    Excelid.worksheets[1].Range['A2:AT2'].Borders.LineStyle := 1 ;
    Excelid.worksheets[1].range['A2:AT2'].VerticalAlignment := xlCenter;
    Excelid.worksheets[1].Range['A2:AT2'].font.size:=10;
    Excelid.worksheets[1].Range['A2:AT2'].font.bold:=true;
    i := 3; j := 0 ; k :=0;
    adoQuery1.First ;
    while  not AdoQuery1.Eof   do
        begin
            k := k +1 ;
            ColStr :='A'+ inttostr( i) +':'+'AT' + inttostr(i);
            Excelid.worksheets[1].range[ColStr].VerticalAlignment := xlCenter;
            Excelid.worksheets[1].Range[colStr].font.size:=8;
            Excelid.worksheets[1].Range[colStr].Font.Name := 'Arial';
            Excelid.WorkSheets[1].Cells[i,1].Value := inttostr( k ) ;
            for j := 0 to adoQuery1.FieldCount -1 do
               begin
                 Excelid.WorkSheets[1].Cells[i,j+2].Value :=adoQuery1.Fields.Fields[j].Value ;
               end;

            Excelid.worksheets[1].Range[colStr].Borders.LineStyle := 1 ;
            i := i +1 ;
            adoQuery1.Next ;
        end;
  end;
  terminate;
//  sb_email
end;

procedure TFormSal28.FormShow(Sender: TObject);
var
  sql :string ;
begin
  sql := 'select dept_code, abbr_titl from hrd_dept ';
  adoQuery2.SQL.Clear ;
  adoQuery2.SQL.Add( sql ) ;
  adoQuery2.Open ;
  depts.Items.Clear ;
  depte.Items.Clear ;
  while not adoQuery2.Eof do
    begin
      depts.Items.Add(adoQuery2.fieldbyname('dept_code').AsString + ' - ' + adoQuery2.fieldbyname('abbr_titl').AsString ) ;
      depte.Items.Add(adoQuery2.fieldbyname('dept_code').AsString + ' - ' + adoQuery2.fieldbyname('abbr_titl').AsString ) ;

      adoQuery2.Next ;
    end;
    adoQuery2.Close ;
end;

procedure TFormSal28.ADOQuery1CalcFields(DataSet: TDataSet);
var
   emp,sql, epindt, epledt   :string ;
   EmpInDate,                           //進廠日期
   EmpLvDate:TDateTime;

begin
   emp :=Dataset.FieldByName('emp_id').AsString;
   sql :='select emp_id, name_vim,ifmarry,epid_no, epindt, epledt  from hrd_emp where emp_id = ''' + emp + '''';
   adoQuery2.SQL.Clear ;
   adoQuery2.SQL.Add(sql);
   adoQuery2.Open ;
   if not adoQuery2.Eof then
      begin
        dataset.FieldByName('emp_name').Value := adoQuery2.fieldbyname('name_vim').Value ;
        dataset.FieldByName('marry_id').Value := adoQuery2.fieldbyname('ifmarry').Value ;
        dataset.FieldByName('epid_no').Value := adoQuery2.fieldbyname('epid_no').Value ;
        EmpInDate:=adoQuery2.FieldByName('epindt').AsDateTime;  //進廠日期
        EmpLvDate:=adoQuery2.FieldByName('epledt').AsDateTime;  //離職日期
        epindt := FormatDateTime('yyyymm', EmpInDate );
        epledt := FormatDateTime('yyyymm', EmpLvDate );
        if ( epindt >tntedit1.Text ) and ( epledt > tntedit2.Text ) then
           dataset.FieldByName('svr_nm').Value :=strtoint(copy(tntedit2.Text, 5, 2)) - monthof( Empindate )   +1  ;

        if ( epindt >tntedit1.Text ) and ( epledt <= tntedit2.Text ) then
           dataset.FieldByName('svr_nm').Value :=monthof( EmpLvDate )- monthof( Empindate )   +1  ;

        if ( epindt <=tntedit1.Text ) and ( epledt > tntedit2.Text ) then
           dataset.FieldByName('svr_nm').Value :=strtoint(copy(tntedit2.Text, 5, 2)) - strtoint(copy(tntedit1.Text, 5, 2)) +1 ;

        if ( epindt <=tntedit1.Text ) and ( epledt <= tntedit2.Text ) then
           dataset.FieldByName('svr_nm').Value :=monthof( EmpLvDate )- strtoint(copy(tntedit1.Text, 5, 2))   +1  ;
    end;
  // sql :='select emp_id, name_vim,ifmarry from hrd_emp where emp_id = ''' + emp + '''';
  // adoQuery2.SQL.Clear ;
  // adoQuery2.SQL.Add(sql);
  // adoQuery2.Open ;
  // if not adoQuery2.Eof then
  //    begin
  //      dataset.FieldByName('emp_name').Value := adoQuery2.fieldbyname('name_vim').Value ;
  //     // dataset.FieldByName('marry_id').Value := adoQuery2.fieldbyname('ifmarry').Value ;
  //    end;
    adoQuery2.Close  ;
   sql :='select abbr_titl from hrd_dept where dept_code = ''' + dataset.FieldByName('dept_code').Value + '''';
   adoQuery2.SQL.Clear ;
   adoQuery2.SQL.Add(sql);
   adoQuery2.Open ;
   if not adoQuery2.Eof then
      begin
        dataset.FieldByName('abbr_titl').Value := adoQuery2.fieldbyname('abbr_titl').Value ;
      end;
      adoQuery2.Close  ;
   sql :='select emp_id, child_qty, child_mon from hrd_emp_child  where emp_id = ''' + emp + '''';
   adoQuery2.SQL.Clear ;
   adoQuery2.SQL.Add(sql);
   adoQuery2.Open ;
   if not adoQuery2.Eof then
      begin
        dataset.FieldByName('marry_id').Value := adoQuery2.fieldbyname('child_qty').Value ;
        dataset.FieldByName('marry_mon').Value := adoQuery2.fieldbyname('child_mon').Value ;
      end;
   sql :='select a.tax_no from hrd_emp_tax as a, hrd_emp as b  where a.epid_no=b.epid_no and b.emp_id = ''' + emp + '''';
   adoQuery2.SQL.Clear ;
   adoQuery2.SQL.Add(sql);
   adoQuery2.Open ;
   if not adoQuery2.Eof then
      begin
        dataset.FieldByName('tax_num').Value := adoQuery2.fieldbyname('tax_no').Value ;
      end;
    sql :='select sum(full_sal) as full_sal  from hrd_sal_currency  where emp_id = ''' + emp + ''' and pay_mon>='''+ tntedit1.Text+'''  and pay_mon <='''+ tntedit2.Text+ '''';
   adoQuery2.SQL.Clear ;
   adoQuery2.SQL.Add(sql);
   adoQuery2.Open ;
   if not adoQuery2.Eof then
      begin
        dataset.FieldByName('full_sal').Value := adoQuery2.fieldbyname('full_sal').Value ;
      end;
   dataset.FieldByName('sal_tot2').AsFloat := dataset.fieldbyname('full_awd').AsFloat +
                                              dataset.fieldbyname('sick_supp').AsFloat +
                                              dataset.fieldbyname('sick_back').AsFloat +
                                              dataset.fieldbyname('last_addition').AsFloat +
                                              dataset.fieldbyname('psal_awd').AsFloat +
                                              dataset.fieldbyname('supp_agai').AsFloat +
                                              dataset.fieldbyname('sal_night').AsFloat +
                                              dataset.fieldbyname('over15_sal').AsFloat +
                                              dataset.fieldbyname('over20_sal').AsFloat +
                                              dataset.fieldbyname('over30_sal').AsFloat +
                                              dataset.fieldbyname('over195_sal').AsFloat +
                                              dataset.fieldbyname('envr_ofr').AsFloat +
                                              dataset.fieldbyname('picc_back').AsFloat +
                                              dataset.fieldbyname('other_temp').AsFloat +
                                              dataset.fieldbyname('longwork_pay').AsFloat +
                                              dataset.fieldbyname('gong_pay').AsFloat +
                                              dataset.fieldbyname('te_pay').AsFloat ;
dataset.FieldByName('sal_tot').AsFloat := dataset.fieldbyname('sal_tot1').AsFloat + dataset.fieldbyname('sal_tot2').AsFloat ;
 dataset.FieldByName('sal_tot3').AsFloat := dataset.fieldbyname('picc_she').AsFloat +
                                              dataset.fieldbyname('picc_yi').AsFloat +
                                              dataset.fieldbyname('laun_pay').AsFloat +
                                              dataset.fieldbyname('tax_pay').AsFloat +
                                              dataset.fieldbyname('ask_pay').AsFloat +
                                              dataset.fieldbyname('stop_dedu').AsFloat +
                                              dataset.fieldbyname('sup_dedu').AsFloat +
                                              dataset.fieldbyname('meal_pay').AsFloat +
                                              dataset.fieldbyname('picc_shiye').AsFloat ;

end;

end.
