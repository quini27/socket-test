unit UnitAdd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFormAddress = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    OKBtn: TButton;
    procedure OKBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    endereco : string;
  end;

var
  FormAddress: TFormAddress;

implementation

{$R *.dfm}

procedure TFormAddress.OKBtnClick(Sender: TObject);
begin
  if Edit1.Text='' then
    ShowMessage('Introduza um endereço de IP válido')
    else
    begin
      endereco:=Edit1.Text;
      Edit1.Text:='';
      Visible:=false
    end;
end;

end.
