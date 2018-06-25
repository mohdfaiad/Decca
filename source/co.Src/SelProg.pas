unit SelProg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, DBCtrls, Buttons, ExtCtrls,DB, StdCtrls, DBTables;

type
  TfmSelProg = class(TForm)
    paWorker: TPanel;
    sbExit: TSpeedButton;
    sbPrintSetup: TSpeedButton;
    sbPrint: TSpeedButton;
    gbEditUserProg: TGroupBox;
    dbgUserPrg: TDBGrid;
    quProg_Desc: TQuery;
    quProg_DescMODULE_ID: TStringField;
    quProg_DescPROGRAM_ID: TStringField;
    quProg_DescDESCRIPTION: TStringField;
    dsProg_Desc: TDataSource;
    procedure sbExitClick(Sender: TObject);
    procedure dbgUserPrgDblClick(Sender: TObject);
    procedure dnaUserProgClick(Sender: TObject; Button: TNavigateBtn);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSelProg: TfmSelProg;

implementation
uses DeccaData, UserProg, DeccaMain, selModule;
{$R *.DFM}

procedure TfmSelProg.sbExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmSelProg.dbgUserPrgDblClick(Sender: TObject);
begin
  try
    fmUserProg.ShowModal;
  except
    ShowMessage('未能夠打開用戶編輯功能');
  end;
end;

procedure TfmSelProg.dnaUserProgClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button = nbInsert then
  begin
    dmDecca.quUserProg.Insert;
    dbgUserPrgDblClick(Self);
  end;
  if Button = nbEdit then
    dbgUserPrgDblClick(Self);
end;

procedure TfmSelProg.FormCreate(Sender: TObject);
begin
  Application.CreateForm(TfmUserProg,fmUserProg);
  with quProg_Desc do
  begin
     if not prepared then
       Prepare;
     ParamByName('Module_ID').asstring := fmUserMod.dbluModuleID.Text;
     Open;
  end;
end;

procedure TfmSelProg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with dmDecca.quUserProg do
  begin
    Filtered := False;
  end;
  with dmDecca do
  begin
    with quProg_Desc do
    begin
      if Active then
        Close;
      if Prepared then
        UnPrepare;
    end;
  end;
  fmUserProg.Release;
end;

end.
