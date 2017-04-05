{*************************************************************************
name�GPrtSet
author: anil
create date:2005-09-14
modify date:2005-12-14
commentate:�]�w�C�L�����榡
1.���Y�]�m:�q�{�~���j�r��F<left>�}�Y�A�h�~�����`�r����ܡF
      <center>�}�Y�A�h�~�����`�r����ܡF<right>�}�Y�A�h�~�k���`�r����ܡF
  �����]�m:�q�{�~�����`�r��F
      <center>�}�Y�A�h�~�����`�r����ܡF<right>�}�Y�A�h�~�k���`�r����ܡF
2.�եθӼҪO����ƻ���:
    ShowPrint(dataset1:TCustomADODataset;Title1:widestring;
            Footer1:widestring='';DefFlds:string='');
      Param:dataset1-���L���ƾڶ��ӷ�
            Title1-���L���������D(�t���Y��r)
            Footer1-���}��r(���Ů��q�{��ܤ����H��)
            DefFlds-�q�{�C�L�����
      Title1�MFooter1�ѼƤ��A�i�H��<br>�ӳ]�w����
*************************************************************************}
unit UnitPrtSet;

interface

uses
  Windows, Messages, SysUtils,Strutils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TntForms, StdCtrls, TntStdCtrls, CheckLst, TntCheckLst,
  ExtCtrls, TntExtCtrls, Provider, DB, DBClient,QRCtrls, ADODB,WSDLIntf,
  Grids, DBGrids,Printers,QRPrntr, QRExport, TntDBGrids, Buttons,
  TntButtons, Menus, TntMenus,QuickRpt;

type
  TFormPrtSet = class(TTntForm)
    PanelFlow: TTntPanel;
    ChkFieldList: TTntCheckListBox;
    TntPanel1: TTntPanel;
    BtnChooseAll: TTntButton;
    BtnChooseNone: TTntButton;
    BtnChooseDef: TTntButton;
    TntPanel2: TTntPanel;
    DataSource1: TDataSource;
    Panel1: TPanel;
    FontDialog1: TFontDialog;
    FontDialog2: TFontDialog;
    TntPanel3: TTntPanel;
    SaveDialog1: TSaveDialog;
    DBGrid1: TTntDBGrid;
    BtnHeadFont: TTntBitBtn;
    BtnTableFont: TTntBitBtn;
    BtnPrintSet: TTntBitBtn;
    Panel2: TPanel;
    GroupBox2: TTntGroupBox;
    GroupBox3: TTntGroupBox;
    TntPanel4: TTntPanel;
    Btn_preview: TTntBitBtn;
    Btn_Print: TTntBitBtn;
    Btn_SaveAs: TTntBitBtn;
    PrintDialog1: TPrintDialog;
    chk_group: TCheckBox;
    CobGroupFld: TTntComboBox;
    TntLabel1: TTntLabel;
    PanelTitle: TTntPanel;
    MemoTitle: TTntMemo;
    Panel3: TPanel;
    RbPort: TTntRadioButton;
    RbLand: TTntRadioButton;
    Panel4: TPanel;
    RbNoBorder: TTntRadioButton;
    RbWithBorder: TTntRadioButton;
    MemoFooter: TTntMemo;
    TntGroupBox1: TTntGroupBox;
    TntGroupBox2: TTntGroupBox;
    TntGroupBox3: TTntGroupBox;
    Panel5: TPanel;
    RbStsInfo: TTntRadioButton;
    RbMyDefine: TTntRadioButton;
    RbNoShow: TTntRadioButton;
    //define
    procedure InitLang;
    procedure SetQR;
    procedure ClearOldQR();
    procedure SetQRStyle;
    procedure SetGroupPrint;
    procedure SetQRTitle();
    procedure SetQRFooter();
    procedure SetQRField;
    //auto
    procedure Btn_PrintClick(Sender: TObject);
    procedure TntFormCreate(Sender: TObject);
    procedure BtnChooseAllClick(Sender: TObject);
    procedure BtnChooseDefClick(Sender: TObject);
    procedure BtnPrintSetClick(Sender: TObject);
    procedure BtnTableFontClick(Sender: TObject);
    procedure BtnHeadFontClick(Sender: TObject);
    procedure ClientDataSet1AfterOpen(DataSet: TDataSet);
    procedure Btn_SaveAsClick(Sender: TObject);
    procedure TntFormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure ChkFieldListClick(Sender: TObject);
    procedure RbMyDefineClick(Sender: TObject);
    procedure RbStsInfoClick(Sender: TObject);
    procedure chk_groupClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    DefPrintFlds,PrintFlds:tstrings;//�i�H�C�L���Ҧ����
    //DefPrintFlds:string;//�q�{�C�L�����
  end;

var
  FormPrtSet: TFormPrtSet;

implementation
uses
  UnitDMHrdsys,UnitHrdUtils,UnitPrtTpl;
var
  Tran_Flag:boolean;
  LangStr:Twidestrings;
{$R *.dfm}

procedure TFormPrtSet.TntFormCreate(Sender: TObject);
begin
  PrintFlds:=tstringlist.Create;
  FontDialog2.Font.Style:=[fsBold];
  FontDialog1.Font.Name:='Palatino Linotype';
  initLang;
end;

procedure TFormPrtSet.InitLang;
{*************************************************************************
TO DO:��l�ƻy��
*************************************************************************}
var
  keys:String;
begin
SetComponentLang(self);//set component language text
keys:='print,set_title,the_page_seq,page,item_num,total_num,report_date,'
  +'default_value,choose_all,choose_none,preview,choose_print_field,'
  +'head_font,table_font,set_print,v_print,h_print,set_width,saveas,'
  +'print_fld_choose,print_table_set,print_style_set';
LangStr:=GetLangWideStrs(keys);
end;

procedure TFormPrtSet.ClearOldQR;
var
  TmpFldTitle:TQRLabel;
  TmpFld:TQRDBText;
  TmpQRBand:TQRChildBand;
  i:integer;
begin
  //�M�����D�U��ܤ�r��
  TmpQRBand:=TQRChildBand(FormPrtTpl.FindComponent('QRHeadBand1'));
  if TmpQRBand<>nil then
    TmpQRBand.Free;
  //�M���즳���
  for i:=0 to PrintFlds.Count-1 do
    begin
      TmpFldTitle:=TQRLabel(FormPrtTpl.ColumnHeaderBand1.FindComponent('QRFld_'+PrintFlds.Strings[i]));
      if TmpFldTitle<>nil then
        TmpFldTitle.Free;
      TmpFld:=TQRDBText(FormPrtTpl.DetailBand1.FindComponent('QRDB_'+PrintFlds.Strings[i]));
      if TmpFld<>nil then
        TmpFld.Free;
    end;
end;    

procedure TFormPrtSet.SetQRStyle;
{*************************************************************************
TO DO:�]�m�����榡
*************************************************************************}
begin
with FormPrtTpl do
  with QuickRep1 do
  begin
    DataSet:=datasource1.DataSet;//���s�]�w�ƾڶ�
    if rbland.Checked then
      Page.Orientation:=poLandscape
    else
      Page.Orientation:=poPortrait;
    if RbWithBorder.Checked then//�����
    begin
      ColumnHeaderBand1.Frame.DrawBottom:=false;
      ColumnHeaderBand1.Frame.DrawLeft:=true;
      DetailBand1.Frame.DrawLeft:=true;
      PageFooterBand1.Frame.DrawTop:=false;
    end
    else//�L���
    begin
      ColumnHeaderBand1.Frame.DrawBottom:=true;
      ColumnHeaderBand1.Frame.DrawLeft:=false;
      DetailBand1.Frame.DrawLeft:=false;
      PageFooterBand1.Frame.DrawTop:=true;
    end;
  end;
end;

procedure TFormPrtSet.SetGroupPrint();
{*************************************************************************
TO DO:�O�_�������զC�L
*************************************************************************}
var
  TmpQRLabel:TQRLabel;
  TmpQRDBText:TQRDBText;
  TmpQRBand:TQRChildBand;
  FldName:string;  
begin
with FormPrtTpl do
  with QuickRep1 do
  begin
    if chk_group.Checked then//�������զC�L
    begin
      FldName:=PrintFlds.Strings[CobGroupFld.ItemIndex];
      TADODataset(DataSource1.DataSet).Sort:=FldName;
      QRGroup1.Expression:=QuickRep1.DataSet.Name+'.'+FldName;
      {//�έp�H��
      QRExprCount.Expression:='count';
      QRExprCount.Left:=Label_count.Left+Label_count.Width;
      QRSysCount.Left:=-300;}
      //���Y�H��
      TmpQRBand:=TQRChildBand.Create(FormPrtTpl);
      with TmpQRBand do
      begin
        Parent:=QuickRep1;
        ParentBand:=PageHeaderBand1;
        name:='QRHeadBand1';
        height:=25;
      end;
      TmpQRLabel:=TQRLabel.Create(FormPrtTpl);
      with TmpQRLabel do
      begin
        Parent:=TmpQRBand;
        Caption:=CobGroupFld.Text+':';
        top:=0;
        height:=25;
        left:=0;
        alignment:=taLeftJustify;
      end;
      TmpQRDBText:=TQRDBText.Create(FormPrtTpl);
      with TmpQRDBText do
      begin
        Parent:=TmpQRBand;
        DataSet:=QuickRep1.DataSet;
        DataField:=FldName;
        top:=0;
        height:=25;
        left:=TmpQRLabel.Width;
        Width:=ColumnHeaderBand1.Width;
        alignment:=taLeftJustify;
      end;
    end
    else//�����զC�L
    begin
      QRGroup1.Expression:='';
    end;
  end;  
end;

procedure TFormPrtSet.SetQRFooter();
{*************************************************************************
TO DO:�]�m���}
*************************************************************************}
var
  TmpQRLabel:TQRLabel;
  i,toppos:integer;
  LineStr:widestring;
begin
  for i:=0 to MemoFooter.Lines.Count+2 do
  begin//�M���즳��r
    TmpQRLabel:=TQRLabel(FormPrtTpl.FindComponent('Footer_'+inttostr(i)));
    if TmpQRLabel<>nil then
      TmpQRLabel.Free;
  end;
  if Tran_Flag then//���ɮɤ����
  begin
    FormPrtTpl.PageFooterBand1.Height:=0;
    exit;
  end;
  if RbNoShow.Checked then//�����
    FormPrtTpl.PageFooterBand1.Height:=0;
  if RbStsInfo.Checked then//�έp�H��
  begin
    with FormPrtTpl do
    begin               
      PageFooterBand1.Height:=20;
      Label_Date.Caption:=GetLangName(LangStr,'report_date')+': '+DatetimeToStr(date);
      Label_Date.Left:=2;
      Label_count.Caption:=GetLangName(LangStr,'total_num')+': '+IntToStr(QuickRep1.RecordCount);
      Label_count.Left:=(PageFooterBand1.Width-Label_count.Width) div 2;
      Label_page.Caption:=GetLangName(LangStr,'the_page_seq')+inttostr(QuickRep1.PageNumber)+GetLangName(LangStr,'page');
      Label_page.Left:=PageFooterBand1.Width-Label_page.Width-30;
    end;
  end;
  if RbMyDefine.Checked then//�۩w�q
  begin
  with FormPrtTpl do
  begin
    Label_Date.Left:=-500;
    Label_Count.Left:=-500;
    Label_Page.Left:=-500;
  end;
  toppos:=0;
  for i:=0 to MemoFooter.Lines.Count-1 do
  begin
    TmpQRLabel:=TQRLabel(FormPrtTpl.FindComponent('Footer_'+inttostr(i)));
    if TmpQRLabel=nil then
      TmpQRLabel:=TQRLabel.Create(FormPrtTpl);
    LineStr:=MemoFooter.Lines[i];
    with TmpQRLabel do
    begin
      Parent:=FormPrtTpl.PageFooterBand1;
      Name:='Footer_'+inttostr(i);
      TmpQRLabel.Caption:=LineStr;
      left:=0;
      Width:=Parent.Width;
      top:=toppos;
      height:=20;
      if AnsiStartsText('<left>',LineStr) then//�~��
      begin
        alignment:=taLeftJustify;
        delete(LineStr,1,6);
      end
      else if AnsiStartsText('<center>',LineStr) then//�~��
      begin
        alignment:=taCenter;
        delete(LineStr,1,8);
      end
      else if AnsiStartsText('<right>',LineStr) then//�~�k
      begin
        alignment:=taRightJustify;
        delete(LineStr,1,7);
      end
      else//�q�{�~��
        alignment:=taLeftJustify;
      Caption:=LineStr;
      toppos:=toppos+height;
      Parent.Height:=toppos;
    end;
  end;
  end;
end;

procedure TFormPrtSet.SetQRTitle();
{*************************************************************************
TO DO:�]�m�������Y
*************************************************************************}
var
  TmpQRLabel:TQRLabel;
  i,toppos:integer;
  LineStr:widestring;
begin
  for i:=0 to MemoTitle.Lines.Count+2 do
  begin//�M���즳��r
    TmpQRLabel:=TQRLabel(FormPrtTpl.FindComponent('Title_'+inttostr(i)));
    if TmpQRLabel<>nil then
      TmpQRLabel.Free;
  end;
  toppos:=0;
  for i:=0 to MemoTitle.Lines.Count-1 do
  begin 
    TmpQRLabel:=TQRLabel(FormPrtTpl.FindComponent('Title_'+inttostr(i)));
    if TmpQRLabel=nil then
      TmpQRLabel:=TQRLabel.Create(FormPrtTpl);
    LineStr:=MemoTitle.Lines[i];
    with TmpQRLabel do
    begin
      Parent:=FormPrtTpl.PageHeaderBand1;
      Name:='Title_'+inttostr(i);
      left:=0;
      Width:=FormPrtTpl.PageHeaderBand1.Width;
      top:=toppos;
      height:=20;
      Font.Size:=10;
      Font.Style:=[];
      if AnsiStartsText('<left>',LineStr) then//�~��
      begin
        alignment:=taLeftJustify;
        delete(LineStr,1,6);
      end
      else if AnsiStartsText('<center>',LineStr) then//�~��
      begin
        alignment:=taCenter;
        delete(LineStr,1,8);
      end
      else if AnsiStartsText('<right>',LineStr) then//�~�k
      begin
        alignment:=taRightJustify;
        delete(LineStr,1,7);
      end
      else
      begin//���D�~��
        if Tran_Flag then//���ɮɳ��~��
          alignment:=taLeftJustify
        else
          alignment:=taCenter;
        height:=25;
        Font.Size:=16;
        Font.Style:=[fsBold];
      end;
      if Tran_Flag then//���ɮɳ��~��
      begin
        alignment:=taLeftJustify;
      end;
      Caption:=LineStr;
      toppos:=toppos+height;
    end;
  end;
  FormPrtTpl.PageHeaderBand1.Height:=toppos+5;
end;

procedure TFormPrtSet.SetQRField();
{*************************************************************************
TO DO:�]�m�����ƾڪ���
*************************************************************************}
var
  TmpFldTitle:TQRLabel;
  TmpFld:TQRDBText;
  i,FldWidth,leftpos:integer;
begin
  leftpos:=0;
  //�Ыطs���
  with ChkFieldList do
    for i:=0 to Count-1 do
      if Checked[i]=true then
        begin
          //���e�׳]�m
          FldWidth:=DBGrid1.Columns[i].Width;
          {if TmpFldTitle.Width>FldWidth then
            FldWidth:=TmpFldTitle.Width+1;
          if TmpFld.Width>FldWidth then
            FldWidth:=TmpFld.Width+1;}
          if FldWidth<=40 then FldWidth:=40;
          if FldWidth>=200 then FldWidth:=200;
          //�Ы������D
          TmpFldTitle:=TQRLabel.Create(FormPrtTpl.ColumnHeaderBand1);
          with TmpFldTitle do
            begin
              TmpFldTitle.Name:='QRFld_'+PrintFlds.Strings[i];
              TmpFldTitle.Parent:=FormPrtTpl.ColumnHeaderBand1;
              Caption:=Items.Strings[i];
              AutoSize:=false;
              left:=leftpos;
              top:=0;
              Height:=Parent.Height-top;
              width:=FldWidth;
              Font:=FontDialog2.Font;
              if RbWithBorder.Checked then
              begin//�����
                Frame.DrawTop:=true;
                Frame.DrawBottom:=true;
                Frame.DrawRight:=true;
              end;
            end;
          //�Ыؼƾ�
          TmpFld:=TQRDBText.Create(FormPrtTpl.DetailBand1);
          with TmpFld do
            begin
              TmpFld.Name:='QRDB_'+PrintFlds.Strings[i];
              TmpFld.Parent:=FormPrtTpl.DetailBand1;
              AutoSize:=false;
              DataSet:=FormPrtTpl.QuickRep1.DataSet;
              DataField:=PrintFlds.Strings[i];
              top:=0;
              left:=leftpos;
              height:=Parent.Height;
              width:=FldWidth;
              if Tran_Flag then//����
                TmpFld.Alignment:=taLeftJustify
              else
                TmpFld.Alignment:=DBGrid1.Columns[i].Alignment;
              Font:=FontDialog1.Font;
              if RbWithBorder.Checked then
              begin//�����
                Frame.DrawBottom:=true;
                Frame.DrawRight:=true;
              end;
            end;
          leftpos:=leftpos+FldWidth;
        end;
end;

procedure TFormPrtSet.SetQR;
begin
  //�]�m����
  ClearOldQR();
  SetQRStyle();
  SetGroupPrint();
  SetQRTitle();
  SetQRField();
  SetQRFooter();
end;

procedure TFormPrtSet.Btn_PrintClick(Sender: TObject);
begin
 SetQR;
//���L(�w��)
if TtntButton(Sender).Name='Btn_Print' then
  begin
    if PrintDialog1.Execute then
      FormPrtTpl.QuickRep1.print;
  end
else
  FormPrtTpl.QuickRep1.Preview;
end;

procedure TFormPrtSet.BtnChooseAllClick(Sender: TObject);
{*************************************************************************
TO DO:�C�L������/������
*************************************************************************}
var
  i:integer;
begin
  for i:=0 to ChkFieldList.Count-1 do
    begin
      if TtntButton(Sender).Name='BtnChooseNone' then
        ChkFieldList.Checked[i]:=false
      else
        ChkFieldList.Checked[i]:=true;
    end;
  ChkFieldList.OnClick(Sender);
end;

procedure TFormPrtSet.BtnChooseDefClick(Sender: TObject);
{*************************************************************************
TO DO:�]�w�q�{��ܦC�L���
*************************************************************************}
var
  i,k:integer;
begin
  with ChkFieldList do
    begin
      for i:=0 to Count-1 do
        Checked[i]:=false;
      for i:=0 to DefPrintFlds.Count-1 do
        begin
          k:=PrintFlds.IndexOf(DefPrintFlds.Strings[i]);
          if k>=0 then
            Checked[k]:=true;
        end;
    end;
  ChkFieldList.OnClick(Sender);
end;

procedure TFormPrtSet.BtnPrintSetClick(Sender: TObject);
begin
  FormPrtTpl.QuickRep1.PrinterSetup;
end;

procedure TFormPrtSet.BtnTableFontClick(Sender: TObject);
begin
  FontDialog1.Execute;
end;

procedure TFormPrtSet.BtnHeadFontClick(Sender: TObject);
begin
  FontDialog2.Execute;
end;

procedure TFormPrtSet.ClientDataSet1AfterOpen(DataSet: TDataSet);
var
  i:integer;
begin
for i:=0 to ChkFieldList.Count-1 do
  with DBGrid1.Columns[i] do
    begin
      Title.Caption:=ChkFieldList.Items.Strings[i];
      Title.font:=FontDialog2.Font;
      font:=FontDialog1.Font;
    end;
end;

procedure TFormPrtSet.Btn_SaveAsClick(Sender: TObject);
var
  FileExt,tmpFileName:string;
begin
if SaveDialog1.Execute then
  begin
    Tran_Flag:=true;
    SetQR;
    Tran_Flag:=false;
    FileExt := AnsiLowerCase(ExtractFileExt(SaveDialog1.FileName));
    tmpFileName:=SaveDialog1.FileName;
    with FormPrtTpl.QuickRep1 do
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

procedure TFormPrtSet.TntFormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=caHide;
  ClearOldQR;
  PrintFlds.Clear;
  ChkFieldList.Clear;
end;

procedure TFormPrtSet.DBGrid1TitleClick(Column: TColumn);
begin
  DBGridSortByTitle(column);//�I��������Y���ܱƧǤ覡
end;

procedure TFormPrtSet.ChkFieldListClick(Sender: TObject);
var
  i:integer;
begin
  for i:=0 to ChkFieldList.Count-1 do
    begin
      if ChkFieldList.Checked[i] then
        DBGrid1.Columns[i].Visible:=true
      else
        DBGrid1.Columns[i].Visible:=false;
    end;
end;

procedure TFormPrtSet.RbMyDefineClick(Sender: TObject);
begin
  MemoFooter.Enabled:=true;
end;

procedure TFormPrtSet.RbStsInfoClick(Sender: TObject);
begin
  MemoFooter.Enabled:=false;
end;

procedure TFormPrtSet.chk_groupClick(Sender: TObject);
begin
  RbMyDefine.Checked:=true;
end;

end.