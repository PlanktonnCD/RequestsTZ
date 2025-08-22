unit UnitLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Comp.Client,
  Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, UnitGlobals, FireDAC.Phys.Oracle, FireDAC.Phys.OracleDef;

type
  TFormLogin = class(TForm)
    Label1: TLabel;
    EditUsername: TEdit;
    LoginButton: TButton;
    LabelError: TLabel;
    FDQuery1: TFDQuery;
    FDConnection1: TFDConnection;
    procedure FormCreate(Sender: TObject);
    procedure LoginButtonClick(Sender: TObject);
  private
    procedure TryLogin;
  public
    { Public declarations }
  end;

var
  FormLogin: TFormLogin;

implementation

{$R *.dfm}

uses Unit1, UnitMain;

procedure TFormLogin.FormCreate(Sender: TObject);
begin
  LabelError.Caption := '';
  with FDConnection1.Params do begin
    Clear;
    Add('DriverID=Ora');
    Add('Database=FREEPDB1');
    Add('User_Name=appuser');
    Add('Password=apppass');
  end;
  FDConnection1.LoginPrompt := False;

  try
    FDConnection1.Connected := True;
    FDConnectionGlobal := FDConnection1;
    FDQuery1.Connection := FDConnectionGlobal;
  except
    on E: Exception do
    begin
      ShowMessage('Не вдалося підключитися до бази: ' + E.Message);
      Close;
    end;
  end;
end;

procedure TFormLogin.LoginButtonClick(Sender: TObject);
begin
  TryLogin;
end;

procedure TFormLogin.TryLogin;
var
  ContextValue: string;
begin
  FDQuery1.Close;
  FDQuery1.SQL.Text := 'SELECT USER_ID, USERNAME, ROLE_ID FROM USERS WHERE USERNAME = :uname';
  FDQuery1.ParamByName('uname').AsString := Trim(EditUsername.Text);
  FDQuery1.Open;

  if FDQuery1.IsEmpty then
  begin
    LabelError.Caption := 'Користувача не знайдено';
    Exit;
  end;

  CurrentUserID := FDQuery1.FieldByName('USER_ID').AsInteger;
  CurrentUsername := FDQuery1.FieldByName('USERNAME').AsString;
  CurrentUserRoleID := FDQuery1.FieldByName('ROLE_ID').AsInteger;

 FDConnectionGlobal.ExecSQL('BEGIN appuser.set_request_ctx.set_user(:user_id); END;', [CurrentUserID]);

  MainForm.ShowForm(TFormAccessRequests);

end;

end.
