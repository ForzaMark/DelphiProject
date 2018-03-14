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
    procedure AttackButton1Click(Sender: TObject); //!
    procedure AttackButton2Click(Sender: TObject); //!
    procedure AttackButton3Click(Sender: TObject); //!
    procedure AttackButton4Click(Sender: TObject); //!
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
  AttackButton1,AttackButton2, AttackButton3, AttackButton4 : TButton; //!
  HPLabel1, HPLabel2, XPLabel, NameLabel2: TLabel; //!

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
var NameLabel1: TLabel;
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


    if (Key = 'x') and (Karte.getPosX = -365) and (Karte.getPosY = -50) then ShowMessage('Sie befinden sich in der Schulstraﬂe\n Gehen sie auf das blaue Feld um auf den Schulhof zu gelangen');


    if (Key = 'x') and (abs(Bot.getDistanceY()) <= abs(Bot.getFightDistanceY())) and (abs(Bot.getDistanceX()) <= abs(Bot.getFightDistanceX())) then

      begin

       ShowMessage(Bot.startConversation());

       Kampf := TFightInterface.Create(Form1,0,0);
       Pokemon1 := TPokemon.create(Form1,1,4,true); //!
       Pokemon2 := TPokemon.create(Form1,2,5,false); //!

       Pokemon1.drawPokemon(Form1,410,70); //!
       Pokemon2.drawPokemon(Form1,60,345); //!

       Form1.ClientHeight:= 720;
       Form1.ClientWidth:= 720;

       begin

  AttackButton1:=TButton.Create(Self);
  AttackButton1.Parent:=Self;
  AttackButton1.Caption:=Pokemon2.getattacke1.Name + ' ' + IntToStr(Pokemon2.getattacke1.AP); //!
  AttackButton1.Left:=40;
  AttackButton1.Top:=550;
  AttackButton1.Width:=250;
  AttackButton1.Height:=40;
  AttackButton1.OnClick:= Attackbutton1click;   //!

  AttackButton2:=TButton.Create(Self);
  AttackButton2.Parent:=Self;
  AttackButton2.Caption:=Pokemon2.getattacke2.Name + ' ' + IntToStr(Pokemon2.getattacke2.AP); //!
  AttackButton2.Left:=420;
  AttackButton2.Top:=550;
  AttackButton2.Width:=250;
  AttackButton2.Height:=40;
  AttackButton2.OnClick:= Attackbutton2click; //!

  AttackButton3:=TButton.Create(Self);
  AttackButton3.Parent:=Self;
  AttackButton3.Caption:=Pokemon2.getattacke3.Name + ' ' + IntToStr(Pokemon2.getattacke3.AP); //!
  AttackButton3.Left:=40;
  AttackButton3.Top:=645;
  AttackButton3.Width:=250;
  AttackButton3.Height:=40;
  AttackButton3.OnClick:= Attackbutton3click; //!

  AttackButton4:=TButton.Create(Self);
  AttackButton4.Parent:=Self;
  AttackButton4.Caption:= Pokemon2.getattacke4.Name + ' ' + IntToStr(Pokemon2.getattacke4.AP); //!
  AttackButton4.Left:=420;
  AttackButton4.Top:=645;
  AttackButton4.Width:=250;
  AttackButton4.Height:=40;
  AttackButton4.OnClick:= Attackbutton4click;  //!

// ab hier alles neu
  HPLabel1:=TLabel.Create(Self);
  with HPLabel1 do begin
    Parent:=self;
    Top:= 165;
    Left:= 25;
    Width:=80;
    Height:=20;
    Caption:= 'HP: '+ IntToStr(Pokemon1.getcurrentHP)+'/'+ IntToStr(Pokemon1.getmaxHP);
    Font.Size:= 20;
  end;

  HPLabel2:=TLabel.Create(Self);
  with HPLabel2 do begin
    Parent:=self;
    Top:= 416;
    Left:= 400;
    Width:=80;
    Height:=20;
    Caption:= 'HP: '+ IntToStr(Pokemon2.getcurrentHP)+'/'+ IntToStr(Pokemon2.getmaxHP);
    Font.Size:= 20;
  end;

  XPLabel:=TLabel.Create(Self);
  with XPLabel do begin
    Parent:=self;
    Top:= 447;
    Left:= 400;
    Width:=80;
    Height:=20;
    Caption:= 'XP: '+ IntToStr(Pokemon2.getXP)+'/100';
    Font.Size:= 15;
  end;

  NameLabel1:=TLabel.Create(Self);
  with NAmeLabel1 do begin
    Parent:=self;
    Top:= 135;
    Left:= 25;
    Width:=80;
    Height:=20;
    Caption:= Pokemon1.getName + ' Lvl.' + IntToStr(Pokemon1.getLevel);
    Font.Size:= 25;
  end;
  NameLabel2:=TLabel.Create(Self);
  with NameLabel2 do begin
    Parent:=self;
    Top:= 385;
    Left:= 400;
    Width:=80;
    Height:=20;
    Caption:= Pokemon2.getName + ' Lvl.' + IntToStr(Pokemon2.getLevel);
    Font.Size:= 25;
  end;
end;

end;


end;

procedure TForm1.AttackButton1Click(sender:TObject);
begin
  Pokemon2.Angriff(Pokemon1,1);
  if Pokemon1.getcurrentHP<>0 then Pokemon1.Angriff(Pokemon2,1);
  AttackButton1.Caption:=Pokemon2.getattacke1.Name + ' ' + IntToStr(Pokemon2.getattacke1.AP);
  HPLabel2.Caption:= 'HP: '+ IntToStr(Pokemon2.getcurrentHP)+'/'+ IntToStr(Pokemon2.getmaxHP);
  HPLabel1.Caption:= 'HP: '+ IntToStr(Pokemon1.getcurrentHP)+'/'+ IntToStr(Pokemon1.getmaxHP);
  XPLabel.Caption:= 'XP: '+ IntToStr(Pokemon2.getXP)+'/100';
  NameLabel2.Caption:= Pokemon2.getName + ' Lvl.' + IntToStr(Pokemon2.getLevel);
  if Pokemon1.getcurrentHP <= 0 then showmessage('Du hast gewonnen!');
  if Pokemon2.getcurrentHP <= 0 then showmessage('Du hast verloren...');
end;

procedure TForm1.AttackButton2Click(sender:TObject);
begin
  Pokemon2.Angriff(Pokemon1,2);
  if Pokemon1.getcurrentHP<>0 then Pokemon1.Angriff(Pokemon2,1);
  AttackButton2.Caption:=Pokemon2.getattacke2.Name + ' ' + IntToStr(Pokemon2.getattacke2.AP);
  HPLabel2.Caption:= 'HP: '+ IntToStr(Pokemon2.getcurrentHP)+'/'+ IntToStr(Pokemon2.getmaxHP);
  HPLabel1.Caption:= 'HP: '+ IntToStr(Pokemon1.getcurrentHP)+'/'+ IntToStr(Pokemon1.getmaxHP);
  XPLabel.Caption:= 'XP: '+ IntToStr(Pokemon2.getXP)+'/100';
  NameLabel2.Caption:= Pokemon2.getName + ' Lvl.' + IntToStr(Pokemon2.getLevel);
  if Pokemon1.getcurrentHP <= 0 then showmessage('Du hast gewonnen!');
  if Pokemon2.getcurrentHP <= 0 then showmessage('Du hast verloren...');
end;

procedure TForm1.AttackButton3Click(sender:TObject);
begin
  Pokemon2.Angriff(Pokemon1,3);
  if Pokemon1.getcurrentHP<>0 then Pokemon1.Angriff(Pokemon2,1);
  AttackButton3.Caption:=Pokemon2.getattacke3.Name + ' ' + IntToStr(Pokemon2.getattacke3.AP);
  HPLabel2.Caption:= 'HP: '+ IntToStr(Pokemon2.getcurrentHP)+'/'+ IntToStr(Pokemon2.getmaxHP);
  HPLabel1.Caption:= 'HP: '+ IntToStr(Pokemon1.getcurrentHP)+'/'+ IntToStr(Pokemon1.getmaxHP);
  XPLabel.Caption:= 'XP: '+ IntToStr(Pokemon2.getXP)+'/100';
  NameLabel2.Caption:= Pokemon2.getName + ' Lvl.' + IntToStr(Pokemon2.getLevel);
  if Pokemon1.getcurrentHP <= 0 then showmessage('Du hast gewonnen!');
  if Pokemon2.getcurrentHP <= 0 then showmessage('Du hast verloren...');
end;

procedure TForm1.AttackButton4Click(sender:TObject);
begin
  Pokemon2.Angriff(Pokemon1,4);
  if Pokemon1.getcurrentHP<>0 then Pokemon1.Angriff(Pokemon2,1);
  AttackButton4.Caption:=Pokemon2.getattacke4.Name + ' ' + IntToStr(Pokemon2.getattacke4.AP);
  HPLabel2.Caption:= 'HP: '+ IntToStr(Pokemon2.getcurrentHP)+'/'+ IntToStr(Pokemon2.getmaxHP);
  HPLabel1.Caption:= 'HP: '+ IntToStr(Pokemon1.getcurrentHP)+'/'+ IntToStr(Pokemon1.getmaxHP);
  XPLabel.Caption:= 'XP: '+ IntToStr(Pokemon2.getXP)+'/100';
  NameLabel2.Caption:= Pokemon2.getName + ' Lvl.' + IntToStr(Pokemon2.getLevel);
  if Pokemon1.getcurrentHP <= 0 then showmessage('Du hast gewonnen!');
  if Pokemon2.getcurrentHP <= 0 then showmessage('Du hast verloren...');
end;



end.
