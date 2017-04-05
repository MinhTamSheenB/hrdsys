unit uFhrd501;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ADODB, DB, ImgList, Menus, TntMenus, ExtCtrls, Buttons,
  TntButtons, Grids, DBGrids, TntDBGrids, TntStdCtrls, StdCtrls, CheckLst,
  TntCheckLst, ComCtrls, TntComCtrls, TntExtCtrls;

type
  TFormfhrd501 = class(TForm)
    privilege: TTntPageControl;
    select: TTntTabSheet;
    TntGroupBox1: TTntGroupBox;
    TntLabel1: TTntLabel;
    TntLabel2: TTntLabel;
    CB_DEPT: TTntComboBox;
    bb_search: TTntBitBtn;
    bb_reset: TTntBitBtn;
    EDT_DATE: TTntDateTimePicker;
    maintenance: TTntTabSheet;
    TntGroupBox4: TTntGroupBox;
    TntLabel3: TTntLabel;
    TntLabel4: TTntLabel;
    TCB_DEPT: TTntComboBox;
    tbb_search: TTntBitBtn;
    Tbb_reset: TTntBitBtn;
    TEDT_DATE: TTntDateTimePicker;
    TntPanel1: TTntPanel;
    TntPanel2: TTntPanel;
    TntPanel7: TTntPanel;
    TntPanel8: TTntPanel;
    TntButton1: TTntButton;
    TntButton2: TTntButton;
    TntPanel9: TTntPanel;
    TntButton3: TTntButton;
    TntButton4: TTntButton;
    TntButton5: TTntButton;
    TntPanel10: TTntPanel;
    TntGroupBox3: TTntGroupBox;
    LV_bs: TTntListView;
    TntGroupBox2: TTntGroupBox;
    CLB_dtl: TTntCheckListBox;
    lb_select: TTntListBox;
    PanelAdd: TTntPanel;
    TntPanel3: TTntPanel;
    TntGroupBox6: TTntGroupBox;
    TntDBGrid1: TTntDBGrid;
    TntPanel5: TTntPanel;
    sb_Close: TTntSpeedButton;
    sb_Add: TTntSpeedButton;
    TntPanel11: TTntPanel;
    TntPanel12: TTntPanel;
    TntPanel4: TTntPanel;
    Image1: TImage;
    TntPanel6: TTntPanel;
    sb_save: TTntSpeedButton;
    DataSource1: TDataSource;
    Pmenu1: TTntPopupMenu;
    N1: TTntMenuItem;
    N5: TTntMenuItem;
    pmenu2: TTntPopupMenu;
    N2: TTntMenuItem;
    N4: TTntMenuItem;
    N3: TTntMenuItem;
    ImageList1: TImageList;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    sqlQuery1: TADOQuery;
    sqlQuery2: TADOQuery;
    sqlQuery3: TADOQuery;
    qry_check: TADOQuery;
    qry_stat: TADOQuery;
    DataSource2: TDataSource;
    ADOQuery3: TADOQuery;
    ADOStoredProc1: TADOStoredProc;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formfhrd501: TFormfhrd501;

implementation
uses
  UnitDMHrdsys,UnitHrdUtils;
{$R *.dfm}
var
  PreEmpList:Tstrings;//記錄工號選擇改變前的狀態
  dept_code:string;
procedure TFormfhrd501.FormCreate(Sender: TObject);
var
  prvArr:TPrvArr;
begin
  edt_date.date := now;
  tedt_date.Date := now;
  prvArr:=GetPrvArr(userName,'Dut03');
  if prvArr[inq] then
  begin
    privilege.Pages[0].TabVisible := true;
  end  
  else
  begin
    privilege.Pages[0].TabVisible := false;
  end;  
  {with SQLQuery1 do
  begin
    sql.Clear;
    sql.Add('select * from hrd_dept order by dept_code');
    open;
    while not eof do
    begin
      cb_dept.AddItem(fieldbyname('dept_code').Value+'-'+fieldbyname('abbr_titl').value,sender);
      Tcb_dept.AddItem(fieldbyname('dept_code').Value+'-'+fieldbyname('abbr_titl').value,sender);
      next;
    end;
  end; }
  GetDeptRange(cb_dept);
  GetDeptRange(Tcb_dept);
  if privilege.ActivePageIndex = 0 then
  begin
    clb_dtl.Color := CLSkyBlue;
    tntPanel6.Hide;
    tntPanel7.Hide;
    lb_select.Show;
    clb_dtl.Hide;
  end
  else
  begin
    lv_bs.PopupMenu := Pmenu1;
    CLb_dtl.PopupMenu := Pmenu2;
    clb_dtl.Color := CLWindow;
    tntPanel6.Show;
    tntPanel7.Show;
    lb_select.Hide;
    clb_dtl.Show;
  end;
  PreEmpList:=TStringList.Create;//初始化PreEmpList
 // InitLangInfo;
end;

end.
