unit module;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Comp.UI;

type
  Tdm = class(TDataModule)
    fd: TFDConnection;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    tb_Cargos: TFDTable;
    query_Cargos: TFDQuery;
    DataSource1: TDataSource;
    tb_Cargosid: TFDAutoIncField;
    tb_Cargoscargo: TStringField;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;

    tb_func: TFDTable;
    query_func: TFDQuery;
    ds_func: TDataSource;
    tb_funcid: TIntegerField;
    tb_funcnome: TStringField;
    tb_funccpf: TStringField;
    tb_functelefone: TStringField;
    tb_funcendereco: TStringField;
    tb_funccargo: TStringField;
    tb_funcdata_cadastro: TSQLTimeStampField;
    query_usuario: TFDQuery;
    DS_Usuario: TDataSource;
    tb_usuarios: TFDTable;
    query_usuarioid: TFDAutoIncField;
    query_usuarionome: TStringField;
    query_usuariousuario: TStringField;
    query_usuariosenha: TStringField;
    query_usuariocargo: TStringField;
    query_usuarioid_funcionario: TIntegerField;
    tb_usuariosid: TFDAutoIncField;
    tb_usuariosnome: TStringField;
    tb_usuariosusuario: TStringField;
    tb_usuariossenha: TStringField;
    tb_usuarioscargo: TStringField;
    tb_usuariosid_funcionario: TIntegerField;

    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;
  idFunc : string;
  nomeFunc : string;
  cargoFunc : string;

  chamada : string;


  nomeUsuario : string;
  cargoUsuario: string;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure Tdm.DataModuleCreate(Sender: TObject);
begin
  fd.Connected := True;
  tb_Cargos.Active := True;
  tb_func.Active := True;
  query_func.Active := True;
  query_Cargos.Active := True;
end;

end.
