unit uTPokemon;

interface

uses ExtCtrls, Forms, SysUtils;


type TAttacke = record
  Name: String[20];
  Typ: String[10];
  Staerke: Integer;
  AP: Integer;
end;


type TPokemon = class(TImage)
protected
  FType1: String[10];  //wenn Pokemon nur einen Typ hat sind Typ 1 und 2 gleich
  FType2: String[10];
  FName: String[30];
  FLevel:Integer;
  FNumber:Integer;
  FXP:Integer;
  FMaxHP: Integer;
  FcurrentHP:Integer;

  FAttacken: array[1..4] of TAttacke;

public
  constructor create (Formular:TForm;Number, Level: Integer);
  procedure setlevel(Level: Integer);
  procedure setXP(XP: Integer);
  procedure setcurrentHP(HP:Integer);

  function getLevel:Integer;
  function getNumber:Integer;
  function getXP:Integer;

  function getLevel:Integer; 
  function getNumber:Integer; 
  function getXP:Integer; 

  function getmaxHP:Integer;
  function getcurrentHP:Integer;
  procedure drawPokemon(Formular: TForm; links,oben: Integer);
  function getName:String;
  function getType1:String;
  function getType2:String;

  function getAttacke1: TAttacke;
  function getAttacke2: TAttacke;
  function getAttacke3: TAttacke;
  function getAttacke4: TAttacke;


end;

implementation

constructor TPokemon.create(Formular:TForm;Number, Level: Integer);
type TPokemonRecord=record
    Number: Integer;
    Name: String[30];
    Type1: String[10];
    Type2: String[10];
  end;
var f: File of TPokemonRecord;
  pokemon: TPokemonRecord;

  g: File of TAttacke;
  i,j: Integer;
  Attacke: TAttacke;

begin
  inherited Create(Formular); 
  assignfile(f,'FileOfTPokemonRecord.txt') ; //File in dem alle Pokemon der 1. Generation gespeichert sind
  reset(f);
  seek(f,Number-1);
  read(f,pokemon);

  if pokemon.Type1 = 'Fire' then FType1:='Feuer';
  if pokemon.Type1 = 'Water' then FType1:='Wasser';
  if pokemon.Type1 = 'Grass' then FType1:='Pflanze';
  if pokemon.Type1 = 'Bug' then FType1:='Käfer';
  if pokemon.Type1 = 'Ghost' then FType1:='Geist';
  if pokemon.Type1 = 'Dragon' then FType1:='Drache';
  if pokemon.Type1 = 'Flying' then FType1:='Flug';
  if pokemon.Type1 = 'Electric' then FType1:='Elektro';
  if pokemon.Type1 = 'Psychic' then FType1:='Psycho';
  if pokemon.Type1 = 'Ice' then FType1:='Eis';
  if pokemon.Type1 = 'Poison' then FType1:='Gift';
  if pokemon.Type1 = 'Rock' then FType1:='Gestein';
  if pokemon.Type1 = 'Ground' then FType1:='Boden';
  if pokemon.Type1 = 'Fight' then FType1:='Kampf';
  if pokemon.Type2 = 'Fire' then FType2:='Feuer';
  if pokemon.Type2 = 'Water' then FType2:='Wasser';
  if pokemon.Type2 = 'Grass' then FType2:='Pflanze';
  if pokemon.Type2 = 'Bug' then FType2:='Käfer';
  if pokemon.Type2 = 'Ghost' then FType2:='Geist';
  if pokemon.Type2 = 'Dragon' then FType2:='Drache';
  if pokemon.Type2 = 'Flying' then FType2:='Flug';
  if pokemon.Type2 = 'Electric' then FType2:='Elektro';
  if pokemon.Type2 = 'Psychic' then FType2:='Psycho';
  if pokemon.Type2 = 'Ice' then FType2:='Eis';
  if pokemon.Type2 = 'Poison' then FType2:='Gift';
  if pokemon.Type2 = 'Rock' then FType2:='Gestein';
  if pokemon.Type2 = 'Ground' then FType2:='Boden';
  if pokemon.Type2 = 'Fight' then FType2:='Kampf';
  FName:= pokemon.Name;

  FName:= pokemon.Name;
  FType1:= pokemon.Type1;
  FType2:= pokemon.Type2;

  FNumber:= pokemon.Number;
  closefile(f);
  if (Level<1) or (Level>100) then FLevel:=1
  else FLevel:= Level;FLevel:=Level;

  FMaxHP:= FLevel*10; //verbesserungswÃ¼rdig
   Assignfile(g,'Attacken.txt');
  i:= random(100)+1;
  j:=1;
  reset(g);
  repeat
    seek(g,i);
    read(g,Attacke);
    if (Attacke.Typ = 'Normal') or (Attacke.Typ = FType2) or (Attacke.Typ = FType1) then begin
      FAttacken[j]:=Attacke;
      Inc(j);
    end;
    Inc(i);
    if i>100 then i:=1;
  until j>4;
  closefile(g);

  FMaxHP:= FLevel*10; //verbesserungswürdig

end;

procedure TPokemon.setlevel(Level: Integer);
begin
  if (Level<1) or (Level>100) then FLevel:=FLevel
  else FLevel:= Level;

  FMaxHP:= FLevel*10; //verbesserungswÃ¼rdig

  FMaxHP:= FLevel*10; //verbesserungswürdig

end;

procedure TPokemon.setXP(XP: Integer);
begin
  if Xp<0 then xp:=0;

//immer nach 100xp Level Up (verbesserungswÃ¼rdig)

//immer nach 100xp Level Up (verbesserungswürdig)

  if xp>100 then begin
    SetLevel(FLevel+1);
    xp:= xp-100;
  end;
  FXP:=XP;
end;

procedure TPokemon.setcurrentHP(HP:Integer);
begin
  if HP > FMaxHP then HP:=fMaxHP;
  FcurrentHP:=HP;
end;

function TPokemon.getcurrentHP:Integer;
begin
  result:= FcurrentHP;
end;

function TPokemon.getLevel:Integer;
begin
  result:= FLevel;
end;

function TPokemon.getNumber:Integer;
begin
  result:= FNumber;
end;

function TPokemon.getXP:Integer;
begin
  result:=FXP;
end;

function TPokemon.getmaxHP:Integer;
begin
  result:= FMaxHP;
end;


//Hab hier erstmal einfach das Ã¼bernommen, was wir bei der Ampelsache vorgegeben gekriegt hatten. 

//Hab hier erstmal einfach das übernommen, was wir bei der Ampelsache vorgegeben gekriegt hatten. 

//Kann gut sein, dass da noch ziemlich viel fehlt
procedure TPokemon.drawPokemon(Formular: TForm; links,oben: Integer);
begin
  Left:=Links;
  Top:=oben;
  Parent:=Formular;
  Autosize:=true;

  Picture.LoadFromFile('Pokemon'+IntToStr(FNumber)+'.bmp'); //Die Bilder mÃ¼ssen noch rausgesucht werden

  Picture.LoadFromFile('Pokemon'+IntToStr(FNumber)+'.bmp'); //Die Bilder müssen noch rausgesucht werden

end;    

function TPokemon.getName:String;
begin
  result:=FName;
end;

function TPokemon.getType1:String;
begin
  result:=FType1;
end;

function TPokemon.getType2:String;
begin
  result:=FType2;
end;


function TPokemon.getAttacke1: TAttacke;
begin
  result:=FAttacken[1];
end;

function TPokemon.getAttacke2: TAttacke;
begin
  result:=FAttacken[2];
end;

function TPokemon.getAttacke3: TAttacke;
begin
  result:=FAttacken[3];
end;

function TPokemon.getAttacke4: TAttacke;
begin
  result:=FAttacken[4];
end;


end.
