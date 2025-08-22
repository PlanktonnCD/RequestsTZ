unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  FireDAC.Comp.Client, Data.DB,
  frxClass, frxDBSet, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, frCoreClasses,
  FireDAC.Comp.DataSet;

type
  TForm2 = class(TForm)
    ButtonShowReport: TButton;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
  private
  public
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

end.

