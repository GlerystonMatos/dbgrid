unit DBGridPickList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient, Vcl.Grids,
  Vcl.DBGrids;

type
  TfrmDBGridPickList = class(TForm)
    DBGrid: TDBGrid;
    ClientDataSet: TClientDataSet;
    ClientDataSetLAST_NAME: TStringField;
    ClientDataSetFIRST_NAME: TStringField;
    ClientDataSetCITY: TStringField;
    ClientDataSetSTATE: TStringField;
    DataSource: TDataSource;
    procedure DBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure DBGridTitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDBGridPickList: TfrmDBGridPickList;

implementation

{$R *.dfm}

procedure TfrmDBGridPickList.DBGridDrawColumnCell(Sender: TObject;
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

procedure TfrmDBGridPickList.DBGridTitleClick(Column: TColumn);
begin
  ClientDataSet.IndexFieldNames := Column.FieldName;
end;

procedure TfrmDBGridPickList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ClientDataSet.Close;
end;

procedure TfrmDBGridPickList.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE: Close;
  end;
end;

procedure TfrmDBGridPickList.FormShow(Sender: TObject);
begin
  ClientDataSet.FileName := ExtractFilePath(Application.ExeName)+'Data\clients.xml';
  ClientDataSet.Open;
end;

end.
