unit ServInfo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Wwdbigrd, Wwdbgrid, wwdbdatetimepicker, wwdblook, Wwdbdlg,
  StdCtrls, DBCtrls, ExtCtrls, Mask, wwdbedit, ComCtrls, Menus, Clipbrd,
  wwSpeedButton, wwDBNavigator, Buttons, db, DBTables, Wwquery, wwDialog,
  wwidlg;

type
  TfmServInfo = class(TForm)
    patoolsbar: TPanel;
    sbexit: TSpeedButton;
    sbPrinterSetup: TSpeedButton;
    mmEQPInfo: TMainMenu;
    miFile: TMenuItem;
    miPrintSetUp: TMenuItem;
    N1: TMenuItem;
    miExit: TMenuItem;
    miInfo: TMenuItem;
    miReport: TMenuItem;
    ps_PrinterSetup: TPrinterSetupDialog;
    Panel2: TPanel;
    Label1: TLabel;
    Label12: TLabel;
    wwDBEdit2: TwwDBEdit;
    wwDBDateTimePicker3: TwwDBDateTimePicker;
    Panel1: TPanel;
    DBRadioGroup2: TDBRadioGroup;
    Panel3: TPanel;
    GroupBox5: TGroupBox;
    DBMemo2: TDBMemo;
    GroupBox2: TGroupBox;
    Label10: TLabel;
    Label8: TLabel;
    DBRadioGroup3: TDBRadioGroup;
    wwDBEdit6: TwwDBEdit;
    GroupBox4: TGroupBox;
    wwDBGrid1: TwwDBGrid;
    dbLKCServiceMan: TwwDBLookupCombo;
    dbLKCSupplier: TwwDBLookupCombo;
    pmServLine: TPopupMenu;
    pmDelete: TMenuItem;
    N6: TMenuItem;
    pmSave: TMenuItem;
    N5: TMenuItem;
    pmCancel: TMenuItem;
    pmInsert: TMenuItem;
    dbLKCServType: TwwDBLookupCombo;
    miServTypeRep: TMenuItem;
    miServType: TMenuItem;
    miServRecRep: TMenuItem;
    dnaServFile: TDBNavigator;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    Label13: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    wwDBEdit7: TwwDBEdit;
    dbLCDEQP_PARTS_ID: TwwDBLookupComboDlg;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    ddtpRequestDate: TwwDBDateTimePicker;
    dedDeptName: TwwDBEdit;
    ddtpExpDate: TwwDBDateTimePicker;
    dbLKCDept: TwwDBLookupCombo;
    quServ_Obj_ID: TwwQuery;
    miSupplierInfo: TMenuItem;
    quServ_Obj_IDOEQP_PARTS_ID: TStringField;
    quServ_Obj_IDODESCRIPTION: TStringField;
    Label3: TLabel;
    dbLKCGroup: TwwDBLookupCombo;
    dedGroupName: TwwDBEdit;
    quSupplierInfo: TwwQuery;
    quSupplierInfoSUPPLIER_NO: TStringField;
    quSupplierInfoCHINESE_NAME: TStringField;
    quSupplierInfoSTATUS: TStringField;
    quSupplierInfoENGLISH_NAME: TStringField;
    quSupplierInfoADDRESS: TMemoField;
    quSupplierInfoCONTACT_1: TStringField;
    quSupplierInfoTITLE_1: TStringField;
    quSupplierInfoTELEPHONE_1: TStringField;
    quSupplierInfoCONTACT_2: TStringField;
    quSupplierInfoTITLE_2: TStringField;
    quSupplierInfoTELEPHONE_2: TStringField;
    quSupplierInfoFAX_NO: TStringField;
    quSupplierInfoEMAIL_ADDRESS: TStringField;
    quSupplierInfoCOMMENT: TMemoField;
    dbLKCWorker: TwwDBLookupCombo;
    procedure miPrintSetUpClick(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure wwDBGrid1Enter(Sender: TObject);
    procedure wwDBGrid1Exit(Sender: TObject);
    procedure dbLKCSupplierEnter(Sender: TObject);
    procedure dbLKCSupplierExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pmDeleteClick(Sender: TObject);
    procedure pmSaveClick(Sender: TObject);
    procedure pmCancelClick(Sender: TObject);
    procedure pmInsertClick(Sender: TObject);
    procedure miServTypeRepClick(Sender: TObject);
    procedure miServTypeClick(Sender: TObject);
    procedure miServRecRepClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBRadioGroup1Change(Sender: TObject);
    procedure DBRadioGroup3Change(Sender: TObject);
    procedure miSupplierInfoClick(Sender: TObject);
    procedure DBMemo2Exit(Sender: TObject);
    procedure DBMemo2Enter(Sender: TObject);
    procedure dbLKCWorkerEnter(Sender: TObject);
    procedure dbLKCWorkerExit(Sender: TObject);
    procedure dbLKCGroupEnter(Sender: TObject);
    procedure dbLCDEQP_PARTS_IDCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dbLCDEQP_PARTS_IDDropDown(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmServInfo: TfmServInfo;

implementation

uses
  emdatamd, servtype, emmain, SrvNoFnd, suppfind, eqpfind;

{$R *.DFM}

procedure TfmServInfo.miPrintSetUpClick(Sender: TObject);
begin
  ps_PrinterSetup.Execute;
end;

procedure TfmServInfo.miExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmServInfo.wwDBGrid1Enter(Sender: TObject);
begin
  with dmEMData.quServFile do
  begin
    if (State = dsEdit) or (State = dsInsert) then
      Post;
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
  with dmEMData.quServType do
  begin
    if not Active then Open;
  end;
end;

procedure TfmServInfo.wwDBGrid1Exit(Sender: TObject);
begin
  with dmEMData.quServLine do
  begin
    if (State = dsEdit) or (State = dsInsert) then
      Post;
  end;
  with dmEMData.quServiceMan do
  begin
    if Active then Close;
  end;
  with dmEMData.quServType do
  begin
    if Active then Close;
  end;
  with dmEMData.taEmcontrol do
  begin
    if Active then Close;
  end;
end;

procedure TfmServInfo.dbLKCSupplierEnter(Sender: TObject);
begin
  with dmEMData.quSupplierInfo do
  begin
    if not Active then Open;
  end;
end;

procedure TfmServInfo.dbLKCSupplierExit(Sender: TObject);
begin
  with dmEMData.quSupplierInfo do
  begin
    if Active then Close;
  end;
end;

procedure TfmServInfo.FormShow(Sender: TObject);
begin
  with dmEMData.quSFComment do
  begin
    if Active then Close;
    Prepare;
    Open;
  end;
  with dmEMData.quServLine do
  begin
    if Active then Close;
    Prepare;
    Open;
  end;
  with quSupplierInfo do
  begin
    if not Active then Open;
  end;
end;

procedure TfmServInfo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with dmEMData.quSFComment do
  begin
    if Active then Close;
    UnPrepare;
  end;
  with dmEMData.quServLine do
  begin
    if Active then Close;
    UnPrepare;
  end;
  with quSupplierInfo do
  begin
    if Active then Close;
  end;
end;

procedure TfmServInfo.pmDeleteClick(Sender: TObject);
begin
  with dmEMData.quServLine do
  begin
    if RecordCount > 0 then
      Delete;
  end;

end;

procedure TfmServInfo.pmSaveClick(Sender: TObject);
begin
  with dmEMData.quServLine do
  begin
    if (state = dsEdit) or
       (state = dsInsert) then
      Post;
  end;
end;

procedure TfmServInfo.pmCancelClick(Sender: TObject);
begin
  with dmEMData.quServLine do
  begin
    if (state = dsEdit) or
       (state = dsInsert) then
      Cancel;
  end;
end;

procedure TfmServInfo.pmInsertClick(Sender: TObject);
begin
  dmEMData.quServLine.Insert;
end;

procedure TfmServInfo.miServTypeRepClick(Sender: TObject);
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

procedure TfmServInfo.miServTypeClick(Sender: TObject);
begin
  Application.Createform(TfmServType, fmServType);
  try
    fmServType.Showmodal;
  except
    fmServType.Release;
  end;
  with dmEMData.quServType do
  begin
    if not Active then Open;
  end;  
end;

procedure TfmServInfo.miServRecRepClick(Sender: TObject);
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

procedure TfmServInfo.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  //=====================
  Funcs[2] := 'miServType';
  Funcs[3] := 'miSupplierInfo';
  Funcs[4] := 'miServTypeRep';
  Funcs[5] := 'miServRecRep';
  Funcs[6] := 'dnaServFile.nbInsert';
  Funcs[7] := 'dnaServFile.nbDelete';
  Funcs[8] := 'pmInsert';
  Funcs[9] := 'pmDelete';
  Funcs[10] := 'pmSave';
  //=====================
  fmEMMain.TestProgram( Funcs );
end;

procedure TfmServInfo.DBRadioGroup1Change(Sender: TObject);
begin
  with dmEMData.quServFile do
  begin
    if (State = dsEdit) or (State = dsInsert) then
    begin
      dmEMData.quServFilePARTS_EQUIP_ID.Clear;
      dmEMData.quServFileSERV_OBJ_DESC.Clear;
    end;  
  end;    
end;

procedure TfmServInfo.DBRadioGroup3Change(Sender: TObject);
begin
  with dmEMData.quServFile do
  begin
    if (State = dsEdit) or (State = dsInsert) then
    begin
      dmEMData.quServFileSUPPLIER_NO.Clear;
      dmEMData.quServFileSUPPLIER_DESC.Clear;
    end;
  end;
end;

procedure TfmServInfo.miSupplierInfoClick(Sender: TObject);
begin
  Application.Createform(TfmSuppFind, fmSuppFind);
  try
    fmSuppFind.Showmodal;
    fmSuppFind.Release;
  except
    fmSuppFind.Release;
  end;
end;

procedure TfmServInfo.DBMemo2Exit(Sender: TObject);
begin
  with dmEMData.quSFComment do
  begin
    if (State = dsEdit) or (State = dsInsert) then
      Post;
  end;
end;

procedure TfmServInfo.DBMemo2Enter(Sender: TObject);
begin
  with dmEMData.quServFile do
  begin
    if (State = dsEdit) or (State = dsInsert) then
      Post;
  end;
end;

procedure TfmServInfo.dbLKCWorkerEnter(Sender: TObject);
var
  wDepartment,
  wGroup : String;
begin
  wDepartment := Trim(dbLKCDept.DisplayValue);
  wGroup := Trim(dbLKCGroup.DisplayValue);
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

procedure TfmServInfo.dbLKCWorkerExit(Sender: TObject);
begin
  with dmEMData.quWorker do
  begin
    if Active then Close;
  end;
end;

procedure TfmServInfo.dbLKCGroupEnter(Sender: TObject);
var
  wDepartment : String;
begin
  wDepartment := Trim(dbLKCDept.DisplayValue);
  with fmSrvNoFnd.quGroup do
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

procedure TfmServInfo.dbLCDEQP_PARTS_IDCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  with quServ_Obj_ID do
  begin
    if Active then Close;
  end;
end;

procedure TfmServInfo.dbLCDEQP_PARTS_IDDropDown(Sender: TObject);
begin
  with quServ_Obj_ID do
  begin
    if Active then Close;
    ParamByName('DEPT_NO').Value := Trim(dmEMData.quServFileREQUEST_DEPT.Value);
    ParamByName('OBJ_FLAG').Value := dmEMData.quServFileSERV_EQP_TYPE.Value;
    Open;
  end;
end;

end.
