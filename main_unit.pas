unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Buttons, ExtCtrls, TKarte, TSpielfigur, TBot; 
  // die 3 Klassen gibt es im Steuerung-Branch

type

  { TForm1 }

  TForm1 = class(TForm)
    // Wie schon erwähnt es brauch nur einen Timer mit dem Namen 'Timer1' als Komponente
    Timer1: TTimer;

    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: char);
    procedure Timer1Timer(Sender: TObject);
    
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

var Karte : TKarte1;
var Spielfigur : TSpielfigur1;
var Bot,secBot :TBot1;

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin

   // Erschaffen von den 3 Klassen (Karte,Spielfigur,Bot)
   // Davon 2 Bots
   Karte := TKarte1.Create(Form1,0,0);
   Karte.paintbackground('solidback.bmp');
   Spielfigur := TSpielfigur1.Create(Form1,240,176) ;
   
   // setFightDistance muss hier noch ausgeführt werden um später den Kampfeintritt zum richtigen Zeitpunkt zu bekommen
   Bot := TBot1.Create(Form1,240,100) ;
   // hier heißt das soviel wie "Es wird erst eingetreten wenn die Figur 0 in x und 21 in y-Richtung entfernt ist"
   // wird später noch klarer
   Bot.setFightDistanceX(0);
   Bot.setFightDistanceY(21);

   secBot := TBot1.Create(Form1,30,110);
   secBot.setFightDistanceX(21);
   secBot.setFightDistanceY(3);



end;



procedure TForm1.FormKeyPress(Sender: TObject; var Key: char);
begin

     if (key = 'a') and Karte.prooveX(Karte.getPosX +5) then
   begin
       // passiert in allen if-Abfragen das selbe : Karte bewegt sich mit den Bots + Spielfigur wird korrekt gesetzt
       Karte.setPosX(5);
       Spielfigur.paintFigur(1);
       Bot.setPosX(5);
       
       // Bei diesen setDistance Sachen wird der Abstand zwischen Spielfigur und Bot berechnet
       Bot.setDistanceX(Spielfigur.getLeft);
       Bot.setDistanceY(Spielfigur.getTop());

       secBot.setPosX(5);
       secBot.setDistanceX(Spielfigur.getLeft);
       secBot.setDistanceY(Spielfigur.getTop());
   end;
   
   
    if (key = 'd') and Karte.prooveX(Karte.getPosX -5) then
   begin
       Karte.setPosX(-5);
       Bot.setPosX(-5);
       Spielfigur.paintFigur(2);
       Bot.setDistanceX(Spielfigur.getLeft);
       Bot.setDistanceY(Spielfigur.getTop());

       secBot.setPosX(-5);
       secBot.setDistanceX(Spielfigur.getLeft);
       secBot.setDistanceY(Spielfigur.getTop());

   end;

     if (key = 'w') and Karte.prooveY(Karte.getPosY +5) then
   begin
       Karte.setPosY(5);
       Bot.setPosY(5);
       Spielfigur.paintFigur(3);
       Bot.setDistanceX(Spielfigur.getLeft);
       Bot.setDistanceY(Spielfigur.getTop());
       secBot.setPosY(5);
       secBot.setDistanceX(Spielfigur.getLeft);
       secBot.setDistanceY(Spielfigur.getTop());
   end;

      if (key = 's') and Karte.prooveY(Karte.getPosY -5) then
   begin
       Karte.setPosY(-5);
       Bot.setPosY(-5);
       Spielfigur.paintFigur(4);
       Bot.setDistanceX(Spielfigur.getLeft);
       Bot.setDistanceY(Spielfigur.getTop());
       secBot.setPosY(-5);
       secBot.setDistanceX(Spielfigur.getLeft);
       secBot.setDistanceY(Spielfigur.getTop());
   end;
// Das war im wesentlichen der Bewegungsapparat des Spiels
end;


// Hier kommt noch der Eintritt in den Kampf
procedure TForm1.Timer1Timer(Sender: TObject);
begin

// Wenn die momentane Distance der Objekte (Spielfigur,Bot) kleiner als die oben definierte FightDistance ist wird der Timer angehalten
// und es wird in der ShowMessage 'Lass uns kämpfen ausgegeben'

    if (abs(Bot.getDistanceY()) <= abs(Bot.getFightDistanceY())) and (abs(Bot.getDistanceX()) <= abs(Bot.getFightDistanceX())) then
   begin
       Timer1.Enabled:= false;
       ShowMessage(Bot.startConversation());
       //Hier könnte Tobias einsteigen und die Überleitung in die "Kampfarena" bringen
   end;


if (abs(secBot.getDistanceY()) <= abs(secBot.getFightDistanceY())) and (abs(secBot.getDistanceX()) <= abs(secBot.getFightDistanceX())) then
   begin
       Timer1.Enabled:= false;
       ShowMessage(secBot.startConversation());
   end;
end;





end.

