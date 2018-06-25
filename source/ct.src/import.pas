unit Import;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Db, DBTables, CTCostDM, Grids, DBGrids, Wwquery,
  ComCtrls, Gauges;

type
  TfmImport = class(TForm)
    edCostInfo: TEdit;
    Label1: TLabel;
    btnOk: TBitBtn;
    btnExit: TBitBtn;
    op_CostInfo: TOpenDialog;
    quLibCat: TQuery;
    quLibCatQUOT_CAT: TStringField;
    quLibCatQUOT_ITEM_NO: TStringField;
    quLibCatQUOT_UNIT: TStringField;
    quLibCatQUOT_RATE_FORMULA: TStringField;
    quLibCatQUOT_SECT: TStringField;
    quLibCatQUOT_MIN_QTY: TBCDField;
    quLibCatDESCRIPTION: TStringField;
    quLibCatLIBRARY_CAT: TStringField;
    quLibCatLIBRARY_DESC: TStringField;
    quLibCatLIBRARY_UNIT: TStringField;
    quLibCatLIBRARY_FACTOR: TBCDField;
    quItemByCat: TQuery;
    quItemByCatQUOT_CAT: TStringField;
    quItemByCatQUOT_ITEM_NO: TStringField;
    quItemByCatQUOT_UNIT: TStringField;
    quItemByCatQUOT_RATE_FORMULA: TStringField;
    quItemByCatQUOT_SECT: TStringField;
    quItemByCatQUOT_MIN_QTY: TBCDField;
    quItemByCatDESCRIPTION: TStringField;
    quItemByCatLIBRARY_CAT: TStringField;
    quItemByCatLIBRARY_DESC: TStringField;
    quItemByCatLIBRARY_UNIT: TStringField;
    quItemByCatLIBRARY_FACTOR: TBCDField;
    spCostImport: TStoredProc;
    quSubJob: TwwQuery;
    quSubJobJOB_NO: TStringField;
    quSubJobLINE_NO: TIntegerField;
    quSubJobQTY: TBCDField;
    quSJLineNo: TwwQuery;
    quSJLineNoLINE_NO: TIntegerField;
    gaImport: TGauge;
    quLibCatREFERENCE_RATE: TBCDField;
    quLibCatITEM_SUMRY_CAT: TStringField;
    quItemByCatREFERENCE_RATE: TBCDField;
    quItemByCatITEM_SUMRY_CAT: TStringField;
    procedure btnOkClick(Sender: TObject);
    procedure edCostInfoDblClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure spEmployInfoPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure spEmployInfoUpdateError(DataSet: TDataSet; E: EDatabaseError;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure FormCreate(Sender: TObject);
    procedure edCostInfoExit(Sender: TObject);
    procedure edCostInfoChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  fmImport: TfmImport;

implementation

uses
  ctmain;

{$R *.DFM}

procedure TfmImport.btnOkClick(Sender: TObject);
type
  Temp_Pt = ^Temp_Rec;
  Temp_Rec = record
    Job_No : string[7];
    Sub_Job_No : string[3];
    Cost_Cat : string[7];
    Act_Qty,
    Act_Amt : real;
    Cost_Cat_Desc : string;
    Section_No : string[1];
    Qty_Unit : string;
    Cat_No : string [7];
    Contract_qty : real;
    Next : Temp_Pt;
  end;
var
  wFactor : real;
  Head1,
  Head2,
  Pt1, Pt2, Pt3, Pt4 : Temp_Pt;
  CostInfo : Textfile;
  LstJobNo : string;
  LstLineNo : integer;
  wJobNo, JobNo : string[7];
  wSubJobNo, SubJobNo : string[3];
  CostCatFlg : string[1];
  CostCat : string[7];
  CatNo : string [7];
  ActQty,
  ActAmt : real;
  ContractQty : real;
  wCostCatDesc,
  CostCatDesc : string;
  SectionNo : string[1];
  QtyUnit : string;
  LineStr : string;
  ItemSumryCat : string;
  LineNo, LineNoST, LineNoEnd : integer;
  n, i : integer;
begin
  try
    assignfile(CostInfo, edCostInfo.Text);
{    reset(CostInfo);
    wJobNo := '';
    wSubJobNo := '';
    while not eof(CostInfo) do
    begin
      readln(CostInfo, LineStr);
      JobNo := copy(LineStr, 1, 7);
      SubJobNo := copy(LineStr, 9, 3);
      with quSJLineNo do
      begin
        if Active then Close;
        ParamByName('JobNo').Value := JobNo;
        ParamByName('SubJobNo').Value := '%' + SubJobNo + '%';
        Open;
        if RecordCount = 0 then
          Next;
      end;

      with spCostImport do
      begin
        if (wJobNo <> JobNo) or
           (wSubJobNo <> SubJobNo) then
        begin
          ParamByName('JobNo').Value := JobNo;
          ParamByName('StartLineNo').Value := quSJLineNoLINE_NO.Value;
          ParamByName('EndLineNo').Value := quSJLineNoLINE_NO.Value;
          wJobNo := JobNo;
          wSubJobNo := SubJobNo;
          ExecProc;
        end;
      end;
      next;
    end;
    closefile(CostInfo);
 }
    reset(CostInfo);
    new(Head1);
    with Head1^ do
    begin
      Job_No := '';
      Sub_Job_No := '';
      Cost_Cat := '';
      Act_Qty := 0.000;
      Act_Amt := 0.00;
      CostCatDesc := '';
      SectionNo := '';
      QtyUnit := '';
      Cat_No := '';
      Contract_qty := 0.0;
      Next := nil;
    end;
    Pt2 := Head1;
    while not eof(CostInfo) do
    begin
      readln(CostInfo, LineStr);
      if (Length(trim(LineStr)) > 0) then
      begin
        JobNo := copy(LineStr, 1, 7);
        SubJobNo := copy(LineStr, 9, 3);
        CostCatFlg := copy(LineStr, 13, 1);
        CostCat := copy(LineStr, 13, 7);
        try
          CostCat := inttostr(strtoint(CostCat));
        except
          CostCat := trim(CostCat)
        end;
        ActQty := StrToFloat( copy(LineStr, 32, 1)
                + FloatToStr(strtoint(copy(LineStr, 21, 11))/1000.0));
        ActAmt := StrToFloat( copy(LineStr, 45, 1)
                + FloatToStr(strtoint(copy(LineStr, 34, 11))/100.0));
        CostCatDesc := trim(copy(LineStr, 47, 25));
        SectionNo := copy(LineStr, 73, 1);
        QtyUnit := copy(LineStr, 75, 4);
        CatNo := copy(LineStr, 80,7);
        ContractQty := StrToFloat(copy(LineStr, 88, 9)) / 10;
        new(Pt1);
        with Pt1^ do
        begin
          Job_No := JobNo;
          Sub_Job_No := SubJobNo;
          Cost_Cat := CostCat;
          Act_Qty := ActQty;
          Act_Amt := ActAmt;
          Cost_Cat_Desc := CostCatDesc;
          Section_No := SectionNo;
          Qty_Unit := QtyUnit;
          Cat_No := CatNo;
          Contract_Qty := ContractQty;
          Next := nil;
        end;
        Pt2^.Next := Pt1;
        Pt2 := Pt1;
      end;
    end;
  finally
    closefile(CostInfo);
  end;

// Handle same records in above linklist by jobno,subjobno,costcat to a single record.

  new(Head2);
  with Head2^ do
  begin
    Job_No := '';
    Sub_Job_No := '';
    Cost_Cat := '';
    Act_Qty := 0.000;
    Act_Amt := 0.00;
    CostCatDesc := '';
    SectionNo := '';
    QtyUnit := '';
    Cat_No := '';
    Contract_Qty := 0.0;
    Next := nil;
  end;
  Pt4 := Head2;
  Pt1 := Head1;
  while (Pt1^.Next <> nil) do
  begin
    Pt1 := Pt1^.Next;
    JobNo := Pt1^.Job_No;
    SubJobNo := Pt1^.Sub_Job_No;
    CostCat := Pt1^.Cost_Cat;
    ActQty := Pt1^.Act_Qty;
    ActAmt := Pt1^.Act_Amt;
    CostCatDesc := Pt1^.Cost_Cat_Desc;
    SectionNo := Pt1^.Section_No;
    QtyUnit := Pt1^.Qty_Unit;
    CatNo := Pt1^.Cat_No;
    ContractQty := Pt1^.Contract_Qty;
    Pt4 := Head2;
    if (Pt4^.Next = nil) then
    begin
      new(Pt3);
      with Pt3^ do
      begin
        Job_No := JobNo;
        Sub_Job_No := SubJobNo;
        Cost_Cat := CostCat;
        Act_Qty := ActQty;
        Act_Amt := ActAmt;
        Cost_Cat_Desc := CostCatDesc;
        Section_No := SectionNo;
        Qty_Unit := QtyUnit;
        Cat_No := CatNo;
        Contract_Qty := ContractQty;
        Next := nil;
      end;
      Pt4^.Next := Pt3;
      Pt4 := Pt3;
    end
    else
    begin
      while (Pt4^.Next <> nil) do
      begin
        Pt4 := Pt4^.Next;
        if ((Pt4^.Job_No = JobNo) and
            (Pt4^.Sub_Job_No = SubJobNo) and
            (Pt4^.Cost_Cat = CostCat)) then
        begin
          Pt4^.Act_Qty := Pt4^.Act_Qty + ActQty;
          Pt4^.Act_Amt := Pt4^.Act_Amt + ActAmt;
          Break;
        end
        else
        if (Pt4^.Next <> nil) then
           Continue
        else
        begin
          new(Pt3);
          with Pt3^ do
          begin
            Job_No := JobNo;
            Sub_Job_No := SubJobNo;
            Cost_Cat := CostCat;
            Act_Qty := ActQty;
            Act_Amt := ActAmt;
            Cost_Cat_Desc := CostCatDesc;
            Section_No := SectionNo;
            Qty_Unit := QtyUnit;
            Cat_No := CatNo;
            Contract_Qty := ContractQty;
            Next := nil;
          end;
          Pt4^.Next := Pt3;
          Pt4 := Pt3;
        end;
      end;
    end;
  end;
  freemem(Head1);

  // Get the start lineno;
  Pt1 := Head2;
  while (Pt1^.Next <> nil) do
  begin
    Pt1 := Pt1^.Next;
    JobNo := Pt1^.Job_No;
    SubJobNo := Pt1^.Sub_Job_No;
    with quSJLineNo do
    begin
      if Active then Close;
      ParamByName('JobNo').Value := JobNo;
      ParamByName('SubJobNo').Value := '%' + SubJobNo + '%';
      Open;
      if RecordCount = 0 then
        Next
      else
      begin
        LineNoST := quSJLineNoLINE_NO.Value;
        Break;
      end;
    end;
  end;
  // Get the end lineno
  n := 0;
  Pt1 := Head2;
  while (Pt1^.Next <> nil) do
  begin
    n := n + 1;
    Pt1 := Pt1^.Next;
    JobNo := Pt1^.Job_No;
    SubJobNo := Pt1^.Sub_Job_No;
  end;
  with quSJLineNo do
  begin
    if Active then Close;
    ParamByName('JobNo').Value := JobNo;
    ParamByName('SubJobNo').Value := '%' + SubJobNo + '%';
    Open;
    if RecordCount = 0 then
      LineNoEnd := 999
    else
      LineNoEnd := quSJLineNoLINE_NO.Value;
  end;
  with spCostImport do
  begin
    ParamByName('JobNo').Value := JobNo;
    ParamByName('StartLineNo').Value := LineNoST;
    ParamByName('EndLineNo').Value := LineNoEnd;
    Prepare;
    ExecProc;
    UnPrepare;
  end;

  LstJobNo := '';
  LstLineNo := -1;
  Pt3 := Head2;
  i := 0;
  gaImport.Progress := 0;
  gaImport.Visible := True;
  while (Pt3^.Next <> nil) do
  begin
    i := i + 1;
    gaImport.Progress := round(100*i/n);
    Pt3 := Pt3^.Next;
    JobNo := Pt3^.Job_No;
    SubJobNo := Pt3^.Sub_Job_No;
    CostCat := Pt3^.Cost_Cat;
    SectionNo := Pt3^.Section_No;
    QtyUnit := Pt3^.Qty_Unit;
    CatNo := Pt3^.Cat_No;
    ContractQty := Pt3^.Contract_Qty;
    if ContractQty = 0 then
      ContractQty := 1;
    with dmCost.quSJLineNo do
    begin
      if Active then
        Close;
      ParamByName('iJobNo').Value := JobNo;
      ParamByName('iSubJobNo').Value := '%' + SubJobNo + '%';
      Open;
    end;
    if (dmCost.quSJLineNo.RecordCount < 1) or (length(CostCat) > 6) then
      Continue
    else
    begin
      LineNo := dmCost.quSJLineNo.FieldValues['Line_No'];
      if (JobNo <> LstJobNo) or
         (LineNo <> LstLineNo) then
      begin
        with quSubJob do
        begin
          if Active then
            Close;
          ParamByName('Job_No').AsString := JobNo;
          ParamByName('Line_No').AsInteger := LineNo;
          LstJobNo := JobNo;
          LstLineNo := LineNo;
          Open;
          if not IsEmpty then
          begin
            First;
            Edit;
            quSubJobQTY.AsFloat := ContractQty;
            Post;
          end;
        end;
      end;
      wFactor := 1;
      wCostCatDesc := '';
      with quLibCat do
      begin
         if Active then
           Close;
         ParamByName('ItemNo').Value := CostCat;
         Open;
         if (RecordCount > 0) then
         begin
           if quLibCatLIBRARY_CAT.AsString <> quLibCatQUOT_ITEM_NO.AsString then
             CostCat := quLibCatQUOT_ITEM_NO.AsString;
           wFactor := quLibCatLIBRARY_FACTOR.AsFloat;
           QtyUnit := quLibCatLIBRARY_UNIT.AsString;
           CatNo := quLibCatQUOT_CAT.AsString;
           wCostCatDesc := quLibCatLIBRARY_DESC.AsString;
           ItemSumryCat := quLibCatITEM_SUMRY_CAT.AsString;
         end
         else
         with quItemByCat do
         begin
           if Active then
             Close;
           ParamByName('Quot_Cat').Value := CostCat;
           Open;
           if (RecordCount > 0) then
           begin
             First;
             CostCat := quItemByCatQUOT_ITEM_NO.AsString;
             QtyUnit := quItemByCatLIBRARY_UNIT.AsString;
             CatNo := quItemByCatQUOT_CAT.AsString;
             wCostCatDesc := quItemByCatLIBRARY_DESC.AsString;
             SectionNo := quItemByCatQUOT_SECT.AsString;
             ItemSumryCat := quItemByCatITEM_SUMRY_CAT.AsString;
           end;
           Close;
         end;
         Close;
      end;
      with dmCost, quSJCCostcat do
      begin
        if Active then
          Close;
        ParamByName('iJobNo').Value := JobNo;
        ParamByName('iLineNo').Value := LineNo;
        ParamByName('iCostCat').Value := CostCat;
        Open;
        if RecordCount > 0 then
        begin
          Edit;
          quSJCCostcatACTUAL_QTY.Value := quSJCCostcatACTUAL_QTY.Value
                                        + ((Pt3^.Act_Qty * wFactor)
                                        / ContractQty);
          quSJCCostcatACTUAL_AMT.Value := quSJCCostcatACTUAL_AMT .Value
                                        + (Pt3^.Act_Amt
                                        / ContractQty);
          quSJCCostcatITEM_SUMRY_CAT.Value := ItemSumryCat;
          post;
        end
        else
        begin
          with dmCost, taSubJobCost do
          begin
            if not Active then
              Open;
            Append;
            taSubJobCostSECTION_NO.Value := SectionNo;
            taSubJobCostQTY_UNIT.Value := QtyUnit;
            taSubJobCostCATEGORY.Value := CatNo;
            taSubJobCostJOB_NO.Value := JobNo;
            taSubJobCostLINE_NO.Value := LineNo;
            taSubJobCostCOST_CAT.Value := CostCat;
            taSubJobCostACTUAL_QTY.Value := (Pt3^.Act_Qty * wFactor)
                                          / ContractQty;
            taSubJobCostACTUAL_AMT.Value := Pt3^.Act_Amt
                                          / ContractQty;
            taSubJobCostITEM_SUMRY_CAT.Value := ItemSumryCat;
            if wCostCatDesc <> '' then
              taSubJobCostDESCRIPTION.Value := wCostCatDesc
            else
              taSubJobCostDESCRIPTION.Value := Pt3^.Cost_Cat_Desc;
            post;
          end;
        end;
      end;
    end;
  end;
  gaImport.Visible := False;
  freemem(Head2);
{
  with dmCost.taSubJobCost do
  try
    ApplyUpdates;
    CommitUpdates;
  except
    showmessage('未能更新記錄');
  end;
 }
  deletefile(edCostInfo.Text);
  showmessage('成本數据資料處理結束');
  with dmCost do
  begin
    with quSubJob do
    begin
      if Active then
        Close;
      Open;
    end;
  end;
end;

procedure TfmImport.edCostInfoDblClick(Sender: TObject);
begin
  if op_CostInfo.Execute then
  begin
    edCostInfo.Text := trim(op_CostInfo.FileName);
  end
  else
  begin
    showmessage('不能打開文件');
    abort;
  end;
end;

procedure TfmImport.btnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmImport.spEmployInfoPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  if (pos('changed the record', E.Message) <> 0) then
  begin
    ShowMessage('記錄已修正,未能更新記錄');
    Action := daAbort;
    DataSet.Close;
    DataSet.Open;
  end
  else
  begin
    if (pos('UNIQUE KEY', e.Message) <> 0) then
    begin
      ShowMessage('記錄重复');
      Action := daAbort;
      DataSet.Close;
      DataSet.Open;
    end
    else
    if Length(e.Message) > 0 then
    begin
      ShowMessage(e.Message);
      Action := daAbort;
    end;
  end;
end;

procedure TfmImport.spEmployInfoUpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
  if (pos('changed the record', E.Message) <> 0) then
  begin
    ShowMessage('記錄已修正,未能更新記錄');
    UpdateAction := uaAbort;
    DataSet.Close;
    DataSet.Open;
  end
  else
  begin
    if (pos('UNIQUE KEY', e.Message) <> 0) then
    begin
      ShowMessage('記錄重复');
      UpdateAction := uaAbort;
      DataSet.Close;
      DataSet.Open;
    end
    else
    if Length(e.Message) > 0 then
    begin
      ShowMessage(e.Message);
      UpdateAction := uaAbort;
    end;
  end;
end;

procedure TfmImport.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  with quLibCat do
  begin
    if Active then
      Close;
    Prepare;
  end;
  with quItemByCat do
  begin
    if Active then
      Close;
    Prepare;
  end;
  with quSubJob do
  begin
    if Active then
      Close;
    Prepare;
  end;
end;

procedure TfmImport.edCostInfoExit(Sender: TObject);
begin
  if edCostInfo.Text <> '' then
    btnOk.Enabled := True
  else
    btnOk.Enabled := False;
end;

procedure TfmImport.edCostInfoChange(Sender: TObject);
begin
  if Trim(edCostInfo.Text) <> '' then
    btnOk.Enabled := True
  else
    btnOk.Enabled := False;
end;

procedure TfmImport.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with quLibCat do
  begin
    if Active then
      Close;
    if Prepared then
      UnPrepare;
  end;
  with quItemByCat do
  begin
    if Active then
      Close;
    if Prepared then
      UnPrepare;
  end;
  with quSubJob do
  begin
    if Active then
      Close;
    if Prepared then
      Unprepare;
  end;
end;

end.
