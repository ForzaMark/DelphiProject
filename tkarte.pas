unit TKarte;

{$mode objfpc}{$H+}

interface

protected
         FPosX : Integer;
         FPosY : Integer;

private
      function getPosX(): Integer;
      function getPosY(): Integer;
      procedure setPosX(pos : Integer);
      procedure setPosY(pos : Integer);

public
      procedure prooveX(pos : Integer):Boolean;
      procedure prooveY(pos : Integer):Boolean;

uses
  Classes, SysUtils;

implementation


// Create reinpacken !!


procedure prooveX(pos:Integer):Boolean
begin
         Zahl:=1;
         for i:= 1 to nichtzubetreten[i].length do
         begin
             if pos = nichtzubetreten[i] then Zahl := -1;
         end;
         
         if Zahl = -1 then Result:= false ;
         else Result:= true;
         
end;

end.

