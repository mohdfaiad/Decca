unit SelComp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TfmSelComp = class(TForm)
    Label1: TLabel;
    cbSelCompany: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    lbSelCompany: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure cbSelCompanyChange(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSelComp: TfmSelComp;

implementation
uses DeccaData, DeccaMain;
{$R *.DFM}

procedure TfmSelComp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Close;
end;

procedure TfmSelComp.FormCreate(Sender: TObject);
var
  i : integer;
  wCompany,
  wLst_company,
  wFix_company : string;
begin
  cbSelCompany.ItemIndex := 0;
  with dmDecca do
  begin
    with quSel1User do
    begin
      if Active then
        Close;
      ParamByName('User_ID').asstring := wUserID;
      Open;
      wLst_Company := quSel1UserLST_COMPANY.AsString;
      wFix_Company := quSel1UserFIX_COMPANY.AsString;
      Close;
    end;
    with quCompany do
    begin
      if not Active then
        Open;
      First;
      i := 0;
      while not eof do
      begin
        wCompany := quCompanyCOMPANY_ID.AsString;
        if (wCompany = wLst_Company) then
        begin
          cbSelCompany.ItemIndex := i;
          cbSelCompany.Text := wCompany;
        end;
        i := i + 1;
        cbSelCompany.Items.Add(wCompany);
        Next;
      end;
    end;
  end;
  if wFix_Company = 'Y' then
    cbSelCompany.Enabled := False
  else
    cbSelCompanyChange(Self);
end;

procedure TfmSelComp.cbSelCompanyChange(Sender: TObject);
begin
  with dmDecca.quCompany do
  begin
    if Active then
      Close;
    Open;
    Filter := 'Company_ID =' + '''' + cbSelCompany.Text + '''';
    Filtered := True;
    First;
    wCompanyName := FieldByName('C_Name').AsString;
    lbSelCompany.Caption := wCompanyName;
    if lbSelCompany.Caption = '' then
      wCompanyName := FieldByName('E_Name').asstring;
    lbSelCompany.Caption := wCompanyName;

  end;
{  with dmDecca do
  begin
    with quSelCompany do
    begin
      if Active then
        Close;
      Params[0].AsString := cbSelCompany.Text;
      Params[1].AsString := UpperCase(dbCommon.Params.Values['USER NAME']);
      Open;
      if RecordCount = 0 then
      begin
        ShowMessage('用戶沒有''' + lbSelCompany.Caption + '''的使用權!');
        Exit;
      end;
    end;
  end;}
end;

procedure TfmSelComp.BitBtn2Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfmSelComp.BitBtn1Enter(Sender: TObject);
begin
  if trim(cbSelCompany.Text) = '' then
  begin
    Showmessage('請選擇公司');
    cbSelCompany.SetFocus;
  end;
end;

end.
