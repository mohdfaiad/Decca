unit IcMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Buttons, ExtCtrls, StdCtrls;

type
  TfmICMain = class(TForm)
    paWorker: TPanel;
    sbExit: TSpeedButton;
    sbHelp: TSpeedButton;
    sbPrintSetup: TSpeedButton;
    mmICMain: TMainMenu;
    N1: TMenuItem;
    mmPrtSetup: TMenuItem;
    N5: TMenuItem;
    mmExit: TMenuItem;
    N2: TMenuItem;
    mmDept: TMenuItem;
    mmProfitCtr: TMenuItem;
    mmOccuption: TMenuItem;
    N3: TMenuItem;
    mmShift: TMenuItem;
    mmPayCode: TMenuItem;
    N12: TMenuItem;
    N6: TMenuItem;
    mmControl: TMenuItem;
    U1: TMenuItem;
    t1: TMenuItem;
    d1: TMenuItem;
    N14: TMenuItem;
    H2: TMenuItem;
    ps_PrintSetup: TPrinterSetupDialog;
    btItem: TButton;
    btKit: TButton;
    bt: TButton;
    btHist: TButton;
    N4: TMenuItem;
    N7: TMenuItem;
    btEditHist: TButton;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N13: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    u2: TMenuItem;
    mmBalance: TMenuItem;
    u3: TMenuItem;
    N22: TMenuItem;
    Bz1: TMenuItem;
    procedure sbPrintSetupClick(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
    procedure mmControlClick(Sender: TObject);
    procedure mmExitClick(Sender: TObject);
    procedure mmProfitCtrClick(Sender: TObject);
    procedure mmDeptClick(Sender: TObject);
    procedure mmShiftClick(Sender: TObject);
    procedure mmPayCodeClick(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure mmOccuptionClick(Sender: TObject);
    procedure btKitClick(Sender: TObject);
    procedure btClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btItemClick(Sender: TObject);
    procedure btHistClick(Sender: TObject);
    procedure btEditHistClick(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure u2Click(Sender: TObject);
    procedure mmBalanceClick(Sender: TObject);
    procedure u3Click(Sender: TObject);
    procedure Bz1Click(Sender: TObject);
  private
    { Private declarations }
  public

    { Public declarations }
  end;

var
  fmICMain: TfmICMain;
  wSiteNo : String;
  wActiveSecurity,
  wStr ,
  wPassword,
  wCompanyID,
  wCompanyName,
  wUser,
  wServer : String;
  Funcs : array [1..99] of String;

implementation
uses IcCtr,IcData, ProfitCtr, WareHouse, ItemCatFil, ItemSubCat, SelAlter,
  UserWhs, ItemFil, KitFil, IcTrxFil, EditHist, Hist, rpWhs, rpUserWhs,
  RpItemFil, RpItemCat, RpSubCat, RpStckStts, RpAlter, rpLotFil, PrjRpDlg;

{$R *.DFM}

type
  TICReport = function(pUser : String; pPassword : String; pServer : String; RpType : String) : Boolean;

var
  PFunc : TFarProc;
  Module : THandle;


procedure TfmICMain.sbPrintSetupClick(Sender: TObject);
begin
  ps_PrintSetup.Execute;
end;

procedure TfmICMain.sbExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmICMain.mmControlClick(Sender: TObject);
begin
  Application.CreateForm(TfmICCtr,fmIcCtr);
  try
    fmICCtr.ShowModal;
  finally
    fmICCtr.Release;
  end;
end;

procedure TfmICMain.mmExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmICMain.mmProfitCtrClick(Sender: TObject);
begin
  Application.CreateForm(TfmProfitCtr,fmProfitCtr);
  try
    fmProfitCtr.ShowModal;
  finally
    fmProfitCtr.Release;
  end;
end;

procedure TfmICMain.mmDeptClick(Sender: TObject);
begin
  Application.CreateForm(TfmWareHouse,fmWareHouse);
  try
    fmWareHouse.ShowModal;
  finally
    fmWareHouse.Release;
  end;
end;

procedure TfmICMain.mmShiftClick(Sender: TObject);
begin
  Application.CreateForm(TfmItemCatFil,fmItemCatFil);
  try
    fmItemCatFil.ShowModal;
  finally
    fmItemCatFil.Release;
  end;
end;

procedure TfmICMain.mmPayCodeClick(Sender: TObject);
begin
  Application.CreateForm(TfmItemSub,fmItemSub);
  try
    fmItemSub.ShowModal;
  finally
    fmItemSub.Release;
  end;
end;

procedure TfmICMain.N4Click(Sender: TObject);
begin
  Application.CreateForm(TfmSelAlter,fmSelAlter);
  try
    fmSelAlter.ShowModal;
  finally
    fmSelAlter.Release;
  end;
end;

procedure TfmICMain.mmOccuptionClick(Sender: TObject);
begin
  Application.CreateForm(TfmUserWhs,fmuserWhs);
  try
    fmUserWhs.ShowModal;
  finally
    fmUserWhs.Release;
  end;
end;

procedure TfmICMain.btKitClick(Sender: TObject);
begin
  Application.CreateForm(TfmKitFil,fmKitFil);
  try
    fmKitFil.ShowModal;
  finally
    fmKitFil.Release;
  end;
end;

procedure TfmICMain.btClick(Sender: TObject);
begin
 { with dmICData.dbICData  do
  begin
    StartTransaction;
    Params.Values['USER NAME'] := 'SYSDBA';
    Params.Values['PASSWORD'] := 'masterkey';
    Connected := True;
    Open;
  end;}

  Application.CreateForm(TfmIcTrxFil,fmIcTrxFil);
  try
    fmIcTrxFil.ShowModal;
  finally
    fmIcTrxFil.Release;
  end;
end;

procedure TfmICMain.FormCreate(Sender: TObject);
begin
  wUser := dmICData.dbICData.Params.Values['USER NAME'];
  wSiteNo := '';
end;

procedure TfmICMain.btItemClick(Sender: TObject);
begin
  Application.CreateForm(TfmItemFil,fmItemFil);
  try
    fmItemFil.ShowModal;
  finally
    fmItemFil.Release;
  end;
end;

procedure TfmICMain.btHistClick(Sender: TObject);
begin
  Application.CreateForm(TfmHist, fmHist);
  try
    fmHist.ShowModal;
  finally
    fmHist.Release;
  end;
end;

procedure TfmICMain.btEditHistClick(Sender: TObject);
begin
  Application.CreateForm(TfmEditHist, fmEditHist);
  try
    fmEditHist.ShowModal;
  finally
    fmEditHist.Release;
  end;
end;

procedure TfmICMain.N9Click(Sender: TObject);
begin
  with dmICData.quWareHouse do
  begin
    if not Active then
      Open;
    Application.CreateForm(TqrWhs, qrWhs);
    try
      qrWhs.Preview;
    finally
      qrWhs.Destroy;
    end;
    Close;
  end;
end;

procedure TfmICMain.N18Click(Sender: TObject);
begin
  Application.CreateForm(TqrUserWhs, qrUserWhs);
  try
    qrUserWhs.Preview;
  finally
    qrUserWhs.Destroy;
  end;
end;

procedure TfmICMain.N10Click(Sender: TObject);
begin
   with dmICData.quItemFilRep do
    if not Active then
      Open;
  Application.CreateForm(TqrItemFil, qrItemFil);
  try
    qrItemFil.Preview;
  finally
    qrItemFil.Destroy;
  end;
  with dmICData.quItemFilRep do
    if Active then
      Close;
end;

procedure TfmICMain.N16Click(Sender: TObject);
begin
  with dmICData.quItemCatFil do
    if not Active then
      Open;
  Application.CreateForm(TqrItemCat, qrItemCat);
  try
    qrItemCat.Preview;
  finally
    qrItemCat.Destroy;
  end;
  with dmICData.quItemCatFil do
    if Active then
      Close;
end;

procedure TfmICMain.N17Click(Sender: TObject);
begin
  with dmICData.quItemSubCatFil do
    if not Active then
      Open;
  Application.CreateForm(TqrSubCat, qrSubCat);
  try
    qrSubCat.Preview;
  finally
    qrSubCat.Destroy;
  end;
  with dmICData.quItemSubCatFil do
    if Active then
      Close;
end;

procedure TfmICMain.N11Click(Sender: TObject);
begin

  Application.CreateForm(TqrStockStatus, qrStockStatus);
  with qrStockStatus.quStockStatusRep do
    if not Active then
      Open;
  try
    qrStockStatus.Preview;
    with qrStockStatus.quStockStatusRep do
      if Active then
        Close;
  finally
    qrStockStatus.Destroy;
  end;

end;

procedure TfmICMain.N13Click(Sender: TObject);
begin
  Application.CreateForm(TqrAlter, qrAlter);
  with qrAlter.quAlterItemRep do
    if not Active then
      Open;
  try
    qrAlter.Preview;
    with qrAlter.quAlterItemRep do
      if Active then
        Close;
  finally
    qrAlter.Destroy;
  end;

end;

procedure TfmICMain.N15Click(Sender: TObject);
begin
  Application.CreateForm(TqrLotFil, qrLotFil);
  with qrLotFil.quLotFilRep do
    if not Active then
      Open;
  try
    qrLotFil.Preview;
    with qrLotFil.quLotFilRep do
      if Active then
        Close;
  finally
    qrLotFil.Destroy;
  end;
end;

procedure TfmICMain.u2Click(Sender: TObject);
begin
  Application.CreateForm(TfmPrjRpDlg, fmPrjRpDlg);
  try
    fmPrjRpDlg.ShowModal;
  finally
    fmPrjRpDlg.Release;
  end;
end;

procedure TfmICMain.mmBalanceClick(Sender: TObject);
begin
  wServer := dmICData.dbICData.Params.Values['SERVER NAME'];
  Module := LoadLibrary('ICLibrary.dll');
  if Module > 32 then
  begin
    PFunc := GetProcAddress(Module, 'ICReport');
    TICReport(PFunc)(wUser, wPassword, wServer, 'Balance');
  end
  else
    ShowMessage('不能調用<ICLibrary.dll>');
  FreeLibrary(Module);
end;

procedure TfmICMain.u3Click(Sender: TObject);
begin
  wServer := dmICData.dbICData.Params.Values['SERVER NAME'];
  Module := LoadLibrary('ICLibrary.dll');
  if Module > 32 then
  begin
    PFunc := GetProcAddress(Module, 'ICReport');
    TICReport(PFunc)(wUser, wPassword, wServer, 'JobType');
  end
  else
    ShowMessage('不能調用<ICLibrary.dll>');
  FreeLibrary(Module);
end;

procedure TfmICMain.Bz1Click(Sender: TObject);
begin
  wServer := dmICData.dbICData.Params.Values['SERVER NAME'];
  Module := LoadLibrary('ICLibrary.dll');
  if Module > 32 then
  begin
    PFunc := GetProcAddress(Module, 'ICReport');
    TICReport(PFunc)(wUser, wPassword, wServer, 'PostHist');
  end
  else
    ShowMessage('不能調用<ICLibrary.dll>');
  FreeLibrary(Module);
end;

end.
