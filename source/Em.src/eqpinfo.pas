unit eqpinfo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Menus, StdCtrls, Mask, wwdbedit, ComCtrls,
  wwSpeedButton, wwDBNavigator, Grids, Wwdbigrd, Wwdbgrid, DBCtrls,
  wwdblook, Wwdbdlg, wwdbdatetimepicker, ExtDlgs, db, Wwdatsrc, DBTables,
  Wwquery;

type
  TfmEQPInfo = class(TForm)
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
    pcEquipment: TPageControl;
    tshEQP_Info: TTabSheet;
    tshEQP_PARTS: TTabSheet;
    Panel1: TPanel;
    Label3: TLabel;
    wwDBEdit1: TwwDBEdit;
    wwDBGrid1: TwwDBGrid;
    Label1: TLabel;
    dedEQP_NO: TwwDBEdit;
    dedEQP_Model: TwwDBEdit;
    drgEQP_Status: TDBRadioGroup;
    gbEQPPhoto: TGroupBox;
    gbEQPComment: TGroupBox;
    DBMemo2: TDBMemo;
    dbiEQPPicture: TDBImage;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dedCHINESE_DESC: TwwDBEdit;
    gbPurchInfo: TGroupBox;
    Label6: TLabel;
    dedMade_By: TwwDBEdit;
    Label7: TLabel;
    dDTPPurchased_Date: TwwDBDateTimePicker;
    gbLocInfo: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    dedDept_Desc: TwwDBEdit;
    btnEQPPicScale: TBitBtn;
    Label10: TLabel;
    dedLocName: TwwDBEdit;
    op_EQPPhoto: TOpenPictureDialog;
    Label11: TLabel;
    wwDBEdit8: TwwDBEdit;
    dbLKCDept: TwwDBLookupCombo;
    dbLKCEQPType: TwwDBLookupCombo;
    dbLKCPartsType: TwwDBLookupCombo;
    btnE_PartsPicScale: TBitBtn;
    Panel2: TPanel;
    gbEQPPartsPhoto: TGroupBox;
    dbiE_PartsPicture: TDBImage;
    gbE_PartsComment: TGroupBox;
    DBMemo1: TDBMemo;
    pmEQPPhoto: TPopupMenu;
    pmiEQPPhotoClear: TMenuItem;
    pmE_PartsPhoto: TPopupMenu;
    pmiE_PartsPhotoClear: TMenuItem;
    miEQPTypeRep: TMenuItem;
    N3: TMenuItem;
    miEQPInfoRep: TMenuItem;
    miEQPPrtsInfoRep: TMenuItem;
    miEQP_Type: TMenuItem;
    miParts_Type: TMenuItem;
    miPartsTypeRep: TMenuItem;
    dnaEquipment: TDBNavigator;
    dnaEQPParts: TDBNavigator;
    Label12: TLabel;
    dDTPDiscarded_Date: TwwDBDateTimePicker;
    Label13: TLabel;
    dedENGLISH_DESC: TwwDBEdit;
    Label14: TLabel;
    dDTPProduced_Date: TwwDBDateTimePicker;
    Label15: TLabel;
    dedOrigin: TwwDBEdit;
    Label16: TLabel;
    dedM_C_NO: TwwDBEdit;
    drgEQP_BOOKED: TDBRadioGroup;
    Label17: TLabel;
    Label18: TLabel;
    tshPartsIn: TTabSheet;
    Panel3: TPanel;
    Label19: TLabel;
    Label20: TLabel;
    wwDBEdit2: TwwDBEdit;
    wwDBEdit3: TwwDBEdit;
    wwDBGrid2: TwwDBGrid;
    quPartsIn: TwwQuery;
    dsPartsIn: TwwDataSource;
    quPartsInPARTS_NO: TStringField;
    quPartsInI_O_DATE: TDateTimeField;
    quPartsInUNIT: TStringField;
    quPartsInIN_QTY: TIntegerField;
    quPartsInSER_MAN: TStringField;
    quPartsInParts_Desc: TStringField;
    dnaPartsIn: TDBNavigator;
    quParts_Desc: TwwQuery;
    quParts_DescDESCRIPTION: TStringField;
    Label21: TLabel;
    dbLKCGroup: TwwDBLookupCombo;
    Label22: TLabel;
    dedGroup_Desc: TwwDBEdit;
    dbluOwnedBy: TwwDBLookupCombo;
    dbluImportedBy: TwwDBLookupCombo;
    procedure miPrintSetUpClick(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure dbiEQPPictureDblClick(Sender: TObject);
    procedure dbLKCEQPTypeEnter(Sender: TObject);
    procedure dbLKCEQPTypeExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnEQPPicScaleClick(Sender: TObject);
    procedure pcEquipmentChange(Sender: TObject);
    procedure dbLKCPartsTypeEnter(Sender: TObject);
    procedure dbLKCPartsTypeExit(Sender: TObject);
    procedure btnE_PartsPicScaleClick(Sender: TObject);
    procedure dbiE_PartsPictureDblClick(Sender: TObject);
    procedure pmiEQPPhotoClearClick(Sender: TObject);
    procedure pmiE_PartsPhotoClearClick(Sender: TObject);
    procedure gbE_PartsCommentExit(Sender: TObject);
    procedure gbEQPPartsPhotoExit(Sender: TObject);
    procedure miEQPTypeRepClick(Sender: TObject);
    procedure miEQPInfoRepClick(Sender: TObject);
    procedure miEQPPrtsInfoRepClick(Sender: TObject);
    procedure miEQP_TypeClick(Sender: TObject);
    procedure miParts_TypeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure miPartsTypeRepClick(Sender: TObject);
    procedure drgEQP_StatusChange(Sender: TObject);
    procedure quPartsInCalcFields(DataSet: TDataSet);
    procedure DBMemo2Exit(Sender: TObject);
    procedure dbiEQPPictureExit(Sender: TObject);
    procedure DBMemo1Exit(Sender: TObject);
    procedure dbiE_PartsPictureExit(Sender: TObject);
    procedure dbiEQPPictureEnter(Sender: TObject);
    procedure DBMemo2Enter(Sender: TObject);
    procedure dbiE_PartsPictureEnter(Sender: TObject);
    procedure DBMemo1Enter(Sender: TObject);
    procedure dbLKCGroupEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmEQPInfo: TfmEQPInfo;

implementation

uses
  emdatamd, picscale, emmain, eqptype, partstyp, eqpfind;

{$R *.DFM}

procedure TfmEQPInfo.miPrintSetUpClick(Sender: TObject);
begin
  ps_PrinterSetup.Execute;
end;

procedure TfmEQPInfo.miExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmEQPInfo.dbiEQPPictureDblClick(Sender: TObject);
begin
  try
    op_EQPPhoto.Execute;
    if op_EQPPhoto.Execute then
    begin
      dmEMData.quEquipment.Edit;
      dbiEQPPicture.Picture.Create.LoadFromFile(op_EQPPhoto.FileName);
    end;  
  except
    showmessage('裝載圖片失敗!');  
  end;
end;

procedure TfmEQPInfo.dbLKCEQPTypeEnter(Sender: TObject);
begin
  with dmEMData.quEQPType do
  begin
    if not Active then Open;
  end;
end;

procedure TfmEQPInfo.dbLKCEQPTypeExit(Sender: TObject);
begin
  with dmEMData.quEQPType do
  begin
    if Active then Close;
  end;
end;

procedure TfmEQPInfo.FormShow(Sender: TObject);
begin
  with dmEMData do
  begin
    with quEQPPhoto do
    begin
      if Active then Close;
      Prepare;
      Open;
    end;
    with quEQPComment do
    begin
      if Active then Close;
      Prepare;
      Open;
    end;
    with quEQPParts do
    begin
      if Active then Close;
      Prepare;
      Open;
    end;
    with quPartsIn do
    begin
      if Active then Close;
      Prepare;
      Open;
    end;
    with quE_PartsPhoto do
    begin
      if Active then Close;
      Prepare;
      Open;
    end;
    with quE_PComment do
    begin
      if Active then Close;
      Prepare;
      Open;
    end;
    with quEmCompany do
    begin
      if Active then Close;
      Prepare;
      Open;
    end;
  end;
  pcEquipment.ActivePage := tshEQP_Info;
  pcEquipmentChange(Self);
end;

procedure TfmEQPInfo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with dmEMData do
  begin
    with quEQPPhoto do
    begin
      if Active then Close;
      if Prepared then UnPrepare;
    end;
    with quEQPComment do
    begin
      if Active then Close;
      if Prepared then UnPrepare;
    end;
    with quE_PartsPhoto do
    begin
      if Active then Close;
      if Prepared then UnPrepare;
    end;
    with quE_PComment do
    begin
      if Active then Close;
      if Prepared then UnPrepare;
    end;
    with quEQPParts do
    begin
      if Active then Close;
      if Prepared then UnPrepare;
    end;
    with quEmCompany do
    begin
      if Active then Close;
      if Prepared then Unprepare;
    end;
  end;
    with quPartsIn do
    begin
      if Active then Close;
      if Prepared then UnPrepare;
    end;
end;

procedure TfmEQPInfo.btnEQPPicScaleClick(Sender: TObject);
begin
  Application.Createform(TfmPicSca, fmPicSca);
  try
    fmPicSca.dbiPhoto.DataSource := dmEMData.dsEquipment;
    fmPicSca.dnaPhoto.DataSource := dmEMData.dsEquipment;
    fmPicSca.Showmodal;
    fmPicSca.Release;
  except
    fmPicSca.Release;
  end;
end;

procedure TfmEQPInfo.pcEquipmentChange(Sender: TObject);
begin
  if pcEquipment.ActivePage = tshEQP_Info then
  begin
    dnaEquipment.Visible := True;
    dnaEQPParts.Visible := False;
    dnaPartsIn.Visible := False;
  end
  else
  if pcEquipment.ActivePage = tshEQP_PARTS then
  begin
    dnaEquipment.Visible := False;
    dnaEQPParts.Visible := True;
    dnaPartsIn.Visible := False
  end
  else
  if pcEquipment.ActivePage = tshPartsIn then
  begin
    dnaEquipment.Visible := False;
    dnaEQPParts.Visible := False;
    dnaPartsIn.Visible := True;
  end
end;

procedure TfmEQPInfo.dbLKCPartsTypeEnter(Sender: TObject);
begin
  with dmEMData.quPartsType do
  begin
    if not Active then Open;
  end;  
end;

procedure TfmEQPInfo.dbLKCPartsTypeExit(Sender: TObject);
begin
  with dmEMData.quPartsType do
  begin
    if Active then Close;
  end;  
end;

procedure TfmEQPInfo.btnE_PartsPicScaleClick(Sender: TObject);
begin
  Application.Createform(TfmPicSca, fmPicSca);
  try
    fmPicSca.dbiPhoto.DataSource := dmEMData.dsE_PartsPhoto;
    fmPicSca.dnaPhoto.DataSource := dmEMData.dsE_PartsPhoto;
    fmPicSca.Showmodal;
    fmPicSca.Release;
  except
    fmPicSca.Release;
  end;
end;

procedure TfmEQPInfo.dbiE_PartsPictureDblClick(Sender: TObject);
begin
  try
    op_EQPPhoto.Execute;
    if op_EQPPhoto.Execute then
    begin
      dmEMData.quE_PartsPhoto.Edit ;
      dbiE_PartsPicture.Picture.Create.LoadFromFile(op_EQPPhoto.FileName);
    end;
  except
    showmessage('裝載圖片失敗!');
  end;
end;

procedure TfmEQPInfo.pmiEQPPhotoClearClick(Sender: TObject);
begin
  with dmEMData.quEquipment do
  begin
    Edit;
    if MessageDlg('刪除圖片嗎?', mtConfirmation, [mbOk, mbNo], 0) = mrOk then
       FieldByName('Photo').Clear;
  end;
end;

procedure TfmEQPInfo.pmiE_PartsPhotoClearClick(Sender: TObject);
begin
  with dmEMData.quE_PartsPhoto do
  begin
    Edit;
    if MessageDlg('刪除圖片嗎?', mtConfirmation, [mbOk, mbNo], 0) = mrOk then
       FieldByName('Photo').Clear;
  end;
end;

procedure TfmEQPInfo.gbE_PartsCommentExit(Sender: TObject);
begin
{  with dmEMData.quE_PComment do
  begin
    if (State = dsInsert) or (State = dsEdit) then
      Post;
  end;  }
end;

procedure TfmEQPInfo.gbEQPPartsPhotoExit(Sender: TObject);
begin
{  with dmEMData.quE_PartsPhoto do
  begin
    if (State = dsInsert) or (State = dsEdit) then
      Post;
  end;  }
end;

procedure TfmEQPInfo.miEQPTypeRepClick(Sender: TObject);
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

procedure TfmEQPInfo.miEQPInfoRepClick(Sender: TObject);
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

procedure TfmEQPInfo.miEQPPrtsInfoRepClick(Sender: TObject);
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

procedure TfmEQPInfo.miEQP_TypeClick(Sender: TObject);
begin
  Application.Createform(TfmEQPType, fmEQPType);
  try
    fmEQPType.Showmodal;
  except
    fmEQPType.Release;
  end;
  with dmEMData.quEQPType do
  begin
    if not Active then Open;
  end;  
end;

procedure TfmEQPInfo.miParts_TypeClick(Sender: TObject);
begin
  Application.Createform(TfmPrtsType, fmPrtsType);
  try
    fmPrtsType.Showmodal;
  except
    fmPrtsType.Release;
  end;
  with dmEMData.quPartsType do
  begin
    if not Active then Open;
  end;  
end;

procedure TfmEQPInfo.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  //=====================
  Funcs[2] := 'miEQP_Type';
  Funcs[3] := 'miParts_Type';
  Funcs[4] := 'miEQPTypeRep';
  Funcs[5] := 'miPartsTypeRep';
  Funcs[6] := 'miEQPInfoRep';
  Funcs[7] := 'miEQPPrtsInfoRep';
  Funcs[8] := 'dnaEquipment.nbInsert';
  Funcs[9] := 'dnaEquipment.nbDelete';
  Funcs[10] := 'dnaEQPParts.nbInsert';
  Funcs[11] := 'dnaEQPParts.nbDelete';
  //=====================
  fmEMMain.TestProgram( Funcs );
end;

procedure TfmEQPInfo.miPartsTypeRepClick(Sender: TObject);
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

procedure TfmEQPInfo.drgEQP_StatusChange(Sender: TObject);
begin
  with dmEMData.quEquipment do
  begin
    if (State = dsEdit) or (State = dsInsert) then
    begin
      if drgEQP_Status.ItemIndex = 0 then
        dmEMData.quEquipmentDISCARDED_DATE.Clear
      else
      if drgEQP_Status.ItemIndex = 1 then
        dmEMData.quEquipmentDISCARDED_DATE.Value := StrToDate(DateToStr(Now));
    end;
  end;      
end;

procedure TfmEQPInfo.quPartsInCalcFields(DataSet: TDataSet);
begin
  with quParts_Desc do
  begin
    if Active then Close;
    ParamByName('PARTS_NO').Value := quPartsInPARTS_NO.Value;
    Open;
    if RecordCount > 0 then
      quPartsInParts_Desc.Value := quParts_DescDESCRIPTION.Value;
    Close;  
  end;
end;

procedure TfmEQPInfo.DBMemo2Exit(Sender: TObject);
begin
  with dmEMData.quEQPComment do
  begin
    if (State = dsEdit) or (State = dsInsert) then
      Post;
  end;
end;

procedure TfmEQPInfo.dbiEQPPictureExit(Sender: TObject);
begin
  with dmEMData.quEQPPhoto do
  begin
    if (State = dsEdit) or (State = dsInsert) then
      Post;
  end;
end;

procedure TfmEQPInfo.DBMemo1Exit(Sender: TObject);
begin
  with dmEMData.quE_PComment do
  begin
    if (State = dsEdit) or (State = dsInsert) then
      Post;
  end;
end;

procedure TfmEQPInfo.dbiE_PartsPictureExit(Sender: TObject);
begin
  with dmEMData.quE_PartsPhoto do
  begin
    if (State = dsEdit) or (State = dsInsert) then
      Post;
  end;
end;

procedure TfmEQPInfo.dbiEQPPictureEnter(Sender: TObject);
begin
  with dmEMData.quEquipment do
  begin
    if (State = dsEdit) or (State = dsInsert) then
      Post;
  end;
end;

procedure TfmEQPInfo.DBMemo2Enter(Sender: TObject);
begin
  with dmEMData.quEquipment do
  begin
    if (State = dsEdit) or (State = dsInsert) then
      Post;
  end;
end;

procedure TfmEQPInfo.dbiE_PartsPictureEnter(Sender: TObject);
begin
  with dmEMData.quEQPParts do
  begin
    if (State = dsEdit) or (State = dsInsert) then
      Post;
  end;
end;

procedure TfmEQPInfo.DBMemo1Enter(Sender: TObject);
begin
  with dmEMData.quEQPParts do
  begin
    if (State = dsEdit) or (State = dsInsert) then
      Post;
  end;
end;

procedure TfmEQPInfo.dbLKCGroupEnter(Sender: TObject);
var
  wDepartment : String;
begin
  wDepartment := Trim(dbLKCDept.DisplayValue);
  with fmEQPFind.quGroup do
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
