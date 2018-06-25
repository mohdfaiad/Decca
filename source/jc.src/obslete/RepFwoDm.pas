unit RepFwoDm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, Wwquery;

type
  TdmRepFwo = class(TDataModule)
    quRepSelSt: TwwQuery;
    dbRepJcFwo: TDatabase;
    quRepSelStJOB_NO_1: TStringField;
    quRepSelStJOB_NO_2: TStringField;
    quRepSelStDESCRIPTION: TStringField;
    quRepSelStJob_No: TStringField;
    dsRepSel: TDataSource;
    quRepFwoPrint: TQuery;
    quRepFwoPrintJOB_NO_1: TStringField;
    quRepFwoPrintJOB_NO_2: TStringField;
    quRepFwoPrintJOB_DESCRIPTION: TStringField;
    quRepFwoPrintFWO_NO: TStringField;
    quRepFwoPrintFWO_DESCRIPTION: TStringField;
    quRepFwoPrintORDER_DATE: TDateTimeField;
    quRepFwoPrintCOMPLETION_DATE: TDateTimeField;
    quRepFwoPrintFWO_LENGTH: TBCDField;
    quRepFwoPrintFWO_WIDTH: TBCDField;
    quRepFwoPrintFWO_HEIGHT: TBCDField;
    quRepFwoPrintFWO_UNIT: TStringField;
    quRepFwoPrintJOB_NO: TStringField;
    quRepSelFwo: TwwQuery;
    quRepSelEd: TwwQuery;
    quRepSelEdJOB_NO_1: TStringField;
    quRepSelEdJOB_NO_2: TStringField;
    quRepSelEdDESCRIPTION: TStringField;
    quRepSelEdJob_No: TStringField;
    quRepSelFwoFWO_CAT: TStringField;
    quRepSelFwoDESCRIPTION: TStringField;
    quRepFwoCat: TwwQuery;
    procedure quRepSelStCalcFields(DataSet: TDataSet);
    procedure quRepFwoPrintCalcFields(DataSet: TDataSet);
    procedure quRepSelEdCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmRepFwo: TdmRepFwo;
  wUser,
  wCompanyName,
  Password,
  Server : String;

implementation

{$R *.DFM}

procedure TdmRepFwo.quRepSelStCalcFields(DataSet: TDataSet);
begin
  if ((Trim(quRepSelStJOB_NO_1.AsString) ='')
   or (Trim(quRepSelStJOB_NO_2.AsString) = '')) then
   quRepSelStJob_No.AsString := quRepSelStJOB_NO_1.AsString
         + (quRepSelStJOB_NO_2.AsString)
  else
    quRepSelStJob_No.AsString := quRepSelStJOB_NO_1.AsString
         +'-'+ (quRepSelStJOB_NO_2.AsString);
end;

procedure TdmRepFwo.quRepFwoPrintCalcFields(DataSet: TDataSet);
begin
  if ((Trim(quRepFwoPrintJOB_NO_1.AsString) <> '') and (Trim(quRepFwoPrintJOB_NO_2.AsString) <>'')) then
    quRepFwoPrintJOB_NO.AsString := quRepFwoPrintJOB_NO_1.AsString +'-'+ quRepFwoPrintJOB_NO_2.AsString
  else
    quRepFwoPrintJOB_NO.AsString := quRepFwoPrintJOB_NO_1.AsString + quRepFwoPrintJOB_NO_2.AsString;
end;

procedure TdmRepFwo.quRepSelEdCalcFields(DataSet: TDataSet);
begin
  if ((Trim(quRepSelEdJOB_NO_1.AsString) ='')
   or (Trim(quRepSelEdJOB_NO_2.AsString) = '')) then
   quRepSelEdJob_No.AsString := quRepSelEdJOB_NO_1.AsString
         + (quRepSelEdJOB_NO_2.AsString)
  else
    quRepSelEdJob_No.AsString := quRepSelEdJOB_NO_1.AsString
         +'-'+ (quRepSelEdJOB_NO_2.AsString);
end;

end.
