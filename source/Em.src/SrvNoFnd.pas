unit SrvNoFnd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Wwdbigrd, Wwdbgrid, wwdblook, StdCtrls, Menus, wwSpeedButton,
  wwDBNavigator, Buttons, ExtCtrls, ComCtrls, Clipbrd, Db, DBTables,
  Wwquery, Wwdbdlg;

type
  TfmSrvNoFnd = class(TForm)
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
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    gbServFileStatus: TGroupBox;
    ckVoided: TCheckBox;
    ckWorking: TCheckBox;
    dbLKCDept: TwwDBLookupCombo;
    GroupBox1: TGroupBox;
    dgrServRecInfo: TwwDBGrid;
    dtpCreateDateST: TDateTimePicker;
    Label3: TLabel;
    sbExplorer: TSpeedButton;
    Label5: TLabel;
    dtpCreateDateEND: TDateTimePicker;
    miServTypeRep: TMenuItem;
    miServRecRep: TMenuItem;
    quDepartment: TwwQuery;
    quDepartmentDEPARTMENT_CODE: TStringField;
    quDepartmentDESCRIPTION: TStringField;
    quGroup: TwwQuery;
    quGroupWORKER_GROUP: TStringField;
    quGroupDESCRIPTION: TStringField;
    quGroupSUPERVISOR: TStringField;
    quGroupSUPERVISOR_2: TStringField;
    Label6: TLabel;
    dbLKCGroup: TwwDBLookupCombo;
    panel2: TPanel;
    gbServObjType: TGroupBox;
    ckOthers: TCheckBox;
    ckParts: TCheckBox;
    ckEquipment: TCheckBox;
    ckCompleted: TCheckBox;
    dbLCDServNo: TwwDBLookupComboDlg;
    dbLCDE_P_NO: TwwDBLookupComboDlg;
    quServInfo: TwwQuery;
    quServInfoSERVICE_NO: TStringField;
    quServInfoSERV_EQP_TYPE: TStringField;
    quServInfoPARTS_EQUIP_ID: TStringField;
    quServInfoSTATUS: TStringField;
    procedure dgrServRecInfoDblClick(Sender: TObject);
    procedure miPrintSetUpClick(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure sbExplorerClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure miServRecRepClick(Sender: TObject);
    procedure miServTypeRepClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbLKCGroupEnter(Sender: TObject);
    procedure dbLCDServNoEnter(Sender: TObject);
    procedure dbLCDServNoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSrvNoFnd: TfmSrvNoFnd;

implementation

uses emdatamd, ServInfo, emmain;

{$R *.DFM}

procedure TfmSrvNoFnd.dgrServRecInfoDblClick(Sender: TObject);
begin
  if not dmEMData.quServFile.Active then
    Abort;
  Application.Createform(TfmServInfo, fmServInfo);
  try
    fmServInfo.Showmodal;
    fmServInfo.Release;
  except
    fmServInfo.Release;
  end;
end;

procedure TfmSrvNoFnd.miPrintSetUpClick(Sender: TObject);
begin
  ps_PrinterSetup.Execute;
end;

procedure TfmSrvNoFnd.miExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmSrvNoFnd.sbExplorerClick(Sender: TObject);
var
  ServNo,
  EQP_PRTS_ID,
  Request_Dept,
  Request_Group,
  SFStatuses,
  SFServObjTypes : String;
  CreateDateST,
  CreateDateEND : TDateTime;
begin
  ServNo := Trim(dbLCDServNo.DisplayValue);
  EQP_PRTS_ID := Trim(dbLCDE_P_NO.DisplayValue);
  CreateDateST := dtpCreateDateST.Date;
  CreateDateEND := dtpCreateDateEND.Date;
  Request_Dept := trim(dbLKCDept.DisplayValue);
  Request_Group := Trim(dbLKCGroup.DisplayValue);
  SFStatuses := '';
  if ckWorking.Checked then
    SFStatuses := '"W"';
  if ckCompleted.Checked then
    SFStatuses := SFStatuses + ',"C"';
  if ckVoided.Checked then
    SFStatuses := SFStatuses + ',"V"';
  SFStatuses := trim(SFStatuses);
  if Pos(',', SFStatuses) = 1 then
    Delete(SFStatuses, 1, 1);
  SFServObjTypes := '';
  if ckEquipment.Checked then
    SFServObjTypes := '"E"';
  if ckParts.Checked then
    SFServObjTypes := SFServObjTypes + ',"P"';
  if ckOthers.Checked then
    SFServObjTypes := SFServObjTypes + ',"O"';
  if Pos(',', SFServObjTypes) = 1 then
    Delete(SFServObjTypes, 1, 1);
  with dmEMData.quServFile do
  begin
    if Active then Close;
    Prepare;
    with SQL do
    begin
      Clear;
      Add('Select * from SERVICE_FILE');
      Add('Where Service_No like ');
      if Length(ServNo) < 10 then
        Add('"' + ServNo + '%"')
      else
        Add('"' + ServNo + '"');
      if Length(EQP_PRTS_ID) > 0 then
      begin
        Add(' And PARTS_EQUIP_ID like ');
        if Length(EQP_PRTS_ID) < 16 then
          Add('"' + EQP_PRTS_ID + '%"')
        else
          Add('"' + EQP_PRTS_ID + '"');
      end;
      if Length(Request_Dept) > 0 then
      begin
        Add(' And REQUEST_DEPT like ');
        if Length(Request_Dept) < 4 then
          Add('"' + Request_Dept + '%"')
        else
          Add('"' + Request_Dept + '"');
      end;
      if Length(Request_Group) > 0 then
      begin
        Add(' And REQUEST_GROUP like ');
        if Length(Request_Group) < 4 then
          Add('"' + Request_Group + '%"')
        else
          Add('"' + Request_Group + '"');
      end;
      Add(' And ((CREATE_Date >= :CreateDateST) and (CREATE_Date <= :CreateDateEND))');
      if Trim(SFStatuses) <> '' then
      begin
        Add('  And Status in ');
        Add(' (' + SFStatuses + ')');
      end;
      if Trim(SFServObjTypes) <> '' then
      begin
        Add(' And SERV_EQP_TYPE in ');
        Add(' (' + SFServObjTypes + ')');
      end;
      Add(' order by Service_No');
    end;
    ParamByName('CreateDateST').Value := CreateDateST;
    ParamByName('CreateDateEND').Value := CreateDateEND;
    Open;
  end;
end;

procedure TfmSrvNoFnd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with dmEMData.quServFile do
  begin
    if Active then Close;
    UnPrepare;
  end;
  with quDepartment do
  begin
    if Active then Close;
  end;
  with quGroup do
  begin
    if Active then Close;
  end;    
end;

procedure TfmSrvNoFnd.miServRecRepClick(Sender: TObject);
begin
  Module := LoadLibrary('dll/emrep.dll');
  if Module > 32 then
  begin
    PFunc := GetProcAddress(Module, 'EmReport');
    TEMReport(PFunc)(wCompanyName, wUser, wPassword, wEMServer, wWPServer, 'SERV_REC', 0);
  end
  else
    ShowMessage('不能調用emRep.dll');
  FreeLibrary(Module);
end;

procedure TfmSrvNoFnd.miServTypeRepClick(Sender: TObject);
begin
  Module := LoadLibrary('dll/emrep.dll');
  if Module > 32 then
  begin
    PFunc := GetProcAddress(Module, 'EmReport');
    TEMReport(PFunc)(wCompanyName, wUser, wPassword, wEMServer, wWPServer, 'SERVICE_TYPE', 0);
  end
  else
    ShowMessage('不能調用emRep.dll');
  FreeLibrary(Module);
end;

procedure TfmSrvNoFnd.FormShow(Sender: TObject);
begin
  dtpCreateDateST.Date := StrToDate(DateToStr(Now));
  dtpCreateDateEND.Date := StrToDate(DateToStr(Now));
  with quDepartment do
  begin
    if not Active then Open;
  end;
  with quGroup do
  begin
    if not Active then Open;
  end;
end;

procedure TfmSrvNoFnd.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  //=====================
  Funcs[2] := 'miServTypeRep';
  Funcs[3] := 'miServRecRep';
  Funcs[4] := 'dgrServRecInfo.OnDblClick';
  //=====================
  fmEMMain.TestProgram(Funcs);
end;

procedure TfmSrvNoFnd.dbLKCGroupEnter(Sender: TObject);
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

procedure TfmSrvNoFnd.dbLCDServNoEnter(Sender: TObject);
begin
  with quServInfo do
  begin
    if not Active then Open;
  end;  
end;

procedure TfmSrvNoFnd.dbLCDServNoExit(Sender: TObject);
begin
  with quServInfo do
  begin
    if Active then Close;
  end;
end;
  
end.
