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
      procedure prooveX(pos : Integer);
      procedure prooveY(pos : Integer);

uses
  Classes, SysUtils;

implementation

end.

