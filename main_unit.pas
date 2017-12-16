unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Buttons, ExtCtrls, TKarte, TSpielfigur, TBot;

type

  { TForm1 }

  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
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
   Karte := TKarte1.Create(Form1,0,0);
   Karte.paintbackground('solidback.bmp');
   Spielfigur := TSpielfigur1.Create(Form1,240,176) ;
   Bot := TBot1.Create(Form1,240,100) ;
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
       Bot.setPosX(5);
       Karte.setPosX(5);
       Spielfigur.paintFigur(1);
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



end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin

   Edit1.Text:= IntToStr(secBot.getDistanceX());
   Edit2.Text:= IntToStr(secBot.getDistanceY());


if (abs(Bot.getDistanceY()) <= abs(Bot.getFightDistanceY())) and (abs(Bot.getDistanceX()) <= abs(Bot.getFightDistanceX())) then
   begin
       Timer1.Enabled:= false;
       ShowMessage(Bot.startConversation());
   end;


if (abs(secBot.getDistanceY()) <= abs(secBot.getFightDistanceY())) and (abs(secBot.getDistanceX()) <= abs(secBot.getFightDistanceX())) then
   begin
       Timer1.Enabled:= false;
       ShowMessage(secBot.startConversation());
   end;
end;





end.

