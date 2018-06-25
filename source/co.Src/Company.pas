unit Company;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, DBCtrls, Buttons, ExtCtrls, StdCtrls, Mask, wwdbedit,
  Wwdbspin, db, TestPrg;

type
  TfmCompany = class(TForm)
    paWorker: TPanel;
    sbExit: TSpeedButton;
    sbPrintSetup: TSpeedButton;
    sbPrint: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    dnaCompany: TDBNavigator;
    paCompany: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    dedCompanyID: TDBEdit;
    dedC_Name: TDBEdit;
    dedE_Name: TDBEdit;
    dedAddress: TDBEdit;
    dedPhone: TDBEdit;
    dedFax: TDBEdit;
    dcbSafe: TDBCheckBox;
    dedSign: TDBEdit;
    op_Open: TOpenDialog;
    laACLength: TLabel;
    laPftCtr1Len: TLabel;
    dbckPftCtr1: TDBCheckBox;
    dbckPftCtr2: TDBCheckBox;
    laPftCtr2Len: TLabel;
    dbspACLength: TwwDBSpinEdit;
    dbspPftCtr1: TwwDBSpinEdit;
    dbspPftCtr2: TwwDBSpinEdit;
    laCurrency: TLabel;
    dbeCurrency: TDBEdit;
    TestPrg: TTestPrg;
    procedure sbExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dedSignDblClick(Sender: TObject);
    procedure dbckPftCtr1Exit(Sender: TObject);
    procedure dbckPftCtr2Exit(Sender: TObject);
    procedure dbspPftCtr2Exit(Sender: TObject);
    procedure dbspPftCtr1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmCompany: TfmCompany;

implementation
uses DeccaData, DeccaMain;
{$R *.DFM}

procedure TfmCompany.sbExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmCompany.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  with dmDecca.quCompany do
  begin
    if wCompanyID = '' then
    begin
      First;
      Insert;
    end
    else
    begin
      Filter := 'Company_ID =' + '''' + wCompanyID + '''';
      Filtered := True;
    end;
  end;
  //====================================================
{  Funcs[1] := 'All';
  Funcs[2] := 'dnaCompany.nbInsert';
  Funcs[3] := 'dnaCompany.nbDelete';
  Funcs[4] := 'paCompany|dnaCompany';
  Funcs[5] := 'dcbSafe';
  fmMain.TestProgram(Funcs);}
  TestPrg.TestProgram('SY', wCompanyID, wUserID, wActiveSecurity);
end;

procedure TfmCompany.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with dmDecca.quCompany do
  begin
    Close;
    Filter := 'Company_ID =' + '''' + wCompanyID + '''';
    Filtered := True;
    Open;
    if RecordCount > 0 then
    begin
      wCompanyName := FieldByName('C_Name').value;
      if trim(wCompanyName) = '' then
        wCompanyName := FieldByName('E_Name').value;
      Close;
    end;
    Filtered := false;
  end;
  fmMain.Caption := trim(wCompanyName);
end;

procedure TfmCompany.dedSignDblClick(Sender: TObject);
begin
  if (dmDecca.quCompany.State <> dsEdit) then
    dmDecca.quCompany.Edit;
  if op_Open.Execute then
    dedSign.Text := op_Open.FileName;
end;

procedure TfmCompany.dbckPftCtr1Exit(Sender: TObject);
begin
  if dbckPftCtr1.Checked then
  begin
    laPftCtr1Len.Enabled := True;
    dbspPftCtr1.Enabled := True;
    if dbspPftCtr1.Value < 1 then
      dbspPftCtr1.Value := 1;
    dbspPftCtr1.SetFocus;
    dbckPftCtr2.Enabled := True;
  end
  else
  begin
    laPftCtr1Len.Enabled := False;
    dbspPftCtr1.Enabled := False;
    dbspPftCtr1.Value := 0;
    dbckPftCtr2.Enabled := False;
    dbckPftCtr2.Checked := False;
    laPftCtr2Len.Enabled := False;
    dbspPftCtr2.Enabled := False;
    dbspPftCtr2.Value := 0;
  end;
end;

procedure TfmCompany.dbckPftCtr2Exit(Sender: TObject);
begin
  if dbckPftCtr2.Checked then
  begin
    laPftCtr2Len.Enabled := True;
    dbspPftCtr2.Enabled := True;
    if dbspPftCtr2.Value < 1 then
      dbspPftCtr2.Value := 1;
    dbspPftCtr2.SetFocus;
  end
  else
  begin
    laPftCtr2Len.Enabled := False;
    dbspPftCtr2.Enabled := False;
    dbspPftCtr2.Value := 0;
  end;
end;

procedure TfmCompany.dbspPftCtr2Exit(Sender: TObject);
begin
  if dbspPftCtr2.Value < 1 then
    dbspPftCtr2.Value := 1;
end;

procedure TfmCompany.dbspPftCtr1Exit(Sender: TObject);
begin
  if dbspPftCtr2.Value < 1 then
    dbspPftCtr2.Value := 1;
end;

end.
