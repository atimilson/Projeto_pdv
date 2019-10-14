unit Cargos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, Vcl.StdCtrls;

type
  TfrmCargos = class(TForm)
    edtNome: TEdit;
    Label1: TLabel;
    btnNovo: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnEditar: TSpeedButton;
    btnExcluir: TSpeedButton;
    grid: TDBGrid;
    procedure associarCampos;
    procedure listarCargos;
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure gridCellClick(Column: TColumn);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCargos: TfrmCargos;
  id : string;

implementation

{$R *.dfm}

uses module;

procedure TfrmCargos.associarCampos;
begin
    dm.tb_Cargos.FieldByName('cargo').Value := edtNome.Text;
end;

procedure TfrmCargos.btnEditarClick(Sender: TObject);
var
cargo : string;
begin
    if Trim(edtNome.Text) = '' then
    begin
      MessageDlg('preencha o cargo!!',mtWarning,mbOKCancel,0);
      edtNome.SetFocus;
      Exit;
    end;
     dm.query_Cargos.Close;
    dm.query_Cargos.SQL.Clear;
    dm.query_Cargos.SQL.Add('select cargo from cargos where cargo = '+ QuotedStr(Trim(edtNome.Text)));
    dm.query_Cargos.Open;
    if not dm.query_Cargos.IsEmpty then
    begin
       cargo:= dm.query_Cargos['cargo'];
       MessageDlg('O cargo j� existe',mtWarning,mbOKCancel,0);
       edtNome.SetFocus;
       edtNome.Text := '';
       btnEditar.Enabled := False;
       btnExcluir.Enabled := False;
       grid.SelectedRows.Clear;
       listarCargos;
       Exit;
    end;


    associarCampos;
     dm.query_Cargos.Close;
    dm.query_Cargos.SQL.Clear;
    dm.query_Cargos.SQL.Add('update cargos set cargo = :cargo where id = :id');
    dm.query_Cargos.ParamByName('cargo').Value := edtNome.Text;
    dm.query_Cargos.ParamByName('id').Value := id;
    dm.query_Cargos.ExecSQL;

    listarCargos;
    MessageDlg('Salvo com sucesso!!',mtInformation,mbOKCancel,0);
    btnEditar.Enabled := False;
    btnExcluir.Enabled := False;
    edtNome.Text := '';
end;

procedure TfrmCargos.btnExcluirClick(Sender: TObject);
begin
   if MessageDlg('Deseja excluir o registro ?',mtInformation, [mbYes,mbNo],0) = mrYes then
   begin
       dm.query_Cargos.Close;
       dm.query_Cargos.SQL.Clear;
       dm.query_Cargos.SQL.Add('delete from cargos where id = :id');
       dm.query_Cargos.ParamByName('id').Value := id;
       dm.query_Cargos.ExecSQL;

       listarCargos;
       MessageDlg('Deletado com sucesso!!',mtInformation,mbOKCancel,0);
       grid.SelectedRows.Clear;
       btnEditar.Enabled := False;
       btnExcluir.Enabled := False;
       edtNome.Text := '';
   end;

end;

procedure TfrmCargos.btnNovoClick(Sender: TObject);
begin
   btnSalvar.Enabled := true;
   grid.SelectedRows.Clear;
   edtNome.Enabled := true;
   btnEditar.Enabled := False;
   btnExcluir.Enabled := False;
   edtNome.SetFocus;
   edtNome.Text := '';
   dm.tb_Cargos.Insert;
end;

procedure TfrmCargos.btnSalvarClick(Sender: TObject);
var
cargo : string;
begin
    if Trim(edtNome.Text) = '' then
    begin
      MessageDlg('preencha o cargo!!',mtWarning,mbOKCancel,0);
      edtNome.SetFocus;
      Exit;
    end;
    dm.query_Cargos.Close;
    dm.query_Cargos.SQL.Clear;
    dm.query_Cargos.SQL.Add('select cargo from cargos where cargo = '+ QuotedStr(Trim(edtNome.Text)));
    dm.query_Cargos.Open;


    if not dm.query_Cargos.IsEmpty then
    begin
       cargo:= dm.query_Cargos['cargo'];
       MessageDlg('O cargo j� existe',mtWarning,mbOKCancel,0);
       edtNome.SetFocus;
       edtNome.Text := '';
       listarCargos;
       Exit;
    end;

    associarCampos;
    dm.tb_Cargos.Post;
    MessageDlg('Salvo com sucesso!!',mtInformation,mbOKCancel,0);
    edtNome.Text := '';
    grid.SelectedRows.Clear;
    edtNome.Enabled := false;
    btnSalvar.Enabled := false;
    listarCargos;
end;

procedure TfrmCargos.FormCreate(Sender: TObject);
begin
   listarCargos;
end;

procedure TfrmCargos.gridCellClick(Column: TColumn);
begin
  edtNome.Enabled := True;
  btnEditar.Enabled := True;
  btnExcluir.Enabled := True;
  btnSalvar.Enabled := False;

  dm.tb_Cargos.Edit;

  if dm.query_Cargos.FieldByName('cargo').Value <> null then
      edtNome.Text := dm.query_Cargos.FieldByName('cargo').Value;
  id := dm.query_Cargos.FieldByName('id').Value;
end;

procedure TfrmCargos.listarCargos;
begin
    dm.query_Cargos.Close;
    dm.query_Cargos.SQL.Clear;
    dm.query_Cargos.SQL.Add('select * from cargos');
    dm.query_Cargos.Open;

end;

end.
