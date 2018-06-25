unit Module;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, DBCtrls, Buttons, ExtCtrls;

type
  TfmModule = class(TForm)
    paWorker: TPanel;
    sbExit: TSpeedButton;
    sbPrintSetup: TSpeedButton;
    sbPrint: TSpeedButton;
    DBNavigator1: TDBNavigator;
    dgrModule: TDBGrid;
    procedure sbExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmModule: TfmModule;

implementation
uses DeccaData, DeccaMain;


{$R *.DFM}

procedure TfmModule.sbExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmModule.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  with dmDecca.quCompanyMod do
  begin
    Filter :=  'Company_ID =' + '''' + wCompanyID + '''';
    Filtered := True;
    First;
  end;
 { with dgrModule.Columns[0].PickList do
  begin
    with dmDecca.quCompany do
    begin
      if not Active then
        Open;
      First;
      while not eof do
      begin
        Add(FieldByName('Company_ID').AsString);
        Next;
      end;
    end;
  end;}
end;

procedure TfmModule.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with dmDecca.quCompanyMod do
  begin
    Filter := '';
    Filtered := False;;
  end;
  Close;
end;

end.
