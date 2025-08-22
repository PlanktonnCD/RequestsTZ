unit UnitServices;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, UnitGlobals;

type
  TRequestForm = class(TForm)
    DBGridServices: TDBGrid;
    ButtonSubmit: TButton;
    MemoStatus: TMemo;
    FDQueryServices: TFDQuery;
    FDQueryInsert: TFDQuery;
    DataSourceServices: TDataSource;
    ComboBoxRoles: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure ButtonSubmitClick(Sender: TObject);
    procedure LoadRoles();
  private
    procedure LoadServices;
  public
  end;

var
  RequestForm: TRequestForm;

implementation

{$R *.dfm}

procedure TRequestForm.FormShow(Sender: TObject);
begin
  LoadServices;
  LoadRoles;
end;

procedure TRequestForm.LoadServices;
begin
  FDQueryServices.Connection := FDConnectionGlobal;
  FDQueryServices.SQL.Text := 'SELECT SERVICE_ID, NAME, DESCRIPTION FROM SERVICES ORDER BY NAME';
  FDQueryServices.Open;
  DataSourceServices.DataSet := FDQueryServices;
  DBGridServices.Columns[0].Width := 0;
  DBGridServices.Columns[1].Width := 150;
  DBGridServices.Columns[2].Width := 150;
end;

procedure TRequestForm.LoadRoles;
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


procedure TRequestForm.ButtonSubmitClick(Sender: TObject);
var
  ServiceID, RoleID: Integer;
begin

  FDQueryInsert.Connection := FDConnectionGlobal;
  if FDQueryServices.IsEmpty then
  begin
    MemoStatus.Lines.Text := 'Список сервісів порожній.';
    Exit;
  end;

  ServiceID := FDQueryServices.FieldByName('SERVICE_ID').AsInteger;

  FDQueryInsert.SQL.Clear;
  with TFDQuery.Create(nil) do
  begin
  Connection := FDConnectionGlobal;
  SQL.Text := 'SELECT ROLE_ID FROM USER_SERVICE_ROLES WHERE USER_ID = :u_id AND SERVICE_ID = :s_id';
  ParamByName('u_id').AsInteger := CurrentUserID;
  ParamByName('s_id').AsInteger := ServiceID;
  Open;

  RoleID := Integer(ComboBoxRoles.Items.Objects[ComboBoxRoles.ItemIndex]);

  Free;
  end;

FDQueryInsert.SQL.Text :=
  'INSERT INTO ACCESS_REQUESTS (REQUESTER_ID, SERVICE_ID, ROLE_ID, STATUS_ID, CREATED_AT) ' +
  'VALUES (:p_requester, :p_service, :p_role, 1, SYSDATE)';
FDQueryInsert.ParamByName('p_requester').AsInteger := CurrentUserID;
FDQueryInsert.ParamByName('p_service').AsInteger := ServiceID;
FDQueryInsert.ParamByName('p_role').AsInteger := RoleID;


  try
    FDQueryInsert.ExecSQL;
    MemoStatus.Lines.Text := 'Запит подано успішно.';
  except
    on E: Exception do
      MemoStatus.Lines.Text := 'Помилка при поданні запиту: ' + E.Message;
  end;
end;

end.
