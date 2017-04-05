unit UnitDMHrdsys;

interface

uses
  SysUtils, Classes, DB,fmtbcd,ADODB,IniFiles;

type
  TDMHrdsys = class(TDataModule)
    conn: TADOConnection;
    SQLQuery1: TADOQuery;
    SQLQuery2: TADOQuery;
    SQLQuery3: TADOQuery;
    SQLQuery4: TADOQuery;
    ADOCommand1: TADOCommand;
    ADOStoredProc1: TADOStoredProc;
    ADODataSet1: TADODataSet;
    lang_Query: TADOQuery;
    qry_pub: TADOQuery;
    QryPublic: TADOQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMHrdsys: TDMHrdsys;
implementation
Uses
  UnitHrdUtils;
{$R *.dfm}

procedure TDMHrdsys.DataModuleCreate(Sender: TObject);
var
  Connstr :string ;
  FileName,S1,S2 :string;
  IniFile:TIniFile;
  //
  sDatabase, sIP: string;
begin
  FileName:={ExtractFilePath(Application.ExeName)+}'.\CONNECT.INI';
  IniFile:=TInifile.Create(FileName);
  //server := '192.168.3.10'  ;
  try
    With IniFile do
    begin
      S1:='web';
      S2:='web';
      //
      sDatabase := IniFile.ReadString('ERPHR_CONN', 'DATABASE', 'flu-erp');
      sIP := IniFile.ReadString('ERPHR_CONN', '', '192.168.7.9');
      ConnStr:='Provider=SQLOLEDB.1;Persist Security Info=False;';
      ConnStr:=ConnStr+'User ID='+S1+';Password='+S2+';';
      ConnStr:=ConnStr+'Initial Catalog='+sDatabase+';Data Source='+sIP+';';
    end;
  except
    IniFile.Free;
  end;
  conn.close;
 // Lang_conn.Close;
  conn.ConnectionString:=ConnStr ; //'Provider=SQLOLEDB.1;Password=web;Persist Security Info=True;User ID=web;Initial Catalog=vh-erp;Data Source=''' + Connstr + '''' ; //InitConnStr;//GetDBString(false,true); //clvc  InitConnStr(false,false);
 // Lang_conn.ConnectionString:=InitConnStr(true,true); //clvc  InitConnStr(true,false);
  conn.Open;
end;

end.
