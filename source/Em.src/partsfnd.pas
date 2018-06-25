unit partsfnd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Menus, wwSpeedButton, wwDBNavigator,
  Buttons, ExtCtrls, ComCtrls, wwdblook, Db, DBTables, Wwquery, Wwdbdlg;

type
  TfmPartsFnd = class(TForm)
    patoolsbar: TPanel;
    sbexit: TSpeedButton;
    sbPrinterSetup: TSpeedButton;
    wwDBNavigator1: TwwDBNavigator;
    wwDBNavigator1First: TwwNavButton;
    wwDBNavigator1Prior: TwwNavButton;
    wwDBNavigator1Next: TwwNavButton;
    wwDBNavigator1Last: TwwNavButton;
    mmEQPInfo: TMainMenu;
    miFile: TMenuItem;
    miPrintSetUp: TMenuItem;
    N1: TMenuItem;
    miExit: TMenuItem;
    miReport: TMenuItem;
    ps_PrinterSetup: TPrinterSetupDialog;
    Panel1: TPanel;
    gbEQPStatus: TGroupBox;
    ckDiscarded: TCheckBox;
    ckRegular: TCheckBox;
    GroupBox1: TGroupBox;
    dgrPartsInfo: TwwDBGrid;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dbLKCDept: TwwDBLookupCombo;
    dbLKCParts_Type: TwwDBLookupCombo;
    sbFind: TSpeedButton;
    miPartsTypeRep: TMenuItem;
    N3: TMenuItem;
    miPartsInfoRep: TMenuItem;
    miPartsIORep: TMenuItem;
    quDepartment: TwwQuery;
    quDepartmentDEPARTMENT_CODE: TStringField;
    quDepartmentDESCRIPTION: TStringField;
    quGroup: TwwQuery;
    quGroupWORKER_GROUP: TStringField;
    quGroupDESCRIPTION: TStringField;
    quGroupSUPERVISOR: TStringField;
    quGroupSUPERVISOR_2: TStringField;
    ckNew: TCheckBox;
    Label2: TLabel;
    dbLKCGroup: TwwDBLookupCombo;
    dbLCDPrtsNo: TwwDBLookupComboDlg;
    quPartsNo: TwwQuery;
    quPartsNoPARTS_NO: TStringField;
    quPartsNoDESCRIPTION: TStringField;
    procedure dbLKCDeptEnter(Sender: TObject);
    procedure dbLKCDeptExit(Sender: TObject);
    procedure dbLKCParts_TypeEnter(Sender: TObject);
    procedure dbLKCParts_TypeExit(Sender: TObject);
    procedure dgrPartsInfoDblClick(Sender: TObject);
    procedure miPrintSetUpClick(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure sbFindClick(Sender: TObject);
    procedure miPartsTypeRepClick(Sender: TObject);
    procedure miPartsInfoRepClick(Sender: TObject);
    procedure miPartsIORepClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbLKCGroupEnter(Sender: TObject);
    procedure dbLCDPrtsNoEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmPartsFnd: TfmPartsFnd;

implementation

uses
  emdatamd, prtsfile, emmain;

{$R *.DFM}

procedure TfmPartsFnd.dbLKCDeptEnter(Sender: TObject);
begin
  with dmEMData.quDepartment do
  begin
    if not Active then Open;
  end;
end;

procedure TfmPartsFnd.dbLKCDeptExit(Sender: TObject);
begin
  with dmEMData.quDepartment do
  begin
    if Active then Close;
  end;
end;

procedure TfmPartsFnd.dbLKCParts_TypeEnter(Sender: TObject);
begin
  with dmEMData.quPartsType do
  begin
    if not Active then Open;
  end;
end;

procedure TfmPartsFnd.dbLKCParts_TypeExit(Sender: TObject);
begin
  with dmEMData.quPartsType do
  begin
    if Active then Close;
  end;
end;

procedure TfmPartsFnd.dgrPartsInfoDblClick(Sender: TObject);
begin
  if not dmEMData.quPartsFile.Active then
    Abort;
  Application.Createform(TfmPrtsFile, fmPrtsFile);
  try
    fmPrtsFile.Showmodal;
    fmPrtsFile.Release;
  except
    fmPrtsFile.Release;
  end;
end;

procedure TfmPartsFnd.miPrintSetUpClick(Sender: TObject);
begin
  ps_PrinterSetup.Execute;
end;

procedure TfmPartsFnd.miExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmPartsFnd.sbFindClick(Sender: TObject);
var
  PartsNo,
  PartsModelNo,
  PartsType,
  UsageDept,
  UsageGroup,
  PartsStatuses : String;
begin
  PartsNo := Trim(dbLCDPrtsNo.DisplayValue);
  UsageDept := Trim(dbLKCDept.DisplayValue);
  UsageGroup := Trim(dbLKCGroup.DisplayValue);
  PartsStatuses := '';
  if ckNew.Checked then
    PartsStatuses := '"N"';
  if ckRegular.Checked then
    PartsStatuses := PartsStatuses + ',"R"';
  if ckDiscarded.Checked then
    PartsStatuses := PartsStatuses + ',"D"';
  PartsStatuses := trim(PartsStatuses);
  if Pos(',', PartsStatuses) = 1 then
    Delete(PartsStatuses , 1, 1);
  with dmEMData.quPartsFile do
  begin
    if Active then Close;
    Prepare;
    with SQL do
    begin
      Clear;
      Add('Select * from PARTS_FILE');
      Add('Where PARTS_No like ');
      if Length(PartsNo) < 16 then
        Add('"' + PartsNo + '%"')
      else
        Add('"' + PartsNo + '"');
      if Length(UsageDept) > 0 then
      begin
        Add(' And USAGE_DEPT like ');
        if Length(UsageDept) < 4 then
          Add('"' + UsageDept + '%"')
        else
          Add('"' + UsageDept + '"');
      end;
      if Length(UsageGroup) > 0 then
      begin
        Add(' And USAGE_GROUP like ');
        if Length(UsageGroup) < 4 then
          Add('"' + UsageGroup + '%"')
        else
          Add('"' + UsageGroup + '"');
      end;
      if Trim(PartsStatuses) <> '' then
      begin
        Add(' And Status in ');
        Add('(' + PartsStatuses + ')');
      end;
      Add(' order by USAGE_DEPT, USAGE_GROUP, PARTS_TYPE, PARTS_NO');
    end;
    Open;
  end;
end;

procedure TfmPartsFnd.miPartsTypeRepClick(Sender: TObject);
begin
  Module := LoadLibrary('dll/emrep.dll');
  if Module > 32 then
  begin
    PFunc := GetProcAddress(Module, 'EmReport');
    TEMReport(PFunc)(wCompanyName, wUser, wPassword, wEMServer, wWPServer, 'PARTS_TYPE', 0);
  end
  else
    ShowMessage('不能調用emRep.dll');
  FreeLibrary(Module);
end;

procedure TfmPartsFnd.miPartsInfoRepClick(Sender: TObject);
begin
  Module := LoadLibrary('dll/emrep.dll');
  if Module > 32 then
  begin
    PFunc := GetProcAddress(Module, 'EmReport');
    TEMReport(PFunc)(wCompanyName, wUser, wPassword, wEMServer, wWPServer, 'PARTS_INFO', 0);
  end
  else
    ShowMessage('不能調用emRep.dll');
  FreeLibrary(Module);
end;

procedure TfmPartsFnd.miPartsIORepClick(Sender: TObject);
begin
  Module := LoadLibrary('dll/emrep.dll');
  if Module > 32 then
  begin
    PFunc := GetProcAddress(Module, 'EmReport');
    TEMReport(PFunc)(wCompanyName, wUser, wPassword, wEMServer, wWPServer, 'PRTS_IO_REC', 0);
  end
  else
    ShowMessage('不能調用emRep.dll');
  FreeLibrary(Module);
end;

procedure TfmPartsFnd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with dmEMData.quPartsFile do
  begin
    if Active then Close;
  end;
  with quDepartment do
  begin
    if Active then Close;
  end;
  with quGroup do
  begin
    if Active then Close;
  end;
  with quPartsNo do
  begin
    if Active then Close;
  end;    
end;

procedure TfmPartsFnd.FormShow(Sender: TObject);
begin
  with quDepartment do
  begin
    if not Active then Open;
  end;
end;

procedure TfmPartsFnd.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  //=====================
  Funcs[2] := 'miPartsTypeRep';
  Funcs[3] := 'miPartsInfoRep';
  Funcs[4] := 'miPartsIORep';
  Funcs[5] := 'dgrPartsInfo.OnDblClick';
  //=====================
  fmEMMain.TestProgram(Funcs );
end;

procedure TfmPartsFnd.dbLKCGroupEnter(Sender: TObject);
begin
  with quGroup do
  begin
    if Active then Close;
    with SQL do
    begin
      Clear;
      Add('Select * from Worker_Group ');
      Add(' Order by worker_group');
    end;
    Open;
  end;
end;

procedure TfmPartsFnd.dbLCDPrtsNoEnter(Sender: TObject);
begin
  with quPartsNo do
  begin
    if not Active then Open;
  end;  
end;

end.
