unit SeleLib;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, Mask, wwdbedit, Wwdotdot, Wwdbcomb, Grids, Wwdbigrd, Wwdbgrid,
  StdCtrls, ExtCtrls, Menus, TestPrg;

type
  TfmSeleLib = class(TForm)
    paSelect: TPanel;
    laJob_no_1: TLabel;
    laJobNo2: TLabel;
    laFWONo: TLabel;
    laSubJobNo: TLabel;
    btnOK: TBitBtn;
    edJobNo1: TEdit;
    edJobNo2: TEdit;
    edSubJobNo: TEdit;
    edFWONo: TEdit;
    grJOBNO: TGroupBox;
    dgrSeleLib: TwwDBGrid;
    dcbView: TwwDBComboBox;
    paTools: TPanel;
    sbExit: TSpeedButton;
    sbPS: TSpeedButton;
    printSetup: TPrinterSetupDialog;
    mmSeleBudG: TMainMenu;
    N1: TMenuItem;
    mmPrintsetup: TMenuItem;
    N3: TMenuItem;
    mmExit: TMenuItem;
    mmJChelp: TMenuItem;
    mmHelp: TMenuItem;
    procedure sbExitClick(Sender: TObject);
    procedure sbPSClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure dgrSeleLibDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSeleLib: TfmSeleLib;

implementation
  uses JCmain, JCdatadm,SeleSUB;
{$R *.DFM}

procedure TfmSeleLib.sbExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmSeleLib.sbPSClick(Sender: TObject);
begin
  printSetup.Execute;
end;

procedure TfmSeleLib.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
{  //=====================
  Funcs[1] := 'All';
  Funcs[2] := 'btnOK';
  Funcs[3] := 'dgrSeleBudG.OnDblClick';
  //=====================
//  fmJCmain.TestProgram( Funcs );}
end;

procedure TfmSeleLib.btnOKClick(Sender: TObject);
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

    if (Trim(edJobNo2.Text) <> '') and
       (gUseJobNo2 = 'Y') then
    begin
      JobNo2 :=trim(edJobNo2.Text);
      for i := 1 to edJobNo2.MaxLength - Length(Trim(edJobNo2.Text)) do
        Jobno2 :=JobNo2 + '%';
    end;

    if Trim(edSubJobNo.Text) <> '' then
    begin
      SubNo := trim(edSubJobNo.Text);
      for i := 1 to edSubJobNo.MaxLength - Length(Trim(edSubJobNo.Text)) do
        SubNo := SubNo + '%';
    end;

    if Trim(edFWONo.Text) <> '' then
    begin
      FWONo := trim(edFWONo.Text);
      for i := 1 to edFWONo.MaxLength - Length(Trim(edFWONo.Text)) do
        FWONo := FWONo + '%';
    end;
    
    with quSelectJob do
    begin
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

procedure TfmSeleLib.dgrSeleLibDblClick(Sender: TObject);
begin
  try
    Application.CreateForm(TfmSeleSUB,fmSeleSUB);
    fmSeleSUB.ShowModal;
  finally
    fmSeleSUB.Release;
  end;
end;

procedure TfmSeleLib.FormShow(Sender: TObject);
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
  end;
end;

end.
