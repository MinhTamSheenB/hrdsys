{*************************************************************************
Name：Dut22
Author: anil
Create date:2005-09-06
Modify date:2005-09-08
Commentate:員工加班明細表
*************************************************************************}
unit UnitDut27;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, TntDbCtrls, ExtCtrls, Grids, DBGrids, TntDBGrids,
  StdCtrls, Buttons, TntButtons, TntStdCtrls, TntExtCtrls, ComCtrls,
  TntComCtrls,WSDLIntf, DB, ADODB,TntDialogs,strutils, TntDB,Qt, QuickRpt,
  DBClient, Provider,DateUtils,math, comobj,excel97,excel2000;

type
  TFormDut27 = class(TForm)
    edit_Panel: TPanel;
    PanelTitle: TTntPanel;
    PanelMain: TPanel;
    Panel5: TPanel;
    PanelGrid: TPanel;
    TntGroupBox1: TTntGroupBox;
    PanelAct: TTntPanel;
    sb_Save: TTntSpeedButton;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    DBGrid1: TTntDBGrid;
    ADOQuery2: TADOQuery;
    ADOQuery2dept_code: TStringField;
    ADOQuery2dept_titl: TWideStringField;
    ADOQuery2abbr_titl: TWideStringField;
    ADOQuery2vim_titl: TWideStringField;
    ADOQuery2vim_abbr: TWideStringField;
    ADOQuery2eng_titl: TWideStringField;
    ADOQuery2eng_abbr: TWideStringField;
    ADOQuery2org_num: TIntegerField;
    ADOQuery2act_num: TIntegerField;
    ADOQuery2factory: TStringField;
    ADOQuery2dept_cls: TStringField;
    ADOQuery2updator: TStringField;
    ADOQuery2update_time: TDateTimeField;
    ADOQuery2is_del: TStringField;
    StatusBar1: TTntStatusBar;
    OpenDialog1: TOpenDialog;
    sb_Recover: TTntSpeedButton;
    ADOCommand1: TADOCommand;
    TntBitBtn1: TTntSpeedButton;
    TntRadioButton1: TTntRadioButton;
    DataSource2: TDataSource;
    ADOQuery4: TADOQuery;
    ADOQuery3: TADOQuery;
    ADOQuery3up_user: TWideStringField;
    ADOQuery3up_time: TDateTimeField;
    ADOQuery3old_local: TStringField;
    ADOQuery3new_local: TStringField;
    DBGrid2: TTntDBGrid;
    ADOCommand2: TADOCommand;
    ADOQuery3emp_id: TStringField;
    ADOQuery3emp_chs: TTntWideStringField;
    TntLabel2: TTntLabel;
    TntComboBox1: TTntComboBox;
    TntRadioButton2: TTntRadioButton;
    BtnQuery: TTntButton;
    TntComboBox2: TTntComboBox;
    TntEdit1: TTntEdit;
    TntLabel1: TTntLabel;
    ADOQuery1up_user: TStringField;
    ADOQuery1up_time: TDateTimeField;
    ADOQuery1dept_code: TStringField;
    ADOQuery1old_local: TStringField;
    ADOQuery1new_local: TStringField;
    ADOQuery1dept_titl: TTntWideStringField;
    clear_check: TTntSpeedButton;
    check_all: TTntSpeedButton;
    TntLabel3: TTntLabel;
    TntEdit2: TTntEdit;
    ADOQuery1valid_date: TDateTimeField;
    ADOQuery3valid_date: TDateTimeField;
    sb_edit: TTntSpeedButton;
    dept_Panel: TTntPanel;
    TntLabel4: TTntLabel;
    PanelFlowTitle: TTntPanel;
    ImageClose: TImage;
    TntGroupBox5: TTntGroupBox;
    Label_emp_id: TTntLabel;
    Label_s_ask_h: TTntLabel;
    Label_e_ask_h: TTntLabel;
    TntLabel8: TTntLabel;
    TntLabel5: TTntLabel;
    TntLabel6: TTntLabel;
    EditFlow0: TTntDBEdit;
    EditFlow1: TTntDBEdit;
    EditFlow2: TTntDBEdit;
    TntDBEdit1: TTntDBEdit;
    TntDBEdit2: TTntDBEdit;
    Panel2: TPanel;
    bbtn_ok: TTntBitBtn;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel6: TPanel;
    emp_Panel: TTntPanel;
    TntLabel7: TTntLabel;
    TntPanel2: TTntPanel;
    Image1: TImage;
    TntGroupBox2: TTntGroupBox;
    TntLabel9: TTntLabel;
    TntLabel10: TTntLabel;
    TntLabel11: TTntLabel;
    TntLabel12: TTntLabel;
    TntLabel13: TTntLabel;
    TntLabel14: TTntLabel;
    TntDBEdit3: TTntDBEdit;
    TntDBEdit4: TTntDBEdit;
    TntDBEdit5: TTntDBEdit;
    TntDBEdit6: TTntDBEdit;
    TntDBEdit7: TTntDBEdit;
    Panel1: TPanel;
    bbtn_ok2: TTntBitBtn;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    sb_Add: TTntSpeedButton;
    insert_Panel: TTntPanel;
    TntLabel15: TTntLabel;
    TntPanel3: TTntPanel;
    Image2: TImage;
    TntGroupBox3: TTntGroupBox;
    TntLabel16: TTntLabel;
    TntLabel17: TTntLabel;
    TntLabel18: TTntLabel;
    TntLabel19: TTntLabel;
    TntLabel21: TTntLabel;
    TntDBEdit9: TTntDBEdit;
    TntDBEdit10: TTntDBEdit;
    Panel10: TPanel;
    TntBitBtn2: TTntBitBtn;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    TntDBComboBox1: TTntDBComboBox;
    TntDateTimePicker1: TTntDateTimePicker;
    sb_add2: TTntSpeedButton;
    ADOQuery5: TADOQuery;
    //my define
    procedure InitLang;
    procedure InitForm;
    //auto general
    procedure FormCreate(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure BtnQueryClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure ADOQuery1AfterScroll(DataSet: TDataSet);
    procedure TntComboBox1Change(Sender: TObject);
    procedure sb_SaveClick(Sender: TObject);
//    procedure sb_Save2Click(Sender: TObject);
    procedure sb_RecoverClick(Sender: TObject);
   // procedure sb_Recover2Click(Sender: TObject);
    procedure SetActEnabled(modify_Flag:boolean=true);
    procedure TntBitBtn1Click(Sender: TObject);
    procedure TntRadioButton1Click(Sender: TObject);
    procedure TntRadioButton2Click(Sender: TObject);
    procedure ADOQuery1BeforePost(DataSet: TDataSet);
    procedure ADOQuery3BeforePost(DataSet: TDataSet);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure TntComboBox2Change(Sender: TObject);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure check_allClick(Sender: TObject);
    procedure clear_checkClick(Sender: TObject);
    procedure TntEdit1Change(Sender: TObject);
    procedure TntEdit2Change(Sender: TObject);
    procedure DBGrid2TitleClick(Column: TColumn);
    procedure EditLocationChange(Sender: TObject);
    procedure ADOQuery1BeforeEdit(DataSet: TDataSet);
    procedure ADOQuery1new_localChange(Sender: TField);
    procedure sb_editClick(Sender: TObject);
    procedure ImageCloseClick(Sender: TObject);
    procedure bbtn_okClick(Sender: TObject);
    procedure bbtn_ok2Click(Sender: TObject);
    procedure sb_AddClick(Sender: TObject);
    procedure TntBitBtn2Click(Sender: TObject);
    procedure TntPanel3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TntPanel2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PanelFlowTitleMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure TntDBEdit10Change(Sender: TObject);
    procedure TntDateTimePicker1Change(Sender: TObject);
    procedure sb_add2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDut27: TFormDut27;

implementation
uses
  UnitHrdUtils,unitDMHrdsys,UnitPrtSal12;
var
  Langstr,LangC,LangE,LangV:TWideStrings;//語言字符串
  pri_arr:TPrvArr;//權限數組
  luutrugiatrichon:string;
//  wrk_date:Tdatetime;
    mabophan,dept:string;
    flag,doctaptin:boolean;
 //===========
 //   WBk, WS, SheetName: OleVariant;
  XLApp,workbook: variant;
 // tname,firstcol,nextcol: string;
  Val,EXLfile: widestring;
  //RunThread: TRunThread;
  MaxRow,MaxCol:integer;
  sheet: variant;
  dept_sua,Temp:string;
  capnhat1,capnhat2:boolean;
  themmoi:boolean;


{$R *.dfm}

procedure TFormDut27.FormCreate(Sender: TObject);
begin
  InitLang;// Init language
  pri_arr:=GetPrvArr(username,'dut27');
  InitForm;// Init Form
end;

procedure TFormDut27.InitLang;
{*************************************************************************
TO DO:初始化語言
*************************************************************************}
var
  keys:String;
begin
SetComponentLang(self);//set component language text
keys:='vietnam_chingluh_company,dut27_titl,date,fld_year,fld_smonth,fld_day,'
   +'srcdut_dut27,not_find_data,total,current_location,print_finish,just_doing_empid,finish';
LangC:=GetLangWideStrs(keys,'C');
LangE:=GetLangWideStrs(keys,'E');
LangV:=GetLangWideStrs(keys,'V');
if userlang='V' then LangStr:=LangV
else if userlang='E' then LangStr:=LangE
else LangStr:=LangC;
//PanelTitle.Caption:=GetLangName(LangStr,'sal10_titl');
end;

procedure TFormDut27.InitForm;
{*************************************************************************
TO DO:初始化Form
*************************************************************************}
var
  i,j:integer;
  dept,dept2,dept4,dept_ss:string;

begin
  GetDeptRange(TntComboBox1) ;
  GetDeptRange(TntComboBox2) ;
 // tntcombobox2.Items.Clear;
 // tntdbcombobox1.Items.Clear;

 {  for i:=0 to  TntcomboBox1.Items.Count-1 do
   begin
        tntcombobox1.ItemIndex:=i;
        dept:=TntcomboBox1.Text;
        dept2:=leftstr(dept,2);
        if ((dept2='VA') or(dept2='VB') or (dept2='VC')or(dept2='VD')or(dept2='VE')) then
           begin
             if tntcombobox2.ItemIndex=-1 then
                  if Tntcombobox2.Items.IndexOf(dept2)<0 then
                          Tntcombobox2.Items.Add(dept2)
             else
                  if Tntcombobox2.Items.IndexOf(dept2)<0 then
                                  Tntcombobox2.Items.Add(dept2);
           end
                ////////////////////////////////
        else
           begin
                dept4:=leftstr(TntcomboBox1.Text,4);
                if tntcombobox2.ItemIndex=-1 then
                    if Tntcombobox2.Items.IndexOf(dept4)<0 then
                          Tntcombobox2.Items.Add(dept4)
                else
                  if Tntcombobox2.Items.IndexOf(dept4)<0 then
                                  Tntcombobox2.Items.Add(dept4);


           end;
   end;  }
     // mabophan:=Tntcombobox2.text;
     for j:=0 to tntcombobox1.Items.Count-1 do
     begin
         tntcombobox1.ItemIndex:=j;
         tntdbcombobox1.Items.Add(tntcombobox1.Text);
     end;

end;

procedure TFormDut27.BtnPrintClick(Sender: TObject);
//打印內容設置
begin
//
end;

procedure TFormDut27.BtnQueryClick(Sender: TObject);
var
  deptstr,newlocal,sql_moi,sql_moi2:string;
  sql_bp1,sql_bp2:string;
  emp_id,newlocal2:string;
  dept,dept1,sqlstr:string;
begin
   // EditLocation.Enabled:=true;
 //   EditLocation.Text:='';
  //  EditLocation.Color:=clwhite;
// TntEdit2.Text:=TntCombobox2.Text;
//位置 不能空
 { if  TntRadioButton1.Checked then
      if tntedit1.Text='' then
      begin
           WideMessageDlg(GetLangName(LangStr,'srcdut_dut27'),mterror,[mbOK],0);//WideMessageDlg(GetLangName(LangStr,'with_star_cannot_empty'),mterror,[mbOK],0);
           tntedit1.SetFocus;
           exit;
      end;
   if  TntRadioButton2.Checked then
      if tntedit2.Text='' then
      begin

           WideMessageDlg(GetLangName(LangStr,'srcdut_dut27'),mterror,[mbOK],0);//WideMessageDlg(GetLangName(LangStr,'with_star_cannot_empty'),mterror,[mbOK],0);
           tntedit2.SetFocus;
           exit;
      end;}

////////////////////////////
 if not dbgrid1.Enabled then
    dbgrid1.Enabled:=true;
  if not dbgrid2.Enabled then
    dbgrid2.Enabled:=true;
 sql_bp1:='SELECT * FROM dbo.hrd_dut_dept_local WHERE (dept_code IN (SELECT dept_code FROM dbo.hrd_dept WHERE (dept_code LIKE ''%'+copy(Tntcombobox2.text,1, 6 ) +'%'')))';  //有錯誤先關調閉(act_num <> 0) AND (act_num <> '''' AND
// edit1.Text:=sql_bp1;
 sql_bp2:='select dept_code from hrd_dept where act_num<>0 and act_num<>'''' and dept_code like'''+copy(Tntcombobox2.text,1,6)+'%''';
// edit1.Text:=sql_bp2;
  if (TntRadioButton1.Checked ) then
  begin
       tntedit1.Text:=uppercase(tntedit1.Text);
       adoquery1.close;
       adoquery1.sql.Clear;
       adoquery1.sql.Add(sql_bp1);
       adoquery1.Open;
       if adoquery1.Eof then
       with dmhrdsys.SQLQuery1 do
            begin
                close;
                sql.Clear;
                sql.Add(sql_bp2);
                open;
                while not eof do
                begin
                    adoquery1.Last;
                    adoquery1.Append;
                    adoquery1.fieldbyname('dept_code').AsString:=fieldbyname('dept_code').AsString;
                    adoquery1.fieldbyname('new_local').AsString:=tntedit1.Text;
                    //if fieldbyname('valid_date').AsString<>'' then
                      //  adoquery1.fieldbyname('valid_date').AsDateTime:=fieldbyname('valid_date').AsDateTime
                   // else
                    adoquery1.fieldbyname('valid_date').AsDateTime:=date();
                    if tntedit2.Text<>'' then
                    begin
                        adoquery1.Edit;
                        adoquery1.fieldbyname('up_user').AsString:=username;
                        adoquery1.fieldbyname('up_time').AsDatetime:=GetServerdatetime;
                    end;
                    if adoquery1.State in [dsEdit,dsInsert] then
                          adoquery1.Post;
                    next;
                end;

          end;
    end;

 { if (TntRadioButton1.Checked ) then
 begin
       tntedit1.Text:=uppercase(tntedit1.Text);
       adoquery1.close;
       adoquery1.Open;
       with Dmhrdsys.SQLQuery2 do
       begin
          close;
          sql.Clear;
          sql.Add('select dept_code from hrd_dept where act_num<>0 and act_num<>'''' and dept_code like'''+mabophan+'%''');
          open;
          first;
          while not eof do
          begin
     // deptstr:='';
              deptstr:=fields[0].AsString;
              dmhrdsys.SQLQuery3.Close;
              dmhrdsys.SQLQuery3.SQL.Clear;
              dmhrdsys.SQLQuery3.SQL.Add('select * from hrd_dut_dept_local where  ((new_local<>'''') or not(new_local is null)) and dept_code='''+deptstr+''' ');
              dmhrdsys.SQLQuery3.Open;
              //tim trong bang hrd_dut_dept_local neu truong new_local co gia tri thi khong hien thi
              //neu tim thay dung yeu cau thi xoa bo recordsset tim thay
              if not dmhrdsys.SQLQuery3.eof then
                delete;
              {    newlocal:=dmhrdsys.SQLQuery3.fieldbyname('new_local').AsString
          //    else
                //    newlocal:='';
              //dmhrdsys.SQLQuery3.close;
              //adoquery1.Append;
              //adoquery1.fieldbyname('dept_code').AsString:=deptstr;
              //adoquery1.fieldbyname('new_local').AsString:=newlocal;
            //  if newlocal<>'' then
              //begin
                  adoquery1.Edit;
                 // //adoquery1.fieldbyname('up_user').AsString:=username;
                //  adoquery1.fieldbyname('up_time').AsDatetime:=GetServerdatetime;
              //end;
              if dmhrdsys.SQLQuery3.Eof then
              begin
                 adoquery1.Append;
                 adoquery1.fieldbyname('dept_code').AsString:=deptstr;
                 adoquery1.fieldbyname('new_local').AsString:='';
              end;

              if adoquery1.State in [dsEdit,dsInsert] then
                    adoquery1.Post;
           next;
          end;
        first;
//        close;
    end;

  end;              }
  if (TntRadioButton2.Checked) then
  begin
      tntedit2.Text:=uppercase(tntedit2.Text);
      //adoquery3.close;
     // adoquery3.Open;
      sql_moi:='SELECT emp_id FROM dbo.hrd_emp WHERE (emp_id NOT IN(SELECT emp_id FROM hrd_dut_dept_local2)) AND (epledt IS NULL) AND(dept_code = '''+leftstr(tntComboBox1.Text,6)+''')';
      //edit1.Text:=sql_moi;
      sql_moi2:='SELECT * FROM dbo.hrd_dut_dept_local2 A INNER JOIN dbo.hrd_emp B ON A.emp_id = B.emp_id and B.epledt is null and B.dept_code='''+leftstr(tntComboBox1.Text,6)+''' ';
     // edit1.Text:=sql_moi2;
      adoquery3.Close;
      adoquery3.SQL.Clear;
      adoquery3.SQL.Add(sql_moi2);
      adoquery3.open;
 //     if adoquery3.Eof then
      with dmhrdsys.SQLQuery2 do
        begin
          close;
          sql.Clear;
          sql.Add(sql_moi);
          open;
          if not eof then
          while not eof do
            begin
              adoquery3.Append;
              adoquery3.fieldbyname('emp_id').AsString:=fieldbyname('emp_id').AsString;
              adoquery3.fieldbyname('new_local').AsString:=tntedit2.Text;
            //  if fieldbyname('valid_date').AsString<>'' then
             //           adoquery3.fieldbyname('valid_date').AsDateTime:=fieldbyname('valid_date').AsDateTime
             // else
              adoquery3.fieldbyname('valid_date').AsDateTime:=date();
              if tntedit2.Text<>'' then
               begin
                  adoquery3.Edit;
                  adoquery3.fieldbyname('up_user').AsString:=username;
                  adoquery3.fieldbyname('up_time').AsDatetime:=GetServerdatetime;
                end;
              if adoquery3.State in [dsEdit,dsInsert] then
                          adoquery3.Post;
              next;
            end ;
       end;
  end;

  /////=================================================

   Dmhrdsys.SQLQuery2.close;
  sb_Recover.Enabled:=true;
  sb_Save.Enabled:=true;
  sb_edit.Enabled:=true;
end;

procedure TFormDut27.DBGrid1TitleClick(Column: TColumn);
{*************************************************************************
TO DO:點擊表格標頭改變排序方式
*************************************************************************}
begin
  DBGridSortByTitle(column);
end;

procedure TFormDut27.ADOQuery1AfterScroll(DataSet: TDataSet);
begin
with ADOQuery1 do
  setStatusText(GetLangName(LangStr,'current_location')+':'+inttostr(RecNo)+' '+GetLangName(LangStr,'total')+':'+inttostr(RecordCount));
end;

procedure TFormDut27.TntComboBox1Change(Sender: TObject);
//var
//    i:integer;
begin
    //i:=tntcombobox1.ItemIndex;
   // tntcombobox2.ItemIndex:=i;
 {      Case TntComboBox1.ItemIndex of
      0:begin
            dept:='VA';
        end;
      1: begin
            dept:='VB';
         end;
      2: begin
            dept:='VC';
         end;
      3:begin
            dept:='VD';
        end;
    end;
     TntComboBox2.Items.Clear;

    with DMHrdsys.SQLQuery4 do
    begin
       Close;
       SQL.Clear;
       SQL.Add('select dept_code from hrd_dept where dept_code like'''+dept+'%''');
       open;
       while not eof do
       begin
            TntComboBox2.Items.Add(fieldbyname('dept_code').AsString);
            //ListBox1.Items.Add(fieldbyname('dept_code').AsString);
            next;
       end;
    end;
    DMHrdsys.SQLQuery4.Close;  }
    //edit1.text:='select dept_code from hrd_dept where dept_code like'''+dept+'%''';
end;

procedure TFormDut27.sb_SaveClick(Sender: TObject);
var
  rno,rno_themmoi:integer;
  clsql :string ;
begin
  if TntRadioButton1.Checked then
  begin
        if themmoi then
        begin
           adoquery1.UpdateBatch;
        end;


        if capnhat1 then
            adoquery1.UpdateBatch;
        with adoquery1 do
        begin
            rno:=recno;
            first;
            while not eof do
            begin
                  if fieldbyname('new_local').AsString='' then
                  begin
                      dmhrdsys.ADOCommand1.CommandText:='delete from hrd_dut_dept_local where dept_code='''+fieldbyname('dept_code').AsString+'''';
                      dmhrdsys.ADOCommand1.execute;
                  end ;

            next;
            end;
            recno:=rno;
            capnhat1:=false;
        end;
        dbgrid1.Fields[2].FocusControl;
        //edit1.Text:=mabophan;
  end;
  //////////////////////////////////////
  if TntRadioButton2.Checked then
  begin
    //    if capnhat2 then
     //       adoquery3.UpdateBatch
     //   else
     //     begin
        with adoquery3 do
        begin
            rno:=recno;
            first;
            while not eof do
            begin
                  if fieldbyname('new_local').AsString='' then
                  begin
                      dmhrdsys.ADOCommand1.CommandText:='delete from hrd_dut_dept_local2 where emp_id='''+fieldbyname('emp_id').AsString+'''';
                      dmhrdsys.ADOCommand1.execute;
                  end
                  else
                  begin
                      clsql := 'select *from hrd_dut_dept_local2 where emp_id=''' + fieldbyname('emp_id').AsString + '''';
                      adoQuery5.SQL.Clear ;
                      adoQuery5.sql.Add(clsql ) ;
                      adoQuery5.Open ;
                      if  adoQuery5.eof then
                         begin
                           dmhrdsys.ADOCommand1.CommandText:='insert into hrd_dut_dept_local2(up_user,up_time,emp_id,new_local) values('''+fieldbyname('up_user').AsString+
                               ''','''+formatdatetime('yyyy/mm/dd hh:nn:ss',fieldbyname('up_time').AsDateTime)+
                               ''','''+ fieldbyname('emp_id').AsString+ ''',''' +fieldbyname('new_local').asstring+ ''')' ;
                           dmhrdsys.ADOCommand1.execute;
                         end
                      else
                         begin
                           dmhrdsys.ADOCommand1.CommandText:='update  hrd_dut_dept_local2 set up_user='''+fieldbyname('up_user').AsString+
                             ''',up_time='''+formatdatetime('yyyy/mm/dd hh:nn:ss',fieldbyname('up_time').AsDateTime)+
                             ''',new_local='''+fieldbyname('new_local').asstring+''' where emp_id='''+
                              fieldbyname('emp_id').AsString+'''';
                           dmhrdsys.ADOCommand1.execute;
                        end;
                  end;
            //end;
          next;
        end;
      //  end;
      //  recno:=rno;
        capnhat2:=false;
    end;
    dbgrid2.Fields[2].FocusControl;
  end;


 //adoquery1.UpdateBatch;
 TntBitBtn1.Enabled:=true;
  //TntComboBox1.Enabled:=true;
end;

procedure TFormDut27.sb_RecoverClick(Sender: TObject);
var
  deptstr,emp_id:string;
begin
 if TntRadioButton1.Checked then
 begin
   if not  capnhat1 then
   begin

      adoquery1.close;
      adoquery1.Open;
      with Dmhrdsys.SQLQuery2 do
      begin
        close;
        sql.Clear;
        sql.Add('select dept_code from hrd_dept where dept_code like'''+dept+'%''');
        open;
        first;
        while not eof do
        begin
     // deptstr:='';
            deptstr:=fields[0].AsString;
            with adoquery1 do
            begin
               while not eof do
                begin
                      ADOCommand1.CommandText:='delete from hrd_dut_dept_local where dept_code='''+deptstr+'''';
                      ADOCommand1.execute;
                      next;
                end;

            end;
            next;
        end;
      first;
      dbgrid1.Enabled:=false;
      end;
   end;
   capnhat1:=false;
  end;
//////////////////////////////////////////////////////////////////////////

  if TntRadioButton2.Checked then
  begin
    if not  capnhat2 then
    begin
      adoquery3.close;
      adoquery3.Open;
      with Dmhrdsys.SQLQuery2 do
      begin
        close;
        sql.Clear;
        sql.Add('select emp_id from hrd_emp where dept_code ='''+tntcombobox1.Text+'''');
        open;
        first;
        while not eof do
        begin
     // deptstr:='';
            emp_id:=fields[0].AsString;
            with adoquery1 do
            begin
               while not eof do
                begin
                      ADOCommand1.CommandText:='delete from hrd_dut_dept_local where dept_code='''+emp_id+'''';
                      ADOCommand1.execute;
                      next;
                end;

            end;
            next;
        end;
       first;
        dbgrid2.Enabled:=false;
      end;
   end;
    capnhat2:=false;
  end;

 ///////////////////////////////
 Dmhrdsys.SQLQuery2.close;
 adoquery1.Active:=false;
 adoquery3.Active:=false;
 //TntComboBox1.Enabled:=true;

 sb_Save.Enabled:=false;
 sb_Recover.Enabled:=false;

end;
procedure TFormDut27.SetActEnabled(Modify_Flag:boolean=true);
//設置功能按鈕是否可用
var
  status:boolean;
begin
  status:=AdoQuery1.Active;
//  sb_print.Enabled:=status and Pri_Arr[PRT];
 // sb_Add.Enabled:=Pri_Arr[ADD];
 // sb_Del.Enabled:=status and Pri_Arr[DEL];
//  sb_edit.Enabled:=status and Pri_Arr[UPD];
 // sb_Recover.Enabled:=status and modify_flag;
  sb_Save.Enabled:=status and modify_flag;
end;

procedure TFormDut27.TntBitBtn1Click(Sender: TObject);
var
  i,j,dung:integer;
  xuly:string;
//  reno1,reno2:integer;
begin
  tntedit1.Text:='';
  doctaptin:=true;
    //doc file excel
//    TtntBitBtn(sender).Name
    OpenDialog1 := TOpenDialog.Create(Nil);
    OpenDialog1.Title :='Please Select mdb File Path ';
    OpenDialog1.Filter := 'xls File|*.xls';
    if OpenDialog1.Execute then
      begin
          EXLfile:=OpenDialog1.FileName;
          StatusBar1.Panels.Items[1].Text :='Excel File Path:  ' + OpenDialog1.FileName;
      end;
    if TntRadioButton1.Checked then
          dbgrid1.Enabled:=true;
    if TntRadioButton2.Checked then
          dbgrid2.Enabled:=true;
///////////////////////////////////////////////////////////
    if TntRadioButton1.Checked then
    begin
      try
          XLApp:=CreateOleObject( 'Excel.Application' );
          //XLApp.application;
          XLApp.displayAlerts:=false;
          XLApp.ScreenUpdating:=false;
          XLApp.WorkBooks.Add(EXLfile);  //gan doi tuong XLApp=voi ten file
          workbook := XLApp.workbooks[1]; //
          sheet:=workbook.worksheets[1];   //mo trang 1
          adoquery1.close;
          adoquery1.Open;
          //tname:= extractfilename(EXLfile) ;
          //tname:=leftstr(tname,length(tname)-4)+sheet.name;
          XLApp.ActiveCell.SpecialCells(xlLastCell).Select;
          maxRow:=XLApp.ActiveCell.Row;    //so hang toi da
          MaxCol:=XLApp.ActiveCell.Column;  //co cot toi da
          while (trim(sheet.cells[maxrow,1])= '')  do
            maxrow:=maxrow-1;   //giam dan so cot

          for i:=1 to maxrow do
              for j:=1 to maxcol do
              begin
                    val:=trim(sheet.cells[i,j]);
                    if ((leftstr(val,1)='V')and(j=2))  then
                          begin
                                adoquery1.append;
                                adoquery1.Edit;
                                dung:=i;
                                //ListBox1.Items.Add(val);
                                //ListBox2.Items.Add(sheet.cells[dung,j+1]);
                                //ListBox3.Items.Add(sheet.cells[dung,j+2]);
                                adoquery1.fieldbyname('dept_code').AsString:=val;
                                adoquery1.fieldbyname('dept_titl').AsString:=trim(sheet.cells[dung,j+1]);
                                adoquery1.fieldbyname('new_local').AsString:=trim(sheet.cells[dung,j+3]);
                                luutrugiatrichon:=trim(sheet.cells[dung,j+3]);
                                break;
                          end;
              end
         //finally
          //XLApp.quit;

        except
            on Exception do raise exception.Create('Sorry Xls AppLication not Exist !!! ');

        end;
        dbgrid1.SetFocus;
        dbgrid1.Fields[1].FocusControl;
        TntEdit1.Text:=luutrugiatrichon;
       // edit1.Text:=inttostr(reno1);
        with adoquery1 do
    begin
          first;
          while not eof do
          begin
               // recno:=reno1;
                next;
          end;
    end;

    end;
    //////////////////////////////themvao
   //////////////////    //////////////////////////////////////////////////////
    if TntRadioButton2.Checked then
    begin
      try
          XLApp:=CreateOleObject( 'Excel.Application' );
          XLApp.displayAlerts:=false;
          XLApp.ScreenUpdating:=false;
          XLApp.WorkBooks.Add(EXLfile);
          workbook := XLApp.workbooks[1];
          sheet:=workbook.worksheets[1];
          adoquery3.close;
          adoquery3.Open;
          //tname:= extractfilename(EXLfile) ;
          //tname:=leftstr(tname,length(tname)-4)+sheet.name;
          XLApp.ActiveCell.SpecialCells(xlLastCell).Select;
          maxRow:=XLApp.ActiveCell.Row;
          MaxCol:=XLApp.ActiveCell.Column;
          while (trim(sheet.cells[maxrow,1])= '')  do
            maxrow:=maxrow-1;
          for i:=1 to maxrow do
              for j:=1 to maxcol do
              begin
                    val:=trim(sheet.cells[i,j]);
                    if ((leftstr(val,1)='V')and(j=2)) then
                          begin
                                xuly:='';
                                xuly:=sheet.cells[i,j+2];

                                while length(xuly)<6 do
                                begin
                                  xuly:='0'+ xuly;
                                end;
                                adoquery3.append;
                                adoquery3.insert;
                                dung:=i;
                                adoquery3.fieldbyname('emp_id').AsString:=xuly;
                                adoquery3.fieldbyname('new_local').AsString:=trim(sheet.cells[i,j+3]);
                                //ListBox1.Items.Add(trim(sheet.cells[i,j+3]));
                                //ListBox1.ItemIndex:=i;
                                //adoquery3.fieldbyname('emp_chs').AsString:=ListBox1.Items.Text;
                                //adoquery3.fieldbyname('emp_chs').AsString:=trim(sheet.cells[i,j+2]);
                                luutrugiatrichon:=trim(sheet.cells[i,j+3]);

                                break;
                          end;

              end;
       //finally
         // XLApp.quit;
        except
            on Exception do raise exception.Create('Sorry Xls AppLication not Exist !!! ')
        end;

        dbgrid2.SetFocus;
        dbgrid2.Fields[1].FocusControl;
        tntedit2.Text:=luutrugiatrichon;
         with adoquery3 do
    begin
          first;
          while not eof do
          begin
               // recno:=reno1;
                next;
          end;
    end;

    end;

    ////////////////////////////////////////////////////////
  //    XLApp.displayAlerts:=true;
//      XLApp.ScreenUpdating:=true;
  //    XLApp.displayAlerts:=false;
    //  XLApp.quit;

      sb_Recover.Enabled:=true;
      sb_Save.Enabled:=true;
      //TntComboBox1.Enabled:=false;
      TntBitBtn1.Enabled:=false;

end;

procedure TFormDut27.TntRadioButton1Click(Sender: TObject);
begin
    //TntComboBox2.Enabled:=false;
    TntBitBtn1.Enabled:=true;
    adoquery3.Close;
    dbgrid2.Enabled:=false;
    dbgrid1.Enabled:=true;
    tntedit1.Enabled:=true;
    tntedit2.Enabled:=false;
    tntcombobox2.SetFocus;
    tntcombobox2.ItemIndex:=0;
    sb_add.Enabled:=true;
end;
procedure TFormDut27.TntRadioButton2Click(Sender: TObject);
begin
     TntComboBox1.Enabled:=true;
    // TntComboBox2.Enabled:=true;
     TntBitBtn1.Enabled:=true;
     adoquery1.close;
     dbgrid1.Enabled:=false;
     dbgrid2.Enabled:=true;
     tntedit2.Enabled:=true;
    tntedit1.Enabled:=false;
end;

procedure TFormDut27.ADOQuery1BeforePost(DataSet: TDataSet);
begin
  adoquery1.FieldByName('new_local').AsString:=uppercase(adoquery1.FieldByName('new_local').AsString);
//  adoquery1.fieldbyname('valid_date').AsDateTime:=Date();
end;

procedure TFormDut27.ADOQuery3BeforePost(DataSet: TDataSet);
begin
  adoquery3.FieldByName('new_local').AsString:=uppercase(adoquery3.FieldByName('new_local').AsString);
end;

procedure TFormDut27.DBGrid1CellClick(Column: TColumn);
begin
  {if (not Column.Grid.DataSource.DataSet.Active) or (Column.Field.FieldName<>'new_local') then
    exit;
    //dbgrid1.DataSource.DataSet.Fields[4].Asstring la so truong cua recordset field new_local
  if dbgrid1.DataSource.DataSet.Fields[4].Asstring='' then //or (doctaptin=true)) then
  begin
  dbgrid1.DataSource.DataSet.Edit;
  dbgrid1.DataSource.DataSet.Fields[4].Asstring:=tntEdit1.text;
 //luutrugiatrichon:=tntedit1.Text;
  adoquery1.FieldByName('new_local').AsString:=tntedit1.Text;
  dbgrid1.DataSource.DataSet.post;
//  if doctaptin then doctaptin:=false;
  end
  else
  begin
    dbgrid1.DataSource.DataSet.Edit;
    dbgrid1.DataSource.DataSet.Fields[4].Asstring:='';
    adoquery1.FieldByName('new_local').AsString:='';
    dbgrid1.DataSource.DataSet.post;
    //if not doctaptin then doctaptin:=true;
  end;}
  if Column.Index = 0 then
  begin
    with ADOQuery1 do
      begin
        edit;
        //FieldByName('valid_flag').AsBoolean:= not FieldByName('valid_flag').AsBoolean;
        if FieldByName('new_local').AsString='' then
          FieldByName('new_local').AsString:=tntedit1.Text
        else
          FieldByName('new_local').AsString:='';
        Post;
      end;
  end;
end;

procedure TFormDut27.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
Const
  CtrlState : array[Boolean] of Integer = (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
  CheckBoxRect : TRect;
  flag:boolean;
  a:string;
begin
{//  if (not Column.Grid.DataSource.DataSet.Active) or (Column.Field.FieldName<>'new_local') then
//    exit;

  TtntDBGrid(Sender).Canvas.FillRect(Rect);
  CheckBoxRect.Left := Rect.Left + 2;
  CheckBoxRect.Right := Rect.Right - 2;
  CheckBoxRect.Top := Rect.Top + 2;
  CheckBoxRect.Bottom := Rect.Bottom - 2;
  if Column.Grid.DataSource.DataSet.Fields[4].AsString='' then
      flag:=false
  else
      flag:=true;

  //xu ly trang thai cua nut checkbox (co chon hay khong)
  if doctaptin then
      DrawFrameControl(TtntDBGrid(Sender).Canvas.Handle,CheckBoxRect,DFC_BUTTON,CtrlState[doctaptin])
  else
      DrawFrameControl(TtntDBGrid(Sender).Canvas.Handle,CheckBoxRect,DFC_BUTTON,CtrlState[flag]);
      }
  if Column.Index = 0 then
  begin
    a:=ADOQuery1.FieldByName('new_local').AsString;
    if (ADOQuery1.FieldByName('new_local').AsString<>'') then
      flag:= true
    else
      flag:=false;
    DrawFrameControl(DBGrid1.Canvas.Handle,Rect,DFC_BUTTON,CtrlState[FLAG]);
  end;
end;

procedure TFormDut27.TntComboBox2Change(Sender: TObject);
var
  i:integer;
begin
  i:=tntcombobox2.ItemIndex;
  tntcombobox1.ItemIndex:=i;
end;

procedure TFormDut27.DBGrid2CellClick(Column: TColumn);
begin
{  if (not Column.Grid.DataSource.DataSet.Active) or (Column.Field.FieldName<>'new_local') then
    exit;
    //dbgrid1.DataSource.DataSet.Fields[4].Asstring la so truong cua recordset field new_local
  if dbgrid2.DataSource.DataSet.Fields[4].Asstring='' then //or (doctaptin=true)) then
  begin
  dbgrid2.DataSource.DataSet.Edit;
  dbgrid2.DataSource.DataSet.Fields[4].Asstring:=tntEdit1.text;
 //luutrugiatrichon:=tntedit1.Text;
  adoquery3.FieldByName('new_local').AsString:=tntedit1.Text;
  dbgrid2.DataSource.DataSet.post;
//  if doctaptin then doctaptin:=false;
  end
  else
  begin
    dbgrid2.DataSource.DataSet.Edit;
    dbgrid2.DataSource.DataSet.Fields[4].Asstring:='';
    adoquery3.FieldByName('new_local').AsString:='';
    dbgrid2.DataSource.DataSet.post;
    //if not doctaptin then doctaptin:=true;
  end;}
  if Column.Index = 0 then
  begin
    with ADOQuery3 do
      begin
        edit;
        //FieldByName('valid_flag').AsBoolean:= not FieldByName('valid_flag').AsBoolean;
        if FieldByName('new_local').AsString='' then
          FieldByName('new_local').AsString:=tntedit2.Text
        else
          FieldByName('new_local').AsString:='';
        Post;
      end;
  end;


end;

procedure TFormDut27.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);

  Const  CtrlState : array[Boolean] of Integer = (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
  CheckBoxRect : TRect;
  flag:boolean;
  a:string;
begin
{  if (not Column.Grid.DataSource.DataSet.Active) or (Column.Field.FieldName<>'new_local') then
    exit;
  TtntDBGrid(Sender).Canvas.FillRect(Rect);
  CheckBoxRect.Left := Rect.Left + 2;
  CheckBoxRect.Right := Rect.Right - 2;
  CheckBoxRect.Top := Rect.Top + 2;
  CheckBoxRect.Bottom := Rect.Bottom - 2;
  if Column.Grid.DataSource.DataSet.Fields[4].AsString='' then
      flag:=false
  else
      flag:=true;

  //xu ly trang thai cua nut checkbox (co chon hay khong)
  if doctaptin then
      DrawFrameControl(TtntDBGrid(Sender).Canvas.Handle,CheckBoxRect,DFC_BUTTON,CtrlState[doctaptin])
  else
      DrawFrameControl(TtntDBGrid(Sender).Canvas.Handle,CheckBoxRect,DFC_BUTTON,CtrlState[flag]);}
  if Column.Index = 0 then
  begin
    a:=ADOQuery3.FieldByName('new_local').AsString;
    if (ADOQuery3.FieldByName('new_local').AsString<>'') then
      flag:= true
    else
      flag:=false;
    DrawFrameControl(DBGrid2.Canvas.Handle,Rect,DFC_BUTTON,CtrlState[FLAG]);
  end;

end;


procedure TFormDut27.check_allClick(Sender: TObject);
begin
  if  TntRadioButton1.Checked then
  begin
        with ADOQuery1 do
        begin
            first;
            while not EOF do
            begin
              edit;
              if TTntBitBtn(Sender).name='check_all' then
                  FieldByName('new_local').AsString:=tntedit1.Text
              else
                  FieldByName('new_local').AsString:='';
              next;
            end;
        end;
  end;
  ///////////////////////////////////////////////////
  if  TntRadioButton2.Checked then
  begin
        with ADOQuery3 do
        begin
            first;
            while not EOF do
            begin
              edit;
              if TTntBitBtn(Sender).name='check_all' then
                  FieldByName('new_local').AsString:=tntedit2.Text
              else
                  FieldByName('new_local').AsString:='';
              next;
            end;
        end;
  end;
 // clear_check.Enabled:=true;
 // check_all.Enabled:=false;
end;

procedure TFormDut27.clear_checkClick(Sender: TObject);
begin
    if  TntRadioButton1.Checked then
  begin
        with ADOQuery1 do
        begin
            first;
            while not EOF do
            begin
              edit;
              if TTntBitBtn(Sender).name='check_all' then
                  FieldByName('new_local').AsString:=tntedit1.Text
              else
                  FieldByName('new_local').AsString:='';
              next;
            end;
        end;
  end;
  ///////////////////////////////////////////////////
  if  TntRadioButton2.Checked then
  begin
        with ADOQuery3 do
        begin
            first;
            while not EOF do
            begin
              edit;
              if TTntBitBtn(Sender).name='check_all' then
                  FieldByName('new_local').AsString:=tntedit2.Text
              else
                  FieldByName('new_local').AsString:='';
              next;
            end;
        end;
  end;
//  check_all.Enabled:=true;
 // clear_check.Enabled:=false;
end;

procedure TFormDut27.TntEdit1Change(Sender: TObject);
//var
 // str:string;
begin
  //    str:=tntedit1.Text;
  //    tntedit1.Text:=uppercase(str);
end;

procedure TFormDut27.TntEdit2Change(Sender: TObject);
//var
  //str:string;
begin
   //   str:=tntedit2.Text;
   //   tntedit2.Text:=uppercase(str);
end;

procedure TFormDut27.DBGrid2TitleClick(Column: TColumn);
begin
    DBGridSortByTitle(column);
end;

procedure TFormDut27.EditLocationChange(Sender: TObject);
begin
{   With AdoQuery3 do
   begin
      if TTntEdit(Sender).Text<>'' then
          Filter:='emp_id like '''+TTntEdit(Sender).Text+'*'+''''
      else
          Filter:='';
      Filtered:=true;
  end;}
 // adoquery3.Locate('emp_id',EditLocation.Text,[loPartialKey]);

end;

procedure TFormDut27.ADOQuery1BeforeEdit(DataSet: TDataSet);
begin
      temp:=adoquery1.FieldByName('new_local').AsString;
end;

procedure TFormDut27.ADOQuery1new_localChange(Sender: TField);
begin
      adoquery1.FieldByName('old_local').AsString:=temp;
end;

procedure TFormDut27.sb_editClick(Sender: TObject);
begin
     if TntRadioButton1.Checked then
     begin
          capnhat1:=true;
          dept_Panel.Top:=100;
          dept_Panel.Left:=400;
          PanelMain.Enabled:=false;
          dept_Panel.Visible:=true;
     end;
     if TntRadioButton2.Checked then
     begin
          capnhat2:=true;
          emp_Panel.Top:=150;
          emp_Panel.Left:=100;
          PanelMain.Enabled:=false;
          emp_Panel.Visible:=true;
     end;
end;

procedure TFormDut27.ImageCloseClick(Sender: TObject);
begin
     PanelMain.Enabled:=true;
     dept_Panel.Visible:=false;
     emp_Panel.Visible:=false;
     insert_Panel.Visible:=false;
end;

procedure TFormDut27.bbtn_okClick(Sender: TObject);
begin
      with adoquery1 do
      begin
         //   while not eof do
           // begin
                edit;
                fieldbyname('old_local').AsString:=fieldbyname('new_local').AsString;
                //fieldbyname('valid_date').AsDateTime:=date();
                post;
             //   next;
            //end;
      end;
      ImageClose.OnClick(Sender);
end;

procedure TFormDut27.bbtn_ok2Click(Sender: TObject);
begin
    with adoquery3 do
      begin
          //  while not eof do
           // begin
                edit;
                fieldbyname('old_local').AsString:=fieldbyname('new_local').AsString;
                fieldbyname('valid_date').AsDateTime:=date();
             //   post;
                //next;
          //  end/;
      end;
     ImageClose.OnClick(Sender);
end;

procedure TFormDut27.sb_AddClick(Sender: TObject);
begin
  themmoi:=true;
  insert_Panel.Top:=100;
  insert_Panel.Left:=400;
  PanelMain.Enabled:=false;
  insert_Panel.Visible:=true;

  with ADOQuery1 do
  begin
    if Active=false then//如果沒有打開數據集， 則重新打開
    begin
      SQL.Clear;
      SQL.Add('select * from hrd_dut_dept_local where 2=1 ');
      Active:=true;
    end;
    Last;
    Append;
  end;
   // sb_del.Enabled:=true;


end;

procedure TFormDut27.TntBitBtn2Click(Sender: TObject);
begin
    with adoquery1 do
      begin
         edit;
         fieldbyname('valid_date').AsString :=formatdatetime('yyyy/mm/dd',TntDateTimePicker1.date);
         post;
     end;
    sb_edit.Enabled:=true;
    sb_recover.Enabled:=true;
    sb_save.Enabled:=true;
    ImageClose.OnClick(Sender);
end;

procedure TFormDut27.TntPanel3MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
      ReleaseCapture;
      insert_panel.Perform(WM_SysCommand,$F012,0);

end;

procedure TFormDut27.TntPanel2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
        ReleaseCapture;
        emp_panel.Perform(WM_SysCommand,$F012,0);

end;

procedure TFormDut27.PanelFlowTitleMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
      ReleaseCapture;
      edit_panel.Perform(WM_SysCommand,$F012,0);

end;

procedure TFormDut27.TntDBEdit10Change(Sender: TObject);
begin
      tntedit1.Text:=uppercase(tntdbedit10.Text);
end;

procedure TFormDut27.TntDateTimePicker1Change(Sender: TObject);
begin
      with adoquery1 do
      begin
          edit;
          fieldbyname('valid_date').AsString:=formatdatetime('yyyy/mm/dd',TntDateTimePicker1.Date);
      end;
end;

procedure TFormDut27.sb_add2Click(Sender: TObject);
begin
    with ADOQuery1 do
  begin
    if Active=false then//如果沒有打開數據集， 則重新打開
    begin
      SQL.Clear;
      SQL.Add('select * from hrd_dut_dept_local where 2=1 ');
      Active:=true;
    end;
    Last;
    Append;
  end;
  
end;

end.
