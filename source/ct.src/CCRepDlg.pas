unit CCRepDlg;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, Db, DBTables,Dialogs, ExtCtrls, Wwquery, wwdblook, Wwdbdlg;

type
  TfmCCRepDlg = class(TForm)
    SrcList: TListBox;
    DstList: TListBox;
    SrcLabel: TLabel;
    IncludeBtn: TSpeedButton;
    ExcludeBtn: TSpeedButton;
    ExAllBtn: TSpeedButton;
    Label1: TLabel;
    btPrint: TButton;
    btClose: TButton;
    Label2: TLabel;
    quSelCostCat: TQuery;
    dsSelCostCat: TDataSource;
    rdgFormat: TRadioGroup;
    dbLCDJobNo: TwwDBLookupComboDlg;
    quJobNo: TwwQuery;
    quJobNoJOB_NO: TStringField;
    quJobNoDESCRIPTION: TStringField;
    quJobNoQUOT_NO: TStringField;
    quJobNoKEYWORD: TStringField;
    procedure IncludeBtnClick(Sender: TObject);
    procedure ExcludeBtnClick(Sender: TObject);
    procedure ExcAllBtnClick(Sender: TObject);
    procedure MoveSelected(List: TCustomListBox; Items: TStrings);
    procedure SetItem(List: TListBox; Index: Integer);
    function GetFirstSelection(List: TCustomListBox): Integer;
    procedure SetButtons;
    procedure FormCreate(Sender: TObject);
    procedure btCloseClick(Sender: TObject);
    procedure btPrintClick(Sender: TObject);
    procedure dbLCDJobNoChange(Sender: TObject);
    procedure dbLCDJobNoEnter(Sender: TObject);
    procedure dbLCDJobNoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmCCRepDlg: TfmCCRepDlg;

implementation

uses ctmain, CTCostDM, CCAmtRep, CCQtyRep;

{$R *.DFM}

procedure TfmCCRepDlg.IncludeBtnClick(Sender: TObject);
var
  Index: Integer;
begin
  if DstList.Items.Count >= 6 then
    Abort;
  Index := GetFirstSelection(SrcList);
  MoveSelected(SrcList, DstList.Items);
  SetItem(SrcList, Index);
  if DstList.Items.Count > 0 then
    btPrint.Enabled := True;
  if DstList.Items.Count >= 6 then
    IncludeBtn.Enabled := False;
end;

procedure TfmCCRepDlg.ExcludeBtnClick(Sender: TObject);
var
  Index: Integer;
begin
  Index := GetFirstSelection(DstList);
  MoveSelected(DstList, SrcList.Items);
  SetItem(DstList, Index);
  if DstList.Items.Count < 1 then
    btPrint.Enabled := False;
end;
{
procedure TfmRepDlgD.IncAllBtnClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to SrcList.Items.Count - 1 do
    DstList.Items.AddObject(SrcList.Items[I],
      SrcList.Items.Objects[I]);
  SrcList.Items.Clear;
  SetItem(SrcList, 0);
  if DstList.Items.Count > 0 then
    btPrint.Enabled := True;
end;  }

procedure TfmCCRepDlg.ExcAllBtnClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to DstList.Items.Count - 1 do
    SrcList.Items.AddObject(DstList.Items[I], DstList.Items.Objects[I]);
  DstList.Items.Clear;
  SetItem(DstList, 0);
  if DstList.Items.Count < 1 then
    btPrint.Enabled := False;
end;

procedure TfmCCRepDlg.MoveSelected(List: TCustomListBox; Items: TStrings);
var
  I: Integer;
begin
  for I := List.Items.Count - 1 downto 0 do
    if List.Selected[I] then
    begin
      Items.AddObject(List.Items[I], List.Items.Objects[I]);
      List.Items.Delete(I);
    end;
end;

procedure TfmCCRepDlg.SetButtons;
var
  SrcEmpty, DstEmpty: Boolean;
begin
  SrcEmpty := SrcList.Items.Count = 0;
  DstEmpty := DstList.Items.Count = 0;
  IncludeBtn.Enabled := not SrcEmpty;
//  IncAllBtn.Enabled := not SrcEmpty;
  ExcludeBtn.Enabled := not DstEmpty;
  ExAllBtn.Enabled := not DstEmpty;
end;

function TfmCCRepDlg.GetFirstSelection(List: TCustomListBox): Integer;
begin
  for Result := 0 to List.Items.Count - 1 do
    if List.Selected[Result] then Exit;
  Result := LB_ERR;
end;

procedure TfmCCRepDlg.SetItem(List: TListBox; Index: Integer);
var
  MaxIndex: Integer;
begin
  with List do
  begin
    SetFocus;
    MaxIndex := List.Items.Count - 1;
    if Index = LB_ERR then Index := 0
    else if Index > MaxIndex then Index := MaxIndex;
    Selected[Index] := True;
  end;
  SetButtons;
end;

procedure TfmCCRepDlg.FormCreate(Sender: TObject);
var
  FilterStr : string;
  FilterFlg : Boolean;
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  Funcs[2] := 'rdgFormat';  
  fmCTMain.TestProgram(Funcs);
end;

procedure TfmCCRepDlg.btCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmCCRepDlg.btPrintClick(Sender: TObject);
var
  CostCat : array[1..6] of string[7];
  i : integer;
begin
  with DstList do
  begin
    if Items.Count = 6 then
    begin
      for i:=0 to 5 do
        costcat[i+1] := Items.Strings[i];
    end
    else
    if Items.Count = 5 then
    begin
      for i:=0 to 4 do
        costcat[i+1] := Items.Strings[i];
      costcat[6] := '';
    end
    else
    if Items.Count = 4 then
    begin
      for i:=0 to 3 do
        costcat[i+1] := Items.Strings[i];
      for i:=5 to 6 do
        costcat[i] := '';
    end
    else
    if Items.Count = 3 then
    begin
      for i:=0 to 2 do
        costcat[i+1] := Items.Strings[i];
      for i:=4 to 6 do
        costcat[i] := '';
    end
    else
    if Items.Count = 2 then
    begin
      for i:=0 to 1 do
        costcat[i+1] := Items.Strings[i];
      for i:=3 to 6 do
        costcat[i] := '';
    end
    else
    begin
      costcat[1] := Items.Strings[0];
      for i:=2 to 6 do
        costcat[i] := '';
    end
  end;
  if (rdgFormat.Enabled = True) and
     (rdgFormat.ItemIndex = 1) then
  begin
    with dmCost.quSltCostCatAmtRep do
    begin
      if Active then Close;
      if not prepared then Prepare;
      ParamByName('iJOBNO').AsString := trim(dbLCDJobNo.DisplayValue);
      ParamByName('iCOSTCAT1').AsString := CostCat[1];
      ParamByName('iCOSTCAT2').AsString := CostCat[2];
      ParamByName('iCOSTCAT3').AsString := CostCat[3];
      ParamByName('iCOSTCAT4').AsString := CostCat[4];
      ParamByName('iCOSTCAT5').AsString := CostCat[5];
      ParamByName('iCOSTCAT6').AsString := CostCat[6];
      Open;
      try
        Application.CreateForm(TqrSltCtCatAmt, qrSltCtCatAmt);
        qrSltCtCatAmt.qrlCostCat1.Caption := CostCat[1];
        qrSltCtCatAmt.qrlCostCat2.Caption := CostCat[2];
        qrSltCtCatAmt.qrlCostCat3.Caption := CostCat[3];
        qrSltCtCatAmt.qrlCostCat4.Caption := CostCat[4];
        qrSltCtCatAmt.qrlCostCat5.Caption := CostCat[5];
        qrSltCtCatAmt.qrlCostCat6.Caption := CostCat[6];
        qrSltCtCatAmt.PreView;
        qrSltCtCatAmt.Destroy;
      except
        ShowMessage('不能夠打開報表');
      end;
      Close;
      unprepare;
    end;
  end
  else
  begin
    with dmCost.quSltCostCatQtyRep do
    begin
      if Active then Close;
      if not prepared then Prepare;
      ParamByName('iJOBNO').AsString := trim(dbLCDJobNo.DisplayValue);
      ParamByName('iCostCat1').AsString := CostCat[1];
      ParamByName('iCostCat2').AsString := CostCat[2];
      ParamByName('iCostCat3').AsString := CostCat[3];
      ParamByName('iCostCat4').AsString := CostCat[4];
      ParamByName('iCostCat5').AsString := CostCat[5];
      ParamByName('iCostCat6').AsString := CostCat[6];
      Open;
      try
        Application.CreateForm(TqrSltCtCatQty, qrSltCtCatQty);
        qrSltCtCatQty.qrlCostCat1.Caption := CostCat[1];
        qrSltCtCatQty.qrlCostCat2.Caption := CostCat[2];
        qrSltCtCatQty.qrlCostCat3.Caption := CostCat[3];
        qrSltCtCatQty.qrlCostCat4.Caption := CostCat[4];
        qrSltCtCatQty.qrlCostCat5.Caption := CostCat[5];
        qrSltCtCatQty.qrlCostCat6.Caption := CostCat[6];
        qrSltCtCatQty.PreView;
        qrSltCtCatQty.Destroy;
      except
        ShowMessage('不能夠打開報表');
      end;
      Close;
      unprepare;
    end;
  end;
end;

procedure TfmCCRepDlg.dbLCDJobNoChange(Sender: TObject);
begin
  SrcList.Items.Clear;
  DstList.Items.Clear;
  ExcludeBtn.Enabled := False;
  ExAllBtn.Enabled := False;
  btPrint.Enabled := False;
  with quSelCostCat do
  begin
    if Active then
      Close;
    ParamByName('jobno').AsString := trim(dbLCDJobNo.DisplayValue);
    Open;
    First;
    while not eof do
    begin
      SrcList.Items.Add(FieldByName('COST_CAT').AsString);
      Next;
    end;
    Close;
  end;
  if SrcList.Items.Count > 0 then
    IncludeBtn.Enabled := True
  else
    IncludeBtn.Enabled := False;
end;

procedure TfmCCRepDlg.dbLCDJobNoEnter(Sender: TObject);
begin
  with quJobNo do
  begin
    if not Active then Open;
  end;
end;

procedure TfmCCRepDlg.dbLCDJobNoExit(Sender: TObject);
begin
  with quJobNo do
  begin
    if Active then Close;
  end;  
end;

procedure TfmCCRepDlg.FormShow(Sender: TObject);
begin
  with dmCost.quJob do
  begin
    if Active and (RecordCount > 0) then
    begin
      dbLCDJobNo.Value := dmCost.quJobJOB_NO.Value;
      dbLCDJobNoChange(Self);
    end;
  end;
end;

end.
