unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Chocolatey;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    ListBox1: TListBox;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  Choco: TChocolatey;
  S: String;
  L: TStringList;
begin
  Choco:= TChocolatey.Create;
  S:= Choco.Search(Edit1.Text);
  L:= TStringList.Create;
  Choco.DivideLines(S, L);
  ListBox1.Items.Assign(L);
  L.Free;
  Choco.Free;
end;

end.

