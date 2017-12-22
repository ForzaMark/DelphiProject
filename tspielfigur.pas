unit Tspielfigur;

{$mode objfpc}{$H+}

interface

uses ExtCtrls, Forms, SysUtils;

type TSpielfigur1 = class(TImage)

  protected


  public
    constructor Create(Formular : TForm; Links,Oben : Integer);
    procedure paintFigur(number : Integer);
    function getTop():Integer;
    function getLeft:Integer;

end;

implementation

Constructor TSpielfigur1.Create(Formular :TForm; Links,Oben :Integer);
begin
    inherited Create(Formular);

    Left := Links;
    Top:= Oben;
    Parent := Formular;
    Autosize:= True;
    Picture.LoadFromFile('charakterdown.png');

end;


procedure TSpielfigur1.paintFigur(number : Integer);
begin

    if number = 1 then Picture.LoadFromFile('charakterleft.png') ;
    if number = 2 then Picture.LoadFromFile('charakterright.png') ;
    if number = 3 then Picture.LoadFromFile('charakterup.png') ;
    if number = 4 then Picture.LoadFromFile('charakterdown.png') ;




end;

function TSpielfigur1.getTop:Integer;
begin
    Result:= Top;
end;

function Tspielfigur1.getLeft : Integer;
begin
    Result:=Left;
end;

end.

