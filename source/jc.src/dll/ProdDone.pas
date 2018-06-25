unit ProdDone;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Wwdbdlg, StdCtrls, Buttons, wwdblook, ComCtrls,RepFwoDm, printers,
  ExtCtrls;

type
  TfmProdDone = class(TForm)
    laJobCostCat: TLabel;
    laComplete: TLabel;
    dtpComplete: TDateTimePicker;
    bbPrint: TBitBtn;
    bbClose: TBitBtn;
    dblcJobCostCat: TwwDBLookupComboDlg;
    rgLine: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure bbPrintClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmProdDone: TfmProdDone;

implementation
  uses RpPdDone;
{$R *.DFM}

procedure TfmProdDone.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  dtpComplete.Date := Date;
end;

procedure TfmProdDone.FormShow(Sender: TObject);
begin
  with dmRepFwo do
  begin
    with quJobCostFile do
      if Not Active then
        Open;
  end;
end;

procedure TfmProdDone.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  with dmRepFwo do
  begin
    with quJobCostFile do
      if Active then
        Close;
  end;
end;

procedure TfmProdDone.bbPrintClick(Sender: TObject);
begin
  if Trim(dblcJobCostCat.Text)<> '' then
  begin
    with dmRepFwo do
    begin
      with  quRepProduct do
      begin
        if Active then
          Close;
        ParamByName('JOB_COST_CAT').AsString := Trim(dblcJobCostCat.Text);
        ParamByName('FINISH_DATE').AsDate := dtpComplete.Date;
        Open;
      end;
    end;
    Application.CreateForm(TfmRpPdDone,fmRpPdDone);
    with fmRpPdDone do
    begin
      if rgLine.ItemIndex = 0 then
      begin
        qrdbtFwoNo.Frame.Style := psSolid;
        qrdbtFwoDesc.Frame.Style := psSolid;
        qrdbtFinishDate.Frame.Style := psSolid;
        qrlFinishFlg.Frame.Style := psSolid;
        qrdbtLastDate.Frame.Style := psSolid;
        qrdbtProdDate.Frame.Style := psSolid;
        qrdbtOrderDate.Frame.Style := psSolid;
        qrdbtOrderBy.Frame.Style := psSolid;
        qrdbtCompleteDate.Frame.Style := psSolid;
        qrdbtReceiveDate.Frame.Style := psSolid;
        qrlComment.Frame.Style := psSolid;
        qrdbtQty.Frame.Style := psSolid;
        qrlFoot1.Frame.Style := psSolid;
      end else
      begin
        qrdbtFwoNo.Frame.Style := psClear;
        qrdbtFwoDesc.Frame.Style := psClear;
        qrdbtFinishDate.Frame.Style := psClear;
        qrlFinishFlg.Frame.Style := psClear;
        qrdbtLastDate.Frame.Style := psClear;
        qrdbtProdDate.Frame.Style := psClear;
        qrdbtOrderDate.Frame.Style := psClear;
        qrdbtOrderBy.Frame.Style := psClear;
        qrdbtCompleteDate.Frame.Style := psClear;
        qrdbtReceiveDate.Frame.Style := psClear;
        qrlComment.Frame.Style := psClear;
        qrdbtQty.Frame.Style := psClear;
        qrlFoot1.Frame.Style := psClear;
      end;
      qrlUserName.Caption := wUserID;
      qrlcompany.Caption := wCompanyName;
      qrlCostCat.Caption := copy(Trim(dmRepFwo.quJobCostFileDESCRIPTION.AsString),1,4);
      Try
        qrProdDone.Prepare;
        qrProdDone.Preview;
      finally
        Release;
      end;
    end;
    with dmRepFwo do
    begin
      with  quRepProduct do
      begin
        if Active then
          Close;
      end;
    end;
  end;
end;

end.
