unit emcontrl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, wwdbedit, db, DBTables, Wwquery, wwdblook;

type
  TfmControl = class(TForm)
    wwDBEdit1: TwwDBEdit;
    btnSave: TBitBtn;
    btnAbort: TBitBtn;
    Label1: TLabel;
    dbLKCDept: TwwDBLookupCombo;
    Label2: TLabel;
    quDepartment: TwwQuery;
    quDepartmentDEPARTMENT_CODE: TStringField;
    quDepartmentDESCRIPTION: TStringField;
    procedure btnSaveClick(Sender: TObject);
    procedure btnAbortClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmControl: TfmControl;

implementation

uses
  emdatamd, emmain;

{$R *.DFM}

procedure TfmControl.btnSaveClick(Sender: TObject);
begin
  with dmEMData.taEmcontrol do
  begin
    if State = dsInsert then
    begin
      dmEMData.taEmcontrolCONTROL_KEY.Value := 1;
      Post;
    end
    else
    if State = dsEdit then
      Post;
    exit;
  end;
end;

procedure TfmControl.btnAbortClick(Sender: TObject);
begin
  with dmEMData.taEmcontrol do
  begin
    if (State = dsInsert) or (State = dsEdit) then
      Cancel;
    exit;
  end;
end;

procedure TfmControl.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  with dmEMData.taEmcontrol do
  begin
    if not Active then Open;
  end;
end;

procedure TfmControl.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with dmEMData.quDepartment do
  begin
    if Active then Close;
  end;  
  with dmEMData.taEmcontrol do
  begin
    if Active then Close;
  end;
end;

procedure TfmControl.FormShow(Sender: TObject);
begin
  with quDepartment do
  begin
    if not Active then Open;
  end;
end;

end.
