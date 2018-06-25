unit SJobEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, datamodu,
  StdCtrls, DBCtrls, ExtCtrls, Mask, Buttons, ExtDlgs;

type
  TfmSJEdit = class(TForm)
    Panel1: TPanel;
    sbClose: TSpeedButton;
    sbPrintSetup: TSpeedButton;
    DBNavigator1: TDBNavigator;
    ps_PrintSetup: TPrinterSetupDialog;
    Label1: TLabel;
    Label2: TLabel;
    deJobNo: TDBEdit;
    deJobDesc: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    GroupBox1: TGroupBox;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    DBMemo1: TDBMemo;
    OpenPictureDialog1: TOpenPictureDialog;
    GroupBox2: TGroupBox;
    DBImage1: TDBImage;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSJEdit: TfmSJEdit;

implementation

{$R *.DFM}

end.
