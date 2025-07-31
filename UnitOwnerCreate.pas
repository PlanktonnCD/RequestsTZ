unit UnitOwnerCreate;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids,
  Data.DB, FireDAC.Comp.Client, Vcl.StdCtrls, UnitGlobals, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TOwnerCreateForm = class(TForm)
    DBGridServices: TDBGrid;
    DBGridUsers: TDBGrid;
    DataSourceServices: TDataSource;
    DataSourceUsers: TDataSource;
    FDQueryServices: TFDQuery;
    FDQueryUsers: TFDQuery;
    FDQueryAssign: TFDQuery;
    GiveOwnerAccessButton: TButton;
    ComboBoxRoles: TComboBox;

    procedure FormShow(Sender: TObject);
    procedure DBGridServicesCellClick(Column: TColumn);
    procedure DBGridUsersCellClick(Column: TColumn);
    procedure ButtonAssignOwnerClick(Sender: TObject);
  private
    SelectedServiceID: Integer;
    SelectedUserID: Integer;
    procedure LoadServices;
    procedure LoadRoles;
    procedure LoadUsers;
  public
  end;

var
  OwnerCreateForm: TOwnerCreateForm;

implementation

{$R *.dfm}


procedure TOwnerCreateForm.LoadRoles;
begin
  ComboBoxRoles.Items.Clear;
  with TFDQuery.Create(nil) do
  try
    Connection := FDConnectionGlobal;
    SQL.Text := 'SELECT ROLE_ID, NAME FROM ROLES ORDER BY ROLE_ID';
    Open;
    while not Eof do
    begin
      ComboBoxRoles.Items.AddObject(
        FieldByName('NAME').AsString,
        TObject(FieldByName('ROLE_ID').AsInteger)
      );
      Next;
    end;
  finally
    Free;
  end;

  if ComboBoxRoles.Items.Count > 0 then
    ComboBoxRoles.ItemIndex := 0;
end;

procedure TOwnerCreateForm.FormShow(Sender: TObject);
begin
  SelectedServiceID := -1;
  SelectedUserID := -1;
  LoadServices;
  LoadUsers;
  LoadRoles;
end;

procedure TOwnerCreateForm.LoadServices;
begin
  FDQueryServices.Close;
  FDQueryServices.Connection := FDConnectionGlobal;
  FDQueryServices.SQL.Text := 'SELECT SERVICE_ID, NAME FROM SERVICES ORDER BY NAME';
  FDQueryServices.Open;
end;

procedure TOwnerCreateForm.LoadUsers;
begin
  FDQueryUsers.Close;
  FDQueryUsers.Connection := FDConnectionGlobal;
  FDQueryUsers.SQL.Text := 'SELECT USER_ID, USERNAME FROM USERS ORDER BY USERNAME';
  FDQueryUsers.Open;
end;

procedure TOwnerCreateForm.DBGridServicesCellClick(Column: TColumn);
begin
  if not FDQueryServices.IsEmpty then
    SelectedServiceID := FDQueryServices.FieldByName('SERVICE_ID').AsInteger;
end;

procedure TOwnerCreateForm.DBGridUsersCellClick(Column: TColumn);
begin
  if not FDQueryUsers.IsEmpty then
    SelectedUserID := FDQueryUsers.FieldByName('USER_ID').AsInteger;
end;

procedure TOwnerCreateForm.ButtonAssignOwnerClick(Sender: TObject);
var
  CountQuery: TFDQuery;
  Count, RoleID: Integer;
begin
  if (SelectedServiceID = -1) or (SelectedUserID = -1) then
  begin
    ShowMessage('Виберіть користувача і систему');
    Exit;
  end;
  RoleID := Integer(ComboBoxRoles.Items.Objects[ComboBoxRoles.ItemIndex]);
  CountQuery := TFDQuery.Create(nil);
  try
    CountQuery.Connection := FDConnectionGlobal;
    CountQuery.SQL.Text :=
      'SELECT COUNT(*) AS CNT FROM USER_SERVICE_ROLES ' +
      'WHERE USER_ID = :user_id AND SERVICE_ID = :service_id AND ROLE_ID <= :role_id';
    CountQuery.ParamByName('user_id').AsInteger := SelectedUserID;
    CountQuery.ParamByName('service_id').AsInteger := SelectedServiceID;
    CountQuery.ParamByName('role_id').AsInteger := RoleID;
    CountQuery.Open;

    Count := CountQuery.FieldByName('CNT').AsInteger;
    if Count > 0 then
    begin
      ShowMessage('Цей користувач вже має цей статус або вище.');
      Exit;
    end;
  finally
    CountQuery.Free;
  end;

  try
    FDQueryAssign.Close;
    FDQueryAssign.Connection := FDConnectionGlobal;
    FDQueryAssign.SQL.Text :=
      'INSERT INTO USER_SERVICE_ROLES (USER_ID, SERVICE_ID, ROLE_ID) ' +
      'VALUES (:user_id, :service_id, :role_id)';

    FDQueryAssign.ParamByName('user_id').AsInteger := SelectedUserID;
    FDQueryAssign.ParamByName('service_id').AsInteger := SelectedServiceID;
    FDQueryAssign.ParamByName('role_id').AsInteger := RoleID;
    FDQueryAssign.ExecSQL;

    ShowMessage('Права успішно видані.');
  except
    on E: Exception do
      ShowMessage('Помилка при видачі прав: ' + E.Message);
  end;
end;


end.

