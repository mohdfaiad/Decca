unit IEexport;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, DBTables, Wwtable, Db, Wwquery, wwdblook, Wwdbdlg, Dialogs,
  ComCtrls;

type
  TfmIEExport = class(TForm)
    lbLineNo: TListBox;
    lbExportLineNo: TListBox;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    SrcLabel: TLabel;
    DstLabel: TLabel;
    quCTSub_Job: TwwQuery;
    quCTJob: TwwQuery;
    quCTSub_Job_Cost: TwwQuery;
    bmSub_Job_Cost_Export: TBatchMove;
    bmSub_Job_Export: TBatchMove;
    taIECTSub_Job_Cost: TwwTable;
    taIECTSub_Job: TwwTable;
    taIECTJob: TwwTable;
    bmJob_Export: TBatchMove;
    ckIECTDataClear: TCheckBox;
    quCTJobNo: TwwQuery;
    dbLKDJobNo: TwwDBLookupComboDlg;
    quCTJobNoJOB_NO: TStringField;
    quCTJobNoDESCRIPTION: TStringField;
    quLineNo: TwwQuery;
    quLineNoLINE_NO: TIntegerField;
    btnInclude: TButton;
    btnIncAll: TButton;
    btnExclude: TButton;
    btnExcAll: TButton;
    quIECTDataClear: TwwQuery;
    anCopyFile: TAnimate;
    procedure MoveSelected(List: TCustomListBox; Items: TStrings);
    procedure SetItem(List: TListBox; Index: Integer);
    function GetFirstSelection(List: TCustomListBox): Integer;
    procedure SetButtons;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure dbLKDJobNoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure btnIncludeClick(Sender: TObject);
    procedure btnIncAllClick(Sender: TObject);
    procedure btnExcludeClick(Sender: TObject);
    procedure btnExcAllClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmIEExport: TfmIEExport;

implementation

uses
  ctmain, CTCostDM;

{$R *.DFM}

procedure TfmIEExport.MoveSelected(List: TCustomListBox; Items: TStrings);
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

procedure TfmIEExport.SetButtons;
var
  SrcEmpty, DstEmpty: Boolean;
begin
  SrcEmpty := lbLineNo.Items.Count = 0;
  DstEmpty := lbExportLineNo.Items.Count = 0;
  BtnInclude.Enabled := not SrcEmpty;
  BtnIncAll.Enabled := not SrcEmpty;
  BtnExclude.Enabled := not DstEmpty;
  BtnExcAll.Enabled := not DstEmpty;
end;

function TfmIEExport.GetFirstSelection(List: TCustomListBox): Integer;
begin
  for Result := 0 to List.Items.Count - 1 do
    if List.Selected[Result] then Exit;
  Result := LB_ERR;
end;

procedure TfmIEExport.SetItem(List: TListBox; Index: Integer);
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

procedure TfmIEExport.FormShow(Sender: TObject);
begin
  with quCTJobNo do
  begin
    if not Active then Open;
  end;
  if (dmCost.quJob.Active = True) and
     (dmCost.quJob.RecordCount > 0) then
  begin
    dbLKDJobNo.LookupValue := (dmCost.quJobJOB_NO.AsString);
    lbLineNo.Clear;
    lbExportLineNo.Clear;
    with quLineNo do
    begin
      if Active then Close;
      ParamByName('iJobNo').AsString := trim(dbLKDJobNo.LookupValue);
      Open;
      if RecordCount > 0 then
      begin
        First;
        while not Eof do
        begin
          lbLineNo.Items.Add(quLineNoLINE_NO.AsString);
          Next;
        end;
      end;
    end;
    if lbLineNo.Items.Count > 0 then
    begin
      BtnInclude.Enabled := True;
      BtnIncAll.Enabled := True;
      BtnExclude.Enabled := False;
      BtnExcAll.Enabled := False;
      btnOk.Enabled := False;
    end;
  end;
end;

procedure TfmIEExport.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  dbLKDJobNo.Value
end;

procedure TfmIEExport.btnOkClick(Sender: TObject);
var
  FilterText : string;
  i : integer;
begin
  Screen.Cursor := crHourGlass;
  anCopyFile.Visible := true;
  anCopyFile.Active := true;
  if ckIECTDataClear.Checked = True then
  with quIECTDataClear do
  begin
    if Active then Close;
    if not Prepared then
      Prepare;
    ExecSQL;
  end;
  with quCTJob do
  begin
    if Active then Close;
    ParamByName('iJobNo').AsString := trim(dbLKDJobNo.Text);
    Open;
    First;
  end;
  with quCTSub_Job do
  begin
    if Active then Close;
    ParamByName('iJobNo').AsString := trim(dbLKDJobNo.Text);
    FilterText := 'LINE_NO='
                + ''''
                + lbExportLineNo.Items.Strings[0]
                + '''';
    if lbExportLineNo.Items.Count>1 then
    begin
      for i:=1 to lbExportLineNo.Items.Count-1 do
        FilterText := FilterText
                    + ' or '
                    + 'LINE_NO='
                    + ''''
                    + lbExportLineNo.Items.Strings[i]
                    + '''';
    end;
    Filter := FilterText;
    Filtered:=True;
    Open;
  end;
  with quCTSub_Job_Cost do
  begin
    if Active then Close;
    ParamByName('iJobNo').AsString := trim(dbLKDJobNo.Text);
    FilterText := 'LINE_NO='
                + ''''
                + lbExportLineNo.Items.Strings[0]
                + '''';
    if lbExportLineNo.Items.Count>1 then
    begin
      for i:=1 to lbExportLineNo.Items.Count-1 do
        FilterText := FilterText
                    + ' or '
                    + 'LINE_NO='
                    + ''''
                    + lbExportLineNo.Items.Strings[i]
                    + '''';
    end;
    Filter := FilterText;
    Filtered:=True;
    Open;
  end;
  try
    bmJob_Export.AbortOnKeyViol := True;
    bmJob_Export.Mode := batAppendUpdate;
    bmJob_Export.Execute;
    bmSub_Job_Export.AbortOnKeyViol := True;
    bmSub_Job_Export.Mode := batAppendUpdate;
    bmSub_Job_Export.Execute;
    bmSub_Job_Cost_Export.AbortOnKeyViol := True;
    bmSub_Job_Cost_Export.Mode := batAppendUpdate;
    bmSub_Job_Cost_Export.Execute;
  except
    anCopyFile.Visible := False;
    anCopyFile.Active := False;
    ShowMessage('輸出數据發生錯誤!');
    Screen.Cursor:=crDefault;
    Abort;
  end;

  anCopyFile.Visible := False;
  anCopyFile.Active := False;
  ShowMessage('輸出成功!');
  Screen.Cursor:=crDefault;
end;

procedure TfmIEExport.dbLKDJobNoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  lbLineNo.Clear;
  lbExportLineNo.Clear;
  with quLineNo do
  begin
    if Active then Close;
    ParamByName('iJobNo').AsString := trim(quCTJobNoJOB_NO.AsString);
    Open;
    if RecordCount > 0 then
    begin
      First;
      while not Eof do
      begin
        lbLineNo.Items.Add(quLineNoLINE_NO.AsString);
        Next;
      end;
    end;
  end;
  if lbLineNo.Items.Count > 0 then
  begin
    BtnInclude.Enabled := True;
    BtnIncAll.Enabled := True;
    BtnExclude.Enabled := False;
    BtnExcAll.Enabled := False;
    btnOk.Enabled := False;
  end;
end;

procedure TfmIEExport.btnIncludeClick(Sender: TObject);
var
  Index: Integer;
begin
  Index := GetFirstSelection(lbLineNo);
  MoveSelected(lbLineNo, lbExportLineNo.Items);
  SetItem(lbLineNo, Index);
  if lbExportLineNo.Items.Count > 0 then
    btnOk.Enabled := True
  else
    btnOk.Enabled := False;
end;

procedure TfmIEExport.btnIncAllClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to lbLineNo.Items.Count - 1 do
    lbExportLineNo.Items.AddObject(lbLineNo.Items[I],
      lbLineNo.Items.Objects[I]);
  lbLineNo.Items.Clear;
  SetItem(lbLineNo, 0);
  if lbExportLineNo.Items.Count > 0 then
    btnOk.Enabled := True
  else
    btnOk.Enabled := False;
end;

procedure TfmIEExport.btnExcludeClick(Sender: TObject);
var
  Index: Integer;
begin
  Index := GetFirstSelection(lbExportLineNo);
  MoveSelected(lbExportLineNo, lbLineNo.Items);
  SetItem(lbExportLineNo, Index);
  if lbExportLineNo.Items.Count > 0 then
    btnOk.Enabled := True
  else
    btnOk.Enabled := False;
end;

procedure TfmIEExport.btnExcAllClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to lbExportLineNo.Items.Count - 1 do
    lbLineNo.Items.AddObject(lbExportLineNo.Items[I], lbExportLineNo.Items.Objects[I]);
  lbExportLineNo.Items.Clear;
  SetItem(lbExportLineNo, 0);
  if lbExportLineNo.Items.Count > 0 then
    btnOk.Enabled := True
  else
    btnOk.Enabled := False;
end;

end.
