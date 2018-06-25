unit subjob;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CTCostDM, StdCtrls, Mask, DBCtrls, Grids, DBGrids, Buttons, ExtCtrls,
  Menus, Wwdbigrd, Wwdbgrid, wwdblook;

type
  TfmSubjob = class(TForm)
    MainMenu1: TMainMenu;
    ps_PrintSetup: TPrinterSetupDialog;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Panel1: TPanel;
    sbClose: TSpeedButton;
    sbPrintSetup: TSpeedButton;
    DBNavigator1: TDBNavigator;
    GroupBox1: TGroupBox;
    N5: TMenuItem;
    N6: TMenuItem;
    mmCostRep: TMenuItem;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    deJobNo: TDBEdit;
    deJobDesc: TDBEdit;
    N4: TMenuItem;
    mmEdit: TMenuItem;
    spEdit: TSpeedButton;
    mmList: TMenuItem;
    N7: TMenuItem;
    mmJobNoImp: TMenuItem;
    N9: TMenuItem;
    mmDataImp: TMenuItem;
    N11: TMenuItem;
    QSDataImp: TMenuItem;
    dgrSubJob: TwwDBGrid;
    dbluCategory: TwwDBLookupCombo;
    u1: TMenuItem;
    mmClrCost: TMenuItem;
    mmCostCatSum: TMenuItem;
    N8: TMenuItem;
    mmPatCCRep: TMenuItem;
    procedure sbPrintSetupClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure sbCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mmEditClick(Sender: TObject);
    procedure spEditClick(Sender: TObject);
    procedure mmCostRepClick(Sender: TObject);
    procedure mmListClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mmJobNoImpClick(Sender: TObject);
    procedure mmDataImpClick(Sender: TObject);
    procedure QSDataImpClick(Sender: TObject);
    procedure wwDBGrid1DblClick(Sender: TObject);
    procedure mmClrCostClick(Sender: TObject);
    procedure mmCostCatSumClick(Sender: TObject);
    procedure mmPatCCRepClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSubjob: TfmSubjob;

implementation

uses Subjobct, SJEdit, repselct, SJRepSel, ctmain, JobNoImp, Import,
  QSimport, ClrCost, SumRpSlt, CCRepDlg;

{$R *.DFM}

procedure TfmSubjob.sbPrintSetupClick(Sender: TObject);
begin
  ps_PrintSetup.Execute;
end;

procedure TfmSubjob.N2Click(Sender: TObject);
begin
  ps_PrintSetup.Execute;
end;

procedure TfmSubjob.N3Click(Sender: TObject);
begin
  Close;
  Release;
end;

procedure TfmSubjob.sbCloseClick(Sender: TObject);
begin
  Close;
  Release;
end;

procedure TfmSubjob.FormShow(Sender: TObject);
var
  JobNo : string[7];
begin
  with dmCost.quJob do
  begin
    JobNo := Fieldbyname('Job_No').value;
  end;
  with dmCost.quSubJob do
  begin
    if active then
       close;
    ParamByName('iJob_No').value := JobNo;
    active := true;
 {   if RecordCount <= 0  then
      showmessage('無此子工程號');    }
  end;
end;


procedure TfmSubjob.mmEditClick(Sender: TObject);
begin
  Application.CreateForm(TfmSJEdit, fmSJEdit);
  try
    fmSJEdit.showmodal;
  finally
    fmSJEdit.Release;
  end;
end;

procedure TfmSubjob.spEditClick(Sender: TObject);
begin
  Application.CreateForm(TfmSJEdit, fmSJEdit);
  try
    fmSJEdit.showmodal;
  finally
    fmSJEdit.Release;
  end;
end;

procedure TfmSubjob.mmCostRepClick(Sender: TObject);
begin
  Application.CreateForm(TfmRepSel, fmRepSel);
  try
    fmRepSel.showmodal;
  finally
    fmRepSel.Release;
  end;
end;

procedure TfmSubjob.mmListClick(Sender: TObject);
begin
  Application.CreateForm(TfmSJSel, fmSJSel);
  try
    fmSJSel.showmodal;
  finally
    fmSJSel.Release;
  end;     
end;

procedure TfmSubjob.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  //=====================
  Funcs[2] := 'mmEdit|spEdit';
  Funcs[3] := 'mmCostRep';
  Funcs[4] := 'mmCostCatSum';
  Funcs[5] := 'mmList';
  Funcs[6] := 'mmJobNoImp';
  Funcs[7] := 'mmDataImp';
  Funcs[8] := 'mmQSDataImp';
  Funcs[9] := 'dgrSubJob.OnDblClick';
  Funcs[10] := 'mmClrCost';
  Funcs[11] := 'mmPatCCRep';
  //=====================
  fmCTMain.TestProgram( Funcs );
end;

procedure TfmSubjob.mmJobNoImpClick(Sender: TObject);
begin
  Application.CreateForm(TfmJobImp, fmJobImp);
  try
    fmJobImp.showmodal;
  finally
    fmJobImp.Release;
  end;
end;

procedure TfmSubjob.mmDataImpClick(Sender: TObject);
begin
  Application.CreateForm(TfmImport, fmImport);
  try
    fmImport.showmodal;
  finally
    fmImport.release;
  end;
end;

procedure TfmSubjob.QSDataImpClick(Sender: TObject);
begin
  Application.CreateForm(TfmQSimpt, fmQSimpt);
  try
    fmQSImpt.showmodal;
  finally
    fmQSImpt.release;
  end;
end;

procedure TfmSubjob.wwDBGrid1DblClick(Sender: TObject);
begin
  Application.CreateForm(TfmSJCost, fmSJCost);
  try
    fmSJCost.showmodal;
  finally
    fmSJCost.Release;
  end;
end;

procedure TfmSubjob.mmClrCostClick(Sender: TObject);
begin
  Application.CreateForm(TfmClrCost, fmClrCost);
  try
    fmClrCost.showmodal;
  finally
    fmClrCost.release;
  end;
end;

procedure TfmSubjob.mmCostCatSumClick(Sender: TObject);
begin
  Application.CreateForm(TfmSumRpSlt, fmSumRpSlt);
  try
    fmSumRpSlt.showmodal;
  finally
    fmSumRpSlt.release;
  end;
end;

procedure TfmSubjob.mmPatCCRepClick(Sender: TObject);
begin
  Application.CreateForm(TfmCCRepDlg, fmCCRepDlg);
  try
    fmCCRepDlg.showmodal;
  finally
    fmCCRepDlg.release;
  end;
end;

end.
