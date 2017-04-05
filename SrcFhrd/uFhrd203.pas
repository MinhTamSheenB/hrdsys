{******************************************************************************
name：fhrd203(考勤月結)
author: tim
create date:2005-08-17
Modify date:2005-08-27---tristan
commentate:考勤月結
*******************************************************************************}
unit uFhrd203;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TntForms, StdCtrls, Buttons, TntButtons, TntStdCtrls, ExtCtrls,
  TntExtCtrls, TntGrids, Grids, DB, ADODB,StrUtils,DateUtils, DBGrids,
  TntDBGrids,WSDLIntf,TntDialogs;

type
  TFormfhrd203 = class(TTntForm)
    TntPanel_title: TTntPanel;
    TntGroupBox1: TTntGroupBox;
    TntLabel_month: TTntLabel;
    TntEdit_month: TTntEdit;
    TntBitBtn_exit: TTntBitBtn;
    TntBitBtn_month: TTntBitBtn;
    TntGroupBox_browseData: TTntGroupBox;
    TntStringGrid_attend: TTntStringGrid;
    holidayQry: TADOQuery;
    checkQry: TADOQuery;
    procedure TntFormCreate(Sender: TObject);
    procedure TntBitBtn_monthClick(Sender: TObject);
    procedure msgError(errormsg:WideString);
    procedure msgInformation(infomsg:WideString);
    procedure TntBitBtn_exitClick(Sender: TObject);
    procedure TntFormClose(Sender: TObject; var Action: TCloseAction);
    Function getHolTime(sEmpId : string ; lcDay : string ; sClsId : string):Integer;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formfhrd203: TFormfhrd203;
  gMonth:string;
  gLangWStrs:TWideStrings;
implementation
uses
  UnitHrdUtils,unitDMHrdsys,UnitHrdMain;
{$R *.dfm}

procedure TFormfhrd203.TntFormCreate(Sender: TObject);
var
  lcYear,lcMonth:integer;
  lcUsedWords:string;
begin

  {***取月結月份***}

  with DMHrdsys.SQLQuery1 do
  begin
    close;
    SQL.Clear ;
    SQL.Add('select c_month from close_f');
    Open ;
  end;

  gMonth:=DMHrdsys.SQLQuery1.Fields[0].Value ;
  lcYear:= StrToInt(LeftStr(gMonth,4));
  lcMonth:= StrToInt(RightStr(gMonth,2));

  //add one month

  if lcMonth=12 then
  begin
    lcMonth :=1;
    lcYear:=lcYear+1;
  end
  else
  begin
    lcMonth :=lcMonth+1;
  end;
  if lcMonth<10 then
    gMonth:=IntToStr(lcYear)+'0'+IntToStr(lcMonth)
  else
    gMonth:=IntToStr(lcYear)+IntToStr(lcMonth);
  TntEdit_month.Text :=gMonth;

  //Grid's font

  TntStringGrid_attend.Font.Name :='Palatino Linotype';

  {***初始化語言變量***}

  lcUsedWords:='fhrd203,fhrd203_title,common_browse_data,';
  lcUsedWords:=lcUsedWords+'table_field_dut_mon,table_field_emp_id,'+
  'table_field_emp_name,table_field_cls_id,table_field_days,time_count,';
  lcUsedWords:=lcUsedWords+'button_month,button_exit,';
  lcUsedWords:=lcUsedWords+'msg_not_monthlyDo,msg_update_error,msg_add_error,'+
  'msg_congratulation,confirm_close';
  gLangWStrs:=GetLangWideStrs(lcUsedWords);
  TntPanel_title.Caption :=GetLangName(gLangWStrs,'fhrd203_title');
  TntLabel_month.Caption :=GetLangName(gLangWStrs,'table_field_dut_mon');
  TntBitBtn_month.Caption :=GetLangName(gLangWStrs,'button_month');
  TntBitBtn_exit.Caption :=GetLangName(gLangWStrs,'button_exit');
  TntGroupBox_browseData.Caption :=GetLangName(gLangWStrs,'common_browse_data');

end;

{***********************************
Name: getHolTime
Func: 取請假時數
Args:
    sEmpId-> 工號
    lcDay->  月中某天
************************************}

Function TFormFhrd203.getHolTime(sEmpId : string ; lcDay : string ; sClsId : string):Integer;
var
  iHolTime : real;
  start_t,stop_t : string;
begin

  iHolTime := 0.0;

  {***取正常班別的起始和結束時間***}

  With DMHrdsys.SQLQuery3 do
  begin
    close;
    sql.Clear;
    sql.Add('select * from fhrd_segment where cls_id='''+sClsId+''' order by seg_id');
    open;
    First;
    start_t := FieldByName('start_t').Value;
    Last;
    stop_t := FieldByName('stop_t').Value;
  end;

  {***取請假資料***}

  with HolidayQry do
  begin
    close;
    sql.Clear;
    sql.Add('select cls_id,up_date,down_date,up_time,down_time '+
    'from fhrd_hol where '+
    'emp_id='''+sEmpId+''' '+
    'and up_date<='''+lcDay+''' '+
    'and down_date>='''+lcDay+''' ');
    open;

    {***若請假資料存在，計算請假時數，並處理排班時數***}

    if HolidayQry.RecordCount>0 then
    begin

      {***請假日期存在，且為第一天***}

      if (lcDay=FormatDateTime('yyyy/mm/dd',FieldByName('up_date').Value))
      and (lcDay<>FormatDateTime('yyyy/mm/dd',FieldByName('down_date').Value)) then
      begin
        iHolTime := (((StrToInt(LeftStr(stop_t,2))*60)+StrToInt(RightStr(stop_t,2)))-
        ((StrToInt(LeftStr(FieldValues['up_time'],2))*60)+StrToInt(RightStr(FieldValues['up_time'],2))))/60;
      end;

      {***請假日期存在，只有一天***}

      if (lcDay=FormatDateTime('yyyy/mm/dd',FieldByName('up_date').Value))
      and (lcDay=FormatDateTime('yyyy/mm/dd',FieldByName('down_date').Value)) then
      begin
        iHolTime := ((StrToInt(LeftStr(FieldByName('down_time').Value,2))*60+StrToInt(RightStr(FieldByName('down_time').Value,2)))-
        (StrToInt(LeftStr(FieldByName('up_time').Value,2))*60+StrToInt(RightStr(FieldByName('up_time').Value,2))))/60;
      end;

      {***請假日期存在，且為最後一天***}

      if (lcDay<>FormatDateTime('yyyy/mm/dd',FieldByName('up_date').Value))
      and (lcDay=FormatDateTime('yyyy/mm/dd',FieldByName('down_date').Value)) then
      begin
        iHolTime := ((StrToInt(LeftStr(FieldByName('down_time').Value,2))*60+StrToInt(RightStr(FieldByName('down_time').Value,2)))-
        (StrToInt(LeftStr(start_t,2))*60+StrToInt(RightStr(start_t,2))))/60;
      end;

      {***請假日期存在，且請假全天***}

      if (lcDay>FormatDateTime('yyyy/mm/dd',FieldByName('up_date').Value))
      and (lcDay<FormatDateTime('yyyy/mm/dd',FieldByName('down_date').Value)) then
      begin
        iHolTime := ((StrToInt(LeftStr(stop_t,2))*60+StrToInt(RightStr(stop_t,2)))-
        (StrToInt(LeftStr(start_t,2))*60+StrToInt(RightStr(start_t,2))))/60;
      end;
    end;
  end;
end;

{***********************************
Name: TntBitBtn_monthClick
Func: 進行月結
Args:
    lcCurMonth->當前月份
    lcSql->查詢新增修改語句
    lcDate_bgn->當前月份起始日
    lcDate_end->當前月份結束日
    lcDay-> 當天日期
    lcDateStr->排班日期
    lcWeek->星期日標誌
    i,j->循環變量
    t_count->上班時數
    iHolTime->請假時數
************************************}

procedure TFormfhrd203.TntBitBtn_monthClick(Sender: TObject);
var
  lcCurMonth,lcSql,lcDate_bgn,lcDate_end,lcDateStr,lcWeek:string;
  lcDay : string;
  i,j,lcDays:integer;
  iHolTime,t_count : real;
  tempCls : string;
begin

  lcCurMonth:=FormatDateTime('yyyymm',date);

  if TntEdit_month.Text>lcCurMonth then
  begin
    {***該月份不允許月結***}
    msgError(GetLangName(gLangWStrs,'msg_not_monthlyDo'));
    exit;
  end;

  {***處理月份***}

  lcDate_bgn:=LeftStr(gMonth,4)+'/'+RightStr(gMonth,2)+'/01';
  lcDays:=DaysInMonth(StrToDateTime(lcDate_bgn));
  lcDate_end:=LeftStr(gMonth,4)+'/'+RightStr(gMonth,2)+'/'+IntToStr(lcDays);
  try
  DMHrdsys.SQLQuery1.Connection.BeginTrans;
  with DMHrdsys.SQLQuery1 do
  begin

    {***條件範圍-取員工號***}

    close;
    SQL.Clear ;
    lcSql := 'select distinct emp_id from fhrd_arr where '+
    'arr_date between ';
    lcSql := lcSql+''''+lcDate_bgn+'''';
    lcSql := lcSql+' and '+''''+lcDate_end+'''';
    SQL.Add(lcSql);
    Open ;

    {***初始化進度條***}

    setProcessBar(true,1,RecordCount*lcDays);

    First ;
    while not Eof do
    begin
      For i:=1 to lcDays do
      begin
        setProcessBar(false,1);
        lcDay := LeftStr(gMonth,4)+'/'+RightStr(gMonth,2)+'/'+IntToStr(i);
        lcDay := FormatDateTime('yyyy/mm/dd',strToDateTime(lcDay));
        lcDateStr:=
        RightStr(FormatDateTime('yyyy/mm/dd',strToDateTime(lcDay)),2);

        {***取當天排班資料***}

        with DMHrdsys.SQLQuery2 do
        begin
          close;
          sql.Clear;
          sql.Add('select cls_id,seg_id,(select time_count from fhrd_segment'+
          ' where cls_id=fhrd_arr.cls_id and seg_id=fhrd_arr.seg_id) as time_count'+
          ' from fhrd_arr where '+
          'emp_id='''+DMHrdsys.SQLQuery1.FieldValues['emp_id']+''' '+
          'and arr_date='''+lcDay+'''');
          open;

          {***若排班資料存在，計算排班時數***}

          if DMHrdsys.SQLQuery2.RecordCount>0 then
          begin
            First;
            t_count := 0.0;
            while Not Eof do
            begin
              if VarIsNull(FieldByName('time_count').Value) then
                t_count := t_count+0
              else
                t_count := t_count+StrToInt(trim(FieldByName('time_count').Value));
              next;
            end;
          end;

          if not VarIsNull(DMHrdsys.SQLQuery2.FieldValues['cls_id']) then
          begin
            iHolTime := getHolTime(DMHrdsys.SQLQuery1.FieldValues['emp_id'],lcDay,DMHrdsys.SQLQuery2.FieldValues['cls_id']);
            t_count := t_count-iHolTime;
          end
          else
          begin
            t_count := 0;
            iHolTime := 0;
          end;


          {***處理正常班時***}

          if t_count>0 then
          begin
            if DMHrdsys.SQLQuery2.RecordCount>0 then
            begin
              First;
              {***驗證月結檔中這個月的這個班別有沒有排***}
              with checkQry do
              begin
                close;
                sql.Clear;
                sql.Add('select * from fhrd_mdut where dut_mon='''+gMonth+''' '+
                'and emp_id='''+DMHrdsys.SQLQuery1.FieldValues['emp_id']+''' '+
                'and cls_id='''+DMHrdsys.SQLQuery2.FieldValues['cls_id']+'''');
                open;
                if RecordCount>0 then
                begin
                  // update
                  lcSql:='update fhrd_mdut set '+
                  'day'+lcDateStr+'='''+FloatToStr(t_count)+'''';
                  lcSql:=lcSql+' where dut_mon='''+gMonth+'''';
                  lcSql:=lcSql+' and emp_id='''+DMHrdsys.SQLQuery1.FieldValues['emp_id']+'''';
                  lcSql:=lcSql+' and cls_id='''+DMHrdsys.SQLQuery2.FieldValues['cls_id']+'''';
                  DMHrdsys.ADOCommand1.CommandText :='';
                  DMHrdsys.ADOCommand1.CommandText :=lcSql;
                  try
                    DMHrdsys.ADOCommand1.Execute;
                    t_count := 0;
                  except
                    {***修改失敗***}
                    msgError(GetLangName(gLangWStrs,'msg_update_error'));
                  exit;
                  end;
                end
                else
                begin
                  // insert
                  lcSql:='insert into fhrd_mdut(upd_user,dut_mon,emp_id,'+
                  'cls_id,day'+lcDateStr+')';
                  lcSql:=lcSql+' values('''+UserName+'''';
                  lcSql:=lcSql+','''+gMonth+'''';
                  lcSql:=lcSql+','''+DMHrdsys.SQLQuery1.FieldValues['emp_id']+'''';
                  lcSql:=lcSql+','''+DMHrdsys.SQLQuery2.FieldValues['cls_id']+'''';
                  lcSql:=lcSql+','''+FloatToStr(t_count)+''')';
                  DMHrdsys.ADOCommand1.CommandText :='';
                  DMHrdsys.ADOCommand1.CommandText :=lcSql;
                  try
                    DMHrdsys.ADOCommand1.Execute;
                    t_count := 0;
                  except
                    {***新增失敗***}
                    msgError(GetLangName(gLangWStrs,'msg_add_error'));
                    exit;
                  end;
                end;
              end;
            end;
          end;

          {***處理請假時數***}

          if iHolTime>0 then
          begin
              {***驗證月結檔中這個月的這個班別有沒有排***}
              with checkQry do
              begin
                close;
                sql.Clear;
                sql.Add('select * from fhrd_mdut where dut_mon='''+gMonth+''' '+
                'and emp_id='''+DMHrdsys.SQLQuery1.FieldValues['emp_id']+''' '+
                'and cls_id='''+HolidayQry.FieldByName('cls_id').Value+'''');
                open;
                if RecordCount>0 then
                begin
                  // update
                  lcSql:='update fhrd_mdut set '+
                  'day'+lcDateStr+'='''+FloatToStr(iHolTime)+'''';
                  lcSql:=lcSql+' where dut_mon='''+gMonth+'''';
                  lcSql:=lcSql+' and emp_id='''+DMHrdsys.SQLQuery1.FieldValues['emp_id']+'''';
                  lcSql:=lcSql+' and cls_id='''+HolidayQry.FieldValues['cls_id']+'''';
                  DMHrdsys.ADOCommand1.CommandText :='';
                  DMHrdsys.ADOCommand1.CommandText :=lcSql;
                  try
                    DMHrdsys.ADOCommand1.Execute;
                    iHolTime := 0;
                  except
                    {***修改失敗***}
                    msgError(GetLangName(gLangWStrs,'msg_update_error'));
                  exit;
                  end;
                end
                else
                begin
                  // insert
                  lcSql:='insert into fhrd_mdut(upd_user,dut_mon,emp_id,'+
                  'cls_id,day'+lcDateStr+')';
                  lcSql:=lcSql+' values('''+UserName+'''';
                  lcSql:=lcSql+','''+gMonth+'''';
                  lcSql:=lcSql+','''+DMHrdsys.SQLQuery1.FieldValues['emp_id']+'''';
                  lcSql:=lcSql+','''+HolidayQry.FieldValues['cls_id']+'''';
                  lcSql:=lcSql+','''+FloatToStr(iHolTime)+''')';
                  DMHrdsys.ADOCommand1.CommandText :='';
                  DMHrdsys.ADOCommand1.CommandText :=lcSql;
                  try
                    DMHrdsys.ADOCommand1.Execute;
                    iHolTime := 0;
                  except
                    {***新增失敗***}
                    msgError(GetLangName(gLangWStrs,'msg_add_error'));
                    exit;
                  end;
                end;
              end;
          end;
        end;
      end;
      Next ;
    end;
  end;


  {***月結完畢，修改月結月份檔***}

  {lcSql:='update close_f set upd_user='''+userName+'''';
  lcSql:=lcSql+',upd_date='''+DateTimeToStr(date)+'''';
  lcSql:=lcSql+',c_month='''+gMonth+'''';
  DMHrdsys.ADOCommand1.CommandText :='';
  DMHrdsys.ADOCommand1.CommandText :=lcSql;
  try
    DMHrdsys.ADOCommand1.Execute;
  except
    msgError('close_f:'+GetLangName(gLangWStrs,'msg_update_error'));
    exit;
  end;}

  DMHrdsys.SQLQuery1.Connection.CommitTrans;
  except
    DMHrdsys.SQLQuery1.Connection.RollbackTrans;
    exit;
  end;

  {***月結成功，提示信息***}

  msgInformation(GetLangName(gLangWStrs,'msg_congratulation'));

  {*** 設置進度條為初始狀態***}

  setProcessBar(true);

  {***月結完畢，在表格中顯示月結資料***}

  lcSql:='select m.*,e.emp_name,c.cls_name from fhrd_mdut as m,fhrd_emp as e,'+
  'fhrd_clsid as c';
  lcSql:=lcSql+' where m.dut_mon='''+gMonth+'''';
  lcSql:=lcSql+' and m.emp_id=e.emp_id';
  lcSql:=lcSql+' and m.cls_id=c.cls_id';
  lcSql:=lcSql+' order by m.emp_id,m.cls_id' ;
  DMHrdsys.SQLQuery1.SQL.Clear ;
  DMHrdsys.SQLQuery1.SQL.Add(lcSql);
  DMHrdsys.SQLQuery1.Open ;

  TntStringGrid_attend.DefaultColWidth :=18;
  TntStringGrid_attend.RowCount := DMHrdsys.SQLQuery1.RecordCount+1;
  TntStringGrid_attend.ColWidths[0]:= 0;
  TntStringGrid_attend.ColWidths[1]:= 40;
  TntStringGrid_attend.ColWidths[2]:= 44;
  TntStringGrid_attend.ColWidths[3]:= 44;
  TntStringGrid_attend.ColWidths[4]:= 44;
  TntStringGrid_attend.ColCount := lcDays+5;
  TntStringGrid_attend.Cells[1,0]:=
  GetLangName(gLangWStrs,'table_field_emp_id');   //'工號';
  TntStringGrid_attend.Cells[2,0]:=
  GetLangName(gLangWStrs,'table_field_emp_name'); //'姓名';
  TntStringGrid_attend.Cells[3,0]:=
  GetLangName(gLangWStrs,'table_field_cls_id');   //'班別';
  TntStringGrid_attend.Cells[4,0]:=
  GetLangName(gLangWStrs,'time_count');     //'天數';
  For i:=1 to lcDays do
  begin
    lcWeek := IntToStr(DayOfWeek(strToDateTime(LeftStr(gMonth,4)+'/'+RightStr(gMonth,2)+'/'+IntToStr(i))));
    if lcWeek='1' then
    begin
      TntStringGrid_attend.Cells[i+4,0] := 'S';
    end
    else
      TntStringGrid_attend.Cols[i+4].Text := IntToStr(i);
  end;

  //content

  i:=1;
  DMHrdsys.SQLQuery1.First ;

  setProcessBar(true,1,DMHrdsys.SQLQuery1.RecordCount*lcDays);

  while not DMHrdsys.SQLQuery1.Eof do
  begin
    TntStringGrid_attend.RowHeights[i] := 18;
    TntStringGrid_attend.Cells[1,i] :=DMHrdsys.SQLQuery1.FieldValues['emp_id'];
    TntStringGrid_attend.Cells[2,i] :=DMHrdsys.SQLQuery1.FieldValues['emp_name'];
    TntStringGrid_attend.Cells[3,i] :=DMHrdsys.SQLQuery1.FieldValues['cls_name'];
    t_count := 0;
    For j:=1 to lcDays do
    begin
      setProcessBar(false,1);
      if j<10 then
      begin
        if (DMHrdsys.SQLQuery1.FieldValues['day0'+IntToStr(j)]<>'') and
        (DMHrdsys.SQLQuery1.FieldValues['day0'+IntToStr(j)]<>NULL) then
        begin
          TntStringGrid_attend.Cells[j+4,i] :=
          DMHrdsys.SQLQuery1.FieldValues['day0'+IntToStr(j)];
          t_count :=
          t_count+StrtoInt(trim(DMHrdsys.SQLQuery1.FieldValues['day0'+IntToStr(j)]));
        end;
      end
      else
      begin
        if (DMHrdsys.SQLQuery1.FieldValues['day'+IntToStr(j)]<>'') and
        (DMHrdsys.SQLQuery1.FieldValues['day'+IntToStr(j)]<>NULL) then
        begin
          TntStringGrid_attend.Cells[j+4,i] :=
          DMHrdsys.SQLQuery1.FieldValues['day'+IntToStr(j)];
          t_count :=
          t_count+StrtoInt(trim(DMHrdsys.SQLQuery1.FieldValues['day'+IntToStr(j)]));
        end;
      end;
      TntStringGrid_attend.Cells[4,i] :='     '+FloatToStr(t_count);
    end;
    i := i+1;
    DMHrdsys.SQLQuery1.Next ;
  end;

  TntBitBtn_month.Enabled :=false;

  setProcessBar(true);

end;

//message's Error

procedure TFormfhrd203.msgError(errormsg:WideString);
begin
  wideMessageDlg(errormsg,mterror,[mbOk],0);
end;

//message's Information

procedure TFormfhrd203.msgInformation(infomsg:WideString);
begin
  wideMessageDlg(infomsg,mtInformation,[mbOk],0); //TMsgDlgType,TMsgDlgButtons
end;

//close form

procedure TFormfhrd203.TntBitBtn_exitClick(Sender: TObject);
begin
  close;
end;

procedure TFormfhrd203.TntFormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= caFree;
end;

end.
