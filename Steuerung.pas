unit Steuerung;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Buttons,
  ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    bg: TImage;
    charakter: TSpeedButton;
    procedure FormKeyPress(Sender: TObject; var Key: char);

  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

// Wenn irgendwas auf der Tastatur gedrückt wird wird diese Routine angesprochen

procedure TForm1.FormKeyPress(Sender: TObject; var Key: char);

begin

  //key ist der Knopf der Tastatur 
  if key = 'a' and Karte1.prooveX(bg.Left) then bg.Left:= bg.Left +5;
  if key = 'd' and Karte1.prooveX(bg.Left) then bg.Left := bg.Left-5;
  if key = 'w' and Karte1.prooveY(bg.top) then bg.top := bg.top +5;
  if key = 's' and Karte1.prooveY(bg.top) then bg.top := bg.top -5;

end;


end.

