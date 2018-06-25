unit MoveFWO;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Wwquery, wwdblook, Wwdbdlg, StdCtrls, Buttons, Wwdatsrc;

type
  TfmMoveFWO = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btnOk: TBitBtn;
    btnClose: TBitBtn;
    edOrigJobNo: TEdit;
    edOrigSubJobNo: TEdit;
    dbluNewJobNo: TwwDBLookupComboDlg;
    dbluNewSubJobNo: TwwDBLookupComboDlg;
    quSelectJob: TwwQuery;
    quSelectJobJOB_NO_1: TStringField;
    quSelectJobJOB_NO_2: TStringField;
    quSelectJobDESCRIPTION: TStringField;
    quSelectJobJobNo: TStringField;
    quSelectSubJob: TwwQuery;
    dsSelectJob: TwwDataSource;
    quSelectSubJobSUB_JOB_NO: TStringField;
    quSelectSubJobDESCRIPTION: TStringField;
    quSelectJobFWO: TwwQuery;
    procedure quSelectJobCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmMoveFWO: TfmMoveFWO;

implementation

uses JCMain, JCDatadm;
{$R *.DFM}

procedure TfmMoveFWO.quSelectJobCalcFields(DataSet: TDataSet);
begin
  quSelectJobJobNo.AsString := trim(quSelectJobJOB_NO_1.AsString);
  if ((gUseJobNo2 = 'Y') and
     (trim(quSelectJobJOB_NO_2.AsString) <> '')) then
     quSelectJobJobNo.AsString := quSelectJobJobNo.AsString
                                + '-'
                                + quSelectJobJOB_NO_2.AsString;
end;

procedure TfmMoveFWO.FormCreate(Sender: TObject);
begin
  with quSelectJob do
    if not Active then
      Open;
  with quSelectSubJob do
    if not Active then
      Open;
  with dmJCData do
  begin
    edOrigJobNo.Text := quJOB_FWOJOB_NO_1.AsString;
    if ((gUseJobNo2 = 'Y') and
       (trim(quJOB_FWOJOB_NO_2.AsString) <> '')) then
        edOrigJobNo.Text := trim(edOrigJobNo.Text)
                          + '-'
                          + quJOB_FWOJOB_NO_2.AsString;
    edOrigSubJobNo.Text := quJOB_FWOSUB_JOB_NO.AsString;
    dbluNewJobNo.Text := edOrigJobNo.Text;
  end;
end;

procedure TfmMoveFWO.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with quSelectJob do
    if Active then
      Close;
  with quSelectSubJob do
    if Active then
      Close;
  with quSelectJobFWO do
    if Active then
      Close;
end;

procedure TfmMoveFWO.btnOkClick(Sender: TObject);
var
  i : integer;
begin
  if ((trim(dbluNewJobNo.Text) <> '') and
     (trim(dbluNewSubJobNo.Text) <> '')) then
  begin
    i := pos('-', trim(dbluNewJobNo.Text));
    with dmJCData do
      with quSelectJobFWO do
      begin
        if Active then
          Close;
        if i > 0 then
        begin
          ParamByName('Job_No_1').AsString :=
            copy(trim(dbluNewJobNo.Text), 1 , i - 1);
          ParamByName('Job_No_2').AsString :=
            copy(trim(dbluNewSubJobNo.Text), i, gJobNo2Len);
        end
        else
        begin
          ParamByName('Job_No_1').Value := trim(dbluNewJobNo.Text);
          ParamByName('Job_No_2').Value := ' ';
        end;
        ParamByName('FWO_No').Value := quJOB_FWOFWO_NO.AsString;
        Open;
        if quSelectJobFWO.Recordcount > 0 then
          ShowMessage('厂單已經存在, 未能夠更新厂單')
        else
        begin
          with quJOB_FWO do
          begin
            Edit;
            if i > 0 then
            begin
              quJOB_FWOJOB_NO_1.AsString := copy(dbluNewJobNo.Text, 1, i - 1);
              quJOB_FWOJOB_NO_2.AsString := copy(dbluNewJobNo.Text, i, gJobNo2Len);
            end
            else
            begin
              quJOB_FWOJOB_NO_1.AsString := dbluNewJobNo.Text;
              quJOB_FWOJOB_NO_2.AsString := ' ';
            end;
            quJOB_FWOSUB_JOB_NO.AsString := dbluNewSubJobNo.Text;
            Post;
            with quJOB_FWO do
            begin
              if Active then
                Close;
              Open;
            end;
          end;
        end;
      end;
  end;
end;


procedure TfmMoveFWO.btnCloseClick(Sender: TObject);
begin
  Close;
end;

end.
