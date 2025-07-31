unit UnitDebug;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, UnitGlobals;

type
  TDebugForm = class(TForm)
    DBGridServices: TDBGrid;
    FDQueryServices: TFDQuery;
    FDQueryInsert: TFDQuery;
    DataSourceServices: TDataSource;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DebugForm: TDebugForm;

implementation

{$R *.dfm}

procedure TDebugForm.FormShow(Sender: TObject);
begin
  FDQueryServices.Connection := FDConnectionGlobal;
FDQueryServices.SQL.Text :=
  'SELECT ' +
  '  rh.REQUESTHISTORY_ID AS "Історія №", ' +
  '  s.NAME AS "Сервіс", ' +
  '  u_requester.USERNAME AS "Запитувач", ' +
  '  u_changer.USERNAME AS "Хто змінив", ' +
  '  st.NAME AS "Статус", ' +
  '  TO_CHAR(rh.DATE_CHANGE, ''DD.MM.YYYY HH24:MI:SS'') AS "Час зміни" ' +
  'FROM ' +
  '  REQUEST_HISTORY rh ' +
  '  JOIN ACCESS_REQUESTS ar ON rh.REQUEST_ID = ar.ACCESSREQUEST_ID ' +
  '  JOIN USERS u_requester ON ar.REQUESTER_ID = u_requester.USER_ID ' +
  '  JOIN USERS u_changer ON rh.USERCHANGER_ID = u_changer.USER_ID ' +
  '  JOIN SERVICES s ON ar.SERVICE_ID = s.SERVICE_ID ' +
  '  JOIN REQUEST_STATUSES st ON rh.STATUS_ID = st.REQUESTSTATUS_ID ' +
  'ORDER BY ' +
  '  rh.DATE_CHANGE DESC';


  FDQueryServices.Open;
  DataSourceServices.DataSet := FDQueryServices;
  DBGridServices.Columns[0].Width := 0;
  DBGridServices.Columns[1].Width := 80;
  DBGridServices.Columns[2].Width := 80;
  DBGridServices.Columns[3].Width := 80;
  DBGridServices.Columns[4].Width := 80;
  DBGridServices.Columns[5].Width := 80;
end;

end.
