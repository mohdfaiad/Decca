unit IEImport;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, DBTables, Wwquery, Db, Wwtable, Dialogs, ComCtrls;

type
  TfmIEImport = class(TForm)
    lbLineNo: TListBox;
    lbImprtLineNo: TListBox;
    SrcLabel: TLabel;
    DstLabel: TLabel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    cbJobNo: TComboBox;
    taCTJob: TwwTable;
    taCTSub_Job: TwwTable;
    taCTSub_Job_Cost: TwwTable;
    quIECTJob: TwwQuery;
    quIECTSub_Job: TwwQuery;
    quIECTSub_Job_Cost: TwwQuery;
    bmJob_Import: TBatchMove;
    bmSub_Job_Import: TBatchMove;
    bmSub_Job_Cost_Import: TBatchMove;
    quLineNo: TwwQuery;
    quLineNoLINE_NO: TIntegerField;
    ckOverride: TCheckBox;
    btnInclude: TButton;
    btnIncAll: TButton;
    btnExclude: TButton;
    btnExcAll: TButton;
    anCopyFile: TAnimate;
    procedure MoveSelected(List: TCustomListBox; Items: TStrings);
    procedure SetItem(List: TListBox; Index: Integer);
    function GetFirstSelection(List: TCustomListBox): Integer;
    procedure SetButtons;
    procedure FormShow(Sender: TObject);
    procedure cbJobNoChange(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
  fmIEImport: TfmIEImport;

implementation

uses ctmain;

{$R *.DFM}

procedure TfmIEImport.MoveSelected(List: TCustomListBox; Items: TStrings);
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

procedure TfmIEImport.SetButtons;
var
  SrcEmpty, DstEmpty: Boolean;
begin
  SrcEmpty := lbLineNo.Items.Count = 0;
  DstEmpty := lbImprtLineNo.Items.Count = 0;
  BtnInclude.Enabled := not SrcEmpty;
  BtnIncAll.Enabled := not SrcEmpty;
  BtnExclude.Enabled := not DstEmpty;
  BtnExcAll.Enabled := not DstEmpty;
end;

function TfmIEImport.GetFirstSelection(List: TCustomListBox): Integer;
begin
  for Result := 0 to List.Items.Count - 1 do
    if List.Selected[Result] then Exit;
  Result := LB_ERR;
end;

procedure TfmIEImport.SetItem(List: TListBox; Index: Integer);
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

procedure TfmIEImport.FormShow(Sender: TObject);
begin
  with fmctmain.quIECTJobNo, cbJobNo do
  begin
    if not Active then Open;
    First;
    while not eof do
    begin
      Items.Add(fmCTMain.quIECTJobNoJOB_NO.AsString);
      Next;
    end;
    First;
    cbJobNo.Text := fmCTMain.quIECTJobNoJOB_NO.AsString;
  end;
  with quLineNo do
  begin
    if Active then Close;
    ParamByName('iJobNo').AsString := trim(cbJobNo.Text);
    Open;
    if RecordCount > 0 then
    begin
      First;
      while not Eof do
      begin
        lbLineNo.Items.Add(quLineNoLINE_NO.AsString);
        Next;
      end;
      BtnInclude.Enabled := True;
      BtnIncAll.Enabled := True;
      BtnExclude.Enabled := False;
      BtnExcAll.Enabled := False;
      btnOk.Enabled := False;
    end;
  end;
end;

procedure TfmIEImport.cbJobNoChange(Sender: TObject);
begin
  lbLineNo.Clear;
  lbImprtLineNo.Clear;
  with quLineNo do
  begin
    if Active then Close;
    ParamByName('iJobNo').AsString := trim(cbJobNo.Text);
    showmessage(trim(cbJobNo.Text));
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
  if lbLineNo.Items.Count>0 then
  begin
    lbLineNo.ItemIndex:=0;
    BtnInclude.Enabled := True;
    BtnIncAll.Enabled := True;
    BtnExclude.Enabled := False;
    BtnExcAll.Enabled := False;
    btnOk.Enabled := False;
  end;
end;

procedure TfmIEImport.btnOkClick(Sender: TObject);
var
  FilterText : string;
  i : integer;
begin
  Screen.Cursor := crHourGlass;
  anCopyFile.Visible := true;
  anCopyFile.Active := true;
  with quIECTJob do
  begin
    if Active then Close;
    ParamByName('iJobNo').AsString := trim(cbJobNo.Text);
    Open;
  end;
  with quIECTSub_Job do
  begin
    if Active then Close;
    ParamByName('iJobNo').AsString := trim(cbJobNo.Text);
    FilterText := 'LINE_NO='
                + ''''
                + lbImprtLineNo.Items.Strings[0]
                + '''';
    if lbImprtLineNo.Items.Count>1 then
    begin
      for i:=1 to lbImprtLineNo.Items.Count-1 do
        FilterText := FilterText
                    + ' or '
                    + 'LINE_NO='
                    + ''''
                    + lbImprtLineNo.Items.Strings[i]
                    + '''';
    end;
    Filter := FilterText;
    Filtered:=True;
    Open;
  end;
  with quIECTSub_Job_Cost do
  begin
    if Active then Close;
    ParamByName('iJobNo').AsString := trim(cbJobNo.Text);
    FilterText := 'LINE_NO='
                + ''''
                + lbImprtLineNo.Items.Strings[0]
                + '''';
    if lbImprtLineNo.Items.Count>1 then
    begin
      for i:=1 to lbImprtLineNo.Items.Count-1 do
        FilterText := FilterText
                    + ' or '
                    + 'LINE_NO='
                    + ''''
                    + lbImprtLineNo.Items.Strings[i]
                    + '''';
    end;
    Filter := FilterText;
    Filtered := True;
    Open;
  end;

  if ckOverride.Checked = True then
  begin
    try
      bmJob_Import.AbortOnKeyViol := True;
      bmJob_Import.Mode := batAppendUpdate;
      bmJob_Import.Execute;
      bmSub_Job_Import.AbortOnKeyViol := True;
      bmSub_Job_Import.Mode := batAppendUpdate;
      bmSub_Job_Import.Execute;
      bmSub_Job_Cost_Import.AbortOnKeyViol := True; 
      bmSub_Job_Cost_Import.Mode := batAppendUpdate;
      bmSub_Job_Cost_Import.Execute;
    except
      anCopyFile.Visible := False;
      anCopyFile.Active := False;
      ShowMessage('輸入數据發生錯誤!');
      Screen.Cursor:=crDefault;
      Abort;
    end;
  end
  else
  begin
    try
      bmJob_Import.Mode := batAppend;
      bmJob_Import.Execute;
      bmSub_Job_Import.Mode := batAppend;
      bmSub_Job_Import.Execute;
      bmSub_Job_Cost_Import.Mode := batAppend;
      bmSub_Job_Cost_Import.Execute;
    except
      anCopyFile.Visible := False;
      anCopyFile.Active := False;
      ShowMessage('輸入數据發生錯誤!');
      Screen.Cursor:=crDefault;
      Abort;
    end;
  end;

  anCopyFile.Visible := False;
  anCopyFile.Active := False;
  ShowMessage('輸入成功!');
  Screen.Cursor:=crDefault;
end;

procedure TfmIEImport.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
end;

procedure TfmIEImport.btnIncludeClick(Sender: TObject);
var
  Index: Integer;
begin
  Index := GetFirstSelection(lbLineNo);
  MoveSelected(lbLineNo, lbImprtLineNo.Items);
  SetItem(lbLineNo, Index);
  if lbImprtLineNo.Items.Count > 0 then
    btnOk.Enabled := True
  else
    btnOk.Enabled := False;
end;

procedure TfmIEImport.btnIncAllClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to lbLineNo.Items.Count - 1 do
    lbImprtLineNo.Items.AddObject(lbLineNo.Items[I],
      lbLineNo.Items.Objects[I]);
  lbLineNo.Items.Clear;
  SetItem(lbLineNo, 0);
  if lbImprtLineNo.Items.Count > 0 then
    btnOk.Enabled := True
  else
    btnOk.Enabled := False;
end;

procedure TfmIEImport.btnExcludeClick(Sender: TObject);
var
  Index: Integer;
begin
  Index := GetFirstSelection(lbImprtLineNo);
  MoveSelected(lbImprtLineNo, lbLineNo.Items);
  SetItem(lbImprtLineNo, Index);
  if lbImprtLineNo.Items.Count > 0 then
    btnOk.Enabled := True
  else
    btnOk.Enabled := False;
end;

procedure TfmIEImport.btnExcAllClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to lbImprtLineNo.Items.Count - 1 do
    lbLineNo.Items.AddObject(lbImprtLineNo.Items[I], lbImprtLineNo.Items.Objects[I]);
  lbImprtLineNo.Items.Clear;
  SetItem(lbImprtLineNo, 0);
  if lbImprtLineNo.Items.Count > 0 then
    btnOk.Enabled := True
  else
    btnOk.Enabled := False;
end;

end.
