unit Draw;

interface
//procedure GenGraph;

type
  vershina = record
    x,y,color:Integer;
  end;
   matr = array of array of integer;
   matrI=array[1..1000, 1..1000] of integer;

var
  graph: array of vershina;
  MatrSmez: matr;
  n,e,q,w,st:integer;
   x,y:integer;
   ris:Boolean;

const r = 20;


implementation

{procedure GenGraph;
var i,x0,y0:integer;
    angle: real;
begin
  Randomize;
  form.Canvas.Pen.Color:=clBlack;
  angle:=2*pi/n;
  x0:=150; y0:=150;
  For i:=1 to n do
    begin
      graph[i].x:=x0 + Trunc(Sin(angle*i)*110);
      Graph[i].y:=y0 + Trunc(Cos(angle*i)*110);
      graph[i].color:=RGB(255,randomRange(100,200),0);
    end;
end;   }

Procedure FU(D: matr; V: integer);
var inf,i,j, k: integer;
begin
inf:=1000000;
for i:=1 to V do D[i, i]:=0;
  for k:=1 to V do
    for i:=1 to V do
      for j:=1 to V do
        if (D[i, k]<>0) and (D[k, j]<>0) and (i<>j) then
          if (D[i, k]+D[k, j]<D[i, j]) or (D[i, j]=0) then
            D[i, j]:=D[i, k]+D[k, j];
for i:=1 to V do
  begin
   for j:=1 to V do
      write(D[i, j]:4);
  end;
end;

end.
