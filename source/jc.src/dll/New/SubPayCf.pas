unit SubPayCf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, wwdblook, Buttons,RepFwoDm, Wwdbdlg,printers;

type
  TfmSubPayCf = class(TForm)
    laJobNo: TLabel;
    laContractNo: TLabel;
    laApplyDate: TLabel;
    dtpApplyDate: TDateTimePicker;
    dblcContraceNo: TwwDBLookupCombo;
    bbPrint: TBitBtn;
    bbClose: TBitBtn;
    dblcJobNo: TwwDBLookupComboDlg;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbPrintClick(Sender: TObject);
    procedure SelectContractNo(Sender: TObject);
    procedure dblcJobNoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSubPayCf: TfmSubPayCf;

implementation
  uses SubContr;
{$R *.DFM}

procedure TfmSubPayCf.FormShow(Sender: TObject);
begin
  Caption :=  wCompanyName+ '=='+Caption  ;
  dtpApplyDate.Date := Date;
  with dmRepFwo do
  begin
    with quJobFile do
      if Not Active then
        Open;
  end;
  SelectContractNo(Self);
end;

procedure TfmSubPayCf.SelectContractNo(Sender: TObject);
begin
  with dmRepFwo do
  begin
    with quSubContract  do
    begin
      if Active then
        Close;
      with sql do
      begin
        Clear;
        Add(' select * From SubContract ');
        if (Trim(dblcJobNo.Text)<>'') then
          Add(' Where Job_no_1 = ''' + quJobFileJOB_NO_1.AsString
            +''' and Job_No_2 =''' + quJobFileJOB_NO_2.AsString +'''');
        Add(' Order by SubContract_No ');
      end;
      Open;
    end;
  end;
end;

procedure TfmSubPayCf.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with dmRepFwo do
  begin
    with quJobFile do
      if  Active then
        Close;
    with quSubContract  do
      if Active then
        Close;
  end;
end;

procedure TfmSubPayCf.bbPrintClick(Sender: TObject);
begin
  if (Trim(dblcContraceNo.Text)<> '') then
  with dmRepFwo do
  begin
    with quRepSubContractdate do
    begin
      if Active then
        Close;
      ParamByName('SubContract_No').AsString := Trim(dblcContraceNo.Text);
      ParamByName('ApplyDate').AsDate := dtpApplyDate.Date ;
      Open;
    end;  
    with quRepSubContract do
    begin
      if Active then
        Close;
      ParamByName('SubContract_No').AsString := Trim(dblcContraceNo.Text);
      ParamByName('ApplyDate').AsDate := dtpApplyDate.Date ;
      Open;
    end;
    Application.CreateForm(TfmSubContr,fmSubContr);
    with fmSubContr do
    begin
      with quCertNo do
      begin
        if Active then
          Close;
        ParamByName('SubContract_No').AsString := Trim(dblcContraceNo.Text);
        ParamByName('ApplyDate').AsDate := dtpApplyDate.Date ;
        Open;
      end;
      qrlCertNo.Caption := qrlCertNo.Caption + '('+ quCertNoCERT_NO.AsString +')';
      qrlSubMiss.Caption := qrlSubMiss.Caption + '('+ quCertNoINVC_NO.AsString +')';
      qrlsum.Caption := FloatToStr(quSubContractCONTRACT_SUM.AsFloat
        + quSubContractEST_VO_AMT.AsFloat + quRepSubContractDAYWORKS.AsFloat);
      qrlApplyDate.Caption := DateToStr(dtpApplyDate.Date);
//      Printer.Printers.Add('sajfh');
      Try
        qrSubContr.Prepare;
        qrSubContr.Preview;
      finally
        Release;
      end;
    end;
  end else
    ShowMessage('未選擇合約編號!');
end;

procedure TfmSubPayCf.dblcJobNoChange(Sender: TObject);
begin
  SelectContractNo(Self); 
end;

end.
