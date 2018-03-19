//Heimer, Mark & Mann, Tobias
unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,TBot,TSpielfigur,TKarte, ExtCtrls, StdCtrls,uTFightInterface,uTPokemon,pngimage,Unit2,
  SaveGameUnit;

type
  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;
  pokemonChosen,Level : Integer;

implementation

{$R *.dfm}

var Karte : TKarte1;
var Spielfigur : TSpielfigur1;
var Bot : TBot1;
var Kampf : TFightInterface;



procedure TForm1.FormCreate(Sender: TObject);
var SaveGame : TSaveGameRecord;
begin
    Level := 1;
    if existingSaveGame = false
    then  begin
            Karte := TKarte1.Create(Form1,0,0);
            Karte.paintbackground('Level1.png');
          end;
    //nicht funktional --> erzeugt Fehler beim Lades des Kartenbilds
    {else begin
           SaveGame:=getGameProgress;
           with SaveGame do
           begin
             TKarte1.Create(Form1,0,0);
             Karte.paintbackground('newback.bmp');
             Karte.setPosX(XCoordinate);
             Karte.setPosY(YCoordinate);
           end;
         end;}
    Spielfigur := TSpielfigur1.Create(Form1,50,50);
    Bot := TBot1.Create(Form1,375,115) ;
    

    Bot.setFightDistanceX(0);
    Bot.setFightDistanceY(21);
    Bot.setState(false);
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
var src,picsrc : String
begin

//Edit1.Text:= IntToStr(Karte.getPosX);
//Edit2.Text:= IntToStr(Karte.getPosY);

    src:= 'notChoords_level' + IntToStr(Level) + 'txt';

if (key = 'a') and Karte.prooveCoords(Karte.getPosX + 5,Karte.getPosY,src) then
   begin

       Karte.setPosX(5);
       Spielfigur.paintFigur(1);
       Bot.setPosX(5);
       Bot.setDistanceX(Spielfigur.getLeft);
       Bot.setDistanceY(Spielfigur.getTop());
    end;

   if (key = 'd') and Karte.prooveCoords(Karte.getPosX - 5,Karte.getPosY,src) then
   begin
       Karte.setPosX(-5);
       Spielfigur.paintFigur(2);
       Bot.setPosX(-5);
       Bot.setDistanceX(Spielfigur.getLeft);
       Bot.setDistanceY(Spielfigur.getTop());
    end;

    if (key = 's') and Karte.prooveCoords(Karte.getPosX ,Karte.getPosY - 5,src) then
   begin

       Karte.setPosY(-5);
       Spielfigur.paintFigur(4);
       Bot.setPosY(-5);
       Bot.setDistanceX(Spielfigur.getLeft);
       Bot.setDistanceY(Spielfigur.getTop());
    end;


    if (key = 'w') and Karte.prooveCoords(Karte.getPosX ,Karte.getPosY + 5,src) then
   begin

       Karte.setPosY(5);
       Spielfigur.paintFigur(3);
       Bot.setPosY(5);
       Bot.setDistanceX(Spielfigur.getLeft);
       Bot.setDistanceY(Spielfigur.getTop());
    end;


    if (Key = 'x') and (Karte.getPosX = -365) and (Karte.getPosY = -50) then ShowMessage('Sie befinden sich in der Schulstraﬂe\n Gehen sie auf das blaue Feld um auf den Schulhof zu gelangen');


    if (Key = 'x') and (abs(Bot.getDistanceY()) <= abs(Bot.getFightDistanceY())) and (abs(Bot.getDistanceX()) <= abs(Bot.getFightDistanceX())) then
    begin
       ShowMessage(Bot.startConversation());
       Bot.setState(true);
       Application.CreateForm(TForm2, Form2);
       Form1.Visible:= false;
       Form2.Visible:= true;
    end;

    if (key= 'n') and (Karte.getPosX <= -300) and (Karte.getPosY = -85) and (Karte.getPosX >= -325) and (Bot.getState()) then
    begin
         picsrc := 'Level' + IntToStr(Level)+ 'png';
        Karte.paintbackground(picsrc);
    end;

    if (key= 'n') and (Karte.getPosX <= -300) and (Karte.getPosY = -85) and (Karte.getPosX >= -325) and (Bot.getState() <> true) then
    begin
       ShowMessage('K‰mpfe erstmal');
    end;

    if (key = 'y') then saveGameProgress(Karte.getPosX, Karte.getPosY, 1);

end;

end.
 
