unit SeleCost;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, Mask, wwdbedit, Wwdotdot, Wwdbcomb, Grids, Wwdbigrd, Wwdbgrid,
  StdCtrls, ExtCtrls, Menus;

type
  TfmSeleCost = class(TForm)
    paSelect: TPanel;
    laJob_no_1: TLabel;
    laJobNo2: TLabel;
    laSub_job_no: TLabel;
    btnOK: TBitBtn;
    edJobNo1: TEdit;
    edJobNo2: TEdit;
    edSubJobNo: TEdit;
    edFWO_No: TEdit;
    grJOBNO: TGroupBox;
    dcbView: TwwDBComboBox;
    paTools: TPanel;
    sbExit: TSpeedButton;
    sbPS: TSpeedButton;
    printSetup: TPrinterSetupDialog;
    spLoadCost: TSpeedButton;
    mmSeleCost: TMainMenu;
    N1: TMenuItem;
    mmPrintsetup: TMenuItem;
    N3: TMenuItem;
    mmExit: TMenuItem;
    mmJChelp: TMenuItem;
    mmHelp: TMenuItem;
    dgrJobCost: TwwDBGrid;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure sbPSClick(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure dgrJobCostDblClick(Sender: TObject);
    procedure spLoadCostClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSeleCost: TfmSeleCost;

implementation
  uses JCdatadm,
       JCmain,
       FWOdtDM;
{$R *.DFM}

procedure TfmSeleCost.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
{  //=====================
  Funcs[1] := 'All';
  Funcs[2] := 'btnOK';
  Funcs[3] := 'dgrJobCost.OnDblClick';
  Funcs[4] := 'spLoadCost';
//  //=====================
//  fmJCmain.TestProgram( Funcs );
}
end;

procedure TfmSeleCost.sbPSClick(Sender: TObject);
begin
  printSetup.Execute;
end;

procedure TfmSeleCost.sbExitClick(Sender: TObject);
begin
  with dmJCdata.quJob_file do
    if  Active then
      Close;
  Close;
end;

procedure TfmSeleCost.btnOKClick(Sender: TObject);
var
  JobNo1,
  JobNo2,
  SubNo,
  FWONo : String;
  i :Integer;
begin
  JobNo1 := '';
  JobNo2 := '';
  SubNo := '';
  FWONo := '';
  with dmJCdata  do
  begin
    if Trim(edJobNo1.Text) <> '' then
    begin
      JobNo1 := trim(edJobNo1.Text);
      for i := 1 to edJobNo1.MaxLength - length(trim(edJobNo1.Text)) do
        JobNo1 := JobNo1 + '%';
    end;

    if (gUseJobNo2 = 'Y') and
       (trim(edJobNo2.Text) <> '') then
    begin
      JobNo2 :=trim(edJobNo2.Text);
      for i := 1 to edJobNo2.MaxLength - Length(Trim(edJobNo2.Text)) do
        JobNo2 := JobNo2 + '%';
    end;

    if Trim(edSubJobNo.Text) <> '' then
    begin
      SubNo := trim(edSubJobNo.Text);
      for i := 1 to edSubJobNo.MaxLength - Length(Trim(edSubJobNo.Text)) do
        SubNo := SubNo + '%';
    end;

    if Trim(edFWO_No.Text) <> '' then
    begin
      FWONo := trim(edFWO_No.Text);
      for i := 1 to edFWO_No.MaxLength - Length(Trim(edFWO_No.Text)) do
        FWONo := FWONo + '%';
    end;

    with quSelectJob do
    Begin
      if Active then
        Close;
      ParamByName('iJobno1').AsString := JobNo1;
      ParamByName('iJobno2').AsString := JobNo2;
      ParamByName('iSUBNO').AsString := SubNo;
      ParamByName('iFWONO').AsString := FWONo;
      Open;
    end;
  end;
end;

procedure TfmSeleCost.dgrJobCostDblClick(Sender: TObject);
begin
{
  if not dmJCdata.quSelectJob.IsEmpty then
  begin
    try
      Application.CreateForm(TfmFWOBudgt,fmFWOBudgt);
      fmFWOBudgt.ShowModal;
    finally
      fmFWOBudgt.Release;
    end;
  end else
    ShowMessage('請首先選取資料');
}
end;

procedure TfmSeleCost.spLoadCostClick(Sender: TObject);
begin
{
  if not dmJCdata.quSelectJob.IsEmpty then
  begin
    try
      Application.CreateForm(TfmCoSbView,fmCoSbView);
      fmCoSbView.ShowModal;
    finally
      fmCoSbView.Release;
    end;
  end else
    ShowMessage('請首先選取資料');
}
end;

procedure TfmSeleCost.FormShow(Sender: TObject);
begin
  with dmJCdata do
  begin
    edJobNo1.MaxLength := gJobNo1Len;
    edJobNo2.MaxLength := gJobNo2Len;
    if gUseJobNo2 = 'N' then
    begin
      laJobNo2.Visible := False;
      edJobNo2.Visible := False;
    end;

    with quSelectJob do
    Begin
      if Active then
        Close;
{      ParamByName('iJobno1').AsString :='JOBNO1' ;
      ParamByName('iJobno2').AsString := 'N2';
      ParamByName('iSUBNO').AsString :='SUBN';
      ParamByName('iFWONO').AsString :='FWON';}
      Open;
    end;
    with quJob_cost_file do
    begin
      if Not Active then
        Open;
    end;
  end;
end;

procedure TfmSeleCost.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with dmJCdata do
  begin
    with quJob_cost_file do
    begin
      if Active then
        Close;
    end;
  end;
end;

end.
