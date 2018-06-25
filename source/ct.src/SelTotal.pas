unit SelTotal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, wwdbedit, wwdblook, Menus;

type
  TfmSelTotal = class(TForm)
    bbOK: TBitBtn;
    bbExit: TBitBtn;
    laJobNo: TLabel;
    laDescription: TLabel;
    dblcJobNo: TwwDBLookupCombo;
    dedDescription: TwwDBEdit;
    gbSele: TGroupBox;
    cbFirst: TCheckBox;
    cbSecond: TCheckBox;
    cbThird: TCheckBox;
    cbForth: TCheckBox;
    cbFifth: TCheckBox;
    gbItem: TGroupBox;
    cbQTY: TCheckBox;
    cbAMT: TCheckBox;
    mmSele: TPopupMenu;
    mmSeleAll: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure bbExitClick(Sender: TObject);
    procedure bbOKClick(Sender: TObject);
    procedure mmSeleAllClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSelTotal: TfmSelTotal;

implementation
  uses CTCostDM,
       CTMain,
       RepWork;
{$R *.DFM}

procedure TfmSelTotal.FormShow(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  Funcs[2] := 'cbAMT.Enabled';
  //=====================
  fmCTMain.TestProgram( Funcs );
  with dmCost do
  begin
    with quRepJob do
      if Not Active then
        Open;
  end;
end;

procedure TfmSelTotal.bbExitClick(Sender: TObject);
begin
   with dmCost do
   begin
     {with quRepSeleJob do
       if Active then
         Close;
     with quRepSeleSubJob do
       if Active then
        Close;
     with quRepJob do
     begin
       if Active then
         Close;
     end;}
   end;
   Close;
end;

procedure TfmSelTotal.bbOKClick(Sender: TObject);
var wSqlFilt : String;
begin
  if ((cbFirst.Checked) or (cbSecond.Checked)
     or (cbThird.Checked) or (cbForth.Checked) or (cbFifth.Checked))
     and ((cbQTY.checked ) or (cbAMT.checked))
     and (Trim(dblcJobNo.Text)<>'') then
  begin
    with dmCost do
    begin
      with quRepWorkDone do
      begin
        if Active then
          Close;
        with sql do
        begin
          Clear;
          Add('SELECT * FROM report_work(:JOB_NO) ');
          wSqlFilt := ' (oSection_No = '' '')';
          if (cbFirst.Checked) then
            wSqlFilt := wSqlFilt + ' or (oSection_No = ''1'')';
          if (cbSecond.Checked) then
            wSqlFilt := wSqlFilt + ' or ( oSection_No = ''2'')';
          if (cbThird.Checked) then
            wSqlFilt := wSqlFilt + ' or ( oSection_No = ''3'')';
          if (cbForth.Checked) then
            wSqlFilt := wSqlFilt +' or ( oSection_No = ''4'')';
          if (cbFifth.Checked) then
            wSqlFilt := wSqlFilt +' or ( oSection_No = ''5'')';
          Add(' where ('+  wSqlFilt+')');
        end;
        ParamByName('Job_no').AsString := quRepJobJOB_NO.AsString;
        Open;
      end;
    end;
    Application.CreateForm(TqrRepWork,qrRepWork);
    if (cbQTY.Checked) then
    begin
      qrRepWork.qrdbtBudgetQTY.DataField := 'OSUM_BUG_QTY';
      qrRepWork.qrdbtStdQTY.DataField := 'OSUM_STD_QTY';
      qrRepWork.qrdbtActQty.DataField := 'OSUM_ACT_QTY';
    end else
    begin
      qrRepWork.qrdbtBudgetQTY.DataField := '';
      qrRepWork.qrdbtStdQTY.DataField := '';
      qrRepWork.qrdbtActQty.DataField := '';
    end;
    if (cbAMT.Checked) then
    begin
      qrRepWork.qrdbtBudgetAmt.DataField := 'OSUM_BUG_AMT';
      qrRepWork.qrdbtStdAmt.DataField := 'OSUM_STD_AMT';
      qrRepWork.qrdbtActAmt.DataField := 'OSUM_ACT_AMT';
    end else
    begin
      qrRepWork.qrdbtBudgetAmt.DataField := '';
      qrRepWork.qrdbtStdAmt.DataField := '';
      qrRepWork.qrdbtActAmt.DataField := '';
    end;
    qrRepWork.qrlUserID.Caption := wUser;
    try
      qrRepWork.Prepare;
      qrRepWork.Preview;
    finally
      qrRepWork.Destroy ;
    end;
  end else
    ShowMessage('未正确選擇數据,或未授權,不能打印');
end;

procedure TfmSelTotal.mmSeleAllClick(Sender: TObject);
begin
  if Not cbFirst.Checked then
    cbFirst.Checked := True;
  if Not cbSecond.Checked then
    cbSecond.Checked := True;
  if Not cbThird.Checked then
    cbThird.Checked := True;
  if Not cbForth.Checked then
    cbForth.Checked := True;
  if Not cbFifth.Checked then
    cbFifth.Checked := True;
end;

end.
