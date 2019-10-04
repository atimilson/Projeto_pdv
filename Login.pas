unit Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.StdCtrls, Vcl.Buttons;

type
  TFrmLogin = class(TForm)
    Panel1: TPanel;
    imgFundo: TImage;
    pnlLogin: TPanel;
    imgLogin: TImage;
    txtUsuario: TEdit;
    txtSenha: TEdit;
    btnEntrar: TSpeedButton;
    procedure centralizarPainel;
    procedure login;
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure btnEntrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.dfm}

uses Menu;

procedure TFrmLogin.btnEntrarClick(Sender: TObject);
begin
    if Trim(txtUsuario.Text) = '' then
    begin
        MessageDlg('Preencha o usuario!!', mtInformation, mbOKCancel, 0);
        txtUsuario.SetFocus;
        Exit;
    end;
     if Trim(txtSenha.Text) = '' then
    begin
        MessageDlg('Preencha a senha!!', mtInformation, mbOKCancel, 0);
        txtSenha.SetFocus;
        Exit;
    end;

    login;

end;

procedure TFrmLogin.centralizarPainel;
begin
    pnlLogin.Top := (Self.Height div 2) - (pnlLogin.Height div 2);
    pnlLogin.Left := (Self.Width div 2) - (pnlLogin.Width div 2);
end;

procedure TFrmLogin.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
    centralizarPainel
end;





procedure TFrmLogin.login;
begin
// codigo
   frmMenu := TfrmMenu.Create(FrmLogin);
   frmMenu.ShowModal;
end;

end.
