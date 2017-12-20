unit uTPokemon;

interface

uses ExtCtrls, Forms, SysUtils;

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
public
  constructor create (Formular:TForm;Number, Level: Integer);
  procedure setlevel(Level: Integer);
  procedure setXP(XP: Integer);
  procedure setcurrentHP(HP:Integer);
  function getLevel:Integer; 
  function getNumber:Integer; 
  function getXP:Integer; 
  function getmaxHP:Integer;
  function getcurrentHP:Integer;
  procedure drawPokemon(Formular: TForm; links,oben: Integer);
  function getName:String;
  function getType1:String;
  function getType2:String;
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
begin
  inherited Create(Formular); 
  assignfile(f,'FileOfTPokemonRecord.txt') ; //File in dem alle Pokemon der 1. Generation gespeichert sind
  reset(f);
  seek(f,Number-1);
  read(f,pokemon);
  FName:= pokemon.Name;
  FType1:= pokemon.Type1;
  FType2:= pokemon.Type2;
  FNumber:= pokemon.Number;
  closefile(f);
  if (Level<1) or (Level>100) then FLevel:=1
  else FLevel:= Level;FLevel:=Level;
  FMaxHP:= FLevel*10; //verbesserungswürdig
end;

procedure TPokemon.setlevel(Level: Integer);
begin
  if (Level<1) or (Level>100) then FLevel:=FLevel
  else FLevel:= Level;
  FMaxHP:= FLevel*10; //verbesserungswürdig
end;

procedure TPokemon.setXP(XP: Integer);
begin
  if Xp<0 then xp:=0;
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

//Hab hier erstmal einfach das übernommen, was wir bei der Ampelsache vorgegeben gekriegt hatten. 
//Kann gut sein, dass da noch ziemlich viel fehlt
procedure TPokemon.drawPokemon(Formular: TForm; links,oben: Integer);
begin
  Left:=Links;
  Top:=oben;
  Parent:=Formular;
  Autosize:=true;
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

end.
