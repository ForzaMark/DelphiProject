unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TBot,TSpielfigur,TKarte, ExtCtrls, StdCtrls,uTFightInterface,uTPokemon,pngimage;
  //pngimage kommt von Vorlagen/Informatik/ga-if/12/BeispielPNG ... Zu genaueren Quellen
  //Herr Markert fragen

type
  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    //procedure Timer1Timer(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation



{$R *.dfm}

  var Karte : TKarte1;
  var Spielfigur : TSpielfigur1;
  var Bot : TBot1;
  var Kampf : TFightInterface;
  var Pokemon1,Pokemon2 : TPokemon;



procedure TForm1.FormCreate(Sender: TObject);
begin
    Karte := TKarte1.Create(Form1,0,0);
    Karte.paintbackground('newback.bmp');
    Spielfigur := TSpielfigur1.Create(Form1,50,50);
    Bot := TBot1.Create(Form1,375,115) ;

    Bot.setFightDistanceX(0);
    Bot.setFightDistanceY(21);
end;


procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
  var AttackButton : Array[1..4] of TButton;
begin
  if (key = 'a') and Karte.prooveCoords(Karte.getPosX + 5,Karte.getPosY) then
   begin
       Karte.setPosX(5);
       Spielfigur.paintFigur(1);
       Bot.setPosX(5);
       Bot.setDistanceX(Spielfigur.getLeft);
       Bot.setDistanceY(Spielfigur.getTop());
    end;

  if (key = 'd') and Karte.prooveCoords(Karte.getPosX - 5,Karte.getPosY) then
   begin
       Karte.setPosX(-5);
       Spielfigur.paintFigur(2);
       Bot.setPosX(-5);
       Bot.setDistanceX(Spielfigur.getLeft);
       Bot.setDistanceY(Spielfigur.getTop());
    end;

   if (key = 's') and Karte.prooveCoords(Karte.getPosX ,Karte.getPosY - 5) then
    begin
       Karte.setPosY(-5);
       Spielfigur.paintFigur(4);
       Bot.setPosY(-5);
       Bot.setDistanceX(Spielfigur.getLeft);
       Bot.setDistanceY(Spielfigur.getTop());
    end;


   if (key = 'w') and Karte.prooveCoords(Karte.getPosX ,Karte.getPosY + 5) then
    begin
       Karte.setPosY(5);
       Spielfigur.paintFigur(3);
       Bot.setPosY(5);
       Bot.setDistanceX(Spielfigur.getLeft);
       Bot.setDistanceY(Spielfigur.getTop());
    end;


   if (Key = 'x') and (Karte.getPosX = -365) and (Karte.getPosY = -50) then ShowMessage('Sie befinden sich in der Schulstraße\n Gehen sie auf das blaue Feld um auf den Schulhof zu gelangen');
   
   if (Key = 'x') and (abs(Bot.getDistanceY()) <= abs(Bot.getFightDistanceY())) and (abs(Bot.getDistanceX()) <= abs(Bot.getFightDistanceX())) then
    begin
      ShowMessage(Bot.startConversation());

     Kampf := TFightInterface.Create(Form1,0,0);
       Pokemon1 := TPokemon.create(Form1,1,3);
       Pokemon2 := TPokemon.create(Form1,2,1);

       Pokemon1.drawPokemon(Form1,130,10);
       Pokemon2.drawPokemon(Form1,20,100);

       Form1.ClientHeight:= 720;
       Form1.ClientWidth:= 720;

       begin


  AttackButton[1]:=TButton.Create(Self);
  AttackButton[1].Parent:=Self;
  AttackButton[1].Caption:='Attacke 1';
  AttackButton[1].Left:=40;
  AttackButton[1].Top:=550;
  AttackButton[1].Width:=250;
  AttackButton[1].Height:=40;

  AttackButton[2]:=TButton.Create(Self);
  AttackButton[2].Parent:=Self;
  AttackButton[2].Caption:='Attacke 2';
  AttackButton[2].Left:=420;
  AttackButton[2].Top:=550;
  AttackButton[2].Width:=250;
  AttackButton[2].Height:=40;

  AttackButton[3]:=TButton.Create(Self);
  AttackButton[3].Parent:=Self;
  AttackButton[3].Caption:='Attacke 3';
  AttackButton[3].Left:=40;
  AttackButton[3].Top:=645;
  AttackButton[3].Width:=250;
  AttackButton[3].Height:=40;

  AttackButton[4]:=TButton.Create(Self);
  AttackButton[4].Parent:=Self;
  AttackButton[4].Caption:='Attacke 4';
  AttackButton[4].Left:=420;
  AttackButton[4].Top:=645;
  AttackButton[4].Width:=250;
  AttackButton[4].Height:=40;
end;

      end;


end;



end.
