unit emdatamd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Wwdatsrc, DBTables, Wwtable, Wwquery;

type
  TdmEMData = class(TDataModule)
    dbEMData: TDatabase;
    taEmcontrol: TwwTable;
    dsEMControl: TwwDataSource;
    quEquipment: TwwQuery;
    dsEquipment: TwwDataSource;
    quEquipmentEQUIPMENT_NO: TStringField;
    quEquipmentMODEL_NO: TStringField;
    quEquipmentEQUIPMENT_TYPE: TStringField;
    quEquipmentDESCRIPTION: TStringField;
    quEquipmentMADE_BY: TStringField;
    quEquipmentPURCHASED_DATE: TDateTimeField;
    quEquipmentLOC_NAME: TStringField;
    quEquipmentLOC_DEPT: TStringField;
    quEquipmentSTATUS: TStringField;
    dsEQPType: TwwDataSource;
    usEQPType: TUpdateSQL;
    dsPartsType: TwwDataSource;
    usPartsType: TUpdateSQL;
    dsServType: TwwDataSource;
    usServType: TUpdateSQL;
    quSupplierInfo: TwwQuery;
    dsSupplierInfo: TwwDataSource;
    usSupplierInfo: TUpdateSQL;
    usEquipment: TUpdateSQL;
    quEQPParts: TwwQuery;
    dsEQPParts: TwwDataSource;
    usEQPParts: TUpdateSQL;
    dbWPData: TDatabase;
    quDepartment: TwwQuery;
    quDepartmentDEPARTMENT_CODE: TStringField;
    quDepartmentDESCRIPTION: TStringField;
    quEQPPartsEQUIPMENT_NO: TStringField;
    quEQPPartsLINE_NO: TIntegerField;
    quEQPPartsDESCRIPTION: TStringField;
    quEQPPartsPARTS_TYPE: TStringField;
    quEQPPartsMODEL_NO: TStringField;
    quEQPPartsFUNC_CODE: TStringField;
    quEQPPartsUNIT: TStringField;
    quEQPPartsPARTS_QTY: TIntegerField;
    quPartsFile: TwwQuery;
    dsPartsFile: TwwDataSource;
    usPartsFile: TUpdateSQL;
    quPartsFilePARTS_NO: TStringField;
    quPartsFileDESCRIPTION: TStringField;
    quPartsFilePARTS_TYPE: TStringField;
    quPartsFileUSAGE_DEPT: TStringField;
    quPartsFileMODEL_NO: TStringField;
    quPartsFileFUNC_CODE: TStringField;
    quPartsFileSTATUS: TStringField;
    quPartsFileUNIT: TStringField;
    quPartsFilePARTS_QTY: TIntegerField;
    quPartsInOut: TwwQuery;
    dsPartsInOut: TwwDataSource;
    usPartsInOut: TUpdateSQL;
    quPartsInOutPARTS_NO: TStringField;
    quPartsInOutIN_OUT_DATE: TDateTimeField;
    quPartsInOutEQUIPMENT_NO: TStringField;
    quPartsInOutIN_OUT_FLAG: TStringField;
    quPartsInOutUNIT: TStringField;
    quPartsInOutIN_QTY: TIntegerField;
    quPartsInOutTO_DEPT: TStringField;
    quPartsInOutWORKER: TStringField;
    quPartsInOutSER_MAN: TStringField;
    quPrtsIOComment: TwwQuery;
    dsPrtsIOComment: TwwDataSource;
    usPrtsIOComment: TUpdateSQL;
    quServFile: TwwQuery;
    dsServFile: TwwDataSource;
    usServFile: TUpdateSQL;
    quServLine: TwwQuery;
    dsServLine: TwwDataSource;
    usServLine: TUpdateSQL;
    quServFileSERVICE_NO: TStringField;
    quServFileSERV_EQP_TYPE: TStringField;
    quServFilePARTS_EQUIP_ID: TStringField;
    quServFileREQUEST_DEPT: TStringField;
    quServFileREQUEST_DATE: TDateTimeField;
    quServFileEXP_COMPL_DATE: TDateTimeField;
    quServFileCREATE_DATE: TDateTimeField;
    quServFileSERV_PRIORITY: TStringField;
    quServFileSERVICE_SITE: TStringField;
    quServFileSUPPLIER_NO: TStringField;
    quServFileSTATUS: TStringField;
    quServFileREQUEST_BY: TStringField;
    quServFileCREATED_BY: TStringField;
    quServLineSERVICE_NO: TStringField;
    quServLineLINE_NO: TIntegerField;
    quServLineFROM_DATE: TDateTimeField;
    quServLineTO_DATE: TDateTimeField;
    quServLineSERVICE_TYPE: TStringField;
    quServLineSERVICEMAN_1: TStringField;
    quServLineSERVICEMAN_2: TStringField;
    quServLineSERVICEMAN_3: TStringField;
    quServLineSUPERVISED_BY: TStringField;
    quServiceMan: TwwQuery;
    quServiceManWORKER_NO: TStringField;
    quServiceManNAME: TStringField;
    quSupplierInfoSUPPLIER_NO: TStringField;
    quSupplierInfoCHINESE_NAME: TStringField;
    quSupplierInfoENGLISH_NAME: TStringField;
    quSupplierInfoADDRESS: TMemoField;
    quSupplierInfoCONTACT_1: TStringField;
    quSupplierInfoTITLE_1: TStringField;
    quSupplierInfoTELEPHONE_1: TStringField;
    quSupplierInfoCONTACT_2: TStringField;
    quSupplierInfoTITLE_2: TStringField;
    quSupplierInfoTELEPHONE_2: TStringField;
    quSupplierInfoFAX_NO: TStringField;
    quSupplierInfoEMAIL_ADDRESS: TStringField;
    quSupplierInfoSTATUS: TStringField;
    quSupplierInfoCOMMENT: TMemoField;
    quServLineCOMMENT: TStringField;
    quPartsFileDeptName: TStringField;
    quServFileDeptName: TStringField;
    quEquipmentDeptName: TStringField;
    quPartsInOutDeptName: TStringField;
    taEmcontrolCONTROL_KEY: TIntegerField;
    taEmcontrolNEXT_SERV_NO: TStringField;
    quPrtsIOCommentPARTS_NO: TStringField;
    quPrtsIOCommentIN_OUT_DATE: TDateTimeField;
    quPrtsIOCommentCOMMENT: TMemoField;
    quEPLineNoMax: TwwQuery;
    quEPLineNoMaxLN_MAX: TIntegerField;
    quE_PartsPhoto: TwwQuery;
    dsE_PartsPhoto: TwwDataSource;
    usE_PartsPhoto: TUpdateSQL;
    quE_PComment: TwwQuery;
    dsE_PComment: TwwDataSource;
    usE_PComment: TUpdateSQL;
    quE_PartsPhotoEQUIPMENT_NO: TStringField;
    quE_PartsPhotoLINE_NO: TIntegerField;
    quE_PartsPhotoPHOTO: TBlobField;
    quE_PCommentEQUIPMENT_NO: TStringField;
    quE_PCommentLINE_NO: TIntegerField;
    quE_PCommentCOMMENT: TMemoField;
    quEMServer: TQuery;
    quSelFuncApproved: TQuery;
    quCompany: TQuery;
    dbCommon: TDatabase;
    quWPServer: TQuery;
    quEQPType: TwwQuery;
    quPartsType: TwwQuery;
    quServType: TwwQuery;
    quEQPTypeEQUIPMENT_TYPE: TStringField;
    quEQPTypeDESCRIPTION: TStringField;
    quPartsTypePARTS_TYPE: TStringField;
    quPartsTypeDESCRIPTION: TStringField;
    quServTypeSERVICE_TYPE: TStringField;
    quServTypeDESCRIPTION: TStringField;
    quPartsFileDISCARDED_DATE: TDateTimeField;
    quEquipmentDISCARDED_DATE: TDateTimeField;
    quServFileSERV_OBJ_DESC: TStringField;
    quServ_Obj_ID: TwwQuery;
    quServ_Obj_IDOEQP_PARTS_ID: TStringField;
    quServ_Obj_IDODESCRIPTION: TStringField;
    quEQPDesc: TwwQuery;
    quPartsDesc: TwwQuery;
    quEQPDescEQUIPMENT_NO: TStringField;
    quEQPDescDESCRIPTION: TStringField;
    quPartsDescPARTS_NO: TStringField;
    quPartsDescDESCRIPTION: TStringField;
    quEquipmentENGLISH_DESC: TStringField;
    quEquipmentORIGIN: TStringField;
    quEquipmentM_C_NO: TStringField;
    quEquipmentPRODUCED_DATE: TDateTimeField;
    quEquipmentBOOKED: TStringField;
    taEmcontrolSERV_DEPT: TStringField;
    quPartsFilePURCHASED_DATE: TDateTimeField;
    quServFileSupplier_Desc: TStringField;
    quEquipmentLOC_GROUP: TStringField;
    quPartsFileUSAGE_GROUP: TStringField;
    quPartsFileSTART_DATE: TDateTimeField;
    quPartsInOutTO_GROUP: TStringField;
    quServFileREQUEST_GROUP: TStringField;
    quGroup: TwwQuery;
    quGroupWORKER_GROUP: TStringField;
    quGroupDESCRIPTION: TStringField;
    quGroupSUPERVISOR: TStringField;
    quGroupSUPERVISOR_2: TStringField;
    quEquipmentGroupName: TStringField;
    quPartsFileGroupName: TStringField;
    quPartsInOutGroupName: TStringField;
    quServFileGroupName: TStringField;
    quEQPPhoto: TwwQuery;
    dsEQPPhoto: TwwDataSource;
    usEQPPhoto: TUpdateSQL;
    quEQPComment: TwwQuery;
    dsEQPComment: TwwDataSource;
    usEQPComment: TUpdateSQL;
    quEQPCommentEQUIPMENT_NO: TStringField;
    quEQPCommentCOMMENT: TMemoField;
    quPFPhoto: TwwQuery;
    dsPFPhoto: TwwDataSource;
    usPFPhoto: TUpdateSQL;
    quPFComment: TwwQuery;
    dsPFComment: TwwDataSource;
    usPFComment: TUpdateSQL;
    quEQPPhotoEQUIPMENT_NO: TStringField;
    quEQPPhotoPHOTO: TBlobField;
    quPFPhotoPARTS_NO: TStringField;
    quPFPhotoPHOTO: TBlobField;
    quPFCommentPARTS_NO: TStringField;
    quPFCommentCOMMENT: TMemoField;
    quSFComment: TwwQuery;
    dsSFComment: TwwDataSource;
    usSFComment: TUpdateSQL;
    quSFCommentSERVICE_NO: TStringField;
    quSFCommentCOMMENT: TMemoField;
    quWorker: TwwQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    quEmCompany: TwwQuery;
    dsEMCompany: TwwDataSource;
    usEMCompany: TUpdateSQL;
    quEquipmentIMPORTED_BY: TStringField;
    quEquipmentOWNED_BY: TStringField;
    quEmCompanyCOMPANY_ID: TStringField;
    quEmCompanyCOMPANY_NAME: TStringField;
    procedure quPartsFileCalcFields(DataSet: TDataSet);
    procedure quServFileCalcFields(DataSet: TDataSet);
    procedure quEquipmentCalcFields(DataSet: TDataSet);
    procedure quSupplierInfoAfterPost(DataSet: TDataSet);
    procedure quEquipmentAfterPost(DataSet: TDataSet);
    procedure quEQPPartsAfterPost(DataSet: TDataSet);
    procedure quPartsFileAfterPost(DataSet: TDataSet);
    procedure quPartsInOutAfterPost(DataSet: TDataSet);
    procedure quPrtsIOCommentAfterPost(DataSet: TDataSet);
    procedure quServFileAfterPost(DataSet: TDataSet);
    procedure quServLineAfterPost(DataSet: TDataSet);
    procedure quPartsInOutCalcFields(DataSet: TDataSet);
    procedure quServFileAfterInsert(DataSet: TDataSet);
    procedure quServLineAfterInsert(DataSet: TDataSet);
    procedure quEQPPartsAfterInsert(DataSet: TDataSet);
    procedure quE_PartsPhotoAfterPost(DataSet: TDataSet);
    procedure quE_PCommentAfterPost(DataSet: TDataSet);
    procedure quSupplierInfoAfterInsert(DataSet: TDataSet);
    procedure quEQPTypeAfterPost(DataSet: TDataSet);
    procedure quPartsTypeAfterPost(DataSet: TDataSet);
    procedure quServTypeAfterPost(DataSet: TDataSet);
    procedure quEQPTypePostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure quEQPTypeUpdateError(DataSet: TDataSet; E: EDatabaseError;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure quPartsFileAfterInsert(DataSet: TDataSet);
    procedure quEquipmentAfterInsert(DataSet: TDataSet);
    procedure quEQPTypeBeforeDelete(DataSet: TDataSet);
    procedure quEquipmentBeforePost(DataSet: TDataSet);
    procedure quPartsFileBeforePost(DataSet: TDataSet);
    procedure quServFileBeforePost(DataSet: TDataSet);
    procedure quEQPPhotoAfterPost(DataSet: TDataSet);
    procedure quEQPCommentAfterPost(DataSet: TDataSet);
    procedure quPartsInOutAfterCancel(DataSet: TDataSet);
    procedure quPFPhotoAfterPost(DataSet: TDataSet);
    procedure quPFCommentAfterPost(DataSet: TDataSet);
    procedure quSFCommentAfterPost(DataSet: TDataSet);
    procedure quSFCommentBeforeScroll(DataSet: TDataSet);
    procedure quEQPPhotoBeforeScroll(DataSet: TDataSet);
    procedure quEQPCommentBeforeScroll(DataSet: TDataSet);
    procedure quE_PartsPhotoBeforeScroll(DataSet: TDataSet);
    procedure quE_PCommentBeforeScroll(DataSet: TDataSet);
    procedure quPFPhotoBeforeScroll(DataSet: TDataSet);
    procedure quPFCommentBeforeScroll(DataSet: TDataSet);
    procedure quPrtsIOCommentBeforeScroll(DataSet: TDataSet);
    procedure quServLineBeforeScroll(DataSet: TDataSet);
    procedure quEmCompanyAfterPost(DataSet: TDataSet);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmEMData: TdmEMData;

implementation

uses
  emmain;

{$R *.DFM}

procedure TdmEMData.quPartsFileCalcFields(DataSet: TDataSet);
begin
  with quDepartment do
  begin
    if Active then Close;
    with SQL do
    begin
      Clear;
      Add('Select * from department ');
      Add('Where Department_Code = :DepartmentCode');
    end;
    ParamByName('DepartmentCode').Value := quPartsFileUSAGE_DEPT.Value;
    Open;
    if RecordCount > 0 then
      quPartsFileDeptName.Value := quDepartmentDESCRIPTION.Value;
    Close;
  end;
  with quGroup do
  begin
    if Active then Close;
    with SQL do
    begin
      Clear;
      Add('Select * from WORKER_GROUP ');
      Add('Where WORKER_GROUP = :GroupNo');
    end;
    ParamByName('GroupNo').Value := quPartsFileUSAGE_GROUP.Value;
    Open;
    if RecordCount > 0 then
      quPartsFileGroupName.Value := quGroupDESCRIPTION.Value;
    Close;
  end;
end;

procedure TdmEMData.quServFileCalcFields(DataSet: TDataSet);
begin
  with quDepartment do
  begin
    if Active then Close;
    with SQL do
    begin
      Clear;
      Add('Select * from department ');
      Add('Where Department_Code = :DepartmentCode');
    end;
    ParamByName('DEPARTMENTCODE').Value := quServFileREQUEST_DEPT.Value;
    Open;
    if RecordCount > 0 then
      quServFileDeptName.Value := quDepartmentDESCRIPTION.Value;
    Close;
  end;
  with quGroup do
  begin
    if Active then Close;
    with SQL do
    begin
      Clear;
      Add('Select * from WORKER_GROUP ');
      Add('Where WORKER_GROUP = :GroupNo');
    end;
    ParamByName('GroupNo').Value := quServFileREQUEST_GROUP.Value;
    Open;
    if RecordCount > 0 then
      quServFileGroupName.Value := quGroupDESCRIPTION.Value;
    Close;
  end;
  if quServFileSERV_EQP_TYPE.Value = 'E' then
  begin
    with quEQPDesc do
    begin
      if Active then Close;
      ParamByName('EQUIPMENT_NO').Value := quServFilePARTS_EQUIP_ID.Value;
      Open;
      if (RecordCount > 0) and (trim(quEQPDescDESCRIPTION.Value) <> '') then
        quServFileSERV_OBJ_DESC.Value := quEQPDescDESCRIPTION.Value;
    end
  end
  else
  if quServFileSERV_EQP_TYPE.Value = 'P' then
  begin
    with quPartsDesc do
    begin
      if Active then Close;
      ParamByName('PARTS_NO').Value := quServFilePARTS_EQUIP_ID.Value;
      Open;
      if (RecordCount > 0) and (trim(quPartsDescDESCRIPTION.Value) <> '') then
        quServFileSERV_OBJ_DESC.Value := quPartsDescDESCRIPTION.Value;
    end
  end;
  with quSupplierInfo do
  begin
    if Active then Close;
    with SQL do
    begin
      Clear;
      Add('Select * from supplier');
      Add('Where Supplier_No = :SupplierNo');
    end;
    ParamByName('SupplierNo').Value := quServFileSUPPLIER_NO.Value;
    Open;
    if RecordCount > 0 then
      quServFileSupplier_Desc.Value := quSupplierInfoCHINESE_NAME.Value;
    Close;
  end;
{  with quServ_Obj_ID do
  begin
    if Active then Close;
    ParamByName('IDEPT_NO').Value := quServFileREQUEST_DEPT.Value;
    ParamByName('IOBJ_FLAG').Value := quServFileSERV_EQP_TYPE.Value;
    Open;
    if (RecordCount > 0) then
    begin
      if Locate('OEQP_PARTS_ID', quServFilePARTS_EQUIP_ID.Value, [locaseinsensitive]) then
        quServFileSERV_OBJ_DESC.Value := quServ_Obj_IDODESCRIPTION.Value;
    end;
  end; }
end;

procedure TdmEMData.quEquipmentCalcFields(DataSet: TDataSet);
begin
  with quDepartment do
  begin
    if Active then Close;
    with SQL do
    begin
      Clear;
      Add('Select * from department ');
      Add('Where Department_Code = :DepartmentCode');
    end;
    ParamByName('DepartmentCode').Value := quEquipmentLOC_DEPT.Value;
    Open;
    if RecordCount > 0 then
      quEquipmentDeptName.Value := quDepartmentDESCRIPTION.Value;
    Close;
  end;
  with quGroup do
  begin
    if Active then Close;
    with SQL do
    begin
      Clear;
      Add('Select * from worker_group ');
      Add('Where worker_group = :GroupNo');
    end;
    ParamByName('GroupNo').Value := quEquipmentLOC_GROUP.Value;
    Open;
    if RecordCount > 0 then
      quEquipmentGroupName.Value := quGroupDESCRIPTION.Value;
    Close;
  end;
end;

procedure TdmEMData.quSupplierInfoAfterPost(DataSet: TDataSet);
begin
  with quSupplierInfo do
  try
    ApplyUpdates;
    CommitUpdates;
  except
    showmessage('未能更新記錄');
  end;
end;

procedure TdmEMData.quEquipmentAfterPost(DataSet: TDataSet);
begin
  with quEquipment do
  try
    ApplyUpdates;
    CommitUpdates;
  except
    showmessage('未能更新記錄');
  end;
end;

procedure TdmEMData.quEQPPartsAfterPost(DataSet: TDataSet);
begin
  with quEQPParts do
  try
    ApplyUpdates;
    CommitUpdates;
  except
    showmessage('未能更新記錄');
  end;
end;

procedure TdmEMData.quPartsFileAfterPost(DataSet: TDataSet);
begin
  with quPartsFile do
  try
    ApplyUpdates;
    CommitUpdates;
  except
    showmessage('未能更新記錄');
  end;
end;

procedure TdmEMData.quPartsInOutAfterPost(DataSet: TDataSet);
begin
  with quPartsInOut do
  try
    ApplyUpdates;
    CommitUpdates;
  except
    showmessage('未能更新記錄');
  end;
end;

procedure TdmEMData.quPrtsIOCommentAfterPost(DataSet: TDataSet);
begin
  with quPrtsIOComment do
  try
    ApplyUpdates;
    CommitUpdates;
  except
    showmessage('未能更新記錄');
  end;
end;

procedure TdmEMData.quServFileAfterPost(DataSet: TDataSet);
begin
  with quServFile do
  try
    ApplyUpdates;
    CommitUpdates;
  except
    showmessage('未能更新記錄');
  end;
end;

procedure TdmEMData.quServLineAfterPost(DataSet: TDataSet);
begin
  with quServLine do
  try
    ApplyUpdates;
    CommitUpdates;
  except
    showmessage('未能更新記錄');
  end;
end;

procedure TdmEMData.quPartsInOutCalcFields(DataSet: TDataSet);
begin
  with quDepartment do
  begin
    if Active then Close;
    with SQL do
    begin
      Clear;
      Add('Select * from department ');
      Add('Where Department_Code = :DepartmentCode');
    end;
    ParamByName('DepartmentCode').Value := quPartsInOutTO_DEPT.Value;
    Open;
    if RecordCount > 0 then
      quPartsInOutDeptName.Value := quDepartmentDESCRIPTION.Value;
    Close;
  end;
  with quGroup do
  begin
    if Active then Close;
    with SQL do
    begin
      Clear;
      Add('Select * from WORKER_GROUP ');
      Add('Where WORKER_GROUP = :GroupNo');
    end;
    ParamByName('GroupNo').Value := quPartsInOutTO_GROUP.Value;
    Open;
    if RecordCount > 0 then
      quPartsInOutGroupName.Value := quGroupDESCRIPTION.Value;
    Close;
  end;
end;

procedure TdmEMData.quServFileAfterInsert(DataSet: TDataSet);
begin
  with taEmcontrol do
  begin
    if not Active then Open;
  end;
  quServFileSERVICE_NO.Value := taEmcontrolNEXT_SERV_NO.Value;
  quServFileSERV_EQP_TYPE.Value := 'P';
  quServFileREQUEST_DATE.Value := StrToDate(DatetoStr(Now));
  quServFileEXP_COMPL_DATE.Value := StrToDate(DatetoStr(Now));
  quServFileCREATE_DATE.Value := StrToDate(DatetoStr(Now));
  quServFileCREATED_BY.Value := wUser;
  quServFileSERVICE_SITE.Value := 'S';
  quServFileSTATUS.Value := 'W';
  with taEmcontrol do
  begin
    if Active then Close;
  end;
end;

procedure TdmEMData.quServLineAfterInsert(DataSet: TDataSet);
begin
  quServLineSERVICE_NO.Value := quServFileSERVICE_NO.Value;
  quServLineLINE_NO.Value := 1;
  quServLineFROM_DATE.Value := Now;
  quServLineTO_DATE.Value := Now;
end;

procedure TdmEMData.quEQPPartsAfterInsert(DataSet: TDataSet);
begin
  quEQPPartsEQUIPMENT_NO.Value := quEquipmentEQUIPMENT_NO.Value;
  quEQPPartsPARTS_QTY.Value := 1;
  with quEPLineNoMax do
  begin
    if Active then Close;
    ParamByName('EQP_NO').Value := quEQPPartsEQUIPMENT_NO.Value;
    Open;
    if quEPLineNoMaxLN_MAX.Value < 1 then
      quEQPPartsLINE_NO.Value := 1
    else
      quEQPPartsLINE_NO.Value := quEPLineNoMaxLN_MAX.Value + 1;
    Close;  
  end;  
end;

procedure TdmEMData.quE_PartsPhotoAfterPost(DataSet: TDataSet);
begin
  with quE_PartsPhoto do
  try
    ApplyUpdates;
    CommitUpdates;
  except
    showmessage('未能更新記錄');
  end;
end;

procedure TdmEMData.quE_PCommentAfterPost(DataSet: TDataSet);
begin
  with quE_PComment do
  try
    ApplyUpdates;
    CommitUpdates;
  except
    showmessage('未能更新記錄');
  end;
end;

procedure TdmEMData.quSupplierInfoAfterInsert(DataSet: TDataSet);
begin
  quSupplierInfoSTATUS.Value := 'R';
end;

procedure TdmEMData.quEQPTypeAfterPost(DataSet: TDataSet);
begin
  with quEQPType do
  try
    ApplyUpdates;
    CommitUpdates;
  except
    showmessage('未能更新記錄');
  end;
end;

procedure TdmEMData.quPartsTypeAfterPost(DataSet: TDataSet);
begin
  with quPartsType do
  try
    ApplyUpdates;
    CommitUpdates;
  except
    showmessage('未能更新記錄');
  end;

end;

procedure TdmEMData.quServTypeAfterPost(DataSet: TDataSet);
begin
  with quServType do
  try
    ApplyUpdates;
    CommitUpdates;
  except
    showmessage('未能更新記錄');
  end;
end;

procedure TdmEMData.quEQPTypePostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  if Length(e.Message) > 0 then
  begin
    if (Pos('Change the Record', E.Message) <> 0) then
    begin
      showmessage('記錄已修正,未能更新記錄');
      Action := daAbort;
      DataSet.Close;
      DataSet.Open;
    end
    else
    if (Pos('UNIQUE KEY', E.Message) <> 0) then
    begin
      showmessage('記錄重复');
      Action := daAbort;
      DataSet.Close;
      DataSet.Open;
    end
    else
    begin
      showmessage(e.Message);
      Action := daAbort;
    end;
  end;
end;

procedure TdmEMData.quEQPTypeUpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
  if Length(e.Message) > 0 then
  begin
    if (Pos('Changed the Record', E.Message) <> 0) then
    begin
      showmessage('記錄已修正,未能更新記錄');
      UpdateAction := uaAbort;
      DataSet.Close;
      DataSet.Open;
    end
    else
    if (Pos('UNIQUE KEY', E.Message) <> 0) then
    begin
      showmessage('記錄重复');
      UpdateAction := uaAbort;
      DataSet.Close;
      DataSet.Open;
    end
    else
    begin
      showmessage(e.Message);
      UpdateAction := uaAbort;
    end;
  end;
end;

procedure TdmEMData.quPartsFileAfterInsert(DataSet: TDataSet);
begin
  quPartsFilePARTS_QTY.Value := 1;
  quPartsFileSTATUS.Value := 'N'; 
end;

procedure TdmEMData.quEquipmentAfterInsert(DataSet: TDataSet);
begin
  quEquipmentSTATUS.Value := 'N';
  quEquipmentBOOKED.Value := 'Y';
end;

procedure TdmEMData.quEQPTypeBeforeDelete(DataSet: TDataSet);
begin
  if MessageDlg('要刪除資料嗎?', mtWarning, [mbYes, mbNo], 0) = mrNo then
    Abort;
end;

procedure TdmEMData.quEquipmentBeforePost(DataSet: TDataSet);
begin
  if quEquipmentSTATUS.Value <> 'D' then
  begin
    if not quEquipmentDISCARDED_DATE.IsNull then
      quEquipmentDISCARDED_DATE.Clear;
  end;
end;

procedure TdmEMData.quPartsFileBeforePost(DataSet: TDataSet);
begin
  if quPartsFileSTATUS.Value <> 'D' then
  begin
    if not quPartsFileDISCARDED_DATE.IsNull then
      quPartsFileDISCARDED_DATE.Clear;
  end;

end;

procedure TdmEMData.quServFileBeforePost(DataSet: TDataSet);
begin
  if quServFileSERVICE_SITE.Value <> 'O' then
  begin
    if not quServFileSUPPLIER_NO.IsNull then
      quServFileSUPPLIER_NO.Clear;
  end;
end;

procedure TdmEMData.quEQPPhotoAfterPost(DataSet: TDataSet);
begin
  with quEQPPhoto do
  try
    ApplyUpdates;
    CommitUpdates;
  except
    showmessage('未能更新記錄');
  end;
end;

procedure TdmEMData.quEQPCommentAfterPost(DataSet: TDataSet);
begin
  with quEQPComment do
  try
    ApplyUpdates;
    CommitUpdates;
  except
    showmessage('未能更新記錄');
  end;
end;

procedure TdmEMData.quPartsInOutAfterCancel(DataSet: TDataSet);
begin
  with quPrtsIOComment do
  begin
    if (State = dsEdit) or (State = dsInsert) then
      Cancel;
  end;
end;

procedure TdmEMData.quPFPhotoAfterPost(DataSet: TDataSet);
begin
  with quPFPhoto do
  try
    ApplyUpdates;
    CommitUpdates;
  except
    showmessage('未能更新記錄');
  end;
end;

procedure TdmEMData.quPFCommentAfterPost(DataSet: TDataSet);
begin
  with quPFComment do
  try
    ApplyUpdates;
    CommitUpdates;
  except
    showmessage('未能更新記錄');
  end;
end;

procedure TdmEMData.quSFCommentAfterPost(DataSet: TDataSet);
begin
  with quSFComment do
  try
    ApplyUpdates;
    CommitUpdates;
  except
    showmessage('未能更新記錄');
  end;    
end;

procedure TdmEMData.quSFCommentBeforeScroll(DataSet: TDataSet);
begin
  with quSFComment do
  begin
    if (State = dsEdit) or (State = dsInsert) then
      Post;
  end;
end;

procedure TdmEMData.quEQPPhotoBeforeScroll(DataSet: TDataSet);
begin
  with dmEMData.quEQPPhoto do
  begin
    if (State = dsEdit) or (State = dsInsert) then
      Post;
  end;
end;

procedure TdmEMData.quEQPCommentBeforeScroll(DataSet: TDataSet);
begin
  with dmEMData.quEQPComment do
  begin
    if (State = dsEdit) or (State = dsInsert) then
      Post;
  end;
end;

procedure TdmEMData.quE_PartsPhotoBeforeScroll(DataSet: TDataSet);
begin
  with dmEMData.quE_PartsPhoto do
  begin
    if (State = dsEdit) or (State = dsInsert) then
      Post;
  end;
end;

procedure TdmEMData.quE_PCommentBeforeScroll(DataSet: TDataSet);
begin
  with dmEMData.quE_PComment do
  begin
    if (State = dsEdit) or (State = dsInsert) then
      Post;
  end;
end;

procedure TdmEMData.quPFPhotoBeforeScroll(DataSet: TDataSet);
begin
  with dmEMData.quPFPhoto do
  begin
    if (State = dsEdit) or (State = dsInsert) then
      Post;
  end;
end;

procedure TdmEMData.quPFCommentBeforeScroll(DataSet: TDataSet);
begin
  with dmEMData.quPFComment do
  begin
    if (State = dsEdit) or (State = dsInsert) then
      Post;
  end;
end;

procedure TdmEMData.quPrtsIOCommentBeforeScroll(DataSet: TDataSet);
begin
  with dmEMData.quPrtsIOComment do
  begin
    if (State = dsEdit) or (State = dsInsert) then
      Post;
  end;
end;

procedure TdmEMData.quServLineBeforeScroll(DataSet: TDataSet);
begin
  with dmEMData.quServLine do
  begin
    if (State = dsEdit) or (State = dsInsert) then
      Post;
  end;
end;

procedure TdmEMData.quEmCompanyAfterPost(DataSet: TDataSet);
begin
  with quEmCompany do
  try
    ApplyUpdates;
    CommitUpdates;
  except
    showmessage('未能更新記錄');
  end;
end;

end.
