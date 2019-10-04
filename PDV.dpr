program PDV;

uses
  Vcl.Forms,
  Login in 'Login.pas' {FrmLogin},
  Menu in 'Menu.pas' {frmMenu},
  Usuarios in 'Cadastros\Usuarios.pas' {frmUsuarios},
  Funcionarios in 'Cadastros\Funcionarios.pas' {frmFuncionarios},
  Cargos in 'Cadastros\Cargos.pas' {frmCargos},
  module in 'module\module.pas' {dm: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.CreateForm(TfrmUsuarios, frmUsuarios);
  Application.CreateForm(TfrmFuncionarios, frmFuncionarios);
  Application.CreateForm(TfrmCargos, frmCargos);
  Application.CreateForm(Tdm, dm);
  Application.Run;
end.
