unit TKarte;

interface

uses ExtCtrls, Forms, SysUtils;

type TKarte1 = class(TImage)

  protected
   FPosX : Integer;
   FPosY : Integer;
   FNichtBetretenX : Array[1..5] of Integer;
   FNichtBetretenY: Array[1..5] of Integer;

  public
    constructor Create(Formular : TForm; Links,Oben : Integer);
    procedure paintbackground(source : String);
    function getPosX():Integer;
    function getPosY():Integer;
    procedure setPosX(pos:Integer);
    procedure setPosY(pos:Integer);
    function prooveX(pos:Integer):Boolean;
    function prooveY(pos:Integer):Boolean;

end;

implementation

Constructor TKarte1.Create(Formular :TForm; Links,Oben :Integer);
begin
    inherited Create(Formular);

    Left := Links;
    Top:= Oben;
    Parent := Formular;
    Autosize:= True;
    FNichtBetretenX[1]:= 0;

end;

procedure TKarte1.paintbackground(source : String);
begin
Picture.LoadFromFile(source);

end;

function TKarte1.getPosX():Integer;
begin
    Result:=FPosX;
end;

function TKarte1.getPosY():Integer;
begin
    Result := FPosY;
end;

procedure TKarte1.setPosX(pos : Integer);
begin
   FPosX := FPosX + pos;
   Left := FPosX;
end ;

procedure TKarte1.setPosY(pos : Integer);
begin
  FPosY := FPosY + pos;
   Top := FPosY;

end;


function TKarte1.prooveX(pos :Integer):Boolean ;
var Zahl : Integer;
var Datei : TextFile;
var Zeile : String;
begin
         Zahl:=1;
         AssignFile(Datei,'notX.txt');
         Reset(Datei);
         repeat
           ReadLn(Datei,Zeile);
           if pos = StrToInt(Zeile) then Zahl := -1;
         until EOF(Datei);
         CloseFile(Datei);

         if Zahl = -1 then Result:= false
         else Result:= true;


         
end;

function TKarte1.prooveY(pos:Integer):Boolean;
var Zahl : Integer;
var Datei : TextFile;
var Zeile : String;
begin
         Zahl:=1;
         AssignFile(Datei,'notY.txt');
         Reset(Datei);
         repeat
           ReadLn(Datei,Zeile);
           if pos = StrToInt(Zeile) then Zahl := -1;
         until EOF(Datei);
         CloseFile(Datei);

         if Zahl = -1 then Result:= false
         else Result:= true;



end;

end.

