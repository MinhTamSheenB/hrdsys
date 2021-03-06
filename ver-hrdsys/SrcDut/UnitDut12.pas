unit UnitDut12;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, TntDbCtrls, ExtCtrls, Grids, DBGrids, TntDBGrids,
  StdCtrls, Buttons, TntButtons, TntStdCtrls, TntExtCtrls, ComCtrls,
  TntComCtrls,WSDLIntf, DB, ADODB,TntDialogs,strutils, TntDB,Qt, QuickRpt,
  CheckLst, TntCheckLst,DateUtils,math;

type
  TFormDut12 = class(TForm)
    Panel1: TPanel;
    PanelTitle: TTntPanel;
    PanelMain: TPanel;
    Panel7: TPanel;
    Panel2: TPanel;
    label_dept_begin: TTntLabel;
    TntLabel1: TTntLabel;
    CobDeptBegin: TTntComboBox;
    CobDeptEnd: TTntComboBox;
    BtnPrint: TTntBitBtn;
    RbOver: TTntRadioButton;
    RbStop: TTntRadioButton;
    BtnPreview: TTntButton;
    days: TTntRadioGroup;
    TntButton1: TTntButton;
    RadioGroup1: TRadioGroup;
    TntEdit1: TTntEdit;
    TntGroupBox2: TTntGroupBox;
    CLB_dtl: TTntCheckListBox;
    lb_select: TTntListBox;
    TntPanel9: TTntPanel;
    TntStatusBar1: TTntStatusBar;
    TntStatusBar2: TTntStatusBar;
    selectall: TTntButton;
    unselectall: TTntButton;
    reset: TTntButton;
    TntButton2: TTntButton;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADOQuery1emp_id: TStringField;
    ADOQuery1name_vim: TWideStringField;
    ADOQuery1ot_tot: TFloatField;
    ADOQuery1ot_week: TFloatField;
    ADOQuery1dept_vim: TTntWideStringField;
    ADOQuery2: TADOQuery;
    ADOStoredProc1: TADOStoredProc;
    ADOQuery3: TADOQuery;
    ADOQuery4: TADOQuery;
    ADOQuery1rest_days: TFloatField;
    rbHb: TTntRadioButton;
    mmInfo: TTntMemo;
    ADOQuery1ID: TIntegerField;
     procedure InitLang;
    procedure InitForm;
     procedure SetPrintDataset(PrintFlag:boolean);
     procedure SetPrintDataset1(PrintFlag:boolean);
    procedure FormCreate(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
    procedure TntButton1Click(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure selectallClick(Sender: TObject);
    procedure unselectallClick(Sender: TObject);
    function CheckOvertime(empid:String;Adate:TDate;IsWeek:boolean=true):boolean;
    procedure CLB_dtlClickCheck(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDut12: TFormDut12;
  function GetServerDateTime:TDateTime;
   function str_WeekToMondayDate(sWeekPlan:string):TDate;
implementation
uses
  UnitHrdUtils,unitDMHrdsys, UnitPrtDut12 , UnitPrtDut12_hb;
var
  Langstr:TWideStrings;//語言字符串
  pri_arr:TPrvArr;//權限數組
  DutDate :Tdatetime;
  DateS, DateE :Tdatetime ;
{$R *.dfm}
procedure TFormDut12.InitLang;
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

procedure TFormDut12.InitForm;
{*************************************************************************
TO DO:初始化Form
*************************************************************************}
begin
{  if userLang='E' then
    fld_name:='dept_code+'' ''+eng_abbr'
  else if userLang='V' then
    fld_name:='dept_code+'' ''+vim_abbr'
  else
    fld_name:='dept_code+'' ''+abbr_titl';
  sql_str:='select '+fld_name+' as dept_name,dept_code from hrd_dept';
  SetComboxList(sql_str,CobDeptBegin);
  SetComboxList(sql_str,CobDeptEnd);
}
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
    //dFirstDate:=strToDate('2009/12/31');
    {dFirstDate:=strToDate('2009-12-31');
    if (strToInt(rightStr(sWeekPlan,1)))  = 1 then
       dTemp:=dFirstDate+7*(strToInt(leftStr(sWeekPlan,2))-1)-3 ; // -(strToInt(rightStr(sWeekPlan,1))-2) ;
    if (strToInt(rightStr(sWeekPlan,1)))  = 5 then
       dTemp:=dFirstDate+7*(strToInt(leftStr(sWeekPlan,2))-1)+ 2  ; // -(strToInt(rightStr(sWeekPlan,1))-2) ;

    sDate := datetimetostr( dTemp ) ;
    iDay:=DayOfWeek(dTemp); //delpi sat=7,sun=1   monday=2}

    dFirstDate:=strToDate('2011/01/06'); //2010-12-29 hyt upd
    if (strToInt(rightStr(sWeekPlan,1)))  = 1 then
       dTemp:=dFirstDate+7*(strToInt(leftStr(sWeekPlan,2))-1)-3 ; // -(strToInt(rightStr(sWeekPlan,1))-2) ;
    if (strToInt(rightStr(sWeekPlan,1)))  = 5 then
       dTemp:=dFirstDate+7*(strToInt(leftStr(sWeekPlan,2))-1)+ 2  ; // -(strToInt(rightStr(sWeekPlan,1))-2) ;

    sDate := datetimetostr( dTemp ) ;
    iDay:=DayOfWeek(dTemp); //delpi sat=7,sun=1   monday=2



  except
    exit;
  end;
  Result:=dTemp;
end;
procedure TFormDut12.FormCreate(Sender: TObject);
begin
    pri_arr:=GetPrvArr(username,'dut12');
  InitLang;// Init language
  InitForm;// Init Form
  Application.CreateForm(TFormPrtDut12,FormPrtDut12);
  Application.CreateForm(TFormPrtDut12_hb,FormPrtDut12_hb);
end;

procedure TFormDut12.RadioGroup1Click(Sender: TObject);
begin
 if RadioGroup1.ItemIndex = 0 then
       begin
         tntedit1.Enabled := false ;
         days.Enabled := true ;
         FormPrtDut12.QRShape1.Pen.Style := psClear ;
         FormPrtDut12.QRShape2.Pen.Style := psClear ;
         FormPrtDut12.QRShape3.Pen.Style := psClear ;
         FormPrtDut12.QRShape4.Pen.Style := psClear ;
         FormPrtDut12.QRShape9.Pen.Style := psClear ;
         FormPrtDut12.QRShape10.Pen.Style := psClear ;
         FormPrtDut12.QRShape11.Pen.Style := psClear ;
         FormPrtDut12.QRShape12.Pen.Style := psClear ;
         FormPrtDut12.QRShape13.Pen.Style := psClear ;
       end;
    if RadioGroup1.ItemIndex = 1 then
       begin
         tntedit1.Enabled := true ;
         days.Enabled := false ;
         FormPrtDut12.QRShape1.Pen.Style := psSolid ;
         FormPrtDut12.QRShape2.Pen.Style := psSolid ;
         FormPrtDut12.QRShape3.Pen.Style := psSolid ;
         FormPrtDut12.QRShape4.Pen.Style := psSolid ;
         FormPrtDut12.QRShape9.Pen.Style := psSolid ;
         FormPrtDut12.QRShape10.Pen.Style := psSolid ;
         FormPrtDut12.QRShape11.Pen.Style := psSolid ;
         FormPrtDut12.QRShape12.Pen.Style := psSolid ;
         FormPrtDut12.QRShape13.Pen.Style := psSolid ;
       end;
end;

procedure TFormDut12.ADOQuery1CalcFields(DataSet: TDataSet);
var
  emp_id, sql :string ;
  OvrHours,MaxHour,ShowHour:double;
  StartDate,EndDate:TDate;
  //
  DutDays: TStrings;
begin

   OvrHours := 0;
   if rbover.Checked = true then
      begin
        {emp_id:=Dataset.FieldByName('emp_id').AsString;
        sql :='select b.abbr_titl as abbr_titl  from hrd_emp as a, hrd_dept as b where a.dept_code=b.dept_code and  a.emp_id =''' + emp_id+ '''';
        dmhrdsys.SQLQuery2.SQL.Clear ;
        dmhrdsys.SQLQuery2.SQL.Add( sql )   ;
        dmhrdsys.SQLQuery2.open  ;
        if not dmhrdsys.SQLQuery2.Eof   then
           Dataset.FieldByName('abbr_titl').Value   := dmhrdsys.SQLQuery2.fieldbyname('abbr_titl').Value   ;
        dmhrdsys.SQLQuery2.Close ;

        StartDate:=StartOfTheWeek(dutdate);
        EndDate:=EndOfTheWeek(dutdate);
        ADOStoredProc1.ProcedureName := 'proc_ot_year' ;
        ADOStoredProc1.Parameters.Clear ;
        ADOStoredProc1.Parameters.AddParameter.Name := 'empid';
        ADOStoredProc1.Parameters.ParamByName('empid').Value :=emp_id ;
        ADOStoredProc1.Parameters.AddParameter.Name := 'dates';
        ADOStoredProc1.Parameters.ParamByName('dates').Value :=FormatDateTime('yyyy/mm/dd',StartDate) ; //FormatDateTime('yyyy/',StartDate)+'01/01' ;
        ADOStoredProc1.Parameters.AddParameter.Name := 'datee';
        ADOStoredProc1.Parameters.ParamByName('datee').Value :=FormatDateTime('yyyy/mm/dd',EndDate) ; //FormatDateTime('yyyy/',StartDate) + '12/31' ;
        with ADOStoredProc1   do
          begin
            close;
            open;
            if not Eof then
              OvrHours:=FieldByName('ot_hour').AsFloat;
          end;
        Dataset.FieldByName('ot_week').AsFloat  := OvrHours ;
        } //2013-09-04 delete hyt
   end;

  //2014.10.23 停工
  if RbStop.Checked then
  begin
    try
      DutDays := GetYearHol(DataSet.FieldByName('emp_id').AsString, FormatDateTime('YYYY', Date));
    except
      ShowMessage(DataSet.FieldByName('emp_id').AsString);
    end;
    DataSet.FieldByName('rest_days').AsString := DutDays.Strings[3];
  end;
  //
  if DataSet.RecNo = -1 then
    DataSet.FieldByName('ID').AsInteger := 1
  else
    DataSet.FieldByName('ID').AsInteger := DataSet.RecNo;
end;

procedure TFormDut12.TntButton1Click(Sender: TObject);
var
  sql_str :string ;
  i, k :integer ;
begin
  if ( RadioGroup1.ItemIndex = 1 ) and ( length( tntedit1.Text ) <> 2 ) then
  begin
    showmessage('Please Input Week !!!' ) ;
    exit ;
  end;

  // showmessage( inttostr(dayofweek(  GetServerDateTime )) ) ;
  k := dayofweek(  GetServerDateTime ) ;
  if RadioGroup1.ItemIndex = 1 then
  begin
    DateS := str_WeekToMondayDate(tntedit1.Text + '1');
    DateE := str_WeekToMondayDate(tntedit1.Text + '5');
  end;
  // showmessage( inttostr( k ) );
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
        if ( dayofweek(  GetServerDateTime ) >= 5 ) and ( dayofweek(  GetServerDateTime ) <= 6 ) then
            DutDate := GetServerDateTime + 4
        else
            DutDate := GetServerDateTime + 2 ;
      end;
  if days.ItemIndex = 3  then
      begin        //2009-08-12 hyt upd 4==>5
        if ( dayofweek(  GetServerDateTime ) >= 5 ) and ( dayofweek(  GetServerDateTime ) <=6 ) then
            DutDate := GetServerDateTime + 5
        else
            DutDate := GetServerDateTime + 3 ;
      end;
   if days.ItemIndex = 4  then
      begin
        if ( dayofweek(  GetServerDateTime ) >= 3 ) and ( dayofweek(  GetServerDateTime ) <= 6 ) then
            DutDate := GetServerDateTime + 6
        else
            DutDate := GetServerDateTime + 4 ;
      end;
  if ( dayofweek(  dutDate ) = 1 ) and (leftstr(CobDeptBegin.Text,6) <> 'V10302') and (leftstr(CobDeptBegin.Text,6) <> 'N02300')   then
     begin
       sql_str :='select *from hrd_dut_ot_pict where wrk_date=''' + FormatDateTime('yyyy/mm/dd',DutDate) + '''' ;
       adoQuery2.SQL.Clear ;
       adoQuery2.SQL.Add(sql_str);
       adoQuery2.Open ;
       if adoQuery2.Eof then
          begin
            showmessage('您所選擇的日期屬于星期天加班，沒有客戶審核文件，不可以打印!!!!');
            exit ;
          end;
     end;
     end;
   if rbover.Checked = true then
      begin
        sql_str:='select * from hrd_emp where epledt is null and '
                  +'dept_code='''+leftstr(CobDeptBegin.Text,6)+''' and ( emp_id not in ( select emp_id from hrd_emp_chan where date_s  >=''' + FormatDateTime('yyyy/mm/dd',dutdate  ) + '''and date_e  <=''' + FormatDateTime('yyyy/mm/dd',dutdate  ) + ''' and emp_cate =''1'') )   and ( emp_id not in ( select emp_id from hrd_emp_chan where date_s  >=''' + FormatDateTime('yyyy/mm/dd',dutdate  ) + ''' and  date_e  <=''' + FormatDateTime('yyyy/mm/dd',dutdate  ) + ''' and emp_cate =''2'') ) ' ;

      end
   else
     begin
        sql_str:='select * from hrd_emp where epledt is null and '
                  +'dept_code='''+leftstr(CobDeptBegin.Text,6)+'''' ;

      end;
     // sql_str:=sql_str+' order by emp_id ';
   CLB_dtl.Items.Clear ;
    with ADOQuery2 do
    begin
     SQL.Clear ;
     SQL.Add( sql_str ) ;
     Open ;
     while not eof do
       begin
         CLB_dtl.Items.Add(widestring(fieldbyname('emp_id').Value+'-'+fieldbyname('emp_chs').Value));
         next;
        // i := i + 1;
       end;
    end;
    BtnPrint.Enabled := true ;
    BtnPreview.Enabled := true ;
    selectall.Enabled := true ;
    unselectall.Enabled :=true;
  //  reset.Enabled :=true ;
end;
procedure TFormDut12.BtnPrintClick(Sender: TObject);
//打印內容設置
var k :integer;
begin
  //
  if rbHb.Checked then
  begin

  end
  else begin
    //打印內容設置(顯示/隱藏)
    with FormPrtDut12 do
    begin
      //加班單
      if RBOver.Checked then
      begin
          QRCtitle2.ParentBand:=nil;
          QRCtitle1.ParentBand:=PageHeaderBand1;
          RBCtitleB.ParentBand:=QRCtitle1;
          RBCtitleB.Height:=105;
          QRCFooter2.ParentBand:=PageFooterBand1;

          QRLabel8.Caption:='Week OT';
          QRLabel10.Caption:='Year OT';
          QRLabel3.Caption:='Thu5';
          QRLabel4.Caption:='Thu6';
          QRLabel5.Caption:='Thu7';
          QRLabel11.Caption:='Thu2';
          QRLabel15.Caption:='Thu3';
          QRLabel16.Caption:='Thu4';
          k := dayofweek(  GetServerDateTime ) ;
          if RadioGroup1.ItemIndex = 1 then
             begin
               DateS := str_WeekToMondayDate(tntedit1.Text + '1');
               DateE := str_WeekToMondayDate(tntedit1.Text + '5');
             end;
          if RadioGroup1.ItemIndex = 0  then
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
              if ( dayofweek(  GetServerDateTime ) >= 6 ) and ( dayofweek(  GetServerDateTime ) <= 7 ) then
                  DutDate := GetServerDateTime + 4
               else
                  DutDate := GetServerDateTime + 2 ;
             end;
           if days.ItemIndex = 3  then
             begin        //2009-08-12 hyt upd 4==>5
              if ( dayofweek(  GetServerDateTime ) >= 5 ) and ( dayofweek(  GetServerDateTime ) <= 6 ) then
                  DutDate := GetServerDateTime + 5
               else
                  DutDate := GetServerDateTime + 3 ;
             end;
            if days.ItemIndex = 4  then
             begin
              if ( dayofweek(  GetServerDateTime ) >= 3 ) and ( dayofweek(  GetServerDateTime ) <= 6 ) then
                  DutDate := GetServerDateTime + 6
               else
                  DutDate := GetServerDateTime + 4 ;
             end;
             end;
        //  QRShape4.Height := 1;
        //  showmessage( FormatDateTime('yyyy-mm-dd',DutDate ) ) ;
          if RadioGroup1.ItemIndex = 0 then
             QRLabel9.Caption := FormatDateTime('yyyy-mm-dd',DutDate )
          else
             begin
                QRLabel9.Caption :=  FormatDateTime('yyyy-mm-dd',DateS );
                QRLabel19.Caption :=  FormatDateTime('yyyy-mm-dd',DateE );
             end;

          QRLNC1.Caption := '';
          QRLNC2.Caption := '';
          QRLNC3.Caption := '';
          QRLNC4.Caption := '';
          QRLNC5.Caption := '';
          QRLNC6.Caption := '';
          QRLNC7.Caption := '';
          QRLNC8.Caption := '';
          QRLNC9.Caption := '';
        //  QRDBText3.Visible := true ;
        //  QRDBText4.Visible := true ;
          if RadioGroup1.ItemIndex = 1 then
             begin
               QRShape1.Pen.Style := psSolid ;
               QRShape2.Pen.Style := psSolid ;
               QRShape3.Pen.Style := psSolid ;
               QRShape4.Pen.Style := psSolid ;
               QRShape9.Pen.Style := psSolid ;
               QRShape10.Pen.Style := psSolid ;
               QRShape11.Pen.Style := psSolid ;
               QRShape12.Pen.Style := psSolid ;
               QRShape13.Pen.Style := psSolid ;
               QRLabel11.Caption:='Thu2';
               QRLabel15.Caption:='Thu3';
               QRLabel16.Caption:='Thu4';
               QRLabel3.Caption:='Thu5';
               QRLabel4.Caption:='Thu6';
               QRLabel5.Caption:='Thu7';
             end ;
           if RadioGroup1.ItemIndex = 0 then
             begin
               QRShape1.Pen.Style := psClear ;
               QRShape2.Pen.Style := psClear ;
               QRShape3.Pen.Style := psClear ;
               QRShape4.Pen.Style := psClear ;
               QRShape9.Pen.Style := psClear ;
               QRShape10.Pen.Style := psClear ;
               QRShape11.Pen.Style := psClear ;
               QRShape12.Pen.Style := psClear ;
               QRShape13.Pen.Style := psClear ;
               QRLabel11.Caption:='';
               QRLabel15.Caption:='';
               QRLabel16.Caption:='';
               QRLabel3.Caption:='';
               QRLabel4.Caption:='';
               QRLabel5.Caption:='';
               QRLabel19.Caption :='';
             end;
        //2014.10.23
        QRDBText7.DataField := '';       
      end
      else if RbStop.Checked then
      //停工單
      begin
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
     //   QRShape4.Height := 0;
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
        QRLabel10.Caption:='';
        QRShape1.Pen.Style := psClear ;
        QRShape2.Pen.Style := psClear ;
        QRShape3.Pen.Style := psClear ;
       // QRDBText3.Visible := false ;
       // QRDBText4.Visible := false ;
        QRShape4.Pen.Style := psClear ;
        QRShape9.Pen.Style := psClear ;
        QRShape10.Pen.Style := psClear ;
        QRShape11.Pen.Style := psClear ;
        QRShape12.Pen.Style := psClear ;
        QRShape13.Pen.Style := psClear ;
        //2014.10.23
        QRDBText7.DataField := 'rest_days';
      end;
    end;
  end;
  //打印(預覽)
  if TtntButton(Sender).Name='BtnPrint' then
    SetPrintDataset(true)
  else
    SetPrintDataset(false);
end;

procedure TFormDut12.selectallClick(Sender: TObject);
var
  i:integer;
begin
  //selectitem;

    for i:=0 to clb_dtl.Count-1 do
    begin
      clb_dtl.Checked[i]:=true;

      {if not CheckOvertime(leftstr(clb_dtl.Items[i],6),dutDate,true) then
      begin
          showmessage(clb_dtl.Items[i]+' 本周加班已超過 12 個小時 ');
          clb_dtl.Checked[i]:=false;
      end;
     // 2008-08-12 << 暫時關閉檢查加班時數
      if not CheckOvertime(leftstr(clb_dtl.Items[i],6),dutDate,false) then
      begin
       showmessage(clb_dtl.Items[i]+'  本年加班已超過 250 個小時');
       clb_dtl.Checked[i]:=false;
      end;} //2013-09-03 hyt delete
    end;
end;

procedure TFormDut12.unselectallClick(Sender: TObject);

  var
  i:integer;
begin
 // selectitem;
 // if LV_BS.Selected<>nil then
    for i:=0 to clb_dtl.Count-1 do
      clb_dtl.Checked[i]:=false;

end;
procedure TFormDut12.SetPrintDataset(PrintFlag:boolean);
//設置打印數據集
var
  sql_str,dept_code,emp,sql,name:string;
  i:integer ;
  OvrHours,MaxHour,ShowHour:double;
    StartDate,EndDate:TDate;
begin
  sql_str:='select * from hrd_dept where 2>1';
  if CobDeptBegin.Text<>'' then
    sql_str:=sql_str+' and dept_code='''+leftstr(CobDeptBegin.Text,6)+'''';
  ///if CobDeptEnd.Text<>'' then
  //  sql_str:=sql_str+' and dept_code<='''+leftstr(CobDeptEnd.Text,6)+'''';
  with DMHrdsys.SQLQuery3 do
  begin
    close;
    sql.Clear;
    sql.add(sql_str);
    open;
  end;
 //hile not DMHrdsys.SQLQuery1.EOF do
  adoQuery1.Close ;
  adoQuery1.SQL.Clear ;
  adoQuery1.SQL.Add('delete from tmp_hrd_dut11');
  adoQuery1.ExecSQL ;

  adoQuery1.SQL.Clear ;
  adoQuery1.SQL.Add('select *from tmp_hrd_dut11');
  adoQuery1.Open ;

  for i:=0 to CLB_DTL.count-1 do
  begin
    if CLB_DTL.State[i]=cbChecked then
    begin
      emp :=copy(CLB_DTL.Items.Strings[i],1,6) ;
      name := copy(CLB_DTL.Items.Strings[i],8,length( CLB_DTL.Items.ValueFromIndex[CLB_DTL.ItemIndex])) ;
      //sql := 'select ot_year, name_vim_en as emp_chs  from hrd_emp left join hrd_dut_emp_ot on hrd_emp.emp_id = hrd_dut_emp_ot.emp_id  where hrd_emp.emp_id=''' + emp + '''' ;
      //***<<<2011-10-12 hyt add   主要是發現    hrd_dut_emp_ot 的資料不準確，才參考dut22(2)
      if RBOver.Checked then
      begin
        sql := 'select ot_year, name_vim_en  from hrd_emp left join hrd_dut_emp_ot on hrd_emp.emp_id = hrd_dut_emp_ot.emp_id  where hrd_emp.emp_id=''' + emp + '''' ;
      end
      else
      begin
        sql := 'select ot_year, name_vim_en  from hrd_emp left join hrd_dut_emp_ot on hrd_emp.emp_id = hrd_dut_emp_ot.emp_id  where hrd_emp.emp_id=''' + emp + '''' ;
      end;
      //***>>>
      adoQuery1.Append ;
      adoQuery1.FieldByName('emp_id').AsString := emp ;//adoQuery3.fieldbyname('emp_id').AsString ;  // pos('-',CLB_DTL.Items.Strings[i])-1

      adoQuery4.SQL.Clear ;
      adoQuery4.SQL.Add(sql) ;
      adoQuery4.Open ;
      //***<<<2011-10-15 hyt upd 如果出現從來都沒有加班的情況，再處理一次
      if adoQuery4.Eof then
      begin
        sql := 'select 0 as ot_year, name_vim_en  from hrd_emp where hrd_emp.emp_id=''' + emp + '''' ;
        adoQuery4.SQL.Clear ;
        adoQuery4.SQL.Add(sql) ;
        adoQuery4.Open ;
      end;
      //***>>>
      if not adoQuery4.Eof then
      begin
        if RBOver.Checked then
          adoQuery1.FieldByName('ot_tot').Value  := adoQuery4.Fieldbyname('ot_year').AsFloat  ;
       adoQuery1.FieldByName('name_vim_en').Value  := adoQuery4.Fieldbyname('name_vim_en').Value  ; //adoQuery3.fieldbyname('name_vim_en').Value  ; //emp_chs
      end;
      adoQuery1.post ;
      //   end;
    end;
  end;

  with ADOQuery1 do
  begin

    first ;
    if not EOF then
    begin
      if rbHb.Checked then
      begin
        FormPrtDut12_hb.QRLabelDept.Caption:=DMHrdsys.SQLQuery3.fieldByName('dept_code').Value+' '+DMHrdsys.SQLQuery3.fieldByName('abbr_titl').Value;
        FormPrtDut12_hb.QRLblInfo.Caption := mmInfo.Lines.Strings[1];
        FormPrtDut12_hb.QRLblInfo1.Caption := mmInfo.Lines.Strings[0];
      end
      else
        FormPrtDut12.QRLabelDept.Caption:=DMHrdsys.SQLQuery3.fieldByName('dept_code').Value+' '+DMHrdsys.SQLQuery3.fieldByName('abbr_titl').Value;
    end;
    //按部門打印/預覽
    if not rbHb.Checked then
    begin
      with FormPrtDut12.QuickRep1 do
      begin
        //***<<<2013-10-02 hyt add
        if RBOver.Checked then
        begin
          FormPrtDut12.QRLabel_num.Caption:='Mamau Bieu:RSS05-02A';
        end
        else
        begin
          FormPrtDut12.QRLabel_num.Caption:='';
        end;
        //***>>>

        if PrintFlag then
          Print
        else if DMHrdsys.SQLQuery3.RecNo=1 then
        begin
          if DMHrdsys.SQLQuery3.RecordCount>1 then
            WideMessageDlg(GetLangName(LangStr,'dut11_muti_dept_pre'),mtConfirmation,[mbok],0);
           if RadioGroup1.ItemIndex = 1 then
           begin
             DateS := str_WeekToMondayDate(tntedit1.Text + '1');
             DateE := str_WeekToMondayDate(tntedit1.Text + '5');
           end;
          if  RadioGroup1.ItemIndex = 0 then
          begin
            if days.ItemIndex = 0   then
               FormPrtDut12.QRLabel9.Caption := FormatDateTime('yyyy-mm-dd',GetServerDateTime  );
            if days.ItemIndex = 1   then
            begin
              if dayofweek( GetServerDateTime ) = 7 then
                FormPrtDut12.QRLabel9.Caption := FormatDateTime('yyyy-mm-dd',GetServerDateTime + 2 )
              else
                FormPrtDut12.QRLabel9.Caption := FormatDateTime('yyyy-mm-dd',GetServerDateTime + 1 );
            end;
            if days.ItemIndex = 2   then
            begin
              if ( dayofweek( GetServerDateTime ) >= 6 ) and ( dayofweek(  GetServerDateTime ) <= 7 )  then
                FormPrtDut12.QRLabel9.Caption := FormatDateTime('yyyy-mm-dd',GetServerDateTime + 3 )
              else
                FormPrtDut12.QRLabel9.Caption := FormatDateTime('yyyy-mm-dd',GetServerDateTime + 2 );
            end;
            if days.ItemIndex = 3   then
            begin        //2009-08-12 hyt upd 4==>5
              if ( dayofweek( GetServerDateTime ) >= 5 ) and ( dayofweek(  GetServerDateTime ) <= 7 )  then
                FormPrtDut12.QRLabel9.Caption := FormatDateTime('yyyy-mm-dd',GetServerDateTime +4 )
              else
                FormPrtDut12.QRLabel9.Caption := FormatDateTime('yyyy-mm-dd',GetServerDateTime + 3 );
            end;
            if days.ItemIndex = 4   then
            begin
              if ( dayofweek( GetServerDateTime ) >= 3 ) and ( dayofweek(  GetServerDateTime ) <= 7 )  then
                FormPrtDut12.QRLabel9.Caption := FormatDateTime('yyyy-mm-dd',GetServerDateTime + 5 )
              else
                FormPrtDut12.QRLabel9.Caption := FormatDateTime('yyyy-mm-dd',GetServerDateTime + 4 );
            end;
          end;
          //
          Preview;
          exit;
        end;
      end;
    end
    else begin
      with FormPrtDut12_hb.QuickRep1 do
      begin
        if PrintFlag then
          Print
        else if DMHrdsys.SQLQuery3.RecNo=1 then
        begin
           //
          Preview;
          exit;
        end;
      end;
    end;
  end;
  //
  if PrintFlag then
    SetStatusText(GetLangName(LangStr,'print_finish'));
end;
procedure TFormDut12.SetPrintDataset1(PrintFlag:boolean);
//設置打印數據集
var
  sql_str,dept_code,emp,sql,name:string;
  i:integer ;
  OvrHours,MaxHour,ShowHour:double;
    StartDate,EndDate:TDate;
begin
  sql_str:='select * from hrd_dept where 2>1';
  if CobDeptBegin.Text<>'' then
    sql_str:=sql_str+' and dept_code='''+leftstr(CobDeptBegin.Text,6)+'''';
  ///if CobDeptEnd.Text<>'' then
  //  sql_str:=sql_str+' and dept_code<='''+leftstr(CobDeptEnd.Text,6)+'''';
  with DMHrdsys.SQLQuery3 do
    begin
      close;
      sql.Clear;
      sql.add(sql_str);
      open;
    end;
 //hile not DMHrdsys.SQLQuery1.EOF do
    adoQuery1.Close ;
    adoQuery1.SQL.Clear ;
    adoQuery1.SQL.Add('delete from tmp_hrd_dut11');
    adoQuery1.ExecSQL ;

    adoQuery1.SQL.Clear ;
    adoQuery1.SQL.Add('select *from tmp_hrd_dut11');
    adoQuery1.Open ;

    for i:=0 to CLB_DTL.count-1 do
      begin
         if CLB_DTL.State[i]=cbChecked then
            begin
              emp :=copy(CLB_DTL.Items.Strings[i],1,6) ;
              name := copy(CLB_DTL.Items.Strings[i],8,length( CLB_DTL.Items.ValueFromIndex[CLB_DTL.ItemIndex])) ;
              sql := 'select ot_year, emp_chs  from hrd_emp left join hrd_dut_emp_ot on hrd_emp.emp_id = hrd_dut_emp_ot.emp_id  where hrd_emp.emp_id=''' + emp + '''' ;
             // sql := 'select  name_vim_en  from hrd_emp  where hrd_emp.emp_id=''' + emp + '''' ;

              adoQuery1.Append ;
              adoQuery1.FieldByName('emp_id').AsString := emp ;//adoQuery3.fieldbyname('emp_id').AsString ;  // pos('-',CLB_DTL.Items.Strings[i])-1
           //   adoQuery1.FieldByName('name_vim_en').Value  := name ; //adoQuery3.fieldbyname('name_vim_en').Value  ;

              adoQuery4.SQL.Clear ;
              adoQuery4.SQL.Add(sql) ;
              adoQuery4.Open ;
              if not adoQuery4.Eof then
                 begin
                  adoQuery1.FieldByName('ot_tot').Value  := adoQuery4.Fieldbyname('ot_year').AsFloat  ;
                  adoQuery1.FieldByName('name_vim_en').Value  := adoQuery4.Fieldbyname('emp_chs').Value  ; //adoQuery3.fieldbyname('name_vim_en').Value  ;
                 end;
              adoQuery1.post ;
              //   end;
            end;

      end;

     { with ADOQuery1 do
        begin

          first ;
          if not EOF then
            //顯示部門

            //按部門打印/預覽
            with FormPrtDut13.QuickRep1 do
              begin
                if PrintFlag then
                  Print
                else if DMHrdsys.SQLQuery1.RecNo=1 then
                  begin
                    if DMHrdsys.SQLQuery1.RecordCount>1 then
                      WideMessageDlg(GetLangName(LangStr,'dut11_muti_dept_pre'),mtConfirmation,[mbok],0);

                    Preview;
                    exit;
                  end;
              end;
        end;          }
   //   DMHrdsys.SQLQuery1.Next;
  //  end;
  if PrintFlag then
    SetStatusText(GetLangName(LangStr,'print_finish'));
end;
function TformDut12.CheckOvertime(empid:String;Adate:TDate;IsWeek:boolean=true):boolean;
//檢查加班是否超時
var
  StartDate,EndDate:TDate;
  SqlStr:WideString;
  OvrHours,MaxHour,ShowHour, Shour:double;
  timeBegin,timeEnd:string;
begin
 // timeBegin:=LV_bs.Selected.SubItems.Strings[1];//時段開始時間
 // timeEnd:=LV_bs.Selected.SubItems.Strings[2];//時段結束時間
  OvrHours:=0.0;
  ShowHour:= 0 ;
  if IsWeek then
  begin
    StartDate:=StartOfTheWeek(dutdate);
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
       MaxHour:=250.0;

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
            OvrHours:=FieldByName('ot_hour').AsFloat;
        end;
      StartDate:=StartOfAMonth(YearOf(Adate),MonthOf(Adate));
    end;

     if RadioGroup1.ItemIndex = 1 then
      begin
         OvrHours:= 4 ;
      end;
    Shour := 12 - OvrHours ;
    if RunMode='2' then//檢查模式
      ShowHour:=min(OvrHours,MaxHour);
   // SetStatusText(GetLangName(ws_Words,'emp_id')+empid+GetLangName(ws_Words,'msg_year_over')+floattostr(ShowHour));
    if OvrHours>=MaxHour then//超時
    begin
      result:=false; 
    end
    else//未超
    begin
        if  ( IsWeek ) and ( Shour < 3) then
        begin
          showmessage(' 該員工本周已經加班 ' + floattostr( OvrHours )  + ' 小時,本周還可以加班 ' +floattostr( SHour ) + ' 小時') ;
        end;
      result:=true;

    end;
//  end;

end;

procedure TFormDut12.CLB_dtlClickCheck(Sender: TObject);
var
  str,name :string ;
begin

  //adoQuery1.Open;
  if CLB_DTL.Checked[CLB_DTL.ItemIndex]  then
     begin
       if CheckOvertime(leftstr(clb_dtl.Items[CLB_DTL.ItemIndex],6),dutDate,true) = false then
          showmessage('該員工本周已加班超過 12 小時')
     end;
end;

end.
