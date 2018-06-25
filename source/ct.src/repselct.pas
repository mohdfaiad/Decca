unit repselct;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, CTCostDM, Buttons, ExtCtrls, Spin, Db, DBTables, DBCtrls, Menus, Printers;

type
  TfmRepSel = class(TForm)
    laNo: TLabel;
    laPrintNo: TLabel;
    btnSiAdd: TButton;
    btnAlAdd: TButton;
    btnSiDel: TButton;
    btnAlDel: TButton;
    btnPrint: TButton;
    btnPrintExit: TButton;
    lbNo: TListBox;
    lbPrintNo: TListBox;
    paLabel: TPanel;
    sbPrintSetup: TSpeedButton;
    sbExit: TSpeedButton;
    ps_PrintSetup: TPrinterSetupDialog;
    Panel1: TPanel;
    Label1: TLabel;
    edJobNo: TEdit;
    quLineNo: TQuery;
    gbFormat: TRadioGroup;
    quJobDesc: TQuery;
//    procedure btnJobNoAbortClick(Sender: TObject);
    procedure btnSiAddClick(Sender: TObject);
    procedure btnPrintExitClick(Sender: TObject);
    procedure btnAlAddClick(Sender: TObject);
    procedure btnSiDelClick(Sender: TObject);
    procedure btnAlDelClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure edPriJobNoEnter(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
    procedure sbPrintSetupClick(Sender: TObject);
    procedure mmPrintSetupClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edJobNoExit(Sender: TObject);
    procedure edJobNoDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmRepSel: TfmRepSel;
implementation

uses costrep, ctmain, ctdtlrep;



{$R *.DFM}

{
procedure TfmRepSel.btnJobNoAbortClick(Sender: TObject);
begin
end;
 }
procedure TfmRepSel.btnSiAddClick(Sender: TObject);
begin
  if lbNo.ItemIndex=-1 then
    lbNo.ItemIndex:=0;
  with lbPrintNo do
    Items.Add(lbNo.Items.Strings[lbNo.ItemIndex]);
  lbNo.Items.Delete(lbNo.ItemIndex);
  if lbPrintNo.Items.Count >0 then
  begin
    btnSiDel.Enabled:=True;
    btnAlDel.Enabled:=True;
    btnPrint.Enabled:=True;
  end;
  if lbNo.Items.Count<1 then
  begin
    btnSiAdd.Enabled:=False;
    btnAlAdd.Enabled:=False;
  end;
end;

procedure TfmRepSel.btnPrintExitClick(Sender: TObject);
begin
  close;
  Release;
end;

procedure TfmRepSel.btnAlAddClick(Sender: TObject);
begin
  with lbNo do
  begin
    while Items.Count >0 do
    begin
      lbPrintNo.Items.Add(Items.Strings[0]);
      Items.Delete(0);
    end;
  end;
  btnSiAdd.Enabled := False;
  btnAlAdd.Enabled:=False;
  btnSiDel.Enabled :=True;
  btnAlDel.Enabled:=True;
  btnPrint.Enabled:=True;
end;

procedure TfmRepSel.btnSiDelClick(Sender: TObject);
begin
  if lbPrintNo.ItemIndex=-1 then
    lbPrintNo.ItemIndex:=0;
  with lbNo do
    Items.Add(lbPrintNo.Items.Strings[lbPrintNo.ItemIndex]);
  lbPrintNo.Items.Delete(lbPrintNo.ItemIndex);
  if lbNo.Items.Count >0 then
  begin
    btnSiAdd.Enabled:=True;
    btnAlAdd.Enabled:=True;
  end;
  if lbPrintNo.Items.Count<1 then
  begin
    btnSiDel.Enabled:=False;
    btnAlDel.Enabled:=False;
    btnPrint.Enabled:=False;
  end;
end;

procedure TfmRepSel.btnAlDelClick(Sender: TObject);
begin
  with lbPrintNo do
  begin
    while Items.Count >0 do
    begin
      lbNo.Items.Add(Items.Strings[0]);
      Items.Delete(0);
    end;
  end;
  btnSiAdd.Enabled := True;
  btnAlAdd.Enabled:= True;
  btnSiDel.Enabled := False;
  btnAlDel.Enabled:= False;
  btnPrint.Enabled:= False;
end;

procedure TfmRepSel.btnPrintClick(Sender: TObject);
var
  JobNo : string[7];
  i : integer;
  FilterStr : string;
begin
  JobNo := trim(edJobNo.text);
  lbPrintNo.ItemIndex:= 0;
  FilterStr:='Line_NO = ' + '''' + lbPrintNo.Items.Strings[0]+'''';
  for i:=1 to lbPrintNo.Items.Count-1 do
    FilterStr := FilterStr + ' or '+'Line_No = ' + '''' + lbPrintNo.Items.Strings[i]+'''';
  if ((gbFormat.Enabled = True) and (gbFormat.ItemIndex = 1)) then
  begin
    Application.CreateForm(TfmDtlRep, fmDtlRep);
    with dmCost.quCostRep do
    begin
      if Active = True then
         Active := False;
      ParamByName('iJobNo').Value := JobNo;
      Filter := FilterStr;
      Filtered := True;
      Active := True;
    end;
{    with quSubJobCost do
    begin
      if not Active  then
         Active := True;
    end;     }
    with quJobDesc do
    begin
      if Prepared then
         Active := False;
      ParamByName('iJobNo').Value := JobNo;
      Active := True;
      fmDtlRep.qlTitle.Caption := trim(FieldbyName('Description').value)
                                 + '工時用料';
    end;
    fmDtlRep.repCosting.preview;
    fmDtlRep.Release;
  end
  else
  begin
    Application.CreateForm(TfmCosRep, fmCosRep);
    with dmCost.quCostRep do
    begin
      if Active = True then
         Active := False;
      ParamByName('iJobNo').Value := JobNo;
      Filter := FilterStr;
      Filtered := True;
      Active := True;
    end;
    with quJobDesc do
    begin
      if Prepared then
         Active := False;
      ParamByName('iJobNo').Value := JobNo;
      Active := True;
      fmCosRep.qlTitle.Caption := trim(FieldbyName('Description').value)
                               + '工時用料';
    end;
    fmCosRep.repCosting.preview;
    fmCosRep.Release;
  end;
end;


procedure TfmRepSel.edPriJobNoEnter(Sender: TObject);
begin
  lbNo.Clear;
  lbPrintNo.Clear;
end;

procedure TfmRepSel.sbExitClick(Sender: TObject);
begin
  close;
  Release;
end;

procedure TfmRepSel.sbPrintSetupClick(Sender: TObject);
begin
  ps_PrintSetup.Execute;
end;

procedure TfmRepSel.mmPrintSetupClick(Sender: TObject);
begin
  ps_PrintSetup.execute;
end;

procedure TfmRepSel.N3Click(Sender: TObject);
begin
  close;
  Release;
end;





procedure TfmRepSel.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  Funcs[2] := 'gbFormat';
  fmctmain.TestProgram(Funcs ); 
  btnSiAdd.Enabled := False;
  btnAlAdd.Enabled:= False;
  btnSiDel.Enabled := False;
  btnAlDel.Enabled:= False;
  btnPrint.Enabled:= False;
end;



procedure TfmRepSel.edJobNoExit(Sender: TObject);
begin
  lbNo.Clear;
  lbPrintNo.Clear;
  with quLineNo do
  begin
    if active then
       close;
    ParamByName('iJobNo').value := UpperCase(trim(edJobNo.Text));
    active := true;
    First;
    while not eof do
    begin
      lbNo.Items.Add(FieldByName('Line_No').AsString);
      Next;
    end;
  end;
  if (lbNo.Items.Count >=1) then
  begin
    btnSiAdd.Enabled := True;
    btnAlAdd.Enabled := True;
    btnSiDel.Enabled := False;
    btnAlDel.Enabled := False;
    btnPrint.Enabled := False;
  end;
end;



procedure TfmRepSel.edJobNoDblClick(Sender: TObject);
begin
  lbNo.Clear;
  lbPrintNo.Clear;
  edJobNo.Clear;
  btnSiAdd.Enabled := False;
  btnAlAdd.Enabled:= False;
  btnSiDel.Enabled := False;
  btnAlDel.Enabled:= False;
  btnPrint.Enabled:= False;
end;

procedure TfmRepSel.FormShow(Sender: TObject);
begin
  if ((dmCost.quJob.Active = True) and
      (dmCost.quJob.RecordCount > 0)) then
  begin
    edJobNo.Text := dmCost.quJob.FieldValues['Job_No'];
    with quLineNo do
    begin
      if active then
         close;
      ParamByName('iJobNo').value := UpperCase(trim(edJobNo.Text));
      active := true;
      First;
      while not eof do
      begin
        lbNo.Items.Add(FieldByName('Line_No').AsString);
        Next;
      end;
    end;
    btnSiAdd.Enabled := True;
    btnAlAdd.Enabled := True;
    btnSiDel.Enabled := False;
    btnAlDel.Enabled := False;
    btnPrint.Enabled := False;
  end;
end;

procedure TfmRepSel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  close;
  Release;
end;


end.

