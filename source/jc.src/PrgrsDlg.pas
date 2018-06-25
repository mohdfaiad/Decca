unit PrgrsDlg;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, Mask, wwdbedit, Wwdotdot, wwDialog, wwidlg, Db, DBTables,
  Wwtable, Dialogs, Wwquery;

type
  TfmPrgrsDlg = class(TForm)
    SrcList: TListBox;
    DstList: TListBox;
    SrcLabel: TLabel;
    DstLabel: TLabel;
    IncludeBtn: TSpeedButton;
    IncAllBtn: TSpeedButton;
    ExcludeBtn: TSpeedButton;
    ExAllBtn: TSpeedButton;
    laJob_no: TLabel;
    dbdJobNo1: TwwDBComboDlg;
    taJobFile: TwwTable;
    taJobFileJOB_NO_1: TStringField;
    taJobFileJOB_NO_2: TStringField;
    taJobFileDESCRIPTION: TStringField;
    taJobFileJOB_STATUS: TStringField;
    taJobFileJOB_TYPE: TStringField;
    sdgJobNo: TwwSearchDialog;
    btnOK: TBitBtn;
    BitBtn1: TBitBtn;
    lbJobDesc: TLabel;
    quCostCat: TwwQuery;
    procedure ExcludeBtnClick(Sender: TObject);
    procedure IncAllBtnClick(Sender: TObject);
    procedure ExcAllBtnClick(Sender: TObject);
    procedure MoveSelected(List: TCustomListBox; Items: TStrings);
    procedure SetItem(List: TListBox; Index: Integer);
    function GetFirstSelection(List: TCustomListBox): Integer;
    procedure SetButtons;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbdJobNo1CustomDlg(Sender: TObject);
    procedure sdgJobNoCloseDialog(Dialog: TwwLookupDlg);
    procedure btnOKClick(Sender: TObject);
    procedure SrcListDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmPrgrsDlg: TfmPrgrsDlg;

implementation

uses Progress, rpProgress, JCMain;

{$R *.DFM}

procedure TfmPrgrsDlg.ExcludeBtnClick(Sender: TObject);
var
  Index: Integer;
begin
  Index := GetFirstSelection(DstList);
  MoveSelected(DstList, SrcList.Items);
  SetItem(DstList, Index);
end;

procedure TfmPrgrsDlg.IncAllBtnClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to SrcList.Items.Count - 1 do
    DstList.Items.AddObject(SrcList.Items[I], 
      SrcList.Items.Objects[I]);
  SrcList.Items.Clear;
  SetItem(SrcList, 0);
end;

procedure TfmPrgrsDlg.ExcAllBtnClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to DstList.Items.Count - 1 do
    SrcList.Items.AddObject(DstList.Items[I], DstList.Items.Objects[I]);
  DstList.Items.Clear;
  SetItem(DstList, 0);
end;

procedure TfmPrgrsDlg.MoveSelected(List: TCustomListBox; Items: TStrings);
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

procedure TfmPrgrsDlg.SetButtons;
var
  SrcEmpty, DstEmpty: Boolean;
begin
  SrcEmpty := SrcList.Items.Count = 0;
  DstEmpty := DstList.Items.Count = 0;
  IncludeBtn.Enabled := not SrcEmpty;
  IncAllBtn.Enabled := not SrcEmpty;
  ExcludeBtn.Enabled := not DstEmpty;
  ExAllBtn.Enabled := not DstEmpty;
end;

function TfmPrgrsDlg.GetFirstSelection(List: TCustomListBox): Integer;
begin
  for Result := 0 to List.Items.Count - 1 do
    if List.Selected[Result] then Exit;
  Result := LB_ERR;
end;

procedure TfmPrgrsDlg.SetItem(List: TListBox; Index: Integer);
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

procedure TfmPrgrsDlg.FormCreate(Sender: TObject);
begin
  with taJobFile do
  begin
    if not Active then
      Open;
  end;
  with quCostCat do
  begin
    if Active then Close;
    ParamByName('User_ID').Value := wUserID;
    Open;
    First;
    while not eof do
    begin
      SrcList.Items.Add(FieldByName('Job_cost_cat').Asstring + ' ' +
                        FieldByName('Description').AsString);
      Next;
    end;
  end;
end;

procedure TfmPrgrsDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with taJobFile do
    if Active then Open;
  with quCostCat do
    if Active then Close;
end;

procedure TfmPrgrsDlg.dbdJobNo1CustomDlg(Sender: TObject);
begin
  sdgJobNo.Execute;
end;

procedure TfmPrgrsDlg.sdgJobNoCloseDialog(Dialog: TwwLookupDlg);
begin
  dbdJobNo1.Text := taJobFile.FieldByName('Job_no_1').AsString;
  lbJobDesc.Caption := taJobFile.FieldByName('Description').AsString;
end;

procedure TfmPrgrsDlg.btnOKClick(Sender: TObject);
begin
  if DstList.Items.Count <= 0 then
  begin
    ShowMessage('請選擇成本類別!');
    Abort;
  end;
  Application.CreateForm(TqrProgress, qrProgress);
  try
    with qrProgress do
    begin

      with quProgress do
      begin
        if Active then
          Close;
        ParamByName('JOb_no_1').AsString := dbdJobNo1.Text;
        ParamByName('Job_no_2').AsString := ' ';
        if DstList.Items.Count >= 1 then
        begin
          ParamByName('Cost_cat_1').AsString := Copy(DstList.Items.Strings[0],1,6);
          qlCostCat1.Caption := Copy(DstList.Items.Strings[0],1,6);
          qlCostCatDesc1.Caption := Copy(DstList.Items.Strings[0],8,30);
        end
        else
          ParamByName('Cost_cat_1').AsString := ' ';
        if DstList.Items.Count >= 2 then
        begin
          ParamByName('Cost_cat_2').AsString := Copy(DstList.Items.Strings[1],1,6);
          qlCostCat2.Caption := Copy(DstList.Items.Strings[1],1,6);
          qlCostCatDesc2.Caption := Copy(DstList.Items.Strings[1],8,30);
        end
        else
          ParamByName('Cost_cat_2').AsString := ' ';
        if DstList.Items.Count >= 3 then
        begin
          ParamByName('Cost_cat_3').AsString := Copy(DstList.Items.Strings[2],1,6);
          qlCostCat3.Caption := Copy(DstList.Items.Strings[2],1,6);
          qlCostCatDesc3.Caption := Copy(DstList.Items.Strings[2],8,30);
        end
        else
          ParamByName('Cost_cat_3').AsString := ' ';
        if DstList.Items.Count >= 4 then
        begin
          ParamByName('Cost_cat_4').AsString := Copy(DstList.Items.Strings[3],1,6);
          qlCostCat4.Caption := Copy(DstList.Items.Strings[3],1,6);
          qlCostCatDesc4.Caption := Copy(DstList.Items.Strings[3],8,30);
        end
        else
          ParamByName('Cost_cat_4').AsString := ' ';
        Open;
      end;
      Preview;
    end;
  finally
    qrProgress.quProgress.Close;
    qrProgress.Free;
  end;
end;

procedure TfmPrgrsDlg.SrcListDblClick(Sender: TObject);
var
  Index: Integer;
begin
  Index := GetFirstSelection(SrcList);
  MoveSelected(SrcList, DstList.Items);
  SetItem(SrcList, Index);
end;

end.
