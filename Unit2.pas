unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,unit1;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if not(key in ['0'..'9',#8])then key:=#0;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
if (form2.Edit1.text='') then
  begin
  showMessage('¬ведите корректную начальную вершину!');
  exit;
  form2.Close;
  end
else
form1.buf.Caption:=edit1.Text;
form2.Close;
end;

end.
