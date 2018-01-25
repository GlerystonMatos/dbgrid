unit DBGridLookup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient, Vcl.Grids,
  Vcl.DBGrids;

type
  TfrmDBGridLookup = class(TForm)
    DBGrid: TDBGrid;
    ClientDataSet: TClientDataSet;
    DataSource: TDataSource;
    ClientDataSetVendors: TClientDataSet;
    ClientDataSetLAST_NAME: TStringField;
    ClientDataSetFIRST_NAME: TStringField;
    ClientDataSetCITY: TStringField;
    ClientDataSetSTATE: TStringField;
    ClientDataSetCOMPANY_ID: TIntegerField;
    ClientDataSetCOMPANY_NAME: TStringField;
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
  frmDBGridLookup: TfrmDBGridLookup;

implementation

{$R *.dfm}

procedure TfrmDBGridLookup.DBGridDrawColumnCell(Sender: TObject;
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

procedure TfrmDBGridLookup.DBGridTitleClick(Column: TColumn);
begin
  ClientDataSet.IndexFieldNames := Column.FieldName;
end;

procedure TfrmDBGridLookup.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ClientDataSet.Close;
end;

procedure TfrmDBGridLookup.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE: Close;
  end;
end;

procedure TfrmDBGridLookup.FormShow(Sender: TObject);
begin
  ClientDataSet.FileName := ExtractFilePath(Application.ExeName)+'Data\clients.xml';
  ClientDataSet.Open;
  ClientDataSetVendors.FileName := ExtractFilePath(Application.ExeName)+'Data\vendors.xml';
  ClientDataSetVendors.Open;
end;

end.
