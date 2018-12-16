unit Unit5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.Imaging.pngimage,DateUtils, Vcl.MPlayer, Vcl.ExtCtrls;

type
  TForm5 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel ;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Timer1: TTimer;
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DisplayAlarms;
    procedure Image3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TAlarmClock = record
    Name: string[50];
    MyTime: TDateTime;
    Signal : string[250];
    IsItOn: boolean;
    IsItClever: boolean;
  end;

var
  Form5: TForm5;
  Bin: boolean;
  Cross: boolean;
  Plus: boolean;
  MyMenu: boolean;
  ArrayOfClocks: array of TAlarmClock;
  CountofClocks:integer;
  CallerID:integer;
  f1: file of TAlarmClock;
implementation
   uses unit1,unit2, unit3;
{$R *.dfm}

procedure TForm5.FormCreate(Sender: TObject);
Var a:TAlarmClock; i:integer;
index:integer;
begin
index:=0;
Plus:= true;
Bin:= false;
Cross:= false;
MyMenu:=true;
index:=1;

 assignfile(f1,'C:\Users\Sasha\Desktop\Будильник\Win32\Debug\Alarms.txt');
 if FileExists('C:\Users\Sasha\Desktop\Будильник\Win32\Debug\Alarms.txt') then
 begin
   reset(f1);
   while not(Eof(f1)) do
   begin
     read(f1,a);
     SetLength(ArrayOfClocks,index);
     ArrayOfClocks[index-1].Name:=a.Name;
     ArrayOfClocks[index-1].MyTime:=a.MyTime;
     ArrayOfClocks[index-1].Signal:=a.Signal;
     ArrayOfClocks[index-1].IsItOn:=a.IsItOn;
     inc(index);
   end;

   CountofClocks:=index-1;
   DisplayAlarms;

 end
 else
 exit;

end;

procedure ClearLabels;
begin
Form5.label1.Caption:='';
Form5.label2.Caption:='';
Form5.label3.Caption:='';
Form5.label4.Caption:='';
Form5.label5.Caption:='';
Form5.label6.Caption:='';
Form5.label7.Caption:='';
Form5.label8.Caption:='';
Form5.label9.Caption:='';
Form5.label10.Caption:='';
end;

procedure HideCheckboxes;
begin
  form5.CheckBox1.Visible:=false;
  form5.CheckBox2.Visible:=false;
  form5.CheckBox3.Visible:=false;
  form5.CheckBox4.Visible:=false;
  form5.CheckBox5.Visible:=false;
end;

procedure HideImages;
begin
  form5.Image3.Visible:=false;
  form5.Image4.Visible:=false;
  form5.Image5.Visible:=false;
  form5.Image6.Visible:=false;
  form5.Image7.Visible:=false;
end;


procedure DeselectingCheckBoxes;
begin
  form5.CheckBox1.Checked:=false;
  form5.CheckBox2.Checked:=false;
  form5.CheckBox3.Checked:=false;
  form5.CheckBox4.Checked:=false;
  form5.CheckBox5.Checked:=false;
end;

procedure Save;
Var a:TAlarmClock; i:integer;
begin
assignfile(f1,'C:\Users\Sasha\Desktop\Будильник\Win32\Debug\Alarms.txt');
 rewrite(f1);
 for I := 0 to CountofClocks-1 do
  begin
 seek(f1,filesize(f1));
 a.Name:=ArrayOfClocks[i].Name;
 a.MyTime:=ArrayOfClocks[i].MyTime;
 a.Signal:=ArrayOfClocks[i].Signal;
 a.IsItOn:=ArrayOfClocks[i].IsItOn;
 a.IsItClever:= ArrayOfClocks[i].IsItClever;
 write(f1,a);
  end;
 closefile(f1);
end;

procedure TForm5.DisplayAlarms;
var i,j:integer;
begin

ClearLabels;
HideImages;
HideCheckboxes;
DeselectingCheckBoxes;

  for i := 0 to CountofClocks-1 do
  begin
    for j := 0 to ComponentCount-1 do
    begin
      if (Components[j] is TLabel) then  // если label
       begin

         if (Components[j].Tag) = strtoint((inttostr(i+1)+'1')) then
         begin
           (Components[j] as TLabel).Caption:=ArrayOfClocks[i].Name;

         end;
           if (Components[j].Tag) = strtoint((inttostr(i+1)+'2')) then
         begin
           (Components[j] as TLabel).Caption:=TimeTostr(ArrayOfClocks[i].MyTime);
         end;
       end;


       if (Form5.Components[j] is TImage) then     // если image
       begin
         if (Form5.Components[j].Tag) = (i+1) then
         begin
         (Form5.Components[j] as TImage).Visible:=true;
           if ArrayOfClocks[i].IsItOn then
           begin
             (Form5.Components[j] as TImage).Picture.LoadFromFile('C:\Users\Sasha\Desktop\Будильник\Win32\Debug\On.png');
           end
           else
           (Form5.Components[j] as TImage).Picture.LoadFromFile('C:\Users\Sasha\Desktop\Будильник\Win32\Debug\Off.png');
         end;

       end;
    end;
  end;
  Save;

end;






procedure PlusClick;
begin
  if CountofClocks=5 then
begin
  showmessage('Достигнут лимит будильников, удалите чтобы добавить');
  exit;
end;
form1.ShowModal;
exit;
end;

procedure BinClick ;
var BoolMas: array of boolean;
countOfTrue: integer;
i,j: integer;
index: integer;
a: TAlarmClock;
begin
countOfTrue:=0;
  Plus:=true;
  Bin:=false;
  form5.image1.Picture.LoadFromFile('C:\Users\Sasha\Desktop\Будильник\Win32\Debug\Черный плюс.png');
  form5.image2.Picture.LoadFromFile('C:\Users\Sasha\Desktop\Будильник\Win32\Debug\clipboard.png');
  MyMenu:=true;
  Cross:=false;

  setlength(BoolMas,CountofClocks);
  index:=0;

  for i := 0 to Form5.ComponentCount-1 do
      begin
       if (Form5.Components[i] is TCheckBox) then
       begin
        if (Form5.Components[i] as TCheckBox).Checked=true
        then
        BoolMas[index] := false
        else
        BoolMas[index] := true;
        inc(index);
       if index>CountofClocks then break;

      end;
        end;

       for i := 0 to CountofClocks-1 do
          begin
            if BoolMas[i]=false then
            begin
              for j := i to CountofClocks-1  do
             if BoolMas[j] = true then
                begin
                 BoolMas[i]:=false;
                 a:=ArrayOfClocks[i];
                 ArrayOfClocks[i]:=ArrayOfClocks[j];
                 ArrayOfClocks[j]:=a;
                 BoolMas[j]:=true;
                 break;
                end;

            end;
          end;

 for i := 0 to CountofClocks-1  do
        begin
          if BoolMas[i] =  true then
           inc(countOfTrue);
          end;

SetLength(ArrayOfClocks,countOfTrue);
SetLength(BoolMas,countOfTrue);



CountofClocks:=countOfTrue;

Form5.DisplayAlarms;

end;


procedure TForm5.Image1Click(Sender: TObject);
begin
if Plus then
begin
  PlusClick;
end;

if Bin then
begin
BinClick;
end;

end;





procedure TForm5.Image2Click(Sender: TObject);
var i:integer;
begin
if CountofClocks=0 then
begin
  showmessage('Вначале добавьте будильник');
  exit;
end;

if MYMenu then
 begin
image2.Picture.LoadFromFile('C:\Users\Sasha\Desktop\Будильник\Win32\Debug\крест.png');
image1.Picture.LoadFromFile('C:\Users\Sasha\Desktop\Будильник\Win32\Debug\bin.png');
MYMenu:=false;
Plus:=false;
Bin:=true;
Cross:=true;

for i := 0 to form5.ComponentCount-1 do
    begin
      if (form5.Components[i] is TCheckBox) then
      begin
       if ((form5.Components[i] as TCheckBox).Tag <= CountofClocks)
       then
       (form5.Components[i] as TCheckBox).Visible:=true;
      end;
    end;
exit;
 end;
 if Cross then
 begin
  image1.Picture.LoadFromFile('C:\Users\Sasha\Desktop\Будильник\Win32\Debug\Черный плюс.png');
  image2.Picture.LoadFromFile('C:\Users\Sasha\Desktop\Будильник\Win32\Debug\clipboard.png');
  Bin:=false;
  Cross:=false;
  Plus:=true;
  MyMenu:=true;
  HideCheckboxes;
  DeselectingCheckBoxes;
  exit;
 end;
end;

procedure TForm5.Image3Click(Sender: TObject);
begin
ArrayOfClocks[0].IsItOn:=not(ArrayofClocks[0].IsItOn);
DisplayAlarms;

end;

procedure TForm5.Image4Click(Sender: TObject);
begin
ArrayOfClocks[1].IsItOn:=not(ArrayofClocks[2].IsItOn);
DisplayAlarms;

end;

procedure TForm5.Image5Click(Sender: TObject);
begin
ArrayOfClocks[2].IsItOn:=not(ArrayofClocks[2].IsItOn);
DisplayAlarms;

end;

procedure TForm5.Image6Click(Sender: TObject);
begin
ArrayOfClocks[3].IsItOn:=not(ArrayofClocks[3].IsItOn);
DisplayAlarms;
end;

procedure TForm5.Image7Click(Sender: TObject);
begin
ArrayOfClocks[4].IsItOn:=not(ArrayofClocks[4].IsItOn);
DisplayAlarms;

end;

procedure TForm5.Timer1Timer(Sender: TObject);
var i:integer;
begin
if CountOfClocks=0 then exit;

for i := 0 to CountofClocks-1 do
begin
  if (timetostr(ArrayOfClocks[i].MyTime) = TimeTostr(Now)) and (ArrayOfClocks[i].IsItOn) then
  begin
  CallerID:= i;
  if ArrayOfClocks[i].IsItClever then
  form3.showmodal
  else
  form2.showmodal;
  end;
end;

end;

end.
