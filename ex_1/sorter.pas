program sorter;

const max_number = 101;
const n = 50;

    
procedure Sort(var data: Array of Integer);
var
  i, j, temp: Integer;
begin
  for i := 1 to n do
  begin
    for j := n downTo i do
    begin
      if data[j-1] > data[j] then
      begin
        temp := data[j];
        data[j] := data[j-1];
        data[j-1] := temp;
      end;
    end;
  end;
end;


procedure Generate(var data: Array of Integer);
var i: Integer;
begin
  Randomize;
  for i := 1 to n do data[i] := Random(max_number)
end;

var
  data: Array[1..n] of Integer;
  i: Integer;

begin
  Generate(data);
  Writeln('Before sort:');

  for i := 1 to n do Write(data[i], ', ');
  Writeln(' ');
  Writeln('After sort:');
  Sort(data);

  for i := 1 to n do Write(data[i], ', ');

  WriteLn()
end.
