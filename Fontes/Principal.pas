unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, DBGridZebrado;

type
  TfrmPrincipal = class(TForm)
    btnGridEfeitoZebrado: TBitBtn;
    procedure btnGridEfeitoZebradoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnGridEfeitoZebradoClick(Sender: TObject);
var
  frmDBGridZebrado: TfrmDBGridZebrado;
begin
  frmDBGridZebrado := TfrmDBGridZebrado.Create(Self);
  try
    frmDBGridZebrado.ShowModal;
  finally
    FreeAndNil(frmDBGridZebrado);
  end;
end;

end.
