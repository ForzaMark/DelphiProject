unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TBot,TSpielfigur,TKarte, ExtCtrls, StdCtrls,uTFightSystem,uTPokemon,pngimage;
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

uses Unit2;

{$R *.dfm}

var Karte : TKarte1;
var Spielfigur : TSpielfigur1;
var Bot : TBot1;
var Kampf : TFightSystem;
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


    if (Key = 'x') and (Karte.getPosX = -365) and (Karte.getPosY = -50) then ShowMessage('Schild');


    if (Key = 'x') and (abs(Bot.getDistanceY()) <= abs(Bot.getFightDistanceY())) and (abs(Bot.getDistanceX()) <= abs(Bot.getFightDistanceX())) then

      begin
       
       ShowMessage(Bot.startConversation());

       Kampf := TFightSystem.Create(Form1,0,0);
       Pokemon1 := TPokemon.create(Form1,1,3);
       Pokemon2 := TPokemon.create(Form1,2,1);

       Pokemon1.drawPokemon(Form1,130,10);
       Pokemon2.drawPokemon(Form1,20,100);

       Form1.ClientHeight:= 230;
       Form1.ClientWidth:= 250;

      end;


end;



end.
