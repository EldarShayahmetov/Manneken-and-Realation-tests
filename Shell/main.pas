unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, ShellApi, frxClass, frxDBSet, Vcl.HtmlHelpViewer;

type
  TFMain = class(TForm)
    PTop: TPanel;
    PBottom: TPanel;
    BitBtn1: TBitBtn;
    BBTest: TBitBtn;
    RGStatus: TRadioGroup;
    PMainTest: TPanel;
    PResp: TPanel;
    PTest: TPanel;
    PFIOResp: TPanel;
    PFind: TPanel;
    EFind: TEdit;
    BBFind: TBitBtn;
    LBRespondent: TListBox;
    PNameTest: TPanel;
    LBTest: TListBox;
    PMainPsy: TPanel;
    PAddResp: TPanel;
    EFamily: TEdit;
    EName: TEdit;
    ESurName: TEdit;
    CBSex: TComboBox;
    DTPBorn: TDateTimePicker;
    BBAdd: TBitBtn;
    BBEdit: TBitBtn;
    BBDelete: TBitBtn;
    PExperiment: TPanel;
    Panel1: TPanel;
    DBGTesting: TDBGrid;
    PButExp: TPanel;
    BBResult: TBitBtn;
    BBProtocol: TBitBtn;
    BBResultOtchet: TBitBtn;
    BBProtocolOtchet: TBitBtn;
    PResultProtocol: TPanel;
    DBGResult: TDBGrid;
    DBGProtocol: TDBGrid;
    PFindResp: TPanel;
    EFindResp: TEdit;
    DBGRespondent: TDBGrid;
    Timer1: TTimer;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    LFamily: TLabel;
    LName: TLabel;
    LSurName: TLabel;
    LSex: TLabel;
    LBorn: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    procedure BBTestClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure LBRespondentClick(Sender: TObject);
    procedure LBTestClick(Sender: TObject);
    procedure RGStatusClick(Sender: TObject);
    procedure BBAddClick(Sender: TObject);
    procedure BBEditClick(Sender: TObject);
    procedure BBDeleteClick(Sender: TObject);
    procedure BBResultClick(Sender: TObject);
    procedure BBProtocolClick(Sender: TObject);
    procedure BBFindClick(Sender: TObject);
    procedure DBGRespondentCellClick(Column: TColumn);
    procedure DBGRespondentKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EFindRespChange(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure BBResultOtchetClick(Sender: TObject);
    procedure Otchet(Dannye: Boolean);
    procedure BBProtocolOtchetClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public

    { Public declarations }
  end;

var
  FMain: TFMain; S: String; Pass: Boolean;

implementation

{$R *.dfm}

uses DataOb, password;

procedure TFMain.BBAddClick(Sender: TObject);
var

B : Boolean; // �������� ������

i : integer; // ������� �����

begin
// ������ ���������

BBAdd.Enabled :=False;
BBEdit.Enabled :=False;
BBDelete.Enabled :=False;
Timer1.Enabled :=true;

B := TRUE;

with DM1 do

begin

// �������� ��� ������ �� ����� ����� � ���� ������

with ADOQRespondent do

begin

// ���� ���� �� ����� �� �������, �� �� ���������� ������ � ��

if EFamily.Text = '' then

B := FALSE;

if EName.Text = '' then

B := FALSE;

if ESurName.Text = '' then

B := FALSE;

if CBSex.Text = '' then

B := FALSE;

if DateToStr(DTPBorn.Date) = '' then

B := FALSE;

// ������ ��������� (������� ��� ����)

if B then

with SQL do

begin

// ������ ������ � ���� ������

// �������� "������" ������

Clear;

// ��������� ����� ������ � ������� �����������: �������, ���, ���, ���� ��������

Add('INSERT INTO Respondent(Family, Name, SurName, Sex, Born)'+

'VALUES('+QuotedStr(EFamily.Text)+', '+QuotedStr(EName.Text)+', '+

QuotedStr(ESurName.Text)+', '+QuotedStr(CBSex.Text)+', '+

QuotedStr(DateToStr(DTPBorn.Date))+')');

// ��������� ������

ExecSQL;

// ������������ ���� ������ ��� ����������� � �������

// �������� "������" ������

Clear;


// ������� ������ ������������

Add('SELECT * FROM Respondent');

// ������������ ������

Active := True;


end;

end;

// ���������� ���������� ������������ �� ���� ������

with ADOQRespondent do

begin

// �������� ���� �������

SQL.Clear;

// ������������ ������ ��� ������ ���� ������

SQL.Add('SELECT * FROM Respondent');

// ������������ ������

Active := TRUE;

// �������� ������ ������������

LBRespondent.Items.Clear;

for i := 0 to RecordCount-1 do

begin

// ������� �������� ����� � ��������� ��� ����� �� �����

LBRespondent.Items.Add(FieldByName('Family').AsString+' '+

FieldByName('Name').AsString+' '+

FieldByName('SurName').AsString);

// ������� � ��������� ������

Next;

end;

end;

end;

end;

procedure TFMain.BBDeleteClick(Sender: TObject);
var

No, i : Integer;

S : String;

begin
// ������� �������, ���, �������� � ������� ������

with DM1.ADOQRespondent do

S := '('+FieldByName('Family').AsString+' '+

FieldByName('Name').AsString+' '+

FieldByName('Surname').AsString + ')';

// ������ ������ �� ��������

If MessageDlg('������� ������� ������ '+S+'?',mtConfirmation, [mbYes, mbNo], 0, mbNo) = mrYes then

// �������� ������

with DM1 do

begin

with ADOQRespondent do

begin

// ������ ����� ������������� ������

No := FieldByName('ID_Respondent').AsInteger;

with SQL do

begin

// �������� ������ ������

Clear;

// ��������������� ������� ������

S := 'DELETE FROM Respondent WHERE ID_Respondent = '+IntToStr(No);

Add(S);

// ��������� ������

ExecSQL;


Clear;


// ������� ������ ������������

Add('SELECT * FROM Respondent');

// ������������ ������

Active := True;


LBRespondent.Items.Clear;

for i := 0 to RecordCount-1 do

begin

// ������� �������� ����� � ��������� ��� ����� �� �����

LBRespondent.Items.Add(FieldByName('Family').AsString+' '+

FieldByName('Name').AsString+' '+

FieldByName('SurName').AsString);

// ������� � ��������� ������

Next;
end;

BBAdd.Enabled :=False;
BBEdit.Enabled :=False;
BBDelete.Enabled :=False;
Timer1.Enabled :=true;


end;

// ���������� ������ ��� ����������� �� ������

with SQL do

begin

// �������� ������ ������

Clear;

// ��������������� ������� ������

S := 'SELECT * FROM Respondent';

Add(S);

// ��������� ������
Active := True;


end;
end;

end;
end;

procedure TFMain.BBEditClick(Sender: TObject);
var

No,i : Integer; // ����� ������

S : String;

begin

// ������ ������ �� ������ ����������������� ������ � ���� ������

If MessageDlg('��������������� ������� ������ ��������� �������?',mtConfirmation, [mbYes, mbNo], 0, mbNo) = mrYes then

// �������� ������

with DM1 do

begin

with ADOQRespondent do

begin

// ������ ����� ������������� ������

No := FieldByName('ID_Respondent').AsInteger;

with SQL do

begin

// �������� ������ ������

Clear;

// ��������������� ������� ������

S := 'UPDATE Respondent SET Family ='+QuotedStr(EFamily.Text)+

', Name ='+QuotedStr(EName.Text)+

', Surname ='+QuotedStr(ESurName.Text)+

', Sex ='+QuotedStr(CBSex.Text)+

', Born ='+QuotedStr(DateToStr(DTPBorn.Date))+

' WHERE ID_Respondent = '+IntToStr(No);

Add(S);

// ��������� ������

ExecSQL;

// ������������ ���� ������ ��� ����������� � �������

// �������� "������" ������

Clear;

// ������� ������ ������������

Add('SELECT * FROM Respondent');

// ������������ ������

Active := True;

LBRespondent.Items.Clear;

for i := 0 to RecordCount-1 do

begin

// ������� �������� ����� � ��������� ��� ����� �� �����

LBRespondent.Items.Add(FieldByName('Family').AsString+' '+

FieldByName('Name').AsString+' '+

FieldByName('SurName').AsString);

// ������� � ��������� ������

Next;
end;

BBAdd.Enabled :=False;
BBEdit.Enabled :=False;
BBDelete.Enabled :=False;
Timer1.Enabled :=true;



end;

end;

end;
end;

procedure TFMain.BBFindClick(Sender: TObject);
var

i: integer; // ������ ���������� ��������

begin

// ���� ����� �� ����� �����

if EFind.Text='' then exit;

// ����������� ���� ������

for i:=0 To LBRespondent.Items.Count-1 Do

// ���� ��������� ������� ��������� � ������ �������� ������ ����

if pos(EFind.Text,LBRespondent.Items.Strings[i])>0 then

// ��������� ������ ������ ���������� ��������

LBRespondent.ItemIndex := i;

// ���������� ����� �� ������� ������

LBRespondent.SetFocus;
end;

procedure TFMain.BBProtocolClick(Sender: TObject);
var

ID_Testing : String;

begin

with DM1 do

begin

// ������ ���� �����������

with DBGResult do

begin

Align := alNone;

Visible := False;

end;

// ���������� ���� ���������

with DBGProtocol do

begin

Align := alClient;

Visible := True;

end;

// ������� ����� ���������� ������������

ID_Testing := ADOQTesting.FieldByName('ID_Testing').AsString;

// ���������� ������ ���� �� 1 �����������

if ID_Testing <> '' then

begin

// ���������� �������� ���������� ������������

with ADOQProtocol do

begin

// ������� ������ ��������� ������ ������ ������ ���������� ������������

with SQL do

begin

// �������� "������" ������

Clear;

// ������� �������� ������������ � ����������� � ��������� �������������

Add('SELECT * FROM Protocol WHERE ID_Testing = '+ID_Testing);

end;

// ������������ ������

Active := True;

end;

end;

end;

end;

procedure TFMain.BBProtocolOtchetClick(Sender: TObject);
begin
Otchet(False);
end;

procedure TFMain.BBResultClick(Sender: TObject);
var

ID_Testing : String;

begin

// ������ ���� ���������

with DBGProtocol do

begin

Align := alNone;

Visible := False;

end;

// ���������� ���� �����������

with DBGResult do

begin

Align := alClient;

Visible := True;

end;

with DM1 do

begin

// ������� ����� ���������� ������������

ID_Testing := ADOQTesting.FieldByName('ID_Testing').AsString;

// ���������� ������ ���� �� 1 �����������

if ID_Testing <> '' then

begin

// ���������� ���������� ���������� ������������

with ADOQResult do

begin

// ������� ������ ���������� ���������� ������������

with SQL do

begin

// �������� "������" ������

Clear;

// ������� ���������� � ������������ � ��������� �������������

Add('SELECT * FROM Result WHERE ID_Testing = '+ID_Testing);

end;

// ������������ ������

Active := True;

end;

end;

end;
end;

procedure TFMain.BBResultOtchetClick(Sender: TObject);
begin
Otchet(True);
end;

procedure TFMain.BBTestClick(Sender: TObject);
var

ST, SR : String; // �������� �������� ����� � ����� �����������

FT : String; // ��� ������������ �����

S2 : String; // ���� � ����������� ���������

ID : String; // ����������������� ����� �����������

i : Integer; // �������

begin

// �� ��������� ������� ���� ��� ���������� ������������

if not PMainTest.Visible then

begin

// ������� ������ ���������� ������� ���������� (���� ������, �������� �����������) �������

PMainPsy.Visible := False;

// ������� ������ ������������ �������

PMainTest.Visible := True;

end;

// ������� ������ �� ������ ��������

Screen.Cursor := crHourGlass;

// ��������� ��� ���������� �����

ST := LBTest.Items[LBTest.ItemIndex];

// ��������� ��� ���������� �����������

SR := LBRespondent.Items[LBRespondent.ItemIndex];

// ����������� ���� � �������

with DM1 do

begin

with ADOQTest do

begin

// �������� ���� �������

SQL.Clear;

// ������������ ������ ��� ������ ���� ������

SQL.Add('SELECT * FROM Test WHERE NameTest='''+ST+'''');

// ������������ ������

Active := TRUE;

// ������� ��� ����������� �����

FT := FieldByName('RunFile').AsString;

end;

// ������� ����������� ��� ������������

with ADOQRespondent do

begin

// �������� ���� �������

SQL.Clear;

// ������������ ������ ��� ������ ���� ������

SQL.Add('SELECT * FROM Respondent');

// ������������ ������

Active := TRUE;

for i := 0 to RecordCount-1 do

begin

// ����� ������ ����������� � ���� ������

If (FieldByName('Family').AsString+' '+FieldByName('Name').AsString+' '+

FieldByName('SurName').AsString) = SR then

begin

// ������ ��� ������������� �� ���� ������ � ��������� ��� �

ID := FieldByName('ID_Respondent').AsString;

// ���� ������ �������, ��������� ������� � ����� �� �����

Break;

end;

// ������� � ��������� ������

Next;

end;

end;

end;

// ������� ���� � ������������ �����

FT := S +'/'+ FT;

// ��������������� ��� ��� ������ ����� �������

Screen.Cursor := crDefault;

// ��������� ���� �����

ShellExecute(Handle,'open',PWideChar(FT), PWideChar(ID), nil, SW_SHOW);

end;

procedure TFMain.DBGRespondentCellClick(Column: TColumn);
begin
with DM1 do

begin

with ADOQRespondent do

begin

EFamily.Text := FieldByName('Family').AsString;

EName.Text := FieldByName('Name').AsString;

ESurName.Text := FieldByName('SurName').AsString;

CBSex.Text := FieldByName('Sex').AsString;

DTPBorn.Date := FieldByName('Born').AsDateTime;

end;

end;
end;

procedure TFMain.DBGRespondentKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
with DM1 do

begin

with ADOQRespondent do

begin

EFamily.Text := FieldByName('Family').AsString;

EName.Text := FieldByName('Name').AsString;

ESurName.Text := FieldByName('SurName').AsString;

CBSex.Text := FieldByName('Sex').AsString;

DTPBorn.Date := FieldByName('Born').AsDateTime;

end;

end;
end;

procedure TFMain.EFindRespChange(Sender: TObject);
begin
// �������� ������

with DM1 do

begin

with ADOQRespondent do

begin

with SQL do

begin

// �������� ������ ������

Clear;

// ������� ������ ��� ������� "������" �� ������� �����

Add('SELECT * FROM Respondent WHERE Family LIKE ''%'+EFindResp.Text+'%''');

end;

// ������������ ������

Active := True;

DSRespondent.DataSet.Active :=false;
DSRespondent.DataSet.Active :=true;

end;

end;
end;

procedure TFMain.FormActivate(Sender: TObject);
var

i : Integer;

SH, SDB : String;

begin

// ����������� ���� ������ ��� ����������� ������ ������������ � ������

S := ExtractFilePath(Application.ExeName);

// ���������� ���� � ����� �������

SH := '������� ����.chm';

SH := S + 'Help\'+SH;

// ���������� ���� ������

FMain.HelpFile := SH;

// ������������ ������ ����������� ���� ������

SDB := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=' + S +'\Base\PDT.mdb;Persist Security Info=False';

DM1.ADOCPDT.ConnectionString:=SDB;
DM1.ADOCPDT.Connected :=true;
with DM1 do

begin

// ���� ��������� ��������, �� ��������� �

ADOQRespondent.Active := False;

ADOQTesting.Active := False;

ADOQTest.Active := False;

ADOQResult.Active := False;

ADOQParamResult.Active := False;

ADOQQuestion.Active := False;

ADOQAnswer.Active := False;

ADOQProtocol.Active := False;

ADOQTesting2.Active := False;

ADOQPassword.Active := False;

ADOQTemp.Active := False;

// ��������� �������������� ������ �����������

ADOQRespondent.ConnectionString := SDB;

ADOQTesting.ConnectionString := SDB;

ADOQTest.ConnectionString := SDB;

ADOQResult.ConnectionString := SDB;

ADOQParamResult.ConnectionString := SDB;

ADOQQuestion.ConnectionString := SDB;

ADOQAnswer.ConnectionString := SDB;

ADOQProtocol.ConnectionString := SDB;

ADOQTesting2.ConnectionString := SDB;

ADOQPassword.ConnectionString := SDB;

ADOQTemp.ConnectionString := SDB;

// ������� ��������� ��������

ADOQRespondent.Active := True;

ADOQTesting.Active := True;

ADOQTest.Active := True;

ADOQResult.Active := True;

ADOQParamResult.Active := True;

ADOQQuestion.Active := True;

ADOQAnswer.Active := True;

ADOQProtocol.Active := True;

ADOQTesting2.Active := True;

ADOQPassword.Active := True;

// ������� ���������� ������ �� ���� ������

with ADOQTest do

begin

// �������� ���� �������

SQL.Clear;

// ������������ ������ ��� ������ ���� ������

SQL.Add('SELECT * FROM Test');

// ������������ ������

Active := TRUE;

for i := 0 to RecordCount-1 do

begin

// ������� �������� ����� � ������� ��� � ������

LBTest.Items.Add(FieldByName('NameTest').AsString);

Next;

end;

end;

// ������� ���������� ������������ �� ���� ������

with ADOQRespondent do

begin

// �������� ���� �������

SQL.Clear;

// ������������ ������ ��� ������ ���� ������

SQL.Add('SELECT * FROM Respondent');

// ������������ ������

Active := TRUE;

for i := 0 to RecordCount-1 do

begin

// ������� �������� ����� � ��������� ��� ����� �� �����

LBRespondent.Items.Add(FieldByName('Family').AsString+' '+

FieldByName('Name').AsString+' '+

FieldByName('SurName').AsString);

Next;

end;

end;

// ��������� ��������� ���� ��� ���������������

SetBounds( Left - ClientOrigin.X, Top - ClientOrigin.Y,

GetDeviceCaps(Canvas.handle, HORZRES ) +

(Width - ClientWidth),

GetDeviceCaps( Canvas.handle,VERTRES )

+ (Height - ClientHeight ));

// ������ ������������ ������
DBGRespondent.Columns.Items[0].Width:= 256;
DBGTesting.Columns.Items[0].Width:= 256;
DBGResult.Columns.Items[0].Width:= 256;


PMainTest.Visible := False;

// ������ ������ ������������ ���� �����

PMainTest.Width := ClientWidth;

// ������ ������ ������������ ���� �����

PMainTest.Height := ClientHeight;

// ������ ������ ������������ �������� ������ ������������

PResp.Width := ClientWidth div 2;

// ������ ������ ������ ������������ ���� �����

PResp.Height := ClientHeight;

// ������ ������ ������ ������ ���� �����

PTest.Height := ClientHeight;

// ������ ������������ ����������

PMainTest.Visible := True;

// ������ ������ ��������� ���� �����

PMainPsy.Width := ClientWidth;

// ������ ������ ������������ ���� �����

PExperiment.Width := ClientWidth;

// ������ ������ ������������� ����������� ����� ������

DBGTesting.Width := PExperiment.Width div 3;

// ������ ������ ������������ ����� ������

PButExp.Width := PExperiment.Width div 3;

// ������ ������ ��� ������ �����������/��������� ����� ������

PResultProtocol.Width := PExperiment.Width div 3;

// ��������� ������ "����������"

BBResult.Left := (PButExp.Width div 2) - (BBResult.Width div 2);

BBResult.Top := (PButExp.Height div 3) - (BBResult.Height div 2);

BBResultOtchet.Left := BBResult.Left;

BBResultOtchet.Top := BBResult.Top + BBResultOtchet.Height + 1;

// ��������� ������ "��������"

BBProtocol.Left := (PButExp.Width div 2) - (BBProtocol.Width div 2);

BBProtocol.Top := (PButExp.Height div 3)*2 - (BBProtocol.Height div 2);

BBProtocolOtchet.Left := BBProtocol.Left;

BBProtocolOtchet.Top := BBProtocol.Top + BBProtocolOtchet.Height + 1;

// ��������� ������ ����������

PAddResp.Width := ClientWidth;

EFamily.Left := (PAddResp.Width div 5) - (EFamily.Width div 2);

EName.Left := (PAddResp.Width div 5) - (EName.Width div 2);

ESurName.Left := (PAddResp.Width div 5) - (ESurName.Width div 2);

LFamily.Left := EFamily.Left;

LName.Left := EName.Left;

LSurName.Left := ESurName.Left;

CBSex.Left := (PAddResp.Width div 5) * 2 - (CBSex.Width div 2);

LSex.Left := CBSex.Left;

DTPBorn.Left := (PAddResp.Width div 5) * 3 - (CBSex.Width div 2);

LBorn.Left := DTPBorn.Left;

BBAdd.Left := (PAddResp.Width div 5) * 4 - (BBAdd.Width div 2);

BBEdit.Left := (PAddResp.Width div 5) * 4 - (BBEdit.Width div 2);

BBDelete.Left := (PAddResp.Width div 5) * 4 - (BBDelete.Width div 2);

end;

// �� "���������" ������� ���� ������������

PMainPsy.Visible := False;

PMainPsy.Align := alNone;

PMainTest.Visible := True;

PMainTest.Align := alClient;

end;

procedure TFMain.FormKeyPress(Sender: TObject; var Key: Char);
begin
if Key = '0' then BitBtn1.Click;
if Key = '1' then BBTest.Click;
if Key = '2' then RGStatus.ItemIndex :=0;
if Key = '3' then RGStatus.ItemIndex :=1;
end;

procedure TFMain.LBRespondentClick(Sender: TObject);
begin
// ���� ������ ���������� � ���� ������ "������������" �������

if (LBRespondent.ItemIndex <> - 1)and(LBTest.ItemIndex <> - 1) then

BBTest.Enabled := true

else

// ������ "������������" �� �������

BBTest.Enabled := false;
end;

procedure TFMain.LBTestClick(Sender: TObject);
begin
// ���� ������ ���������� � ���� ������ "������������" �������

if (LBRespondent.ItemIndex <> - 1)and(LBTest.ItemIndex <> - 1) then

BBTest.Enabled := true

else

// ������ "������������" �� �������

BBTest.Enabled := false;
end;

procedure TFMain.RGStatusClick(Sender: TObject);
begin
// ������� ���� ��������� � ������������ � ��������� ��������

case RGStatus.ItemIndex of

// ����������� ����� ����������

0 : begin


// ��������� ������ ������������ (����� "���������" ���������)

BBTest.Enabled := False;

// ������ ��������� ������

PMainPsy.Visible := False;

// ������ ��������� "�� �������������"

PMainPsy.Align := alNone;

// ������ ������������ ��������

PMainTest.Visible := True;

// ������ ������������ "����������" �� �� ��������� ������������

PMainTest.Align := alClient;

// ��������� � ������� ����������� �� ������

LBRespondent.ItemIndex := -1;

// ���� � ������ ������ �� ������

LBTest.ItemIndex := -1;

end;

// ����������� ����� ��������

1 : begin

with FPassword do

begin

// ������ �� �������

Pass := False;

// ���������� ���� ������� ������

ShowModal;

// ���� ������ ����� ���������

if Pass then

begin

// ��������� ������ ������������ (�������� ����� "��������")

BBTest.Enabled := False;

// ������ ������������ ������

PMainTest.Visible := False;

// ������ ������������ "�� �������������"

PMainTest.Align := alNone;

// ������ ��������� ��������

PMainPsy.Visible := True;

// ������ ��������� "����������" �� �� ��������� ������������

PMainPsy.Align := alClient;

end

else

// ������ ����� �� ��������� - ����� ��������� ������ ������������

begin

// ��������� ������ ������������ (����� "���������" ���������)

BBTest.Enabled := False;

// ������ ��������� ������

PMainPsy.Visible := False;

// ������ ��������� "�� �������������"

PMainPsy.Align := alNone;

// ������ ������������ ��������


PMainTest.Visible := True;

// ������ ������������ "����������" �� �� ��������� ������������

PMainPsy.Align := alClient;

// ����� �������� "������������"

RGStatus.ItemIndex := 0;

// ��������� � ������� ����������� �� ������

LBRespondent.ItemIndex := -1;

// ���� � ������ ������ �� ������

LBTest.ItemIndex := -1;

end;

end;

end;

end; // case
end;

procedure TFMain.Timer1Timer(Sender: TObject);
begin
DM1.DSRespondent.DataSet.Active :=false;
DM1.DSRespondent.DataSet.Active :=true;
BBAdd.Enabled :=True;
BBEdit.Enabled :=True;
BBDelete.Enabled :=True;
Timer1.Enabled :=false;
end;


procedure TFMain.Otchet(Dannye: Boolean);
var
  t : TfrxMemoView;
  ID_Respondent,
  ID_Test       : Integer;
  Respondent,
  APDM          : String;
  TestDate,
  TestTime      : TDateTime;
  ID_Testing : integer;
begin
  with DM1 do
  begin
    // ������� ����� ���������� ������������
    with ADOQTesting do
    begin
      ID_Testing := FieldByName('ID_Testing').AsInteger;
      // ������� ����� �����������
      ID_Respondent := FieldByName('ID_Respondent').AsInteger;
      // ������� ����� ����
      ID_Test := FieldByName('ID_Test').AsInteger;
      // ������� ���� ������������
      TestDate := FieldByName('Testing_Date').AsDateTime;
      // ������� ����� ������������
      TestTime := FieldByName('Testing_Time').AsDateTime;
    end;
    // �������� � �� ����������
    with ADOQTemp do
    begin
      // ��������������� ������
      with SQL do
      begin
        // �������� ������ ������
        Clear;
        // ������� ������ ����������� �� ������ ��
        Add('SELECT * FROM Respondent WHERE ID_Respondent = '+IntToStr(ID_Respondent));
      end;
      // ������������ ������
      Active := true;
      // ������� ������ �����������
      Respondent := FieldByName('Family').AsString;
      Respondent := Respondent + ' ' + FieldByName('Name').AsString;
      Respondent := Respondent + ' ' + FieldByName('Surname').AsString;
    end;
    // �������� � �� ����
    with ADOQTemp do
    begin
      // ��������������� ������
      with SQL do
      begin
        // �������� ������ ������
        Clear;
        // ������� ������ ����������� �� ������ ��
        Add('SELECT * FROM Test WHERE ID_Test = '+IntToStr(ID_Test));
      end;
      // ������������ ������
      Active := true;
      // ������� ������ �����������
      APDM := FieldByName('NameTest').AsString;
    end;
    if Dannye then
    begin
      // ���������� ���������� ���������� ������������
      with ADOQResult do
      begin
        // ������� ������ ���������� ���������� ������������
        with SQL do
        begin
          // �������� "������" ������
          Clear;
          // ������� ���������� � ������������ � ��������� �������������
          Add('SELECT * FROM Result WHERE ID_Testing = '+IntToStr(ID_Testing));
        end;
        // ������������ ������
        Active := True;
      end;
    end
    else
    begin
      // ���������� ���������� ���������� ������������
      with ADOQProtocol do
      begin
        // ������� ������ ���������� ���������� ������������
        with SQL do
        begin
          // �������� "������" ������
          Clear;
          // ������� ���������� � ������������ � ��������� �������������
          Add('SELECT * FROM Protocol WHERE ID_Testing = '+IntToStr(ID_Testing));
        end;
        // ������������ ������
        Active := True;
      end;
    end;
    // ��������� ���� � ���������
    // ��������� �����
    if Dannye then
    begin
      FrxReport1.LoadFromFile(S+'\FastReport\Result.fr3');
    end
    else
    begin
    FrxReport1.LoadFromFile(S+'\FastReport\Protocol.fr3') ;
    end;
    // ������� ���������� � ������ ����� �� ����� (���� ��������� MemoResp)
    t := TfrxMemoView(frxReport1.FindObject('MemoResp'));
    // ���� ���������� Respondent �� ������
    if Respondent <> '' then
    // ���� ���� MemoResp � ������ ����������
      if t <> nil then
    // ��������� � ��� ���� �������� ���������� Respondent
        t.Memo.Text := Respondent;
    // ����������
    // ���������� ��������� � ����� �������� ����
    t := TfrxMemoView(frxReport1.FindObject('MemoAPDM'));
    if APDM <> '' then
      if t <> nil then
        t.Memo.Text := APDM;
    // ���������� ��������� � ����� ���� ������������
    t := TfrxMemoView(frxReport1.FindObject('MemoDate'));
    if DateToStr(TestDate) <> '' then
      if t <> nil then
        t.Memo.Text := DateToStr(TestDate);
    // ���������� ��������� � ����� ����� ������������
    t := TfrxMemoView(frxReport1.FindObject('MemoTime'));
    if TimeToStr(TestTime) <> '' then
      if t <> nil then
        t.Memo.Text := TimeToStr(TestTime);
    // ���������� �����
    if frxReport1.PrepareReport then
      frxReport1.ShowPreparedReport;
  end;
end;


end.
