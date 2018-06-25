unit lbselect
;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Spin, Db, DBTables, DBCtrls, Menus;

type
  Tfmselect = class(TForm)
    laNo: TLabel;
    laPrintNo: TLabel;
    btnSiAdd: TButton;
    btnAlAdd: TButton;
    btnSiDel: TButton;
    btnAlDel: TButton;
    btnPrint: TButton;
    btnPrintExit: TButton;
    quFwoSelect: TQuery;
    dsFwoSelect: TDataSource;
    lbNo: TListBox;
    lbPrintNo: TListBox;
    taLbSelect: TTable;
    paLabel: TPanel;
    sbPrintSetup: TSpeedButton;
    sbExit: TSpeedButton;
    ps_PrintSetup: TPrinterSetupDialog;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    mmPrintSetup: TMenuItem;
    N3: TMenuItem;
    N6: TMenuItem;
    mmImport: TMenuItem;
    dbLabel: TDatabase;
    mmEditJob: TMenuItem;
    N2: TMenuItem;
    Label2: TLabel;
    sePrintCount: TSpinEdit;
    dsJobSelect: TDataSource;
    quJobSelect: TQuery;
    Panel1: TPanel;
    Label1: TLabel;
    edNo: TEdit;
    rbJobNo: TRadioButton;
    rbFwoNo: TRadioButton;
    sbBrowse: TSpeedButton;
    procedure btnJobNoAbortClick(Sender: TObject);
    procedure btnSiAddClick(Sender: TObject);
    procedure btnPrintExitClick(Sender: TObject);
    procedure btnAlAddClick(Sender: TObject);
    procedure btnSiDelClick(Sender: TObject);
    procedure btnAlDelClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure edPriJobNoEnter(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
    procedure sbPrintSetupClick(Sender: TObject);
    procedure mmPrintSetupClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure sbBrowseClick(Sender: TObject);
    procedure mmImportClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mmEditJobClick(Sender: TObject);
    procedure edNoExit(Sender: TObject);
    procedure rbJobNoClick(Sender: TObject);
    procedure rbFwoNoClick(Sender: TObject);
    procedure edNoDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmselect: Tfmselect;
implementation

uses lbPrint, lbmain, lbimport;

{$R *.DFM}


procedure Tfmselect.btnJobNoAbortClick(Sender: TObject);
begin
  close;
end;

procedure Tfmselect.btnSiAddClick(Sender: TObject);
begin
  if lbNo.ItemIndex=-1 then
    lbNo.ItemIndex:=0;
  with lbPrintNo do
    Items.Add(lbNo.Items.Strings[lbNo.ItemIndex]);
  lbNo.Items.Delete(lbNo.ItemIndex);
  if lbPrintNo.Items.Count >0 then
  begin
    btnSiDel.Enabled:=True;
    btnAlDel.Enabled:=True;
    btnPrint.Enabled:=True;
  end;
  if lbNo.Items.Count<1 then
  begin
    btnSiAdd.Enabled:=False;
    btnAlAdd.Enabled:=False;
  end;
end;

procedure Tfmselect.btnPrintExitClick(Sender: TObject);
begin
  close;
end;

procedure Tfmselect.btnAlAddClick(Sender: TObject);
begin
  with lbNo do
  begin
    while Items.Count >0 do
    begin
      lbPrintNo.Items.Add(Items.Strings[0]);
      Items.Delete(0);
    end;
  end;
  btnSiAdd.Enabled := False;
  btnAlAdd.Enabled:=False;
  btnSiDel.Enabled :=True;
  btnAlDel.Enabled:=True;
  btnPrint.Enabled:=True;
end;

procedure Tfmselect.btnSiDelClick(Sender: TObject);
begin
  if lbPrintNo.ItemIndex=-1 then
    lbPrintNo.ItemIndex:=0;
  with lbNo do
    Items.Add(lbPrintNo.Items.Strings[lbPrintNo.ItemIndex]);
  lbPrintNo.Items.Delete(lbPrintNo.ItemIndex);
  if lbNo.Items.Count >0 then
  begin
    btnSiAdd.Enabled:=True;
    btnAlAdd.Enabled:=True;
  end;
  if lbPrintNo.Items.Count<1 then
  begin
    btnSiDel.Enabled:=False;
    btnAlDel.Enabled:=False;
    btnPrint.Enabled:=False;
  end;
end;

procedure Tfmselect.btnAlDelClick(Sender: TObject);
begin
  with lbPrintNo do
  begin
    while Items.Count >0 do
    begin
      lbNo.Items.Add(Items.Strings[0]);
      Items.Delete(0);
    end;
  end;
  btnSiAdd.Enabled := True;
  btnAlAdd.Enabled:= True;
  btnSiDel.Enabled := False;
  btnAlDel.Enabled:= False;
  btnPrint.Enabled:= False;
end;

procedure Tfmselect.btnPrintClick(Sender: TObject);
var
  listItems : integer;
  Fwo_No : string;
  PrintCount : integer;
begin
  if (rbJobNo.Checked = True) then
  begin
    lbPrintNo.ItemIndex:= 0;
    if lbPrintNo.Items.Count >0 then
    begin
      with lbPrintNo do
      begin
        for listItems:=1 to Items.Count do
        begin
          with quFwoSelect do
          begin
            if locate('Fwo_No',Items.Strings[ItemIndex],[loCaseInsensitive]) then
            begin
              if (length(Fieldbyname('Fwo_No').asstring) < 2) then
                Fwo_No := '00' + Fieldbyname('Fwo_No').asstring
              else
              if (length(Fieldbyname('Fwo_No').asstring) < 3) then
                Fwo_No := '0' + Fieldbyname('Fwo_No').asstring
              else
                Fwo_No := Fieldbyname('Fwo_No').asstring;
              fmPrint.JobNoLb.Caption := '*' + Fieldbyname('JOB_NO').value
                                     + Fwo_No + '*';
              fmPrint.JobNo.Caption := Fieldbyname('JOB_NO').value
                                     + Fwo_No;
              fmPrint.JobDesc.Caption := Fieldbyname('JOB_DESC').value;
              if ( length(trim(Fieldbyname('Fwo').asstring)) < 1) then
                fmPrint.FwoNo.Caption := copy(Fieldbyname('JOB_NO').value,1,4)
                                       + Fwo_No
              else
                fmPrint.FwoNo.Caption := Fieldbyname('Fwo').value
                                       + Fwo_No;
              fmPrint.FwoDesc.Caption := Fieldbyname('FWO_DESC').value;
              for PrintCount:=1 to sePrintCount.value do
                fmprint.reBrandCode.Print;
            end;
          end;
          ItemIndex := ItemIndex + 1;
        end;
        exit;
      end;
    end
    else
      abort;
  end
  else
  if (rbFwoNo.Checked = True) then
  begin
    lbPrintNo.ItemIndex:= 0;
    if lbPrintNo.Items.Count >0 then
    begin
      with lbPrintNo do
      begin
        for listItems:=1 to Items.Count do
        begin
          with quJobSelect do
          begin
            if locate('Job_No',Items.Strings[ItemIndex],[loCaseInsensitive]) then
            begin
              if (length(Fieldbyname('Fwo_No').asstring) < 2) then
                Fwo_No := '00' + Fieldbyname('Fwo_No').asstring
              else
              if (length(Fieldbyname('Fwo_No').asstring) < 3) then
                Fwo_No := '0' + Fieldbyname('Fwo_No').asstring
              else
                Fwo_No := Fieldbyname('Fwo_No').asstring;
              fmPrint.JobNoLb.Caption := '*' + Fieldbyname('JOB_NO').value
                                     + Fwo_No + '*';
              fmPrint.JobNo.Caption := Fieldbyname('JOB_NO').value
                                     + Fwo_No;
              fmPrint.JobDesc.Caption := Fieldbyname('JOB_DESC').value;
              if ( length(trim(Fieldbyname('Fwo').asstring)) < 1) then
                fmPrint.FwoNo.Caption := copy(Fieldbyname('JOB_NO').value,1,4)
                                       + Fwo_No
              else
                fmPrint.FwoNo.Caption := Fieldbyname('Fwo').value
                                       + Fwo_No;
              fmPrint.FwoDesc.Caption := Fieldbyname('FWO_DESC').value;
              for PrintCount:=1 to sePrintCount.value do
                fmprint.reBrandCode.Print;
            end;
          end;
          ItemIndex := ItemIndex + 1;
        end;
        exit;
      end;
    end
    else
      abort;
   end;
end;


procedure Tfmselect.edPriJobNoEnter(Sender: TObject);
begin
  lbNo.Clear;
  lbPrintNo.Clear;
end;

procedure Tfmselect.sbExitClick(Sender: TObject);
begin
  close;
end;

procedure Tfmselect.sbPrintSetupClick(Sender: TObject);
begin
  ps_PrintSetup.Execute;
end;

procedure Tfmselect.mmPrintSetupClick(Sender: TObject);
begin
  ps_PrintSetup.execute;
end;

procedure Tfmselect.N3Click(Sender: TObject);
begin
  close;
end;

procedure Tfmselect.sbBrowseClick(Sender: TObject);
begin
  Application.CreateForm(TfmLbmain,fmLbMain);
  try
    fmLbmain.ShowModal ;
  finally
    fmLbmain.Release ;
  end;
end;

procedure Tfmselect.mmImportClick(Sender: TObject);
begin
  Application.CreateForm(TfmImport,fmImport);
  try
    fmImport.ShowModal ;
  finally
    fmImport.Release ;
  end;
end;

procedure Tfmselect.FormCreate(Sender: TObject);
begin
  if not dbLabel.Connected then
       dbLabel.Connected := True;
  btnSiAdd.Enabled := False;
  btnAlAdd.Enabled:= False;
  btnSiDel.Enabled := False;
  btnAlDel.Enabled:= False;
  btnPrint.Enabled:= False;
end;

procedure Tfmselect.mmEditJobClick(Sender: TObject);
begin
  Application.CreateForm(TfmLbmain,fmLbMain);
  try
    fmLbmain.ShowModal ;
  finally
    fmLbmain.Release ;
  end;
end;


procedure Tfmselect.edNoExit(Sender: TObject);
begin
  if rbJobNo.Checked then
  begin
    laNo.Caption := '厂單編號';
    laPrintNo.Caption := '打印厂單編號';
    edNo.Text := UpperCase(edNo.Text);
    if length(trim(edNo.Text)) >=8 then
    begin
      showmessage('工程編號不能超過7位');
      Abort;
    end;
    if length(trim(edNo.Text)) > 0 then
    begin
      if taLbSelect.locate('Job_No', edNo.Text, [loCaseInsensitive]) then
      begin
        lbNo.Items.Clear;
        lbPrintNo.Items.Clear;
        with quFwoSelect do
        begin
          if active then
           close;
          ParamByName('iJob_No').value := UpperCase(trim(edNo.Text));
          active := true;
          First;
          while not eof do
          begin
            lbNo.Items.Add(FieldByName('Fwo_No').AsString);
            Next;
          end;
        end;
      end
      else
      begin
        showmessage('無此工程號');
        abort;
     // edNo.SetFocus;
      end;
    end;
  end
  else
  if rbFwoNo.Checked then
  begin
    laNo.Caption := '工程編號';
    laPrintNo.Caption := '打印工程編號';
    edNo.Text := UpperCase(edNo.Text);
    if length(trim(edNo.Text)) >=4 then
    begin
      showmessage('厂單編號不能超過3位');
      Abort;
    end;
    if length(trim(edNo.Text)) > 0 then
    begin
      if taLbSelect.locate('Fwo_No', edNo.Text, [loCaseInsensitive]) then
      begin
        lbNo.Items.Clear;
        lbPrintNo.Items.Clear;
        with quJobSelect do
        begin
          if active then
            close;
          ParamByName('iFwo_No').value := UpperCase(trim(edNo.Text));
          active := true;
          First;
          while not eof do
          begin
            lbNo.Items.Add(FieldByName('Job_No').AsString);
            Next;
          end;
        end;
      end
      else
      begin
        showmessage('無此厂單號');
        abort;
      //  edNo.SetFocus;
      end;
    end;
  end;
  if (lbNo.Items.Count >=1) then
  begin
    btnSiAdd.Enabled := True;
    btnAlAdd.Enabled := True;
    btnSiDel.Enabled := False;
    btnAlDel.Enabled := False;
    btnPrint.Enabled := False;
  end;
end;

procedure Tfmselect.rbJobNoClick(Sender: TObject);
begin
  laNo.Caption := '厂單編號';
  laPrintNo.Caption := '打印厂單編號';
  lbNo.Clear;
  lbPrintNo.Clear;
  edNo.Clear;
  btnSiAdd.Enabled := False;
  btnAlAdd.Enabled:= False;
  btnSiDel.Enabled := False;
  btnAlDel.Enabled:= False;
  btnPrint.Enabled:= False;
end;

procedure Tfmselect.rbFwoNoClick(Sender: TObject);
begin
  laNo.Caption := '工程編號';
  laPrintNo.Caption := '打印工程編號';
  lbNo.Clear;
  lbPrintNo.Clear;
  edNo.Clear;
  btnSiAdd.Enabled := False;
  btnAlAdd.Enabled:= False;
  btnSiDel.Enabled := False;
  btnAlDel.Enabled:= False;
  btnPrint.Enabled:= False;
end;

procedure Tfmselect.edNoDblClick(Sender: TObject);
begin
  lbNo.Clear;
  lbPrintNo.Clear;
  edNo.Clear;
  btnSiAdd.Enabled := False;
  btnAlAdd.Enabled:= False;
  btnSiDel.Enabled := False;
  btnAlDel.Enabled:= False;
  btnPrint.Enabled:= False;
end;

end.

