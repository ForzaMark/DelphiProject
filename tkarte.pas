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
   FPosX := pos;
end ;

procedure TKarte1.setPosY(pos : Integer);
begin
  FPosY := pos

end;


function TKarte1.prooveX(pos:Integer):Boolean ;
var Zahl : Integer;
begin
         {Zahl:=1;
         for i:= 1 to nichtzubetreten[i].length do
         begin
             // Da muss sowas wie pos+5/pos-5 hin !!!
             if pos = nichtzubetreten[i] then Zahl := -1;
         end;

         if Zahl = -1 then Result:= false ;
         else Result:= true;}

         if FNichtBetretenX[1] = pos then Result := true
         else Result := false;
         
end;

function TKarte1.prooveY(pos:Integer):Boolean;
begin

end;

end.

