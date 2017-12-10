unit Unit1;

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


procedure TForm1.FormKeyPress(Sender: TObject; var Key: char);

begin

  if key = 'a' then bg.Left:= bg.Left +5;
  if key = 'd' then bg.Left := bg.Left-5;
  if key = 'w' then bg.top := bg.top +5;
  if key = 's' then bg.top := bg.top -5;

end;


end.

