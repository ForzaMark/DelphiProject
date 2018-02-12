unit uTFightInterface;


interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,ExtCtrls;


type TFightInterface = class(TImage)
  protected
  public
    Constructor Create(Formular:TForm;L,O:Integer);
  end;


implementation


Constructor TFightInterface.Create(Formular:TForm;L,O:Integer);
var AttackButton : Array[1..4] of TButton;
begin
  inherited Create(Formular);
  Autosize:=True;
  Parent:=Formular;
  Left:=L;
  Top:=O;
  Picture.LoadFromFile('InterfaceFight.bmp');

end;





end.
