unit ProdCat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, wwdblook, Menus, wwSpeedButton, wwDBNavigator, Buttons,
  ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Db, DBTables, Wwdatsrc, Wwquery;

type
  TfmProdCat = class(TForm)
    dgrJob_cost_file: TwwDBGrid;
    paTools: TPanel;
    sbExit: TSpeedButton;
    sbPS: TSpeedButton;
    sbPrintscreen: TSpeedButton;
    dnaJob_cost_file: TwwDBNavigator;
    wwDBNavigator1First: TwwNavButton;
    wwDBNavigator1Prior: TwwNavButton;
    wwDBNavigator1Next: TwwNavButton;
    wwDBNavigator1Last: TwwNavButton;
    wwDBNavigator1Insert: TwwNavButton;
    wwDBNavigator1Delete: TwwNavButton;
    wwDBNavigator1Post: TwwNavButton;
    wwDBNavigator1Cancel: TwwNavButton;
    mmJob_cost_file: TMainMenu;
    N1: TMenuItem;
    mmPrintsetup: TMenuItem;
    N3: TMenuItem;
    mmExit: TMenuItem;
    mmJChelp: TMenuItem;
    mmHelp: TMenuItem;
    ps_PrinterSetup: TPrinterSetupDialog;
    quProdCat: TwwQuery;
    dsProdCat: TwwDataSource;
    usProdCat: TUpdateSQL;
    quProdCatDESCRIPTION: TStringField;
    quProdCatPRODUCTION_CAT: TStringField;
    procedure sbExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure quProdCatAfterPost(DataSet: TDataSet);
    procedure quProdCatBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmProdCat: TfmProdCat;

implementation
uses JcMain;
{$R *.DFM}

procedure TfmProdCat.sbExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmProdCat.FormCreate(Sender: TObject);
begin
  Caption := wCompanyName + ' == ' + Caption;
  with quProdCat do
  begin
    if not Active then
      Open;
  end;

end;

procedure TfmProdCat.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with quProdCat do
  begin
    if Active then
      Close;
  end;
end;

procedure TfmProdCat.quProdCatAfterPost(DataSet: TDataSet);
begin
  try
    with quProdCat do
    begin
      ApplyUpdates;
      CommitUpdates;
    end;
  except
    showmessage('記錄不能更新,數据無效');
  end;
end;

procedure TfmProdCat.quProdCatBeforeDelete(DataSet: TDataSet);
begin
  if MessageDlg('确實要刪除么?',
       mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      Abort;
end;

end.
