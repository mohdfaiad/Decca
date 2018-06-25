unit Func;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, DBCtrls, Buttons, ExtCtrls, DBTables, Db, Wwquery,
  Wwdbigrd, Wwdbgrid, wwSpeedButton, wwDBNavigator, Wwdatsrc;

type
  TfmFunc = class(TForm)
    paWorker: TPanel;
    sbExit: TSpeedButton;
    sbPrintSetup: TSpeedButton;
    sbPrint: TSpeedButton;
    usPrgDef: TUpdateSQL;
    quPwdDef: TwwQuery;
    dsPwdDef: TwwDataSource;
    dnaPwdDef: TwwDBNavigator;
    dnaPwdDefFirst: TwwNavButton;
    dnaPwdDefPriorPage: TwwNavButton;
    dnaPwdDefPrior: TwwNavButton;
    dnaPwdDefNext: TwwNavButton;
    dnaPwdDefNextPage: TwwNavButton;
    dnaPwdDefLast: TwwNavButton;
    dnaPwdDefInsert: TwwNavButton;
    dnaPwdDefDelete: TwwNavButton;
    dnaPwdDefPost: TwwNavButton;
    dnaPwdDefCancel: TwwNavButton;
    dnaPwdDefFilterDialog: TwwNavButton;
    dnaPwdDefLocateDialog: TwwNavButton;
    dnaPwdDefSearchDialog: TwwNavButton;
    wwDBGrid1: TwwDBGrid;
    procedure sbExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure quPwdDefAfterPost(DataSet: TDataSet);
    procedure quPwdDefBeforeDelete(DataSet: TDataSet);
    procedure quPwdDefPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmFunc: TfmFunc;

implementation
uses DeccaData;
{$R *.DFM}

procedure TfmFunc.sbExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmFunc.FormCreate(Sender: TObject);
begin
  with quPwdDef do
  begin
    if not Prepared then
      Prepare;
    Open;
  end;
end;

procedure TfmFunc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with quPwdDef do
  begin
    Close;
    if Prepared then
      UnPrepare;
  end;
end;

procedure TfmFunc.quPwdDefAfterPost(DataSet: TDataSet);
begin
  with quPwdDef do
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

procedure TfmFunc.quPwdDefBeforeDelete(DataSet: TDataSet);
begin
  if MessageDlg('是否刪除該記錄?',mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    Abort;
end;

procedure TfmFunc.quPwdDefPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
var
  iDBIError: Integer;
begin
  //ShowMessage(IntToStr((E as EDBEngineError).Errors[0].Errorcode));
  if (E is EDBEngineError) then
  begin
    iDBIError := (E as EDBEngineError).Errors[0].Errorcode;
    case iDBIError of
      eRequiredFieldMissing:
        //The EmpNo field is defined as being required.
        begin
          MessageDlg('請輸入完整的記錄!', mtWarning, [mbOK], 0);
          Abort;
        end;
      eKeyViol:
        //The primary key is OrderNo
        begin
          MessageDlg('該記錄已經存在!', mtWarning,
            [mbOK], 0);
          Abort;
        end;
    end;
  end;
end;

end.
