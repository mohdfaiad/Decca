unit ptsIOInf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, wwdblook, StdCtrls, wwSpeedButton,
  wwDBNavigator, Buttons, ExtCtrls, Menus, DBCtrls, Mask, wwdbedit,
  Wwdotdot, Wwdbcomb, db, Wwdbdlg, DBTables, Wwquery;

type
  TfmPtsIOInf = class(TForm)
    mmEQPInfo: TMainMenu;
    miFile: TMenuItem;
    miPrintSetUp: TMenuItem;
    N1: TMenuItem;
    miExit: TMenuItem;
    miInfo: TMenuItem;
    miReport: TMenuItem;
    ps_PrinterSetup: TPrinterSetupDialog;
    patoolsbar: TPanel;
    sbexit: TSpeedButton;
    sbPrinterSetup: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    gbPartsIOFlag: TGroupBox;
    ckIn: TCheckBox;
    ckOut: TCheckBox;
    dbLKCDept: TwwDBLookupCombo;
    dtpDate_ST: TDateTimePicker;
    Label3: TLabel;
    dtpDate_END: TDateTimePicker;
    dgrPartsIOInfo: TwwDBGrid;
    DBMemo1: TDBMemo;
    sbFind: TSpeedButton;
    dbLKCToDept: TwwDBLookupCombo;
    dbCBIO_Flag: TwwDBComboBox;
    dbLKCServiceMan: TwwDBLookupCombo;
    dbLCDEQP_NO: TwwDBLookupComboDlg;
    miPartsTypeRep: TMenuItem;
    miPartsIORep: TMenuItem;
    miPartsType: TMenuItem;
    quDepartment: TwwQuery;
    quDepartmentDEPARTMENT_CODE: TStringField;
    quDepartmentDESCRIPTION: TStringField;
    dnaPartsIOInfo: TDBNavigator;
    dbLCDPARTS_NO: TwwDBLookupComboDlg;
    quPartsFile: TwwQuery;
    quPartsFilePARTS_NO: TStringField;
    quPartsFileUNIT: TStringField;
    quPartsFilePARTS_QTY: TIntegerField;
    quPartsFileDESCRIPTION: TStringField;
    quPartsFileUSAGE_DEPT: TStringField;
    quGroup: TwwQuery;
    quGroupWORKER_GROUP: TStringField;
    quGroupDESCRIPTION: TStringField;
    quGroupSUPERVISOR: TStringField;
    quGroupSUPERVISOR_2: TStringField;
    Label5: TLabel;
    dbLKCGroup: TwwDBLookupCombo;
    dbLKCToGroup: TwwDBLookupCombo;
    dbLKCWorker: TwwDBLookupCombo;
    quPartsFileUSAGE_GROUP: TStringField;
    dbLCDPrtsNo: TwwDBLookupComboDlg;
    quPartsNo: TwwQuery;
    quPartsNoPARTS_NO: TStringField;
    quPartsNoDESCRIPTION: TStringField;
    procedure miPrintSetUpClick(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure sbFindClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbLKCToDeptEnter(Sender: TObject);
    procedure DBMemo1Exit(Sender: TObject);
    procedure miPartsTypeClick(Sender: TObject);
    procedure miPartsTypeRepClick(Sender: TObject);
    procedure miPartsIORepClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dgrPartsIOInfoEnter(Sender: TObject);
    procedure dgrPartsIOInfoExit(Sender: TObject);
    procedure dbLCDPARTS_NOCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure DBMemo1Enter(Sender: TObject);
    procedure dbLKCGroupEnter(Sender: TObject);
    procedure dbLKCWorkerEnter(Sender: TObject);
    procedure dbLCDPrtsNoEnter(Sender: TObject);
    procedure dgrPartsIOInfoColExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmPtsIOInf: TfmPtsIOInf;

implementation

uses emdatamd, partstyp, emmain;

{$R *.DFM}

procedure TfmPtsIOInf.miPrintSetUpClick(Sender: TObject);
begin
  ps_PrinterSetup.Execute;
end;

procedure TfmPtsIOInf.miExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmPtsIOInf.sbFindClick(Sender: TObject);
var
  PartsNo,
  IODept,
  IOGroup,
  PartsIOFlag : String;
  DateST,
  DateEnd : TDateTime;
begin
  PartsNo := Trim(dbLCDPARTS_NO.DisplayValue);
  IODept := Trim(dbLKCDept.DisplayValue);
  IOGroup := Trim(dbLKCGroup.DisplayValue);
  DateST := dtpDate_ST.Date;
  DateEnd := dtpDate_END.Date;
  PartsIOFlag := '';
  if ckIn.Checked then
    PartsIOFlag := '"I"';
  if ckOut.Checked then
    PartsIOFlag := PartsIOFlag + ',"O"';
  PartsIOFlag := trim(PartsIOFlag);
  if Pos(',', PartsIOFlag) = 1 then
    Delete(PartsIOFlag, 1, 1);
  with dmEMData.quPartsInOut do
  begin
    if Active then Close;
    Prepare;
    with SQL do
    begin
      Clear;
      Add('Select * from PARTS_IN_OUT');
      Add('Where PARTS_No like ');
      if Length(PartsNo) < 16 then
        Add('"' + PartsNo + '%"')
      else
        Add('"' + PartsNo + '"');
      if Length(IODept) > 0 then
      begin
        Add(' And TO_DEPT like ');
        if Length(IODept) < 4 then
          Add('"' + IODept + '%"')
        else
          Add('"' + IODept + '"');
      end;
      if Length(IOGroup) > 0 then
      begin
        Add(' And TO_GROUP like ');
        if Length(IOGroup) < 4 then
          Add('"' + IOGroup + '%"')
        else
          Add('"' + IOGroup + '"');
      end;
      Add(' And ((IN_OUT_DATE >= :DateST) and (IN_OUT_Date <= :DateEND)) ');
      if Trim(PartsIOFlag) <> '' then
      begin
        Add(' And IN_OUT_FLAG in ');
        Add('(' + PartsIOFlag + ')');
      end;
      Add(' order by TO_DEPT, TO_GROUP, IN_OUT_DATE, PARTS_NO');
    end;
    ParamByName('DateST').Value := DateST;
    ParamByName('DateEND').Value := DateEND;
    Open;
  end;
  with dmEMData.quPrtsIOComment do
  begin
    if not Active then Open;
  end;
end;

procedure TfmPtsIOInf.FormShow(Sender: TObject);
begin
  dtpDate_ST.Date := StrToDate(DateToStr(Now));
  dtpDate_END.Date := StrToDate(DateToStr(Now));
  with dmEMData.quEquipment do
  begin
    if Active then Close;
    with SQL do
    begin
      Clear;
      Add('Select * from EQUIPMENT ');
      Add(' Order by EQUIPMENT_NO');
    end;
    Open;
  end;
  with quDepartment do
  begin
    if not Active then Open;
  end;
  with quGroup do
  begin
    if not Active then Open;
  end;
  with dmEMData.taEmcontrol do
  begin
    if not Active then Open;
  end;
  with dmEMData.quServiceMan do
  begin
    if Active then Close;
    ParamByName('DEPARTMENT').Value := dmEMData.taEmcontrolSERV_DEPT.Value;
    Open;
  end;
end;

procedure TfmPtsIOInf.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with dmEMData.quPartsInOut do
  begin
    if Active then Close;
  end;
  with dmEMData.quPrtsIOComment do
  begin
    if Active then Close;
  end;
  with dmEMData.quEquipment do
  begin
    if Active then Close;
  end;
  with dmEMData.quServiceMan do
  begin
    if Active then Close;
  end;
  with dmEMData.taEmcontrol do
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
  with dmEMData.quWorker do
  begin
    if Active then Close;
  end;
  with quPartsNo do
  begin
    if Active then Close;
  end;  
end;

procedure TfmPtsIOInf.dbLKCToDeptEnter(Sender: TObject);
var
  wDepartment : String;
begin
  wDepartment := Trim(dmEMData.quPartsInOutTO_DEPT.Value);
  with quGroup do
  begin
    if Active then Close;
    with SQL do
    begin
      Clear;
      Add('Select * from Worker_Group ');
      if trim(wDepartment) > '' then
        Add('Where Department = ' + wDepartment);
      Add(' Order by worker_group');
    end;
    Open;
  end;
{  with dmEMData.quPartsInOut do
  begin
    if dmEMData.quPartsInOutTO_DEPT.Value <>
       dmEMData.quDepartmentDEPARTMENT_CODE.Value then
    begin
      if (State <> dsEdit) or (State <> dsInsert) then
        Edit;
      dmEMData.quPartsInOutTO_DEPT.Value :=
         dmEMData.quDepartmentDEPARTMENT_CODE.Value;
    end;
  end; }
end;

procedure TfmPtsIOInf.DBMemo1Exit(Sender: TObject);
begin
  with dmEMData.quPrtsIOComment do
  begin
    if (State = dsInsert) or (State = dsEdit) then
      Post;
  end;  
end;

procedure TfmPtsIOInf.miPartsTypeClick(Sender: TObject);
begin
  Application.Createform(TfmPrtsType, fmPrtsType);
  try
    fmPrtsType.Showmodal;
  except
    fmPrtsType.Release;
  end;
end;

procedure TfmPtsIOInf.miPartsTypeRepClick(Sender: TObject);
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

procedure TfmPtsIOInf.miPartsIORepClick(Sender: TObject);
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

procedure TfmPtsIOInf.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  //=====================
  Funcs[2] := 'miPartsType';
  Funcs[3] := 'miPartsTypeRep';
  Funcs[4] := 'miPartsIORep';
  Funcs[5] := 'dnaPartsIOInfo.nbInsert';
  Funcs[6] := 'dnaPartsIOInfo.nbDelete';
  //=====================
  fmEMMain.TestProgram( Funcs );
end;

procedure TfmPtsIOInf.dgrPartsIOInfoEnter(Sender: TObject);
begin
  with quPartsFile do
  begin
    if not Active then Open;
  end;
end;

procedure TfmPtsIOInf.dgrPartsIOInfoExit(Sender: TObject);
begin
  with quPartsFile do
  begin
    if Active then Close;
  end;
end;

procedure TfmPtsIOInf.dbLCDPARTS_NOCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  with dmEMData.quPartsInOut do
  begin
    if (State = dsEdit) or (State = dsInsert) then
    begin
      dmEMData.quPartsInOutTO_DEPT.Value := quPartsFileUSAGE_DEPT.Value;
      dmEMData.quPartsInOutTO_GROUP.Value := quPartsFileUSAGE_GROUP.Value;
      dmEMData.quPartsInOutUNIT.Value := quPartsFileUNIT.Value;
      dmEMData.quPartsInOutIN_QTY.Value := quPartsFilePARTS_QTY.Value;
    end;
  end;
end;

procedure TfmPtsIOInf.DBMemo1Enter(Sender: TObject);
begin
  with dmEMData.quPartsInOut do
  begin
    if (State = dsInsert) or (State = dsEdit) then
      Post;
  end;
end;

procedure TfmPtsIOInf.dbLKCGroupEnter(Sender: TObject);
var
  wDepartment : String;
begin
  wDepartment := Trim(dbLKCDept.DisplayValue);
  with quGroup do
  begin
    if Active then Close;
    with SQL do
    begin
      Clear;
      Add('Select * from Worker_Group ');
      if trim(wDepartment) > '' then
        Add('Where Department = ' + wDepartment);
      Add(' Order by worker_group');
    end;
    Open;
  end;
end;

procedure TfmPtsIOInf.dbLKCWorkerEnter(Sender: TObject);
var
  wDepartment,
  wGroup : String;
begin
  wDepartment := Trim(dmEMData.quPartsInOutTO_DEPT.Value);
  wGroup := Trim(dmEMData.quPartsInOutTO_GROUP.Value);
  with dmEMData.quWorker do
  begin
    if Active then Close;
    with SQL do
    begin
      Clear;
      Add('Select * from worker ');
      if trim(wDepartment) > '' then
        Add('Where (Department = ' + wDepartment + ')');
      if trim(wGroup) > '' then
        Add(' and (Worker_Group = ' + wGroup + ')');
      Add(' Order by worker_no');
    end;
    Open;
  end;
end;

procedure TfmPtsIOInf.dbLCDPrtsNoEnter(Sender: TObject);
begin
  with quPartsNo do
  begin
    if not Active then Open;
  end;  
end;

procedure TfmPtsIOInf.dgrPartsIOInfoColExit(Sender: TObject);
begin
{  with dmEMData.quPartsInOut do
  begin
    if ((State = dsEdit) or (State = dsInsert)) and
      (dgrPartsIOInfo.SelectedField.FieldName <> 'PARTS_NO') then
    begin
      if Trim(quPartsFileUSAGE_DEPT.Value) <> '' then
        dmEMData.quPartsInOutTO_DEPT.Value := quPartsFileUSAGE_DEPT.Value;
      if Trim(quPartsFileUSAGE_GROUP.Value) <> '' then
        dmEMData.quPartsInOutTO_GROUP.Value := quPartsFileUSAGE_GROUP.Value;
      dmEMData.quPartsInOutUNIT.Value := quPartsFileUNIT.Value;
      dmEMData.quPartsInOutIN_QTY.Value := quPartsFilePARTS_QTY.Value;
    end;
  end;
 }
end;

end.
