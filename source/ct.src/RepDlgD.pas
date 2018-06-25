unit CCRepDlg;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, Db, DBTables,Dialogs, ExtCtrls;

type
  TfmCCRepDlg = class(TForm)
    SrcList: TListBox;
    DstList: TListBox;
    SrcLabel: TLabel;
    IncludeBtn: TSpeedButton;
    ExcludeBtn: TSpeedButton;
    ExAllBtn: TSpeedButton;
    Label1: TLabel;
    cbQuotNo: TComboBox;
    btPrint: TButton;
    btClose: TButton;
    Label2: TLabel;
    quSelCostCat: TQuery;
    dsSelCostCat: TDataSource;
    rdgFormat: TRadioGroup;
    procedure IncludeBtnClick(Sender: TObject);
    procedure ExcludeBtnClick(Sender: TObject);
    procedure ExcAllBtnClick(Sender: TObject);
    procedure MoveSelected(List: TCustomListBox; Items: TStrings);
    procedure SetItem(List: TListBox; Index: Integer);
    function GetFirstSelection(List: TCustomListBox): Integer;
    procedure SetButtons;
    procedure FormCreate(Sender: TObject);
    procedure cbQuotNoChange(Sender: TObject);
    procedure btCloseClick(Sender: TObject);
    procedure btPrintClick(Sender: TObject);
    procedure SrcListClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmCCRepDlg: TfmCCRepDlg;

implementation

uses dmQuot,RepPrjItm, QSMain, ItmAmRep, ItmQtRep;

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
  Funcs[2] := 'rdgFormat';  //報表內容選擇
  fmQSMain.TestProgram(Funcs);
  cbQuotNo.Items.Clear;
  with dmQuotData.quUserSecurityDlg do
  begin
    FilterStr := Filter;
    FilterFlg := Filtered;
    ParamByname('User_ID').AsString := wUser;
    Filter := 'Quot_Type = ' + '''' + 'Q' + '''';
    Filtered := True;
    Open;
    First;
    cbQuotNo.Items.Clear;
    while not eof do
    begin
       cbQuotNo.Items.Add(FieldByName('QUOT_NO').AsString);
       Next;
    end;
    Close;
    Filter := FilterStr;
    Filtered := FilterFlg;
  end;
  with cbQuotNo do
  begin
    if Items.Count>0 then
    begin
      ItemIndex:=0;
      IncludeBtn.Enabled :=True;
//      IncAllBtn.Enabled :=True;
    end;
  end;
  cbQuotNo.ItemIndex:=0;
  cbQuotNoChange(Self);
end;

procedure TfmCCRepDlg.cbQuotNoChange(Sender: TObject);
begin
  SrcList.Items.Clear;
  DstList.Items.Clear;
  ExcludeBtn.Enabled := False;
  ExAllBtn.Enabled := False;
  btPrint.Enabled := False;
  with quSelItm do
  begin
    if Active then
      Close;
    ParamByName('iQuot_no').AsString := cbQuotNo.Text;
    Open;
    First;
    while not eof do
    begin
      SrcList.Items.Add(FieldByName('quot_item_no').AsString);
      Next;
    end;
    Close;
  end;
  if SrcList.Items.Count > 0 then
    IncludeBtn.Enabled := True
  else
    IncludeBtn.Enabled := False;
end;

procedure TfmCCRepDlg.btCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmCCRepDlg.btPrintClick(Sender: TObject);
var
  quotitemno : array[1..8] of string[6];
  i : integer;
begin
  with DstList do
  begin
    if Items.Count = 8 then
    begin
      for i:=0 to 7 do
        quotitemno[i+1] := Items.Strings[i];
    end
    else
    if Items.Count = 7 then
    begin
      for i:=0 to 6 do
        quotitemno[i+1] := Items.Strings[i];
      quotitemno[8] := '';
    end
    else
    if Items.Count = 6 then
    begin
      for i:=0 to 5 do
        quotitemno[i+1] := Items.Strings[i];
      for i:=7 to 8 do
        quotitemno[i] := '';
    end
    else
    if Items.Count = 5 then
    begin
      for i:=0 to 4 do
        quotitemno[i+1] := Items.Strings[i];
      for i:=6 to 8 do
        quotitemno[i] := '';
    end
    else
    if Items.Count = 4 then
    begin
      for i:=0 to 3 do
        quotitemno[i+1] := Items.Strings[i];
      for i:=5 to 8 do
        quotitemno[i] := '';
    end
    else
    if Items.Count = 3 then
    begin
      for i:=0 to 2 do
        quotitemno[i+1] := Items.Strings[i];
      for i:=4 to 8 do
        quotitemno[i] := '';
    end
    else
    if Items.Count = 2 then
    begin
      for i:=0 to 1 do
        quotitemno[i+1] := Items.Strings[i];
      for i:=3 to 8 do
        quotitemno[i] := '';
    end
    else
    begin
      quotitemno[1] := Items.Strings[0];
      for i:=2 to 8 do
        quotitemno[i] := '';
    end
  end;
  if (rdgFormat.Enabled = True) and
     (rdgFormat.ItemIndex = 1) then
  begin
    with dmQuotData.quSltItmAmtRep do
    begin
      if Active then Close;
      if not prepared then Prepare;
      ParamByName('iVOQUOTNO').AsString := trim(cbQuotNo.Text);
      ParamByName('iQUOTITEMNO1').AsString := quotitemno[1];
      ParamByName('iQUOTITEMNO2').AsString := quotitemno[2];
      ParamByName('iQUOTITEMNO3').AsString := quotitemno[3];
      ParamByName('iQUOTITEMNO4').AsString := quotitemno[4];
      ParamByName('iQUOTITEMNO5').AsString := quotitemno[5];
      ParamByName('iQUOTITEMNO6').AsString := quotitemno[6];
      ParamByName('iQUOTITEMNO7').AsString := quotitemno[7];
      ParamByName('iQUOTITEMNO8').AsString := quotitemno[8];
      Open;
      try
        Application.CreateForm(TqrSltItmAmt, qrSltItmAmt);
        qrSltItmAmt.qrlItemNo1.Caption := quotitemno[1];
        qrSltItmAmt.qrlItemNo2.Caption := quotitemno[2];
        qrSltItmAmt.qrlItemNo3.Caption := quotitemno[3];
        qrSltItmAmt.qrlItemNo4.Caption := quotitemno[4];
        qrSltItmAmt.qrlItemNo5.Caption := quotitemno[5];
        qrSltItmAmt.qrlItemNo6.Caption := quotitemno[6];
        qrSltItmAmt.PreView;
        qrSltItmAmt.Destroy;
      except
        ShowMessage('不能夠打開報表');
      end;
      Close;
      unprepare;
    end;
  end
  else
  begin
    with dmQuotData.quSltItmQtyRep do
    begin
      if Active then Close;
      if not prepared then Prepare;
      ParamByName('iVOQUOTNO').AsString := trim(cbQuotNo.Text);
      ParamByName('iQUOTITEMNO1').AsString := quotitemno[1];
      ParamByName('iQUOTITEMNO2').AsString := quotitemno[2];
      ParamByName('iQUOTITEMNO3').AsString := quotitemno[3];
      ParamByName('iQUOTITEMNO4').AsString := quotitemno[4];
      ParamByName('iQUOTITEMNO5').AsString := quotitemno[5];
      ParamByName('iQUOTITEMNO6').AsString := quotitemno[6];
      ParamByName('iQUOTITEMNO7').AsString := quotitemno[7];
      ParamByName('iQUOTITEMNO8').AsString := quotitemno[8];
      Open;
      try
        Application.CreateForm(TqrSltItmQty, qrSltItmQty);
        qrSltItmQty.qrlItemNo1.Caption := quotitemno[1];
        qrSltItmQty.qrlItemNo2.Caption := quotitemno[2];
        qrSltItmQty.qrlItemNo3.Caption := quotitemno[3];
        qrSltItmQty.qrlItemNo4.Caption := quotitemno[4];
        qrSltItmQty.qrlItemNo5.Caption := quotitemno[5];
        qrSltItmQty.qrlItemNo6.Caption := quotitemno[6];
        qrSltItmQty.PreView;
        qrSltItmQty.Destroy;
      except
        ShowMessage('不能夠打開報表');
      end;
      Close;
      unprepare;
    end;
  end;
end;

procedure TfmCCRepDlg.SrcListClick(Sender: TObject);
begin

end;

end.
