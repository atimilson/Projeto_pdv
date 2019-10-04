unit Funcionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.StdCtrls, Data.DB,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFuncionarios: TfrmFuncionarios;

implementation

{$R *.dfm}

end.
