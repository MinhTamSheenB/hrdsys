{*************************************************************************
Name：dut15(部門出勤統計表)
Author: Leo
Create date:2005-10-07
Modify date:2005-10-??
Commentate:部門出勤統計表
*************************************************************************}
unit UnitDut15;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, TntDbCtrls, ExtCtrls, Grids, DBGrids, TntDBGrids,
  StdCtrls, Buttons, TntButtons, TntStdCtrls, TntExtCtrls, ComCtrls,DateUtils,
  TntComCtrls,WSDLIntf,QRPrntr, DB, ADODB,TntDialogs,strutils, TntDB,Qt, QuickRpt,
  DBClient,QRCtrls,QRExport;
type
  TArrData=array [1..27] of double;
type
  TFormDut15 = class(TForm)
    Panel1: TPanel;
    PanelTitle: TTntPanel;
    PanelMain: TPanel;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    TntGroupBox1: TTntGroupBox;
    dtp_begin: TTntDateTimePicker;
    dtp_end: TTntDateTimePicker;
    CobDeptBegin: TTntComboBox;
    CobDeptEnd: TTntComboBox;
    TntLabel1: TTntLabel;
    TntLabel2: TTntLabel;
    TntDBGrid1: TTntDBGrid;
    ADOQuery2: TADOQuery;
    bb_reset: TTntBitBtn;
    bb_ok: TTntBitBtn;
    ClientDataSet1: TClientDataSet;
    ADOQuery3: TADOQuery;
    Btn_preview: TTntBitBtn;
    Btn_Print: TTntBitBtn;
    ClientDataSet2: TClientDataSet;
    ClientDataSet2dept_code: TStringField;
    ClientDataSet2abbr_titl: TWideStringField;
    ClientDataSet2renci: TWideStringField;
    ClientDataSet2late: TWideStringField;
    ClientDataSet2early: TWideStringField;
    ClientDataSet2absentwork: TWideStringField;
    ClientDataSet2gtrip: TWideStringField;
    ClientDataSet2gleave: TWideStringField;
    ClientDataSet2inhospital: TWideStringField;
    ClientDataSet2sickleave: TWideStringField;
    ClientDataSet2maternityleave: TWideStringField;
    ClientDataSet2affairleave: TWideStringField;
    ClientDataSet2weddingleave: TWideStringField;
    ClientDataSet2funeralleave: TWideStringField;
    ClientDataSet2injureleave: TWideStringField;
    ClientDataSet2generalhols: TWideStringField;
    ClientDataSet2dayshift: TWideStringField;
    ClientDataSet2middleshift: TWideStringField;
    ClientDataSet2nightshift: TWideStringField;
    ClientDataSet2stopwork: TWideStringField;
    ClientDataSet2dayovertime: TWideStringField;
    ClientDataSet2nightovertime: TWideStringField;
    ClientDataSet2wholeovertime: TWideStringField;
    ClientDataSet2followovertime: TWideStringField;
    ClientDataSet2ordainovertime: TWideStringField;
    ClientDataSet2feasthols: TWideStringField;
    ClientDataSet2normalotime: TWideStringField;
    ClientDataSet2ordainotime: TWideStringField;
    ClientDataSet2feastotime: TWideStringField;
    ClientDataSet2total: TWideStringField;
    PrintDialog1: TPrintDialog;
    SaveDialog1: TSaveDialog;
    ClientDataSet1dept_code: TStringField;
    ClientDataSet1abbr_titl: TWideStringField;
    ClientDataSet1renci: TWideStringField;
    ClientDataSet1late: TWideStringField;
    ClientDataSet1early: TWideStringField;
    ClientDataSet1absentwork: TWideStringField;
    ClientDataSet1gtrip: TWideStringField;
    ClientDataSet1gleave: TWideStringField;
    ClientDataSet1inhospital: TWideStringField;
    ClientDataSet1sickleave: TWideStringField;
    ClientDataSet1maternityleave: TWideStringField;
    ClientDataSet1affairleave: TWideStringField;
    ClientDataSet1weddingleave: TWideStringField;
    ClientDataSet1funeralleave: TWideStringField;
    ClientDataSet1injureleave: TWideStringField;
    ClientDataSet1generalhols: TWideStringField;
    ClientDataSet1dayshift: TWideStringField;
    ClientDataSet1middleshift: TWideStringField;
    ClientDataSet1nightshift: TWideStringField;
    ClientDataSet1stopwork: TWideStringField;
    ClientDataSet1dayovertime: TWideStringField;
    ClientDataSet1nightovertime: TWideStringField;
    ClientDataSet1wholeovertime: TWideStringField;
    ClientDataSet1followovertime: TWideStringField;
    ClientDataSet1ordainovertime: TWideStringField;
    ClientDataSet1feasthols: TWideStringField;
    ClientDataSet1normalotime: TWideStringField;
    ClientDataSet1ordainotime: TWideStringField;
    ClientDataSet1feastotime: TWideStringField;
    ClientDataSet1total: TWideStringField;
    ClientDataSet1dept: TStringField;
    cob_range: TTntComboBox;
    //my define
    procedure InitLang;
    procedure InitForm;
    procedure DealADept(DeptCode,DeptTitle:WideString);
    function  GetData(DeptCode:widestring;BeginDate,EndDate:TDate):TArrData;
    procedure AddArr(var DataArr:TArrData;TempArr:TArrData;IsInit:boolean=true);
    procedure AddToDataSet(DeptCode,DeptTitle:widestring;DataArr:TArrData);
    procedure SetTitleAndColumn;
    procedure ClearOldQR;
    procedure AddMiniTotal(SourceDataSet,ObjectDataSet:TCustomADODataset);
    //auto general
    procedure FormCreate(Sender: TObject);
    procedure CobDeptEndSelect(Sender: TObject);
    procedure bb_okClick(Sender: TObject);
    procedure bb_resetClick(Sender: TObject);
    procedure Btn_previewClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDut15: TFormDut15;

implementation
uses
  UnitHrdUtils,unitDMHrdsys,UnitPrtDut15;//, UnitDut32;
var
  Langstr:TWideStrings;//語言字符串
  pri_arr:TPrvArr;//權限數組
{$R *.dfm}

procedure TFormDut15.InitLang;
{*************************************************************************
TO DO:初始化語言
*************************************************************************}
var
  keys:String;
begin
  keys:='hours,explain,times,men/day,msg_date_e_great_b,input_dept_error,'+
      'dut15_hint1,month,while_collect_print_data,preview,finish,msg_if_print_now,'+
      'print_finish,while_tabling,complete_table,stat_date,table_date,dept_range,'+
      'class_subtotal,factory_subtotal,sumtotal';
  LangStr:=GetLangWideStrs(keys);
  SetComponentLang(self);
end;                        

procedure TFormDut15.InitForm;
{*************************************************************************
TO DO:初始化Form
*************************************************************************}
var
  sql_str,fld_name:string;
  i:integer;
begin
{  if userLang='E' then
    fld_name:='dept_code+'' ''+eng_abbr'
  else if userLang='V' then
    fld_name:='dept_code+'' ''+vim_abbr'
  else
    fld_name:='dept_code+'' ''+abbr_titl';
  sql_str:='select '+fld_name+' as dept_name,dept_code from hrd_dept';
  SetComboxList(sql_str,CobDeptBegin);
  SetComboxList(sql_str,CobDeptEnd);}
  GetDeptRange(CobDeptBegin);
  GetDeptRange(CobDeptEnd);
  dtp_begin.Date:=GetServerDateTime;
  dtp_End.Date:=dtp_begin.Date;
{  with adoquery2  do
  begin
    sql.Clear;
    sql.Add('select * from hrd_dut_class');
  end;  }
  Application.CreateForm(TFormPrtDut15, FormPrtDut15);
  with FormPrtDut15 do
  begin
    QRLabel1.Caption :=GetLangName(LangStr,'explain');//'說明';  
    QRLabel2.Caption :=GetLangName(LangStr,'men/day');//  '人/日'
    QRLabel3.Caption :=GetLangName(LangStr,'times');//'次數'; 
    QRLabel4.Caption :=GetLangName(LangStr,'times');//'次數';  
    QRLabel5.Caption :=GetLangName(LangStr,'hours');//'小時'; 
  end;
end;

procedure TFormDut15.FormCreate(Sender: TObject);
begin
  pri_arr:=GetPrvArr(username,'dut15');
  InitLang;// Init language
  InitForm;// Init Form
end;

procedure TFormDut15.CobDeptEndSelect(Sender: TObject);
begin
  if CobDeptEnd.Text<CobDeptBegin.Text then
    CobDeptEnd.ItemIndex := CobDeptBegin.ItemIndex
end;

procedure TFormDut15.bb_okClick(Sender: TObject);
begin
  if (CobDeptBegin.Text='') or (CobDeptEnd.Text='') or (CobDeptBegin.Text>CobDeptEnd.Text) then
  begin
    wideshowmessage(GetLangName(LangStr,'input_dept_error'));// '部門範圍輸入有誤'
    exit;
  end;
  if dtp_begin.Date-dtp_end.Date>0 then
  begin
    wideshowmessage(GetLangName(LangStr,'msg_date_e_great_b'));// 日期範圍輸入有誤
    exit;
  end;
  ClientDataSet1.Close;
  ClientDataSet1.CreateDataSet;
  ClientDataSet1.Active := true;
  with adoquery1 do
  begin
    sql.Clear;
    sql.Add('select * from hrd_dept where dept_code>='''+leftstr(CobDeptBegin.Text,6)+''' and dept_code<='''+leftstr(CobDeptEnd.Text,6)+''' order by dept_code');
    Open;
    SetProcessBar(true,1,RecordCount);
    while not eof do
    begin
      SetProcessBar(false,1);
      //處理單個部門資料
      DealADept(fieldbyname('dept_code').Value,fieldbyname('dept_titl').Value);
      next;
    end;
  end;
  bb_reset.Enabled := true;
  btn_print.Enabled := true;
  btn_preview.Enabled := true;
end;

procedure Tformdut15.DealADept(DeptCode,DeptTitle:WideString);
//處理單個部門資料
var
  MonCount,i,year,month:integer;
  CountP:real;
  DataArr,TempArr :TArrData;
  { 人次數  遲到    早退    曠工
    公出    公假    駐院    病假    產假    事假    婚假
    喪假    公傷    公休    日班    中班    晚班
    停工    日加    晚加    通加    連班    固加
    節假    平超    固超    節超     }
  BeginDate,EndDate:TDate;
begin
  MonCount := 12*(YearOf(dtp_end.Date)-YearOf(dtp_begin.Date))+ MonthOf(dtp_end.Date)-MonthOf(dtp_begin.Date)+1;
  AddArr(DataArr,TempArr,true);
  for i:=1 to MonCount do //跨月份操作
  begin
    if i=1 then
      BeginDate := dtp_begin.Date
    else
    begin
      month:= MonthOf(dtp_begin.Date)+i-1;
      year := YearOf(dtp_begin.Date);
      if (month mod 12) = 0 then
      begin
        year := year+ (month div 12)-1;
        month := 12;
      end
      else
      begin
        year := year+ (month div 12);
        month := (month mod 12);
      end;
      BeginDate := EncodeDate(year,month,1);
    end;
    if i=MonCount then
      EndDate := dtp_end.Date
    else
    begin
      month:= MonthOf(dtp_begin.Date)+i-1;
      year := YearOf(dtp_begin.Date);
      if (month mod 12) = 0 then
      begin
        year := year+ month div 12-1;
        month := 12;
      end
      else
      begin
        year := year+ month div 12;
        month := month mod 12;
      end;
      EndDate := EncodeDate(year,month,DaysInAMonth(year,month));
    end;      // '當前處理部門'       月份
    SetStatusText(GetLangName(LangStr,'dut15_hint1')+DeptCode+' '+DeptTitle+' '
          +GetLangName(LangStr,'month')+inttostr(year)+'/'+inttostr(month));
    //取得單部門一個月份的相關資料
    TempArr := GetData(DeptCode,BeginDate,EndDate);
    AddArr(DataArr,TempArr,false);
  end;
  AddToDataSet(DeptCode,DeptTitle,DataArr);
end;

procedure TFormDut15.bb_resetClick(Sender: TObject);
begin
  //formdut32.show;
  bb_ok.Enabled := true;
  clientDataset1.Close;
  bb_reset.Enabled := false;
  btn_print.Enabled := false;
  btn_preview.Enabled := false;
end;

function  TformDut15.GetData(DeptCode:widestring;BeginDate,EndDate:TDate):TArrData;
var
  i,j,ClassCode,bDay,eDay,hours:integer;
  sqlstr,amonth:string;
begin
  for i:=1 to 26 do
    result[i] :=0;
  amonth:=formatDateTime('yyyymm',BeginDate);
  bDay:=dayof(BeginDate);
  eDay:=dayof(EndDate);
  with adoquery2 do
  begin

    if cob_range.ItemIndex=0 then   //2010-02-05 hyt upd
      SqlStr:='select * from hrd_dut_mon where dut_mon='''+amonth+''' and emp_id in '+
       '(select emp_id from hrd_emp where dept_code='''+leftstr(DeptCode,6)+''' and left(pst_code,1)=''6'' and clas_code<>''@@'')'
    else if cob_range.ItemIndex=1 then
      SqlStr:='select * from hrd_dut_mon where dut_mon='''+amonth+''' and emp_id in '+
       '(select emp_id from hrd_emp where dept_code='''+leftstr(DeptCode,6)+''' and pst_code<>''60''and clas_code<>''@@'')'
    else if cob_range.ItemIndex=3 then   //2010-02-05 hyt add
      SqlStr:='select * from hrd_dut_mon where dut_mon='''+amonth+''' and emp_id in '+
       '(select emp_id from hrd_emp where dept_code='''+leftstr(DeptCode,6)+''' and pst_code=''60'' and clas_code<>''@@'')'
    else if cob_range.ItemIndex=4 then   //2010-02-05 hyt add
      SqlStr:='select * from hrd_dut_mon where dut_mon='''+amonth+''' and emp_id in '+
       '(select emp_id from hrd_emp where dept_code='''+leftstr(DeptCode,6)+''' and pst_code=''61'' and clas_code<>''@@'')'
    else if cob_range.ItemIndex=5 then   //2010-02-05 hyt add
      SqlStr:='select * from hrd_dut_mon where dut_mon='''+amonth+''' and emp_id in '+
       '(select emp_id from hrd_emp where dept_code='''+leftstr(DeptCode,6)+''' and pst_code=''62'' and clas_code<>''@@'')'
    else if cob_range.ItemIndex=6 then   //2010-02-05 hyt add
      SqlStr:='select * from hrd_dut_mon where dut_mon='''+amonth+''' and emp_id in '+
       '(select emp_id from hrd_emp where dept_code='''+leftstr(DeptCode,6)+''' and pst_code=''63'' and clas_code<>''@@'')'   
    else
      SqlStr:='select * from hrd_dut_mon where dut_mon='''+amonth+''' and emp_id in '+
       '(select emp_id from hrd_emp where dept_code='''+leftstr(DeptCode,6)+''' and clas_code<>''@@'')';
    if false then //if Checktempuser(username)  = false  then
     begin
       SqlStr:=SqlStr + ' and  not exists( select *from hrd_deny_emp where emp_id=hrd_dut_mon.emp_id ) '
     end;
    Sql.Clear;
    Sql.Add(SqlStr);
    open;
    while not eof do
    begin
      try
        if leftStr(fieldbyname('clas_code').AsString,1)='A'  then
          ClassCode:=62
        else
          ClassCode:=StrToInt(fieldbyname('clas_code').AsString);
      except //2009-08-20 hyt upd    for 'A4'
        next;
        continue;
      end;
      for j:=bDay to eDay do
      begin
        if ( fieldbyname('day'+format('%.2d',[j])).AsString<>'' ) and ( fieldbyname('day'+format('%.2d',[j])).AsVariant<>NULL )  then
        begin
          hours:=fieldbyname('day'+format('%.2d',[j])).AsInteger;
          case ClassCode of
             4..15:result[ClassCode-3]:=result[ClassCode-3]+(hours div 100)+(hours mod 100)/60;
            60..69:result[ClassCode-47]:=result[ClassCode-47]+(hours div 100)+(hours mod 100)/60;
                21:result[8]:=result[8]+(hours div 100)+(hours mod 100)/60;
                72:result[23]:=result[23]+(hours div 100)+(hours mod 100)/60;
                80:result[24]:=result[24]+(hours div 100)+(hours mod 100)/60;
                82:result[25]:=result[25]+(hours div 100)+(hours mod 100)/60;
                85:result[26]:=result[26]+(hours div 100)+(hours mod 100)/60;
          end;
        end;
      end;
      next;
    end;
   { sqlstr := 'select * from sysobjects where xtype=''U '' and name=''hrd_dut_wrk'+
      formatdatetime('yymm',BeginDate)+''' ';
    sql.Clear;
    sql.Add(sqlstr);
    open;
    if eof then
      exit;
    Close;
    sql.Clear;
    sqlstr:= 'select dept_code ';
    for i:=4 to 15 do
    begin     
      sqlstr := sqlstr+ ',sum(class'+format('%.2d',[i])+')';
    end;
    for i:=60 to 69 do
    begin
      sqlstr := sqlstr+ ',sum(class'+inttostr(i)+')';
    end;
    sqlstr := sqlstr+ ',sum(class72)';
    sqlstr := sqlstr+ ',sum(class80)';
    sqlstr := sqlstr+ ',sum(class82)';
    sqlstr := sqlstr+ ',sum(class85)';
    sqlstr := sqlstr+' from hrd_dut_wrk'+formatdatetime('yymm',BeginDate)+' where dept_code='''+DeptCode+''' and work_date>='''+datetostr(BeginDate)+''' and work_date<='''+datetostr(EndDate)+'''  group by dept_code';
    sql.Add(sqlstr);
    Open;
    if not eof then
    begin
      for i:= 1 to 26 do
        result[i]:= fields[i].AsInteger;
    end; }
  end;
end;

procedure TformDut15.AddArr(var DataArr:TArrData;TempArr:TArrData;IsInit:boolean=true);
var
  i:integer;
begin
  //
  if IsInit then
  begin
    for i:=0 to 26 do
       DataArr[i]:=0;
  end
  else
  begin
    for i:=0 to 26 do
       DataArr[i]:=strtofloat(format('%5.2f',[DataArr[i]+TempArr[i]]));
  end;
end;

procedure Tformdut15.AddToDataSet(DeptCode,DeptTitle:widestring;DataArr:TArrData);
var
  i:integer;
  Total:double;
  numP:double;
  //RecData:Array of Tvarrec;
begin
  with ClientDataSet1 do
  begin
    numP:= (DataArr[13]+DataArr[14]+DataArr[15])/8.0;
    Total:= DataArr[3];
    for i:=14 to 26 do
      Total := Total+DataArr[i];
    //InsertRecord([DeptCode,DeptTitle,numP,DataArr[1],DataArr[2],DataArr[3],DataArr[4],DataArr[5],DataArr[6],DataArr[7],DataArr[8],DataArr[9],DataArr[10],DataArr[11],DataArr[12],DataArr[13],DataArr[14],DataArr[15],DataArr[16],DataArr[17],DataArr[18],DataArr[19],DataArr[20],DataArr[21],DataArr[22],DataArr[23],DataArr[24],DataArr[25],DataArr[26],Total]);
    Append;
    for i:=0 to 30 do
    begin
      if i=0 then
        fields[0].Value:= DeptCode;
      if i=1 then
        fields[1].Value:= DeptTitle;
      if i=2 then
        fields[2].AsFloat:= numP;
      if (i>2) and (i<29)  then
      begin
        edit;
        fields[i].AsFloat := DataArr[i-2];
      end;
      if i=29 then
        fields[i].AsFloat := Total;
      if i=30 then
      begin
        if leftstr(DeptCode,2)<'VA'then
          fields[i].AsString := leftStr(DeptCode,4)
        else
          fields[i].AsString := leftStr(DeptCode,2);
      end;
    end;
  end;
  //
end;
procedure TFormDut15.Btn_previewClick(Sender: TObject);
var
  FileExt,tmpFileName:string;
begin
  ClientDataSet2.Close;
  ClientDataSet2.CreateDataSet;
  ClientDataSet2.Active := true;
  SetStatusText(GetLangName(LangStr,'while_collect_print_data'));//正在收集打印資料！
  AddMiniTotal(TCustomADODataset(ClientDataSet1),TCustomADODataset(ClientDataSet2));
  //ShowPrint(TCustomADODataset(ClientDataSet2),'aaa');
  ClearOldQR;
  SetTitleAndColumn;
  if TtntBitBtn(sender).Name = 'Btn_preview' then
  begin
    FormPrtDut15.QuickRep1.Preview;
    SetStatusText(GetLangName(LangStr,'preview')+GetLangName(LangStr,'finish'));//預覽完成
  end
  else
  begin     //'要直接打印嗎？'
    if wideMessageDlg(GetLangName(LangStr,'msg_if_print_now'),mtConfirmation,[mbYes, mbNo],0) = mrYes then
    begin
      if PrintDialog1.Execute then
      begin
        FormPrtDut15.QuickRep1.Print;
        SetStatusText(GetLangName(LangStr,'print_finish'));// '打印完成'
       end;
    end
    else
    begin
      if SaveDialog1.Execute then
      begin
      FileExt := AnsiLowerCase(ExtractFileExt(SaveDialog1.FileName));
      tmpFileName:=SaveDialog1.FileName;
      with FormPrtDut15.QuickRep1 do
        case SaveDialog1.FilterIndex of
          1:begin
              if FileExt<>'.xls' then
                tmpFileName:=SaveDialog1.FileName+'.xls';
              ExportToFilter(TQRXLSFILTER.Create(tmpFileName));
            end;
          2:begin
              if FileExt<>'.txt' then
                tmpFileName:=SaveDialog1.FileName+'.txt';
              ExportToFilter(TQRAsciiExportFilter.Create(tmpFileName));
            end;
          3:begin
              if FileExt<>'.html' then
                tmpFileName:=SaveDialog1.FileName+'.html';
              ExportToFilter(TQRHTMLDocumentFilter.Create(tmpFileName));
            end;
          4:begin
              if FileExt<>'.csv' then
                tmpFileName:=SaveDialog1.FileName+'.csv';
             ExportToFilter(TQRCommaSeparatedFilter.Create(tmpFileName));
            end;
          5:begin
              if FileExt<>'.qrp' then
                 tmpFileName:=SaveDialog1.FileName+'.qrp';
              Printer.Save(tmpFileName);
            end;
      end;
      end;
    end;
  end;
end;

procedure TFormDut15.SetTitleAndColumn;
var
  TmpFldTitle:TQRLabel;
  TmpFld:TQRDBText;//TQRLabel;
  i,j,FldWidth,leftpos:integer;
begin
  SetStatusText(GetLangName(LangStr,'while_tabling')); //      '正在產生報表'
  with FormPrtDut15 do
  begin
    QuickRep1.Width := 780;
    QuickRep1.PreviewWidth :=900;
    PageHeaderBand1.Width :=QuickRep1.Width;
    qrlb_title1.Width :=PageHeaderBand1.Width;
    qrlb_title2.Width :=PageHeaderBand1.Width;
                                                                       
    qrlb_deptrange.Caption := GetLangName(LangStr,'dept_range')+':'+CobDeptBegin.Text+'~'+CobDeptEnd.Text; //部門範圍
    qrlb_table_date.Caption := GetLangName(LangStr,'table_date')+':'+datetimetostr(GetServerDateTime);//制表日期
    qrlb_statistic.Caption := GetLangName(LangStr,'stat_date')+':'+datetostr(dtp_begin.date)+'~'+datetostr(dtp_end.date); //'統計日期
    leftpos:=0;
    for i:=0 to ClientDataset2.FieldCount-1 do
    begin
      TmpFldTitle:=TQRLabel.Create(FormPrtDut15.ColumnHeaderBand1);
      TmpFldTitle.Parent:=FormPrtDut15.ColumnHeaderBand1;
      TmpFldTitle.Name:='QRFld_'+ClientDataSet2.Fields[i].FieldName;
      TmpFldTitle.Caption:=TntDBGrid1.Columns.Items[i].title.caption;
      TmpFldTitle.left:=leftpos;
      TmpFldTitle.top:=0;
      TmpFldTitle.Height:=18;
      //創建數據
      TmpFld:=TQRDBText.Create(FormPrtDut15.DetailBand1);
      TmpFld.Parent:=FormPrtDut15.DetailBand1;
      TmpFld.Name:='QRDB_'+ClientDataSet2.Fields[i].FieldName;
      TmpFld.DataSet:=FormPrtDut15.QuickRep1.DataSet;
      TmpFld.DataField:=TmpFld.DataSet.fields[i].FieldName;
      TmpFld.top:=0;
      TmpFld.left:=leftpos;
     // TmpFld.Width := 40;
      TmpFld.Height :=16;
      //欄位寬度設置
      FldWidth:= TntDBGrid1.Columns[i].Width;
      leftpos:=leftpos+FldWidth;
    end;
  end;
  SetStatusText(GetLangName(LangStr,'complete_table'));//報表產生完成!
end;

procedure TFormDut15.ClearOldQR;
var
  TmpFldTitle:TQRLabel;
  TmpFld:TQRDBText;//:TQRLabel;
  i:integer;
begin
  //清除原有欄位
  for i:=0 to ClientDataset2.FieldCount-1 do
  begin 
    TmpFldTitle:=TQRLabel(FormPrtDut15.ColumnHeaderBand1.FindComponent('QRFld_'+ClientDataSet2.Fields[i].FieldName));
    if TmpFldTitle<>nil then
      TmpFldTitle.Free;

      TmpFld:=TQRDBText(FormPrtDut15.DetailBand1.FindComponent('QRDB_'+ClientDataSet2.Fields[i].FieldName));
      if TmpFld<>nil then
        TmpFld.Free;

  end;
end;

procedure TformDut15.AddMiniTotal(SourceDataSet,ObjectDataSet:TCustomADODataset);
var
  MiniTotal,AllTotal:TArrData;
  PreDeptCode:String;
  i:integer;
begin
  with SourceDataSet do
  begin
    SetProcessBar(true,1,recordcount);
    first;
    PreDeptCode := fieldbyname('dept').Value;
    while not eof do
    begin
      SetProcessBar(false,1);
      if PreDeptCode=fieldbyname('dept').Value then
      begin
        ObjectDataSet.Append;
        for i:=0 to FieldCount-2 do
        begin
          ObjectDataSet.Fields[i].AsString := Fields[i].AsString;
          if (i>2)and(i<FieldCount-1) then
          begin
            MiniTotal[i-2]:=MiniTotal[i-2]+Fields[i].Asfloat;
            AllTotal[i-2]:=AllTotal[i-2]+Fields[i].Asfloat;
          end;
        end;
      end
      else
      begin
        ObjectDataSet.Append;
        if length(trim(PreDeptCode))=2 then
          ObjectDataSet.Fields[1].Value := GetLangName(LangStr,'factory_subtotal')//'廠級小計:'
        else
          ObjectDataSet.Fields[1].Value := GetLangName(LangStr,'class_subtotal');//'課級小計:';
        ObjectDataSet.Fields[2].Value := (MiniTotal[13]+MiniTotal[14]+MiniTotal[15])/8.0;
        for i:=3 to FieldCount-2 do
        begin
          ObjectDataSet.Fields[i].Value := MiniTotal[i-2];
        end;
        PreDeptCode:=fieldbyname('dept').Value;

        ObjectDataSet.Append;
        ObjectDataSet.FieldByname('dept_code').Value := '   ';
        ObjectDataSet.FieldByname('abbr_titl').Value := '   ';

        ObjectDataSet.Append;
        for i:=0 to FieldCount-2 do
        begin
          ObjectDataSet.Fields[i].AsString := Fields[i].AsString;
          if (i>2)and(i<FieldCount-1) then
          begin
            MiniTotal[i-2]:=Fields[i].AsFloat;
            AllTotal[i-2]:=AllTotal[i-2]+Fields[i].AsFloat;
          end;
        end;
      end;
      next;
    end;

    ObjectDataSet.Append;
    if length(trim(PreDeptCode))=2 then
      ObjectDataSet.Fields[1].Value := GetLangName(LangStr,'factory_subtotal')//'廠級小計:'
    else
      ObjectDataSet.Fields[1].Value := GetLangName(LangStr,'class_subtotal');// '課級小計:';
    ObjectDataSet.Fields[2].Value := (MiniTotal[13]+MiniTotal[14]+MiniTotal[15])/8.0;
    for i:=3 to FieldCount-2 do
    begin
      ObjectDataSet.Fields[i].AsFloat := MiniTotal[i-2];
    end;
    PreDeptCode:=fieldbyname('dept').Value;
    
    ObjectDataSet.Append;
    ObjectDataSet.FieldByname('dept_code').Value := '   ';
    ObjectDataSet.FieldByname('abbr_titl').Value := '   ';

    ObjectDataSet.Append;
    ObjectDataSet.Fields[1].Value := GetLangName(LangStr,'sumtotal');//'總計:';
    ObjectDataSet.Fields[2].Value := (AllTotal[13]+AllTotal[14]+AllTotal[15])/8.0;
    for i:=3 to FieldCount-2 do
    begin
      ObjectDataSet.Fields[i].AsFloat := AllTotal[i-2];
    end;
  end;
  SetProcessBar(true);
end;

procedure TFormDut15.FormDestroy(Sender: TObject);
begin
  setStatusText('');
  SetProcessBar;
end;

end.
