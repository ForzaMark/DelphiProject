unit uTFightSystem;


interface

uses SysUtils,ExtCtrls,Forms,uTPokemon{,FightProcedures};

type TAttacke = record
  Name: String[20];
  Typ: String[10];
  Staerke: Integer;
  AP: Integer;
end;
type TFightSystem = class(TImage)
  protected
    FAttacke : Array[1..4] of TAttacke;
    FEndOfFight : Boolean;
    FAttackChosen : TAttacke;
  public
    Constructor Create(Formular:TForm;L,O:Integer);
    procedure chooseAttack(AttackNumber:Integer);
    procedure setAttack1OfPkmn(AttackNumber:Integer);
    //procedure setAttack2OfPkmn(AttackNumber:Integer);
    //procedure setAttack3OfPkmn(AttackNumber:Integer);
    //procedure setAttack4OfPkmn(AttackNumber:Integer);
    function getAttack1OfPkmn:TAttacke;
    //function getAttack2OfPkmn:TAttacke;
    //function getAttack3OfPkmn:TAttacke;
    //function getAttack4OfPkmn:TAttacke;
  end;


implementation


Constructor TFightSystem.Create(Formular:TForm;L,O:Integer);
begin
  inherited Create(Formular);
  Autosize:=True;
  Parent:=Formular;
  Left:=L;
  Top:=O;
  Picture.LoadFromFile('InterfaceFight2.bmp');
  FEndOfFight:=false;

end;


procedure TFightSystem.chooseAttack(AttackNumber:Integer);
begin
  FAttackChosen:=FAttacke[AttackNumber];
end;

procedure TFightSystem.setAttack1OfPkmn(AttackNumber:Integer);
var    f : File of TAttacke;
Attacke : TAttacke;
i : Integer;
begin
  AssignFile(f,'Attacken.txt');
  Reset(f);
  Seek(f,AttackNumber);
  Read(f,Attacke);
  for i:=1 to 4 do FAttacke[i]:=Attacke;
  CloseFile(f);
end;

{procedure TFightSystem.setAttack2OfPkmn(AttackNumber:Integer);
var    f : File of TAttacke;
Attacke : TAttacke;
begin
  AssignFile(f,'Attacken.txt');
  Reset(f);
  Seek(f,AttackNumber);
  Read(f,Attacke);
  FAttacke[2]:=Attacke;
  CloseFile(f);
end;

procedure TFightSystem.setAttack3OfPkmn(AttackNumber:Integer);
var    f : File of TAttacke;
Attacke : TAttacke;
begin
  AssignFile(f,'Attacken.txt');
  Reset(f);
  Seek(f,AttackNumber);
  Read(f,Attacke);
  FAttacke[3]:=Attacke;
  CloseFile(f);
end;

procedure TFightSystem.setAttack4OfPkmn(AttackNumber:Integer);
var    f : File of TAttacke;
Attacke : TAttacke;
begin
  AssignFile(f,'Attacken.txt');
  Reset(f);
  Seek(f,AttackNumber);
  Read(f,Attacke);
  FAttacke[4]:=Attacke;
  CloseFile(f);
end;    }

function TFightSystem.getAttack1OfPkmn:TAttacke;
var i : Integer;
begin
  for i:=1 to 4 do Result:=FAttacke[i];
end;

{function TFightSystem.getAttack2OfPkmn:TAttacke;
begin
  Result:=FAttacke[2];
end;

function TFightSystem.getAttack3OfPkmn:TAttacke;
begin
  Result:=FAttacke[3];
end;

function TFightSystem.getAttack4OfPkmn:TAttacke;
begin
  Result:=FAttacke[4];
end;   }

end.
