unit ExpFile;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, wwdbedit, Wwdotdot, Buttons, ComCtrls, Db, DBTables,
  Wwquery;

type
  TfmExpFile = class(TForm)
    Label1: TLabel;
    dtpStartDate: TDateTimePicker;
    Label2: TLabel;
    dtpEndDate: TDateTimePicker;
    bnOK: TBitBtn;
    bnCancel: TBitBtn;
    Label3: TLabel;
    dclExpFile: TwwDBComboDlg;
    sdlFileName: TSaveDialog;
    quExpFile: TwwQuery;
    quExpFileJOB_NO_1: TStringField;
    quExpFileJOB_NO_2: TStringField;
    quExpFileFWO_NO: TStringField;
    quExpFileJOB_COST_CAT: TStringField;
    quExpFileSUB_JOB_NO: TStringField;
    quExpFileHIST_DATE: TDateTimeField;
    quExpFileSITE_NO: TIntegerField;
    quExpFileHIST_SEQ: TDateTimeField;
    quExpFileDOC_NO: TStringField;
    quExpFileDETAIL_TYPE: TStringField;
    quExpFileDETAIL_AMT: TBCDField;
    quExpFileRETAIN_AMT: TBCDField;
    quExpFileDETAIL_QTY: TBCDField;
    quExpFileITEM_NO: TStringField;
    quExpFileWHS_CODE: TStringField;
    quExpFileITEM_UNIT_COST: TBCDField;
    quExpFileITEM_UNIT: TStringField;
    quExpFileINVC_NO: TStringField;
    quExpFileINVC_DATE: TDateTimeField;
    quExpFileCHQ_NO: TStringField;
    quExpFileCHQ_DATE: TDateTimeField;
    quExpFileUSER_ID: TStringField;
    quExpFileACCT_NO: TStringField;
    quExpFilePFT_CTR_1: TStringField;
    quExpFilePFT_CTR_2: TStringField;
    quExpFileCOMMENT: TMemoField;
    quExpFileQTY_TYPE: TStringField;
    lbFile: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure dclExpFileCustomDlg(Sender: TObject);
    procedure bnOKClick(Sender: TObject);
    procedure dclExpFileChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmExpFile: TfmExpFile;

implementation
uses JcMain;
{$R *.DFM}

procedure TfmExpFile.FormCreate(Sender: TObject);
begin
  Caption := wCompanyName + ' == ' + Caption;
  dtpStartDate.Date := Date;
  dtpEndDate.Date := Date;
end;

procedure TfmExpFile.dclExpFileCustomDlg(Sender: TObject);
begin
  if sdlFileName.Execute then
  begin
    dclExpFile.Text := sdlFileName.FileName;
  end;
end;

procedure TfmExpFile.bnOKClick(Sender: TObject);
var
  wWorkHours, wQtyType : String;
begin
  lbFile.Items.Clear;
  with quExpFile do
  begin
    if Active then
      Close;
    ParamByName('Start_Date').AsDate := dtpStartDate.Date;
    ParamByName('End_date').AsDate := dtpEndDate.Date + 1;
    Open;
    First;
    while not eof do
    begin
      wWorkHours := IntToStr(Trunc(FieldByName('Detail_qty').AsFloat* 100));
      while Length(wWorkHours) < 8 do
        wWorkHours := '0' + wWorkHours;
      if FieldByName('Qty_type').AsString = 'R' then
        wQtyType := 'R'
      else
        wQtyType := 'O';
      lbFile.Items.add(FieldByName('Job_no_1').AsString + ',' +
                  FieldByName('Fwo_no').AsString + ',0' +
                  FieldByname('Job_Cost_cat').AsString + ',' +
                  FormatDateTime('yyyymmdd', FieldByName('Hist_date').AsDateTime)
                  + ',' + wWorkHours + ',' + wQtyType);

      Next;
    end;
    Close;
  end;
  lbFile.Items.SaveToFile(sdlFileName.FileName);
end;

procedure TfmExpFile.dclExpFileChange(Sender: TObject);
begin
  if dclExpFile.Text <> '' then
    bnOK.Enabled := True;
end;

end.
