unit uFhrd208;

interface

uses
 Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, TntDbCtrls, ExtCtrls, Grids, DBGrids, TntDBGrids,
  StdCtrls, Buttons, TntButtons, TntStdCtrls, TntExtCtrls, ComCtrls,
  TntComCtrls,WSDLIntf, DB, ADODB,TntDialogs,strutils, TntDB,Qt, QuickRpt,math,
  CheckLst, TntCheckLst,DateUtils;

type
  TFormfhrd208 = class(TForm)
    Panel1: TPanel;
    PanelTitle: TTntPanel;
    PanelMain: TPanel;
    Panel7: TPanel;
    Panel2: TPanel;
    label_dept_begin: TTntLabel;
    CobDeptBegin: TTntComboBox;
    CobDeptEnd: TTntComboBox;
    BtnPrint: TTntBitBtn;
    RbOver: TTntRadioButton;
    RbStop: TTntRadioButton;
    BtnPreview: TTntButton;
    TntButton1: TTntButton;
    TntGroupBox2: TTntGroupBox;
    CLB_dtl: TTntCheckListBox;
    lb_select: TTntListBox;
    TntPanel9: TTntPanel;
    TntStatusBar1: TTntStatusBar;
    TntStatusBar2: TTntStatusBar;
    TntButton3: TTntButton;
    TntButton4: TTntButton;
    TntButton5: TTntButton;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADOQuery1emp_id: TStringField;
    ADOQuery1name_vim: TWideStringField;
    ADOQuery1ot_tot: TFloatField;
    ADOQuery2: TADOQuery;
    ADOStoredProc1: TADOStoredProc;
    ADOStoredProc2: TADOStoredProc;
    days: TTntRadioGroup;
    RadioGroup1: TRadioGroup;
    TntLabel1: TTntLabel;
    TntEdit1: TTntEdit;
     procedure InitLang;
    procedure InitForm;
    procedure SetPrintDataset(PrintFlag:boolean);
    procedure TntButton1Click(Sender: TObject);
   // procedure BtnPreviewClick(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure CobDeptBeginChange(Sender: TObject);
    procedure TntButton3Click(Sender: TObject);
    procedure TntButton4Click(Sender: TObject);
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
    function CheckOvertime(empid:String;Adate:TDate;IsWeek:boolean=true):boolean;
    procedure FormCreate(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formfhrd208: TFormfhrd208;
   function GetServerDateTime:TDateTime;
      function str_WeekToMondayDate(sWeekPlan:string):TDate;
implementation
 uses
UnitHrdUtils,unitDMHrdsys,UnitPrtDut11, ufhrd209;
var
  Langstr:TWideStrings;//語言字符串
  pri_arr:TPrvArr;//權限數組
  DutDate :Tdatetime;
  DateS, DateE :Tdatetime ;
{$R *.dfm}

procedure TFormfhrd208.TntButton1Click(Sender: TObject);
var
  sql_str :string ;
  i :integer ;
begin
  sql_str:='select * from fhrd_emp where emp_ledt is null and '
        +'dept_code='''+leftstr(CobDeptBegin.Text,6)+'''';
      if Checktempuser(username)  = false  then
         begin
           sql_str:=sql_str + ' and  emp_id not in ( select *from hrd_deny_emp ) '
         end;
      sql_str:=sql_str+' order by emp_id ';
    with ADOQuery2 do
    begin
     SQL.Clear ;
     SQL.Add( sql_str ) ;
     Open ;
     while not eof do
       begin
         CLB_dtl.Items.Add(widestring(fieldbyname('emp_id').Value+'-'+fieldbyname('emp_name').Value));
         next;
        // i := i + 1;
       end;
    end;
    BtnPrint.Enabled := true ;
    BtnPreview.Enabled := true ;
end;
procedure TFormfhrd208.InitLang;
{*************************************************************************
TO DO:初始化語言
*************************************************************************}
var
  keys:String;
begin
keys:=keys+'dut11_titl,not_find_data,while_doing,total,current_location,'
  +'preview,print,while_printing,department,print_finish,'
  +'dut11_stop,dut11_over,dept_begin,dept_end,dut11_muti_dept_pre,'
  +'dut11_half_deduct,dut11_not_deduct,dut11_all_deduct';
LangStr:=GetLangWideStrs(keys);
PanelTitle.Caption:=GetLangName(LangStr,'dut11_titl');
BtnPrint.Caption:=GetLangName(LangStr,'print');
RBStop.Caption:=GetLangName(LangStr,'dut11_stop');
RBOver.Caption:=GetLangName(LangStr,'dut11_over');
label_dept_begin.Caption:=GetLangName(LangStr,'dept_begin');
//label_dept_end.Caption:=GetLangName(LangStr,'dept_end');
BtnPreview.Caption:=GetLangName(LangStr,'preview');
end;                        

procedure TFormfhrd208.InitForm;
{*************************************************************************
TO DO:初始化Form
*************************************************************************}
begin

  GetDeptRange(CobDeptBegin);
  GetDeptRange(CobDeptEnd);
   if RadioGroup1.ItemIndex = 1 then
      begin
        DateS := str_WeekToMondayDate(tntedit1.Text + '1');
        DateE := str_WeekToMondayDate(tntedit1.Text + '5');
      end;
   if RadioGroup1.ItemIndex = 0 then
      begin
  if days.ItemIndex = 0  then
     dutDate := GetServerDateTime  ;
  if days.ItemIndex = 1  then
     begin
       if dayofweek(  GetServerDateTime ) = 7 then
          DutDate := GetServerDateTime + 2
       else
          DutDate := GetServerDateTime + 1 ;
     end;
  if days.ItemIndex = 2  then
     begin
       if ( dayofweek(  GetServerDateTime ) = 6 ) and ( dayofweek(  GetServerDateTime ) = 7 ) then
          DutDate := GetServerDateTime + 4
       else
          DutDate := GetServerDateTime + 2 ;
     end;
  if days.ItemIndex = 3  then
     begin
       if ( dayofweek(  GetServerDateTime ) = 6 ) and ( dayofweek(  GetServerDateTime ) = 7 ) then
          DutDate := GetServerDateTime + 5
       else
          DutDate := GetServerDateTime + 3 ;
     end;
   if days.ItemIndex = 4  then
     begin
       if ( dayofweek(  GetServerDateTime ) = 6 ) and ( dayofweek(  GetServerDateTime ) = 7 ) then
          DutDate := GetServerDateTime + 6
       else
          DutDate := GetServerDateTime + 4 ;
     end;
   end;
end;


procedure TFormfhrd208.BtnPrintClick(Sender: TObject);
//打印內容設置
begin
  //打印內容設置(顯示/隱藏)
  with Formfhrd209 do
  begin
    if RBOver.Checked then
    begin
      QRCtitle2.ParentBand:=nil;
      QRCtitle1.ParentBand:=PageHeaderBand1;
      RBCtitleB.ParentBand:=QRCtitle1;
      RBCtitleB.Height:=105;
      QRCFooter2.ParentBand:=PageFooterBand1;
      QRLabel8.Caption:='Total OT';
      if RadioGroup1.ItemIndex = 1 then
      begin
        DateS := str_WeekToMondayDate(tntedit1.Text + '1');
        DateE := str_WeekToMondayDate(tntedit1.Text + '5');
        QRLabel3.Caption:='Thu5';
        QRLabel4.Caption:='Thu6';
        QRLabel5.Caption:='Thu7';
        QRLabel11.Caption:='Thu2';
        QRLabel15.Caption:='Thu3';
        QRLabel16.Caption:='Thu4';
      end;
      if RadioGroup1.ItemIndex = 0  then
      begin
        QRLabel3.Caption:='';
        QRLabel4.Caption:='';
        QRLabel5.Caption:='';
        QRLabel11.Caption:='';
        QRLabel15.Caption:='';
        QRLabel16.Caption:='';
        QRLabel19.Caption:='';
          if days.ItemIndex = 0  then
        dutDate := GetServerDateTime  ;
        if days.ItemIndex = 1  then
        begin
          if dayofweek(  GetServerDateTime ) = 7 then
            DutDate := GetServerDateTime + 2
          else
            DutDate := GetServerDateTime + 1 ;
        end;
        if days.ItemIndex = 2  then
        begin
          if ( dayofweek(  GetServerDateTime ) = 6 ) and ( dayofweek(  GetServerDateTime ) = 7 ) then
            DutDate := GetServerDateTime + 4
          else
            DutDate := GetServerDateTime + 2 ;
        end;
        if days.ItemIndex = 3  then
        begin
          if ( dayofweek(  GetServerDateTime ) = 6 ) and ( dayofweek(  GetServerDateTime ) = 7 ) then
            DutDate := GetServerDateTime + 5
          else
            DutDate := GetServerDateTime + 3 ;
        end;
        if days.ItemIndex = 4  then
        begin
          if ( dayofweek(  GetServerDateTime ) = 6 ) and ( dayofweek(  GetServerDateTime ) = 7 ) then
            DutDate := GetServerDateTime + 6
          else
            DutDate := GetServerDateTime + 4 ;
        end;
      end;
      QRLabel9.Caption := FormatDateTime('yyyy-mm-dd',DutDate );
      QRLNC1.Caption := '';
      QRLNC2.Caption := '';
      QRLNC3.Caption := '';
      QRLNC4.Caption := '';
      QRLNC5.Caption := '';
      QRLNC6.Caption := '';
      QRLNC7.Caption := '';
      QRLNC8.Caption := '';
      QRLNC9.Caption := '';
      QRDBText3.Visible := true ;
    end
    else begin
      QRCtitle1.ParentBand:=nil;
      QRCtitle2.ParentBand:=PageHeaderBand1;
      RBCtitleB.ParentBand:=QRCtitle2;
      RBCtitleB.Height:=0;
      QRCFooter2.ParentBand:=PageFooterBand1;
      QRLabel3.Caption:=GetLangName(LangStr,'dut11_not_deduct');
      QRLabel4.Caption:=GetLangName(LangStr,'dut11_half_deduct');
      QRLabel5.Caption:=GetLangName(LangStr,'dut11_all_deduct');
      QRLabel11.Caption:='';
      QRLabel15.Caption:='';
      QRLabel16.Caption:='';
      QRLNC1.Caption := 'nghi Cong';
      QRLNC2.Caption := 'nghi Cong';
      QRLNC3.Caption := 'nghi Cong';
      QRLNC4.Caption := 'nghi Cong';
      QRLNC5.Caption := '停工';
      QRLNC6.Caption := 'DC:';
      QRLNC7.Caption := 'DC:';
      QRLNC8.Caption := 'DC:';
      QRLNC9.Caption := 'DC:';
      QRLabel8.Caption:='';
      QRDBText3.Visible := false ;
      QRLabel8.Caption:='';
      QRShape1.Pen.Style := psClear ;
      QRShape2.Pen.Style := psClear ;
      QRShape3.Pen.Style := psClear ;
      QRShape4.Pen.Style := psClear ;
    end;
  end;
  //打印(預覽)
  if TtntButton(Sender).Name='BtnPrint' then
    SetPrintDataset(true)
  else
    SetPrintDataset(false);
end;

procedure TFormfhrd208.CobDeptBeginChange(Sender: TObject);
begin
    CobDeptEnd.Text:=CobDeptBegin.Text;
end;

procedure TFormfhrd208.TntButton3Click(Sender: TObject);
var
  i:integer;
begin
//  selectitem;

    for i:=0 to clb_dtl.Count-1 do
    begin
      clb_dtl.Checked[i]:=true;

      if not CheckOvertime(leftstr(clb_dtl.Items[i],6),dutdate,true) then
      begin
        //  showmessage(clb_dtl.Items[i]+GetLangName(ws_Words,'dut03_weekerror'));
          clb_dtl.Checked[i]:=false;
      end;
     // 2008-08-12 << 暫時關閉檢查加班時數
      if not CheckOvertime(leftstr(clb_dtl.Items[i],6),dutdate,false) then
      begin
     //  showmessage(clb_dtl.Items[i]+GetLangName(ws_Words,'dut03_yearerror'));
       clb_dtl.Checked[i]:=false;
      end;
   end;
end;

procedure TFormfhrd208.TntButton4Click(Sender: TObject);

  var
  i:integer;
begin
//  selectitem;
   for i:=0 to clb_dtl.Count-1 do
      clb_dtl.Checked[i]:=false;

end;
function TFormfhrd208.CheckOvertime(empid:String;Adate:TDate;IsWeek:boolean=true):boolean;
//檢查加班是否超時
var
  StartDate,EndDate:TDate;
  SqlStr:WideString;
  OvrHours,MaxHour,ShowHour:double;
  timeBegin,timeEnd:string;
begin

  OvrHours:=0.0;
  if IsWeek then
  begin
    StartDate:=StartOfTheWeek(Adate);
    EndDate:=EndOfTheWeek(Adate);
    MaxHour:=12.0;

  ADOStoredProc1.ProcedureName := 'proc_ot_year' ;
  ADOStoredProc1.Parameters.Clear ;
  ADOStoredProc1.Parameters.AddParameter.Name := 'empid';
  ADOStoredProc1.Parameters.ParamByName('empid').Value :=empid ;
  ADOStoredProc1.Parameters.AddParameter.Name := 'dates';
  ADOStoredProc1.Parameters.ParamByName('dates').Value :=FormatDateTime('yyyy/mm/dd',StartDate) ;
  ADOStoredProc1.Parameters.AddParameter.Name := 'datee';
  ADOStoredProc1.Parameters.ParamByName('datee').Value :=FormatDateTime('yyyy/mm/dd',EndDate) ;
  ADOStoredProc1.Close;
  ADOStoredProc1.Open   ;
   // with qry_check do
  with ADOStoredProc1  do
       begin
         if not Eof then
            OvrHours:=OvrHours+FieldByName('ot_hour').AsFloat;
         close;
        end;
      end
  else
   begin
    StartDate:=StartOfTheYear(Adate);
    EndDate:=EndOfTheYear(Adate);
    MaxHour:=300.0;

    ADOStoredProc1.ProcedureName := 'proc_ot_year' ;
    ADOStoredProc1.Parameters.Clear ;
    ADOStoredProc1.Parameters.AddParameter.Name := 'empid';
    ADOStoredProc1.Parameters.ParamByName('empid').Value :=empid ;
    ADOStoredProc1.Parameters.AddParameter.Name := 'dates';
    ADOStoredProc1.Parameters.ParamByName('dates').Value :=FormatDateTime('yyyy/',StartDate)+'01/01' ;
    ADOStoredProc1.Parameters.AddParameter.Name := 'datee';
    ADOStoredProc1.Parameters.ParamByName('datee').Value :=FormatDateTime('yyyy/',StartDate) + '12/31' ;
    with ADOStoredProc1   do
      begin
        close;
        open;
        if not Eof then
          OvrHours:=OvrHours+FieldByName('ot_hour').AsFloat;
      end;
      StartDate:=StartOfAMonth(YearOf(Adate),MonthOf(Adate));
 //   end;
    //showmessage(datetostr(StartDate)+DatetoStr(EndDate));
  end;

    if RunMode='2' then//檢查模式
      ShowHour:=min(OvrHours,MaxHour);
 //   SetStatusText(GetLangName(ws_Words,'emp_id')+empid+GetLangName(ws_Words,'msg_year_over')+floattostr(ShowHour));
    if OvrHours>MaxHour then//超時
    begin
      result:=false;
    end
    else//未超
    begin
      result:=true;
    end;
//  end;

end;

procedure TFormfhrd208.ADOQuery1CalcFields(DataSet: TDataSet);
var
  emp_id, sql :string ;
begin
  if rbover.Checked = true then
  begin
    emp_id:=Dataset.FieldByName('emp_id').AsString;
    sql := ' SELECT  DATEPART(yyyy, over_date) AS dut_year, emp_id, SUM(tot_hour)   AS ot_year ' ;
    sql := sql + ' FROM  fhrd_dut_over ';
    // sql := sql + ' WHERE (over_date >= ''2012-01-01'') AND (over_date <= ''2012-12-31'') and emp_id=''' + emp_id + '''' ;
    //2015.11.06
    sql := sql + ' WHERE convert(varchar(4), over_date, 112)= '+QuotedStr(FormatDateTime('YYYY', dutDate))+' and emp_id=''' + emp_id + '''' ;


    sql := sql + ' GROUP BY  emp_id, DATEPART(yyyy, over_date) ' ;

    dmhrdsys.SQLQuery3.sql.Clear;
    dmhrdsys.SQLQuery3.SQL.Add(sql);
    dmhrdsys.SQLQuery3.Open ;
    if not dmhrdsys.SQLQuery3.Eof then
      Dataset.FieldByName('ot_tot').AsString := dmhrdsys.SQLQuery3.fieldbyname('ot_year').AsString
    else
      Dataset.FieldByName('ot_tot').AsString := '0';  
  end;
end;

procedure TFormfhrd208.SetPrintDataset(PrintFlag:boolean);
//設置打印數據集
var
  sql_str,dept_code:string;
  i:integer ; 
begin
  sql_str:='select * from hrd_dept where 2>1';
  if CobDeptBegin.Text<>'' then
    sql_str:=sql_str+' and dept_code='''+leftstr(CobDeptBegin.Text,6)+'''';
  ///if CobDeptEnd.Text<>'' then
  //  sql_str:=sql_str+' and dept_code<='''+leftstr(CobDeptEnd.Text,6)+'''';
  with DMHrdsys.SQLQuery1 do
    begin
      close;
      sql.Clear;
      sql.add(sql_str);
      open;
    end;
     adoQuery2.Close ;
    adoQuery2.SQL.Clear ;
    adoQuery2.SQL.Add('delete from tmp_fhrd_dut29');
    adoQuery2.ExecSQL ;
    adoQuery1.SQL.Clear ;
    adoQuery1.SQL.Add('select *from tmp_fhrd_dut29');
    adoQuery1.Open ;
    
    for i:=0 to CLB_DTL.count-1 do
      begin
         if CLB_DTL.State[i]=cbChecked then
            begin
              adoQuery1.Append ;
              adoQuery1.FieldByName('emp_id').AsString :=midstr(CLB_DTL.Items.Strings[i],1,pos('-',CLB_DTL.Items.Strings[i])-1);
              adoQuery1.FieldByName('emp_name').Value  := copy(CLB_DTL.Items.Strings[i],8,length( CLB_DTL.Items.Strings[i])) ;
              adoQuery1.post ;
            end;

      end;

      with ADOQuery1 do
        begin
         // close;
         // sql.Clear;
         // sql.add(sql_str);
         // open;
          first ;
          if not EOF then
            //顯示部門
         //   with DMHrdsys.SQLQuery1 do
              Formfhrd209.QRLabelDept.Caption:=DMHrdsys.SQLQuery1.fieldByName('dept_code').Value+' '+DMHrdsys.SQLQuery1.fieldByName('abbr_titl').Value;
                DateS := str_WeekToMondayDate(tntedit1.Text + '1');
               DateE := str_WeekToMondayDate(tntedit1.Text + '5');
               Formfhrd209.QRLabel9.Caption :=  FormatDateTime('yyyy-mm-dd',DateS );
                Formfhrd209.QRLabel19.Caption :=  FormatDateTime('yyyy-mm-dd',DateE );
            //按部門打印/預覽
            with Formfhrd209.QuickRep1 do
              begin
                if PrintFlag then
                  Print
                else if DMHrdsys.SQLQuery1.RecNo=1 then
                  begin
                    if DMHrdsys.SQLQuery1.RecordCount>1 then
                      WideMessageDlg(GetLangName(LangStr,'dut11_muti_dept_pre'),mtConfirmation,[mbok],0);
                    if RadioGroup1.ItemIndex = 1 then
             begin
               DateS := str_WeekToMondayDate(tntedit1.Text + '1');
               DateE := str_WeekToMondayDate(tntedit1.Text + '5');
               Formfhrd209.QRLabel9.Caption :=  FormatDateTime('yyyy-mm-dd',DateS );
                Formfhrd209.QRLabel19.Caption :=  FormatDateTime('yyyy-mm-dd',DateE );
             end;
                    if  RadioGroup1.ItemIndex = 0 then
                      begin
                      Formfhrd209.QRLabel9.Caption := FormatDateTime('yyyy-mm-dd',DutDate ) ;
                    if days.ItemIndex = 0   then
                       Formfhrd209.QRLabel9.Caption := FormatDateTime('yyyy-mm-dd',GetServerDateTime  );
                    if days.ItemIndex = 1   then
                       begin
                         if dayofweek(  GetServerDateTime ) = 7 then
                            DutDate := GetServerDateTime + 2
                         else
                            DutDate := GetServerDateTime + 1 ;
                         Formfhrd209.QRLabel9.Caption := FormatDateTime('yyyy-mm-dd',GetServerDateTime + 1 );
                         Formfhrd209.QRLabel19.Caption :='';
                       end;
                    if days.ItemIndex = 2   then
                        begin
                         if ( dayofweek(  GetServerDateTime ) >= 6 ) and ( dayofweek(  GetServerDateTime ) <= 7 ) then
                              DutDate := GetServerDateTime + 3
                          else
                        //  begin
                        //  if  ( dayofweek(  GetServerDateTime ) = 7 ) then
                        //      DutDate := GetServerDateTime + 4
                       //   else
                              DutDate := GetServerDateTime + 2 ;
                              Formfhrd209.QRLabel9.Caption := FormatDateTime('yyyy-mm-dd',DutDate );
                               Formfhrd209.QRLabel19.Caption :='';
                         end;
                     if days.ItemIndex = 3   then
                       begin        //2009-08-12 hyt upd 4==>5
                          if ( dayofweek( GetServerDateTime ) >= 5 ) and ( dayofweek(  GetServerDateTime ) <= 7 )  then
                            DutDate := GetServerDateTime +4
                         else
                            DutDate := GetServerDateTime + 3 ;
                          Formfhrd209.QRLabel9.Caption := FormatDateTime('yyyy-mm-dd',DutDate );
                           Formfhrd209.QRLabel19.Caption :='';
                       end;
                     if days.ItemIndex = 4   then
                       begin
                          if ( dayofweek( GetServerDateTime ) >= 3 ) and ( dayofweek(  GetServerDateTime ) <= 7 )  then
                            DutDate := GetServerDateTime + 5
                         else
                            DutDate := GetServerDateTime + 4;
                         Formfhrd209.QRLabel9.Caption := FormatDateTime('yyyy-mm-dd',DutDate );
                          Formfhrd209.QRLabel19.Caption :='';
                       end;
                      end;
                    Preview;
                    exit;
                  end;
              end;
        end;
   //   DMHrdsys.SQLQuery1.Next;
  //  end;
  if PrintFlag then
    SetStatusText(GetLangName(LangStr,'print_finish'));
end;
{===============================================================================
  函數名稱:GetServerDateTime
===============================================================================}
function GetServerDateTime:TDateTime;
begin
  with dmhrdsys.sqlquery1 do
  begin
    close;
    SQL.clear;
    SQL.Add('select GetDate() AS ServerDateTime');
    try
      Open;
    except
      exit;
    end;
    Result:=FieldByName('ServerDateTime').AsDateTime;
    Close;
  end;
end;

procedure TFormfhrd208.FormCreate(Sender: TObject);
begin
  pri_arr:=GetPrvArr(username,'fhrd208');
  InitLang;// Init language
  InitForm;// Init Form
  Application.CreateForm(TFormfhrd209,Formfhrd209);
end;
function str_WeekToMondayDate(sWeekPlan:string):TDate;
var
  dFirstDate,dTemp:Tdate;
  iDay:integer;
  sDate :string ;  
begin
 // Result:=strToDate('1900/01/01');
  if length(sWeekPlan)<>3 then
    exit;

  try
  //  dFirstDate:=strToDate('200'+leftStr(sWeekPlan,1)+'/01/01');
    dFirstDate:=strToDate('2011/12/29');
    if (strToInt(rightStr(sWeekPlan,1)))  = 1 then
       dTemp:=dFirstDate+7*(strToInt(leftStr(sWeekPlan,2))-1)-3 ; // -(strToInt(rightStr(sWeekPlan,1))-2) ;
    if (strToInt(rightStr(sWeekPlan,1)))  = 5 then
       dTemp:=dFirstDate+7*(strToInt(leftStr(sWeekPlan,2))-1)+ 2  ; // -(strToInt(rightStr(sWeekPlan,1))-2) ;

    sDate := datetimetostr( dTemp ) ;
    iDay:=DayOfWeek(dTemp); //delpi sat=7,sun=1   monday=2

   // if (strToInt(rightStr(sWeekPlan,1)))  = 1 then
   //     dTemp := dTemp - 3  ;
   // if (strToInt(rightStr(sWeekPlan,1)))  = 5 then
    //    dTemp := dTemp - 3  ;

 //   if iDay>2 then
  //  begin
    //  dTemp:=dTemp-(iDay) ; //n-x=2 ==>x=n-2=iDay-2
  //  end
  //  else
  //  begin
   //   if iDay<2 then
   //     dTemp:=dTemp-6 ;  //如第一天是星期日的情況下就知道 要 -6 才可變為 星期一
   // end;
  except
    exit;
  end;
  Result:=dTemp;
end;
procedure TFormfhrd208.RadioGroup1Click(Sender: TObject);
begin
   if RadioGroup1.ItemIndex = 0 then
       begin
         tntedit1.Enabled := false ;
         days.Enabled := true ;
         Formfhrd209.QRShape1.Pen.Style := psClear ;
         Formfhrd209.QRShape2.Pen.Style := psClear ;
         Formfhrd209.QRShape3.Pen.Style := psClear ;
         Formfhrd209.QRShape4.Pen.Style := psClear ;
       //  Formfhrd209.QRShape9.Pen.Style := psClear ;
      //   Formfhrd209.QRShape10.Pen.Style := psClear ;
        // Formfhrd209.QRShape11.Pen.Style := psClear ;
       //  Formfhrd209.QRShape12.Pen.Style := psClear ;
       //  Formfhrd209.QRShape13.Pen.Style := psClear ;
       end;
    if RadioGroup1.ItemIndex = 1 then
       begin
         tntedit1.Enabled := true ;
         days.Enabled := false ;
          Formfhrd209.QRShape1.Pen.Style := psSolid ;
          Formfhrd209.QRShape2.Pen.Style := psSolid ;
          Formfhrd209.QRShape3.Pen.Style := psSolid ;
          Formfhrd209.QRShape4.Pen.Style := psSolid ;
        //  Formfhrd209.QRShape9.Pen.Style := psSolid ;
        //  Formfhrd209.QRShape10.Pen.Style := psSolid ;
        //  Formfhrd209.QRShape11.Pen.Style := psSolid ;
        //  Formfhrd209.QRShape12.Pen.Style := psSolid ;
        //  Formfhrd209.QRShape13.Pen.Style := psSolid ;
       end;
end;

end.
