unit Chocolatey;

{$mode objfpc}{$H+}

interface
uses
  Classes, Process, SysUtils;

type

  { TChocolatey }

  TChocolatey = class
  public
    function Search(AString: String): String;
    procedure DivideLines(AString: String; AList: TStringList);
    function PackageInfo(AString: String): String;
  end;


implementation

const
  CHOCO = 'C:\ProgramData\chocolatey\bin\choco.exe';


{ TChocolatey }

function TChocolatey.Search(AString: String): String;
begin
  RunCommand(CHOCO, ['list', AString], Result);
end;

procedure TChocolatey.DivideLines(AString: String; AList: TStringList);
var
  CrPos: Integer;
  StringBeforeCr: String;
begin
  AList.Clear;
  CrPos:= Pos(#13#10, AString);
  while CrPos >= 1 do
  begin
    StringBeforeCr:= Copy(AString, 1, CrPos - 1);
    AList.Add(StringBeforeCr);
    AString:= Copy(AString, CrPos + 2, Length(AString));
    CrPos:= Pos(#13#10, AString);
  end
end;

function TChocolatey.PackageInfo(AString: String): String;
begin
  RunCommand(CHOCO, ['info', AString], Result);
end;

end.

