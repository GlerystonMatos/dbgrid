program DBGrid;

{ DBGrid
  DBGrid XE6

  Informações do Projeto
  Versão do Delphi usada: XE6.

  Gleryston Matos
  glerystonmatos@yahoo.com.br
  glerystonmatos@gmail.com }

uses
  Vcl.Forms,
  Principal in 'Principal.pas' {frmPrincipal},
  DBGridZebrado in 'DBGridZebrado.pas' {frmDBGridZebrado},
  DBGridOrdenacaoColunas in 'DBGridOrdenacaoColunas.pas' {frmDBGridOrdenacaoColunas},
  DBGridPickList in 'DBGridPickList.pas' {frmDBGridPickList},
  DBGridLookup in 'DBGridLookup.pas' {frmDBGridLookup};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'DBGrid';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
