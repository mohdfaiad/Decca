unit category;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, Buttons, ExtCtrls, Menus, Grids, DBGrids, CTCostDM, StdCtrls,
  Mask, Wwdbigrd, Wwdbgrid;

type
  TfmCateg = class(TForm)
    ps_PrintSetup: TPrinterSetupDialog;
    Panel1: TPanel;
    sbClose: TSpeedButton;
    sbPrintSetup: TSpeedButton;
    naCategory: TDBNavigator;
    wwDBGrid1: TwwDBGrid;
    spPrint: TSpeedButton;
    procedure sbPrintSetupClick(Sender: TObject);
    procedure mmPrintSetupClick(Sender: TObject);
    procedure mmFileCloseClick(Sender: TObject);
    procedure sbCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dgrCategColExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmCateg: TfmCateg;

implementation

uses ctmain, CategRep;

{$R *.DFM}

procedure TfmCateg.sbPrintSetupClick(Sender: TObject);
begin
  Application.CreateForm(TfmCatRep, fmCatRep);
  fmCatRep.repCategory.Preview;
  fmCatRep.Release;
end;

procedure TfmCateg.mmPrintSetupClick(Sender: TObject);
begin
  ps_PrintSetup.Execute;
end;

procedure TfmCateg.mmFileCloseClick(Sender: TObject);
begin
  Close;
  Release;
end;

procedure TfmCateg.sbCloseClick(Sender: TObject);
begin
  dmCost.taCategory.Active := False;
  Close;
  Release;
end;

procedure TfmCateg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmCost.taCategory.Active := False;
  Close;
  Release;
end;

procedure TfmCateg.dgrCategColExit(Sender: TObject);
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

procedure TfmCateg.FormShow(Sender: TObject);
begin
  dmCost.taCategory.Active := True;
end;

procedure TfmCateg.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  //=====================
  Funcs[2] := 'naCategory.nbInsert';
  Funcs[3] := 'naCategory.nbDelete';
  //=====================
  fmCTMain.TestProgram( Funcs );
end;

end.
