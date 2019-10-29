unit Funcionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.StdCtrls, Data.DB, module,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons;
type
  TfrmFuncionarios = class(TForm)
    txtBuscarNome: TEdit;
    rbNome: TRadioButton;
    rbCpf: TRadioButton;
    MaskEdit1: TMaskEdit;
    edtNome: TEdit;
    Label1: TLabel;
    Label2: TLabel;
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
    edtCpf: TMaskEdit;
    procedure FormShow(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure txtBuscarNomeChange(Sender: TObject);
  private
    { Private declarations }
    procedure carregarCombobox;
    procedure associarCampos;
    procedure listar;
    procedure buscar;
    procedure limpar;
    procedure habilitarCampos;
    procedure desabilitarCampos;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFuncionarios: TfrmFuncionarios;
  id: string;
  cpfAntigo : string;
implementation

{$R *.dfm}

{ TfrmFuncionarios }

procedure TfrmFuncionarios.associarCampos;
begin
    dm.query_func.Close;
    dm.query_func.SQL.Clear;
    dm.query_func.SQL.Add('select max(id) as id from funcionarios');
    dm.query_func.Open;
    id := dm.query_func.FieldByName('id').AsString;
    dm.query_func.SQL.Clear;
    dm.query_func.Close;
    dm.tb_func.FieldByName('id').Value := StrToIntDef(id,0) + 1;
    dm.tb_func.FieldByName('nome').Value := edtNome.Text;
    dm.tb_func.FieldByName('cpf').Value := edtCpf.Text;
    dm.tb_func.FieldByName('endereco').Value := edtEndereco.Text;
    dm.tb_func.FieldByName('telefone').Value := EdtTelefone.Text;
    dm.tb_func.FieldByName('cargo').Value :=  cbxCargo.Text;
    dm.tb_func.FieldByName('data_cadastro').Value := DateToStr(Date);
end;

procedure TfrmFuncionarios.btnEditarClick(Sender: TObject);
var
cpf : string;
begin
     if id = '' then
    begin
      MessageDlg('O id está vazio!!',mtWarning,mbOKCancel,0);
      Exit;
    end;
    if Trim(edtNome.Text) = '' then
    begin
      MessageDlg('preencha o nome!!',mtWarning,mbOKCancel,0);
      edtNome.SetFocus;
      Exit;
    end;
    if Trim(edtCpf.Text) = '' then
    begin
      MessageDlg('preencha o CPF!!',mtWarning,mbOKCancel,0);
      edtCpf.SetFocus;
      Exit;
    end;
    if Trim(EdtTelefone.Text) = '' then
    begin
      MessageDlg('preencha o Telefone!!',mtWarning,mbOKCancel,0);
      EdtTelefone.SetFocus;
      Exit;
    end;
    if (cpfAntigo <> Trim(edtCpf.Text)) then
    begin
       dm.query_func.Close;
       dm.query_func.SQL.Clear;
       dm.query_func.SQL.Add('select * from funcionarios where cpf = '+ QuotedStr(Trim(edtCpf.Text)));
       dm.query_func.Open;
       if not dm.query_func.IsEmpty then
       begin
          cpf:= dm.query_func['cpf'];
          MessageDlg('O CPF Já existe!',mtWarning,mbOKCancel,0);
          edtNome.SetFocus;
          btnEditar.Enabled := False;
          btnExcluir.Enabled := False;
          DBGrid1.SelectedRows.Clear;
          limpar;
          listar;
          Exit;
       end;
    end;


    associarCampos;
     dm.query_func.Close;
    dm.query_func.SQL.Clear;
    dm.query_func.SQL.Add('UPDATE funcionarios set nome = :nome, cpf = :cpf, endereco = :endereco, telefone = :telefone, cargo = :cargo  where id = :id');
    dm.query_func.ParamByName('nome').Value := edtNome.Text;
    dm.query_func.ParamByName('cpf').Value := edtCpf.Text;
    dm.query_func.ParamByName('endereco').Value := EdtTelefone.Text;
    dm.query_func.ParamByName('telefone').Value := edtEndereco.Text;
    dm.query_func.ParamByName('cargo').Value := cbxCargo.Text;
    dm.query_func.ParamByName('id').Value := id;
    dm.query_func.ExecSQL;
    listar;
    MessageDlg('Salvo com sucesso!!',mtConfirmation,mbOKCancel,0);
    btnEditar.Enabled := False;
    btnExcluir.Enabled := False;
    btnSalvar.Enabled := False;
    limpar;
    desabilitarCampos;
    listar;
end;

procedure TfrmFuncionarios.btnExcluirClick(Sender: TObject);
begin
    if MessageDlg('Deseja excluir o registro ?',mtInformation, [mbYes,mbNo],0) = mrYes then
   begin

       dm.query_func.Close;
       dm.query_func.SQL.Clear;
       dm.query_func.SQL.Add('delete from funcionarios where id = :id');
       dm.query_func.ParamByName('id').Value := id;
       dm.query_func.ExecSQL;

       listar;
       MessageDlg('Deletado com sucesso!!',mtInformation,mbOKCancel,0);
       DBGrid1.SelectedRows.Clear;
       btnEditar.Enabled := False;
       btnExcluir.Enabled := False;
       limpar;
       desabilitarCampos;

   end;
end;

procedure TfrmFuncionarios.btnNovoClick(Sender: TObject);
begin
   limpar;
   btnEditar.Enabled := False;
   btnExcluir.Enabled := False;
   habilitarCampos;
   btnSalvar.Enabled := True;
   dm.tb_func.Insert;
end;

procedure TfrmFuncionarios.btnSalvarClick(Sender: TObject);
var
cpf : string;
begin
    if Trim(edtNome.Text) = '' then
    begin
      MessageDlg('preencha o nome!!',mtWarning,mbOKCancel,0);
      edtNome.SetFocus;
      Exit;
    end;
    if Trim(edtCpf.Text) = '' then
    begin
      MessageDlg('preencha o CPF!!',mtWarning,mbOKCancel,0);
      edtCpf.SetFocus;
      Exit;
    end;
    if Trim(EdtTelefone.Text) = '' then
    begin
      MessageDlg('preencha o Telefone!!',mtWarning,mbOKCancel,0);
      EdtTelefone.SetFocus;
      Exit;
    end;
    dm.query_func.Close;
    dm.query_func.SQL.Clear;
    dm.query_func.SQL.Add('select * from funcionarios where cpf = '+ QuotedStr(Trim(edtCpf.Text)));
    dm.query_func.Open;
    if not dm.query_func.IsEmpty then
    begin
       cpf:= dm.query_func['cpf'];
       MessageDlg('O CPF já existe',mtWarning,mbOKCancel,0);
       edtNome.SetFocus;
       btnEditar.Enabled := False;
       btnExcluir.Enabled := False;
       DBGrid1.SelectedRows.Clear;
       listar;
       Exit;
    end;


    associarCampos;
    dm.tb_func.Post;
    listar;
    MessageDlg('Salvo com sucesso!!',mtConfirmation,mbOKCancel,0);
    btnEditar.Enabled := False;
    btnExcluir.Enabled := False;
    btnSalvar.Enabled := False;
    limpar;
    desabilitarCampos;
end;

procedure TfrmFuncionarios.buscar;
begin
    //
end;

procedure TfrmFuncionarios.carregarCombobox;
begin
      //
   dm.query_Cargos.Close;
   dm.query_Cargos.SQL.Clear;
   dm.query_Cargos.SQL.Add('select * from cargos order by cargo asc');
   dm.query_Cargos.Open;
   if not dm.query_Cargos.IsEmpty then
   begin
      while not dm.query_Cargos.Eof do
      begin
         cbxCargo.Items.Add(dm.query_Cargos.FieldByName('cargo').AsString);
         dm.query_Cargos.Next;
      end;
   end;
end;

procedure TfrmFuncionarios.DBGrid1CellClick(Column: TColumn);
begin
  habilitarCampos;
  btnEditar.Enabled := True;
  btnExcluir.Enabled := True;
  btnSalvar.Enabled := False;

  dm.tb_func.Edit;

  if dm.query_func.FieldByName('nome').Value <> null then
      edtNome.Text := dm.query_func.FieldByName('nome').Value;
  if dm.query_func.FieldByName('cpf').Value <> null then
      edtCpf.Text := dm.query_func.FieldByName('cpf').Value;
  if dm.query_func.FieldByName('telefone').Value <> null then
      EdtTelefone.Text := dm.query_func.FieldByName('telefone').Value;
  if dm.query_func.FieldByName('endereco').Value <> null then
      edtEndereco.Text := dm.query_func.FieldByName('endereco').Value;
  if dm.query_func.FieldByName('cargo').Value <> null then
     cbxCargo.Items.IndexOfName(dm.query_Cargos.FieldByName('cargo').AsString);
  id := dm.query_func.FieldByName('id').Value;
  cpfAntigo := dm.query_func.FieldByName('cpf').Value;
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
   dm.tb_func.Active := True;
   carregarCombobox;
   listar;
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
 //
    dm.query_func.Close;
    dm.query_func.SQL.Clear;
    dm.query_func.SQL.Add('select * from funcionarios where 1=1');
    dm.query_func.Open;
end;

procedure TfrmFuncionarios.txtBuscarNomeChange(Sender: TObject);
begin
    dm.query_func.Close;
    dm.query_func.SQL.Clear;
    dm.query_func.SQL.Add('select * from funcionarios where nome like '+ QuotedStr('%'+txtBuscarNome.Text+'%'));
    dm.query_func.Open;
end;

end.
