unit repselec;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, Buttons, datamodu;

type
  TfmSelRep = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edJobNo: TEdit;
    Label3: TLabel;
    edLineNoST: TEdit;
    edLineNoEND: TEdit;
    btnOk: TBitBtn;
    btnExit: TBitBtn;
    quLineNo: TQuery;
    quCostSum: TQuery;
    procedure btnExitClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSelRep: TfmSelRep;

implementation

uses costrep;

{$R *.DFM}

procedure TfmSelRep.btnExitClick(Sender: TObject);
begin
  Close;
  Release;
end;

procedure TfmSelRep.btnOkClick(Sender: TObject);
var
  LineNoST,
  LineNoEND,
  LineNo : integer;
  JobNo : string[7];
  Dsply_Flg : string[1];
  QtyUnit : string[10];
begin
  Application.CreateForm(TfmCosRep, fmCosRep);
  JobNo := trim(edJobNo.Text);
  LineNoST := strtoint(trim(edLineNoST.Text));
  LineNoEND := strtoint(trim(edLineNoEND.Text));
  if (LineNoST > LineNoEND) or (length(trim(edLineNoEND.Text)) < 1) then
  begin
    showmessage('序列號輸入有誤');
    Abort;
  end;
  with quLineNo do
  begin
    if Prepared then
       Active := False;
    ParamByName('iJob_No').Value := JobNo;
    ParamByName('iLineNoST').Value := LineNoST;
    ParamByName('iLineNoEND').Value := LineNoEND;
    Active := True;
    if Recordcount < 1 then
    begin
      showmessage('工程編號或序列號輸入有誤');
      Abort;
    end;
  end;
  quLineNo.First;
  while not quLineNo.eof do
  begin
    quCostSum.Active := False;
    LineNo := quLineNo.FieldValues['Line_No'];
    with quSubJob do
    begin
      if Prepared then
          Active := False;
        ParamByName('iJob_No').Value := JobNo;
        ParamByName('iLine_No').Value := LineNo;
        Active := True;
        fmCosRep.qlDimension.Caption := FieldByName('Jlength').Asstring + ' X '
                                       + FieldByName('Jwidth').Asstring + ' X '
                                       + FieldByName('Jheight').Asstring + ' MM';
      end;
      with fmCosRep.quSubJobCost do
      begin
        if Prepared then
           Active := False;
        ParamByName('iJob_No').Value := JobNo;
        ParamByName('iLine_No').Value := LineNo;
        Active := True;
        First;
      with fmCosRep.quJobDesc do
      begin
        if Prepared then
           Active := False;
        ParamByName('iJob_No').Value := JobNo;
        Active := True;
        fmCosRep.qlTitle.Caption := trim(FieldbyName('Description').value)
                                 + '工時用料';
      end;
      with quCostSum do
      begin
        if Active = True then
           Active := False;
        ParamByName('iJobNo').Value := JobNo;
        ParamByName('iLineNo').Value := LineNo;
        Active := True;
    {    fmCosRep.qlBudgetTotal.Caption := floattostr(FieldValues['BudgetSum'])
                                 + ' HK$';
        fmCosRep.qlActualTotal.Caption := floattostr(FieldValues['ActualSum'])
                                 + ' HK$';  }
      end;
      fmCosRep.repCosting.preview;
    end;
    quLineNo.Next;
  end;
  fmCosRep.Release;
end;

procedure TfmSelRep.FormShow(Sender: TObject);
begin
  if ((dmCost.quJob.Active = True) and
      (dmCost.quJob.RecordCount > 1)) then
  edJobNo.Text := dmCost.quJob.FieldValues['Job_No'];
end;

end.
