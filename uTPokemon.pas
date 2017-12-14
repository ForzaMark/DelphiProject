unit uTPokemon;

interface

uses ExtCtrls, Forms, Sysutils;

type TPokemon = class (TImage)
protected
  FLevel:Integer;
  FNumber:Integer;
  FXP:Integer;
  FMaxHP: Integer;
  FcurrentHP:Integer;
public
  constructor create (Number, Level: Integer); 
  procedure setlevel(Level: Integer);  
  procedure setXP(XP: Integer); 
  procedure setcurrentHP(HP:Integer); 
  //procedure setmaxHP(HP:Integer);
  function getLevel:Integer; 
  function getNumber:Integer; 
  function getXP:Integer; 
  function getmaxHP:Integer;
  function getcurrentHP:Integer; 
  procedure drawPokemon(Formular: TForm; left,top: Integer);
end;

implementation

constructor TPokemon.create (Number, Level: Integer);
begin
  FNumber:= Number;
  FLevel:= Level;
  FMaxHP:= Level*10; //Formel verbessern
end;

procedure TPokemon.setlevel(Level: Integer);
begin
  if (Level<1) or (Level>100) then FLevel:=FLevel
  else FLevel:= Level;
  FMaxHP:= FLevel*10; //Formel verbessern
end

procedure TPokemon.setXP(XP: Integer);
begin
  if Xp<0 then xp:=0;
//jetzt noch immer nach 100xp Level Up -> muss iwann verbessert werden
  if xp>100 then begin
    TPokemon.SetLevel(FLevel+1);
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
  result:= FNUmber;
end;

function TPokemon.getXP:Integer;
begin
  result:=FXP;
end;

function TPokemon.getmaxHP:Integer;
begin
  result:= FMaxHP;
end;

procedure TPokemon.drawPokemon(Form,Left,Top);
begin
  inherited create(Formular);
  Left:=Links;
  Top:=oben;
  Parent:=Formular;
  Autosize:=true;
  Picture.LoadFromFile('Pokemon'+IntToStr(FNumber));
end;

end.
