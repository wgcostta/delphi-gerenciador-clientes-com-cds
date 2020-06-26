unit Ufrm_Splash;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  Tfrm_Slash = class(TForm)
    Label1: TLabel;
    Timer1: TTimer;
    ProgressBar1: TProgressBar;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Slash: Tfrm_Slash;

implementation

{$R *.dfm}

end.
