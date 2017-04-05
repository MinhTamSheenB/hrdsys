{********************************************
Name:       uFhrd309
Func:       計算員工年終獎金
Author:
Create Date:
*********************************************}
unit uFhrd309;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, TntButtons, TntStdCtrls, ExtCtrls, DateUtils,
  TntExtCtrls, TntDialogs, StrUtils, ComCtrls, TntComCtrls, Grids, TntGrids,
  DB, ADODB, Mask, DBCtrls;

type
  TFormfhrd309 = class(TForm)
    TntPanel1: TTntPanel;
    TntPanel2: TTntPanel;
    TntGroupBox1: TTntGroupBox;
    TntLabel1: TTntLabel;
    emp_id: TTntEdit;
    emp_name: TTntEdit;
    doreward: TTntBitBtn;
    TntLabel2: TTntLabel;
    TntLabel3: TTntLabel;
    reward_jb: TTntEdit;
    reward_jr: TTntEdit;
    TntLabel4: TTntLabel;
    TntLabel5: TTntLabel;
    bonus_jr: TTntEdit;
    bonus_jb: TTntEdit;
    TntLabel6: TTntLabel;
    year_reward: TTntEdit;
    TntLabel7: TTntLabel;
    year_bonus: TTntEdit;
    TntLabel8: TTntLabel;
    TntLabel9: TTntLabel;
    TntLabel10: TTntLabel;
    reward_kj: TTntComboBox;
    bonus_kj: TTntComboBox;
    dutyReward: TTntStringGrid;
    fetDutyYearQry: TADOQuery;
    dutyBonus: TTntStringGrid;
    TntLabel11: TTntLabel;
    TntLabel12: TTntLabel;
    TntLabel13: TTntLabel;
    TntLabel14: TTntLabel;
    reward_basic: TTntStringGrid;
    bonus_basic: TTntStringGrid;
    reward_jj: TTntEdit;
    TntLabel15: TTntLabel;
    TntLabel16: TTntLabel;
    bonus_jj: TTntEdit;
    TntLabel17: TTntLabel;
    total: TTntEdit;
    saveQry: TADOQuery;
    TntLabel18: TTntLabel;
    emp_etdt: TTntEdit;

    // user create function or procedure

    Procedure doDutyYear;
    Function doBonus(sPstCode : string ; sMonthCount : string ; sRate : string):string;
    procedure sumBonus;
    procedure doYearReward;
    Function doRewards(sPstCode : string ; sMonthCount : string ; Flag : string ; sBasic : string):string;
    Function doAdd(sPstCode : string ; sMonthCount : string):string;
    procedure sumReward;
    procedure yearReward;
    Function getPstName(sCode : string):string;

    // system create procedure

    procedure emp_idChange(Sender: TObject);
    procedure dorewardClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formfhrd309: TFormfhrd309;

implementation

uses
  UnitHrdMain,UnitDMHrdsys,UnitHrdUtils, UnitPrtTpl, UnitPrtSet;

{$R *.dfm}

procedure TFormfhrd309.emp_idChange(Sender: TObject);
var
  i : integer;
begin
  if Length(emp_id.Text)=6 then
    with DMHrdsys.SQLQuery1 do
    begin
      close;
      sql.Clear;
      sql.Add('select emp_name,emp_etdt from fhrd_emp where emp_id='''+emp_id.Text+''' ');
      try
        open;
      except
        showmessage('取員工名稱錯誤');
        exit;
      end;
      if RecordCount<=0 then
      begin
        showmessage('此員工不存在');
        emp_etdt.Text := '';
        emp_name.Text := '';
      end;
      if not VarIsNull(FieldBYName('emp_name').Value) then
        emp_name.Text := FieldBYName('emp_name').Value;
      if not VarIsNull(FieldByName('emp_etdt').Value) then
        emp_etdt.Text := FieldByName('emp_etdt').Value;
    end;

  reward_jb.Text := '';
  reward_jj.Text := '';
  reward_jr.Text := '';
  year_reward.Text :='';

  bonus_jb.Text := '';
  bonus_jj.Text := '';
  bonus_jr.Text :='';
  year_bonus.Text := '';
  total.Text := '';

  For i:=1 to dutyBonus.RowCount-1 do
  begin
    dutyBonus.Cells[0,i] := '';
    dutyBonus.Cells[1,i] := '';
    dutyBonus.Cells[2,i] := '';
  end;

  For i:=1 to dutyReward.RowCount-1 do
  begin
    dutyReward.Cells[0,i] := '';
    dutyReward.Cells[1,i] := '';
    dutyReward.Cells[2,i] := '';
  end;

  For i:=1 to Reward_basic.RowCount-1 do
  begin
    Reward_basic.Cells[0,i] := '';
    Reward_basic.Cells[1,i] := '';
    Reward_basic.Cells[2,i] := '';
    Reward_basic.Cells[3,i] := '';
  end;

  For i:=1 to bonus_basic.RowCount-1 do
  begin
    bonus_basic.Cells[0,i] := '';
    bonus_basic.Cells[1,i] := '';
    bonus_basic.Cells[2,i] := '';
    bonus_basic.Cells[3,i] := '';
  end;

end;

Function TFormfhrd309.getPstName(sCode : string):string;
begin
  with DMHrdsys.SQLQuery4 do
  begin
    close;
    sql.Clear;
    sql.Add('select pst_name from  fhrd_prof where pst_code='''+sCode+''' ');
    try
      open;
    except
      showmessage('取職稱錯誤');
    end;
    if RecordCount>0 then
      result := sCode+'/'+FieldBYName('pst_name').Value
    else
      result := sCode;
  end;
end;

procedure TFormfhrd309.DoDutyYear;
var
  sYear : string;
  currDate,currPst : string;
  i : integer;
begin
  sYear := IntToStr(YearOf(Date)-1);
  with DMHrdsys.SQLQuery2 do
  begin
    close;
    sql.Clear;
    sql.Add('select pst_code,emp_etdt from fhrd_emp where emp_id='''+emp_id.Text+''' ');
    try
      open;
    except
      showmessage('取進廠日期錯誤');
      exit;
    end;
    if RecordCount>0 then
    begin
      currDate := FieldByName('emp_etdt').Value;
      currPst := '01';
    end;
  end;
  with fetDutyYearQry do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT DISTINCT emp_id, pst_code,(SELECT TOP 1 valid_date '+
    'FROM  fhrd_tranhist_before AS t WHERE t.emp_id = tf.emp_id '+
    'and t.pst_code = tf.pst_code ORDER BY   valid_date) AS valid_date '+
    'FROM dbo.fhrd_tranhist_before tf WHERE emp_id = '''+emp_id.Text+''' ');
    try
      open;
    except
      showmessage('取調升記錄失敗');
      exit;
    end;
    if RecordCount>0 then
    begin
      i := 1;
      while Not Eof do
      begin
         if LeftStr(currDate,4)=LeftStr(FieldByName('valid_date').Value,4) then
         begin
          dutyReward.Cells[0,i] := getPstName(currPst);
          dutyReward.Cells[1,i] := '0';
          dutyReward.Cells[2,i] := doBonus(currPst,dutyReward.Cells[1,i],'3');
          dutyBonus.Cells[0,i] := getPstName(currPst);
          dutyBonus.Cells[1,i] := '0';
          dutyBonus.Cells[2,i] := doBonus(currPst,dutyReward.Cells[1,i],'1');
          currDate := FieldBYName('valid_date').Value;
          currPst := FieldByName('pst_code').Value;
          i := i+1;
          next;
         end
         else
         begin
          dutyReward.Cells[0,i] := getPstName(currPst);
          dutyBonus.Cells[0,i] := getPstName(currPst);

          if (RightStr(FormatDateTime('yyyy/mm/dd',strToDate(FieldBYName('valid_date').Value)),5)='01/01') and
          (RightStr(FormatDateTime('yyyy/mm/dd',strToDate(currDate)),5)<>'01/01') then
          begin
            dutyReward.Cells[1,i] := IntToStr(strToInt(LeftStr(FieldBYName('valid_date').Value,4))-strToInt(LeftStr(currDate,4))-1);
            dutyBonus.Cells[1,i] := IntToStr(strToInt(LeftStr(FieldBYName('valid_date').Value,4))-strToInt(LeftStr(currDate,4))-1);
          end
          else if (RightStr(FormatDateTime('yyyy/mm/dd',strToDate(FieldBYName('valid_date').Value)),5)<>'01/01') and
          (RightStr(FormatDateTime('yyyy/mm/dd',strToDate(currDate)),5)='01/01') then
          begin
            dutyReward.Cells[1,i] := IntToStr(strToInt(LeftStr(FieldBYName('valid_date').Value,4))-strToInt(LeftStr(currDate,4))+1);
            dutyBonus.Cells[1,i] := IntToStr(strToInt(LeftStr(FieldBYName('valid_date').Value,4))-strToInt(LeftStr(currDate,4))+1);
          end
          else
          begin
            dutyReward.Cells[1,i] := IntToStr(strToInt(LeftStr(FieldBYName('valid_date').Value,4))-strToInt(LeftStr(currDate,4)));
            dutyBonus.Cells[1,i] := IntToStr(strToInt(LeftStr(FieldBYName('valid_date').Value,4))-strToInt(LeftStr(currDate,4)));
          end;

          dutyReward.Cells[2,i] := doBonus(currPst,dutyReward.Cells[1,i],'3');
          dutyBonus.Cells[2,i] := doBonus(currPst,dutyReward.Cells[1,i],'1');

          currDate := FieldBYName('valid_date').Value;
          currPst := FieldByName('pst_code').Value;

          i := i+1;
          next;
        end;
      end;

      dutyReward.Cells[0,i] := getPstName(currPst);
      dutyBonus.Cells[0,i] := getPstName(currPst);

      if RightStr(FormatDateTime('yyyy/mm/dd',strToDate(FieldBYName('valid_date').Value)),5)='01/01' then
      begin
        dutyReward.Cells[1,i] := IntToStr(strToInt(sYear)-strToInt(LeftStr(FieldBYName('valid_date').Value,4))+1);
        dutyBonus.Cells[1,i] := IntToStr(strToInt(sYear)-strToInt(LeftStr(FieldBYName('valid_date').Value,4))+1);
      end
      else
      begin
        dutyReward.Cells[1,i] := IntToStr(strToInt(sYear)-strToInt(LeftStr(FieldBYName('valid_date').Value,4)));
        dutyBonus.Cells[1,i] := IntToStr(strToInt(sYear)-strToInt(LeftStr(FieldBYName('valid_date').Value,4)));
      end;

      dutyReward.Cells[2,i] := doBonus(currPst,dutyReward.Cells[1,i],'3');
      dutyBonus.Cells[2,i] := doBonus(currPst,dutyReward.Cells[1,i],'1');

    end;
  end;
  sumBonus;
  doYearReward;
  sumReward;
  yearReward;
end;

procedure TFormFhrd309.sumReward;
var
  i : integer;
  sumRed,sumBon,sumR_jj,sumB_jj : Real;
begin
  sumRed := 0.0;
  sumBon := 0.0;
  sumR_jj := 0.0;
  sumB_jj := 0.0;
  For i:=1 to reward_basic.RowCount-1 do
  begin
    if reward_basic.Cells[2,i]<>'' then
    begin
      sumRed := sumRed+strToFloat(reward_basic.Cells[2,i]);
      sumR_jj := sumR_jj+strToFloat(reward_basic.Cells[3,i]);
    end;
  end;
  For i:=1 to bonus_basic.RowCount-1 do
  begin
    if bonus_basic.Cells[2,i]<>'' then
    begin
      sumBon := sumBon+strToFloat(bonus_basic.Cells[2,i]);
      sumB_jj := sumB_jj+strtOFloat(bonus_basic.Cells[3,i]);
    end;
  end;
  reward_jb.Text := FloatToStr(sumRed);
  bonus_jb.Text := FloatToStr(sumBon);
  reward_jj.Text := FloatToStr(sumR_jj);
  bonus_jj.Text := FloatToStr(sumB_jj);
end;

Function TFormFhrd309.doBonus(sPstCode : string ; sMonthCount : string ; sRate : string) : string;
var
  sBouns : Real;
begin
  with DMHrdsys.SQLQuery3 do
  begin
    close;
    sql.Clear;
    sql.Add('select * from fhrd_reward_basic where pst_code='''+sPstCode+''' ');
    try
      open;
    except
      showmessage('取基本數據錯誤');
      exit;
    end;
    sBouns := strtoInt(FieldByName('pst_basic').Value)*strToFloat(sMonthCount)*strToFloat(sRate);
  end;
  result := FloatToStr(sBouns);
end;

procedure TFormFhrd309.doYearReward;
var
  currDate,currPst,sYear : string;
  i : integer;
  currYearFlag : integer;
begin
  sYear := IntToStr(yearOf(Date)-1);
  with DMHrdsys.SQLQuery2 do
  begin
    close;
    sql.Clear;
    sql.Add('select pst_code,emp_etdt from fhrd_emp where emp_id='''+emp_id.Text+''' ');
    try
      open;
    except
      showmessage('取進廠日期錯誤');
      exit;
    end;
    if RecordCount>0 then
    begin
      currDate := FieldByName('emp_etdt').Value;
      currPst := '01';
    end;
  end;
  with fetDutyYearQry do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT DISTINCT emp_id,pst_code,(SELECT TOP 1 valid_date '+
    'FROM  fhrd_tranhist_before AS t WHERE t.emp_id=tf.emp_id '+
    'and t.pst_code=tf.pst_code ORDER BY valid_date) AS valid_date '+
    'FROM dbo.fhrd_tranhist_before tf WHERE emp_id = '''+emp_id.Text+''' ');
    try
      open;
    except
      showmessage('取調升記錄失敗');
      exit;
    end;
    i := 1;
    currYearFlag := 0;
    while Not Eof do
    begin
      if LeftStr(FieldByName('valid_date').Value,4)=sYear then
      begin
        if LeftStr(currDate,4)=sYear then
        begin
          reward_basic.Cells[0,i] := getPstName(currPst);
          reward_basic.Cells[1,i] := IntToStr(MonthsBetween(strToDate(FieldBYName('valid_date').Value),strToDate(currDate)));
          reward_basic.Cells[2,i] := doRewards(currPst,reward_basic.Cells[1,i],'yr','300');
          reward_basic.Cells[3,i] := doAdd(currPst,reward_basic.Cells[1,i]);
          bonus_basic.Cells[0,i] := getPstName(currPst);
          bonus_basic.Cells[1,i] := IntToStr(MonthsBetween(strToDate(FieldBYName('valid_date').Value),strToDate(currDate)));
          bonus_basic.Cells[2,i] := doRewards(currPst,reward_basic.Cells[1,i],'yb','300');
          bonus_basic.Cells[3,i] := doAdd(currPst,reward_basic.Cells[1,i]);
          currPst := FieldByName('pst_code').Value;
          currDate := FieldBYName('valid_date').Value;
        end
        else
        begin
          if i=1 then
          begin
            with DMHrdsys.SQLQuery3 do
            begin
              close;
              sql.Clear;
              sql.Add('select top 1 pst_code from fhrd_tranhist_before '+
              'where emp_id='''+emp_id.Text+''' '+
              'and valid_date<'''+FormatDateTime('yyyy/mm/dd',startOfAYear(strToInt(sYear)))+''' '+
              'order by pst_code desc ');
              try
                open;
              except
                showmessage('取職稱失敗');
              end;
              if RecordCount>0 then
              begin
                currPst := FieldByName('pst_code').Value;
                currDate := FormatDateTime('yyyy/mm/dd',startOfAYear(strToInt(sYear)));
              end
              else
              begin
                currDate := sYear+'/01/01';
              end;
            end;
            reward_basic.Cells[0,i] := getPstName(currPst);
            reward_basic.Cells[1,i] := IntToStr(1+MonthsBetween(strToDate(FieldBYName('valid_date').Value),strToDate(currDate)));
            reward_basic.Cells[2,i] := doRewards(currPst,reward_basic.Cells[1,i],'yr','300');
            reward_basic.Cells[3,i] := doAdd(currPst,reward_basic.Cells[1,i]);
            bonus_basic.Cells[0,i] := getPstName(currPst);
            bonus_basic.Cells[1,i] := IntToStr(1+MonthsBetween(strToDate(FieldBYName('valid_date').Value),strToDate(currDate)));
            bonus_basic.Cells[2,i] := doRewards(currPst,reward_basic.Cells[1,i],'yb','300');
            bonus_basic.Cells[3,i] := doAdd(currPst,reward_basic.Cells[1,i]);
            currPst := FieldByName('pst_code').Value;
            currDate := FieldBYName('valid_date').Value;
          end
          else
          begin
            reward_basic.Cells[0,i] := getPstName(currPst);
            reward_basic.Cells[1,i] := IntToStr(1+MonthsBetween(strToDate(FieldBYName('valid_date').Value),strToDate(currDate)));
            reward_basic.Cells[2,i] := doRewards(currPst,reward_basic.Cells[1,i],'yr','300');
            reward_basic.Cells[3,i] := doAdd(currPst,reward_basic.Cells[1,i]);
            bonus_basic.Cells[0,i] := getPstName(currPst);
            bonus_basic.Cells[1,i] := IntToStr(1+MonthsBetween(strToDate(FieldBYName('valid_date').Value),strToDate(currDate)));
            bonus_basic.Cells[2,i] := doRewards(currPst,reward_basic.Cells[1,i],'yb','300');
            bonus_basic.Cells[3,i] := doAdd(currPst,reward_basic.Cells[1,i]);
          end;
        end;
        i := i+1;
        currYearFlag := currYearFlag+1;
      end;
      next;
    end;
    if currYearFlag=0 then
    begin
      with DMHrdsys.SQLQuery3 do
      begin
        close;
        sql.Clear;
        sql.Add('select top 1 pst_code from fhrd_tranhist_before '+
        'where emp_id='''+emp_id.Text+''' '+
        'and valid_date<'''+FormatDateTime('yyyy/mm/dd',startOfAYear(strToInt(sYear)))+''' '+
        'order by pst_code desc ');
        try
          open;
        except
          showmessage('取職稱失敗');
        end;
        if RecordCount>0 then
        begin
          reward_basic.Cells[0,i] := getPstName(FieldByName('pst_code').Value);
          reward_basic.Cells[1,i] := '12';
          reward_basic.Cells[2,i] := doRewards(FieldByName('pst_code').Value,reward_basic.Cells[1,i],'yr','300');
          reward_basic.Cells[3,i] := doAdd(FieldByName('pst_code').Value,reward_basic.Cells[1,i]);
          bonus_basic.Cells[0,i] := getPstName(FieldByName('pst_code').Value);
          bonus_basic.Cells[1,i] := '12';
          bonus_basic.Cells[2,i] := doRewards(FieldByName('pst_code').Value,reward_basic.Cells[1,i],'yb','300');
          bonus_basic.Cells[3,i] := doAdd(FieldByName('pst_code').Value,reward_basic.Cells[1,i]);
        end;
      end;
    end
    else
    begin
      reward_basic.Cells[0,i] := getPstName(currPst);
      reward_basic.Cells[1,i] := IntToStr(MonthsBetween(EndOfAYear(strToInt(sYear)),strToDate(FieldBYName('valid_date').Value)));
      reward_basic.Cells[2,i] := doRewards(currPst,reward_basic.Cells[1,i],'yr','300');
      reward_basic.Cells[3,i] := doAdd(currPst,reward_basic.Cells[1,i]);
      bonus_basic.Cells[0,i] := getPstName(currPst);
      bonus_basic.Cells[1,i] := IntToStr(MonthsBetween(EndOfAYear(strToInt(sYear)),strToDate(FieldBYName('valid_date').Value)));
      bonus_basic.Cells[2,i] := doRewards(currPst,reward_basic.Cells[1,i],'yb','300');
      bonus_basic.Cells[3,i] := doAdd(currPst,reward_basic.Cells[1,i]);
    end;
  end;
end;

Function TFormFhrd309.doRewards(sPstCode : string ; sMonthCount : string ; Flag : string; sBasic : string):string;
var
  sReB : Real;
begin
  with DMHrdsys.SQLQuery4 do
  begin
    close;
    sql.Clear;
    sql.Add('select * from fhrd_reward_basic where pst_code='''+sPstCode+''' ');
    try
      open;
    except
    end;
    if Flag='yr' then
     sReb := strToFloat(sBasic)*strToFloat(FieldByName('yr_bs').Value)*(strToFloat(sMonthCount)/12);
    if Flag='yb' then
     sReb := strToFloat(sBasic)*strToFloat(FieldByName('yb_bs').Value)*(strToFloat(sMonthCount)/12);
  end;
  result := FloatToStr(sReB);
end;

Function TFormFhrd309.doAdd(sPstCode : string ; sMonthCount : string):string;
var
  sAdd : Real;
begin
  with DMHrdsys.SQLQuery4 do
  begin
    close;
    sql.Clear;
    sql.Add('select * from fhrd_reward_basic where pst_code='''+sPstCode+''' ');
    try
      open;
    except
    end;
     sAdd := strToFloat(FieldByName('pst_add').Value)*(strToFloat(sMonthCount)/12);
  end;
  result := FloatToStr(sAdd);
end;

procedure TFormFhrd309.sumBonus;
var
  i : integer;
  dutyR,dutyB : Real;
begin
  dutyR := 0.0;
  dutyB := 0.0;
  For i:=1 to dutyReward.RowCount-1 do
  begin
    if dutyReward.Cells[2,i]='' then
      continue
    else
      dutyR := dutyR+strToFloat(dutyReward.Cells[2,i]);
  end;
  reward_jr.Text := FloatToStr(dutyR);

  For i:=1 to dutyBonus.RowCount-1 do
  begin
    if dutyBonus.Cells[2,i]='' then
      continue
    else
      dutyB := dutyB+strToFloat(dutyBonus.Cells[2,i]);
  end;
  bonus_jr.Text := FloatToStr(dutyB);
end;

procedure TFormfhrd309.dorewardClick(Sender: TObject);
var
  sYear : string;
begin
  sYear := IntToStr(YearOf(Date)-1);
  if emp_id.Text='' then
  begin
    showmessage('請輸入工號');
    emp_id.SetFocus;
    exit;
  end;
  if reward_kj.Text='' then
  begin
    showmessage('請選擇年終獎金考績倍數');
    reward_kj.SetFocus;
    exit;
  end;
  if bonus_kj.Text='' then
  begin
    showmessage('請選擇幹部紅包考績倍數');
    bonus_kj.SetFocus;
    exit;
  end;

  doDutyYear;

  total.Text := FloatToStr(strToFloat(year_reward.Text)+strToFloat(year_bonus.Text));

  with saveQry do
  begin
    close;
    sql.Clear;
    sql.Add('select * from fhrd_year_reward '+
    'where reward_year='''+sYear+''' and emp_id='''+emp_id.Text+''' ');
    try
      open;
    except
      showmessage('驗證是否計算獎金錯誤');
    end;
    if RecordCount>0 then
    begin
      close;
      sql.Clear;
      sql.Add('update fhrd_year_reward set reward='''+year_reward.Text+''','+
      'bonus='''+year_bonus.Text+''','+
      'reward_rate='''+LeftStr(reward_kj.Text,3)+''','+
      'bonus_rate='''+LeftStr(bonus_kj.Text,3)+''' '+
      'where reward_year='''+sYear+''' and emp_id='''+emp_id.Text+''' ');
      try
        ExecSQL;
      except
        showmessage('保存獎金失敗');
      end;
    end
    else
    begin
      close;
      sql.Clear;
      sql.Add('insert into fhrd_year_reward (upd_user,upd_date,'+
      'reward_year,emp_id,reward,bonus,reward_rate,bonus_rate) '+
      'values (:upd_user,:upd_date,:reward_year,:emp_id,:reward,'+
      ':bonus,:reward_rate,:bonus_rate) ');
      Parameters.ParamValues['upd_user'] := userName;
      Parameters.ParamValues['upd_date'] := FormatDateTime('yyyy/mm/dd hh:nn:ss',Now);
      Parameters.ParamValues['reward_year'] := sYear;
      Parameters.ParamValues['emp_id'] := emp_id.Text;
      Parameters.ParamValues['reward'] := year_reward.Text;
      Parameters.ParamValues['bonus'] := year_bonus.Text;
      Parameters.ParamValues['reward_rate'] := Leftstr(reward_kj.Text,3);
      Parameters.ParamValues['bonus_rate'] := LeftStr(bonus_kj.Text,3);
      try
        ExecSQL;
      except
        showmessage('保存獎金失敗');
      end;
    end;
  end;

end;

procedure TFormfhrd309.FormCreate(Sender: TObject);
begin
  dutyReward.Cells[0,0]:='職稱';
  dutyReward.Cells[1,0]:='任職年限';
  dutyReward.Cells[2,0]:='久任獎';

  dutyBonus.Cells[0,0]:='職稱';
  dutyBonus.Cells[1,0]:='任職年限';
  dutyBonus.Cells[2,0]:='久任獎';

  reward_basic.Cells[0,0] := '職稱';
  reward_basic.Cells[1,0] := '任職月數';
  reward_basic.Cells[2,0] := '基本獎';
  reward_basic.Cells[3,0] := '加給';

  bonus_basic.Cells[0,0] := '職稱';
  bonus_basic.Cells[1,0] := '任職月數';
  bonus_basic.Cells[2,0] := '基本獎';
  bonus_basic.Cells[3,0] := '加給';
end;

procedure TFormFhrd309.yearReward;
var
  reward,bonus : Real;
begin
  reward := (strToFloat(reward_jb.Text)+strToFloat(reward_jr.Text))*strToFloat(Leftstr(reward_kj.Text,3))+strToFloat(reward_jj.Text);
  bonus := (strToFloat(bonus_jb.Text)+strToFloat(bonus_jr.Text))*strToFloat(Leftstr(bonus_kj.Text,3))+strToFloat(bonus_jj.Text);;
  year_reward.Text := FloatToStr(reward);
  year_bonus.Text := FloatToStr(bonus);
end;

end.
