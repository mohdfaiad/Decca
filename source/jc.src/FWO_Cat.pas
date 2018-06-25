unit FWO_Cat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, wwSpeedButton, wwDBNavigator,
  Buttons, ExtCtrls,db, DBGrids, StdCtrls, wwdblook;

type
  TfmFWO_Cat = class(TForm)
    paTools: TPanel;
    sbExit: TSpeedButton;
    sbPS: TSpeedButton;
    sbPrintscreen: TSpeedButton;
    dnaFWO_Cat: TwwDBNavigator;
    wwDBNavigator1First: TwwNavButton;
    wwDBNavigator1Prior: TwwNavButton;
    wwDBNavigator1Next: TwwNavButton;
    wwDBNavigator1Last: TwwNavButton;
    wwDBNavigator1Insert: TwwNavButton;
    wwDBNavigator1Delete: TwwNavButton;
    wwDBNavigator1Post: TwwNavButton;
    wwDBNavigator1Cancel: TwwNavButton;
    StatusBar1: TStatusBar;
    mmFWO_Cat: TMainMenu;
    N1: TMenuItem;
    mmPrintsetup: TMenuItem;
    N3: TMenuItem;
    mmExit: TMenuItem;
    mmJChelp: TMenuItem;
    mmHelp: TMenuItem;
    printSetup: TPrinterSetupDialog;
    pmFWOQuot: TPopupMenu;
    pmPost: TMenuItem;
    pmCancel: TMenuItem;
    pmDelete: TMenuItem;
    pmInsert: TMenuItem;
    dgrFWOCat: TwwDBGrid;
    procedure dgrFWO_CatColExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mmExitClick(Sender: TObject);
    procedure sbPrintscreenClick(Sender: TObject);
    procedure sbPSClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmFWO_Cat: TfmFWO_Cat;

implementation
  uses JCmain,JCdatadm,FWOdtDm;
{$R *.DFM}

procedure TfmFWO_Cat.dgrFWO_CatColExit(Sender: TObject);
begin
{  with dmJCdata do
  begin
    if ((quFWO_Cat.State = dsedit) or (quFWO_Cat.State = dsinsert)) then
    begin
      if dgrFWO_Cat.SelectedField.FieldName = 'FWO_CAT' then
        quFWO_CatFWO_CAT.AsString
          :=UpperCase(quFWO_CatFWO_CAT.AsString);
    end;
  end;}
end;

procedure TfmFWO_Cat.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  //=====================
  Funcs[1] := 'All';
//  Funcs[2] := 'btnOK';
  //=====================
//  TestProgram( Funcs );

{  with dmJCFWO do
  begin
    with quFWO_Quot do
      if Not Active then
        Open;
    with quGetJobNo do
      if not Active then
        Open;
  end;}
end;

procedure TfmFWO_Cat.mmExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmFWO_Cat.sbPrintscreenClick(Sender: TObject);
begin
  if MessageDlg('¥´¦L«Ì¹õ¤\?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  print;
end;

procedure TfmFWO_Cat.sbPSClick(Sender: TObject);
begin
  printSetup.Execute;
end;

procedure TfmFWO_Cat.FormShow(Sender: TObject);
begin
  with dmJCdata do
  begin
    with quFWO_Cat do
    if Not Active then
      Open;
  end;
end;

procedure TfmFWO_Cat.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with dmJCdata do
    with quFWO_Cat do
      if Active then Close;
end;

end.
