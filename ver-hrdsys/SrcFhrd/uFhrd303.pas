{******************************************************************************
name：fhrd303(員工調升記錄維護)
author: tristan
create date:2005-08-22
commentate:員工調升記錄維護
*******************************************************************************}

unit uFhrd303;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TntStdCtrls, ExtCtrls, TntExtCtrls, Grids, DBGrids,
  TntDBGrids, Buttons, TntButtons, DBCtrls, DB,StrUtils,WSDLIntf, Mask,
  TntDbCtrls, ComCtrls,TntComCtrls, ADODB,tntDialogs, DateUtils,TntGrids,
  CheckLst, TntCheckLst,math, TntDB;

type
  TFormfhrd303 = class(TForm)
    TntGroupBox2: TTntGroupBox;
    TntLabel3: TTntLabel;
    TntLabel4: TTntLabel;
    TntLabel5: TTntLabel;
    TntLabel6: TTntLabel;
    TntLabel7: TTntLabel;
    TntLabel8: TTntLabel;
    TntLabel9: TTntLabel;
    pstCob: TTntComboBox;
    deptCob: TTntComboBox;
    TntPanel1: TTntPanel;
    TntGroupBox1: TTntGroupBox;
    TntGroupBox3: TTntGroupBox;
    TntDBGrid1: TTntDBGrid;
    TntDBGrid2: TTntDBGrid;
    empQuery: TADOQuery;
    empDataSource: TDataSource;
    rapSource: TDataSource;
    rapQuery: TADOQuery;
    saveDataQry: TADOQuery;
    tDate: TTntDateTimePicker;
    QryBank: TADOQuery;
    TntLabel11: TTntLabel;
    CobBank: TTntComboBox;
    TntLabel12: TTntLabel;
    EditCardNo: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    TntGroupBox4: TTntGroupBox;
    TntLabel15: TTntLabel;
    TntPanel3: TTntPanel;
    TntLabel16: TTntLabel;
    bbtn_Save: TTntBitBtn;
    EditTotal: TMaskEdit;
    empId: TTntEdit;
    TntLabel1: TTntLabel;
    TntLabel2: TTntLabel;
    saveData: TTntBitBtn;
    TntLabel13: TTntLabel;
    TntDBEdit1: TTntDBEdit;
    empQuery2: TADOQuery;
    TntLabel14: TTntLabel;
    TntDBEdit2: TTntDBEdit;
    baseSal: TTntDBEdit;
    foreignSal: TTntDBEdit;
    empQueryupd_user: TWideStringField;
    empQueryupd_date: TDateTimeField;
    empQueryvalid_date: TDateTimeField;
    empQueryemp_id: TWideStringField;
    empQuerydept_code: TWideStringField;
    empQuerydept_title: TWideStringField;
    empQuerypst_code: TWideStringField;
    empQueryfrn_amt: TBCDField;
    empQuerylocal_amt: TBCDField;
    empQuerysal_bas: TWideStringField;
    empQuerysal_frn: TWideStringField;
    empQueryfaward_amt: TBCDField;
    empQueryover_amt: TBCDField;
    empQuerytot_sal: TFloatField;
    TntDBEdit3: TTntDBEdit;
    TntEdit2: TTntEdit;
    empQueryemp_name: TStringField;
    empQueryepindt: TDateField;
    TntDBEdit4: TTntDBEdit;
    TntDBEdit5: TTntDBEdit;
    IsTryCob: TTntComboBox;
    empQuerytryout: TStringField;
    empQuerybase_amt: TBCDField;
    TntDBEdit6: TTntDBEdit;
    TntLabel10: TTntLabel;
    RMB: TTntRadioButton;
    USD: TTntRadioButton;
    empQuerycurr_cate: TTntStringField;

    // user create function and procedure

    procedure InitLang;

    // system create proceudre
    
    procedure FormCreate(Sender: TObject);
    procedure empQueryAfterScroll(DataSet: TDataSet);
    procedure exitSubFormClick(Sender: TObject);
    procedure empIdChange(Sender: TObject);
    procedure saveDataClick(Sender: TObject);
    procedure TntDBGrid1TitleClick(Column: TColumn);
    procedure TntBitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure empQueryCalcFields(DataSet: TDataSet);
    procedure bbtn_SaveClick(Sender: TObject);
    procedure empQueryAfterEdit(DataSet: TDataSet);
    procedure empQueryAfterInsert(DataSet: TDataSet);
    procedure empQueryBeforePost(DataSet: TDataSet);
    procedure tDateChange(Sender: TObject);
    procedure pstCobChange(Sender: TObject);
    procedure deptCobChange(Sender: TObject);

    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formfhrd303: TFormfhrd303;

implementation

uses
  UnitHrdUtils,unitDMHrdsys,UnitHrdMain, UnitEmp;

{$R *.dfm}

{***定義全局變量***}
var
  g_sLangStr : TWideStrings;
  can_save:boolean;
  aEmpId:string;

{*****************************************
Name: InitLang
Func: 初始化語言變量
Args:
    sKeys->語言變量
*****************************************}

procedure TFormfhrd303.InitLang;
var
  sKeys : string;
begin
  SetComponentLang(self);//set component language text
  sKeys:='fhrd303,save,quit,emp_id,fld_department,c_name,sal_bas,sal_frn,'+
  'total,table_field_pst_name,total,local_amt,promote_date,rap_type,'+
  'dept_code,fld_pst_code,fld_epindt,frn_grade,bas_grade,rp_date,remark'+
  ',maintentdata,promote_record,rap_record,local_amt,confirm_close,'+
  'msg_set_pst,msg_set_dept,msg_initbase_error,msg_initforeign_error,'+
  'msg_fetrap_error,msg_fetbase_error,msg_fetforeign_error,hrd09_error4,'+
  'msg_no_record,msg_empid_null,msg_localamt_null,msg_localamt_total,'+
  'msg_updsalstru_error,msg_add_error,msg_chg_dept,msg_chg_position,'+
  'msg_same_record,msg_cho_base,msg_cho_foreign,msg_chk_tdate,msg_confirm_save,'+
  'msg_confirm_save,msg_no_saltran_new,error_empid,msg_is_add_saltran,';

  g_sLangStr:=GetLangWideStrs(sKeys);

  TntPanel1.Caption:=GetLangName(g_sLangStr,'fhrd303');
  TntGroupBox1.Caption:=GetLangName(g_sLangStr,'maintentdata');
  TntGroupBox2.Caption:=GetLangName(g_sLangStr,'promote_record');
  TntGroupBox3.Caption:=GetLangName(g_sLangStr,'rap_record');
end;

procedure TFormfhrd303.FormCreate(Sender: TObject);
var
  sqlstr:string;
begin
  InitLang;
//  setCob;
  sqlstr:='select pst_code+'' ''+pst_chs from hrd_prof where pst_code>=''12''';
  SetComboxList(sqlstr,pstCob);
  sqlstr:='select dept_code+'' ''+abbr_titl from hrd_dept where is_del=''0''';
  SetComboxList(sqlstr,deptCob);
  {if not empQuery.Active then
    empQuery.Active := true; }
  tDate.Date := StartOfTheMonth(Date);
end;

procedure TFormfhrd303.empQueryAfterScroll(DataSet: TDataSet);
//移動紀錄
begin
  with DataSet do
  begin
    tDate.Date:=FieldByName('valid_date').AsDateTime;
    if FieldByName('pst_code').AsString<>'' then
      SetComboxIndex(pstCob,FieldByName('pst_code').AsString);
    if FieldByName('dept_code').AsString<>'' then
      SetComboxIndex(deptCob,FieldByName('dept_code').AsString);
    if not FieldByName('tryout').IsNull then
      SetComboxIndex(isTryCob,FieldByName('tryout').AsString)
    else
      isTryCob.ItemIndex:=-1;
  end;
end;

{******************************************
Name: exitSubFormClick
Func: 退出當前畫面
Args:
    curIndex->循環變量
*******************************************}

procedure TFormfhrd303.exitSubFormClick(Sender: TObject);
begin
  close;
end;

{********************************************
Name: empIdChange
Func: 輸入工號帶出相應數據，如果存在
Args:
    sSelStr->
*********************************************}

procedure TFormfhrd303.empIdChange(Sender: TObject);
var
  sSelStr : string;
  i : integer;
begin
  if Length(empId.Text)=6 then
  begin
    aEmpId:=trim(empId.Text);
    bbtn_Save.Enabled:=false;
    try
      sSelStr:='select * from fhrd_emp where emp_id='''+aEmpId+'''';
      with DMHrdsys.SQLQuery3 do
      begin
        close;
        sql.Clear;
        sql.Add(sSelStr);
        Open;
        if not Eof then
        begin//工號存在
          if FieldByName('pst_code').AsString<>'' then
            SetComboxIndex(pstCob,FieldByName('pst_code').AsString);
          if FieldByName('dept_code').AsString<>'' then
            SetComboxIndex(deptCob,FieldByName('dept_code').AsString);
        end
        else//工號不存在
        begin
          WideMessageDlg(GetLangName(g_sLangStr,'error_empid'),mtError,[mbYes],0);
          EmpId.SetFocus;
          empQuery.Close;
          Exit;
        end;
      end;
      //sSelStr:='select * from fhrd_emp A left join fhrd_tranhist B on A.emp_id=B.emp_id'
      //  +' where A.emp_id='''+aEmpId+''' order by valid_date desc';
      sSelStr:='select * from fhrd_tranhist where emp_id='''+aEmpId+''''
        +' order by valid_date desc';
      with empQuery do
      begin
        close;
        sql.Clear;
        sql.Add(sSelStr);
        Open;
        if (Eof) then
        begin//不存在調薪記錄
          if WideMessageDlg(GetLangName(g_sLangStr,'msg_no_saltran_new'),mtError,[mbYes,mbNo],0)=mrYes then
          begin//新增
            tDate.Date:=StartOfTheMonth(Date);
            Append;
            //***<<<2012-02-16 hyt add
            if ( RMB.Checked = true ) then
              fieldByName('curr_cate').Value :='RMB'
            else
              fieldByName('curr_cate').Value :='USD';
            //***>>>  

            pstCob.OnChange(self);
            deptCob.OnChange(self);
          end
          else
          begin//不新增
            EmpId.SetFocus;
            empQuery.Close;
            exit;
          end;
        end;
        First;
      end;
    except
      //widemessagedlg(GetLangName(g_sLangStr,'hrd09_error4'),mtError,[mbyes],1);
    end;
      {with DMHrdsys.SQLQuery1 do
      begin
        close;
        sql.Clear;
        sSelStr := 'select t.emp_id,(select emp_name from fhrd_emp'+
        ' where emp_id=t.emp_id) as emp_name,pst_code,dept_code'+
        ',t.sal_bas,t.bas_amt,t.sal_frn,t.frn_amt,t.local_amt,t.valid_date '+
        'from fhrd_tranhist as t,fhrd_salstru as s '+
        'where '+
        't.emp_id='''+empId.Text+''' and '+
        't.emp_id=s.emp_id and '+
        's.tryout='''+IntToStr(1)+''' and '+
        ' valid_date=(select max(valid_date) from fhrd_tranhist '+
        'where emp_id='''+empId.Text+''') order by t.emp_id,t.valid_date';
        sql.add(sSelStr);
        open;
        if RecordCount>0 then
        begin
          while Not Eof do
          begin
            empName.Text := FieldByName('emp_name').Value;
            chgDeptCob(FieldByName('dept_code').Value);
            chgPstCob(FieldByName('pst_code').Value);
            For i:=0 to baseCob.Items.Count-1 do
            begin
              if (LeftStr(baseCob.Items.Strings[i],2)=
                FieldByName('pst_code').Value) and
                (RightStr(baseCob.Items.Strings[i],2)=
                FieldByName('sal_bas').value) then
              begin
                baseCob.ItemIndex := i;
                baseSal.Text := FieldByName('bas_amt').Value;
                break;
              end;
            end;
            For i:=0 to foreignCob.Items.Count-1 do
            begin
              if (LeftStr(foreignCob.Items.Strings[i],2)=
                FieldByName('pst_code').Value) and
                (RightStr(foreignCob.Items.Strings[i],2)=
                FieldByName('sal_frn').value) then
              begin
                foreignCob.ItemIndex := i;
                foreignSal.Text := FieldByName('frn_amt').Value;
                break;
              end;
            end;
            if (baseSal.Text<>'') and (foreignSal.Text<>'') then
              totalSal.Text :=
            IntToStr(StrToInt(baseSal.Text)+StrToInt(foreignSal.Text));
            empQuery.Locate('emp_id',empId.Text,[loPartialKey]);
            next;
          end;
        end
        else
          widemessagedlg(GetLangName(g_sLangStr,'msg_no_record')+' In tranhist',
          mtWarning,[mbyes],1);
          baseCob.Items.Clear;
          foreignCob.Items.Clear;
          baseSal.Text := '';
          foreignSal.Text := '';
          totalSal.Text := '';
          with DMHrdsys.SQLQuery1 do
          begin
            close;
            sql.Clear;
            sql.Add('select * from vfhrdsalgrd where '+
            'emp_id='''+empId.Text+''' and tryout='''+IntToStr(1)+''' ');
            open;
            if RecordCount>0 then
            begin
              empName.Text := FieldByName('emp_name').Value;
              chgDeptCob(FieldByName('dept_code').AsString);
              chgPstCob(FieldByName('pst_code').AsString);
            end
            else
            begin
              widemessagedlg(GetLangName(g_sLangStr,'msg_no_record')+' In salstru',
              mtWarning,[mbyes],1);
              exit;
            end;
          end;
      end;}
    {//銀行卡
    with QryBank do
    begin
      close;
      sql.Clear;
      sql.Add('select * from fhrd_bank_card where emp_id='''+EmpId.Text+'''');
      open;
      if not Eof then
      begin
        EditCardNo.Text:=FieldByName('card_no').AsString;
        CobBank.Text:=FieldByName('bank').AsString;
      end;
    end;}
  end;
end;

{************************************
Name: saveDataClick
Func: 保存轉正資料
Args:
    sInsStr->存儲語句
************************************}

procedure TFormfhrd303.saveDataClick(Sender: TObject);
var
  sInsStr : string;
  sDept : TStringList;
begin
{  if empId.Text='' then
  begin
    widemessagedlg(GetLangName(g_sLangStr,'msg_empid_null'),mtError,[mbyes],1);
    empId.SetFocus;
    exit;
  end;

  if baseSal.Text='' then
  begin
    widemessagedlg(GetLangName(g_sLangStr,'msg_cho_base'),mtError,[mbyes],1);
    baseSal.SetFocus;
    exit;
  end;

  if foreignSal.Text='' then
  begin
    widemessagedlg(GetLangName(g_sLangStr,'msg_cho_foreign'),mtError,[mbyes],1);
    foreignSal.SetFocus;
    exit;
  end;}

  {***檢查調升日期***}

  {
  with DMHrdsys.SQLQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select max(valid_date) as valid_date from fhrd_tranhist '+
    'where emp_id='''+empId.Text+''' ');
    open;
    if (RecordCount>0) and (not VarIsNUll(FieldByName('valid_date').Value)) then
    begin
      if tDate.Date<=
      (strToDate(FormatDateTime('yyyy/mm/dd',strToDate(FieldByName('valid_date').Value)))) then
      begin
        widemessagedlg(GetLangName(g_sLangStr,'msg_chk_tdate'),mtError,[mbyes],1);
        exit;
      end;
    end;
  end;
  }
  {if strToInt(localAmt.Text)>strToInt(totalSal.Text) then
  begin
    widemessagedlg(GetLangName(g_sLangStr,'msg_localamt_total'),mtError,[mbyes],1);
    localAmt.SetFocus;
    exit;
  end; }

{  if WideMessageDlg(GetLangName(g_sLangStr,'msg_confirm_save'),mtWarning,mbOKCancel,0) = ID_OK then
  begin
  with DMHrdsys.SQLQuery3 do
  begin
    close;
    sql.Clear;
    sql.Add('select * from fhrd_tranhist where'+
    ' emp_id='''+empId.Text+''' and '+
    'valid_date='''+DateToStr(tDate.Date)+'''');
    open;
  end;
  if DMHrdsys.SQLQuery3.RecordCount>0 then
  begin
    widemessagedlg(GetLangName(g_sLangStr,'msg_same_record'),
    mtError,[mbyes],1);
    exit;
  end
  else
  begin
    try
    saveDataQry.Connection.BeginTrans;}
    {***修改薪資結構檔***}
    //修改
{    if CheckRecordExist('select * from fhrd_salstru where emp_id='''+empId.Text+'''') then
      sInsStr := 'update fhrd_salstru set '+
        'sal_bas='''+RightStr(baseCob.Text,2)+''','+
        'sal_frn='''+RightStr(foreignCob.Text,2)+''','+
        'local_amt='''+localAmt.Text+''' '+
        'where emp_id='''+empId.Text+''''
    else//新增
      sInsStr :='insert into fhrd_salstru(upd_user,emp_id,sal_bas,sal_frn,'
       +'local_amt,tryout,t_date) values('''+username+''','
       +''''+empId.Text+''','''+RightStr(baseCob.Text,2)+''','''+RightStr(foreignCob.Text,2)+''','
       +''''+localAmt.Text+''',''1'','''+FormatDateTime('yyyy/mm/dd',tDate.Date)+''')';
}    {try
      with saveDataQry do
      begin
        close;
        sql.Clear;
        sql.Add(sInsStr);
        ExecSql;
      end;
    except
      widemessagedlg(GetLangName(g_sLangStr,'msg_updsalstru_error'),
      mtError,[mbyes],1);
    end;}

    {***新增資料到調升檔***}
    {try
      TntEdit2.Text := empId.Text;
      with DMHrdsys.SQLQuery2 do
      begin
        close;
        sql.Clear;
        sql.Add('insert into fhrd_tranhist (upd_user,valid_date,emp_id,'+
        'dept_code,dept_title,pst_code,sal_bas,base_amt,sal_frn,frn_amt,local_amt) '+
        'values (:upd_user,:valid_date,:emp_id,:dept_code,:dept_title,:pst_code,'+
        ':sal_bas,:base_amt,:sal_frn,:frn_amt,:local_amt)');
        Parameters.ParamByName('upd_user').Value:=userName;
        Parameters.ParamByName('valid_date').Value:=FormatDateTime('yyyy/mm/dd',tDate.Date);
        Parameters.ParamByName('emp_id').Value:=empId.Text;
        sDept := StrSplit(deptCob.Text,'/');
        Parameters.ParamByName('dept_code').Value:=sDept[0];
        Parameters.ParamByName('dept_title').Value:=sDept[1];
        Parameters.ParamByName('pst_code').Value:=LeftStr(pstCob.Text,2);
        Parameters.ParamByName('bas_amt').Value:=StrToFloat(baseSal.Text);
//        Parameters.ParamByName('sal_frn').Value:=RightStr(foreignCob.Text,2);
        Parameters.ParamByName('frn_amt').Value:=StrToFloat(foreignSal.Text);
        ExecSql;
      end;
    except
      widemessagedlg(GetLangName(g_sLangStr,'msg_add_error'),
      mtError,[mbyes],1);
    end;}

    {***如果部門變更，修改員工基本資料部門數據***}
    {try
      if LeftStr(deptCob.Text,6)<>empQuery.FieldValues['dept_code'] then
      begin
        with DMHrdsys.SQLQuery3 do
        begin
          close;
          sql.Clear;
          sql.Add('update fhrd_emp set dept_code='''+LeftStr(deptCob.Text,6)+''' where '+
          'emp_id='''+empId.Text+'''');
          ExecSql;
        end;
      end;
    except
      widemessagedlg(GetLangName(g_sLangStr,'msg_chg_dept'),
      mtError,[mbyes],1);
    end;}

    {***如果職務變更，修改員工基本資料職務數據***}
    {try
      if LeftStr(pstCob.Text,2)<>empQuery.FieldValues['pst_code'] then
      begin
        with DMHrdsys.SQLQuery3 do
        begin
          close;
          sql.clear;
          sql.Add('update fhrd_emp set pst_code='''+LeftStr(pstCob.Text,2)+''' where '+
          'emp_id='''+empId.Text+'''');
          ExecSql;
        end;
      end;
    except
      widemessagedlg(GetLangName(g_sLangStr,'msg_chg_position'),
      mtError,[mbyes],1);
    end;}

    {***修改銀行卡***}
      {if (EditCardNo.Text<>QryBank.FieldValues['card_no']) or (CobBank.Text<>QryBank.FieldValues['bank']) then
      begin
        QryBank.Edit;
        QryBank.FieldValues['emp_id'] := trim(empId.Text);
        QryBank.FieldValues['card_no']:=trim(EditCardNo.Text);
        QryBank.FieldValues['bank']:=trim(CobBank.Text);
        QryBank.UpdateBatch();
      end;

    saveDataQry.Connection.CommitTrans;
    except
      saveDataQry.Connection.RollbackTrans;
      exit;
    end;
    if empQuery.Active then
      empQuery.Active := false;
    if rapQuery.Active then
      rapQuery.Active := false;

    empQuery.Active := true;
    rapQuery.Active := true;

    empQuery.Locate('emp_id',TntEdit2.Text,[loCaseInsensitive]);
  end;
  end;}
end;

procedure TFormfhrd303.TntDBGrid1TitleClick(Column: TColumn);
begin
  DBGridSortByTitle(Column);
end;

procedure TFormfhrd303.TntBitBtn1Click(Sender: TObject);
begin
  empId.Text := FindEmpId('emp_id');
end;

procedure TFormfhrd303.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= caFree;
end;

procedure TFormfhrd303.empQueryCalcFields(DataSet: TDataSet);
var
  tot_sal:double;
  key,sqlstr:string;
begin
  with DataSet do
  begin
    if FieldByName('pst_code').AsString <='14' then //2011-12-07 hyt upd 18==>14
       begin
         tot_sal:=FieldByName('base_amt').AsFloat+FieldByName('frn_amt').AsFloat
                 +FieldByName('faward_amt').AsFloat+FieldByName('over_amt').AsFloat;
                  FieldByName('tot_sal').AsFloat:=tot_sal;
       end
    else
        begin
         tot_sal:=FieldByName('base_amt').AsFloat+FieldByName('frn_amt').AsFloat
                 +FieldByName('faward_amt').AsFloat ;
                  FieldByName('tot_sal').AsFloat:=tot_sal;
       end;
    key:=FieldByName('emp_id').AsString;
  end;
  sqlstr:='select * from fhrd_emp where emp_id='''+key+'''';
  with DMHrdsys.SQLQuery2 do
  begin
    close;
    sql.Clear;
    sql.Add(sqlstr);
    open;
    if not Eof then
    begin
      DataSet.FieldByName('emp_name').AsString:=FieldByName('emp_name').AsString;
      DataSet.FieldByName('epindt').AsString:=FieldByName('emp_etdt').AsString;
    end;
  end;
end;

procedure TFormfhrd303.bbtn_SaveClick(Sender: TObject);
var
  cur_date, max_date,this_date:TDateTime;
  sqlstr,upd_date,PstCode,DeptCode, cldate, currcate :string;
begin
  if ( RMB.Checked = false ) and (USD.Checked = false ) then
  begin
    WideShowMessage('請選擇計算幣別,不能保存');
    exit;
  end;
  if ( RMB.Checked = true ) then
     currcate := 'RMB'
  else
     currcate := 'USD' ;
  cldate := datetostr( date )  ;
 // if ( ( cldate > '2007/07/17')  and  ( cldate < '2007/07/21') ) then
 // begin
  can_save:=true;
  if not can_save then
  begin
    WideShowMessage('前面輸入有誤,不能保存');
    exit;
  end;
  if wideMessageDlg(GetLangName(g_sLangStr,'msg_confirm_save'),mtConfirmation,[mbyes,mbno],0)=mrno then
    exit;
  upd_date:=FormatDateTime('yyyy/mm/dd hh:nn:ss',GetServerDateTime);
  DeptCode:=empQuery.FieldByName('dept_code').AsString;
  PstCode:=empQuery.FieldByName('pst_code').AsString;
  DMHrdsys.conn.BeginTrans;//開始保存事務
  empQuery.UpdateBatch();//保存薪資紀錄檔
  max_date:=0;
  with empQuery do//判斷是否為最近一筆調薪紀錄
  begin
    this_date:=DateOf(FieldByName('valid_date').AsDateTime);
    //aEmpId:=FieldByName('emp_id').AsString;
    First;
    while not Eof do
    begin
      max_date:=max(max_date,DateOf(FieldByName('valid_date').AsDateTime));
      Next;
    end;
    First;
  end;
  //if this_date>=max_date then
  //begin//最新一次紀錄修改
  //保存薪資結構檔
    sqlstr:='delete from fhrd_salstru where emp_id='''+aEmpId+''';';
    sqlstr:=sqlstr+'insert into fhrd_salstru select upd_user,upd_date,emp_id,'
      +'valid_date,tryout,base_amt,frn_amt,faward_amt,over_amt,local_amt,'
      +'sal_bas,sal_frn,curr_cate from fhrd_tranhist where emp_id='''+aEmpId+''''
      +' and valid_date='''+FormatDateTime('yyyy/mm/dd',max_date)+'''';
    with DMHrdsys.ADOCommand1 do
    begin
      CommandText:=sqlstr;
      Execute;
    end;
  //保存工號檔
    sqlstr:='update fhrd_emp set upd_date='''+upd_date+''',pst_code='''+PstCode+''','
      +'dept_code='''+DeptCode+''' where emp_id='''+aEmpId+'''';
    with DMHrdsys.ADOCommand1 do
    begin
      CommandText:=sqlstr;
      Execute;
    end;
  //end;
  DMHrdsys.conn.CommitTrans;//結束保存事務
 // end;
  //else
  //  widemessagedlg('Sorry , You are not Right !!!',mtError,[mbyes],1);


end;

procedure TFormfhrd303.empQueryAfterEdit(DataSet: TDataSet);
begin
  bbtn_Save.Enabled:=true;
end;

procedure TFormfhrd303.empQueryAfterInsert(DataSet: TDataSet);
begin
  bbtn_Save.Enabled:=true;
  with DataSet do
  begin
    Edit;
    FieldByName('emp_id').AsString:=aEmpId;
    FieldByName('pst_code').AsString:=LeftStr(PstCob.Text,2);
    FieldByName('dept_code').AsString:=LeftStr(DeptCob.Text,6);
    FieldByName('valid_date').AsDateTime:=StartOfTheMonth(Date);
    FieldByName('tryout').AsString:='2';
    if LeftStr(PstCob.Text,2) <= '14'  then //2011-12-07 hyt upd 18==>14
       FieldByName('over_amt').AsFloat:=25 ;
   
    FieldByName('faward_amt').AsFloat:=5;
    FieldByName('local_amt').AsFloat:=100;
  end;
end;

procedure TFormfhrd303.empQueryBeforePost(DataSet: TDataSet);
begin
  with DataSet do
  begin
    Edit;
    FieldByName('upd_user').AsString:=username;
    FieldByName('upd_date').AsDateTime:=GetServerDateTime;
  end;
end;

procedure TFormfhrd303.tDateChange(Sender: TObject);
//改變日期
begin
  if DateOf(empQuery.FieldByName('valid_date').AsDateTime)=DateOf(tDate.Date) then
    exit;//未改變
  if wideMessageDlg(GetLangName(g_sLangStr,'msg_is_add_saltran'),mtConfirmation,[mbyes,mbno],0)=mryes then
  begin//新增
    with empQuery do
    begin
      Append;
      //FieldByName('emp_id').AsString:=aEmpId;
      FieldByName('valid_date').AsDateTime:=DateOf(tDate.Date);
    end;
  end
  else
  begin//修改
    with empQuery do
    begin
      Edit;
      FieldByName('valid_date').AsDateTime:=DateOf(tDate.Date);
    end;
  end;
end;

procedure TFormfhrd303.pstCobChange(Sender: TObject);
//改變職稱
var
  currcate, sqlstr,pstcode,istry, paymon :string;
begin
  paymon := formatDatetime('yyyymm', tDate.Date ) ;
   if ( RMB.Checked = true ) then
     currcate := 'RMB'
  else
     currcate := 'USD' ;
  pstCode:=LeftStr(pstCob.Text,2);
  istry:=LeftStr(istryCob.Text,1);
  with EmpQuery do
  begin
    Edit;
    FieldByName('pst_code').AsString:=pstCode;
    FieldByName('tryout').AsString:=istry;
    if pstcode <='14'  then //2011-12-07 hyt upd 18==>14
       FieldByName('over_amt').AsFloat :=25
    else
       FieldByName('over_amt').Value  :=null;
  end;
  sqlstr:='select * from fhrd_salgrd where pst_code='''+pstcode+''' and grade=''0'+istry+'''  and curr_cate ='''+ currcate +'''';
  with DMHrdsys.SQLQuery3 do
  begin
    close;
    sql.Clear;
    sql.Add(sqlstr);
    open;
    while not Eof do
    begin
      if FieldByName('item_id').AsString='01' then
        EmpQuery.FieldByName('base_amt').AsFloat:=FieldByName('amount').AsFloat;
      if FieldByName('item_id').AsString='02' then
        EmpQuery.FieldByName('frn_amt').AsFloat:=FieldByName('amount').AsFloat;
      Next;
    end;
  end;
end;

procedure TFormfhrd303.deptCobChange(Sender: TObject);
//改變部門
var
  deptstr:Tstrings;
begin
  deptstr:=strsplit(trim(deptcob.Text),' ');
  with EmpQuery do
  begin
    Edit;
    FieldByName('dept_code').AsString:=deptstr.Strings[0];
    FieldByName('dept_title').AsString:=deptstr.Strings[1];
  end;
end;



procedure TFormfhrd303.FormShow(Sender: TObject);
//var
  //cldate :string ;
begin
 //  cldate := datetostr( date )  ;
  //if ( ( cldate < '2007/07/17')  or  ( cldate > '2007/07/21') ) then
  //   begin
   //     baseSal.ReadOnly := true;
   //     foreignSal.ReadOnly := true ;
   //  end;

end;

end.



