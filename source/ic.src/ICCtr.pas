unit ICCtr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, wwdbdatetimepicker;

type
  TfmICCtr = class(TForm)
    Bevel1: TBevel;
    bbOK: TBitBtn;
    bbCancel: TBitBtn;
    dedMealPayCode: TDBEdit;
    gbUserDef: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    dbeAppraTitle01: TDBEdit;
    dbeAppraTitle02: TDBEdit;
    dbeAppraTitle03: TDBEdit;
    dbeAppraTitle04: TDBEdit;
    dbeAppraTitle05: TDBEdit;
    dbeAppraTitle06: TDBEdit;
    dbeAppraTitle07: TDBEdit;
    dbeAppraTitle08: TDBEdit;
    dbeAppraTitle09: TDBEdit;
    dbeAppraTitle10: TDBEdit;
    dbeAppraCount: TDBEdit;
    dedLstDocNo: TDBEdit;
    gbAcc: TGroupBox;
    dedInventoryAc: TDBEdit;
    dedLiablityAc: TDBEdit;
    dedSalesAc: TDBEdit;
    dedCrMemoAc: TDBEdit;
    dedExpense: TDBEdit;
    dedDiscountAc: TDBEdit;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    drgCostMethod: TDBRadioGroup;
    dcbUseProfit: TDBCheckBox;
    drgProfitBy: TDBRadioGroup;
    drgProfitPos: TDBRadioGroup;
    Bevel2: TBevel;
    gbSelect: TGroupBox;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    gbTime: TGroupBox;
    Label6: TLabel;
    Label1: TLabel;
    wwDBDateTimePicker1: TwwDBDateTimePicker;
    wwDBDateTimePicker2: TwwDBDateTimePicker;
    Label5: TLabel;
    wwDBDateTimePicker3: TwwDBDateTimePicker;
    DBCheckBox2: TDBCheckBox;
    DBEdit1: TDBEdit;
    DBEdit7: TDBEdit;
    Label2: TLabel;
    Label38: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    DBEdit4: TDBEdit;
    Label27: TLabel;
    DBEdit5: TDBEdit;
    Label28: TLabel;
    DBEdit6: TDBEdit;
    Label29: TLabel;
    DBEdit8: TDBEdit;
    Label30: TLabel;
    DBEdit9: TDBEdit;
    Label31: TLabel;
    DBEdit10: TDBEdit;
    Label32: TLabel;
    DBEdit11: TDBEdit;
    Label33: TLabel;
    DBEdit12: TDBEdit;
    Label26: TLabel;
    Label19: TLabel;
    DBCheckBox1: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure bbOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmICCtr: TfmICCtr;

implementation
uses ICData;
{$R *.DFM}

procedure TfmICCtr.FormCreate(Sender: TObject);
begin
  with dmICData.quICControl do
  begin
    if not Active then
      Open;
  end;
end;

procedure TfmICCtr.bbOKClick(Sender: TObject);
begin
  with dmICData do
  begin
    with quICControl do
    begin
      if modified then
      begin
        try
          FieldByName('Control_Key').value := 1;
          Post;
        except
          ShowMessage('未能夠更新記錄');
        end;
      end;
    end;
  end;
end;

procedure TfmICCtr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with dmICData.quICControl do
  begin
    if  Active then
      Close;
  end;
end;

end.
