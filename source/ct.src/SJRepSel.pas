unit SJRepSel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TfmSJSel = class(TForm)
    Label1: TLabel;
    edJobNo: TEdit;
    btnOK: TBitBtn;
    btnExit: TBitBtn;
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSJSel: TfmSJSel;

implementation

uses SJSelRep, CTCostDM, ctmain;

{$R *.DFM}

procedure TfmSJSel.btnOKClick(Sender: TObject);
begin
  Application.CreateForm(TfmSJRep, fmSJRep);
  edJobNo.Text := trim(edJobNo.Text);
  with fmSJRep.quSubJob do
  begin
    if Active = True then
       Active := False;
    ParamByName('iJobNo').Value := edJobNo.text;
    Active := True;
    fmSJRep.repSJDtl.Preview;
  end;
  fmSJRep.Release;
end;

procedure TfmSJSel.FormShow(Sender: TObject);
begin
  if ((dmCost.quJob.Active = True) and
      (dmCost.quJob.RecordCount > 0)) then
  begin
    edJobNo.Text := dmCost.quJob.FieldValues['Job_No'];
    btnOK.Enabled := True;
  end
  else
    btnOK.Enabled := False;
end;

procedure TfmSJSel.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
end;

end.
