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
    procedure Search;
    procedure DivideLines;
    procedure PackageInfo;
  end;

implementation

procedure TTestCase1.SetUp;
begin
  FChoco:= TChocolatey.Create;
end;

procedure TTestCase1.TearDown;
begin
  FChoco.Free;
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

procedure TTestCase1.DivideLines;
var
  DividedLines: TStringList;
begin
  DividedLines:= TStringList.Create;
  FChoco.DivideLines('abc' + #13#10 + 'def' + #13#10, DividedLines);
  AssertEquals(2, DividedLines.Count);
  FChoco.DivideLines('ghi' + #13#10 + 'jkl' + #13#10 + 'mno' + #13#10, DividedLines);
  AssertEquals(3, DividedLines.Count);
  DividedLines.Free;
end;

procedure TTestCase1.PackageInfo;
var
  InfoString: String;
  P: Integer;
begin
  InfoString:= FChoco.PackageInfo('freepascal');
  P:= Pos('freepascal.org', InfoString);
  AssertTrue(P >= 1);
end;

initialization

  RegisterTest(TTestCase1);
end.

