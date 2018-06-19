unit Result;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons;

type
  TFResult = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Bevel1: TBevel;
    L1: TLabel;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FResult: TFResult;

implementation

{$R *.dfm}

uses Test, Variable;

procedure TFResult.FormActivate(Sender: TObject);
begin
  SetBounds( Left - ClientOrigin.X, Top - ClientOrigin.Y, GetDeviceCaps(
 Canvas.handle, HORZRES ) + (Width - ClientWidth), GetDeviceCaps( Canvas.handle,VERTRES )
 + (Height - ClientHeight ));

 Bevel1.Width := ClientWidth div 2;
 Bevel1.Left := (ClientWidth div 2)-(Bevel1.Width div 2);
 L1.Left := ((Bevel1.Left + Bevel1.Width) div 2);
  Label1.Left := ((Bevel1.Left + Bevel1.Width) div 2);
 BitBtn1.Left := (ClientWidth div 2)-(BitBtn1.Width div 2);
 Label2.Left := ((Bevel1.Left + Bevel1.Width) div 2);
 Label3.Left := ((Bevel1.Left + Bevel1.Width) div 2);
 Label4.Left := ((Bevel1.Left + Bevel1.Width) div 2);
 Label5.Left := ((Bevel1.Left + Bevel1.Width) div 2);
 Label6.Left := ((Bevel1.Left + Bevel1.Width) div 2);

L1.Caption:= '»Ó ='+inttostr(io);
Label1.Caption:= '»‰ ='+inttostr(id);
Label2.Caption:= '»Ì ='+inttostr(inn);
Label3.Caption:= '»Ò ='+inttostr(iss);
Label4.Caption:= '»Ô ='+inttostr(ip);
Label5.Caption:= '»Ï ='+inttostr(im);
Label6.Caption:= '»Á ='+inttostr(iz);
Panel1.Caption := '–ÂÁÛÎ¸Ú‡Ú '+SN;
end;

procedure TFResult.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key = '0' then BitBtn1.Click;
end;

end.
