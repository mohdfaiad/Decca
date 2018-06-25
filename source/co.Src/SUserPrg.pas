unit SUserPrg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, DBCtrls, Buttons, ExtCtrls,DB, StdCtrls, DBTables;

type
  TfmSelProgram = class(TForm)
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
  fmSelProgram: TfmSelProgram;

implementation
uses DeccaData, UserProg, DeccaMain, selModule;
{$R *.DFM}

procedure TfmSelProgram.sbExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmSelProgram.dbgUserPrgDblClick(Sender: TObject);
begin
  try
    fmUserProg.ShowModal;
  except
    ShowMessage('��������}�Τ�s��\��');
  end;
end;

procedure TfmSelProgram.dnaUserProgClick(Sender: TObject;
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

procedure TfmSelProgram.FormCreate(Sender: TObject);
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

procedure TfmSelProgram.FormClose(Sender: TObject; var Action: TCloseAction);
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
