unit SJSelRep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, quickrpt, Qrctrls, DBTables, ExtCtrls;

type
  TfmSJRep = class(TForm)
    repSJDtl: TQuickRep;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    quSubJob: TQuery;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    quSubJobQuote_No: TStringField;
    quQuotNo: TQuery;
    QRLabel1: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    quSubJobJOB_NO: TStringField;
    quSubJobLINE_NO: TIntegerField;
    quSubJobDESCRIPTION: TStringField;
    quSubJobSUB_JOB_NO: TStringField;
    quSubJobQUOT_LINE_NO: TStringField;
    QRDBText6: TQRDBText;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRBand3: TQRBand;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel14: TQRLabel;
    QRLabel11: TQRLabel;
    qlUser: TQRLabel;
    qlCompany: TQRLabel;
    QRBand5: TQRBand;
    QRLabel6: TQRLabel;
    QRBand4: TQRBand;
    procedure quSubJobCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSJRep: TfmSJRep;

implementation

uses
  ctmain;

{$R *.DFM}

procedure TfmSJRep.quSubJobCalcFields(DataSet: TDataSet);
begin
  with quQuotNo do
  begin
    if Active = True then
       Active := False;
    ParamByName('iJobNo').Value := quSubJob.FieldValues['Job_No'];
    Active := True;
  end;
end;

procedure TfmSJRep.FormCreate(Sender: TObject);
begin
  qlCompany.Caption := trim(wCompanyName);
  qlUser.Caption := trim(wUser);
end;

end.
