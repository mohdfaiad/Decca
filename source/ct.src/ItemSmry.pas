unit ItemSmry;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, Buttons, ExtCtrls, Menus, Grids, DBGrids, CTCostDM, StdCtrls,
  Mask, Wwdbigrd, Wwdbgrid;

type
  TfmItemSmry = class(TForm)
    ps_PrintSetup: TPrinterSetupDialog;
    Panel1: TPanel;
    sbClose: TSpeedButton;
    sbPrintSetup: TSpeedButton;
    dnaItemSmry: TDBNavigator;
    dgrItemSumry: TwwDBGrid;
    spPrint: TSpeedButton;
    procedure mmPrintSetupClick(Sender: TObject);
    procedure mmFileCloseClick(Sender: TObject);
    procedure sbCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dgrCategColExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmItemSmry: TfmItemSmry;

implementation

uses ctmain;

{$R *.DFM}

procedure TfmItemSmry.mmPrintSetupClick(Sender: TObject);
begin
  ps_PrintSetup.Execute;
end;

procedure TfmItemSmry.mmFileCloseClick(Sender: TObject);
begin
  Close;
  Release;
end;

procedure TfmItemSmry.sbCloseClick(Sender: TObject);
begin
  dmCost.taCategory.Active := False;
  Close;
  Release;
end;

procedure TfmItemSmry.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmCost.taCategory.Active := False;
  Close;
  Release;
end;

procedure TfmItemSmry.dgrCategColExit(Sender: TObject);
begin
{  if (dmCost.quCategory.State = dsEdit) or
     (dmCost.quCategory.State = dsInsert) then
  begin
    with dgrCateg.SelectedField do
    begin
      if (FieldName = 'Category') and
         (Text <> '') then
       Text := UpperCase(Text);
    end;
  end;  }
end;

procedure TfmItemSmry.FormShow(Sender: TObject);
begin
  with dmCost do
  begin
    with quSelectItemSumryCat do
      if Not Active then
        Open;
  end;
end;

procedure TfmItemSmry.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;

end;

procedure TfmItemSmry.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  with dmCost do
  begin
    with quSelectItemSumryCat do
      if Active then
        Close;
  end;
end;

end.
