unit TBot;

{$mode objfpc}{$H+}

interface

uses ExtCtrls, Forms, SysUtils;

type TBot1 = class(TImage)

  protected

    FPosX : Integer;
    FPosY : Integer;
    FDistanceX : Integer;
    FDistanceY : Integer;
    FFightDistanceX : Integer;
    FFightDistanceY : Integer;


  public
    constructor Create(Formular : TForm; Links,Oben : Integer);
    function getPosX():Integer;
    procedure setPosX (pos : Integer) ;
    function getPosY():Integer;
    procedure setPosY (pos : Integer) ;
    function getDistanceX():Integer;
    procedure setDistanceX (char_pos_X : Integer) ;
    function getDistanceY():Integer;
    procedure setDistanceY (char_pos_Y : Integer) ;
    function getFightDistanceX():Integer;
    procedure setFightDistanceX(pos : Integer);
    function getFightDistanceY():Integer;
    procedure setFightDistanceY(pos : Integer);
    function startConversation() : String;

end;

implementation

Constructor TBot1.Create(Formular :TForm; Links,Oben :Integer);
begin
    inherited Create(Formular);

    Left := Links;
    Top:= Oben;
    Parent := Formular;
    Autosize:= True;
    Picture.LoadFromFile('charakterdown.png');
    FPosX := Links;
    FPosY := Oben;
    FDistanceX := 100;

end;

function TBot1.getPosX():Integer;
begin
    Result:=FPosX;
end;

function TBot1.getPosY():Integer;
begin
    Result := FPosY;
end;

procedure TBot1.setPosX(pos : Integer);
begin

    FposX:= FPosX + pos;
   Left := FPosX;
end ;

procedure TBot1.setPosY(pos : Integer);
begin
  FPosY := FPosY + pos;
   Top := FPosY;

end;

function TBot1.getDistanceX():Integer;
begin
   Result:= FDistanceX;
end;

procedure TBot1.setDistanceX(char_pos_X : Integer);
begin

   FDistanceX := (FPosX-char_pos_X)



end;

function TBot1.getDistanceY():Integer;
begin
   Result:= FDistanceY;
end;

procedure TBot1.setDistanceY(char_pos_Y : Integer);
begin

   FDistanceY := (FPosY-char_pos_Y)



end;


function TBot1.getFightDistanceX : Integer;
begin
   Result := FFightDistanceX;
end;

procedure TBot1.setFightDistanceX(pos : Integer);
begin
   FFightDistanceX:= pos;
end;

function TBot1.getFightDistanceY : Integer;
begin
   Result := FFightDistanceY;
end;

procedure TBot1.setFightDistanceY(pos : Integer);
begin
   FFightDistanceY:= pos;
end;

function TBot1.startConversation() : String;
begin

   Result := 'Lass uns kämpfen !';


end;

end.

