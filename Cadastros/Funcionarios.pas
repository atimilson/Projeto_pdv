unit Funcionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.StdCtrls, Data.DB,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, module;

type
  TfrmFuncionarios = class(TForm)
    txtBuscarNome: TEdit;
    rbNome: TRadioButton;
    rbCpf: TRadioButton;
    MaskEdit1: TMaskEdit;
    edtNome: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtCpf: TEdit;
    EdtTelefone: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    edtEndereco: TEdit;
    Label5: TLabel;
    cbxCargo: TComboBox;
    DBGrid1: TDBGrid;
    btnNovo: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnEditar: TSpeedButton;
    btnExcluir: TSpeedButton;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure carregarCombobox;
    procedure associarCampos;
    procedure listar;
    procedure buscar;
    procedure limpar;
    procedure habilitarCampos;
    procedure desabilitarCampos;
  public
    { Public declarations }
  end;

var
  frmFuncionarios: TfrmFuncionarios;

implementation

{$R *.dfm}

{ TfrmFuncionarios }

procedure TfrmFuncionarios.associarCampos;
begin

end;

procedure TfrmFuncionarios.buscar;
begin

end;

procedure TfrmFuncionarios.carregarCombobox;
begin

end;

procedure TfrmFuncionarios.desabilitarCampos;
begin
   edtNome.Enabled := False;
   edtCpf.Enabled := False;
   edtEndereco.Enabled := False;
   EdtTelefone.Enabled := False;
   cbxCargo.Enabled := False;
end;

procedure TfrmFuncionarios.FormShow(Sender: TObject);
begin
   desabilitarCampos;

end;

procedure TfrmFuncionarios.habilitarCampos;
begin
   edtNome.Enabled := True;
   edtCpf.Enabled := True;
   edtEndereco.Enabled := True;
   EdtTelefone.Enabled := True;
   cbxCargo.Enabled := True;
end;

procedure TfrmFuncionarios.limpar;
begin
     edtNome.Text := '';
     edtCpf.Text := '';
     edtEndereco.Text := '';
     EdtTelefone.Text := '';
end;

procedure TfrmFuncionarios.listar;
begin

end;

end.
