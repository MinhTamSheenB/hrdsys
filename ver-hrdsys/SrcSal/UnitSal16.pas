{*************************************************************************
Name�Gsal16
Author: anil
Create date:2005-11-10
Modify date:2005-11-10
Commentate:�~��d�ߪ���
*************************************************************************}
unit UnitSal16;

interface

uses
//  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
//  Dialogs, Mask, DBCtrls, TntDbCtrls, ExtCtrls, Grids, DBGrids, TntDBGrids,
//  StdCtrls, Buttons, TntButtons, TntStdCtrls, TntExtCtrls, ComCtrls,
//  TntComCtrls,WSDLIntf, DB, ADODB,TntDialogs,strutils, TntDB,DateUtils;

    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, TntDbCtrls, ExtCtrls, Grids, DBGrids, TntDBGrids,
  StdCtrls, Buttons, TntButtons, TntStdCtrls, TntExtCtrls, ComCtrls,
  TntComCtrls,WSDLIntf, DB, ADODB,TntDialogs,strutils, TntDB,DateUtils,excel97,excel2000;

type
  TExcelThread = class(TThread)
  protected
     procedure execute;override;
  end;
  TFormSal16 = class(TForm)
    Panel1: TPanel;
    PanelTitle: TTntPanel;
    PanelMain: TPanel;
    DataSource1: TDataSource;
    PanelQuery: TPanel;
    TntGroupBox1: TTntGroupBox;
    TntLabel6: TTntLabel;
    edit_begin: TTntEdit;
    edit_end: TTntEdit;
    PanelGrid: TPanel;
    DBGrid1: TTntDBGrid;
    ADOQuery1: TADOQuery;
    Btn_Search: TTntBitBtn;
    TntLabel10: TTntLabel;
    CobDeptBegin: TTntComboBox;
    CobDeptEnd: TTntComboBox;
    TntLabel1: TTntLabel;
    CobPstBegin: TTntComboBox;
    CobPstEnd: TTntComboBox;
    BtnPrint: TTntBitBtn;
    TntLabel2: TTntLabel;
    EditMon: TTntEdit;
    ADOQuery1upd_user: TStringField;
    ADOQuery1upd_date: TDateTimeField;
    ADOQuery1emp_id: TStringField;
    ADOQuery1pay_mon: TStringField;
    ADOQuery1actu_pay: TBCDField;
    ADOQuery1emp_chs: TWideStringField;
    ADOQuery1pst_code: TStringField;
    ADOQuery1name_vim: TWideStringField;
    ADOQuery1dept_code: TStringField;
    ADOQuery1base_pay: TBCDField;
    ADOQuery1mgmt_ofr: TBCDField;
    ADOQuery1tech_ofr: TBCDField;
    ADOQuery1duty_ofr: TBCDField;
    ADOQuery1envr_ofr: TBCDField;
    ADOQuery1grad_ofr: TBCDField;
    ADOQuery1efft_awd: TBCDField;
    ADOQuery1longwork_pay: TBCDField;
    ADOQuery1te_pay: TBCDField;
    ADOQuery1duo_awd: TBCDField;
    ADOQuery1full_awd: TBCDField;
    ADOQuery1over_work: TBCDField;
    ADOQuery1sal_night: TBCDField;
    ADOQuery1stop_supp: TBCDField;
    ADOQuery1injury_supp: TBCDField;
    ADOQuery1salhol_supp: TBCDField;
    ADOQuery1gong_pay: TBCDField;
    ADOQuery1supp_agai: TBCDField;
    ADOQuery1picc_back: TBCDField;
    ADOQuery1othe_supp: TBCDField;
    ADOQuery1other_temp: TBCDField;
    ADOQuery1sick_supp: TBCDField;
    ADOQuery1sick_back: TBCDField;
    ADOQuery1deal_pay: TBCDField;
    ADOQuery1meal_pay: TBCDField;
    ADOQuery1ask_pay: TBCDField;
    ADOQuery1stop_dedu: TBCDField;
    ADOQuery1picc_she: TBCDField;
    ADOQuery1picc_yi: TBCDField;
    ADOQuery1laun_pay: TBCDField;
    ADOQuery1tax_pay: TBCDField;
    ADOQuery1psal_awd: TBCDField;
    ADOQuery1sup_dedu: TBCDField;
    ADOQuery1picc_shiye: TFloatField;
    ADOQuery1insur_seq: TStringField;
    ADOQuery1ovr_base_pay: TFloatField;
    ADOQuery1epledt: TDateField;
    ADOQuery1epindt: TDateField;
    TntButton1: TTntButton;
    TntPanel1: TTntPanel;
    Rball: TTntRadioButton;
    RbInWork: TTntRadioButton;
    RbLeftWork: TTntRadioButton;
    RbAbSal: TTntRadioButton;
    TntPanel2: TTntPanel;
    rb_fuluh: TTntRadioButton;
    rb_sb: TTntRadioButton;
    //my define
    procedure InitLang;
    procedure InitForm;
    //auto general
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure ADOQuery1AfterScroll(DataSet: TDataSet);
    procedure Btn_ResetClick(Sender: TObject);
    procedure Btn_SearchClick(Sender: TObject);
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
    procedure BtnPrintClick(Sender: TObject);
    procedure TntButton1Click(Sender: TObject);
    procedure edit_beginChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSal16: TFormSal16;

implementation
uses
  UnitHrdUtils,unitDMHrdsys, comobj;
var
  Langstr,LangC,LangE,LangV:TWideStrings;//�y���r�Ŧ�
  pri_arr:TPrvArr;//�v���Ʋ�
  ExcelThread:TExcelThread;
  can_post:boolean;
  SalBaseLvl:TStrings;
const
  TMP_DB='[tempdbf].[dbo].';
  TMP_TABLE='tmp_saltran_qry';
{$R *.dfm}

procedure TFormSal16.FormCreate(Sender: TObject);
//��l��
begin
  InitLang;// Init language
  pri_arr:=GetPrvArr(username,'sal16');//Get privilege
  InitForm;// Init Form
end;

procedure TFormSal16.InitLang;
{*************************************************************************
TO DO:��l�ƻy��
*************************************************************************}
var
  keys:String;
begin
SetComponentLang(self);//set component language text
keys:='vietnam_chingluh_company,hrd15_titl,total,current_location,'
  +'save_success,msg_confirm_save,msg_confirm_cancel,msg_del_alert,'
  +'not_find_data,with_star_cannot_empty,msg_post_record_on_close,'
  +'cur_emp_id,';
LangC:=GetLangWideStrs(keys,'C');
LangE:=GetLangWideStrs(keys,'E');
LangV:=GetLangWideStrs(keys,'V');
if userlang='V' then LangStr:=LangV
else if userlang='E' then LangStr:=LangE
else LangStr:=LangC;
//PanelTitle.Caption:=GetLangName(LangStr,'dut02_titl');
end;

procedure TFormSal16.InitForm;
{*************************************************************************
TO DO:��l��Form
*************************************************************************}
var
  SqlStr:string;
begin
  {SqlStr:='select dept_code+'' ''+abbr_titl from hrd_dept';
  SetComboxList(sqlStr,CobDeptBegin);
  SetComboxList(sqlStr,CobDeptEnd);}
  GetDeptRange(CobDeptBegin);
  GetDeptRange(CobDeptEnd);
  SqlStr:='select pst_code+'' ''+pst_chs from hrd_prof where pst_code>=''12''';
  SetComboxList(sqlStr,CobPstBegin);
  SetComboxList(sqlStr,CobPstEnd);
  EditMon.Text:=formatDateTime('yyyymm',date-25);
  SalBaseLvl:=GetAllBaseLvl;
end;

procedure TFormSal16.Btn_SearchClick(Sender: TObject);
//�d�߼ƾ�
var
  sql_str,DateStr, sMonth:string;
  ADate:TDateTime;
begin
  //
  sMonth := EditMon.Text;

  ADate:=EnCodeDate(StrToInt(LeftStr(editMon.Text,4)),StrToInt(RightStr(editMon.Text,2)),1);
  ADate:=EndOfTheMonth(ADate);
  DateStr:=FormatDateTime('yyyy/mm/dd',ADate);
  sql_str:='select * from hrd_sal_paymt A,hrd_emp B'
    +' where A.emp_id=B.emp_id and pay_mon='''+EditMon.Text+'''';
  if edit_begin.Text<>'' then
    sql_str:=sql_str+' and A.emp_id>='''+edit_begin.Text+'''';
  if edit_end.Text<>'' then
    sql_str:=sql_str+' and A.emp_id<='''+edit_end.Text+'''';
  //if (CobDeptBegin.Text<>'') or (CobDeptEnd.Text<>'') or (CobPstEnd.Text<>'') or (CobPstEnd.Text<>'') or (RbInWork.Checked) or (RbLeftWork.Checked) then
  if CobDeptBegin.Text<>'' then
    sql_str:=sql_str+' and A.dept_code>='''+LeftStr(CobDeptBegin.Text,6)+'''';
  if CobDeptEnd.Text<>'' then
    sql_str:=sql_str+' and A.dept_code<='''+LeftStr(CobDeptEnd.Text,6)+'''';
  if CobPstBegin.Text<>'' then
    sql_str:=sql_str+' and A.pst_code>='''+LeftStr(CobPstBegin.Text,2)+'''';
  if CobPstEnd.Text<>'' then
    sql_str:=sql_str+' and A.pst_code<='''+LeftStr(CobPstEnd.Text,2)+'''';
  if RbAbSal.Checked then//�~�겧�`
    sql_str:=sql_str+' and actu_pay<=0';
  if RbInWork.Checked then//�b¾
    sql_str:=sql_str+' and A.info_code=''0''';
    //sql_str:=sql_str+' and (B.epledt is null or B.epledt>'''+DateStr+''')';
  if RbLeftWork.Checked then//��¾
    sql_str:=sql_str+' and A.info_code<>''0''';
    //sql_str:=sql_str+' and B.epledt is not null and B.epledt<='''+DateStr+'''';

  //2012-09-07 hyt add
   sql_str:=sql_str+' and '+AnalysisFactorySql('A');
  //
  if sMonth= '201606' then
  begin
    if rb_fuluh.Checked then
      sql_str := sql_str + ' AND A.EMP_ID NOT IN(SELECT EMP_ID FROM HRD_EMP_CHANGE WHERE CHANGE_MONTH = '+QuotedStr(EditMon.Text)+')'
    else
      sql_str := sql_str + ' AND A.EMP_ID IN(SELECT EMP_ID FROM HRD_EMP_CHANGE WHERE CHANGE_MONTH = '+QuotedStr(EditMon.Text)+')';
  end
  else begin
    if rb_fuluh.Checked then
      sql_str := sql_str + ' AND A.PAY_MON < ''201606'''
    else if rb_sb.Checked then
      sql_str := sql_str + ' AND A.PAY_MON >= ''201607''';
  end;
  //
  sql_str:=sql_str+' order by A.emp_id';
  with Adoquery1 do
  begin
    close;
    sql.Clear;
    sql.Add(sql_str);
    open;
  end;
  if Adoquery1.Eof then
  begin
    SetStatusText(GetLangName(LangStr,'not_find_data'));
    BtnPrint.Enabled:=false;
  end
  else
    BtnPrint.Enabled:=true;
end;

procedure TFormSal16.Btn_ResetClick(Sender: TObject);
//���m�d�߱���
var
  status:boolean;
begin
if TtntBitBtn(Sender).Name='Btn_Reset' then
  status:=true
else
  status:=false;
edit_begin.Enabled:=status;
edit_end.Enabled:=status;
Btn_search.Enabled:=status;
//if status=true then
ADOQuery1.Active:= not status;
end;

procedure TFormSal16.ADOQuery1AfterScroll(DataSet: TDataSet);
//�ƾڶ����ʮ�,���ܪ��A�洣��,�Χ��ܽs��Ϥ@�����
var
  AText:string;
begin
with ADOQuery1 do
  AText:=GetLangName(LangStr,'current_location')+':'+inttostr(RecNo)+'; '
    +GetLangName(LangStr,'total')+':'+inttostr(RecordCount)+'; '
    +GetLangName(LangStr,'cur_emp_id')+':'+FieldByName('emp_id').AsString;
  setStatusText(AText);
end;

procedure TFormSal16.DBGrid1TitleClick(Column: TColumn);
begin
  DBGridSortByTitle(column);//�I��������Y���ܱƧǤ覡
end;

procedure TFormSal16.ADOQuery1CalcFields(DataSet: TDataSet);
var
  SqlStr,emp_id,pst_code,edu_code,dept_code:string;
  sLast3Month,sFlag:string;
begin
  emp_id:=DataSet.FieldByName('emp_id').AsString;
  with DMHrdsys.SQLQuery2 do
  begin
    close;
    sql.Clear;
    sql.Add('select * from hrd_picc where emp_id='''+emp_id+'''');
    open;
    if not Eof then
    begin
      DataSet.FieldByName('insur_seq').AsString:=FieldByName('insur_seq').AsString;
    end;
  end;

  with DataSet do
  begin
    //***2012-05-04 hyt add ������~��     epindt
    sLast3Month:=str_PreMonth(EditMon.Text); //�h3�Ӥ�
    sLast3Month:=str_PreMonth(sLast3Month);
    sLast3Month:=str_PreMonth(sLast3Month);
    //
    sFlag:='';
    if DataSet.FieldByName('epledt').AsString ='' then
    begin
      if formatDatetime('yyyymm',DataSet.FieldByName('epindt').AsDateTime )<sLast3Month then
        sFlag:='ok' ; //�w���եδ�
    end
    else if formatDatetime('yyyymm',DataSet.FieldByName('epledt').AsDateTime )<EditMon.Text then //else if formatDatetime('yyyymm',DataSet.FieldByName('epledt').AsDateTime )<>EditMon.Text then
      sFlag:='ok';


    if sFlag<>'ok' then
    begin
      if EditMon.Text<= '201512' then
      begin
        SqlStr:=DB_GetSRecord('select base_pay from hrd_sal_base where emp_id='''+DataSet.FieldByName('emp_id').AsString+'''');
        if SqlStr<>'' then
          DataSet.FieldByName('ovr_base_pay').Value := strToFloat(SqlStr);
      end
      else begin
        if fieldbyname('pst_code').AsString < '60' then
          FieldByName('ovr_base_pay').value:= GetBasepay(FieldByName('emp_id').AsString) + GetStdPay(FieldByName('emp_id').AsString)
        else
          FieldByName('ovr_base_pay').value:= GetBasepay(FieldByName('emp_id').AsString);
      end;

    end
    else begin
      if EditMon.Text<= '201512' then
        DataSet.FieldByName('ovr_base_pay').Value :=DataSet.FieldByName('base_pay').Value
      else begin
        if fieldbyname('pst_code').AsString < '60' then
          FieldByName('ovr_base_pay').value:= GetBasepay(FieldByName('emp_id').AsString) + GetStdPay(FieldByName('emp_id').AsString)
        else
          FieldByName('ovr_base_pay').value:= GetBasepay(FieldByName('emp_id').AsString);
      end;  
    end;  
    //***>>>
  end;
end;

procedure TFormSal16.BtnPrintClick(Sender: TObject);
begin
  ShowPrint(ADOQuery1,'���u�~��d��');
end;

procedure TFormSal16.TntButton1Click(Sender: TObject);
begin

   if (ExcelThread=nil) or (ExcelThread.Terminated) then
      ExcelThread := TExcelThread.Create(false);
    
end;
procedure TExcelThread.execute;
{-----------���ƽu�{-----------}
var
  Excelid: Variant;
  i,j:integer ;
  ColStr, sql , othe1, othe2:string ;
  AQry:TADOQuery;
  Str1,Str2,Str3,Str4:widestring;
  Formsal16:TFormsal16;
  trunggian,pur_no,sqlstr, paycate:string;
  sohang,cuoitaptin:Longint;


begin
  ColStr:='N';//xac dinh xem cot co bao nhieu cot
  FormSal16:=TFormsal16(application.FindComponent('Formsal16')); //�`�N:���B�@�w�n���U���^(�n��,�{����)
with FormSal16 do
  begin
    try
      Excelid:=CreateOleObject( 'Excel.Application' );
    except
      on Exception do raise exception.Create('�L�k�Ы�Xls���A�нT�{�O�_�w��EXCEL')
    end;

    Excelid.Visible := True;
    Excelid.WorkBooks.Add;

    Excelid.worksheets[1].range['A1:'+'AL1'].Merge(True);
    Excelid.worksheets[1].range['A1:'+'AL1'].FONT.UNDERLINE:=TRUE;

    Excelid.WorkSheets[1].Cells[1,1].Value :=LeftStr(formsal16.Editmon.Text,4)+' �~ '+RightStr(formsal16.Editmon.Text,2)+' ����V�n���u�~����Ӫ� ';
    Excelid.worksheets[1].range['A1:AL1'].VerticalAlignment := xlCenter;
    Excelid.worksheets[1].Range['A1:AL1'].font.size:=10;
    Excelid.worksheets[1].Range['A1:AL1'].font.bold:=true;
    for i := 1 to 36  do
        Excelid.worksheets[1].Columns[i].ColumnWidth := 8;

    Excelid.worksheets[1].Columns[4].ColumnWidth := 20;
    Excelid.worksheets[1].Columns[1].ColumnWidth := 5;
    Excelid.worksheets[1].Range['A2:AL2'].Borders.LineStyle := 1 ;

    Excelid.WorkSheets[1].Cells[2,1].Value :='NO.' ;
    Excelid.WorkSheets[1].Cells[2,2].Value :='�����N��' ;
    Excelid.WorkSheets[1].Cells[2,3].Value :='�u��' ;
    Excelid.WorkSheets[1].Cells[2,4].Value :='�V��m�W.' ;
    Excelid.WorkSheets[1].Cells[2,5].Value :='�򥻤u��' ;
    Excelid.WorkSheets[1].Cells[2,6].Value :='�D�ޥ[��' ;
    Excelid.WorkSheets[1].Cells[2,7].Value :='�M�~�[��' ;
    Excelid.WorkSheets[1].Cells[2,8].Value :='¾�Ȭz�K' ;
    Excelid.WorkSheets[1].Cells[2,9].Value :='���Ҭz�K' ;
    Excelid.WorkSheets[1].Cells[2,10].Value :='¾�����B' ;
    Excelid.WorkSheets[1].Cells[2,11].Value :='�Ĳv����' ;
    Excelid.WorkSheets[1].Cells[2,12].Value :='�S�O����' ;
    Excelid.WorkSheets[1].Cells[2,13].Value :='�h�u����' ;
    Excelid.WorkSheets[1].Cells[2,14].Value :='���Լ���' ;
  //  Excelid.WorkSheets[1].Cells[2,15].Value :='���u�ɶK' ;
  //  Excelid.WorkSheets[1].Cells[2,16].Value :='���~����' ;
    Excelid.WorkSheets[1].Cells[2,15].Value :='1.5�[�Z�O' ;
    Excelid.WorkSheets[1].Cells[2,16].Value :='2.0�[�Z�O' ;
    Excelid.WorkSheets[1].Cells[2,17].Value :='3.0�[�Z�O' ;
    Excelid.WorkSheets[1].Cells[2,18].Value :='1.95�[�Z�O' ;
    Excelid.WorkSheets[1].Cells[2,19].Value :='�]�Z�ɶK' ;
    Excelid.WorkSheets[1].Cells[2,20].Value :='�\�Z����' ;
    Excelid.WorkSheets[1].Cells[2,21].Value :='�ɵo���B' ;
    Excelid.WorkSheets[1].Cells[2,22].Value :='�O�I����' ;
    Excelid.WorkSheets[1].Cells[2,23].Value :='�f������' ;
 //   Excelid.WorkSheets[1].Cells[2,26].Value :='�f���ɶK' ;
    Excelid.WorkSheets[1].Cells[2,24].Value :='�䥦�ɶK' ;
    Excelid.WorkSheets[1].Cells[2,25].Value :='����' ;
    Excelid.WorkSheets[1].Cells[2,26].Value :='���' ;
 //   Excelid.WorkSheets[1].Cells[2,30].Value :='�Ͳ�����' ;
    Excelid.WorkSheets[1].Cells[2,27].Value :='�ư�����' ;
    Excelid.WorkSheets[1].Cells[2,28].Value :='�f������' ;
    Excelid.WorkSheets[1].Cells[2,29].Value :='��������' ;
    Excelid.WorkSheets[1].Cells[2,30].Value :='�m�u����' ;
    Excelid.WorkSheets[1].Cells[2,31].Value :='���u����' ;
    Excelid.WorkSheets[1].Cells[2,32].Value :='���O' ;
    Excelid.WorkSheets[1].Cells[2,33].Value :='��O' ;
    Excelid.WorkSheets[1].Cells[2,34].Value :='���~�O�I' ;
    Excelid.WorkSheets[1].Cells[2,35].Value :='�u�ζO.' ;
    Excelid.WorkSheets[1].Cells[2,36].Value :='�ӤH�ұo�|' ;
    Excelid.WorkSheets[1].Cells[2,37].Value :='�W��ɦ�' ;
    Excelid.WorkSheets[1].Cells[2,38].Value :='��o�~��' ;
    Excelid.worksheets[1].Range['A3:AL3'].Borders.LineStyle := 1 ;
    Excelid.WorkSheets[1].Cells[3,1].Value :='NO.' ;
   // for i:=0 to Length( RetArr ) - 1  do
   //    begin
   //      Excelid.WorkSheets[1].Cells[3,i+2].Value :=GetLangName(Langstr1,RetArr[i])  ;
   //    end;
    Excelid.worksheets[1].Range['A3:AL3'].Borders.LineStyle := 1 ;
    Excelid.worksheets[1].range['A3:AL3'].VerticalAlignment := xlCenter;
    Excelid.worksheets[1].Range['A3:AL3'].font.size:=10;
    Excelid.worksheets[1].Range['A3:AL3'].font.bold:=true;
    i := 4 ;
    adoQuery1.First ;
    while  not AdoQuery1.Eof   do
        begin
            ColStr :='A'+ inttostr( i) +':'+'AL' + inttostr(i);
            Excelid.worksheets[1].range[ColStr].VerticalAlignment := xlCenter;
            Excelid.worksheets[1].Range[colStr].font.size:=8;
            Excelid.worksheets[1].Range[colStr].Font.Name := 'Arial';
            Excelid.WorkSheets[1].Cells[i,1].Value := i - 2  ;
            Excelid.WorkSheets[1].Cells[i,2].Value := AdoQuery1.FieldByName('dept_code').AsString ;
            Excelid.WorkSheets[1].Cells[i,3].Value := ''''+AdoQuery1.FieldByName('emp_id').AsString ;
            Excelid.WorkSheets[1].Cells[i,4].Value := AdoQuery1.FieldByName('name_vim').Value  ;
            Excelid.WorkSheets[1].Cells[i,5].Value := AdoQuery1.FieldByName('base_pay').AsString ;
            Excelid.WorkSheets[1].Cells[i,6].Value := AdoQuery1.FieldByName('mgmt_ofr').AsString ;
            Excelid.WorkSheets[1].Cells[i,7].Value := AdoQuery1.FieldByName('tech_ofr').AsVariant  ;
            Excelid.WorkSheets[1].Cells[i,8].Value := AdoQuery1.FieldByName('duty_ofr').AsString ;

            Excelid.WorkSheets[1].Cells[i,9].Value := AdoQuery1.FieldByName('envr_ofr').AsString  ;
            Excelid.WorkSheets[1].Cells[i,10].Value := AdoQuery1.FieldByName('grad_ofr').AsString ;
       //     Excelid.WorkSheets[1].Cells[i,11].Value := AdoQuery1.FieldByName('efft_awd').AsString ;
            Excelid.WorkSheets[1].Cells[i,12].Value := AdoQuery1.FieldByName('te_pay').AsString ;
            Excelid.WorkSheets[1].Cells[i,13].Value := AdoQuery1.FieldByName('duo_awd').AsString ;
            Excelid.WorkSheets[1].Cells[i,14].Value := AdoQuery1.FieldByName('full_awd').AsString;
     //       Excelid.WorkSheets[1].Cells[i,15].Value := AdoQuery1.FieldByName('stop_supp').AsString ;

           // Excelid.WorkSheets[1].Cells[i,16].Value := AdoQuery1.FieldByName('salhol_supp').AsString ;
         //   Excelid.WorkSheets[1].Cells[i,15].Value := AdoQuery1.FieldByName('over15_sal').AsString ;
         //   Excelid.WorkSheets[1].Cells[i,16].Value := AdoQuery1.FieldByName('over20_sal').AsString ;
         //   Excelid.WorkSheets[1].Cells[i,17].Value := AdoQuery1.FieldByName('over30_sal').AsString ;
         //   Excelid.WorkSheets[1].Cells[i,18].Value := AdoQuery1.FieldByName('over195_sal').AsString ;
         //   Excelid.WorkSheets[1].Cells[i,19].Value := AdoQuery1.FieldByName('sal_night').AsString ;
            Excelid.WorkSheets[1].Cells[i,20].Value := AdoQuery1.FieldByName('gong_pay').AsString ;
            Excelid.WorkSheets[1].Cells[i,21].Value := AdoQuery1.FieldByName('supp_agai').AsVariant  ;
            Excelid.WorkSheets[1].Cells[i,22].Value := AdoQuery1.FieldByName('picc_back').AsString;
            Excelid.WorkSheets[1].Cells[i,23].Value := AdoQuery1.FieldByName('sick_back').AsString  ;
        //    Excelid.WorkSheets[1].Cells[i,26].Value := AdoQuery1.FieldByName('sick_supp').AsString ;
            Excelid.WorkSheets[1].Cells[i,24].Value := AdoQuery1.FieldByName('othe_supp').AsString ;

            //Excelid.WorkSheets[1].Cells[i,25].Value := AdoQuery1.FieldByName('psal').AsString ;
            Excelid.WorkSheets[1].Cells[i,26].Value := AdoQuery1.FieldByName('other_temp').AsString ;
         //   Excelid.WorkSheets[1].Cells[i,30].Value := AdoQuery1.FieldByName('prd_pay').AsString ;
            //Excelid.WorkSheets[1].Cells[i,27].Value := AdoQuery1.FieldByName('ask_sal').AsFloat ;
            //Excelid.WorkSheets[1].Cells[i,28].Value := AdoQuery1.FieldByName('sick_sal').AsFloat ;
            //Excelid.WorkSheets[1].Cells[i,29].Value := AdoQuery1.FieldByName('chan_sal').AsFloat ;
            //Excelid.WorkSheets[1].Cells[i,30].Value := AdoQuery1.FieldByName('abs_sal').AsFloat ;
            //Excelid.WorkSheets[1].Cells[i,31].Value := AdoQuery1.FieldByName('stop_dedu').AsString ;

            Excelid.WorkSheets[1].Cells[i,32].Value := AdoQuery1.FieldByName('picc_she').AsString ;
            Excelid.WorkSheets[1].Cells[i,33].Value := AdoQuery1.FieldByName('picc_yi').AsString ;
            Excelid.WorkSheets[1].Cells[i,34].Value := AdoQuery1.FieldByName('picc_shiye').AsString ;//AdoQuery1.FieldByName('dept_code').AsString ;
            Excelid.WorkSheets[1].Cells[i,35].Value := AdoQuery1.FieldByName('laun_pay').AsString  ;
            Excelid.WorkSheets[1].Cells[i,36].Value := AdoQuery1.FieldByName('tax_pay').AsString;
            Excelid.WorkSheets[1].Cells[i,37].Value := AdoQuery1.FieldByName('sup_dedu').AsFloat  ;
            Excelid.WorkSheets[1].Cells[i,38].Value := AdoQuery1.FieldByName('actu_pay').AsString ;
            Excelid.worksheets[1].Range[colStr].Borders.LineStyle := 1 ;
            i := i +1 ;
            adoQuery1.Next ;
        end;
  end;
  terminate;
//  sb_email
end;

procedure TFormSal16.edit_beginChange(Sender: TObject);
begin
  edit_end.Text :=edit_begin.Text ;
end;

end.