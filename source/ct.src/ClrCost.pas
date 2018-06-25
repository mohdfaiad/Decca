unit ClrCost;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Db, DBTables;

type
  TfmClrCost = class(TForm)
    edJobNo: TEdit;
    edStartLineNo: TEdit;
    laJobNo: TLabel;
    laStartLineNo: TLabel;
    Label1: TLabel;
    bbOK: TBitBtn;
    bbCancel: TBitBtn;
    edEndLineNo: TEdit;
    spCostImport: TStoredProc;
    procedure edStartLineNoExit(Sender: TObject);
    procedure bbOKClick(Sender: TObject);
    procedure edEndLineNoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edJobNoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmClrCost: TfmClrCost;

implementation

uses CTCostDM, CTMain;
{$R *.DFM}

procedure TfmClrCost.edStartLineNoExit(Sender: TObject);
begin
  if trim(edStartLineNo.Text) <> '' then
  begin
    try
      StrToInt(edStartLineNo.Text);
    except
      ShowMessage('請輸入數字');
      edStartLineNo.SetFocus;
    end;
    if trim(edEndLineNo.Text) = '' then
      edEndLineNo.Text := edStartLineNo.Text;
  end;
end;

procedure TfmClrCost.bbOKClick(Sender: TObject);
begin
  if (trim(edJobNo.Text) = '') or
     (trim(edStartLineNo.Text) = '') or
     (trim(edEndLineNo.Text) = '') then
  begin
    ShowMessage('請先輸入選擇');
    edJobNo.SetFocus;
    Abort;
  end;
  with spCostImport do
  begin
    ParamByName('JobNo').Value := edJobNo.Text;
    ParamByName('StartLineNo').Value := StrToInt(edStartLineNo.Text);
    ParamByName('EndLineNo').Value := StrToInt(edEndLineNo.Text);
    ExecProc;
  end;
end;

procedure TfmClrCost.edEndLineNoExit(Sender: TObject);
begin
  if trim(edEndLineNo.Text) <> '' then
    try
      StrToInt(edEndLineNo.Text);
    except
      ShowMessage('請輸入數字');
      edEndLineNo.SetFocus;
    end;
end;

procedure TfmClrCost.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  edJobNo.Text := dmCost.quJobJOB_NO.asString;
end;

procedure TfmClrCost.edJobNoExit(Sender: TObject);
begin
  edJobNo.Text := UpperCase(edJobNo.Text);
end;

end.
