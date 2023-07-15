program HotelReservation;

uses
  SysUtils, Crt;

type
  TCliente = record
    Nombre: string;
    Apellido: string;
    Cedula: string;
    Email: string;
    Telefono: string;
    DiasEstadia: Integer;
  end;

  TReservacion = record
    Cliente: TCliente;
    Habitacion: string;
    PrecioNoche: Currency;
  end;

var
  Clientes: array of TReservacion;

procedure MostrarMenuPrincipal;
begin
  ClrScr;
  Writeln('--- Hotel Lidotel Boutique Margarita ---');
  Writeln;
  Writeln('1. Nuevo Cliente');
  Writeln('2. Ver Clientes Registrados');
  Writeln('3. Salir');
  Writeln;
  Write('Ingrese la opcion: ');
end;

procedure MostrarDatosCliente(cliente: TCliente);
begin
  Writeln('Nombre: ', cliente.Nombre);
  Writeln('Apellido: ', cliente.Apellido);
  Writeln('Cedula: ', cliente.Cedula);
  Writeln('Email: ', cliente.Email);
  Writeln('Telefono: ', cliente.Telefono);
  Writeln('Dias de estadia: ', cliente.DiasEstadia);
end;

procedure MostrarDatosReservacion(reservacion: TReservacion);
begin
  MostrarDatosCliente(reservacion.Cliente);
  Writeln('Habitacion: ', reservacion.Habitacion);
  Writeln('Precio por noche: ', reservacion.PrecioNoche:0:2);
  Writeln('Total de la estadia: ', reservacion.PrecioNoche * reservacion.Cliente.DiasEstadia:0:2);
end;

function BuscarCliente(cedula: string): Integer;
var
  i: Integer;
begin
 
  for i := 0 to Length(Clientes) - 1 do
  begin
    if Clientes[i].Cliente.Cedula = cedula then
    begin
   
      Break;
    end;
  end;
end;

function ValidarNumero(entrada: string): Boolean;
var
  i: Integer;
begin
  
  for i := 1 to Length(entrada) do
  begin
    if not (entrada[i] in ['0'..'9']) then
    begin
      Break;
    end;
  end;
end;

function ValidarEmail(entrada: string): Boolean;
begin
  // Validar el formato del email (puede ser más complejo dependiendo de los requisitos)
end;

function ValidarCedula(entrada: string): Boolean;
begin
  // Validar la longitud y otros requisitos específicos para una cédula
end;

procedure NuevoCliente;
var
  cliente: TCliente;
  tipoReservacion: Integer;
  precioNoche: Currency;
begin
  ClrScr;
  Writeln('--- Registro de Nuevo Cliente ---');
  Writeln;
  
  Write('Nombre: ');
  Readln(cliente.Nombre);
  Write('Apellido: ');
  Readln(cliente.Apellido);
  
  repeat
    Write('Cedula: ');
    Readln(cliente.Cedula);
  until ValidarCedula(cliente.Cedula);
  
  repeat
    Write('Email: ');
    Readln(cliente.Email);
  until ValidarEmail(cliente.Email);
  
  Write('Telefono: ');
  Readln(cliente.Telefono);
  
  repeat
    Write('Dias de estadia: ');
    Readln(cliente.DiasEstadia);
  until cliente.DiasEstadia > 0;

  Writeln;
  Writeln('Seleccione el tipo de reservacion:');
  Writeln('1. Family Room');
  Write('Incluye:  Desayuno Buffet en el Restaurant Le Nouveau, acceso inalambrico a Internet (WIFI), Business Center, uso de nuestra exclusiva piscina, acceso a nuestro gimnasio, sillas y toldos en la playa, kit de vanidades y ninos de 0 a 2 anos sin recargos.');
  writeln('     ');
  Writeln('2. Doble');
  Write('Incluye: Desayuno Buffet en el Restaurant Le Nouveau, acceso inalambrico a Internet (WIFI), acceso a las instalaciones del Business Center, uso de nuestra exclusiva piscina, acceso a nuestro moderno gimnasio y Kit de vanidades. Ninos de 0 a 2 anos sin recargos');
  writeln('     ');
  Writeln('3. Sencilla');
  Write('Incluye: Desayuno Buffet en Restaurant Le Nouveau, acceso inalambrico a Internet (WIFI), acceso a las instalaciones del Business Center, uso de nuestra exclusiva piscina, acceso a nuestro moderno gimnasio y Kit de vanidades. Ninos de 0 a 2 anos sin recargos.');
  writeln('     ');
  Writeln('4. Suite');
  Write(' Incluye: Desayuno Buffet en el Restaurant Le Nouveau, acceso inalambrico a Internet (WIFI), Business Center, uso de nuestra exclusiva piscina, acceso a nuestro gimnasio, sillas y toldos en la playa, kit de vanidades y ninos de 0 a 2 anos sin recargos.');
  writeln('     ');
  repeat
	writeln('     ');
    Write('Opcion: ');
    Readln(tipoReservacion);
  until (tipoReservacion >= 1) and (tipoReservacion <= 4);
  
  case tipoReservacion of
    1:
    begin
      cliente.DiasEstadia := cliente.DiasEstadia;
      precioNoche := 200.0;
    end;
    2:
    begin
      cliente.DiasEstadia := cliente.DiasEstadia;
      precioNoche := 120.0;
    end;
    3:
    begin
      cliente.DiasEstadia := cliente.DiasEstadia;
      precioNoche := 60.0;
    end;
    4:
    begin
		cliente.DiasEstadia := cliente.DiasEstadia;
		precioNoche := 300.0;
		end;
  end;

  SetLength(Clientes, Length(Clientes) + 1);
  Clientes[Length(Clientes) - 1].Cliente := cliente;
  Clientes[Length(Clientes) - 1].Habitacion := 'Habitacion seleccionada';
  Clientes[Length(Clientes) - 1].PrecioNoche := precioNoche;

  ClrScr;
  Writeln('--- Reservacion completada ---');
  MostrarDatosReservacion(Clientes[Length(Clientes) - 1]);
  Writeln;
  Write('Presione cualquier tecla para continuar...');
  ReadKey;
end;

procedure VerClientesRegistrados;
var
  i: Integer;
begin
  ClrScr;
  Writeln('--- Clientes Registrados ---');
  Writeln;
  
  if Length(Clientes) = 0 then
  begin
    Writeln('No hay clientes registrados.');
  end
  else
  begin
    for i := 0 to Length(Clientes) - 1 do
    begin
      Writeln('--- Cliente ', i + 1, ' ---');
      MostrarDatosReservacion(Clientes[i]);
      Writeln;
    end;
  end;
  
  Writeln;
  Write('Presione cualquier tecla para continuar...');
  ReadKey;
end;

procedure EjecutarMenuPrincipal;
var
  opcion: Char;
begin
  repeat
    MostrarMenuPrincipal;
    Readln(opcion);
    
    case opcion of
      '1': NuevoCliente;
      '2': VerClientesRegistrados;
      '3': Exit;
    end;
  until False;
end;

begin
  EjecutarMenuPrincipal;
end.
