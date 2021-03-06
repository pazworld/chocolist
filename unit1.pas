unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ComCtrls,
  ExtCtrls, Chocolatey, LCLType;

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
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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
  SearchStr, SearchResult: String;
  PackageList: TStringList;
begin
  SearchStr:= Edit1.Text;
  if SearchStr = '' then Exit;

  Choco:= TChocolatey.Create;
  SearchResult:= Choco.Search(Edit1.Text);
  PackageList:= TStringList.Create;
  Choco.DivideLines(SearchResult, PackageList);
  PackageList.Delete(0);
  ListBox1.Items.Assign(PackageList);
  PackageList.Free;
  Choco.Free;
end;

procedure TForm1.Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState
  );
begin
  if Key = VK_RETURN then
  begin
    Button1Click(Sender);
  end;
end;

procedure TForm1.ListBox1Click(Sender: TObject);
var
  ItemIndex, P: Integer;
  UnSelected, IsPackageNumberSelected: Boolean;
  SelectedItem, PackageName, PackageInfo: String;
  SpacePos: Integer;
  Choco: TChocolatey;
begin
  ItemIndex:= ListBox1.ItemIndex;
  UnSelected:= (ItemIndex < 0);
  if UnSelected then Exit;
  IsPackageNumberSelected:= (ItemIndex = (ListBox1.Items.Count - 1));
  if IsPackageNumberSelected then Exit;

  SelectedItem:= ListBox1.Items[ItemIndex];
  SpacePos:= Pos(' ', SelectedItem);
  PackageName:= Copy(SelectedItem, 1, SpacePos - 1);
  Choco:= TChocolatey.Create;
  PackageInfo:= Choco.PackageInfo(PackageName);
  P:= Pos(#13#10, PackageInfo);
  Memo1.Text:= Copy(PackageInfo, P + 2, Length(PackageInfo));
  Choco.Free;
end;

end.

