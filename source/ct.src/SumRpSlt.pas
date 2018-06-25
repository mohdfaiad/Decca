unit SumRpSlt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, CTCostDM, Buttons, ExtCtrls, Spin, Db, DBTables, DBCtrls, Menus, Printers,
  Wwquery, wwdblook, Wwdbdlg;

type
  TfmSumRpSlt = class(TForm)
    gbFormat: TRadioGroup;
    btnOk: TBitBtn;
    btnExit: TBitBtn;
    dbLKDJobNo: TwwDBLookupComboDlg;
    quCTJobNo: TwwQuery;
    quCTJobNoJOB_NO: TStringField;
    quCTJobNoDESCRIPTION: TStringField;
    laJobNo: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure dbLKDJobNoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dbLKDJobNoExit(Sender: TObject);
    procedure dbLKDJobNoDblClick(Sender: TObject);
    procedure dbLKDJobNoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSumRpSlt: TfmSumRpSlt;
implementation

uses ctmain, sumrep, SumDtRep;


{$R *.DFM}

procedure TfmSumRpSlt.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  Funcs[2] := 'gbFormat';
  fmCTMain.TestProgram( Funcs );
end;




procedure TfmSumRpSlt.FormShow(Sender: TObject);
begin
  with quCTJobNo do
  begin
    if Active then Close;
    if not Prepared then
      Prepare;
    Open;
  end;
  if ((dmCost.quJob.Active = True) and
      (dmCost.quJob.RecordCount > 0)) then
  begin
    dbLKDJobNo.DisplayValue := trim(dmCost.quJobJOB_NO.AsString);
    btnOK.Enabled := True;
  end
end;

procedure TfmSumRpSlt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with quCTJobNo do
  begin
    if Active then Close;
    if Prepared then
      UnPrepare;
  end;
  close;
  Release;
end;


procedure TfmSumRpSlt.btnOkClick(Sender: TObject);
begin
  if ((gbFormat.Enabled = True) and (gbFormat.ItemIndex = 1)) then
  begin
    Application.CreateForm(TfmSumDtlRep, fmSumDtlRep);
    with dmCost.quSumRep do
    begin
      if Active then Close;
      ParamByName('iJobNo').Value := trim(dbLKDJobNo.LookupValue);
      Open;
    end;
    fmSumDtlRep.repSumDetail.preview;
    fmSumDtlRep.Release;
  end
  else
  begin
    Application.CreateForm(TfmSumRep, fmSumRep);
    with dmCost.quSumRep do
    begin
      if Active then Close;
      ParamByName('iJobNo').Value := trim(dbLKDJobNo.LookupValue);
      Open;
    end;
    fmSumRep.repSumSimple.preview;
    fmSumRep.Release;
  end;
end;

procedure TfmSumRpSlt.btnExitClick(Sender: TObject);
begin
  Close;
  Release;
end;

procedure TfmSumRpSlt.dbLKDJobNoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  dbLKDJobNoExit(self);
end;

procedure TfmSumRpSlt.dbLKDJobNoExit(Sender: TObject);
var
  JobNo : string;
begin
  JobNo := trim(dbLKDJobNo.DisplayValue);
  with quCTJobNo do
  begin
    if not Active then Open;
    if Locate('JOB_NO', JobNo, []) then
      btnOk.Enabled := True
    else
    begin
      showmessage('無此工程編號');
      btnOk.Enabled := False;
    end;
  end;     
end;

procedure TfmSumRpSlt.dbLKDJobNoDblClick(Sender: TObject);
begin
  dbLKDJobNo.Clear;
  btnOk.Enabled := False;
end;

procedure TfmSumRpSlt.dbLKDJobNoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  btnOk.Enabled := False;
end;

end.

