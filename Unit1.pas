unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids,Math;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    Edit1: TLabeledEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Timer1: TTimer;
    Button4: TButton;
    buf: TLabel;
    procedure Edit1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure Button3Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
  vershina = record
  x,y,color:Integer;
  end;
   matr = array of array of integer;
   matrI=array[1..1000, 1..1000] of integer;
var
  Form1: TForm1;
  graph: array of vershina;
  MatrSmez: matr;
  n,e,q,w,st:integer;
   x,y:integer;
   ris:boolean;

const r = 20;

implementation

uses Unit2;


{$R *.dfm}

procedure TForm1.Edit1Change(Sender: TObject);
var n,tmp:integer;
begin
StringGrid1.Options:=StringGrid1.Options+[goEditing];
val(Edit1.Text,n,tmp);
StringGrid1.RowCount:=n;
StringGrid1.ColCount:=n;
StringGrid1.Height:=24*(n+1);
StringGrid1.Width:=(StringGrid1.GridLineWidth*(n+1)*62);
form1.Height:=form1.Height+stringGrid1.Height;
form1.Width:=form1.Width+stringGrid1.Height div 4;
if edit1.Text='' then
  begin
    form1.Width:=601;
    form1.Height:=128;
  end;
end;

procedure GenGraph;
var i,x0,y0:integer;
    angle: real;
begin
  Randomize;
  form1.Canvas.Pen.Color:=clBlack;
  angle:=2*pi/n;
  x0:=250; y0:=200;
  For i:=1 to n do
    begin
      graph[i].x:=x0 + Trunc(Sin(angle*i)*110);
      Graph[i].y:=y0 + Trunc(Cos(angle*i)*110);
      graph[i].color:=RGB(255,randomRange(100,200),0);
    end;
end;


procedure FileInMatr;
var f:textfile;  i,j:integer;
begin
  AssignFile(f,'matr.txt');
  Reset(f);
  Readln(f,n);
  SetLength(MatrSmez,n+1);
  for i:=0 to n do
    SetLength(MatrSmez[i],n+1);
  SetLength(graph,n+1);
  for i:=1 to n do
    begin
      for j:=1 to n do
        read(f,MatrSmez[i,j]);
      Readln(f);
    end;
  GenGraph;
end;

Procedure PrintMatr(A:matr; n:integer; var sg:TStringGrid);
var i,j:integer;
begin
  for i:=0 to n-1 do
    for j:=0 to n-1 do
     begin
  Sg.Cells[j,i]:=IntToStr(a[i,j]);
 end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var InputFile:textFile;
begin
FileInMatr;
Edit1.Text:=IntToStr(n);
Edit1.ReadOnly:=true;
StringGrid1.Options:=StringGrid1.Options-[goEditing];
PrintMatr(MatrSmez,n,StringGrid1);
end;

procedure TForm1.Button2Click(Sender: TObject);
var i,j:integer;
begin
if edit1.ReadOnly then
  begin
  ShowMessage('Матрица уже прочитана из файла!');
  exit;
  end;
if (edit1.Text<>'')and(n>0)and(edit1.ReadOnly=false) then
  begin
      for i:=0 to n-1 do
        for j:=0 to n-1 do
        begin
          MatrSmez[i,j]:=StrToInt(StringGrid1.Cells[i,j]);
        end;
       StringGrid1.Options:=StringGrid1.Options-[goEditing];
  end;
end;

procedure TForm1.StringGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if not(key in ['0'..'9',#8])then key:=#0;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin;
form1.Width:=700+button4.Width+button4.Width+10;
form1.Height:=(StringGrid1.Height*2)+60;
Form1.Caption:= 'Визуализация графа';
form1.AutoSize:=false;
ris:=true;
stringGrid1.Visible:=false;
form1.Width:=form1.Width-300;
end;

Procedure FU(D: matr; V: integer);
var i,j, k: integer;
begin
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

procedure TForm1.Timer1Timer(Sender: TObject);
begin
if ris then
  begin
    e:=0;
    Canvas.Brush.Color:=clwhite;
    Canvas.FillRect(ClientRect);
    for q:=1 to n do
      begin
        e:=e+1;
        for w:=1 to e do
          begin
            if (MatrSmez[q,w] <> 0) then
              if (q <> w) then
                begin
                  Canvas.MoveTo(graph[q].x,graph[q].y);
                  Canvas.LineTo(graph[w].x,graph[w].y);
                    x:=(graph[w].x+Graph[q].x)div 2;
                    y:=(graph[w].y+Graph[q].y)div 2;
                 end
              else
                begin
                  Canvas.Brush.Color:=form1.Color;
                  Canvas.Pen.Color:=clBlack;
                  Canvas.Ellipse(Graph[q].x-2*r,Graph[q].y-2*r,Graph[q].x,Graph[q].y);
                end;
          end;
      end;
    for q:=1 to n do
      begin
        Canvas.Brush.Color:=graph[q].color;
        Canvas.Ellipse(graph[q].x-r,graph[q].y-r,graph[q].x+r,graph[q].y+r);
        Canvas.Brush.Color:=graph[q].color;
        Canvas.TextOut(graph[q].x-3,graph[q].y-6, IntToStr(q));
      end;
  end;
end;

procedure BFS(gr:matr; n:integer; start:integer; var res:string);
var
  f: boolean;
  i,j,head, u, tail: integer;
  visited: array[1..50] of boolean;
  prev: array[0..50] of integer;
  och: array[1..50] of integer;
begin
res:='';
head:=start;
tail:=start;
f:=false;
for i:=1 to n do
      begin
      visited[i]:=false;
      prev[i]:=0;
      end;
och[tail]:=start;
visited[start]:=true;
while (head<=tail) and (not f) do
      begin
      u:=och[head];
      head:=head+1;
        for j:=1 to n do
          if (gr[u,j]=1) and (not visited[j]) then
            begin
            tail:=tail+1;
            och[tail]:=j;
            visited[j]:=true;
            prev[j]:=u;
            res:=res+inttostr(prev[j])+'->'+inttostr(j)+'; ';
            end;
      end;
end;

procedure TForm1.Button4Click(Sender: TObject);
var b:string;
    start:integer;
begin
form2.ShowModal;
start:=StrToInt(buf.Caption);
if (start>n)then
  begin
  showMessage('Введите корректную начальную вершину!');
  start:=-1;
  buf.Caption:='';
  exit;
  end;

BFS(MatrSmez,n, start,b);
showmessage(b);
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if not(key in ['0'..'9',#8])then key:=#0;
end;

end.
