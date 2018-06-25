unit prtsfile;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtDlgs, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons,
  wwdbdatetimepicker, wwdblook, Wwdbdlg, DBCtrls, ExtCtrls, Mask, wwdbedit,
  ComCtrls, Menus, wwSpeedButton, wwDBNavigator, Db, Wwdatsrc, DBTables,
  Wwquery;

type
  TfmPrtsFile = class(TForm)
    patoolsbar: TPanel;
    sbexit: TSpeedButton;
    sbPrinterSetup: TSpeedButton;
    dnaPartsIO: TwwDBNavigator;
    wwDBNavigator1First: TwwNavButton;
    wwDBNavigator1Prior: TwwNavButton;
    wwDBNavigator1Next: TwwNavButton;
    wwDBNavigator1Last: TwwNavButton;
    mmEQPInfo: TMainMenu;
    miFile: TMenuItem;
    miPrintSetUp: TMenuItem;
    N1: TMenuItem;
    miExit: TMenuItem;
    miInfo: TMenuItem;
    miReport: TMenuItem;
    ps_PrinterSetup: TPrinterSetupDialog;
    pcPartsFile: TPageControl;
    tshParts_Info: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dedParts_No: TwwDBEdit;
    dedModel_No: TwwDBEdit;
    drgStatus: TDBRadioGroup;
    gbPhoto: TGroupBox;
    dbiPicture: TDBImage;
    gbComment: TGroupBox;
    DBMemo2: TDBMemo;
    dedParts_Desc: TwwDBEdit;
    gbUsageDept: TGroupBox;
    Label8: TLabel;
    Label10: TLabel;
    dedDept_Desc: TwwDBEdit;
    btnPicScale: TBitBtn;
    tshPARTS_IN_OUT: TTabSheet;
    Panel1: TPanel;
    Label3: TLabel;
    Label11: TLabel;
    wwDBEdit1: TwwDBEdit;
    wwDBEdit8: TwwDBEdit;
    wwDBGrid1: TwwDBGrid;
    op_PartsPhoto: TOpenPictureDialog;
    Label6: TLabel;
    dedUnit: TwwDBEdit;
    Label7: TLabel;
    dedParts_Qty: TwwDBEdit;
    dbLKCDept: TwwDBLookupCombo;
    dbLKCPartsType: TwwDBLookupCombo;
    quPartsInOut: TwwQuery;
    quPartsInOutPARTS_NO: TStringField;
    quPartsInOutEQUIPMENT_NO: TStringField;
    quPartsInOutIN_OUT_DATE: TDateTimeField;
    quPartsInOutIN_OUT_FLAG: TStringField;
    quPartsInOutUNIT: TStringField;
    quPartsInOutIN_QTY: TIntegerField;
    quPartsInOutSER_MAN: TStringField;
    quPartsInOutWORKER: TStringField;
    quPartsInOutTO_DEPT: TStringField;
    dsPartsInOut: TwwDataSource;
    quPartsInOutDeptName: TStringField;
    miPartsTypeRep: TMenuItem;
    N3: TMenuItem;
    miPartsInfoRep: TMenuItem;
    miPartsIORep: TMenuItem;
    miPartsType: TMenuItem;
    dnaPartsFile: TDBNavigator;
    Label21: TLabel;
    dbLKCGroup: TwwDBLookupCombo;
    Label22: TLabel;
    dedGroup_Desc: TwwDBEdit;
    gbFlagDate: TGroupBox;
    Label12: TLabel;
    Label9: TLabel;
    ddtpDiscarded_Date: TwwDBDateTimePicker;
    ddtpPurchased_Date: TwwDBDateTimePicker;
    Label13: TLabel;
    ddtpStart_Date: TwwDBDateTimePicker;
    procedure miPrintSetUpClick(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure dbLKCDeptEnter(Sender: TObject);
    procedure dbLKCDeptExit(Sender: TObject);
    procedure dbiPictureDblClick(Sender: TObject);
    procedure btnPicScaleClick(Sender: TObject);
    procedure dbLKCPartsTypeEnter(Sender: TObject);
    procedure dbLKCPartsTypeExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure quPartsInOutCalcFields(DataSet: TDataSet);
    procedure pcPartsFileChange(Sender: TObject);
    procedure miPartsTypeRepClick(Sender: TObject);
    procedure miPartsInfoRepClick(Sender: TObject);
    procedure miPartsIORepClick(Sender: TObject);
    procedure miPartsTypeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure drgStatusChange(Sender: TObject);
    procedure DBMemo2Exit(Sender: TObject);
    procedure dbiPictureExit(Sender: TObject);
    procedure dbiPictureEnter(Sender: TObject);
    procedure DBMemo2Enter(Sender: TObject);
    procedure dbLKCGroupEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmPrtsFile: TfmPrtsFile;

implementation

uses
  emdatamd, picscale, partstyp, emmain, partsfnd;

{$R *.DFM}

procedure TfmPrtsFile.miPrintSetUpClick(Sender: TObject);
begin
  ps_PrinterSetup.Execute;
end;

procedure TfmPrtsFile.miExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmPrtsFile.dbLKCDeptEnter(Sender: TObject);
begin
  with dmEMData.quDepartment do
  begin
    if not Active then Open;
  end;
end;

procedure TfmPrtsFile.dbLKCDeptExit(Sender: TObject);
begin
  with dmEMData.quDepartment do
  begin
    if Active then Close;
  end;
end;

procedure TfmPrtsFile.dbiPictureDblClick(Sender: TObject);
begin
  try
    op_PartsPhoto.Execute;
    if op_PartsPhoto.Execute then
    begin
      dmEMData.quPartsFile.Edit;
      dbiPicture.Picture.Create.LoadFromFile(op_PartsPhoto.FileName);
    end;
  except
    showmessage('裝載圖片失敗!');
  end;
end;

procedure TfmPrtsFile.btnPicScaleClick(Sender: TObject);
begin
  Application.Createform(TfmPicSca, fmPicSca);
  try
    fmPicSca.dbiPhoto.DataSource := dmEMData.dsPartsFile;
    fmPicSca.dnaPhoto.DataSource := dmEMData.dsPartsFile;
    fmPicSca.Showmodal;
    fmPicSca.Release;
  except
    fmPicSca.Release;
  end;
end;

procedure TfmPrtsFile.dbLKCPartsTypeEnter(Sender: TObject);
begin
  with dmEMData.quPartsType do
  begin
    if not Active then Open;
  end;  
end;

procedure TfmPrtsFile.dbLKCPartsTypeExit(Sender: TObject);
begin
  with dmEMData.quPartsType do
  begin
    if Active then Close;
  end;  
end;

procedure TfmPrtsFile.FormShow(Sender: TObject);
begin
  pcPartsFile.ActivePage := tshParts_Info;
  pcPartsFileChange(Self);
  with dmEMData.quPFPhoto do
  begin
    if Active then Close;
    Prepare;
    Open;
  end;
  with dmEMData.quPFComment do
  begin
    if Active then Close;
    Prepare;
    Open;
  end;
  with quPartsInOut do
  begin
    if not Active then Open;
  end;
end;

procedure TfmPrtsFile.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with dmEMData.quPFPhoto do
  begin
    if Active then Close;
    UnPrepare;
  end;
  with dmEMData.quPFComment do
  begin
    if Active then Close;
    UnPrepare;
  end;
  with quPartsInOut do
  begin
    if Active then Close;
  end;
end;

procedure TfmPrtsFile.quPartsInOutCalcFields(DataSet: TDataSet);
begin
  with dmEMData.quDepartment do
  begin
    if Active then Close;
    with SQL do
    begin
      Clear;
      Add('Select * from department ');
      Add('Where Department_Code = :DepartmentCode');
    end;
    ParamByName('DepartmentCode').Value := quPartsInOutTO_DEPT.Value;
    Open;
    if RecordCount > 0 then
      quPartsInOutDeptName.Value := dmEMData.quDepartmentDESCRIPTION.Value;
    Close;
  end;
end;

procedure TfmPrtsFile.pcPartsFileChange(Sender: TObject);
begin
  if pcPartsFile.ActivePage = tshParts_Info then
  begin
    dnaPartsFile.Visible := True;
    dnaPartsIO.Visible := False;
  end
  else
  if pcPartsFile.ActivePage = tshPARTS_IN_OUT then
  begin
    dnaPartsFile.Visible := False;
    dnaPartsIO.Visible := True;
  end;
end;

procedure TfmPrtsFile.miPartsTypeRepClick(Sender: TObject);
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

procedure TfmPrtsFile.miPartsInfoRepClick(Sender: TObject);
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

procedure TfmPrtsFile.miPartsIORepClick(Sender: TObject);
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

procedure TfmPrtsFile.miPartsTypeClick(Sender: TObject);
begin
  Application.Createform(TfmPrtsType, fmPrtsType);
  try
    fmPrtsType.Showmodal;
  except
    fmPrtsType.Release;
  end;
end;

procedure TfmPrtsFile.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  //=====================
  Funcs[2] := 'miPartsType';
  Funcs[3] := 'miPartsTypeRep';
  Funcs[4] := 'miPartsInfoRep';
  Funcs[5] := 'miPartsIORep';
  Funcs[6] := 'dnaPartsFile.nbInsert';
  Funcs[7] := 'dnaPartsFile.nbDelete';
  //=====================
  fmEMMain.TestProgram( Funcs );
end;

procedure TfmPrtsFile.drgStatusChange(Sender: TObject);
begin
  with dmEMData.quPartsFile do
  begin
    if (State = dsEdit) or (State = dsInsert) then
    begin
      if drgStatus.ItemIndex = 0 then
        dmEMData.quPartsFileDISCARDED_DATE.Clear
      else
      if drgStatus.ItemIndex = 1 then
        dmEMData.quPartsFileDISCARDED_DATE.Value := StrToDate(DateToStr(Now));
    end;
  end;    
end;

procedure TfmPrtsFile.DBMemo2Exit(Sender: TObject);
begin
  with dmEMData.quPFComment do
  begin
    if (State = dsEdit) or (State = dsInsert) then
      Post;
  end;
end;

procedure TfmPrtsFile.dbiPictureExit(Sender: TObject);
begin
  with dmEMData.quPFPhoto do
  begin
    if (State = dsEdit) or (State = dsInsert) then
      Post;
  end;
end;

procedure TfmPrtsFile.dbiPictureEnter(Sender: TObject);
begin
  with dmEMData.quPartsFile do
  begin
    if (State = dsEdit) or (State = dsInsert) then
      Post;
  end;
end;

procedure TfmPrtsFile.DBMemo2Enter(Sender: TObject);
begin
  with dmEMData.quEQPParts do
  begin
    if (State = dsEdit) or (State = dsInsert) then
      Post;
  end;
end;

procedure TfmPrtsFile.dbLKCGroupEnter(Sender: TObject);
var
  wDepartment : String;
begin
  wDepartment := Trim(dbLKCDept.DisplayValue);
  with fmPartsFnd.quGroup do
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

end.
