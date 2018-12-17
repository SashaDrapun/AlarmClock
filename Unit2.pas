unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unit5, Vcl.StdCtrls, Vcl.MPlayer;

type
abc =  array of string;
  TForm2 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    MediaPlayer1: TMediaPlayer;
    ComboBox1: TComboBox;
    Label4: TLabel;
    Button1: TButton; 
    Button2: TButton;
    procedure FormActivate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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

function Split(s: string; a: char): abc;
var i:integer;
index:integer;
result1: abc;
begin
SetLength(result1,1);
index:=0;

for i := 1 to s.Length do
  begin

    if s[i]=a then
    begin
    inc(index);
    SetLength(result1,index+1);
    continue;
    end;

    result1[index] := result1[index]+s[i];
  end;
  result :=result1;

end;


procedure TForm2.Button1Click(Sender: TObject);
var arrayDateTime: abc;
c:char ;
i:integer;
begin
c:=':';
arrayDateTime:= Split(TimeTostr(ArrayOfClocks[CallerID].MyTime),c);
arrayDateTime[1]:= inttostr(strtoint(arrayDateTime[1])+strtoint(Combobox1.Text));
if strtoint(arrayDateTime[1])>59 then
begin
 arrayDateTime[0]:= inttostr((strtoint(arrayDateTime[1])+1));
 arrayDateTime[1]:= inttostr(strtoint(arrayDateTime[2])-60);
end;
if strtoint(arrayDateTime[0])>23 then
begin
 arrayDateTime[0]:= inttostr((strtoint(arrayDateTime[0])+1));
 arrayDateTime[0]:= inttostr(0);
end;

ArrayOfClocks[CallerID].MyTime:= strtotime(arrayDateTime[0]+':'+arrayDateTime[1]+':'+'0');
unit5.Form5.DisplayAlarms;
MediaPlayer1.Close;
form2.Close;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
MediaPlayer1.Close;
form2.Close;
end;

procedure TForm2.FormActivate(Sender: TObject);
begin
label2.Caption:= ArrayOfClocks[CallerID].Name;
label3.Caption:=Timetostr(ArrayOfClocks[CallerID].MyTime);
MediaPlayer1.FileName:=ArrayOfClocks[CallerID].Signal;
MediaPlayer1.Open;
Mediaplayer1.Play;

end;

end.
