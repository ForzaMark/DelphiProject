unit Tspielfigur;

{$mode objfpc}{$H+}

interface

uses ExtCtrls, Forms, SysUtils;

type TSpielfigur1 = class(TImage)

  protected


  public
    constructor Create(Formular : TForm; Links,Oben : Integer);

end;

implementation

Constructor TSpielfigur1.Create(Formular :TForm; Links,Oben :Integer);
begin
    inherited Create(Formular);

    Left := Links;
    Top:= Oben;
    Parent := Formular;
    Autosize:= True;
    Picture.LoadFromFile('charakterI.png');

end;

end.

