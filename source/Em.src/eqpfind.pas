unit eqpfind;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, wwSpeedButton, wwDBNavigator, Buttons, ExtCtrls, Grids, Wwdbigrd,
  Wwdbgrid, StdCtrls, ComCtrls, wwdblook, Db, DBTables, Wwquery, Wwdbdlg;

type
  TfmEQPFind = class(TForm)
    patoolsbar: TPanel;
    sbexit: TSpeedButton;
    sbPrinterSetup: TSpeedButton;
    sbExplorer: TSpeedButton;
    dnaEquipment: TwwDBNavigator;
    wwDBNavigator1First: TwwNavButton;
    wwDBNavigator1Prior: TwwNavButton;
    wwDBNavigator1Next: TwwNavButton;
    wwDBNavigator1Last: TwwNavButton;
    mmEQPFind: TMainMenu;
    miFile: TMenuItem;
    miPrintSetUp: TMenuItem;
    N1: TMenuItem;
    miExit: TMenuItem;
    miReport: TMenuItem;
    ps_PrinterSetup: TPrinterSetupDialog;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dtpPur_Date: TDateTimePicker;
    gbEQPStatus: TGroupBox;
    ckNormal: TCheckBox;
    ckDiscarded: TCheckBox;
    GroupBox1: TGroupBox;
    dgrEQPFind: TwwDBGrid;
    dbLKCDept: TwwDBLookupCombo;
    dbLKCEQPType: TwwDBLookupCombo;
    miEQPTypeRep: TMenuItem;
    miEQPInfoRep: TMenuItem;
    miEQPPrtsInfoRep: TMenuItem;
    N5: TMenuItem;
    quDepartment: TwwQuery;
    quDepartmentDEPARTMENT_CODE: TStringField;
    quDepartmentDESCRIPTION: TStringField;
    miPartsTypeRep: TMenuItem;
    Label5: TLabel;
    dbLKCGroup: TwwDBLookupCombo;
    quGroup: TwwQuery;
    quGroupWORKER_GROUP: TStringField;
    quGroupDESCRIPTION: TStringField;
    quGroupSUPERVISOR: TStringField;
    quGroupSUPERVISOR_2: TStringField;
    quEQP_NO: TwwQuery;
    quEQP_NOEQUIPMENT_NO: TStringField;
    quEQP_NODESCRIPTION: TStringField;
    dbLCDEQP_NO: TwwDBLookupComboDlg;
    procedure miPrintSetUpClick(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure dgrEQPFindDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbExplorerClick(Sender: TObject);
    procedure dbLKCEQPTypeEnter(Sender: TObject);
    procedure dbLKCEQPTypeExit(Sender: TObject);
    procedure miEQPTypeRepClick(Sender: TObject);
    procedure miEQPInfoRepClick(Sender: TObject);
    procedure miEQPPrtsInfoRepClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure miPartsTypeRepClick(Sender: TObject);
    procedure dbLKCGroupEnter(Sender: TObject);
    procedure dgrEQPFindTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure dbLCDEQP_NOEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmEQPFind: TfmEQPFind;

implementation

uses emdatamd, eqpinfo, emmain;

{$R *.DFM}

procedure TfmEQPFind.miPrintSetUpClick(Sender: TObject);
begin
  ps_PrinterSetup.Execute;
end;

procedure TfmEQPFind.miExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmEQPFind.dgrEQPFindDblClick(Sender: TObject);
begin
  if not dmEMData.quEquipment.Active then
     Abort;
  Application.Createform(TfmEQPInfo, fmEQPInfo);
  try
    fmEQPInfo.Showmodal;
    fmEQPInfo.Release;
  except
    fmEQPInfo.Release;
  end;
end;

procedure TfmEQPFind.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with dmEMData.quEquipment do
  begin
    if Active then Close;
    UnPrepare;
  end;
  with dmEMData.quEQPParts do
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
  with quEQP_NO do
  begin
    if Active then Close;
  end;    
end;

procedure TfmEQPFind.sbExplorerClick(Sender: TObject);
var
  EQPNo,
  EQPType,
  LocDept,
  LocGroup,
  EQPStatuses : String;
  PurchDate: TDateTime;
begin
  EQPNo := Trim(dbLCDEQP_NO.DisplayValue);
  EQPType := Trim(dbLKCEQPType.DisplayValue);
  LocDept := trim(dbLKCDept.DisplayValue);
  LocGroup := trim(dbLKCGroup.DisplayValue);
  PurchDate := dtpPur_Date.Date;
  EQPStatuses := '';
  if ckNormal.Checked then
    EQPStatuses := '"N"';
  if ckDiscarded.Checked then
    EQPStatuses := EQPStatuses + ',"D"';
  EQPStatuses := trim(EQPStatuses);
  if Pos(',', EQPStatuses) = 1 then
    Delete(EQPStatuses , 1, 1);
  with dmEMData.quEquipment do
  begin
    if Active then Close;
    Prepare;
    with SQL do
    begin
      Clear;
      Add('Select * from EQUIPMENT');
      Add('Where EQUIPMENT_No like ');
      if Length(EQPNo) < 16 then
        Add('"' + EQPNo + '%"')
      else
        Add('"' + EQPNo + '"');
      if Length(EQPType) > 0 then
      begin
        Add(' And EQUIPMENT_TYPE like ');
        if Length(EQPType) < 4 then
          Add('"' + EQPType + '%"')
        else
          Add('"' + EQPType + '"');
      end;
      if Length(LocDept) > 0 then
      begin
        Add(' And LOC_DEPT like ');
        if Length(LocDept) < 4 then
          Add('"' + LocDept + '%"')
        else
          Add('"' + LocDept + '"');
      end;
      if Length(LocGroup) > 0 then
      begin
        Add(' And LOC_GROUP like ');
        if Length(LocGroup) < 4 then
          Add('"' + LocGroup + '%"')
        else
          Add('"' + LocGroup + '"');
      end;
      Add(' And ((Purchased_Date >= :PurchDate) Or (Purchased_Date is Null))');
      if Trim(EQPStatuses) <> '' then
      begin
        Add(' And Status in ');
        Add('(' + EQPStatuses + ')');
      end;
      Add(' order by LOC_DEPT, LOC_GROUP, EQUIPMENT_TYPE, EQUIPMENT_NO');
    end;
    ParamByName('PurchDate').Value := PurchDate;
    Open;
  end;
end;

procedure TfmEQPFind.dbLKCEQPTypeEnter(Sender: TObject);
begin
  with dmEMData.quEQPType do
  begin
    if not Active then Open;
  end;
end;

procedure TfmEQPFind.dbLKCEQPTypeExit(Sender: TObject);
begin
  with dmEMData.quEQPType do
  begin
    if Active then Close;
  end;  
end;

procedure TfmEQPFind.miEQPTypeRepClick(Sender: TObject);
begin
  Module := LoadLibrary('dll/emrep.dll');
  if Module > 32 then
  begin
    PFunc := GetProcAddress(Module, 'EmReport');
    TEMReport(PFunc)(wCompanyName, wUser, wPassword, wEMServer, wWPServer, 'EQP_TYPE', 0);
  end
  else
    ShowMessage('不能調用emRep.dll');
  FreeLibrary(Module);
end;

procedure TfmEQPFind.miEQPInfoRepClick(Sender: TObject);
begin
  Module := LoadLibrary('dll/emrep.dll');
  if Module > 32 then
  begin
    PFunc := GetProcAddress(Module, 'EmReport');
    TEMReport(PFunc)(wCompanyName, wUser, wPassword, wEMServer, wWPServer, 'EQP_INFO', 2);
  end
  else
    ShowMessage('不能調用emRep.dll');
  FreeLibrary(Module);
end;

procedure TfmEQPFind.miEQPPrtsInfoRepClick(Sender: TObject);
begin
  Module := LoadLibrary('dll/emrep.dll');
  if Module > 32 then
  begin
    PFunc := GetProcAddress(Module, 'EmReport');
    TEMReport(PFunc)(wCompanyName, wUser, wPassword, wEMServer, wWPServer, 'EQP_PARTS', 0);
  end
  else
    ShowMessage('不能調用emRep.dll');
  FreeLibrary(Module);
end;

procedure TfmEQPFind.FormShow(Sender: TObject);
begin
  with quDepartment do
  begin
    if not Active then Open;
    with SQL do
    begin
      Clear;
      Add('Select * from department ');
      Add(' Order by department_code');
    end;
    Open;
  end;
end;

procedure TfmEQPFind.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  //=====================
  Funcs[2] := 'miEQPTypeRep';
  Funcs[3] := 'miPartsTypeRep';
  Funcs[4] := 'miEQPInfoRep';
  Funcs[5] := 'miEQPPrtsInfoRep';
  Funcs[6] := 'dgrEQPFind.OnDblClick';
  //=====================
  fmEMMain.TestProgram( Funcs );
end;

procedure TfmEQPFind.miPartsTypeRepClick(Sender: TObject);
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

procedure TfmEQPFind.dbLKCGroupEnter(Sender: TObject);
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

procedure TfmEQPFind.dgrEQPFindTitleButtonClick(Sender: TObject;
  AFieldName: String);
var
  EQPNo,
  EQPType,
  LocDept,
  LocGroup,
  EQPStatuses : String;
  PurchDate: TDateTime;
begin
  EQPNo := Trim(dbLCDEQP_NO.DisplayValue);
  EQPType := Trim(dbLKCEQPType.DisplayValue);
  LocDept := trim(dbLKCDept.DisplayValue);
  LocGroup := trim(dbLKCGroup.DisplayValue);
  PurchDate := dtpPur_Date.Date;
  EQPStatuses := '';
  if ckNormal.Checked then
    EQPStatuses := '"N"';
  if ckDiscarded.Checked then
    EQPStatuses := EQPStatuses + ',"D"';
  EQPStatuses := trim(EQPStatuses);
  if Pos(',', EQPStatuses) = 1 then
    Delete(EQPStatuses , 1, 1);

  with dmEMData do
    with quEquipment do
    begin
      if ((AFieldName = 'EQUIPMENT_NO') or
         (AFieldName = 'MADE_BY') or
         (AFieldName = 'LOC_DEPT') or
         (AFieldName = 'PURCHASED_DATE')) then
      begin
        with SQL do
        begin
          Clear;
          Add('Select * from EQUIPMENT');
          Add('Where EQUIPMENT_No like ');
          if Length(trim(EQPNo)) < 16 then
            Add('"' + EQPNo + '%"')
          else
            Add('"' + EQPNo + '"');
          if Length(EQPType) > 0 then
          begin
            Add(' And EQUIPMENT_TYPE like ');
            if Length(EQPType) < 4 then
              Add('"' + EQPType + '%"')
            else
              Add('"' + EQPType + '"');
          end;
          if Length(trim(LocDept)) > 0 then
          begin
            Add(' And LOC_DEPT like ');
            if Length(LocDept) < 4 then
              Add('"' + LocDept + '%"')
            else
              Add('"' + LocDept + '"');
          end;
          if Length(trim(LocGroup)) > 0 then
          begin
            Add(' And LOC_GROUP like ');
            if Length(LocGroup) < 4 then
              Add('"' + LocGroup + '%"')
            else
              Add('"' + LocGroup + '"');
          end;
          Add(' And ((Purchased_Date >= :PurchDate) Or (Purchased_Date is Null))');
          if Trim(EQPStatuses) <> '' then
          begin
            Add(' And Status in ');
            Add('(' + EQPStatuses + ')');
          end;
          if AFieldName = 'EQUIPMENT_NO' then
            Add('  order by Equipment_No, Purchased_date')
          else
            if AFieldName = 'MADE_BY' then
              Add('  order by made_by, equipment_no')
            else
              if AFieldName = 'PURCHASE_DATE' then
                Add('  order by Purchased_date, equipment_no')
              else
                Add(' order by LOC_DEPT, LOC_GROUP, EQUIPMENT_TYPE, EQUIPMENT_NO');
        end;
        ParamByName('PurchDate').Value := PurchDate;
        Open;
      end;
    end;
end;

procedure TfmEQPFind.dbLCDEQP_NOEnter(Sender: TObject);
begin
  with quEQP_NO do
  begin
    if not Active then Open;
  end;
end;

end.
