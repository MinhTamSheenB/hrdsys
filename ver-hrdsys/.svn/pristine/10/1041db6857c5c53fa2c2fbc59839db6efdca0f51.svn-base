unit UnitSal26;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, TntDBGrids, StdCtrls, TntStdCtrls,
  Buttons, TntButtons, TntExtCtrls, ExtCtrls, dateutils, ComCtrls,
  TntComCtrls, StrUtils, TntDialogs, TntDB;

type
  TFormSal26 = class(TForm)
    Panel1: TPanel;
    PanelTitle: TTntPanel;
    PanelMain: TPanel;
    PanelQuery: TPanel;
    TntGroupBox1: TTntGroupBox;
    Btn_Search: TTntBitBtn;
    BtnPrint: TTntBitBtn;
    PanelGrid: TPanel;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    TntStatusBar1: TTntStatusBar;
    EditMon: TTntEdit;
    TntLabel1: TTntLabel;
    dept: TTntComboBox;
    TntSaveDialog1: TTntSaveDialog;
    num: TTntLabel;
    cond: TTntComboBox;
    ADOQuery3: TADOQuery;
    TntEdit1: TTntEdit;
    TntEdit2: TTntEdit;
    TntRadioGroup2: TTntRadioGroup;
    TntRadioGroup3: TTntRadioGroup;
    TntLabel2: TTntLabel;
    TntLabel3: TTntLabel;
    ADOQuery1dept_code: TTntStringField;
    ADOQuery1emp_id: TTntStringField;
    ADOQuery1epindt: TDateTimeField;
    ADOQuery1pst_code: TTntStringField;
    ADOQuery1valid_date: TDateTimeField;
    btnSave: TTntButton;
    ADOQuery1sal_base: TFloatField;
    ADOQuery1sal_45s: TFloatField;
    ADOQuery1base_pay: TFloatField;
    TntDBGrid1: TTntDBGrid;
    ADOQuery1emp_chs: TTntWideStringField;
    ADOQuery1abbr_titl: TTntWideStringField;
    ADOQuery4: TADOQuery;
    ADOQuery5: TADOQuery;
    ADOQuery1pst_old: TTntStringField;
    btn_show_hand: TTntButton;
    ADOQuery1name_vim: TWideStringField;
    procedure Btn_SearchClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure TntRadioGroup3Click(Sender: TObject);
   // procedure ADOQuery1CalcFields(DataSet: TDataSet);
    procedure btnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TntDBGrid1TitleClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
    function  GetYiChang(EmpId:String):boolean;
    function  GetYearPay(EmpId,pstcode,paymon:String;EpInDt:TDateTime; prdpay,BasePay:Currency):Currency;
    procedure TntDBGrid1DblClick(Sender: TObject);
    procedure TntEdit1Change(Sender: TObject);
   private

    { Private declarations }
  public
    { Public declarations }
  end;

var

  FormSal26: TFormSal26;
  SalBaseLvl:TStrings;//基本薪資等級額
  flag, cldept, deptstr  :string ;

implementation
 uses
  UnitDMHrdsys,UnitHrdUtils,UnitSal08, ComObj;
 var
   prv:TPrvArr;
   currDate , preDate :string ;
{$R *.dfm}

procedure TFormSal26.Btn_SearchClick(Sender: TObject);
var
  clsql, cldept, clemp, clpst, cledu,sql, clmon, Smon, Emon  :string ;
  k :integer ;
  MonSDate, MonEDate :TDatetime;
begin

  MonSDate:=StartOfAMonth(StrToInt(LeftStr(editmon.Text,4)),StrToInt(RightStr(editmon.Text,2)));
  MonEDate:=EndOfAMonth(StrToInt(LeftStr(editmon.Text,4)),StrToInt(RightStr(editmon.Text,2)));
  Smon :=FormatDateTime('yyyy/mm/dd',MonSDate);
  Emon :=FormatDateTime('yyyy/mm/dd',MonEDate);

 // clsql := 'select a.emp_id , b.emp_chs, b.dept_code,  c.abbr_titl, b.pst_code, b.epindt  , a.sal_base, a.prd_pay, a.sal_12w, ' ;
 // clsql := clsql + ' a.sal_45s, a.base_pay, a.valid_date, b.edu_code  from hrd_sal_base as a, hrd_emp as b, ';
 // clsql := clsql + ' hrd_dept as c , hrd_sal_grade as d  where a.emp_id=b.emp_id and b.dept_code=c.dept_code   ' ;
 // clsql := clsql +  '  and a.emp_id=d.emp_id  and d.valid_date <>  ''' + SMon + '''';
 { clsql := 'select *from hrd_sal_base_sts where sal_mon =''' + editmon.Text  + ''' and factory = ''' + cldept + '''';
  adoQuery2.SQL.Clear ;
  adoQuery2.SQL.Add( clsql );
  adoQuery2.Open ;
  if adoQuery2.Eof    then
     begin
       showmessage( DeptStr + '  -  ' + editmon.Text  + ' 月份 尚未結轉');
       btnsave.Enabled := true ;
       adoQuery2.Close  ;
       exit ;
    end;
  if ( not adoQuery2.Eof  ) and (adoQuery2.FieldByName('mon_sts').AsString  <>'1'  )   then
     begin
       showmessage( DeptStr + '  -  ' + editmon.Text  + ' 月份 尚未結轉');
       btnsave.Enabled := true ;
       adoQuery2.Close  ;
       exit ;
    end;   }
   if TntRadioGroup2.ItemIndex = 0 then
     begin
       clsql := 'select a.emp_id , b.emp_chs, b.dept_code,  c.abbr_titl, b.pst_code, a.pst_old, b.epindt  , a.sal_base, ' ;
       clsql := clsql + ' a.sal_5s, a.base_pay, a.valid_date, b.edu_code, a.pst_code as pst_old,b.name_vim  from hrd_sal_base as a, hrd_emp as b, ';
       clsql := clsql + ' hrd_dept as c  where a.emp_id=b.emp_id and b.dept_code=c.dept_code   ' ;
       clsql := clsql +  '  and  a.valid_date >=  ''' + SMon + '''  and  a.valid_date <= ''' +EMon + '''';
     end ;

   if TntRadioGroup2.ItemIndex = 1 then
     begin
       clsql := 'select a.emp_id , b.emp_chs, b.dept_code,  c.abbr_titl, b.pst_code,  a.pst_old, b.epindt  , a.sal_base, ' ;
       clsql := clsql + ' a.sal_5s, a.base_pay, a.valid_date, b.edu_code,b.name_vim  from hrd_sal_base as a, hrd_emp as b, ';
       clsql := clsql + ' hrd_dept as c  where a.emp_id=b.emp_id and b.dept_code=c.dept_code   ' ;
       clsql := clsql +  '  and  a.valid_date >=  ''' + SMon + '''  and  a.valid_date <= ''' +EMon + ''' and a.upd_flag =''1''';
     end ;
   if TntRadioGroup2.ItemIndex = 2 then
     begin
       clsql := 'select a.emp_id , b.emp_chs, b.dept_code,  c.abbr_titl, b.pst_code, a.pst_old, b.epindt  , a.sal_base, ' ;
       clsql := clsql + ' a.sal_5s, a.base_pay, a.valid_date, b.edu_code from hrd_sal_base as a, hrd_emp as b, ';
       clsql := clsql + ' hrd_dept as c  where a.emp_id=b.emp_id and b.dept_code=c.dept_code   ' ;
       clsql := clsql +  '  and  a.valid_date >=  ''' + SMon + '''  and  a.valid_date <= ''' +EMon + ''' and a.upd_flag =''2''';
     end ;
   if TntRadioGroup2.ItemIndex = 3 then
     begin
       clsql := 'select a.emp_id , b.emp_chs, b.dept_code,  c.abbr_titl, b.pst_code,  a.pst_old,b.epindt  , a.sal_base, ' ;
       clsql := clsql + ' a.sal_5s, a.base_pay, a.valid_date, b.edu_code,b.name_vim  from hrd_sal_base as a, hrd_emp as b, ';
       clsql := clsql + ' hrd_dept as c   where a.emp_id=b.emp_id and b.dept_code=c.dept_code   ' ;
       clsql := clsql +  '  and  a.valid_date >=  ''' + SMon + '''  and  a.valid_date <= ''' +EMon + ''' and a.upd_flag =''3''';
     end ;
  if TntRadioGroup2.ItemIndex = 4 then
     begin
       clsql := 'select a.emp_id , b.emp_chs, b.dept_code,  c.abbr_titl, b.pst_code,  a.pst_old,b.epindt  , a.sal_base, ' ;
       clsql := clsql + ' a.sal_5s, a.base_pay, a.valid_date, b.edu_code,b.name_vim  from hrd_sal_base as a, hrd_emp as b, ';
       clsql := clsql + ' hrd_dept as c  where a.emp_id=b.emp_id and b.dept_code=c.dept_code  ' ;
       clsql := clsql +  ' and a.sal_5s > 0  and a.valid_date = ''' + SMon + '''' ;
     end ;

  //***<<<2011-12-01 hyt add
  if TTntBitBtn(Sender).Name='btn_show_hand' then
  begin
    clsql := clsql + ' and right(a.up_user,1) =''*''';
  end;
  //***>>>

  clsql := clsql + ' and '+AnalysisFactorySql('b') ; //2012-09-07 hyt add

  if TntRadioGroup3.ItemIndex = 0 then
     clsql := clsql+ ' and  b.dept_code >= ''' + copy( cond.Text,1,6)    +''' and  b.dept_code <= ''' + copy( dept.Text,1,6)    +''' order by b.dept_code, b.epindt, b.pst_code, b.emp_id'  ;

  if TntRadioGroup3.ItemIndex = 1 then
     clsql := clsql +  ' and a.emp_id >= ''' + tntedit1.Text   +''' and a.emp_id<= ''' + tntedit2.text+''' order by b.dept_code, b.epindt, b.pst_code, b.emp_id'  ;



  adoQuery1.SQL.Clear ;
  adoQuery1.SQL.Add( clsql );
  adoQuery1.Open ;

  btnprint.Enabled := true ;
  TntStatusBar1.SimpleText := ' 總計： ' +  inttostr( adoQuery1.RecordCount  ) + '人';

end;
procedure TFormSal26.FormCreate(Sender: TObject);
var
  sql, clmon, clpremon, clpreyear    :string ;
  present:Tdatetime;
  year,mon,day, month, premon, preyear  :word;

begin
  present:=now; 
  decodedate(present,year,month,day);

 // FormInit ;
  SalBaseLvl:=GetAllBaseLvl;//取得所有基本薪資等級額

  editmon.Text := formatdatetime('yyyymm',date );
  if formatdatetime('dd',date )<'05' then   //2011-12-01 hyt add
    editmon.Text:=str_PreMonth(editmon.Text);


  cond.Items.Clear ;
  sql :='select dept_code, abbr_titl  from hrd_dept where '+G_sFactorySql+' order by dept_code ' ;
  adoQuery2.SQL.Clear ;
  adoQuery2.SQL.Add( sql );
  adoQuery2.Open;
  while not AdoQuery2.Eof do
     begin
        cond.Items.Add( adoQuery2.fieldbyname('dept_code').AsString + ' - ' + adoQuery2.fieldbyname('abbr_titl').AsString );
      //  dept.Items.Add( adoQuery2.fieldbyname('dept_code').AsString + ' - ' + adoQuery2.fieldbyname('abbr_titl').AsString );
        adoQuery2.Next ;
     end;
     cond.ItemIndex := 0 ;
  adoQuery2.Close ;
  dept.Items.Clear ;
  sql :='select  dept_code, abbr_titl  from hrd_dept where '+G_sFactorySql+'  order by dept_code desc ' ;
  adoQuery2.SQL.Clear ;
  adoQuery2.SQL.Add( sql );
  adoQuery2.Open;
  while not AdoQuery2.Eof do
  begin
       // cond.Items.Add( adoQuery2.fieldbyname('dept_code').AsString + ' - ' + adoQuery2.fieldbyname('abbr_titl').AsString );
        dept.Items.Add( adoQuery2.fieldbyname('dept_code').AsString + ' - ' + adoQuery2.fieldbyname('abbr_titl').AsString );
        adoQuery2.Next ;
  end;
  dept.ItemIndex := 0 ;
  adoQuery2.Close ;

     {mon := strtoint( copy( editmon.Text , 5,2) );
     year := strtoint( copy( editmon.Text , 1,4) );
            // mon := mon +1 ;
     if mon = 12  then
        begin
          mon := 1;
          year := year + 1 ;
        end
    else
        begin
          if mon > month then
             mon := mon +1
          else mon := month ;
        end;
    if mon >= 10 then
       clmon := inttostr( year ) + inttostr( mon )
    else
      clmon := inttostr( year ) + '0'+inttostr( mon );

    editmon.Text := clmon ;
   //     end;
     // end
  // else
    // editmon.Text := adoQuery2.Fieldbyname('sal_mon').AsString ;

  //CurrDate :=  copy( clmon, 1, 4 ) + '/'+copy( clmon, 5, 2 ) +  '/01'  ;
  if copy( clmon , 5, 2 ) = '01'  then
     begin
       preyear := strtoint( copy( clmon, 1, 4 ) )  -1 ;
       clpremon := '12' ;
     end
  else
    begin
       preyear := strtoint( copy( clmon, 1, 4 ) )   ;
       premon := strtoint(copy( clmon, 5, 2 )  ) -1
     end;
     if premon < 10 then
        clpremon := '0' + inttostr(premon)
     else
        clpremon := inttostr( premon ) ;
     PreDate :=  inttostr( preyear )    + '/'+clpremon  + '/01'  ;
    } //2011-12-01 hyt delete
  adoQuery2.Close ;
end;


procedure TFormSal26.BtnPrintClick(Sender: TObject);
var
  MSExcel:Variant;
  i,j,iCol:integer;
  clSql, clmonth,s, cate  :string;
  nlSum :real;
begin
    if TntRadioGroup2.ItemIndex = 0 then
     cate := ' (  全部人員   ) ' ;
  if TntRadioGroup2.ItemIndex = 1 then
     cate := ' (  新進員工   ) ' ;
  if TntRadioGroup2.ItemIndex = 2 then
    cate := ' (  滿試用期   ) ' ;
  if TntRadioGroup2.ItemIndex = 3 then
    cate := ' (  當月調升   ) ' ;
  if TntRadioGroup2.ItemIndex = 4 then
    cate := ' (  當月調45000) ' ;

  adoQuery1.First;
  TntSaveDialog1.Filter:='*.xls|*.xls';
  tntSaveDialog1.DefaultExt:='xls';
  if tntSaveDialog1.Execute then
  begin
    MsExcel:=createOLEobject('excel.application');
    MsExcel.workBooks.add;
    Msexcel.visible:=false;
    MsExcel.worksheets[1].range['A1:K1'].Merge(True);
    MsExcel.worksheets[1].Range['A1:K1'].Font.Name := '冼极';
    MsExcel.worksheets[1].Range['A1:K1'].Font.Size := 18;
    MsExcel.worksheets[1].range['A1:K1'].font.bold:=true;
    MsExcel.WorkSheets[1].Cells[1,1].Value := copy( editmon.Text , 1, 4 ) + ' 年 ' + copy( editmon.Text , 5,2 )+ ' 月基本薪資調整人員名單';
    MsExcel.worksheets[1].Range['A1:K1'].Borders.LineStyle := 1  ;
    Msexcel.cells[2,1].value:='部門代號';
    Msexcel.cells[2,2].value:='部門名稱';
    Msexcel.cells[2,3].value:='工號';
    Msexcel.cells[2,4].value:='姓名';
    Msexcel.cells[2,5].value:='職稱';
    Msexcel.cells[2,6].value:='進廠日期';
    Msexcel.cells[2,7].value:='底薪';
    Msexcel.cells[2,8].value:='+ 45000 ';
    //Msexcel.cells[2,9].value:='+ 120000';
    //Msexcel.cells[2,8].value:='生產(功績)獎金';
    Msexcel.cells[2,9].value:='總金額';
    Msexcel.cells[2,10].value:='生效日期';
    Msexcel.cells[2,11].value:='越文姓名';

    Msexcel.worksheets[1].Range['A2:K2'].Borders.LineStyle := 1  ;
    Msexcel.worksheets[1].range['A2:K2'].font.bold:=true;
  //  Msexcel.worksheets[1].Range['A2:P2'].Font.Name := '冼极';
    MsExcel.worksheets[1].Range['A2:K2'].Font.Size := 12;
    j:=3;
    while not ADOqUERY1.eof do
      begin
        for i:=0 to adoQuery1.fieldcount-1 do
        begin
          iCol:=i;
          if i=5 then
            continue;
          if i>5 then
            iCol:=i-1;

          Msexcel.cells[j,iCol+1].numberformat:='@';
          Msexcel.cells[j,iCol+1].value:=adoQuery1.fields[i].Value ;//.AsString ;
        end;
        s := 'A'+inttostr( j ) + ':K'+inttostr( j );
        Msexcel.worksheets[1].Range[s].Borders.LineStyle := 1;
        MsExcel.worksheets[1].Range[s].Font.Size := 10;
        inc(j);
        adoQuery1.next;
      end;
      j:= j +1 ;
      Msexcel.cells[j,1].numberformat:='@';
      Msexcel.cells[j,1].value:='總計人數 : ' +  inttostr( ADOqUERY1.RecordCount )    ;

    end;
    MSExcel.ActiveWorkBook.SaveAs(tntSaveDialog1.FileName);
    MSExcel.ActiveWorkBook.Saved:=True;
    MSExcel.Quit;
    showmessage( 'Save Excel OK!!!!' ) ;

 end;




procedure TFormSal26.TntRadioGroup3Click(Sender: TObject);
var
  clsql :string ;
begin
  if TntRadioGroup3.ItemIndex = 0 then
     begin
        cond.Enabled := true;
        dept.Enabled := true;
        tntedit1.Enabled := false ;
        tntedit2.Enabled := false  ;
     end;
   if TntRadioGroup3.ItemIndex = 1 then
      begin
        cond.Enabled := false;
        dept.Enabled := false;
        tntedit1.Enabled := true ;
        tntedit2.Enabled := true ;
      end;
end;

procedure TFormSal26.btnSaveClick(Sender: TObject);
var
  emp, sql, clmon, pstcode, pstflag,educode, flag, upddate, mon, fact,pstold    :string ;
  MonSDate, MonEDate, epindt,epledt :TDatetime;
  basepay, salbase, prdpay, sal12w, sal45s,basesal :double;
  CurServerDateTime:TDateTime;  //服務器上當前時間
  k,TheMaxDay,nlmon , klmon  :integer ;
  aBasePay:TBasePay;
  NormalTestDays:TNormalTestDays;         //特別獎金与功績獎金
  cflag, InMon, InYear,InDay, PMon,PYear,PDay :string ;
  //dDate:Tdate;
  dUp_date:Tdate;
  sLastMonthBasePay,sLastMonthPstcode :string;
begin


  k := 0;
  CurServerDateTime:=GetServerDateTime  ;
  upddate := FormatDateTime('yyyy/mm/dd' , GetServerDateTime ) ;
  dUp_date:=GetServerDateTime ;
  MonSDate:=StartOfAMonth(StrToInt(LeftStr(editmon.Text,4)),StrToInt(RightStr(editmon.Text,2)));
  MonEDate:=EndOfAMonth(StrToInt(LeftStr(editmon.Text,4)),StrToInt(RightStr(editmon.Text,2)));
  sql:='select * from hrd_emp where '
   +' (epledt>='''+FormatDateTime('yyyy/mm/dd',MonSDate)+''' or epledt is null)'
   +' and epindt<='''+FormatDateTime('yyyy/mm/dd',MonEDate)+''''
   +' and ( emp_id not in (select emp_id from hrd_emp_upd'
   +' where (  valid_date>='''+FormatDateTime('yyyy/mm/dd',MonEDate+1)+'''))'
   +' or ( emp_id in(select emp_id from hrd_emp_upd'
   +' where  valid_date>='''+FormatDateTime('yyyy/mm/dd',MonEDate+1)+''')))';
  if TntRadioGroup3.ItemIndex = 0 then
     sql := sql+ ' and ( dept_code >= ''' + copy( cond.Text,1,6)    +''' and  dept_code <= ''' + copy( dept.Text,1,6)    +''' )'  ;

  if TntRadioGroup3.ItemIndex = 1 then
     sql := sql +  'and ( emp_id >= ''' + tntedit1.Text   +''' and emp_id<= ''' + tntedit2.text+''')'  ;

  sql := sql + ' and '+G_sFactorySql ; //2012-09-07 hyt add

  flag := '0' ;
  adoQuery3.SQL.Clear ;
  adoQuery3.SQL.Add( sql );
  adoQuery3.Open ;
  while not adoQuery3.Eof do
    begin

      clmon := editmon.Text ;
      emp := adoQuery3.FieldByName('emp_id').AsString ;
      pstcode := adoQuery3.FieldByName('pst_code').AsString ;
      epindt := adoQuery3.FieldByName('epindt').AsDateTime  ;
      epledt := adoQuery3.FieldByName('epledt').AsDateTime  ;
      Educode := adoQuery3.FieldByName('Edu_code').AsString ;
      fact :=  leftstr( adoQuery3.fieldbyname('dept_code').asstring, 1 )   ;
       //每月最大一天
      InYear :=  FormatDateTime('yyyy' , epindt ) ;
      InMon :=  FormatDateTime('mm' , epindt ) ;
      TheMaxDay:=DaysInAMonth(StrToInt(InYear),StrToInt(InMon));

       //取上個月的基本薪資   2012-07-23 hyt add
      sLastMonthBasePay:=DB_GetSRecord('select base_pay from hrd_sal_base_log '+
                                       'where emp_id='''+emp+''' '+
                                       'and left(CONVERT(VARCHAR(10), valid_date, 112),6)='''+str_PreMonth(clmon)+''' ');
      sLastMonthPstcode:=DB_GetSRecord('select pst_code from hrd_sal_base_log '+
                                       'where emp_id='''+emp+''' '+
                                       'and left(CONVERT(VARCHAR(10), valid_date, 112),6)='''+str_PreMonth(clmon)+''' ');
      if sLastMonthBasePay='' then
        sLastMonthBasePay:='0';
      if sLastMonthPstcode='' then
        sLastMonthPstcode:=pstcode;  

      cflag := '0' ;
      InDay :=  FormatDateTime('dd' , epindt ) ;
      Pyear := copy( editmon.Text, 1, 4 ) ;
      PMon := copy( editmon.Text, 5, 2 ) ;
      if pstcode='60' then
         InMon :=inttostr( strtoint( InMon )  + 1 )
      else
        InMon := inttostr( strtoint( InMon )  + 2);

      if InMon = '12' then
         begin
           if pstcode='60'  then
              begin
                InMon := '01' ;
                InYear := inttostr( strtoint( InYear ) +1 ) ;
              end
           else
              begin
                InMon := '02' ;
                InYear := inttostr( strtoint( InYear ) +1 ) ;
              end;
         end;
    //  else
    //     InMon := inttostr( strtoint(InMon )  + 1 ) ;


      if ( InYear = Pyear ) and ( strtoint( InMon ) = strtoint( PMon ) ) and ( strtoint(InDay ) <= TheMaxDay ) then
         begin
          cflag := '1' ;
         end;
      if ( InYear < Pyear ) and ( strtoint( InMon ) = strtoint( PMon ) ) and ( strtoint(InDay ) = TheMaxDay ) then
         begin
          cflag := '1' ;
         end;
      {if strtoint( rightstr( clmon,2) )   >= 10  then
         PreDate := '2009/' + inttostr( strtoint( rightstr( clmon,2) ) -1 )+ '/01'
      else
        begin
           if rightstr( clmon,2) = '01' then
              PreDate := '2009/' + '12' + '/01'
           else
              PreDate := '2010/' + '0' + inttostr( strtoint( rightstr( clmon,2) ) -1 )+ '/01' ;
        end;}     //2010-10-14 hyt upd

      {//PreDate := '2011-'+ rightstr( clmon,2) + '-01' ;
      try
        PreDate := '2011/'+ rightstr( clmon,2) + '/01' ;
        dDate:=strToDatetime(PreDate)-1;
      except
        PreDate := '2011-'+ rightstr( clmon,2) + '-01' ; //2011-11-11 hyt add
        dDate:=strToDatetime(PreDate)-1;
      end;}
      //2011-12-01 hyt upd
      PreDate:=str_PreMonth(clmon);
      PreDate:=leftStr(PreDate,4)+'/'+rightStr(PreDate,2)+'/01';
      //PreDate:=formatdatetime('yyyy/mm/01',ddate);


      sql:= 'select *from hrd_sal_base_log  where emp_id='''+ emp + '''  and valid_date = ''' + PreDate+ '''';
      adoQuery2.SQL.Clear ;
      adoQuery2.SQL.Add( sql) ;
      adoQuery2.Open ;
     // aBasePay :=  GetSalBase(emp, clmon, pstcode, educode, epindt, epledt,SalBaseLvl )  ;
      NormalTestDays := GetNormalTestDays( emp, editmon.Text, pstcode, epindt, epledt )  ;
      if not adoQuery2.Eof then
         begin
                   //  ADOqUERY2.Edit ;
            salbase := adoQuery2.fieldbyname('sal_base').AsFloat ;  //GetSalBase(emp, clmon, pstcode, educode, epindt, epledt,SalBaseLvl )  ; ///adoQuery2.fieldbyname('sal_base').AsFloat  ;
           aBasePay :=  GetSalBase(emp, clmon, pstcode, educode, epindt, epledt,SalBaseLvl, adoQuery2.fieldbyname('pst_code').asstring )  ;
          // prdpay  :=adoQuery2.fieldbyname('prd_pay').AsFloat  ;
         //  if FormatDateTime('yyyymm',epindt) >= '200901'  then
         //     sal12w  :=adoQuery2.fieldbyname('sal_12w').AsFloat + 150000
        //   else
            //  sal12w  :=adoQuery2.fieldbyname('sal_12w').AsFloat;

            if pstcode <> adoQuery2.fieldbyname('pst_code').asstring then
               begin
                 flag := '3' ;  // 調升
                // salbase := int( aBasePay[0] )   ;
                 salbase := adoQuery2.fieldbyname('sal_base').AsFloat +   int( aBasePay[0] )   ;
               end;
            if ( pstcode = adoQuery2.fieldbyname('pst_code').asstring ) and  ( NormalTestDays[1] > 0 )  and  ( NormalTestDays[0]  = 0 )  then   //and ( salbase = adoQuery2.fieldbyname('sal_base').AsFloat) then
               begin
               //  if clmon <'200901'  then
                    salbase := 1010000 ; //740000 ; //adoQuery2.fieldbyname('sal_base').AsFloat ;
                // else
                 //   salbase := 740000 + 150000 ;
                 flag := '1' ;  // 試用期
               end;
            if ( pstcode = adoQuery2.fieldbyname('pst_code').asstring ) and ( NormalTestDays[1] = 0 ) and  ( NormalTestDays[0] >  0 )  then   //and ( salbase = adoQuery2.fieldbyname('sal_base').AsFloat) then
               begin
                 if cflag ='1' then
                    salbase := int( aBasePay[1] )  // int( aBasePay[1] )
                 else
                    salbase := adoQuery2.fieldbyname('base_pay').AsFloat ;
                 flag := '0' ;  //  正常
               end;
            if ( pstcode = adoQuery2.fieldbyname('pst_code').asstring ) and  ( NormalTestDays[1] >0  ) and  ( NormalTestDays[0] >  0 ) then //( salbase <> adoQuery2.fieldbyname('sal_base').AsFloat) then
               begin
                salbase := int( aBasePay[2] )-150000 ;   //GetSalBase(emp, clmon, pstcode, educode, epindt, epledt,SalBaseLvl )  ;
               flag := '2' ;  // 滿試用期
               end;
          //  if adoQuery2.fieldbyname('sal_5s').AsFloat > 0 then
             //  begin
             //    salbase :=salbase +  adoQuery2.fieldbyname('sal_5s').AsFloat ;   //adoQuery2.fieldbyname('sal_base').AsFloat +  adoQuery2.fieldbyname('sal_45s').AsFloat ;
            //   end;
           //2011.01 add <<
         //  salbase := salbase + 460500 ;
           //2011.01.add  >>
           if ( flag = '1' ) or (  ( NormalTestDays[1] > 0 )  and  ( NormalTestDays[0]  = 0 ) ) then
               basesal :=1750000+60000+320000   //1550000  //2011.01 upd   //1120000 2011-10-11 hyt add 60000(valid2011-10-01) 2013-01-09 320000
            else
               basesal:= getyearpay(emp, pstcode,editmon.Text ,epindt, 0, salbase );
            sal45s  := GetBase45s( emp , clmon , pstcode, epindt, basesal  ) ; //adoQuery2.fieldbyname('sal_45s').AsFloat  ;
            basepay :=int(  basesal + sal45s )  ; //adoQuery2.fieldbyname('base_pay').AsFloat  ;
            if clmon = '200901'  then
               begin
                 if  GetYiChang(Emp) = true then
                     begin
                     sal45s  := ( salbase  )*0.05;
                     basepay := ( salbase )  + sal45s ; //( salbase + prdpay + sal12w )*0.05;
                    // sal45s  := ( salbase + prdpay + sal12w )*0.05;
                     end;
               end;
          end
      else
        begin
          if clmon < '200901' then
             begin
               salbase := 740000  ; //GetSalBase(emp, clmon, pstcode, educode, epindt,epledt,SalBaseLvl )  ;
               prdpay  := 0;
             //  sal12w  := 120000 ;
               sal45s  := 0;
               basepay := 860000  ;
               flag := '1' ;  // 新進
            end
          else if clmon < '201301' then
            begin
               salbase := 740000  ; //GetSalBase(emp, clmon, pstcode, educode, epindt,epledt,SalBaseLvl )  ;
          //     prdpay  := 0;
           //    sal12w  := 120000 + 150000;
               sal45s  := 0;
               basepay := 1750000+60000; //1550000 ; //2011.01 upd //1120000  ;  //1010000 2011-10-11 hyt add 60000(valid2011-10-01)
               flag := '1' ;  // 新進
            end
          else
            begin
              salbase := 740000  ; //GetSalBase(emp, clmon, pstcode, educode, epindt,epledt,SalBaseLvl )  ;
               sal45s  := 0;
               basepay := 1750000+60000+320000; //1550000 ; //2011.01 upd //1120000  ;  //1010000 2011-10-11 hyt add 60000(valid2011-10-01)
               flag := '1' ;  // 新進
            end;
        end;
      mon := datetimetostr( MonSDate ) ;
      adoQuery2.Close ;
      pstold := '' ;
      with DMHrdsys.SQLQuery1 do
       begin
         close;
         sql.Clear;
         sql.Add('select top 1 pst_old  from hrd_emp_upd  where  emp_id='''+emp+''' order by valid_date ');
         open;
         if not Eof then
            pstold:=FieldByName('pst_old').AsString
         else
            pstold := pstcode ;
         close ;
      end;
      sql:= 'select *from hrd_sal_base  where emp_id='''+ emp + '''';
      adoQuery4.SQL.Clear ;
      adoQuery4.SQL.Add( sql) ;
      adoQuery4.Open ;
      if adoQuery4.Eof then
         adoQuery4.Append
      else
         adoQuery4.Edit ;
      adoQuery4.FieldByName('emp_id').AsString   := emp ;
      if adoQuery4.FieldByName('valid_date').AsString    <>  mon  then
         adoQuery4.FieldByName('upd_flag').AsString   := flag ;
      adoQuery4.FieldByName('valid_date').AsString    := mon ;
      adoQuery4.FieldByName('pst_code').AsString    := pstcode ;
      adoQuery4.FieldByName('sal_base').AsFloat  := salbase ;

      adoQuery4.FieldByName('sal_5s').AsFloat   := sal45s ;
      adoQuery4.FieldByName('base_pay').AsFloat  := basepay ;
      adoQuery4.FieldByName('factory').AsString   := fact ;
      adoQuery4.FieldByName('pst_old').AsString   := pstold ;
      //2011-12-01 hyt add
      adoQuery4.FieldByName('up_user').AsString   := username;
      adoQuery4.FieldByName('up_date').AsDateTime :=dUp_date;
      //2012-07-23 hyt add sLastMonthBasePay
      adoQuery4.FieldByName('last_base_pay').AsFloat :=strToFloat(sLastMonthBasePay);
      //2012-09-14 hyt add sLastMonthPstcode
      if sLastMonthPstcode<>'' then
        adoQuery4.FieldByName('last_pst_code').AsFloat :=strToFloat(sLastMonthPstcode);

      adoQuery4.Post ;
      k := k +1 ;
      adoQuery4.Close  ;
      
      TntStatusBar1.SimpleText := '正在結轉 ' + emp  + ' 基本工資 ,  已結轉  ' + inttostr(k)+ ' / '+ inttostr( adoQuery3.RecordCount  ) + '人';
      sql :='select emp_id from hrd_sal_base_log where emp_id=''' + emp + ''' and valid_date = ''' + FormatDateTime('yyyy/mm/dd',MonSDate ) + '''' ; ;
      adoQuery2.SQL.Clear ;
      adoQuery2.SQL.Add( sql );
      adoQuery2.Open;
      if  not AdoQuery2.Eof  then
          begin
            adoQuery2.Delete ;
//            adoQuery2.post ;
          end ;
      adoQuery2.Close ;                                     //'''+ upddate +  '''
      sql := 'Insert into hrd_sal_base_log( up_user, up_date, emp_id , valid_date, pst_code,  sal_base,  sal_5s, base_pay, upd_flag, factory,last_base_pay,last_pst_code) ' ;
      sql := sql + ' values( ''' + username + ''', getdate(), '''+ emp +''', ''' + FormatDateTime('yyyy/mm/dd',MonSDate )+ ''', ''' + pstcode + ''' , ''' ;
      sql := sql +  floattostr( salbase )  + ''', '''  + floattostr(sal45s) +''' , ''' + floattostr(basepay) + ''', '''+ flag +''', ''' + fact + ''' ,'+sLastMonthBasePay+','''+sLastMonthPstcode+''')' ;
      adoQuery2.SQL.Clear ;
      adoQuery2.SQL.Add(sql);
      adoQuery2.ExecSQL ;
      adoQuery2.Close ;
      adoQuery3.Next ;
    end;
    showmessage('結轉 OK');
 // btnprint.Enabled := true ;
  num.Caption := inttostr( adoQuery3.RecordCount  );
   // adoQuery2.First ;
   adoQuery2.Close ;
  TntStatusBar1.SimpleText := '結轉 OK';
 // btnsave.Enabled := false ;
 
end;



procedure TFormSal26.FormShow(Sender: TObject);
var
  sql :string ;
begin
{sql :='select * from hrd_sal_base_sts where sal_mon=''' + editmon.Text  + ''' and mon_sts = ''1''' ;
adoQuery2.SQL.Clear ;
adoQuery2.SQL.Add( sql );
adoQuery2.Open;
if  not AdoQuery2.Eof  then
   btnsave.Enabled := false
else
  begin
     Prv:=GetPrvArr(UserName,'sal26');
  if Prv[TRAN] then
     begin
       btnSave.Enabled  := true ;
     end
  else
    begin
      btnSave.Enabled := false;
    end;

  end;
 cldept := 'V' ;
 deptstr := '鞋廠'; }
end ;

procedure TFormSal26.TntDBGrid1TitleClick(Column: TColumn);
begin
   DBGridSortByTitle(Column);
end;
procedure TFormSal26.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   adoQuery1.Close ;
   adoQuery2.Close ;
   adoQuery3.Close ;
end;


function TFormSal26.GetYiChang(EmpId:String):boolean;
begin
  with DMHrdsys.SQLQuery1  do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM hrd_sal_base_0901 WHERE emp_id='''+EmpId+'''' );
    Open;
    if not Eof then
    begin
      Result:=true;
    end
    else
      Result:=false;
    Close;
  end;
end;
function TFormSal26.GetYearPay(EmpId,pstcode,paymon:String;EpInDt:TDateTime; prdpay,BasePay:Currency):Currency;
var
  Inyear,Inmon, Inday,Pyear,Pmon,nyear :integer;
  clYear,pstgrd,sql :string ;
  basesal :real ;
begin
   InYear :=  strtoint(FormatDateTime('yyyy' , epindt )) ;
   InMon :=  strtoint(FormatDateTime('mm' , epindt )) ;
   InDay :=  strtoint(FormatDateTime('dd' , epindt )) ;
   if InDay > 10 then
      Inmon := Inmon + 1 ;
   if Inmon =13 THEN
       begin
          Inmon := 1 ;
          InYear := Inyear +1 ;
       end;   
   Pyear := strtoint( copy( paymon, 1, 4 )) ;
   PMon := strtoint( copy( paymon, 5, 2 ) ) ;
   if Pmon  - InMon > 0  then
      nYear := pyear - InYear +1
   else
      begin
        if Pyear - Inyear >= 1 then
           nYear := Pyear - Inyear  ;
        if Pyear - Inyear = 0 then
           nYear := Pyear - Inyear +1;
      end;
      if nyear < 10 then
         clYear := '0' + inttostr(nyear);
      pstgrd :=pstcode +clyear ;

      //sql :='select pst_pay from hrd_sal_base_grd where pst_grd='''+pstgrd+'''';
      //2012-08-08 hyt add 對進廠日期2012/07/01 開始 所有幹部和職員 基本薪資統一化，不分職務（注意同作業員差20000）
      if (formatDatetime('yyyy/mm/dd',EpInDt)>='2012/07/01') and (pstcode<'50') then
        sql:='SELECT pst_pay FROM   hrd_sal_base_grd where pst_grd=''90'+rightStr(pstgrd,2)+''' '
      else
        sql:='SELECT pst_pay FROM   hrd_sal_base_grd where pst_grd='''+pstgrd+''' ';


      DMHrdsys.SQLQuery1.SQL.Clear ;
      DMHrdsys.SQLQuery1.SQL.Add(sql);
      DMHrdsys.SQLQuery1.Open ;
      if not DMHrdsys.SQLQuery1.Eof then
         basesal :=DMHrdsys.SQLQuery1.fieldbyname('pst_pay').AsFloat ;
      if basesal > basepay then
          Result:=basesal //+ prdpay
      else
        Result:=basepay ;
end;

//2011-11-30 hyt add 新增手動修改 基本薪資
procedure TFormSal26.TntDBGrid1DblClick(Sender: TObject);
var
  sSql,sEmp_id,sValid_date,sBase_pay:string;   
begin
  //limited control
  if (username<>'adam') and (username<>'V810657') and (username<>'F060740') then
  begin
    exit ;
  end;
  //***<<<該月資料已經鎖定 2011-10-04 hyt 開啟控制
  if (editmon.Text<=LockMonth) and (UserName<>DebugUser)  then
  begin            //GetLangName(ws_Words,'msg_month_data_locked')
    WideMessageDlg('This Month is Locked!',mtError,[mbYes],0);
    exit;
  end;
  //***>>>
  //hrd_sal_base,hrd_sal_base_log
  //key:emp_id,valid_date

  sEmp_id:=ADOQuery1.FieldByName('emp_id').Value;
  sBase_pay:=inputbox('Please input Base Money','Please Input Base Money('+sEmp_id+'):','0');
  try
    if (StrToFloat(sBase_pay)>20001234) or (StrToFloat(sBase_pay)<1001234) then
    begin
      wideShowMessage('基本薪資輸入不對，請查核！');
      exit ;
    end;
  except
    wideShowMessage('基本薪資輸入不對，請查核！');
    exit ;
  end;



  sValid_date:=formatDatetime('yyyy/mm/dd',ADOQuery1.FieldByName('valid_date').AsDateTime );
  sSql:='update hrd_sal_base set base_pay='+sBase_pay+',up_user='''+username+'*'',up_date=getdate() '+
        'where emp_id='''+sEmp_id+''' and valid_date='''+sValid_date+''''+
        ' ; '+
        'update hrd_sal_base_log set base_pay='+sBase_pay+',up_user='''+username+'*'',up_date=getdate() '+
        'where emp_id='''+sEmp_id+''' and valid_date='''+sValid_date+'''';
  if DB_Run_Sql(sSql) then
  begin
    wideShowMessage('修改基本薪資成功');
    ADOQuery1.Edit ;
    ADOQuery1.FieldByName('base_pay').AsString := sBase_pay;
  end
  else
  begin
    wideShowMessage('修改基本薪資失敗');
  end;

end;

procedure TFormSal26.TntEdit1Change(Sender: TObject);
begin
  TntEdit2.Text :=TntEdit1.Text ;
end;

end.
