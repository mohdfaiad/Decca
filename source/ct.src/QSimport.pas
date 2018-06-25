unit QSimport;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, Buttons;

type
  TfmQSImpt = class(TForm)
    Label1: TLabel;
    edJobNo: TEdit;
    btnOK: TBitBtn;
    btnExit: TBitBtn;
    quLineNo: TQuery;
    quQSItemNo: TQuery;
    quSubJobCost: TQuery;
    quJobNo: TQuery;
    quLibCat: TQuery;
    Label2: TLabel;
    Label3: TLabel;
    edStartLineNo: TEdit;
    edEndLineNo: TEdit;
    quQuotLine: TQuery;
    quQuotLineQUOT_QTY: TBCDField;
    quQuotLineQLENGTH: TBCDField;
    quQuotLineQWIDTH: TBCDField;
    quQuotLineQHIGH: TBCDField;
    quQuotLineUNIT: TStringField;
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
    quJobNoJOB_NO: TStringField;
    quJobNoDESCRIPTION: TStringField;
    quJobNoQUOT_NO: TStringField;
    quJobNoKEYWORD: TStringField;
    quLineNoJOB_NO: TStringField;
    quLineNoLINE_NO: TIntegerField;
    quLineNoQTY: TBCDField;
    quLineNoJLENGTH: TBCDField;
    quLineNoJWIDTH: TBCDField;
    quLineNoJHEIGHT: TBCDField;
    quLineNoLAST_UPD_DATE: TDateTimeField;
    quLineNoSTATUS: TStringField;
    quLineNoAUTHORIED_BY: TStringField;
    quLineNoCOMMENT: TBlobField;
    quLineNoSUB_JOB_CAT: TStringField;
    quLineNoPHOTO: TBlobField;
    quLineNoDESCRIPTION: TStringField;
    quLineNoSUB_JOB_NO: TStringField;
    quLineNoQUOT_LINE_NO: TStringField;
    quLineNoUNIT: TStringField;
    quSubJobCostJOB_NO: TStringField;
    quSubJobCostLINE_NO: TIntegerField;
    quSubJobCostCOST_CAT: TStringField;
    quSubJobCostBUDGET_QTY: TBCDField;
    quSubJobCostBUDGET_AMT: TBCDField;
    quSubJobCostACTUAL_QTY: TBCDField;
    quSubJobCostACTUAL_AMT: TBCDField;
    quSubJobCostSTD_QTY: TBCDField;
    quSubJobCostSTD_AMOUNT: TBCDField;
    quSubJobCostSECTION_NO: TStringField;
    quSubJobCostQUOT_ITEM_NO: TStringField;
    quSubJobCostQTY_UNIT: TStringField;
    quSubJobCostDESCRIPTION: TStringField;
    quQSItemNoQUOT_ITEM_NO: TStringField;
    quQSItemNoQUOT_QTY: TBCDField;
    quQSItemNoQUOT_ITEM_TOTAL: TBCDField;
    quQSItemNoQUOT_NO: TStringField;
    quQSItemNoQUOT_LINE_NO: TStringField;
    quQSItemNoQUOT_SECT: TStringField;
    quQSItemNoQUOT_SECT_SEQ: TIntegerField;
    quQSItemNoQUOT_CAT: TStringField;
    quQSItemNoDESCRIPTION: TStringField;
    quQSItemNoQUOT_RATE: TBCDField;
    quQSItemNoQUOT_UNIT: TStringField;
    quSubJobCostCATEGORY: TStringField;
    quLibCatREFERENCE_RATE: TBCDField;
    quLibCatITEM_SUMRY_CAT: TStringField;
    quSubJobCostITEM_SUMRY_CAT: TStringField;
    procedure btnOKClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edStartLineNoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmQSImpt: TfmQSImpt;

implementation

uses CTCostDM, ctmain;

{$R *.DFM}

procedure TfmQSImpt.btnOKClick(Sender: TObject);
var
  JobNo,
  QuotNo : string[7];
  LineNo,
  StartLineNo,
  EndLineNo : integer;
  QuotLineNos : string;
  QuotLineNo : string[10];
  ItemNo : string[6];
begin
  if edEndLineNo.Text < edStartLineNo.Text then
  begin
    ShowMessage('序列號選擇錯誤');
    Abort;
  end;
  StartLineNo := 0;
  EndLineNo := 0;
  JobNo := trim(edJobNo.Text);
  try
    StartLineNo := StrToInt(trim(edStartLineNo.Text));
  except
    ShowMessage('序列號(起)錯誤');
    Abort;
  end;
  try
    EndLineNo := StrToInt(trim(edEndLineNo.Text));
  except
    ShowMessage('序列號(止)錯誤');
    Abort;
  end;
  try
    if dmCost.dbQuote.Connected then
      dmCost.dbQuote.Connected := True;
    with quJobNo do
    begin
      if Active then
        Close;
      ParamByName('JobNo').Value := JobNo;
      Open;
      if Recordcount < 1 then
      begin
        showmessage('無此工程編號');
        Abort;
      end;
    end;
    QuotNo := quJobNo.FieldValues['Quot_NO'];
    with quLineNo do
    begin
      if Active then
        Close;
      ParamByName('JobNo').Value := JobNo;
      ParamByName('StartLineNo').Value := StartLineNo;
      ParamByName('EndLineNo').Value := EndLineNo;
      Open;
      if Recordcount < 1 then
      begin
        showmessage('無此序列號');
        Abort;
      end;
    end;

    quLineNo.First;
    while not quLineNo.EOF do
    begin
      LineNo := quLineNo.FieldValues['Line_No'];
      QuotLineNos := quLineNo.FieldValues['Quot_Line_No'];
      if Pos('+', QuotLineNos) > 1 then
        QuotLineNo := copy(QuotLineNos, 1, Pos('+', QuotLineNos) - 1)
      else
        QuotLineNo := QuotLineNos;
      with quQuotLine do
      begin
        if Active then
          Close;
        ParamByName('QuotNo').Value := QuotNo;
        ParamByName('QuotLineNo').Value := QuotLineNo;
        Open;
      end;
      if quQuotLine.RecordCount < 1 then
      begin
        showmessage('無此工程的報价資料');
        Abort;
      end
      else
      begin
        quQuotLine.First;
        with quLineNo do
        begin
          Edit;
          FieldByName('Job_No').Value := JobNo;
          FieldByName('Line_No').Value := LineNo;
          FieldByName('Qty').Value := quQuotLine.FieldValues['Quot_Qty'];
          FieldByName('JLENGTH').Value := quQuotLine.FieldValues['qlength'];
          FieldByName('JWIDTH').Value := quQuotLine.FieldValues['qwidth'];
          FieldByName('JHEIGHT').Value := quQuotLine.FieldValues['qhigh'];
          FieldByName('Unit').Value := quQuotLine.FieldValues['Unit'];
          post;
        end;
      end;
      quLineNo.Next;
    end;

    with dmCost.spQSImport do
    begin
      ParamByName('JobNo').Value := JobNo;
      ParamByName('StartLineNo').Value := StartLineNo;
      ParamByName('EndLineNo').Value := EndLineNo;
      ExecProc;
    end;

    quLineNo.First;
    while not quLineNo.EOF do
    begin
      LineNo := quLineNo.FieldValues['Line_No'];
      QuotLineNos := quLineNo.FieldValues['Quot_Line_No'];
      while length(trim(QuotLineNos)) > 0 do
      begin
        if pos('+', QuotLineNos) > 1 then
           QuotLineNo := copy(QuotLineNos, 1, Pos('+', QuotLineNos) - 1)
        else
          QuotLineNo := trim(QuotLineNos);
        with quQSItemNo do
        begin
          if Active then
            Close;
          ParamByName('QuotNo').Value := QuotNo;
          ParamByName('QuotLineNo').Value := QuotLineNo;
          Open;
          if Recordcount < 1 then
          begin
            showmessage('無此工程編號');
            Abort;
          end;
        end;
        quQSItemNo.First;
        while not quQSItemNo.EOF do
        begin
          if (quQSItemNoQUOT_QTY.Value = 0) and
             (quQSItemNoQUOT_ITEM_TOTAL.Value = 0) then
             quQSItemNo.Next
          else
          begin
            ItemNo := quQSItemNoQUOT_ITEM_NO.Value;
            with quLibCat do
            begin
              if Active then
                Close;
              ParamByName('ItemNo').Value := ItemNo;
              Open;
            end;
            with quSubJobCost do
            begin
              if Active then
                Close;
              ParamByName('JobNo').Value := JobNo;
              ParamByName('LineNo').Value := LineNo;
              if quLibCat.RecordCount > 0 then
                  ParamByName('CostCat').Value := quLibCatLIBRARY_CAT.Value
              else
                ParamByName('CostCat').Value := ItemNo;
              Open;
              if RecordCount > 0 then
              begin
                Edit;
                quSubJobCostBUDGET_QTY.Value := FieldValues['Budget_Qty']
                                              + quQSItemNoQUOT_QTY.Value;
                quSubJobCostBUDGET_AMT.Value := FieldValues['Budget_Amt']
                                              + quQSItemNoQUOT_ITEM_TOTAL.Value;
                if (FieldValues['Qty_Unit'] <> '') and
                   (length(trim(quLibCatQUOT_UNIT.Value)) > 0) then
                   quSubJobCostQTY_UNIT.Value := quLibCatQUOT_UNIT.Value;
                if (trim(quLibCatITEM_SUMRY_CAT.Value) <> '') then
                  quSubJobCostITEM_SUMRY_CAT.Value := quLibCatITEM_SUMRY_CAT.Value
                else
                  quSubJobCostITEM_SUMRY_CAT.Value := quLibCatLIBRARY_CAT.Value;
                Post;
              end
              else
              begin
                Append;
                quSubJobCostJOB_NO.Value := JobNo;
                quSubJobCostLINE_NO.Value := LineNo;
                if quLibCat.RecordCount > 0 then
                begin
                  quSubJobCostSECTION_NO.Value := quLibCatQUOT_SECT.Value;
                  quSubJobCostDESCRIPTION.Value := quLibCatLIBRARY_DESC.Value;
                  quSubJobCostCOST_CAT.Value := quLibCatLIBRARY_CAT.Value;
                  quSubJobCostQTY_UNIT.Value := quLibCatQUOT_UNIT.Value;
                  quSubJobCostCATEGORY.Value := quLibCatQUOT_CAT.Value;
                  quSubJobCostITEM_SUMRY_CAT.Value :=
                    quLibCatITEM_SUMRY_CAT.Value;
                end
                else
                begin
                  quSubJobCostSECTION_NO.Value := quQSItemNoQUOT_SECT.Value;
                  quSubJobCostDESCRIPTION.Value := quQSItemNoDESCRIPTION.Value;
                  quSubJobCostCOST_CAT.Value := quQSItemNoQUOT_ITEM_NO.Value;
                  quSubJobCostQTY_UNIT.Value := quQSItemNoQUOT_UNIT.Value;
                  quSubJobCostCATEGORY.Value := quQSItemNoQUOT_CAT.Value;
                  quSubJobCostITEM_SUMRY_CAT.Value :=
                    quQSItemNoQUOT_ITEM_NO.Value;
                end;
                quSubJobCostBUDGET_QTY.Value := quQSItemNoQUOT_QTY.Value;
                quSubJobCostBUDGET_AMT.Value := quQSItemNoQUOT_ITEM_TOTAL.Value;
                Post;
              end;
            end;
            quQSItemNo.Next;
          end;
        end;
        if pos('+', QuotLineNos) > 1 then
          Delete(QuotLineNos, 1, Pos('+', QuotLineNos))
        else
          Break;
      end;
      quLineNo.Next;
    end;
  finally
    if dmCost.dbQuote.Connected then
        dmCost.dbQuote.Connected := False;
  end;
end;

procedure TfmQSImpt.btnExitClick(Sender: TObject);
begin
  Close;
  Release;
end;

procedure TfmQSImpt.FormCreate(Sender: TObject);
begin
  Caption := trim(wCompanyName) + ' == ' + Caption;
  if ((dmCost.quJob.Active = True) and
      (dmCost.quJob.RecordCount > 0)) then
    edJobNo.Text := dmCost.quJob.FieldValues['Job_No'];
end;

procedure TfmQSImpt.edStartLineNoExit(Sender: TObject);
begin
  if trim(edEndLineNo.Text) = '' then
    edEndLineNo.Text := edStartLineNo.Text;  
end;

end.
