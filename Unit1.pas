unit Unit1;

interface

uses
 Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.Imaging.pngimage,DateUtils, Vcl.MPlayer, Vcl.ExtCtrls, unit5;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Edit1: TEdit;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    Label9: TLabel;
    CheckBox1: TCheckBox;
    procedure Image3Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure HourDown;
    procedure HourUp;
    procedure MinDown;
    procedure MinUp;
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  s: string;
implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
if OpenDialog1.Execute then
s:=OpenDialog1.FileName;
end;

procedure TForm1.FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  if (MousePos.x>665) and (MousePos.Y<300) then
  begin
  MinDown;
  end;
  if (MousePos.x<665) and (MousePos.Y<300) then
  begin
  HourDown;
  end;

end;

procedure TForm1.FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  if (MousePos.x>665) and (MousePos.Y<300) then
  begin
  MinUp;
  end;
  if (MousePos.x<665) and (MousePos.Y<300) then
  begin
  HourUp;
  end;
end;

procedure TForm1.HourDown;
begin
 label2.Caption:=inttostr(strtoint(label2.Caption)+1);
if label2.Caption='24' then label2.Caption:='0';

label3.Caption:=inttostr(strtoint(label3.Caption)+1);
if label3.Caption='24' then label3.Caption:='0';

label4.Caption:=inttostr(strtoint(label4.Caption)+1);
if label4.Caption='24' then label4.Caption:='0';
end;

procedure TForm1.HourUp;
begin
if label2.Caption='0' then label2.Caption:='24';
label2.Caption:=inttostr(strtoint(label2.Caption)-1);
if label3.Caption='0' then label3.Caption:='24';
label3.Caption:=inttostr(strtoint(label3.Caption)-1);
if label4.Caption='0' then label4.Caption:='24';
label4.Caption:=inttostr(strtoint(label4.Caption)-1);
end;

procedure TForm1.MinDown;
begin
 label5.Caption:=inttostr(strtoint(label5.Caption)+1);
if label5.Caption='60' then label5.Caption:='0';
 label6.Caption:=inttostr(strtoint(label6.Caption)+1);
if label6.Caption='60' then label6.Caption:='0';
 label7.Caption:=inttostr(strtoint(label7.Caption)+1);
if label7.Caption='60' then label7.Caption:='0';
end;

procedure TForm1.MinUp;
begin
if label5.Caption='0' then label5.Caption:='60';
label5.Caption:=inttostr(strtoint(label5.Caption)-1);
if label6.Caption='0' then label6.Caption:='60';
label6.Caption:=inttostr(strtoint(label6.Caption)-1);
if label7.Caption='0' then label7.Caption:='60';
label7.Caption:=inttostr(strtoint(label7.Caption)-1);
end;

procedure TForm1.Image1Click(Sender: TObject);
begin
  MinDown;
end;

procedure TForm1.Image2Click(Sender: TObject);
begin
HourDown;

end;

procedure TForm1.Image3Click(Sender: TObject);
begin
HourUp;
end;

procedure TForm1.Image5Click(Sender: TObject);
var a:TAlarmClock;
begin
if (s<>'') and (edit1.Text<>'') then
     begin
 a.Name:=edit1.Text;
 a.MyTime:= strtotime(label3.Caption+':'+label6.Caption+':'+'0');
 a.Signal:=s;
 a.IsItOn:=true;
 if CheckBox1.Checked then
 a.IsItClever:=true
 else
 a.IsItClever:=false;
 CheckBox1.Checked:=false;

 inc(CountofClocks);

 setlength(ArrayOfClocks,CountofClocks);
 ArrayOfclocks[CountofClocks-1]:= a;


unit5.Form5.DisplayAlarms;
    s:='';
 form1.Close;
     end
     else showmessage('Заполните все поля!');
end;

procedure TForm1.Image6Click(Sender: TObject);
begin
form1.Close;
end;

end.
