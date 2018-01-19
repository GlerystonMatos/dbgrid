unit DBGridZebrado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient, Vcl.Grids,
  Vcl.DBGrids;

type
  TfrmDBGridZebrado = class(TForm)
    DBGrid: TDBGrid;
    ClientDataSet: TClientDataSet;
    DataSource: TDataSource;
    ClientDataSetLAST_NAME: TStringField;
    ClientDataSetFIRST_NAME: TStringField;
    ClientDataSetCITY: TStringField;
    ClientDataSetSTATE: TStringField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDBGridZebrado: TfrmDBGridZebrado;

implementation

{$R *.dfm}

procedure TfrmDBGridZebrado.DBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (not odd(ClientDataSet.RecNo)) then
    if not (gdSelected in State) then
    begin
      DBGrid.Canvas.Brush.Color := $00FFEFDF;
      DBGrid.Canvas.FillRect(Rect);
      DBGrid.DefaultDrawDataCell(Rect, Column.Field, State);
    end;
end;

procedure TfrmDBGridZebrado.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ClientDataSet.Close;
end;

procedure TfrmDBGridZebrado.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE: Close;
  end;
end;

procedure TfrmDBGridZebrado.FormShow(Sender: TObject);
begin
  ClientDataSet.FileName := ExtractFilePath(Application.ExeName)+'Data\clients.xml';
  ClientDataSet.Open;
end;

end.
