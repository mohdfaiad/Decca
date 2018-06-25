unit UserProd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Grids, Wwdbigrd, Wwdbgrid, DBTables, Db,
  Wwdatsrc, Wwquery, Menus, wwSpeedButton, wwDBNavigator, Buttons, ExtCtrls,
  wwdblook, wwdbedit, Wwdotdot, Wwdbcomb;

type
  TfmUserProd = class(TForm)
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
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    quUserProd: TwwQuery;
    dsUserProd: TwwDataSource;
    usUserProd: TUpdateSQL;
    dgrJob_cost_file: TwwDBGrid;
    Panel1: TPanel;
    dlcUserId: TwwDBLookupCombo;
    Label1: TLabel;
    quUserFile: TwwQuery;
    quUserFileUSER_ID: TStringField;
    quUserFileUSER_NAME: TStringField;
    quUserProdUSER_ID: TStringField;
    quUserProdPRODUCTION_CAT: TStringField;
    quUserProdFUNCTION_FLAG: TStringField;
    quUserProddesc: TStringField;
    dlcProdCat: TwwDBLookupCombo;
    dcbFunction: TwwDBComboBox;
    quProdCat: TwwQuery;
    quProdCatDESCRIPTION: TStringField;
    quProdCatPRODUCTION_CAT: TStringField;
    procedure dlcUserIdCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure quUserProdAfterPost(DataSet: TDataSet);
    procedure quUserProdBeforeDelete(DataSet: TDataSet);
    procedure sbExitClick(Sender: TObject);
    procedure quUserProdNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmUserProd: TfmUserProd;

implementation
uses JcMain, jcDataDm;
{$R *.DFM}

procedure TfmUserProd.dlcUserIdCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  with quUserProd do
  begin
    if Active then
      Close;
    ParamByName('user_id').AsString := dlcUserId.Text;
    Open;
  end;
end;

procedure TfmUserProd.FormCreate(Sender: TObject);
begin
  with dmJCData do
  begin
    with dbCommon do
      if not Connected then
        Connected := True;
  end;
  Caption := wCompanyName + ' == ' + Caption;
  with quProdCat do
  begin
    if not Active then
      Open;
  end;
  with quUserFile do
  begin
    if not Active then
      Open;
  end;
  with quUserProd do
  begin
    if not Active then
      Open;
  end;
end;

procedure TfmUserProd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with quProdCat do
  begin
    if  Active then
      Close;
  end;
  with quUserFile do
  begin
    if  Active then
      Close;
  end;
  with quUserProd do
  begin
    if  Active then
      Close;
  end;
  with dmJCData do
  begin
    with dbCommon do
      if Connected then
        Connected := False;
  end;
end;

procedure TfmUserProd.quUserProdAfterPost(DataSet: TDataSet);
begin
  try
    with quUserProd do
    begin
      ApplyUpdates;
      CommitUpdates;
    end;
  except
    showmessage('記錄不能更新,數据無效');
  end;
end;

procedure TfmUserProd.quUserProdBeforeDelete(DataSet: TDataSet);
begin
  if MessageDlg('确實要刪除么?',
       mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      Abort;
end;

procedure TfmUserProd.sbExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmUserProd.quUserProdNewRecord(DataSet: TDataSet);
begin
  quUserProdUSER_ID.AsString := dlcUserId.Text;
  quUserProdFUNCTION_FLAG.AsString := 'R';
end;

end.
