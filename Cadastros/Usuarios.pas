unit Usuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmUsuarios = class(TForm)
    Label1: TLabel;
    EditNome: TEdit;
    BuscarFunc: TSpeedButton;
    Label2: TLabel;
    EditUsuario: TEdit;
    Label3: TLabel;
    EditSenha: TEdit;
    Label4: TLabel;
    GroupBox1: TGroupBox;
    EditBuscar: TEdit;
    DBGrid1: TDBGrid;
    btnNovo: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnEditar: TSpeedButton;
    btnExcluir: TSpeedButton;
    procedure BuscarFuncClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure EditBuscarChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
      procedure limpar;
      procedure habilitarCampos;
      procedure desabilitarCampos;

      procedure associarCampos;
      procedure listar;
      procedure buscarNome;
  public
    { Public declarations }
  end;


var
  frmUsuarios: TfrmUsuarios;
  usuarioAntigo: string;

implementation

{$R *.dfm}

uses module, Funcionarios;

procedure TFrmUsuarios.associarCampos;
begin
   dm.tb_usuarios.FieldByName('nome').Value := EditNome.Text;
   dm.tb_usuarios.FieldByName('usuario').Value := editUsuario.Text;
   dm.tb_usuarios.FieldByName('senha').Value := editSenha.Text;
   dm.tb_usuarios.FieldByName('cargo').Value := cargoFunc;
   dm.tb_usuarios.FieldByName('id_funcionario').Value := idFunc;
end;


procedure TfrmUsuarios.btnEditarClick(Sender: TObject);
var
  usuario : string;
  begin

      if Trim(EditNome.Text) = '' then
       begin
           MessageDlg('Preencha o Nome!', mtInformation, mbOKCancel, 0);
           EditNome.SetFocus;
           exit;
       end;

        if Trim(editUsuario.Text) = '' then
       begin
           MessageDlg('Preencha o Usuario!', mtInformation, mbOKCancel, 0);
           editUsuario.SetFocus;
           exit;
       end;


        if Trim(editSenha.Text) = '' then
       begin
           MessageDlg('Preencha a Senha!', mtInformation, mbOKCancel, 0);
           editSenha.SetFocus;
           exit;
       end;

        if usuarioAntigo <> editUsuario.Text then
           begin
           //VERIFICAR SE O usu�rio J� EST� CADASTRADO
           dm.query_usuario.Close;
           dm.query_usuario.SQL.Clear;
           dm.query_usuario.SQL.Add('SELECT * from usuarios where usuario = ' + QuotedStr(Trim(editUsuario.Text)));
           dm.query_usuario.Open;

           if not dm.query_usuario.isEmpty then
           begin
             usuario :=  dm.query_usuario['usuario'];
             MessageDlg('O Usu�rio ' + usuario + ' j� est� cadastrado!', mtInformation, mbOKCancel, 0);
             editUsuario.Text := '';
             editUsuario.SetFocus;
             exit;
           end;

       end;



         //associarCampos;
       dm.query_usuario.Close;
       dm.query_usuario.SQL.Clear;
       dm.query_usuario.SQL.Add('UPDATE usuarios set nome = :nome, usuario = :usuario, senha = :senha where id = :id');
       dm.query_usuario.ParamByName('nome').Value := editNome.Text;
        dm.query_usuario.ParamByName('usuario').Value := editUsuario.Text;
         dm.query_usuario.ParamByName('senha').Value := editSenha.Text;

       dm.query_usuario.ParamByName('id').Value := id;
       dm.query_usuario.ExecSQL;

       listar;
       MessageDlg('Editado com Sucesso!!', mtInformation, mbOKCancel, 0);
       btnEditar.Enabled := false;
       BtnExcluir.Enabled := false;
       limpar;
       desabilitarCampos;
end;

procedure TfrmUsuarios.btnExcluirClick(Sender: TObject);
begin
    if MessageDlg('Deseja excluir o registro ?',mtInformation, [mbYes,mbNo],0) = mrYes then
   begin

       dm.query_usuario.Close;
       dm.query_usuario.SQL.Clear;
       dm.query_usuario.SQL.Add('delete from usuarios where id = :id');
       dm.query_usuario.ParamByName('id').Value := id;
       dm.query_usuario.ExecSQL;

       listar;
       MessageDlg('Deletado com sucesso!!',mtInformation,mbOKCancel,0);
       DBGrid1.SelectedRows.Clear;
       btnEditar.Enabled := False;
       btnExcluir.Enabled := False;
       limpar;
       desabilitarCampos;

   end;
end;

procedure TfrmUsuarios.btnNovoClick(Sender: TObject);
begin
   habilitarCampos;
   dm.tb_usuarios.Insert;
   btnSalvar.Enabled := true;
end;

procedure TfrmUsuarios.btnSalvarClick(Sender: TObject);
var
  usuario : string;
  begin

      if Trim(EditNome.Text) = '' then
       begin
           MessageDlg('Preencha o Nome!', mtInformation, mbOKCancel, 0);
           EditNome.SetFocus;
           exit;
       end;

        if Trim(editUsuario.Text) = '' then
       begin
           MessageDlg('Preencha o Usuario!', mtInformation, mbOKCancel, 0);
           editUsuario.SetFocus;
           exit;
       end;


        if Trim(editSenha.Text) = '' then
       begin
           MessageDlg('Preencha a Senha!', mtInformation, mbOKCancel, 0);
           editSenha.SetFocus;
           exit;
       end;


           //VERIFICAR SE O usu�rio J� EST� CADASTRADO
           dm.query_usuario.Close;
           dm.query_usuario.SQL.Clear;
           dm.query_usuario.SQL.Add('SELECT * from usuarios where usuario = ' + QuotedStr(Trim(editUsuario.Text)));
           dm.query_usuario.Open;

           if not dm.query_usuario.isEmpty then
           begin
             usuario :=  dm.query_usuario['usuario'];
             MessageDlg('O Usu�rio ' + usuario + ' j� est� cadastrado!', mtInformation, mbOKCancel, 0);
             editUsuario.Text := '';
             editUsuario.SetFocus;
             exit;
           end;



  associarCampos;
  dm.tb_usuarios.Post;
  MessageDlg('Salvo com Sucesso', mtInformation, mbOKCancel, 0);
  limpar;
  desabilitarCampos;
  btnSalvar.Enabled := false;
  listar;

end;

procedure TfrmUsuarios.BuscarFuncClick(Sender: TObject);
begin
   chamada := 'Func';
   FrmFuncionarios := TFrmFuncionarios.Create(self);
   FrmFuncionarios.Show;
end;

procedure TFrmUsuarios.buscarNome;
begin
       dm.query_usuario.Close;
       dm.query_usuario.SQL.Clear;
       dm.query_usuario.SQL.Add('SELECT * from usuarios where nome LIKE :nome and cargo <> :cargo order by nome asc');
       dm.query_usuario.ParamByName('nome').Value := EditBuscar.Text + '%';
       dm.query_usuario.ParamByName('cargo').Value := 'admin';
       dm.query_usuario.Open;
end;


procedure TfrmUsuarios.DBGrid1CellClick(Column: TColumn);
begin
   habilitarCampos;
  btnEditar.Enabled := true;
  btnExcluir.Enabled := true;

  dm.tb_usuarios.Edit;


  editNome.Text := dm.query_usuario.FieldByName('nome').Value;

  editUsuario.Text := dm.query_usuario.FieldByName('usuario').Value;
  editSenha.Text := dm.query_usuario.FieldByName('senha').Value;


  id := dm.query_usuario.FieldByName('id').Value;

  usuarioAntigo := dm.query_usuario.FieldByName('usuario').Value;
end;
procedure TFrmUsuarios.desabilitarCampos;
begin
  editNome.Enabled := false;
  editUsuario.Enabled := false;
  editSenha.Enabled := false;
   BuscarFunc.Enabled := false;
end;

procedure TfrmUsuarios.EditBuscarChange(Sender: TObject);
begin
   buscarNome;
end;

procedure TfrmUsuarios.FormActivate(Sender: TObject);
begin
   editNome.Text := nomeFunc;
end;

procedure TfrmUsuarios.FormShow(Sender: TObject);
begin
    desabilitarCampos;
  dm.tb_usuarios.Active := true;
  listar;
end;
procedure TFrmUsuarios.habilitarCampos;
begin

  editUsuario.Enabled := true;
  editSenha.Enabled := true;
  BuscarFunc.Enabled := true;
end;

procedure TFrmUsuarios.limpar;
begin
  editNome.text := '';
  editUsuario.text := '';
  editSenha.text := '';
end;

procedure TFrmUsuarios.listar;
begin
       dm.query_usuario.Close;
       dm.query_usuario.SQL.Clear;
       dm.query_usuario.SQL.Add('SELECT * from usuarios where cargo <> :cargo order by nome asc');
       dm.query_usuario.ParamByName('cargo').Value := 'admin';
       dm.query_usuario.Open;
end;

end.
