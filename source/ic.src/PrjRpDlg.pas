unit PrjRpDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, wwdblook;

type
  TfmPrjRpDlg = class(TForm)
    Label1: TLabel;
    edJobNo1: TEdit;
    gbType: TGroupBox;
    rbFwo: TRadioButton;
    rbItem: TRadioButton;
    gbItem: TGroupBox;
    dlcStartItem: TwwDBLookupCombo;
    dlcEndItem: TwwDBLookupCombo;
    gbFwo: TGroupBox;
    edStartFwo: TEdit;
    edEndFwo: TEdit;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edJobNo2: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmPrjRpDlg: TfmPrjRpDlg;

implementation
uses IcData, rpPrjUseF, rpPrjUseI;
{$R *.DFM}

procedure TfmPrjRpDlg.FormCreate(Sender: TObject);
begin
  with dmICData.quItemFil do
    if not Active then
      Open;
end;

procedure TfmPrjRpDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with dmICData.quItemFil do
    if Active then
      Close;
end;

procedure TfmPrjRpDlg.bbOkClick(Sender: TObject);
begin
  if rbFwo.Checked then
  begin
    Application.CreateForm(TqrPrjUseF, qrPrjUseF);
    try
      with qrPrjUseF.quPrjUseRepF do
      begin
        if  Active then
          Close;
        ParamByName('Job_no_1').AsString := Trim(edJobNo1.Text);
        ParamByName('Job_no_2').AsString := Trim(edJobNo2.Text);
        ParamByName('StartFwo').AsString := Trim(edStartFwo.Text);
        ParamByName('EndFwo').AsString := Trim(edEndFwo.Text);
        ParamByName('StartItem').AsString := Trim(dlcStartItem.Text);
        ParamByName('EndItem').AsString := Trim(dlcEndItem.Text);
      end;
      qrPrjUseF.Preview;
    finally
      with qrPrjUseF.quPrjUseRepF do
        if  Active then
          Close;
      qrPrjUseF.Destroy;
    end;
  end
  else
  begin
    Application.CreateForm(TqrPrjUseI, qrPrjUseI);
    try
      with qrPrjUseI.quPrjUseRepI do
      begin
        if  Active then
          Close;
        ParamByName('Job_no_1').AsString := Trim(edJobNo1.Text);
        ParamByName('Job_no_2').AsString := Trim(edJobNo2.Text);
        ParamByName('StartFwo').AsString := Trim(edStartFwo.Text);
        ParamByName('EndFwo').AsString := Trim(edEndFwo.Text);
        ParamByName('StartItem').AsString := Trim(dlcStartItem.Text);
        ParamByName('EndItem').AsString := Trim(dlcEndItem.Text);
      end;
      qrPrjUseI.Preview;
    finally
      with qrPrjUseI.quPrjUseRepI do
        if  Active then
          Close;
      qrPrjUseI.Destroy;
    end;
  end;
end;

end.
