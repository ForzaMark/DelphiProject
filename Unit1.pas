unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uTFightInterface;

type
  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

var FightInterface : TFightInterface;

procedure TForm1.FormCreate(Sender: TObject);
var AttackButton : Array[1..4] of TButton;
begin
  FightInterface:=TFightInterface.Create(Form1,0,0);

  AttackButton[1]:=TButton.Create(Self);
  AttackButton[1].Parent:=Self;
  AttackButton[1].Caption:='Attacke 1';
  AttackButton[1].Left:=40;
  AttackButton[1].Top:=550;
  AttackButton[1].Width:=250;
  AttackButton[1].Height:=40;

  AttackButton[2]:=TButton.Create(Self);
  AttackButton[2].Parent:=Self;
  AttackButton[2].Caption:='Attacke 2';
  AttackButton[2].Left:=420;
  AttackButton[2].Top:=550;
  AttackButton[2].Width:=250;
  AttackButton[2].Height:=40;

  AttackButton[3]:=TButton.Create(Self);
  AttackButton[3].Parent:=Self;
  AttackButton[3].Caption:='Attacke 3';
  AttackButton[3].Left:=40;
  AttackButton[3].Top:=645;
  AttackButton[3].Width:=250;
  AttackButton[3].Height:=40;

  AttackButton[4]:=TButton.Create(Self);
  AttackButton[4].Parent:=Self;
  AttackButton[4].Caption:='Attacke 4';
  AttackButton[4].Left:=420;
  AttackButton[4].Top:=645;
  AttackButton[4].Width:=250;
  AttackButton[4].Height:=40;
end;

end.
 