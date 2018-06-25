unit selModule;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Mask, Buttons, ExtCtrls, wwdblook;

type
  TfmUserMod = class(TForm)
    Label3: TLabel;
    paWorker: TPanel;
    sbExit: TSpeedButton;
    sbPrintSetup: TSpeedButton;
    sbPrint: TSpeedButton;
    lbSelModule: TLabel;
    btOK: TButton;
    btClose: TButton;
    edCompanyID: TEdit;
    Label1: TLabel;
    dlcUserID: TwwDBLookupCombo;
    dbluModuleID: TwwDBLookupCombo;
    procedure btOKClick(Sender: TObject);
    procedure btCloseClick(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmUserMod: TfmUserMod;

implementation
uses Deccadata, SUserPrg, DeccaMain, SelProg;
{$R *.DFM}

procedure TfmUserMod.btOKClick(Sender: TObject);
var
  wTempUser : string;
begin
 { with dmDecca.quUserProg  do
  begin
    if not Active then Open;
      First;
  end;}
  if trim(dbluModuleID.Text) = '' then
  begin
    ShowMessage('請輸入系統先');
    Abort;
  end;
  if trim(dlcUserID.Text) = '' then
  begin
    ShowMessage('請輸入用戶先');
    Abort;
  end;

  Application.CreateForm(TfmSelProg, fmSelProg);
  with fmSelProg do
  begin
    try
      ShowModal;
    finally
      Release;
      Destroy;
      with dmDecca.quUserProg do
      begin
        if Active then
          Close;
        Open;
      end;
    end;
  end;
end;

procedure TfmUserMod.btCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmUserMod.sbExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmUserMod.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with dmDecca do
  begin
    with quSelModule do
      if Active then
        Close;
    with quUserFile do
      if Active then
        Close;
  end;
end;

procedure TfmUserMod.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  edCompanyID.Text := wCompanyID;
  with dmDecca do
  begin
    with quSelModule do
    begin
      if Active then
        Close;
      ParamByName('Company_ID').AsString := wCompanyID;
      Open;
    end;
    with quUserFile do
      if not Active then
        Open;
  end;
end;

end.
