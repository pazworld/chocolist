unit TestCase1;

{$mode objfpc}{$H+}

interface

uses
  chocolatey, Classes, SysUtils, fpcunit, testutils, testregistry;

type

  { TTestCase1 }

  TTestCase1= class(TTestCase)
  private
    FChoco: TChocolatey;
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure RunChoco;
    procedure Search;
    procedure TestHookUp;
  end;

implementation

procedure TTestCase1.TestHookUp;
begin

end;

procedure TTestCase1.SetUp;
begin
  FChoco:= TChocolatey.Create;
end;

procedure TTestCase1.TearDown;
begin
  FChoco.Free;
end;

procedure TTestCase1.RunChoco;
var
  ChocoIsRun: Boolean;
begin
  ChocoIsRun:= FChoco.RunChoco;
  AssertTrue(ChocoIsRun);
end;

procedure TTestCase1.Search;
var
  PackageString: String;
  IsChocoRun: Boolean;
begin
  PackageString:= FChoco.Search('pascal');
  IsChocoRun:= (Pos('Chocolatey', PackageString) >= 1);
  Assert(IsChocoRun);
end;

initialization

  RegisterTest(TTestCase1);
end.

