unit Currency;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBCtrls, Buttons, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, DBTables,
  Wwdatsrc, Wwquery;

type
  TfmCurrency = class(TForm)
    quCurrency: TwwQuery;
    dsCurrency: TwwDataSource;
    usCurrency: TUpdateSQL;
    dbgCurrency: TwwDBGrid;
    paWorker: TPanel;
    sbExit: TSpeedButton;
    sbPrintSetup: TSpeedButton;
    sbPrint: TSpeedButton;
    DBNavigator1: TDBNavigator;
    quCurrencyCOMPANY_ID: TStringField;
    ps_PrinterSetup: TPrinterSetupDialog;
    quCurrencyBASE_CURRENCY: TBCDField;
    quCurrencyFOREIGN_CURRENCY: TBCDField;
    quCurrencyCURRENCY: TStringField;
    procedure sbPrintSetupClick(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
    procedure quCurrencyAfterPost(DataSet: TDataSet);
    procedure quCurrencyAfterInsert(DataSet: TDataSet);
    procedure quCurrencyPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgCurrencyColExit(Sender: TObject);
    procedure quCurrencyBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmCurrency: TfmCurrency;

implementation

uses DeccaData;
{$R *.DFM}

procedure TfmCurrency.sbPrintSetupClick(Sender: TObject);
begin
  ps_PrinterSetup.Execute;
end;

procedure TfmCurrency.sbExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmCurrency.quCurrencyAfterPost(DataSet: TDataSet);
begin
  with quCurrency do
  begin
    try
      ApplyUpdates;
      CommitUpdates;
    except
      on E : EDBEngineError do
        ShowMessage('未能夠更新檔案 [' + IntToStr(E.Errors[0].ErrorCode) +']');
    end;
  end;
end;

procedure TfmCurrency.quCurrencyAfterInsert(DataSet: TDataSet);
begin
  with dmDecca do
    with quCurrency do
      quCurrencyCOMPANY_ID.AsString := quSel1CompanyCOMPANY_ID.AsString;
end;

procedure TfmCurrency.quCurrencyPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  if (pos('changed the record', E.Message) <> 0) then
  begin
    ShowMessage('記錄已修正,未能更新記錄');
    Action := daAbort;
    DataSet.Close;
    DataSet.Open;
  end
  else
  begin
    if (pos('UNIQUE KEY', e.Message) <> 0) then
    begin
      ShowMessage('記錄重复');
      Action := daAbort;
      DataSet.Close;
      DataSet.Open;
    end
    else
    if Length(e.Message) > 0 then
    begin
      ShowMessage(e.Message);
      Action := daAbort;
    end;
  end;
end;

procedure TfmCurrency.FormCreate(Sender: TObject);
begin
  with quCurrency do
  begin
    if Active then
      Close;
    Open;
  end;
end;

procedure TfmCurrency.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with quCurrency do
  begin
    if Active then
      Close;
  end;
end;

procedure TfmCurrency.dbgCurrencyColExit(Sender: TObject);
begin
  if (quCurrency.State = dsEdit) or
     (quCurrency.State = dsInsert) then
  begin
    with dbgCurrency.SelectedField do
    begin
      if (FieldName = 'CURRENCY') then
        Text := UpperCase(Text);
    end;
  end;
end;

procedure TfmCurrency.quCurrencyBeforeDelete(DataSet: TDataSet);
begin
  if MessageDlg('刪除記錄 ?', mtWarning, [mbYes, mbNo], 0) = mrNo then
    Abort;
end;

end.
