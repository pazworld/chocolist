unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ComCtrls,
  ExtCtrls, Chocolatey;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    ListBox1: TListBox;
    Memo1: TMemo;
    Panel1: TPanel;
    Splitter1: TSplitter;
    StatusBar1: TStatusBar;
    procedure Button1Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
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

procedure TForm1.ListBox1Click(Sender: TObject);
var
  S, S2, S3: String;
  P: Integer;
  Choco: TChocolatey;
begin
  S:= ListBox1.Items[ListBox1.ItemIndex];
  P:= Pos(' ', S);
  S2:= Copy(S, 1, P - 1);
  Choco:= TChocolatey.Create;
  S3:= Choco.PackageInfo(S2);
  Memo1.Text:= S3;
  Choco.Free;
end;

end.

