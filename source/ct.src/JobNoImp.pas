unit JobNoImp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Db, DBTables, Wwquery;

type
  TfmJobImp = class(TForm)
    Label1: TLabel;
    edJobNoEnd: TEdit;
    Label2: TLabel;
    edJobNoST: TEdit;
    btnOK: TBitBtn;
    btnExit: TBitBtn;
    quSel1SubJob: TwwQuery;
    quSel1Job: TwwQuery;
    procedure btnExitClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edJobNoSTExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmJobImp: TfmJobImp;

implementation

uses ctmain, CTCostDM;

{$R *.DFM}

procedure TfmJobImp.btnExitClick(Sender: TObject);
begin
  Close;
  Release;
end;

procedure TfmJobImp.btnOKClick(Sender: TObject);
var
  JobNo,
  JobNoST,
  JobNoEND : string[7];
begin
  JobNoST := UpperCase(trim(edJobNoST.Text));
  JobNoEND := UpperCase(trim(edJobNoEND.Text));
  if (JobNoEND < JobNoST) then
  begin
    showmessage('工程編號選擇錯誤');
    abort;
  end;
  with fmCTMain do
  begin
    with dmCost.taJob do
    begin
      if Active then
        Close;
      Open;
    end;
    with dmCost.taSubjob do
    begin
      if Active then
        Close;
      Open;
    end;
    with quJob do
    begin
      if Active then
        Close;
      ParamByName('iJobNoST').Value := JobNoST;
      ParamByName('iJobNoEND').Value := JobNoEND;
      Open;
      First;
      while not quJob.EOF do
      begin
        with quSel1Job do
        begin
          if Active then
            Close;
          ParamByName('Job_No').AsString := quJobJOB_NO_1.AsString;
          Open;
          if RecordCount = 0 then
          begin
            with dmCost.taJob do
            begin
              Append;
              FieldByName('Job_No').AsString := quJobJOB_NO_1.AsString;
              FieldByName('Description').AsString := quJobDESCRIPTION.AsString;
              FieldByName('Quot_No').AsString := quJobJOB_NO_1.AsString;
              Post;
            end;
          end;
          quJob.Next;
        end;
      end;
    end;

    with quJobFWO do
    begin
      if Active then
        Close;
      ParamByName('iJobNoST').Value := JobNoST;
      ParamByName('iJobNoEND').Value := JobNoEND;
      Open;
      First;
      while not quJobFWO.EOF do
      begin
        with quSel1SubJob do
        begin
          if Active then
            Close;
          ParamByName('Job_No').Value := quJobFWOJOB_NO_1.Value;
          ParamByName('FWO_No').Value := quJobFWOFWO_NO.AsInteger;
          Open;
          if RecordCount = 0 then
          begin
            with dmCost.taSubjob do
            begin
              Append;
              FieldByName('Job_No').AsString := quJobFWOJOB_NO_1.AsString;
              FieldByName('Line_No').AsString := quJobFWOFWO_NO.AsString;
              if length(trim(quJobFWOFWO_NO.AsString)) = 3 then
                FieldByName('Sub_Job_No').AsString := quJobFWOFWO_NO.AsString
              else
                if length(trim(quJobFWOFWO_NO.AsString)) = 2 then
                  FieldByName('Sub_Job_No').AsString := '0'
                                                   + quJobFWOFWO_NO.AsString
                else
                  if length(trim(quJobFWOFWO_NO.AsString)) = 1 then
                    FieldByName('Sub_Job_No').AsString := '00'
                                                        + quJobFWOFWO_NO.AsString;
                FieldByName('Description').Value := quJobFWODESCRIPTION.AsString;
            end;
            dmCost.taSubJob.Post;
          end;
        end;
        quJobFWO.Next;
      end;
    end;
  end;
  showmessage('資料載入結束');
end;

procedure TfmJobImp.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  with quSel1SubJob do
  begin
    if Active then
      Close;
    Prepare;
  end;
  with quSel1Job do
  begin
    if Active then
      Close;
    Prepare;
  end;
end;

procedure TfmJobImp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with quSel1SubJob do
  begin
    if Active then
      Close;
    if Prepared then
      Unprepare;
  end;
  with quSel1Job do
  begin
    if Active then
      Close;
    if Prepared then
      Unprepare;
  end;
end;

procedure TfmJobImp.edJobNoSTExit(Sender: TObject);
begin
  if length(trim(edJobNoST.Text)) >  0  then
    edJobNoEnd.Text := edJobNoST.Text;
end;

end.
