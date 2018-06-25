unit TestUser;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, Buttons, Menus, Grids, DBGrids, ExtCtrls, DBCtrls;

type
  TfmTestUser = class(TForm)
    dbCommon: TDatabase;
    quSelFuncApp: TQuery;
    dsSelFuncApp: TDataSource;
    Button1: TButton;
    BitBtn1: TBitBtn;
    SpeedButton1: TSpeedButton;
    procedure TestProgram(Funcs : array of String);
    procedure TestFunc(FuncName:String;S:String);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmTestUser: TfmTestUser;
  Funcs : array [1..99] of String;

implementation

{$R *.DFM}
procedure TfmTestUser.TestProgram(Funcs : array of String);
var
  j :Integer;
  w : String;
begin
  with quSelFuncApp do
  begin
    if Active then
      Close;
    ParamByName('Company_ID').AsString := 'DECCA';
    ParamByName('Program_ID').AsString  := 'Form1';
    ParamByName('User_ID').AsString := 'QSM';
    Open;
    First;
    w := FieldByName('Func_Approved').AsString;
  end;
  for j := 1 to Length(w) do
  begin
    Showmessage(Funcs[j]+''+w[j]);
    TestFunc(Funcs[j],w[j]);
  end;
end;

procedure TfmTestUser.TestFunc(FuncName:String;S:String);
var
  i: integer;
  wString : String;
begin
  with Screen do
  begin
    with Forms[FormCount-1] do
    begin
      for i := 0 to ComponentCount-1 do
      begin
        //Showmessage(Components[i].Name);
        if Pos('.',FuncName) = 0 then
        begin
          if Components[i].Name = FuncName then
          begin
            // TBoutton
            if Components[i].ClassName = 'TButton' then
            begin
              if S = 'Y' then
                TButton(Components[i]).Enabled := True
              else
                TButton(Components[i]).Enabled := False;
            end;
            // TSpeedBoutton
            if Components[i].ClassName = 'TSpeedButton' then
            begin
              if S = 'Y' then
                TSpeedButton(Components[i]).Enabled := True
              else
                TSpeedButton(Components[i]).Enabled := False;
            end;
            // TBitBtn
            if Components[i].ClassName = 'TBitBtn' then
            begin
              if S = 'Y' then
                TBitBtn(Components[i]).Enabled := True
              else
                TBitBtn(Components[i]).Enabled := False;
            end;
            // TMenuItem
            if Components[i].ClassName = 'TMenuItem' then
            begin
              if S = 'Y' then
                TMenuItem(Components[i]).Enabled := True
              else
                TMenuItem(Components[i]).Enabled := False;
            end;
            // TDBGrid
            if Components[i].ClassName = 'TDBGrid' then
            begin
              if S = 'Y' then
                TDBGrid(Components[i]).ReadOnly := False
              else
                TDBGrid(Components[i]).ReadOnly := True;
            end;
          end;
        end
        else
        begin
          wString := FuncName;
          Delete(wString,1,Pos('.',FuncName));
          if Components[i].Name = Copy(FuncName,1,Pos('.',FuncName)-1) then
          begin
            // TDBNavigator
            if Components[i].ClassName = 'TDBNavigator' then
            begin
              if S = 'Y' then
              begin
                if wString = 'nbDelete' then
                  TDBNavigator(Components[i]).VisibleButtons :=
                  TDBNavigator(Components[i]).VisibleButtons + [nbDelete];
                if wString = 'nbInsert' then
                  TDBNavigator(Components[i]).VisibleButtons :=
                  TDBNavigator(Components[i]).VisibleButtons + [nbInsert];
                if wString = 'nbEdit' then
                  TDBNavigator(Components[i]).VisibleButtons :=
                  TDBNavigator(Components[i]).VisibleButtons + [nbEdit];
                TDBNavigator(Components[i]).Width :=
                  TDBNavigator(Components[i]).Width + TDBNavigator(Components[i]).Height;
              end
              else
              begin
                if wString = 'nbDelete' then
                  TDBNavigator(Components[i]).VisibleButtons :=
                  TDBNavigator(Components[i]).VisibleButtons - [nbDelete];
                if wString = 'nbInsert' then
                  TDBNavigator(Components[i]).VisibleButtons :=
                  TDBNavigator(Components[i]).VisibleButtons - [nbInsert];
                if wString = 'nbEdit' then
                  TDBNavigator(Components[i]).VisibleButtons :=
                  TDBNavigator(Components[i]).VisibleButtons - [nbEdit];
                TDBNavigator(Components[i]).Width :=
                  TDBNavigator(Components[i]).Width - TDBNavigator(Components[i]).Height;
              end;
            end;
          end;
        end;
      end;
    end;
  end;
end;

procedure TfmTestUser.FormCreate(Sender: TObject);
begin
  Funcs[1] := 'dsfdsf';
  Funcs[2] := 'BitBtn1';
  Funcs[3] := 'SpeedButton1';
  try
    with dbCommon do
    begin
      if not Connected then
        Connected := True;
    end;
  except
    ShowMessage('ÊIµ¸¥¼³s±µ!');
    Application.Terminate;
  end;
end;

procedure TfmTestUser.Button1Click(Sender: TObject);
begin
  TestProgram(Funcs);
end;

end.
