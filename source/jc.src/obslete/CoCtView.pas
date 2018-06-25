unit CoCtView;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, Mask, wwdbedit, Wwdotdot, Wwdbcomb, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, Menus;

type
  TfmFWOBudgt = class(TForm)
    paSelect: TPanel;
    laJob_no: TLabel;
    grJOBNO: TGroupBox;
    paTools: TPanel;
    sbExit: TSpeedButton;
    sbPS: TSpeedButton;
    printSetup: TPrinterSetupDialog;
    dedJOB_NO: TwwDBEdit;
    dgrFWOBudget: TwwDBGrid;
    sbPrintscreen: TSpeedButton;
    mmCostCat: TMainMenu;
    mmFile: TMenuItem;
    mmPrintsetup: TMenuItem;
    N3: TMenuItem;
    mmExit: TMenuItem;
    mmJChelp: TMenuItem;
    mmHelp: TMenuItem;
    dedDescri: TwwDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure sbPSClick(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
    procedure dgrFWOBudgetUpdateFooter(Sender: TObject);
    procedure sbPrintscreenClick(Sender: TObject);
    procedure dgrFWOBudgetDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmFWOBudgt: TfmFWOBudgt;

implementation
  uses JCdatadm,
     JCmain,
     FWOdtDM,
     CoCtSee;
{$R *.DFM}

procedure TfmFWOBudgt.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
{
  //=====================
  Funcs[1] := 'All';
  Funcs[2] := 'btnOK';
  //=====================
//  TestProgram( Funcs );
}
end;

procedure TfmFWOBudgt.sbPSClick(Sender: TObject);
begin
  printSetup.Execute;
end;

procedure TfmFWOBudgt.sbExitClick(Sender: TObject);
begin
  with dmJCFWO.quCostCatSum do
    if  Active then
      Close;
  Close;
end;

procedure TfmFWOBudgt.dgrFWOBudgetUpdateFooter(Sender: TObject);
begin
 with dmJCFWO do
   with dgrFWOBudget do
    begin
      ColumnByName('JOB_COST_CAT').FooterValue :=
        IntToStr(quJobCostCatSmry.RecordCount)+'條';
      ColumnByName('JOB_REG_AMT').FooterValue :=
        quJobCostCatSmryJOB_REG_AMT.AsString;
      ColumnByName('JOB_PREM_AMT').FooterValue :=
        quJobCostCatSmryJOB_PREM_AMT.AsString;
      ColumnByName('BUDGET_AMT').FooterValue :=
        quJobCostCatSmryBUDGET_AMT.AsString;
    end;
end;

procedure TfmFWOBudgt.sbPrintscreenClick(Sender: TObject);
begin
  if MessageDlg('打印屏幕么?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    print;
end;

procedure TfmFWOBudgt.dgrFWOBudgetDblClick(Sender: TObject);
begin
  if not dmJCFWO.quJobCostCatSmry.IsEmpty then
  begin
    try
      Application.CreateForm(TfmCoCtSee,fmCoCtSee);
      fmCoCtSee.ShowModal;
    finally
      fmCoCtSee.Release;
    end;
  end
  else
    ShowMessage('無資料讀取');
end;

procedure TfmFWOBudgt.FormShow(Sender: TObject);
begin
  with dmJCFWO do
  begin
    with quCostByJobSubJob do
      if Not Active then
        Open;
    with quJobCostCatSmry do
      if not Active then
        Open;
  end;
end;

procedure TfmFWOBudgt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with dmJCData do
    with quSelectJob do
      if Active then
        Close;
  with dmJCFWO do
    with quJobCostCatSmry do
      if Active then
        Close;
end;

end.
