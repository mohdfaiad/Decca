unit SeleBudg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, Mask, wwdbedit, Wwdotdot, Wwdbcomb, Grids, Wwdbigrd, Wwdbgrid,
  StdCtrls, ExtCtrls, Menus;

type
  TfmSeleBudg = class(TForm)
    paSelect: TPanel;
    laJob_no_1: TLabel;
    laJobNo2: TLabel;
    btnOK: TBitBtn;
    edJobNo1: TEdit;
    edJobNo2: TEdit;
    grJOBNO: TGroupBox;
    paTools: TPanel;
    sbExit: TSpeedButton;
    sbPS: TSpeedButton;
    printSetup: TPrinterSetupDialog;
    mmSeleCost: TMainMenu;
    N1: TMenuItem;
    mmPrintsetup: TMenuItem;
    N3: TMenuItem;
    mmExit: TMenuItem;
    mmJChelp: TMenuItem;
    mmHelp: TMenuItem;
    dgrSelBudg: TwwDBGrid;
    dbcbStatus: TwwDBComboBox;
    procedure FormCreate(Sender: TObject);
    procedure sbPSClick(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dgrSelBudgDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSeleBudg: TfmSeleBudg;

implementation
  uses JCdatadm,
       JCmain,
       FWOdtDM,
       FWOBudgt,
       CoSbView;
{$R *.DFM}

procedure TfmSeleBudg.FormCreate(Sender: TObject);
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

procedure TfmSeleBudg.sbPSClick(Sender: TObject);
begin
  printSetup.Execute;
end;

procedure TfmSeleBudg.sbExitClick(Sender: TObject);
begin
  with dmJCdata.quJob_file do
    if  Active then
      Close;
  Close;
end;

procedure TfmSeleBudg.btnOKClick(Sender: TObject);
begin
  with dmJCFWO do
  begin
    with quSelBudget do
    begin
      if Active then
         Close;
      ParamByName('iJob_no_1').AsString := Trim(edJobNo1.Text) +'%';
      ParamByName('iJob_no_2').AsString := Trim(edJobNo2.Text) +'%';
      Open;
    end;
  end;
end;

procedure TfmSeleBudg.FormShow(Sender: TObject);
begin
  edJobNo1.MaxLength := gJobNo1Len;
  edJobNo1.MaxLength := gJobNo2Len;
  if gUseJobNo2 = 'N' then
  begin
    laJobNo2.Visible := False;
    edJobNo2.Visible := False;
  end;
  with dmJCFWO do
  begin
    with quSelBudget do
    begin
      if Active then
         Close;
{      ParamByName('iJob_no_1').AsString := 'JOBNO1';
      ParamByName('iJob_no_2').AsString := 'N2';}
      Open;
    end;
  end;
end;

procedure TfmSeleBudg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with dmJCFWO do
  begin
    with quSelBudget do
    begin
      if Active then
         Close;
    end;
  end;
end;

procedure TfmSeleBudg.dgrSelBudgDblClick(Sender: TObject);
begin
  if not dmJCFWO.quSelBudget.IsEmpty then
  begin
    try
      Application.CreateForm(TfmFWOBudgt,fmFWOBudgt);
      fmFWOBudgt.ShowModal;
    finally
      fmFWOBudgt.Release;
    end;
  end else
    ShowMessage('請首先選取資料');
end;

end.
