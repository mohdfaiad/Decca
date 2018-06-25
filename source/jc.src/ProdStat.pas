unit ProdStat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  wwSpeedButton, wwDBNavigator, Menus, Buttons, ExtCtrls, Grids, Wwdbigrd,
  Wwdbgrid, Db, DBTables, Wwquery, Wwdatsrc, Mask, DBCtrls, StdCtrls,
  wwdblook;

type
  TfmProdStat = class(TForm)
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    mmJob_cost_file: TMainMenu;
    N1: TMenuItem;
    mmPrintsetup: TMenuItem;
    N3: TMenuItem;
    mmExit: TMenuItem;
    mmJChelp: TMenuItem;
    mmHelp: TMenuItem;
    ps_PrinterSetup: TPrinterSetupDialog;
    dnaFWOProduction: TwwDBNavigator;
    wwDBNavigator1First: TwwNavButton;
    wwDBNavigator1Prior: TwwNavButton;
    wwDBNavigator1Next: TwwNavButton;
    wwDBNavigator1Last: TwwNavButton;
    wwDBNavigator1Insert: TwwNavButton;
    wwDBNavigator1Delete: TwwNavButton;
    wwDBNavigator1Post: TwwNavButton;
    wwDBNavigator1Cancel: TwwNavButton;
    dsFwoProduction: TwwDataSource;
    quFwoProduction: TwwQuery;
    usFwoProduction: TUpdateSQL;
    quFwoProductionJOB_COST_CAT: TStringField;
    quFwoProductionRECEIVE_DATE: TDateTimeField;
    quFwoProductionFINISH_DATE: TDateTimeField;
    quFwoProductionORDER_CREATED_BY: TStringField;
    paTools: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edProdCat: TEdit;
    Label3: TLabel;
    dedFwoNo: TDBEdit;
    quUserProd: TwwQuery;
    quUserProdUSER_ID: TStringField;
    quUserProdPRODUCTION_CAT: TStringField;
    quUserProdFUNCTION_FLAG: TStringField;
    quFwoProductionJOB_NO_1: TStringField;
    quFwoProductionJOB_NO_2: TStringField;
    quFwoProductionFWO_NO: TStringField;
    quCostCat: TwwQuery;
    quCostCatJOB_COST_CAT: TStringField;
    quCostCatDESCRIPTION: TStringField;
    quCostCatJOB_COST_CAT_UNIT: TStringField;
    quCostCatJOB_COST_TYPE: TStringField;
    quCostCatREG_RATE: TBCDField;
    quCostCatPREM_RATE: TBCDField;
    quCostCatPRODUCTION_CAT: TStringField;
    quFwoProductionSUBPRODUCTION_START_DATE: TDateTimeField;
    quFwoProductionSUBPRODUCTION_END_DATE: TDateTimeField;
    quFwoProductionPRODUCTION_STATUS: TStringField;
    GroupBox1: TGroupBox;
    dgrFwoProduction: TwwDBGrid;
    dlcJobCostCat: TwwDBLookupCombo;
    usSubProd: TUpdateSQL;
    dsSubProd: TwwDataSource;
    puSubPord: TPopupMenu;
    mmDelete: TMenuItem;
    quWorkGroup: TwwQuery;
    quWorkGroupWORK_GROUP: TStringField;
    quWorkGroupDESCRIPTION: TStringField;
    quWorkGroupREG_RATE: TBCDField;
    quWorkGroupPREM_RATE: TBCDField;
    quWorkGroupJOB_COST_CAT: TStringField;
    quProdStatus: TwwQuery;
    quProdStatusPRODUCTION_STATUS: TStringField;
    quProdStatusDESCRIPTION: TStringField;
    quMaxLineNo: TwwQuery;
    quFwoProductionFristDate: TDateField;
    quFwoProductionLastDate: TDateField;
    sbUpdate: TSpeedButton;
    quMaxLineNoMAXLINENO: TIntegerField;
    mmSave: TMenuItem;
    quFwoProductioncostcatDesc: TStringField;
    quTest: TQuery;
    quTestJOB_NO_1: TStringField;
    quTestJOB_NO_2: TStringField;
    quTestFWO_NO: TStringField;
    quTestJOB_COST_CAT: TStringField;
    quTestRECEIVE_DATE: TDateTimeField;
    quTestFINISH_DATE: TDateTimeField;
    quTestORDER_CREATED_BY: TStringField;
    quTestSUBPRODUCTION_START_DATE: TDateTimeField;
    quTestSUBPRODUCTION_END_DATE: TDateTimeField;
    quTestPRODUCTION_STATUS: TStringField;
    N2: TMenuItem;
    quFwoProductionStatusDesc: TStringField;
    sbClear: TSpeedButton;
    quSubProd: TwwQuery;
    quSubProdJOB_NO_1: TStringField;
    quSubProdJOB_NO_2: TStringField;
    quSubProdFWO_NO: TStringField;
    quSubProdLINE_NO: TIntegerField;
    quSubProdSTART_DATE: TDateTimeField;
    quSubProdWORK_GROUP: TStringField;
    quSubProdEND_DATE: TDateTimeField;
    quSubProdPRODUCTION_STATUS: TStringField;
    GroupBox2: TGroupBox;
    dgrSubProd: TwwDBGrid;
    dlcWorkGroup: TwwDBLookupCombo;
    dlcProdStatus: TwwDBLookupCombo;
    dsFwoProdSeq: TwwDataSource;
    quFwoProdSeq: TwwQuery;
    usFwoProdSeq: TUpdateSQL;
    gbFWOProdSeq: TGroupBox;
    dgrFwoProdSeq: TwwDBGrid;
    quFwoProdSeqPRODUCTION_ID: TIntegerField;
    quFwoProdSeqPRODUCTION_DATE: TDateTimeField;
    quFwoProdSeqJOB_NO_1: TStringField;
    quFwoProdSeqJOB_NO_2: TStringField;
    quFwoProdSeqFWO_NO: TStringField;
    quFwoProdSeqPRODUCTION_CAT: TStringField;
    quFwoProductionPRODUCTION_ID: TIntegerField;
    quSubProdPRODUCTION_ID: TIntegerField;
    pmProduction: TPopupMenu;
    puProductionPost: TMenuItem;
    N5: TMenuItem;
    pmProductionDelete: TMenuItem;
    quSubProdJOB_COST_CAT: TStringField;
    dedJobNo: TDBEdit;
    quFwoProdSeqFWO_QTY: TBCDField;
    dedFWODesc: TDBEdit;
    Label4: TLabel;
    dedProductionID: TDBEdit;
    quSubProdcalWorkGroupDesc: TStringField;
    quSubProdStatusDesc: TStringField;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure quFwoProductionAfterPost(DataSet: TDataSet);
    procedure quFwoProductionBeforeDelete(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure quFwoProductionNewRecord(DataSet: TDataSet);
    procedure quSubProdAfterPost(DataSet: TDataSet);
    procedure mmDeleteClick(Sender: TObject);
    procedure quSubProdNewRecord(DataSet: TDataSet);
    procedure sbUpdateClick(Sender: TObject);
    procedure dlcJobCostCatEnter(Sender: TObject);
    procedure mmSaveClick(Sender: TObject);
    procedure puSubPordPopup(Sender: TObject);
    procedure dgrFwoProductionEnter(Sender: TObject);
    procedure sbClearClick(Sender: TObject);
    procedure quFwoProductionBeforeInsert(DataSet: TDataSet);
    procedure GroupBox2Exit(Sender: TObject);
    procedure quFwoProdSeqNewRecord(DataSet: TDataSet);
    procedure pmProductionPopup(Sender: TObject);
    procedure puProductionPostClick(Sender: TObject);
    procedure pmProductionDeleteClick(Sender: TObject);
    procedure quFwoProdSeqAfterPost(DataSet: TDataSet);
    procedure quFwoProdSeqPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure quFwoProdSeqUpdateError(DataSet: TDataSet; E: EDatabaseError;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure gbFWOProdSeqEnter(Sender: TObject);
    procedure GroupBox1Enter(Sender: TObject);
    procedure GroupBox2Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmProdStat: TfmProdStat;

implementation
uses ProdCtrl, JcMain, FinishDlg, JCdatadm, FWOdtDm;
{$R *.DFM}
var
  wEdit : String;

procedure TfmProdStat.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TfmProdStat.FormCreate(Sender: TObject);
begin
  Caption := wCompanyName + ' == ' + Caption;
  edProdCat.Text := fmProdCtrl.dlcProdCat.Text;
  with quUserProd do
  begin
    if Active then
      Close;
    ParamByName('User_id').AsString := wUserId;
    ParamByName('Production_cat').AsString := edProdCat.Text;
    Open;
    wEdit := FieldByName('Function_flag').AsString ;
    if wEdit = 'W' then
    begin
      dedJobNo.Font.Color := clBlack;
      quFwoProdSeq.RequestLive := True;
      quFwoProdSeq.CachedUpdates := True;
      dgrFwoProdSeq.ReadOnly := False;
      quFwoProduction.RequestLive := True;
      quFwoProduction.CachedUpdates := True;
      dgrFwoProduction.ReadOnly := False;
      quSubProd.RequestLive := True;
      quSubProd.CachedUpdates := True;
      dgrSubProd.ReadOnly := False;
      sbUpdate.Enabled := True;
      sbClear.Enabled := True;
     // dnaFwoCostCat.Enabled := True;
    end
    else
    begin
      dedJobNo.Font.Color := clRed;
      quFwoProdSeq.RequestLive := False;
      quFwoProdSeq.CachedUpdates := False;
      dgrFwoProdSeq.ReadOnly := True;
      quFwoProduction.RequestLive := False;
      quFwoProduction.CachedUpdates := False;
      dgrFwoProduction.ReadOnly := True;
      quSubProd.RequestLive := False;
      quSubProd.CachedUpdates := False;
      dgrSubProd.ReadOnly := True;
      //dnaFwoCostCat.Enabled := False;
      sbUpdate.Enabled := False;
      sbClear.Enabled := False;
    end;
  end;
  with qufwoprodseq do
   begin
   if Active then
      Close;
    ParamByName('Job_no_1').AsString :=
      fmProdCtrl.quJobFwo.FieldByName('Job_no_1').AsString;
    ParamByName('Fwo_no').AsString :=
      fmProdCtrl.quJobFwo.FieldByName('Fwo_no').AsString;
    ParamByName('Production_cat').Asstring := fmProdCtrl.dlcProdCat.Text;
    Open;
   end;
  with quFwoProduction do
  begin
    if Active then
      Close;
    {ParamByName('Job_no_1').AsString :=
      fmProdCtrl.quJobFwo.FieldByName('Job_no_1').AsString;
    ParamByName('Fwo_no').AsString :=
      fmProdCtrl.quJobFwo.FieldByName('Fwo_no').AsString;
    ParamByName('Production_cat').Asstring := fmProdCtrl.dlcProdCat.Text;}
    //parambyname('production_id').asinteger:=qufwoprodseqproduction_id.AsInteger;
    Open;
  end;
  with quCostCat do
  begin
    if  Active then
      Close;
    ParamByName('Production_cat').AsString := edProdCat.Text;
    Open;
  end;
  with quProdStatus do
  begin
    if not Active then
      Open;
  end;
  with quWorkGroup do
  begin
    if not Active then
      Open;
  end;
  with quSubProd do
  begin
    if not Active then
      Open;
  end;
end;

procedure TfmProdStat.quFwoProductionAfterPost(DataSet: TDataSet);
begin
  quFwoProductionJOB_COST_CAT.ReadOnly := True;
  if wEdit <> 'W' then
  begin
    showmessage('沒有授權更新記錄');
    Abort;
  end;
  try
    with quFwoProduction do
    begin
      ApplyUpdates;
      CommitUpdates;
    end;
  except
    showmessage('記錄不能更新,數据無效');
  end;
end;

procedure TfmProdStat.quFwoProductionBeforeDelete(DataSet: TDataSet);
begin

  if (MessageDlg('确實要刪除么?',
       mtConfirmation, [mbYes, mbNo], 0) = mrNo) and (wEdit = 'W') then
      Abort;
end;

procedure TfmProdStat.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with quCostCat do
    if Active then
      Close;
  with quProdStatus do
  begin
    if Active then
      Close;
  end;
  with quWorkGroup do
  begin
    if Active then
      Close;
  end;
  with quSubProd do
  begin
    if Active then
      Close;
  end;
end;

procedure TfmProdStat.quFwoProductionNewRecord(DataSet: TDataSet);
begin
  with quFwoProdSeq do
  begin
    quFwoProductionJOB_NO_1.AsString := quFwoProdSeqJOB_NO_1.AsString;
    quFwoProductionJOB_NO_2.AsString := quFwoProdSeqJOB_NO_2.AsString;
    quFwoProductionFWO_NO.AsString := quFwoProdSeqFWO_NO.AsString;
    quFwoProductionJOB_COST_CAT.ReadOnly := False;
    quFwoProductionRECEIVE_DATE.AsDateTime := Date;
    qufwoproductionproduction_id.asinteger:= quFwoProdSeqPRODUCTION_ID.AsInteger;
  end;
end;

procedure TfmProdStat.quSubProdAfterPost(DataSet: TDataSet);
begin
  if wEdit <> 'W' then
  begin
    showmessage('沒有授權更新記錄');
    Abort;
  end;
  try
    with quSubProd do
    begin
      ApplyUpdates;
      CommitUpdates;
      {with quFwoProduction do
      begin
        if quSubProdSTART_DATE.AsDateTime >=
          quFwoProductionSUBPRODUCTION_START_DATE.AsDateTime then
        begin
          quFwoProduction.Edit;
          quFwoProductionSUBPRODUCTION_START_DATE.ReadOnly := False;
          quFwoProductionSUBPRODUCTION_END_DATE.ReadOnly := False;
          quFwoProductionSUBPRODUCTION_START_DATE.AsDateTime :=
            quSubProdSTART_DATE.AsDateTime;
          quFwoProductionSUBPRODUCTION_END_DATE.AsDateTime :=
            quSubProdEND_DATE.AsDateTime;
          quFwoProduction.Post;
          quFwoProductionSUBPRODUCTION_START_DATE.ReadOnly := True;
          quFwoProductionSUBPRODUCTION_END_DATE.ReadOnly := True;
        end;
      end;}
    end;
  except
    showmessage('記錄不能更新,數据無效');
  end;
end;

procedure TfmProdStat.mmDeleteClick(Sender: TObject);
begin
  if not quSubProd.IsEmpty then
    quSubProd.Delete;
end;

procedure TfmProdStat.quSubProdNewRecord(DataSet: TDataSet);
begin
  quSubProdJOB_NO_1.AsString := quFwoProductionJOB_NO_1.AsString;
  quSubProdJOB_NO_2.AsString := quFwoProductionJOB_NO_2.Asstring;
  quSubProdJOB_COST_CAT.AsString := quFwoProductionJOB_COST_CAT.Asstring;
  quSubProdFWO_NO.AsString := quFwoProductionFWO_NO.AsString;
  quSubProdSTART_DATE.AsDateTime := Date;
  quSubProdLINE_NO.AsInteger := quSubProd.RecordCount + 1 ;
  qusubprodproduction_id.asinteger:= quFwoProductionPRODUCTION_ID.AsInteger;
 { with quMaxLineNo do
  begin
    if Active then
      Open;
    quSubProdLINE_NO.AsInteger := FieldByName('MaxLineNo').AsInteger + 1;
  end; }
end;

procedure TfmProdStat.sbUpdateClick(Sender: TObject);
begin
  if wEdit <> 'W' then
  begin
    showmessage('沒有授權更新記錄');
    Abort;
  end;
  Application.CreateForm(TfmFinishDlg, fmFinishDlg);
  try
    fmFinishDlg.ShowModal;
  finally
    fmFinishDlg.Free;
  end;
end;

procedure TfmProdStat.dlcJobCostCatEnter(Sender: TObject);
begin
  {with quFwoProduction do
  begin
    if (not modified) and
      (FieldByName('Job_cost_cat').AsString = '') then
      Insert;
  end;}
end;

procedure TfmProdStat.mmSaveClick(Sender: TObject);
begin
  quSubProd.Post;
end;

procedure TfmProdStat.puSubPordPopup(Sender: TObject);
begin
  with quSubProd do
  begin
    if ((state = dsEdit) or (state = dsInsert)) then
    begin
      mmSave.Enabled := True;
      mmDelete.Enabled := True;
    end
    else
    begin
      mmSave.Enabled := false;
      mmDelete.Enabled := false;
      if not quSubProd.IsEmpty then
        mmDelete.Enabled := true
      else
        mmDelete.Enabled := false;
    end;
  end;
end;

procedure TfmProdStat.dgrFwoProductionEnter(Sender: TObject);
begin
  with quFwoProduction do
  begin
    if IsEmpty and (not Modified) then
      Insert;
  end;
end;

procedure TfmProdStat.sbClearClick(Sender: TObject);
begin
  if MessageDlg('清除齊料?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    with quFwoProduction do
    begin
      dgrFwoProduction.Enabled := False;
      First;
      quFwoProductionFINISH_DATE.ReadOnly := False;
      while not eof do
      begin
        Edit;
        FieldByName('Finish_date').Value := null;
        Post;
        Next;
      end;
      quFwoProductionFINISH_DATE.ReadOnly := True;
      dgrFwoProduction.Enabled := True;
        //EnableConstraints;
    end;
  end;
end;

procedure TfmProdStat.quFwoProductionBeforeInsert(DataSet: TDataSet);
begin
  with quFwoProduction do
  begin
    if not IsEmpty then
    begin
      if FieldByName('Finish_date').AsString <> '' then
      begin
        ShowMessage('已齊料，不能增加記錄!');
        Abort;
      end;
    end;
  end;
end;

procedure TfmProdStat.GroupBox2Exit(Sender: TObject);
begin
  with quSubProd do
  begin
    dsSubProd.Enabled := False;
    if Active then Close;
    dsSubProd.Enabled := True;
    Open;
  end;
end;

procedure TfmProdStat.quFwoProdSeqNewRecord(DataSet: TDataSet);
begin
  with fmProdCtrl do
  begin
    quFwoProdSeqJOB_NO_1.AsString := quJobFwoJOB_NO_1.AsString;
    quFwoProdSeqJOB_NO_2.AsString := quJobFwoJOB_NO_2.AsString;
    quFwoProdSeqFWO_NO.AsString := quJobFwoFWO_NO.AsString;
    qufwoProdSeqProduction_cat.AsString:=edprodcat.text;
    quFwoprodSeqproduction_DATE.AsDateTime := Date;
    qufwoprodseqproduction_id.asinteger:=0;
    quFwoProdSeqFWO_QTY.Value := quJobFwoFWO_QTY.Value;
  end;

end;

procedure TfmProdStat.pmProductionPopup(Sender: TObject);
begin
  with quFwoProduction do
  begin
    if ((state = dsEdit) or (state = dsInsert)) then
    begin
      mmSave.Enabled := True;
      mmDelete.Enabled := True;
    end
    else
    begin
      mmSave.Enabled := false;
      mmDelete.Enabled := false;
      if not quSubProd.IsEmpty then
        mmDelete.Enabled := true
      else
        mmDelete.Enabled := false;
    end;
  end;
end;

procedure TfmProdStat.puProductionPostClick(Sender: TObject);
begin
  quFwoProduction.Post;
end;

procedure TfmProdStat.pmProductionDeleteClick(Sender: TObject);
begin
  quFwoProduction.Delete;
end;

procedure TfmProdStat.quFwoProdSeqAfterPost(DataSet: TDataSet);
begin
  with quFwoProdSeq do
    try
      ApplyUpdates;
      CommitUpdates;
      Close;
      Open;
    except
      ShowMessage('未能更新記錄');
    end;

end;

procedure TfmProdStat.quFwoProdSeqPostError(DataSet: TDataSet;
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

procedure TfmProdStat.quFwoProdSeqUpdateError(DataSet: TDataSet;
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

procedure TfmProdStat.gbFWOProdSeqEnter(Sender: TObject);
begin
  dnaFWOProduction.Enabled := True;
  dgrFwoProdSeq.ColumnByName('PRODUCTION_ID').ReadOnly := true;
end;

procedure TfmProdStat.GroupBox1Enter(Sender: TObject);
begin
  dnaFWOProduction.Enabled := False;
  dgrFwoProduction.ColumnByName('PRODUCTION_ID').ReadOnly := true;
end;

procedure TfmProdStat.GroupBox2Enter(Sender: TObject);
begin
  dnaFWOProduction.Enabled := False;
  dgrSubProd.ColumnByName('PRODUCTION_ID').ReadOnly := true;
end;

end.
