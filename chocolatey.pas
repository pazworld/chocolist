unit Chocolatey;

{$mode objfpc}{$H+}

interface
uses
  Classes, Process, SysUtils;

type

  { TChocolatey }

  TChocolatey = class
  public
    function RunChoco: Boolean;
    function Search(AString: String): String;
  end;


implementation

{ TChocolatey }

function TChocolatey.RunChoco: Boolean;
const
  CHOCO = 'C:\ProgramData\chocolatey\bin\choco.exe';
var
  CmdOutput: String;
begin
  RunCommand(CHOCO, [], CmdOutput);
  RunChoco:= (Pos('Chocolatey', CmdOutput) >= 1);
end;

function TChocolatey.Search(AString: String): String;
const
  CHOCO = 'C:\ProgramData\chocolatey\bin\choco.exe';
begin
  RunCommand(CHOCO, ['list', AString], Result);
end;

end.

