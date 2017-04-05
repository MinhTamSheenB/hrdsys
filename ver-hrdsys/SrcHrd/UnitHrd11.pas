unit UnitHrd11;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,tntDialogs, ExtCtrls,StrUtils, ComCtrls, Grids, DBGrids, StdCtrls, Buttons, Mask,
  DBCtrls, TntExtCtrls, TntDBGrids, TntDbCtrls, TntStdCtrls, TntButtons,
  DB, ADODB, DBClient, Provider,DateUtils,WSDLIntf, TntComCtrls;

type
  Tformhrd11 = class(TForm)
    privilege: TTntPageControl;
    select: TTntTabSheet;
    transfer: TTntTabSheet;
    GB_Select: TTntGroupBox;
    TntPanel1: TTntPanel;
    RD_NAME: TTntRadioButton;
    RD_ID: TTntRadioButton;
    EDT_name: TTntEdit;
    ID_B: TTntEdit;
    ID_E: TTntEdit;
    BB_find: TTntBitBtn;
    TntDBGrid1: TTntDBGrid;
    TntPanel2: TTntPanel;
    LB_ID: TTntLabel;
    TntDBEdit1: TTntDBEdit;
    LB_POST: TTntLabel;
    TntDBEdit2: TTntDBEdit;
    LB_DEPT_CODE: TTntLabel;
    TntDBEdit3: TTntDBEdit;
    LB_workdate: TTntLabel;
    EDT_FIRSTDATE: TTntDBEdit;
    LB_leavedate: TTntLabel;
    EDT_LEAVE: TTntDBEdit;
    LB_TOTAL: TTntLabel;
    DataSource1: TDataSource;
    RD_month: TTntRadioButton;
    EDT_TOTAL: TTntEdit;
    RD_LVMON: TTntRadioButton;
    sqlQuery1: TADOQuery;
    lmonth_b: TTntEdit;
    lmonth_e: TTntEdit;
    DEPT_S: TTntComboBox;
    DEPT_E: TTntComboBox;
    RD_DEPT: TTntRadioButton;
    sqlQuery2: TADOQuery;
    TntPanel3: TTntPanel;
    bb_search: TTntBitBtn;
    sb_Save: TTntSpeedButton;
    TntPanel4: TTntPanel;
    TntGroupBox1: TTntGroupBox;
    TntGroupBox2: TTntGroupBox;
    TntDBGrid2: TTntDBGrid;
    TntDBGrid3: TTntDBGrid;
    DataSource2: TDataSource;
    sqlQuery3: TADOQuery;
    DataSource3: TDataSource;
    month_b: TMaskEdit;
    month_e: TMaskEdit;
    TntLabel1: TTntLabel;
    TntEdit1: TTntEdit;
    TntCheckBox1: TTntCheckBox;
    edt_bgn: TTntEdit;
    TntCheckBox2: TTntCheckBox;
    edt_end: TTntEdit;
    me_bgn: TMaskEdit;
    me_end: TMaskEdit;
    rb_shoe: TTntRadioButton;
    rb_noshoe: TTntRadioButton;
    sqlQuery2insur_seq: TStringField;
    sqlQuery2picc_mon: TStringField;
    sqlQuery2insu_cod: TWideStringField;
    sqlQuery2notes: TWideStringField;
    sqlQuery2emp_chs: TWideStringField;
    sqlQuery2edu_code: TStringField;
    sqlQuery2dept_code: TStringField;
    sqlQuery2epindt: TDateTimeField;
    sqlQuery2epledt: TDateTimeField;
    sqlQuery2pst_code: TStringField;
    sqlQuery2name_eng: TWideStringField;
    sqlQuery2name_vim: TWideStringField;
    sqlQuery2pst_name: TWideStringField;
    sqlQuery2dept: TWideStringField;
    sqlQuery2emp_id_1: TStringField;
    qry_dept: TADOQuery;
    procedure InitLangInfo;
    function GetPst(pstcode:string):widestring;
    function GetDept(dept:string):widestring;
    procedure FormCreate(Sender: TObject);
    procedure BB_findClick(Sender: TObject);
    procedure TntDBGrid1TitleClick(Column: TColumn);
    procedure RD_monthClick(Sender: TObject);
    procedure DEPT_SChange(Sender: TObject);
    procedure privilegeChange(Sender: TObject);
    procedure bb_searchClick(Sender: TObject);
    procedure sb_SaveClick(Sender: TObject);
    procedure ID_EDblClick(Sender: TObject);
    procedure sqlQuery2AfterClose(DataSet: TDataSet);
    procedure sqlQuery2AfterOpen(DataSet: TDataSet);
    procedure sqlQuery2CalcFields(DataSet: TDataSet);
    procedure sqlQuery1AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formhrd11: Tformhrd11;
  ws_Words:TWideStrings;

implementation

uses
  UnitDMHrdsys,UnitHrdUtils;
{$R *.dfm}

//***************************************
// 得到繳費總金額
// 輸入 :
//    pstcode 職稱代碼
//    Educode 教育程度
//    MonB 保險起始月份
//    MonE 保險中止月份
// 輸出 :繳費總金額
//***************************************
function GetSumInsurance(PstCode,EduCode,MonB,MonE:string):integer;
var
  PayBase,MonD: integer;
begin
  if PstCode = '60' then
  begin
    case strtoint(EduCode) of
      12..14: PayBase := 630000;
      15,16: PayBase := 700000;
    else
      PayBase := 500000;
    end;  
  end
  else if PstCode = '50' then
  begin
    if EduCode='' then
      EduCode :='0';
    case strtoint(EduCode) of
      12..14: PayBase := 630000;
      15,16: PayBase := 700000;
    else
      PayBase := 600000;
    end;
  end
  else
  begin
    if EduCode='' then
      EduCode :='0';
    case strtoint(EduCode) of
      18,19: PayBase := 900000;
      22,28: PayBase := 800000;
      33,37: PayBase := 700000;
      41,46: PayBase := 850000;
    else
      PayBase := 0;
    end;
  end;
  MonD := (strtoint(Leftstr(MonE,4))-strtoint(Leftstr(MonB,4)))*12+ strtoint(Rightstr(MonE,2))- strtoint(Rightstr(MonB,2))+1;
  if MonD <=0 then
    result := 0
  else
    result := MonD*PayBase*6 div 100;
end;

//檢查月份格式是否正確 注:空也算正確
function checkmonth(m_str:string):boolean;
var
  y,m :integer;
begin
   if m_str = '' then
   begin
     result := true;
     exit;
   end;
   try
     y := strtoint(leftstr(m_str,4));
     m := strtoint(rightstr(m_str,2));
     if (length(m_str)<6) or (y>strtoint(leftstr(datetostr(now),4))) then
       result := false
     else if (m<01) or (m>12) then
       result := false
     else
       result := true;
   except
     result := false;
   end;
end;

procedure Tformhrd11.InitLangInfo;
var
  ThisFormUsedWords:String;
begin
  //默認為中文
// if UserLang='C' then exit;
  //定義要用到的語言
 ThisFormUsedWords:='query,transferfiles,find,serial_no,ins_month,'+
    'fld_emp_id,fld_emp_chs,workdate,fld_dept_code,dept_abbr,picc_pay,'+
    'position,total,workdate,hrd11_titl,serial_no,hrd11_error1,fld_epid_no,'+
    'interrupt_month,remark,fld_epledt,tran_success';
 ws_Words:=GetLangWideStrs(ThisFormUsedWords);
 privilege.Pages[0].Caption := GetLangName(ws_Words,'query');
 privilege.Pages[1].Caption := GetLangName(ws_Words,'transferfiles');
 tntpanel1.Caption := GetLangName(ws_Words,'hrd11_titl');
 RD_MONTH.Caption := GetLangName(ws_Words,'ins_month');
 RD_ID.Caption := GetLangName(ws_Words,'fld_emp_id');
 RD_NAME.Caption := GetLangName(ws_Words,'fld_emp_chs');
 RD_LVMON.Caption := GetLangName(ws_Words,'interrupt_month');

 BB_find.Caption := GetLangName(ws_Words,'find');
 LB_ID.Caption := GetLangName(ws_Words,'fld_epid_no');
 LB_POST.Caption := GetLangName(ws_Words,'position');
 LB_DEPT_CODE.Caption := GetLangName(ws_Words,'fld_dept_code');
 LB_WORKDATE.Caption := GetLangName(ws_Words,'workdate');
 LB_LEAVEDATE.Caption := GetLangName(ws_Words,'fld_epledt');
 LB_TOTAL.Caption := GetLangName(ws_Words,'total');

 with tntDBGrid1 do
 begin
   Columns[0].Title.caption := GetLangName(ws_Words,'serial_no');
   Columns[1].Title.caption := GetLangName(ws_Words,'fld_emp_id');
   Columns[2].Title.caption := GetLangName(ws_Words,'fld_emp_chs');
   Columns[3].Title.caption := GetLangName(ws_Words,'dept_abbr');
   Columns[4].Title.caption := GetLangName(ws_Words,'ins_month');
   Columns[5].Title.caption := GetLangName(ws_Words,'interrupt_month');
   Columns[6].Title.caption := GetLangName(ws_Words,'picc_pay');
 end;
 with tntDBGrid3 do
 begin
   Columns[0].Title.caption := GetLangName(ws_Words,'serial_no');
   Columns[1].Title.caption := GetLangName(ws_Words,'fld_emp_id');
   Columns[2].Title.caption := GetLangName(ws_Words,'ins_month');
   Columns[3].Title.caption := GetLangName(ws_Words,'interrupt_month');
   Columns[4].Title.caption := GetLangName(ws_Words,'picc_pay');
 end;

end;
procedure Tformhrd11.FormCreate(Sender: TObject);
var
  prvArr:TPrvArr;
begin
  prvArr:=GetPrvArr(userName,'hrd11');
  if prvArr[inq] then
    privilege.Pages[0].TabVisible := true
  else
    privilege.Pages[0].TabVisible := false;
  if prvArr[upd] or prvArr[add] then
    privilege.Pages[1].TabVisible := true
  else
    privilege.Pages[1].TabVisible := false;
  InitLangInfo;
  month_e.Text := '';
  me_bgn.Text:=FormatDateTime('yyyymm',date-42);
  me_end.Text:=FormatDateTime('yyyymm',date-42);
  //取得部門代號
  with qry_dept do
  begin
    close;
    SQL.Clear;
    sql.Add('select * from hrd_dept order by dept_code');
    open;
  end;
  qry_dept.first;
  dept_s.Clear;
  dept_e.Clear;
  while not qry_dept.Eof do
  begin
    dept_s.AddItem(qry_dept.FieldByName('dept_code').AsString+'-'+qry_dept.FieldByName('abbr_titl').AsString,Sender);
    dept_e.AddItem(qry_dept.FieldByName('dept_code').asstring+'-'+qry_dept.FieldByName('abbr_titl').AsString,Sender);
    qry_dept.next;
  end;
  dept_s.ItemIndex:=0;
  dept_e.ItemIndex:=dept_e.Items.Count-1;
end;

procedure Tformhrd11.BB_findClick(Sender: TObject);
var
  sqlstr:string;
begin
  with  sqlquery1 do
  begin
    sql.Clear;
    sqlstr := 'select a.*,b.*,c.abbr_titl,d.pst_chs '+
      ' from hrd_leav_picc as a,hrd_emp as b,hrd_dept as c,hrd_prof as d '+
      ' where a.emp_id=b.emp_id and b.dept_code=c.dept_code and b.pst_code=d.pst_code';
    if rd_month.Checked then
    begin
      if (not checkmonth(month_b.Text)) or (not checkmonth(month_e.Text))  then
      begin
        wideshowmessage(GetLangName(ws_Words,'hrd11_error1'));
        exit;
      end;
      if trim(month_b.Text)<>'' then
        sqlstr := sqlstr + ' and picc_mons>='''+month_b.Text+'''';
      if trim(month_e.Text)<>'' then
        sqlstr := sqlstr + ' and picc_mons<='''+month_e.Text+'''';
    end;
    if rd_lvmon.Checked then
    begin
      if (not checkmonth(lmonth_b.Text)) or (not checkmonth(lmonth_e.Text))  then
      begin
        wideshowmessage(GetLangName(ws_Words,'hrd11_error1'));
        exit;
      end;
      if trim(lmonth_b.Text)<>'' then
        sqlstr := sqlstr + ' and picc_mone>='''+lmonth_b.Text+'''';
      if trim(lmonth_e.Text)<>'' then
        sqlstr := sqlstr + ' and picc_mone<='''+lmonth_e.Text+'''';
    end;
    if rd_id.Checked then
    begin
      if trim(id_b.Text)<>'' then
        sqlstr := sqlstr + ' and a.emp_id>='''+id_b.Text+'''';
      if trim(id_e.Text)<>'' then
        sqlstr := sqlstr + ' and a.emp_id<='''+id_e.Text+'''';
    end;
    if rd_name.Checked then
    begin
      if trim(edt_name.Text)<>'' then
        sqlstr := sqlstr + ' and b.emp_chs like ''%'+trim(edt_name.Text)+'%''';
    end;
    if rd_dept.Checked then
    begin
      if trim(dept_s.Text)<>'' then
        sqlstr := sqlstr + ' and b.dept_code>='''+leftstr(dept_s.Text,6)+'''';
      if trim(dept_e.Text)<>'' then
        sqlstr := sqlstr + ' and b.dept_code<='''+leftstr(dept_e.Text,6)+'''';
    end;
    sql.Add(sqlstr);
    open;
  end;
  edt_total.Text := inttostr(sqlquery1.RecordCount);
end;

procedure Tformhrd11.TntDBGrid1TitleClick(Column: TColumn);
begin
  DBGridSortByTitle(column);//點擊表格標頭改變排序方式
end;

procedure Tformhrd11.RD_monthClick(Sender: TObject);
begin
  if RD_month.Checked then
  begin
    month_b.Enabled := true;
    month_e.Enabled := true;
  end
  else
  begin
    month_b.Enabled := false;
    month_e.Enabled := false;
  end;
  if RD_LVMON.Checked then
  begin
    lmonth_b.Enabled := true;
    lmonth_e.Enabled := true;
  end
  else
  begin
    lmonth_b.Enabled := false;
    lmonth_e.Enabled := false;
  end;
  if RD_ID.Checked then
  begin
    ID_b.Enabled := true;
    ID_e.Enabled := true;
  end
  else
  begin
    ID_b.Enabled := false;
    ID_e.Enabled := false;
  end;
  if RD_NAME.Checked then
    EDT_NAME.Enabled := true
  else
    EDT_NAME.Enabled := false;
  if RD_DEPT.Checked then
  begin
    dept_s.Enabled := true;
    dept_e.Enabled := true;
  end
  else
  begin
    dept_s.Enabled := false;
    dept_e.Enabled := false;
  end;
end;

procedure Tformhrd11.DEPT_SChange(Sender: TObject);
var
  i:integer;
begin
  with sqlquery2 do
  begin
    active:=false;
    SQL.Clear;
    sql.Add('select * from hrd_dept  order by dept_code');
    active:=true;
  end;
  sqlquery2.first;
  dept_e.Clear;
  i:=0;
  while not sqlquery2.Eof do
  begin
    if i>=dept_s.ItemIndex then
      dept_e.AddItem(sqlquery2.FieldByName('dept_code').asstring+'-'+sqlquery2.FieldByName('abbr_titl').AsString,Sender);
    sqlquery2.next;
    i:=i+1;
  end;
  dept_e.ItemIndex:=dept_e.Items.Count-1;//部門止指向最后一筆
end;

procedure Tformhrd11.privilegeChange(Sender: TObject);
begin
  sqlQuery1.Close;
  edt_total.Text:='';
  tntdbgrid2.DataSource := nil;
  tntdbgrid3.DataSource := nil;
end;

procedure Tformhrd11.bb_searchClick(Sender: TObject);
var
  sqlstr:string;
  s_date,e_date:TDatetime;
begin
  if (me_end.text>FormatDateTime('yyyymm',date)) or (length(me_bgn.text)<>6) or (length(me_end.text)<>6) then
  begin
    WideShowMessage('退保月份必須小於當前月份');
    exit;
  end;
  SqlStr:='select a.*,b.* from hrd_picc as a,hrd_emp as b where a.emp_id=b.emp_id and NOT(b.epledt IS NULL)';
  if rb_shoe.Checked then
    SqlStr:=SqlStr+' and left(b.dept_code,1)=''V'''
  else
    SqlStr:=SqlStr+' and left(b.dept_code,1)=''N''';

  {if tntCheckBox1.Checked then
  begin
    SqlStr:=SqlStr+' and a.picc_mon>='''+me_bgn.Text+''' and a.picc_mon<='''+me_end.text+''' ';
  end;}
  if tntCheckBox1.Checked then
  begin//退保月份
    s_date:=EncodeDate(StrToInt(LeftStr(me_bgn.text,4)),StrToInt(RightStr(me_bgn.text,2)),1);
    e_date:=EncodeDate(StrToInt(LeftStr(me_end.text,4)),StrToInt(RightStr(me_end.text,2)),1);
    e_date:=EndOfTheMonth(e_date);
    SqlStr:=SqlStr+' and B.epledt>='''+FormatDateTime('yyyy/mm/dd',s_date)+''''
      +' and B.epledt<='''+FormatDateTime('yyyy/mm/dd',e_date)+'''';
  end;
  if tntCheckBox2.Checked then
  begin
    SqlStr:=SqlStr+' and a.emp_id>='''+edt_bgn.Text+''' and a.emp_id<='''+edt_end.text+''' ';
  end;
  SqlStr:=SqlStr+' order by a.emp_id';
  with sqlquery2 do
  begin
    close;
    sql.Clear;
    sql.Add(SqlStr);
    open;
    if not eof then
      sb_save.Enabled := true;
  end;
  datasource2.DataSet := sqlquery2;
  tntDBGrid2.DataSource := datasource2;

end;

procedure Tformhrd11.sb_SaveClick(Sender: TObject);
begin

  DMHRDSYS.conn.BeginTrans;
  sqlquery3.Open;
  with sqlquery2 do
  begin
    first;
    while not eof do
    begin
      sqlquery3.Append;
      sqlquery3.fieldbyname('upd_user').value:=UserName;
      sqlquery3.fieldbyname('emp_id').value:=fieldbyname('emp_id').value;
      sqlquery3.fieldbyname('insur_seq').value:= fieldbyname('insur_seq').value;
      sqlquery3.fieldbyname('picc_mons').value:= fieldbyname('picc_mon').value;
      sqlquery3.fieldbyname('picc_mone').value:= formatdatetime('yyyymm',fieldbyname('epledt').value);
      sqlquery3.fieldbyname('picc_pay').value:= GetSumInsurance(fieldbyname('pst_code').value,fieldbyname('edu_code').value,fieldbyname('picc_mon').value,formatdatetime('yyyymm',fieldbyname('epledt').value));
      sqlquery3.Post;
      dmhrdsys.ADOCommand1.CommandText := 'delete from hrd_picc where emp_id='''+fieldbyname('emp_id').value+'''';
      dmhrdsys.ADOCommand1.Execute;
      next;
    end;
  end;
  sqlquery2.UpdateBatch(arAll);
  sqlquery3.UpdateBatch(arAll);
  sb_save.Enabled := false;
  sqlquery2.Close;
  tntdbgrid3.DataSource:=Datasource3 ;
  wideshowmessage(GetLangName(ws_Words,'tran_success'));
  DMHRDSYS.conn.CommitTrans;
end;

procedure Tformhrd11.ID_EDblClick(Sender: TObject);
var
  Aempid:string;
begin
  Aempid := FindEmpId('emp_id');
  if AEmpId <> '' then
    ttntedit(sender).Text := Aempid;
end;

procedure Tformhrd11.sqlQuery2AfterClose(DataSet: TDataSet);
begin
  TntEdit1.text:= '0';
end;

procedure Tformhrd11.sqlQuery2AfterOpen(DataSet: TDataSet);
begin
  TntEdit1.text:= inttostr(sqlquery2.Recordcount);
end;
function Tformhrd11.GetDept(dept:string):widestring;
begin
  with dmhrdsys.sqlquery1 do
  begin
    close;
    sql.clear;
    sql.add('select * from hrd_dept where dept_code='''+dept+''' ');
    open;
    if not eof then
      result:=fieldbyname('abbr_titl').value
    else
      result:='';
    close;
  end;
end;
function Tformhrd11.GetPst(pstcode:string):widestring;
begin
  with dmhrdsys.sqlquery1 do
  begin
    close;
    sql.clear;
    sql.add('select * from hrd_prof where pst_code='''+pstcode+''' ');
    open;
    if not eof then
      result:=fieldbyname('pst_chs').value
    else
      result:='';
    close;  
  end;
end;
procedure Tformhrd11.sqlQuery2CalcFields(DataSet: TDataSet);
begin
  sqlquery2.FieldByName('pst_name').Value:=sqlquery2.fieldbyname('pst_code').AsString+'-'+widestring(GetPst(sqlquery2.fieldbyname('pst_code').AsString));
  sqlquery2.FieldByName('dept').Value:=sqlquery2.fieldbyname('dept_code').AsString+'-'+widestring(GetDept(sqlquery2.fieldbyname('dept_code').AsString));

end;

procedure Tformhrd11.sqlQuery1AfterScroll(DataSet: TDataSet);
begin
  with DataSet do
    setStatusText(GetLangName(ws_Words,'current_location')+':'+inttostr(RecNo)+' '+GetLangName(ws_Words,'total')+':'+inttostr(RecordCount));
end;

end.
