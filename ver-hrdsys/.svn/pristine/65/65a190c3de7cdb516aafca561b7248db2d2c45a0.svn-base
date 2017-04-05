{******************************************************************************
name：fhrd101(部門資料維護)
author: tristan
create date:2005-08-04
commentate:部門資料維護
*******************************************************************************}

unit uFhrd101;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TntStdCtrls, ExtCtrls, TntExtCtrls, Grids, DBGrids,
  TntDBGrids, Buttons, TntButtons, DBCtrls, DB,StrUtils,WSDLIntf, Mask,
  TntDbCtrls, ComCtrls,TntComCtrls, ADODB,tntDialogs;

type
  TFormfhrd101 = class(TForm)
    TntPanel1: TTntPanel;
    DataSourceDept: TDataSource;
    deptQuery: TADOQuery;
    TntPanel2: TTntPanel;
    TntGroupBox1: TTntGroupBox;
    deptTree: TTntTreeView;
    TntPanel5: TTntPanel;
    TntPanel4: TTntPanel;
    TntGroupBox2: TTntGroupBox;
    TntLabel1: TTntLabel;
    TntLabel2: TTntLabel;
    TntLabel3: TTntLabel;
    TntLabel5: TTntLabel;
    TntLabel6: TTntLabel;
    saveData: TTntBitBtn;
    delData: TTntBitBtn;
    exitSubForm: TTntBitBtn;
    facCob: TTntComboBox;
    dcodeEdit: TTntEdit;
    dtitleEdit: TTntEdit;
    dauthEdit: TTntEdit;
    dabbrEdit: TTntEdit;
    TntPanel3: TTntPanel;
    TntGroupBox3: TTntGroupBox;
    dataGrid: TTntDBGrid;

    // user create procedure and function

    procedure InitLang;
    procedure setComData;
    procedure chgComData(sfact:string);
    procedure InitDbgrid;
    procedure drawTree;
    function  searchParent(const sCode: String):TTreeNode;
    function  getTreeNode(const sCode,sNode: String): TTreeNode;
    procedure ctlStatus(csts:char);

    // system create procedure

    procedure FormCreate(Sender: TObject);
    procedure delDataClick(Sender: TObject);
    procedure saveDataClick(Sender: TObject);
    procedure facCobChange(Sender: TObject);
    procedure dcodeEditChange(Sender: TObject);
    procedure deptTreeClick(Sender: TObject);
    procedure dataGridCellClick(Column: TColumn);
    procedure dataGridTitleClick(Column: TColumn);
    procedure exitSubFormClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formfhrd101: TFormfhrd101;

implementation

uses
  UnitHrdUtils,unitDMHrdsys,UnitHrdMain;

{$R *.dfm}

{***定義全局變量***}
var
  g_sLangStr:TWideStrings;

{***********************************************
Name: InitLang
Func: 初始化語言變量
Args:
    sKeys->語言變量
***********************************************}
procedure TFormfhrd101.InitLang;
var
  sKeys:string;
begin
  sKeys:='fhrd101,dept_code,dept_abbr,dept_titl,org_num,delete,save,quit,'+
          'act_num,factory,depttree,maintentdata,browsedata,msg_set_factory,'+
          'msg_chg_factory,msg_deleted_error,msg_invalid_deptcode,msg_del_alert,'+
          'msg_invalid_auth,msg_add_error,msg_confirm_save,msg_update_error,'+
          'msg_query_error,confirm_close,msg_update_alert,msg_del_alert';
  g_sLangStr:=GetLangWideStrs(sKeys);

  TntPanel1.Caption:=GetLangName(g_sLangStr,'fhrd101');
  TntGroupBox1.Caption:=GetLangName(g_sLangStr,'depttree');
  TntGroupBox2.Caption:=GetLangName(g_sLangStr,'maintentdata');
  TntGroupBox3.Caption:=GetLangName(g_sLangStr,'browsedata');
  TntLabel1.Caption:=GetLangName(g_sLangStr,'factory');
  TntLabel2.Caption:=GetLangName(g_sLangStr,'dept_code');
  TntLabel3.Caption:=GetLangName(g_sLangStr,'dept_titl');
  TntLabel5.Caption:=GetLangName(g_sLangStr,'dept_abbr');
  TntLabel6.Caption:=GetLangName(g_sLangStr,'org_num');
  delData.Caption:=GetLangName(g_sLangStr,'delete');
  saveData.Caption:=GetLangName(g_sLangStr,'save');
  exitSubForm.Caption:=GetLangName(g_sLangStr,'quit');
  dataGrid.Columns[0].Title.caption:=GetLangName(g_sLangStr,'dept_code');
  dataGrid.Columns[1].Title.caption:=GetLangName(g_sLangStr,'dept_titl');
  dataGrid.Columns[2].Title.caption:=GetLangName(g_sLangStr,'dept_abbr');
  dataGrid.Columns[3].Title.caption:=GetLangName(g_sLangStr,'org_num');
  dataGrid.Columns[4].Title.caption:=GetLangName(g_sLangStr,'act_num');
end;

{********************************************
Name: drawTree
Func: 生成部門結構圖
Args:
    parentNode->父節點
    saveplace->標簽
    code->部門代號
********************************************}
procedure TFormfhrd101.drawTree;
var
  parentNode: TTreeNode;
  savePlace: TBookMark;
  code: String;
begin
  deptTree.Items.Clear;
  with DMHrdsys.SQLQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select factory,f_name from fhrd_factory order by factory');
    open;
    first;
    while Not Eof do
    begin
      {添加厂別根節點}
      deptTree.Items.Addfirst(nil,FieldByName('factory').Value+' / '
                              +FieldByName('f_name').Value);
      with deptQuery do
      begin
        Close;
        Parameters.ParamValues['pfactory']:=
          DMHrdsys.SQLQuery1.FieldByName('factory').Value;
        Open;
        first;
        while not Eof do
        begin
          savePlace := getBookMark;
          code := fieldByName('dept_code').Value;
          try
            parentNode := searchParent(code);
            gotoBookMark(savePlace);
          finally
            freeBookMark(savePlace);
          end;
          {添加子節點}
          deptTree.Items.AddChild(TTntTreeNode(parentNode),code+' / '
            +fieldByName('dept_abbr').Value);
          deptQuery.Next;
        end;
      end;
      DMHrdsys.SQLQuery1.Next;
    end;
  end;
  deptTree.ReadOnly:=true;
  {展開結構圖}
  //deptTree.FullExpand;
end;

{********************************************
Name: searchParent
Func: 查找，返回父節點
Args:
    code->部門代號
    i,n->循環變量
    node->節點變量
*******************************************}
function TFormfhrd101.searchParent(const sCode: String):TTreeNode;
var
  code: String;
  i,n: integer;
  node: TTreeNode;
begin
  for i := 6 downto 1 do
  begin
    if copy(sCode,i,1) <> '0' then
    begin
      code := leftStr(sCode,i-1);
      break;
    end;
  end;

  n := length(code);
  if n > 2 then
    for i := n downto 1 do
    begin
      if copy(code,i,1) <> '0' then
      begin
        code := leftStr(code,i);
        break;
      end;
    end;

  if deptQuery.Locate('dept_code',code,[loPartialKey]) then
  begin
    node := getTreeNode(sCode,code);
  end
  else
    node := deptTree.TopItem;

  result := node;
end;

{*******************************************
Name: getTreeNode
Func: 取得節點
Args:
    i->循環變量
    node->節點變量
*******************************************}
function TFormfhrd101.getTreeNode(const sCode,sNode: String): TTreeNode;
var
  i: integer;
  node: TTreeNode;
begin
  node := deptTree.topItem;
  for i := 1 to deptTree.Items.Count-1 do
  begin
    if leftStr(deptTree.Items.Item[i].Text,length(sNode)) = sNode then
    begin
      node := deptTree.Items.Item[i];
      if (node.Level = 1) and (leftStr(node.Text,3) <> leftStr(sCode,3))
       and ((leftStr(node.Text,2) = 'N0')
       or (leftStr(node.Text,2) = 'V0') ) then
        node := deptTree.TopItem;
      break;
    end;
  end;

  if ((node = deptTree.TopItem) and (length(sNode)>2))
  or ((length(sNode)>2) and (copy(node.Text,6,1) <> '0'))  then
    node := getTreeNode(sCode,leftStr(sNode,length(sNode)-1));

  result := node;
end;

{********************************************
Name: ctlStatus
Func: 控制輸入框，表格編輯狀態
Args:
    sts->狀態控制　0-不可編輯
                   1-可編輯
*******************************************}
procedure TFormfhrd101.ctlStatus(csts:Char);
begin
  case csts of
  '0':
  begin
    saveData.Enabled:=false;
    delData.Enabled:=false;
    dtitleEdit.Enabled:=false;
    dcodeEdit.Enabled:=false;
    dauthEdit.Enabled:=false;
    dabbrEdit.Enabled:=false;
  end;
  '1':
  begin
    saveData.Enabled:=true;
    delData.Enabled:=true;
    dataGrid.Enabled:=true;
    dtitleEdit.Enabled:=true;
    dcodeEdit.Enabled:=true;
    dauthEdit.Enabled:=true;
    dabbrEdit.Enabled:=true;
  end;
  end;
end;

{***************************************
Name: setComData
Func: 初始化工廠選擇框
Args:
***************************************}

procedure TFormfhrd101.setComData;
begin
  try
    with DMHrdsys.SQLQuery1 do
    begin
      close;
      sql.clear;
      sql.Add('select * from fhrd_factory');
      open;
      while not Eof do
      begin
        facCob.Items.Add(Fieldbyname('factory').AsString+'-'
        +Fieldbyname('f_name').AsString);
        next;
      end;
    end;
    facCob.ItemIndex:=-1;
  except
    widemessagedlg(GetLangName(g_sLangStr,'msg_set_factory'),mtError,[mbyes],1);
  end;
end;

{********************************************
Name: InitDbgrid
Func: 設置dbgrid顯示數據，初始為所選擇的工廠部門
Args:
********************************************}
procedure TFormfhrd101.InitDbgrid;
begin
  with deptQuery do
  begin
    Connection:=DmHrdsys.conn;
    close;
    deptQuery.Parameters.ParamValues['pfactory']:=Leftstr(facCob.Text,1);
    open;
  end;
end;

{*******************************************
Name: chgComData
Func: 動態改變工廠選擇框數值
Args:
*******************************************}
procedure TFormfhrd101.chgComData(sfact:string);
var
  index:Integer;
begin
  try
    For index:=0 to facCob.Items.Count-1 do
    begin
      if LeftStr(facCob.Items.Strings[index],1)=sfact then
      begin
        facCob.ItemIndex:=index;
        break;
      end;
    end;
  except
    widemessagedlg(GetLangName(g_sLangStr,'msg_chg_factory'),mtError,[mbyes],1);
  end;
end;

{*********************************************
Name: FormCreate
Func: 創建表單，初始化數據
Args:
*********************************************}

procedure TFormfhrd101.FormCreate(Sender: TObject);
begin
  ctlStatus('0');
  InitLang;
  setComData;
  drawTree;
end;

{*******************************************
Name: delDataClick
Func: 執行刪除數據操作 ，並刪除相應的樹結點
Args:
    parentnode->父節點變量
    node->子節點變量
*******************************************}
procedure TFormfhrd101.delDataClick(Sender: TObject);
var
  i : integer;
  node : TTreeNode;
begin
  if widemessagedlg(GetLangName(g_sLangStr,'msg_del_alert'),
        mtConfirmation,[mbyes,mbno],1)=mryes then
  begin
    try
      deptQuery.Delete;
      drawTree;
      deptQuery.Locate('dept_code',deptQuery.FieldValues['dept_code'],[loPartialKey]);
      For i := 1 to deptTree.Items.Count-1 do
      begin
        node:=deptTree.Items.Item[i];
        if LeftStr(node.Text,6)=deptQuery.FieldValues['dept_code'] then
        begin
          node.Expanded:=true;
          node.Selected:=true;
          node.Focused:=true;
        end;
      end;
      dcodeEdit.Text:='';
      dtitleEdit.Text:='';
      dabbrEdit.Text:='';
      dauthEdit.Text:='';
    except
      widemessagedlg(GetLangName(g_sLangStr,'msg_deleted_error'),mtError,[mbyes],1);
    end;
  end
  else
    abort;
end;

{**********************************************
Name: saveDataClick
Func: 執行保存數據操作 , 並增加相應的樹節點
Args:
**********************************************}
procedure TFormfhrd101.saveDataClick(Sender: TObject);
var
  i : integer;
  node: TTreeNode;
begin

  if Length(dcodeEdit.Text)<>6 then
  begin
    widemessagedlg(GetLangName(g_sLangStr,'msg_invalid_deptcode'),
    mtError,[mbyes],1);
    dcodeEdit.SetFocus;
    exit;
  end;

  if (dauthEdit.Text='') or (strToInt(dauthEdit.Text)<=0) then
  begin
    widemessagedlg(GetLangName(g_sLangStr,'msg_invalid_auth'),
    mtError,[mbyes],1);
    dauthEdit.SetFocus;
    exit;
  end;

  try
  with DMHrdsys.SQLQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select * from fhrd_dept where dept_code='''+dcodeEdit.Text+'''');
    open;
    if Eof then
    begin
      try
        with DMHrdsys.SQLQuery3 do
        begin
          close;
          sql.Clear;
          sql.Add('insert into fhrd_dept (upd_user,factory,dept_code,'+
                  'dept_title,dept_abbr,dept_auth,dept_act) '+
                  'values (:upd_user,:factory,:dept_code,:dept_title,'+
                  ':dept_abbr,:dept_auth,:dept_act)');
          Parameters.ParamValues['upd_user']:=userName;
          Parameters.ParamValues['factory']:=LeftStr(facCob.Text,1);
          Parameters.ParamValues['dept_code']:=dcodeEdit.Text;
          Parameters.ParamValues['dept_title']:=dtitleEdit.Text;
          Parameters.ParamValues['dept_abbr']:=dabbrEdit.Text;
          Parameters.ParamValues['dept_auth']:=dauthEdit.Text;
          ExecSQL;
          drawTree;
        end;
      except
        widemessagedlg(GetLangName(g_sLangStr,'msg_add_error'),mtError,[mbyes],1);
      end;
    end
    else
    begin
        if widemessagedlg(GetLangName(g_sLangStr,'msg_update_alert'),
        mtConfirmation,[mbyes,mbno],1)=mryes then
        begin
          try
            with DMHrdsys.SQLQuery3 do
            begin
              close;
              sql.Clear;
              sql.Add('update fhrd_dept set upd_user=:upd_user,dept_title=:dept_title,'+
                'dept_abbr=:dept_abbr,dept_auth=:dept_auth '+
                      'where dept_code=:dept_code');
              Parameters.ParamValues['dept_code']:=dcodeEdit.Text;
              Parameters.ParamValues['dept_title']:=dtitleEdit.Text;
              Parameters.ParamValues['dept_abbr']:=dabbrEdit.Text;
              Parameters.ParamValues['dept_auth']:=dauthEdit.Text;
              Parameters.ParamValues['upd_user']:=userName;
              ExecSQL;
              drawTree;
            end;
          except
             widemessagedlg(GetLangName(g_sLangStr,'msg_update_error'),mtError,[mbyes],1);
          end;
        end
        else
        begin
          abort;
        end;
      end;
  end;
  finally
    DMHrdsys.SQLQuery1.Close;
    InitDbgrid;
    deptQuery.Locate('dept_code',dcodeEdit.Text,[loPartialKey]);
    For i := 1 to deptTree.Items.Count-1 do
    begin
      node:=deptTree.Items.Item[i];
      if LeftStr(node.Text,6)=dcodeEdit.Text then
      begin
        node.Expanded:=true;
        node.Selected:=true;
        node.Focused:=true;
      end;
    end;
    dcodeEdit.Text:='';
    dtitleEdit.Text:='';
    dabbrEdit.Text:='';
    dauthEdit.Text:='';
  end;
end;

{***************************************************
Name: facCobChange
Func: 黨工廠選擇框數值改變時，重新初始化數據，設置狀態
Args:
***************************************************}
procedure TFormfhrd101.facCobChange(Sender: TObject);
begin
  InitDbgrid;
  ctlStatus('1');
end;

procedure TFormfhrd101.dcodeEditChange(Sender: TObject);
begin
  try
    with DMHrdsys.SQLQuery3 do
    begin
      close;
      sql.Clear;
      sql.Add('select * from fhrd_dept where dept_code='''+dcodeEdit.Text+'''');
      open;
      while not Eof do
      begin
        deptQuery.Locate('dept_code',dcodeEdit.Text,[loPartialKey]);
        dtitleEdit.Text:=FieldByName('dept_title').Value;
        dabbrEdit.Text:=FieldByName('dept_abbr').Value;
        dauthEdit.Text:=FieldByName('dept_auth').Value;
        next;
      end;
    end;
  except
    widemessagedlg(GetLangName(g_sLangStr,'msg_query_error'),mtError,[mbyes],1);
  end;
end;

{*****************************************************
Name: deptTreeClick
Func: 單擊部門節點，選擇框，表格跟隨顯示相應數據
Args:
    node->節點變量
    s->返回部門代號
*****************************************************}
procedure TFormfhrd101.deptTreeClick(Sender: TObject);
var
  node: TTreeNode;
  s: String;
begin
  ctlStatus('1');
  node := deptTree.Selected;
  if node.Level > 0 then
  begin
    s := leftStr(node.Text,6);
    with DMHrdsys.SQLQuery1 do
    begin
      close;
      sql.Clear;
      sql.Add('select factory from fhrd_dept where dept_code='''+s+'''');
      open;
      chgComData(FieldByName('factory').Value);
    end;
    InitDbgrid;
    deptQuery.Locate('dept_code',s,[loPartialKey]);
  end;

  if not VarIsNull(deptQuery.FieldValues['dept_code']) then
    dcodeEdit.Text:=deptQuery.FieldValues['dept_code']
  else
    dcodeEdit.Text:='';
  if not VarIsNull(deptQuery.FieldValues['dept_title']) then
    dtitleEdit.Text:=deptQuery.FieldValues['dept_title']
  else
    dtitleEdit.Text:='';
  if not VarIsNull(deptQuery.FieldValues['dept_abbr']) then
  dabbrEdit.Text:=deptQuery.FieldValues['dept_abbr']
  else
    dabbrEdit.Text:='';
  if not VarIsNull(deptQuery.FieldValues['dept_auth']) then
  dauthEdit.Text:=deptQuery.FieldValues['dept_auth']
  else
    dauthEdit.Text := '';
end;

{*************************************************
Name: dataGridCellClick
Func: 點擊表格填充編輯框，並對應到相應的樹節點
Args:
    i->循環變量
    node->節點變量
*************************************************}
procedure TFormfhrd101.dataGridCellClick(Column: TColumn);
var
  i:Integer;
  node:TTreeNode;
begin
  For i := 1 to deptTree.Items.Count-1 do
  begin
    node:=deptTree.Items.Item[i];
    if LeftStr(node.Text,6)=deptQuery.FieldByName('dept_code').Value then
    begin
      node.Expanded:=true;
      node.Selected:=true;
      node.Focused:=true;
    end;
  end;

  dcodeEdit.Text:=deptQuery.FieldValues['dept_code'];
  dtitleEdit.Text:=deptQuery.FieldValues['dept_title'];
  dabbrEdit.Text:=deptQuery.FieldValues['dept_abbr'];
  dauthEdit.Text:=deptQuery.FieldValues['dept_auth'];
end;

{***按表頭字段排序***}

procedure TFormfhrd101.dataGridTitleClick(Column: TColumn);
begin
  DBGridSortByTitle(Column);
end;

{***隱藏當前畫面***}

procedure TFormfhrd101.exitSubFormClick(Sender: TObject);
begin
  close;
end;

procedure TFormfhrd101.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= caFree;
end;

end.
