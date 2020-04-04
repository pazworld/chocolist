unit Chocolatey;

{$mode objfpc}{$H+}

interface
uses
  Classes, SysUtils;

type

  { TChocolatey }

  TChocolatey = class
  public
    function RunChoco: Boolean;
  end;


implementation

{ TChocolatey }

function TChocolatey.RunChoco: Boolean;
begin
  RunChoco:= True;
end;

end.

