unit TestIndex;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Datasnap.DBClient, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, System.DateUtils;

type

  TActionClientDataset = reference to procedure;

  TForm1 = class(TForm)
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btfilter1: TButton;
    btfilter2: TButton;
    btlimpar: TButton;
    findk1: TButton;
    locate2: TButton;
    locate1: TButton;
    findk2: TButton;
    removeindex: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure btfilter2Click(Sender: TObject);
    procedure btfilter1Click(Sender: TObject);
    procedure btlimparClick(Sender: TObject);
    procedure locate2Click(Sender: TObject);
    procedure locate1Click(Sender: TObject);
    procedure findk1Click(Sender: TObject);
    procedure findk2Click(Sender: TObject);
    procedure removeindexClick(Sender: TObject);
  private
    TempoInicial: TDateTime;
    TempoFinal: TDateTime;
    procedure CriarClientDataset;
    procedure AtualizarRecordCount;
    procedure ShowMessageTempo;
    procedure ExecutarMetodoClientDataSet(pActionCDS: TActionClientDataset);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  CriarClientDataset;
end;

procedure TForm1.CriarClientDataset;
var
  j: Integer;
  i: Integer;
  k: Integer;
begin
  if (not ClientDataSet1.IsEmpty) then
    Exit;

// comentado opção com field string
//  ClientDataSet1.FieldDefs.Add('CAMPO01', ftstring, 10);
  ClientDataSet1.FieldDefs.Add('CAMPO01', ftInteger);
  ClientDataSet1.FieldDefs.Add('CAMPO02', ftInteger);
  ClientDataSet1.FieldDefs.Add('CAMPO03', ftInteger);
  ClientDataSet1.CreateDataSet;
  ClientDataSet1.EmptyDataset;
  
  for i := 1 to 100  do
    for j := 1 to 100  do
      for k := 1 to 100  do
        ClientDataSet1.AppendRecord([ClientDataSet1.recordcount+1, j, k]);
//       ClientDataSet1.AppendRecord(['A'+IntToStr(ClientDataSet1.recordcount+1), j, k]);

  ClientDataSet1.First;
  DataSource1.DataSet := ClientDataSet1;
  AtualizarRecordCount;
end;

procedure TForm1.ExecutarMetodoClientDataSet(pActionCDS: TActionClientDataset);
begin
   try
    ClientDataSet1.DisableControls;
    TempoInicial := Now;
    pActionCDS;
    TempoFinal := Now;
    ShowMessageTempo;
  finally
    ClientDataSet1.EnableControls;
  end;
end;

procedure TForm1.btfilter1Click(Sender: TObject);
begin
  ExecutarMetodoClientDataSet(procedure
    begin
//      ClientDataSet1.Filter := 'CAMPO01 = ' + QuotedStr('A508475');
      ClientDataSet1.Filter := 'CAMPO01 = 508475';
      ClientDataSet1.Filtered := true;
      Label2.Caption := 'Filtro/Range: 508475';
    end
  );
end;

procedure TForm1.btfilter2Click(Sender: TObject);
begin
  ExecutarMetodoClientDataSet(procedure
    begin
      ClientDataSet1.Filter := 'CAMPO01 = 805406 and CAMPO02 = 55';
      ClientDataSet1.Filtered := true;
      Label2.Caption := 'Filtro(RANGE): 805406;55';
    end
  );
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  ExecutarMetodoClientDataSet(procedure
    begin
      ClientDataSet1.SetRange([888888, 89], [888888, 89]);
      Label2.Caption := 'Filtro(RANGE): 888888;89';
    end
  );
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
   ExecutarMetodoClientDataSet(procedure
    begin
//      ClientDataSet1.SetRange(['A341876'], ['A341876']);
      ClientDataSet1.SetRange(['341876'], ['341876']);
      Label2.Caption := 'Filtro(RANGE): 341876';
    end);
end;

procedure TForm1.findk1Click(Sender: TObject);
begin
  ExecutarMetodoClientDataSet(procedure
    begin
      ClientDataSet1.FindKey([223663]);
    end
  );
end;

procedure TForm1.findk2Click(Sender: TObject);
begin
  ExecutarMetodoClientDataSet(procedure
    begin
      ClientDataSet1.FindKey([702455, 25]);
    end
  );
end;

procedure TForm1.AtualizarRecordCount;
begin
  Label3.Caption := Format('Record Count: %d', [ClientDataSet1.Recordcount]);
end;

procedure TForm1.locate1Click(Sender: TObject);
begin
  ExecutarMetodoClientDataSet(procedure
    begin
      ClientDataSet1.Locate('CAMPO01', 787689, []);
    end
  );
end;

procedure TForm1.locate2Click(Sender: TObject);
begin
  ExecutarMetodoClientDataSet(procedure
    begin
      ClientDataSet1.Locate('CAMPO01;CAMPO02', VarArrayOf([787685, 77]), []);
    end
  );
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  try
    ClientDataSet1.DisableControls;
    ClientDataSet1.IndexFieldNames := 'CAMPO01;CAMPO02';
    Label1.Caption := 'Index: CAMPO01;CAMPO02';
  finally
    ClientDataSet1.EnableControls;
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  try
    ClientDataSet1.DisableControls;
    ClientDataSet1.IndexFieldNames := 'CAMPO01';
    Label1.Caption := 'Index: CAMPO01';
  finally
    ClientDataSet1.EnableControls;
  end;
end;

procedure TForm1.removeindexClick(Sender: TObject);
begin
  Label1.Caption := 'Index: ';
  ClientDataSet1.IndexFieldNames := '';
end;

procedure TForm1.ShowMessageTempo;
var
  nValue: Int64;
begin
  nValue := System.DateUtils.MilliSecondsBetween(TempoInicial, TempoFinal);
  ShowMessageFmt('Tempo execução %d ms', [nValue]);
end;

procedure TForm1.btlimparClick(Sender: TObject);
begin
  ClientDataSet1.Filtered := False;
  ClientDataSet1.cancelRange;
  Label2.Caption := 'Filtro(RANGE): ';
  AtualizarRecordCount;
end;

end.
