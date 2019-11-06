{Programa para controlar uma placa de IoT Nodemcu 1.0.
O programa a ser carregado nco controlador é test_socket.ino
Este programa conecta a placa a um endereço de IP fixo disponível no roteador,
a placa atúa como servidor. Este programa conecta como cliente, utilizando o
componente client socket.}
{ele permite acender e apagar o LED onboard da placa, enviar um string que será
impresso no monitor serial, e imprime o estado do botão onboard.}


unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Win.ScktComp,
  Web.Win.Sockets, Vcl.Buttons, Vcl.ExtCtrls;

type
  TForm3 = class(TForm)
    ClientSocket1: TClientSocket;
    Label1: TLabel;
    Memo1: TMemo;
    LedOnButton: TButton;
    LedOffButton: TButton;
    ConectorButton: TButton;
    Titulo: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    SendStrButt: TButton;
    Timer1: TTimer;
    StartBtn: TButton;
    StopButton: TButton;
    procedure ClientSocket1Connect(Sender: TObject; Socket: TCustomWinSocket);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure ClientSocket1Disconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure LedOnButtonClick(Sender: TObject);
    procedure LedOffButtonClick(Sender: TObject);
    procedure ConectorButtonClick(Sender: TObject);
    procedure SendStrButtClick(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure ClientSocket1Write(Sender: TObject; Socket: TCustomWinSocket);
    procedure Timer1Timer(Sender: TObject);
    procedure StartBtnClick(Sender: TObject);
    procedure StopButtonClick(Sender: TObject);
    procedure ClientSocket1Error(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
  private
    { Private declarations }
    str:string;
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation
{$R *.dfm}

uses UnitAdd;


{Botão de começo de rotina}
procedure TForm3.StartBtnClick(Sender: TObject);
begin
   FormAddress.Visible:=true;           //visibiliza a forma para introduzir o endereço
   repeat (Application.ProcessMessages) until FormAddress.Visible=false;
   ClientSocket1.Host:=FormAddress.endereco;
   Label2.Caption:='Conexão de TCP/IP ao servidor Nodemcu '+ClientSocket1.Host;
   ConectorButton.Enabled:=True;
   Edit1.Enabled:=True;
   LedOnButton.Enabled:=true;
   LedOffButton.Enabled:=true;
   SendStrButt.Enabled:=true;
   StopButton.Enabled:=true;
   StartBtn.Enabled:=False;
   Memo1.Lines.Add('Cliente iniciado em '+FormatDateTime('hh:nn:ss', Now));
end;

{Procedimento de fim de rotina}
procedure TForm3.StopButtonClick(Sender: TObject);
begin
   ConectorButton.Enabled:=false;
   Edit1.Enabled:=false;
   LedOnButton.Enabled:=false;
   LedOffButton.Enabled:=false;
   SendStrButt.Enabled:=false;
   StopButton.Enabled:=false;
   StartBtn.Enabled:=true;
   if ClientSocket1.Active then ClientSocket1.Close;
   Memo1.Lines.Add('Cliente encerrado em '+FormatDateTime('hh:nn:ss', Now));
end;

{Evento chamado toda vez que a conexão é feita.
Caso haja um string armazenado na variável global str, ele o envia ao servidor.}
procedure TForm3.ClientSocket1Connect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  //ClientSocket1.Open;
   Label1.Caption:='Estado da conexão: conectado';
   Memo1.Text:=Memo1.Text+'Conexão aberta'+#13#10;
   ConectorButton.Enabled:=false;
   if str<>'' then Socket.SendText(str);
   str:='';
end;

{Evento chamado toda vez que a conexão é encerrada}
procedure TForm3.ClientSocket1Disconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  //ClientSocket1.Close;
  Label1.Caption:='Estado da conexão: desconectado';
  ConectorButton.Enabled:=true;
end;

{Se houver erro de conexão}
procedure TForm3.ClientSocket1Error(Sender: TObject; Socket: TCustomWinSocket;
  ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
    Memo1.Text:=Memo1.Text+'Erro '+IntToStr(ErrorCode)+' ao abrir a conexão'+#13#10;
end;

{Evento chamado toda vez que o cliente lê uma mensagem do servidor. Ele escreve
essa mensagem no Memo.}
procedure TForm3.ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);
begin
    //Memo1.Text:='quero escrever o html recebido'+#13#10;
    Memo1.Text:=Memo1.Text+'String recebido: '+Socket.ReceiveText+#13#10;
end;

{Evento chamado toda vez que é enviada uma mensagem ao servidor.}
procedure TForm3.ClientSocket1Write(Sender: TObject; Socket: TCustomWinSocket);
begin
  Memo1.Text:=Memo1.Text+'Escrevendo no servidor...'+#13#10
end;



{Procedimento chamado quando é clicado o botão de conedtar, ou qualquer outro botão}
procedure TForm3.ConectorButtonClick(Sender: TObject);
begin
 if not ClientSocket1.Active then
    begin
       try
          ClientSocket1.Open;
       except
        on E: Exception do
           Memo1.Text:=Memo1.Text+'Erro de conexão '+E.Message+#13#10;
       end;

      //Label1.Caption:='Estado da conexão: connected';
      //LedOnButton.Enabled:=True;
      //LedOffButton.Enabled:=true;
      //ConectorButton.Caption:='desconectar';
    end
  {else
    begin
      ClientSocket1.Close;
      Label1.Caption:='Estado da conexão: unconnected';
      Memo1.Text:=Memo1.Text+'conexión fechada'+#10#13;
      LedOnButton.Enabled:=false;
      LedOffButton.Enabled:=false;
      ConectorButton.Caption:='conectar';
    end;                                  }

end;

{Procedimento chamado quando é clicado o botão de LED OFF. Ele simplesmente
escreve o comando no string e chama ao procedimento para fazer a conexão. O
string é enviado pelo evento que acontece toda vez que a conexão é realizada.}
procedure TForm3.LedOffButtonClick(Sender: TObject);
begin
    str:='/LED=OFF';
    {str:='GET /LED=OFF HTTP/1.1'+#13#10+
          'Host: 192.168.0.200'+#13#10+
          'Connection: keep-alive'+#13#10+
          'Cache-Control: max-age=0'+#13#10+
          'Upgrade-Insecure-Requests: 1'+#13#10+
          'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36'+#13#10+
          'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'+#13#10+
          'Referer: http://192.168.0.200/LED=OFF'+#13#10+
          'Accept-Encoding: gzip, deflate'+#13#10+
          'Accept-Language: pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7,es;q=0.6'; }
    ConectorButtonClick(Sender);
    //ClientSocket1.Socket.SendText(str);//Send the messages to the server
end;

{Procedimento chamado quando é clicado o botão de LED ON. Ele simplesmente
escreve o comando no string e chama ao procedimento para fazer a conexão. O
string é enviado pelo evento que acontece toda vez que a conexão é realizada.}
procedure TForm3.LedOnButtonClick(Sender: TObject);
begin
     str:='/LED=ON';
     ConectorButtonClick(Sender);
     //ClientSocket1.Socket.SendText(str);//Send the messages to the server
end;


{Procedimento chamado quando é clicado o botão de SEND. Ele simplesmente
escreve o texto na janela de edição no string e chama ao procedimento para fazer a conexão. O
string é enviado pelo evento que acontece toda vez que a conexão é realizada.}
procedure TForm3.SendStrButtClick(Sender: TObject);
begin
  str:=Edit1.Text;
  Edit1.Text:='';
  ConectorButtonClick(Sender);
  //ClientSocket1.Socket.SendText(str);//Send the messages to the server
end;



{Procedimento chamado a cada 10s. com o intuito de refrescar a conexão. Tem o
efeito de refresh do html}
{Desativado por enquanto}
procedure TForm3.Timer1Timer(Sender: TObject);
begin
  // if StartBtn.Enabled=false then ConectorButtonClick(Sender);
end;

{Procedimento chamado toda vez que há alguma escrita na janela de Memo com o
intuito de fazer um auto scroll.}
procedure TForm3.Memo1Change(Sender: TObject);
begin
  SendMessage(Memo1.Handle, EM_LINESCROLL, 0,Memo1.Lines.Count);
end;



{Quando se sai do programa desativa previamente a conexão.}
procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if ClientSocket1.Active then ClientSocket1.Close;
end;

end.
