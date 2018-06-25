unit SeleJob;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, wwdbedit, wwdblook;

type
  TfmSeleJob = class(TForm)
    bbOK: TBitBtn;
    bbExit: TBitBtn;
    laJobNo: TLabel;
    laDescription: TLabel;
    dblcJobNo: TwwDBLookupCombo;
    dedDescription: TwwDBEdit;
    procedure FormShow(Sender: TObject);
    procedure bbExitClick(Sender: TObject);
    procedure bbOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSeleJob: TfmSeleJob;

implementation
  uses CTCostDM,
       CTMain,
       JobRep;
{$R *.DFM}

procedure TfmSeleJob.FormShow(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  with dmCost do
  begin
    with quRepJob do
      if Not Active then
        Open;
  end;
end;

procedure TfmSeleJob.bbExitClick(Sender: TObject);
begin
   with dmCost do
   begin
     with quRepSeleJob do
       if Active then
         Close;
     with quRepSeleSubJob do
       if Active then
        Close;
     with quRepJob do
     begin
       if Active then
         Close;
     end;
   end;
   Close;
end;

procedure TfmSeleJob.bbOKClick(Sender: TObject);
begin
  with dmCost do
  begin
    with quRepSeleJob do
      if Not Active then
        Open;
    with quRepSeleSubJob do
    begin
      if Not Active then
        Open;
    end;
  end;
  Application.CreateForm(TqrJobRep,qrJobRep);
  try
    qrJobRep.qrRepJobDescr.Prepare;
    qrJobRep.qrRepJobDescr.Preview;
  finally
    qrJobRep.Release;
  end;
end;

end.
