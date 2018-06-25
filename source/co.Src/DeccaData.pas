unit DeccaData;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, Wwquery, Wwdatsrc;

type
  TdmDecca = class(TDataModule)
    usCompany: TUpdateSQL;
    dsCompanyMod: TDataSource;
    quCompanyMod: TQuery;
    usCompanyMod: TUpdateSQL;
    dsUserProg: TDataSource;
    quUserProg: TQuery;
    usUserFile: TUpdateSQL;
    dsPwdDef: TDataSource;
    quPwdDef: TQuery;
    quPwdDefPROGRAM_ID: TStringField;
    quPwdDefFUNCTION_NO: TIntegerField;
    quPwdDefDESCRIPTION: TStringField;
    usPrgDef: TUpdateSQL;
    dbCommon: TDatabase;
    quCompanyModCOMPANY_ID: TStringField;
    quCompanyModMODULE_ID: TStringField;
    quCompanyModDATABASE_ALIAS: TStringField;
    quCompanyModSERVER: TStringField;
    quUserProgCOMPANY_ID: TStringField;
    quUserProgPROGRAM_ID: TStringField;
    quUserProgUSER_ID: TStringField;
    quUserProgFUNC_APPROVED: TStringField;
    quSelCompany: TQuery;
    dsSelCompany: TDataSource;
    dsSelFuncApproved: TDataSource;
    quSelFuncApproved: TQuery;
    quSelServer: TQuery;
    dsSelServer: TDataSource;
    quPwdDefMODULE_ID: TStringField;
    usUserProg: TUpdateSQL;
    quCompanyModPROG_PATH: TStringField;
    quPwdDefFUNC_GRP: TIntegerField;
    quSel1User: TQuery;
    dsSel1User: TDataSource;
    quSelCompanyCOMPANY_ID: TStringField;
    quSelCompanyPROGRAM_ID: TStringField;
    quSelCompanyUSER_ID: TStringField;
    quSelCompanyFUNC_APPROVED: TStringField;
    quSel1Company: TwwQuery;
    quSel1CompanyCOMPANY_ID: TStringField;
    quSel1CompanyC_NAME: TStringField;
    quSel1CompanyE_NAME: TStringField;
    quSel1CompanyADDRESS: TStringField;
    quSel1CompanyACTIVE_SECURITY: TStringField;
    quSel1CompanyCOMPANY_ANIMATION: TStringField;
    quSel1CompanyFAX: TStringField;
    quSel1CompanyPHONE: TStringField;
    dsSel1Company: TwwDataSource;
    quUserFile: TwwQuery;
    dsUserFile: TwwDataSource;
    quUserFileUSER_ID: TStringField;
    quUserFileUSER_NAME: TStringField;
    quUserFilePASSWD: TStringField;
    quUserFileDEPT: TStringField;
    quUserFileLST_COMPANY: TStringField;
    quUserFileFIX_COMPANY: TStringField;
    quSelFuncApprovedCOMPANY_ID: TStringField;
    quSelFuncApprovedPROGRAM_ID: TStringField;
    quSelFuncApprovedUSER_ID: TStringField;
    quSelFuncApprovedFUNC_APPROVED: TStringField;
    quSel1UserUSER_ID: TStringField;
    quSel1UserUSER_NAME: TStringField;
    quSel1UserPASSWD: TStringField;
    quSel1UserDEPT: TStringField;
    quSel1UserLST_COMPANY: TStringField;
    quSel1UserFIX_COMPANY: TStringField;
    quCompany: TwwQuery;
    dsCompany: TwwDataSource;
    quCompanyCOMPANY_ID: TStringField;
    quCompanyC_NAME: TStringField;
    quCompanyE_NAME: TStringField;
    quCompanyADDRESS: TStringField;
    quCompanyACTIVE_SECURITY: TStringField;
    quCompanyCOMPANY_ANIMATION: TStringField;
    quCompanyFAX: TStringField;
    quCompanyPHONE: TStringField;
    quCompanyCURRENCY: TStringField;
    quCompanyAC_LENGTH: TIntegerField;
    quCompanyUSE_PFT_CTR_1: TStringField;
    quCompanyPFT_CTR_1_LEN: TIntegerField;
    quCompanyUSE_PFT_CTR_2: TStringField;
    quCompanyPFT_CTR_2_LEN: TIntegerField;
    quCompanyModPROG_PATH_2: TStringField;
    quUserProgMODULE_ID: TStringField;
    quSelModule: TwwQuery;
    dsSelModule: TwwDataSource;
    quSelModuleCOMPANY_ID: TStringField;
    quSelModuleMODULE_ID: TStringField;
    quSelModuleDATABASE_ALIAS: TStringField;
    quSelModuleSERVER: TStringField;
    quSelModulePROG_PATH: TStringField;
    quSelModulePROG_PATH_2: TStringField;
    procedure quUserProgPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure quCompanyModAfterPost(DataSet: TDataSet);
    procedure quPwdDefAfterPost(DataSet: TDataSet);
    procedure quCompanyModBeforePost(DataSet: TDataSet);
    procedure quUserFileAfterPost(DataSet: TDataSet);
    procedure quSelModuleBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmDecca: TdmDecca;
const
  {Declare constants we're interested in}
  eKeyViol = 9729;
  eRequiredFieldMissing = 9732;
  eForeignKey = 9733;
  eDetailsExist = 9734;


implementation
uses DeccaMain;
{$R *.DFM}

procedure TdmDecca.quUserProgPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
var
  iDBIError: Integer;
begin
  //ShowMessage(IntToStr((E as EDBEngineError).Errors[0].Errorcode));
  if (E is EDBEngineError) then
  begin
    iDBIError := (E as EDBEngineError).Errors[0].Errorcode;
    case iDBIError of
      eRequiredFieldMissing:
        //The EmpNo field is defined as being required.
        begin
          MessageDlg('請輸入完整的記錄!', mtWarning, [mbOK], 0);
          Abort;
        end;
      eKeyViol:
        //The primary key is OrderNo
        begin
          MessageDlg('該記錄已經存在!', mtWarning,
            [mbOK], 0);
          Abort;
        end;
    end;
  end;
end;

procedure TdmDecca.quCompanyModAfterPost(DataSet: TDataSet);
begin
  with quCompanyMod do
  begin
    try
      ApplyUpdates;
      CommitUpdates;
    except
      on E : EDBEngineError do
        ShowMessage('未能夠更新檔案 [' + IntToStr(E.Errors[0].ErrorCode) +']');
    end;
  end;
end;

procedure TdmDecca.quPwdDefAfterPost(DataSet: TDataSet);
begin
  with quPwdDef do
  begin
    try
      ApplyUpdates;
      CommitUpdates;
    except
      on E : EDBEngineError do
        ShowMessage('未能夠更新檔案 [' + IntToStr(E.Errors[0].ErrorCode) +']');
    end;
  end;
end;

procedure TdmDecca.quCompanyModBeforePost(DataSet: TDataSet);
begin
  with quCompanyMod do
  begin
    FieldByName('Company_ID').AsString := wCompanyID;
  end;
end;

procedure TdmDecca.quUserFileAfterPost(DataSet: TDataSet);
begin
  with quUserFile do
  begin
    try
      ApplyUpdates;
      CommitUpdates;
    except
      on E : EDBEngineError do
        ShowMessage('未能夠更新檔案 [' + IntToStr(E.Errors[0].ErrorCode) +']');
    end;
  end;

end;

procedure TdmDecca.quSelModuleBeforeDelete(DataSet: TDataSet);
begin
  if MessageDlg('刪除記錄 <' + quUserProgUSER_ID.AsString + '> ?',
    mtWarning, [mbYes, mbNo], 0) = mrNo then
    Abort;
end;

end.
