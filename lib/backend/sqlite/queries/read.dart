import '/backend/sqlite/queries/sqlite_row.dart';
import 'package:sqflite/sqflite.dart';

Future<List<T>> _readQuery<T>(
  Database database,
  String query,
  T Function(Map<String, dynamic>) create,
) =>
    database.rawQuery(query).then((r) => r.map((e) => create(e)).toList());

/// BEGIN LISTARFOTOS
Future<List<ListarFotosRow>> performListarFotos(
  Database database,
    {int? idFicha}
) {
  final query = '''
SELECT idFichaArchivoMovil, titulo, comentario, rutalocal, nombre, extension
FROM FichasArchivos WHERE idFicha = ${idFicha} and estadoAuditoria = '1'
''';
  return _readQuery(database, query, (d) => ListarFotosRow(d));
}

class ListarFotosRow extends SqliteRow {
  ListarFotosRow(Map<String, dynamic> data) : super(data);

  int? get id => data['idFichaArchivoMovil'] as int?;
  String? get titulo => data['titulo'] as String?;
  String? get comentario => data['comentario'] as String?;
  String? get imagen => data['rutalocal'] as String?;
  String? get nombre => data['nombre'] as String?;
  String? get extension => data['extension'] as String?;
}

/// END LISTARFOTOS

/// BEGIN LISTARFIRMAS
Future<List<ListarFirmasRow>> performListarFirmas(
  Database database,
     {int? idFicha}
) {
  final query = '''
SELECT 
    idFichaFirmaMovil, 
    idTipoPersona, 
    idTipoDocumento, 
    numDocumento, 
    apellidoPaterno, 
    apellidoMaterno,
    rutalocal,
    nombres,
    nombres || ' ' || apellidoPaterno || ' ' || apellidoMaterno AS NombresCompletos
FROM FichasFirmas WHERE idFicha = ${idFicha} and estadoAuditoria = '1'

''';
  return _readQuery(database, query, (d) => ListarFirmasRow(d));
}

class ListarFirmasRow extends SqliteRow {
  ListarFirmasRow(Map<String, dynamic> data) : super(data);

  int? get id => data['idFichaFirmaMovil'] as int?;
  int? get persona => data['idTipoPersona'] as int?;
  int? get documento => data['idTipoDocumento'] as int?;
  String? get numeroDoc => data['numDocumento'] as String?;
  String? get apePaterno => data['apellidoPaterno'] as String?;
  String? get apeMaterno => data['apellidoMaterno'] as String?;
  String? get image => data['rutalocal'] as String?;
  String? get nombre => data['nombres'] as String?;
  String? get nombresCompletos => data['NombresCompletos'] as String?;
}

/// END LISTARFIRMAS

/// BEGIN LISTARINSPECCIONES
Future<List<ListarInspeccionesRow>> performListarInspecciones(
  Database database, {
      String? dniInspector,
}
) {
  final query = '''
SELECT 
    idInspeccion, 
    nombreEvento, 
    idFicha, 
    idPlantilla, 
    codigoLocalColegio, 
    nombreLocalColegio,
    departamentoColegio,
    provinciaColegio,
    distritoColegio,
    idEstado,
    estado,
    modificadoMovil
FROM Inspecciones where dniInspector = '${dniInspector}';
''';
  return _readQuery(database, query, (d) => ListarInspeccionesRow(d));
}

class ListarInspeccionesRow extends SqliteRow {
  ListarInspeccionesRow(Map<String, dynamic> data) : super(data);

  int? get idInspeccion => data['idInspeccion'] as int?;
  String? get nombreEvento => data['nombreEvento'] as String?;
  int? get idFicha => data['idFicha'] as int?;
  int? get idPlantilla => data['idPlantilla'] as int?;
  String? get codigoLocalColegio => data['codigoLocalColegio'] as String?;
  String? get nombreLocalColegio => data['nombreLocalColegio'] as String?;
  String? get departamentoColegio => data['departamentoColegio'] as String?;
  String? get provinciaColegio => data['provinciaColegio'] as String?;
  String? get distritoColegio => data['distritoColegio'] as String?;
  int? get idEstado => data['idEstado'] as int?;
  String? get estado => data['estado'] as String?;
  int? get modificadoMovil => data['modificadoMovil'] as int?;
}

/// END LISTARINSPECCIONES
///

/// BEGIN LISTARINSPECCIONES
Future<List<ListarInspeccionesMod1Row>> performListarInspeccionesMod1(
    Database database,
    {String? dniInspector}
    ) {
  final query = '''
SELECT 
    idInspeccion, 
    idFicha, 
    idEstado,
    modificadoMovil,
    usuarioCreacionAuditoria,
    usuarioModificacionAuditoria,
    fechaCreacionAuditoria,
    fechaModificacionAuditoria,
    equipoCreacionAuditoria,
    equipoModificacionAuditoria,
    programaCreacionAuditoria,
    programaModificacionAuditoria
FROM Inspecciones where dniInspector = '${dniInspector}'
''';
  return _readQuery(database, query, (d) => ListarInspeccionesMod1Row(d));
}

class ListarInspeccionesMod1Row extends SqliteRow {
  ListarInspeccionesMod1Row(Map<String, dynamic> data) : super(data);

  int? get idInspeccion => data['idInspeccion'] as int?;
  int? get idFicha => data['idFicha'] as int?;
  int? get idEstado => data['idEstado'] as int?;
  int? get modificadoMovil => data['modificadoMovil'] as int?;
  String? get usuarioCreacionAuditoria => data['usuarioCreacionAuditoria'] as String?;
  String? get usuarioModificacionAuditoria => data['usuarioModificacionAuditoria'] as String?;
  String? get fechaCreacionAuditoria => data['fechaCreacionAuditoria'] as String?;
  String? get fechaModificacionAuditoria => data['fechaModificacionAuditoria'] as String?;
  String? get equipoCreacionAuditoria => data['equipoCreacionAuditoria'] as String?;
  String? get equipoModificacionAuditoria => data['equipoModificacionAuditoria'] as String?;
  String? get programaCreacionAuditoria => data['programaCreacionAuditoria'] as String?;
  String? get programaModificacionAuditoria => data['programaModificacionAuditoria'] as String?;
}



/// BEGIN LISTARINSPECCIONESPROCESS
Future<List<ListarInspeccionesProcessRow>> performListarInspeccionesProcess(
  Database database,{
    String? dniInspector,
}
) {
  final query = '''
SELECT 
    idInspeccion, 
    nombreEvento, 
    idFicha, 
    idPlantilla, 
    codigoLocalColegio, 
    nombreLocalColegio,
    departamentoColegio,
    provinciaColegio,
    distritoColegio,
    idEstado,
    estado,
    modificadoMovil
FROM Inspecciones where idEstado = 4 and dniInspector = '${dniInspector}'
''';
  return _readQuery(database, query, (d) => ListarInspeccionesProcessRow(d));
}

class ListarInspeccionesProcessRow extends SqliteRow {
  ListarInspeccionesProcessRow(Map<String, dynamic> data) : super(data);

  int? get idInspeccion => data['idInspeccion'] as int?;
  String? get nombreEvento => data['nombreEvento'] as String?;
  int? get idFicha => data['idFicha'] as int?;
  int? get idPlantilla => data['idPlantilla'] as int?;
  String? get codigoLocalColegio => data['codigoLocalColegio'] as String?;
  String? get nombreLocalColegio => data['nombreLocalColegio'] as String?;
  String? get departamentoColegio => data['departamentoColegio'] as String?;
  String? get provinciaColegio => data['provinciaColegio'] as String?;
  String? get distritoColegio => data['distritoColegio'] as String?;
  int? get idEstado => data['idEstado'] as int?;
  String? get estado => data['estado'] as String?;
  int? get modificadoMovil => data['modificadoMovil'] as int?;
}

/// END LISTARINSPECCIONESPROCESS

/// BEGIN LISTARINSPECCIONESREALIZADA
Future<List<ListarInspeccionesRealizadaRow>> performListarInspeccionesRealizada(
  Database database,{
    String? dniInspector,
}
) {
  final query = '''
SELECT 
    idInspeccion, 
    nombreEvento, 
    idFicha, 
    idPlantilla, 
    codigoLocalColegio, 
    nombreLocalColegio,
    departamentoColegio,
    provinciaColegio,
    distritoColegio,
    idEstado,
    estado,
    modificadoMovil
FROM Inspecciones where idEstado = 3 and dniInspector = '${dniInspector}'
''';
  return _readQuery(database, query, (d) => ListarInspeccionesRealizadaRow(d));
}

class ListarInspeccionesRealizadaRow extends SqliteRow {
  ListarInspeccionesRealizadaRow(Map<String, dynamic> data) : super(data);

  int? get idInspeccion => data['idInspeccion'] as int?;
  String? get nombreEvento => data['nombreEvento'] as String?;
  int? get idFicha => data['idFicha'] as int?;
  int? get idPlantilla => data['idPlantilla'] as int?;
  String? get codigoLocalColegio => data['codigoLocalColegio'] as String?;
  String? get nombreLocalColegio => data['nombreLocalColegio'] as String?;
  String? get departamentoColegio => data['departamentoColegio'] as String?;
  String? get provinciaColegio => data['provinciaColegio'] as String?;
  String? get distritoColegio => data['distritoColegio'] as String?;
  int? get idEstado => data['idEstado'] as int?;
  String? get estado => data['estado'] as String?;
  int? get modificadoMovil => data['modificadoMovil'] as int?;
}

/// END LISTARINSPECCIONESREALIZADA

/// BEGIN LISTARINSPECCIONESPROGRAMADA
Future<List<ListarInspeccionesProgramadaRow>>
    performListarInspeccionesProgramada(
  Database database, {
    String? dniInspector,
}
) {
  final query = '''
SELECT 
    idInspeccion, 
    nombreEvento, 
    idFicha, 
    idPlantilla, 
    codigoLocalColegio, 
    nombreLocalColegio,
    departamentoColegio,
    provinciaColegio,
    distritoColegio,
    idEstado,
    estado,
    modificadoMovil
FROM Inspecciones where idEstado = 2 and dniInspector = '${dniInspector}';
''';
  return _readQuery(database, query, (d) => ListarInspeccionesProgramadaRow(d));
}

class ListarInspeccionesProgramadaRow extends SqliteRow {
  ListarInspeccionesProgramadaRow(Map<String, dynamic> data) : super(data);

  int? get idInspeccion => data['idInspeccion'] as int?;
  String? get nombreEvento => data['nombreEvento'] as String?;
  int? get idFicha => data['idFicha'] as int?;
  int? get idPlantilla => data['idPlantilla'] as int?;
  String? get codigoLocalColegio => data['codigoLocalColegio'] as String?;
  String? get nombreLocalColegio => data['nombreLocalColegio'] as String?;
  String? get departamentoColegio => data['departamentoColegio'] as String?;
  String? get provinciaColegio => data['provinciaColegio'] as String?;
  String? get distritoColegio => data['distritoColegio'] as String?;
  int? get idEstado => data['idEstado'] as int?;
  String? get estado => data['estado'] as String?;
  int? get modificadoMovil => data['modificadoMovil'] as int?;
}

/// END LISTARINSPECCIONESPROGRAMADA

/// BEGIN LISTARFICHAPORIDFICHA
Future<List<ListarFichaPorIdFichaRow>> performListarFichaPorIdFicha(
  Database database, {
  int? idFicha,
}) {
  final query = '''
SELECT
    idFicha,
    IdPlantilla,
    CodigoLocalColegio,
    NombreLocalColegio,
    DepartamentoColegio,
    ProvinciaColegio,
    DistritoColegio,
    CentroPobladoColegio,
    DireccionColegio,
    ZonaColegio,
    TotalPabellon,
    TotalAulas,
    TotalSSHH,
    DniInspector,
    NombreInspector,
    CorreoInspector,
    TelefonoInspector,
    FechaInspeccion,
    HoraInspeccion,
    TipoInspeccion,
    DniDirector,
    NombreDirector,
    CorreoDirector,
    TelefonoDirector,
    DniAlterno,
    NombreAlterno,
    CorreoAlterno,
    TelefonoAlterno
FROM Fichas
WHERE idFicha = '${idFicha}';

''';
  return _readQuery(database, query, (d) => ListarFichaPorIdFichaRow(d));
}

class ListarFichaPorIdFichaRow extends SqliteRow {
  ListarFichaPorIdFichaRow(Map<String, dynamic> data) : super(data);

  int? get idFicha => data['idFicha'] as int?;
  int? get idPlantilla => data['IdPlantilla'] as int?;
  String? get codigoLocalColegio => data['CodigoLocalColegio'] as String?;
  String? get nombreLocalColegio => data['NombreLocalColegio'] as String?;
  String? get departamentoColegio => data['DepartamentoColegio'] as String?;
  String? get provinciaColegio => data['ProvinciaColegio'] as String?;
  String? get distritoColegio => data['DistritoColegio'] as String?;
  String? get centroPobladoColegio => data['CentroPobladoColegio'] as String?;
  String? get direccionColegio => data['DireccionColegio'] as String?;
  String? get zonaColegio => data['ZonaColegio'] as String?;
  int? get totalPabellon => data['TotalPabellon'] as int?;
  int? get totalAulas => data['TotalAulas'] as int?;
  int? get totalSSHH => data['TotalSSHH'] as int?;
  String? get dniInspector => data['DniInspector'] as String?;
  String? get nombreInspector => data['NombreInspector'] as String?;
  String? get correoInspector => data['CorreoInspector'] as String?;
  String? get telefonoInspector => data['TelefonoInspector'] as String?;
  String? get fechaInspeccion => data['FechaInspeccion'] as String?;
  String? get horaInspeccion => data['HoraInspeccion'] as String?;
  String? get tipoInspeccion => data['TipoInspeccion'] as String?;
  String? get dniDirector => data['DniDirector'] as String?;
  String? get nombreDirector => data['NombreDirector'] as String?;
  String? get correoDirector => data['CorreoDirector'] as String?;
  String? get telefonoDirector => data['TelefonoDirector'] as String?;
  String? get dniAlterno => data['DniAlterno'] as String?;
  String? get nombreAlterno => data['NombreAlterno'] as String?;
  String? get correoAlterno => data['CorreoAlterno'] as String?;
  String? get telefonoAlterno => data['TelefonoAlterno'] as String?;
}

/// END LISTARFICHAPORIDFICHA

/// BEGIN LISTARINSPECCIONESPORIDFICHA
Future<List<ListarInspeccionesPorIdFichaRow>>
    performListarInspeccionesPorIdFicha(
  Database database, {
  int? idFicha,
}) {
  final query = '''
SELECT 
    idInspeccion, 
    nombreEvento, 
    idFicha, 
    idPlantilla, 
    codigoLocalColegio, 
    nombreLocalColegio,
    departamentoColegio,
    provinciaColegio,
    distritoColegio,
    idEstado,
    estado,
    modificadoMovil
FROM Inspecciones where idFicha = '${idFicha}';
''';
  return _readQuery(database, query, (d) => ListarInspeccionesPorIdFichaRow(d));
}

class ListarInspeccionesPorIdFichaRow extends SqliteRow {
  ListarInspeccionesPorIdFichaRow(Map<String, dynamic> data) : super(data);

  int? get idInspeccion => data['idInspeccion'] as int?;
  String? get nombreEvento => data['nombreEvento'] as String?;
  int? get idFicha => data['idFicha'] as int?;
  int? get idPlantilla => data['idPlantilla'] as int?;
  String? get codigoLocalColegio => data['codigoLocalColegio'] as String?;
  String? get nombreLocalColegio => data['nombreLocalColegio'] as String?;
  String? get departamentoColegio => data['departamentoColegio'] as String?;
  String? get provinciaColegio => data['provinciaColegio'] as String?;
  String? get distritoColegio => data['distritoColegio'] as String?;
  int? get idEstado => data['idEstado'] as int?;
  String? get estado => data['estado'] as String?;
  int? get modificadoMovil => data['modificadoMovil'] as int?;
}

/// END LISTARINSPECCIONESPORIDFICHA

/// BEGIN LISTARFICHASMODULARESPORIDFICHA
Future<List<ListarFichasModularesPorIdFichaRow>>
    performListarFichasModularesPorIdFicha(
  Database database, {
  int? idFicha,
}) {
  final query = '''
SELECT 
    IdFichaModular, 
    IdFicha, 
    CodigoModular, 
    CodigoLocal, 
    CodigoNivel, 
    Nivel,
    CodigoTipoDocente,
    TipoDocente,
    CodigoTipoSexo,
    TipoSexo,
    CodigoTurno,
    Turno,
    NumeroHombres,
    NumeroMujeres,
    NumeroAlumnos,
    NumeroDocente,
    NumeroSeccion
FROM FichaModular where idFicha = '${idFicha}';
''';
  return _readQuery(
      database, query, (d) => ListarFichasModularesPorIdFichaRow(d));
}

class ListarFichasModularesPorIdFichaRow extends SqliteRow {
  ListarFichasModularesPorIdFichaRow(Map<String, dynamic> data) : super(data);

  int? get idFichaModular => data['IdFichaModular'] as int?;
  int? get idFicha => data['IdFicha'] as int?;
  String? get codigoModular => data['CodigoModular'] as String?;
  String? get codigoLocal => data['CodigoLocal'] as String?;
  String? get codigoNivel => data['CodigoNivel'] as String?;
  String? get nivel => data['Nivel'] as String?;
  String? get codigoTipoDocente => data['CodigoTipoDocente'] as String?;
  String? get tipoDocente => data['TipoDocente'] as String?;
  String? get codigoTipoSexo => data['CodigoTipoSexo'] as String?;
  String? get tipoSexo => data['TipoSexo'] as String?;
  String? get codigoTurno => data['CodigoTurno'] as String?;
  String? get turno => data['Turno'] as String?;
  int? get numeroHombres => data['NumeroHombres'] as int?;
  int? get numeroMujeres => data['NumeroMujeres'] as int?;
  int? get numeroAlumnos => data['NumeroAlumnos'] as int?;
  int? get numeroDocente => data['NumeroDocente'] as int?;
  int? get numeroSeccion => data['NumeroSeccion'] as int?;
}

/// BEGIN LISTARPLANTILLASECCION
Future<List<ListarPlantillaSeccionRow>> performListarPlantillaSeccion(
  Database database, {
  int? idPlantilla,
}) {
  final query = '''
SELECT 
    IdPlantillaSeccion, 
    IdPlantillaSeccionPadre, 
    IdPlantilla, 
    Descripcion, 
    ModoRepeticion 
FROM PlantillaSeccion 
WHERE IdPlantilla = '${idPlantilla}' AND IdPlantillaSeccionPadre = 0;


''';
  return _readQuery(database, query, (d) => ListarPlantillaSeccionRow(d));
}

class ListarPlantillaSeccionRow extends SqliteRow {
  ListarPlantillaSeccionRow(Map<String, dynamic> data) : super(data);

  int? get idPlantillaSeccion => data['IdPlantillaSeccion'] as int?;
  int? get idPlantillaSeccionPadre => (data['IdPlantillaSeccionPadre'] != null) ? data['IdPlantillaSeccionPadre'] as int? : null;
  int? get idPlantilla => data['IdPlantilla'] as int?;
  String? get descripcion => data['Descripcion'] as String?;
  String? get modoRepeticion => data['ModoRepeticion'] as String?;
}

/// END LISTARPLANTILLASECCION

/// BEGIN LISTARSUBSECCIONES
Future<List<ListarSubseccionesRow>> performListarSubsecciones(
  Database database, {
  int? idPlantilla,
  int? idPlantillaSeccionPadre,
}) {
  final query = '''
SELECT 
    IdPlantillaSeccion, 
    IdPlantillaSeccionPadre, 
    IdPlantilla, 
    Descripcion, 
    ModoRepeticion
FROM PlantillaSeccion 
WHERE IdPlantilla = '${idPlantilla}' and  IdPlantillaSeccionPadre  = '${idPlantillaSeccionPadre}' order by Descripcion asc;

''';
  return _readQuery(database, query, (d) => ListarSubseccionesRow(d));
}

class ListarSubseccionesRow extends SqliteRow {
  ListarSubseccionesRow(Map<String, dynamic> data) : super(data);

  int? get idPlantillaSeccion => data['IdPlantillaSeccion'] as int?;
  int? get idPlantillaSeccionPadre => data['IdPlantillaSeccionPadre'] as int?;
  int? get idPlantilla => data['IdPlantilla'] as int?;
  String? get descripcion => data['Descripcion'] as String?;
  String? get modoRepeticion => data['ModoRepeticion'] as String?;
}

Future<List<ListarSubseccionRow>> performListarSubseccion(
    Database database, {
      int? idPlantillaSeccion,
    }) {
  final query = '''
SELECT 
    IdPlantillaSeccion, 
    IdPlantillaSeccionPadre, 
    IdPlantilla, 
    Descripcion, 
    ModoRepeticion
FROM PlantillaSeccion 
WHERE IdPlantillaSeccion = ${idPlantillaSeccion};

''';
  return _readQuery(database, query, (d) => ListarSubseccionRow(d));
}

class ListarSubseccionRow extends SqliteRow {
  ListarSubseccionRow(Map<String, dynamic> data) : super(data);

  int? get idPlantillaSeccion => data['IdPlantillaSeccion'] as int?;
  int? get idPlantillaSeccionPadre => data['IdPlantillaSeccionPadre'] as int?;
  int? get idPlantilla => data['IdPlantilla'] as int?;
  String? get descripcion => data['Descripcion'] as String?;
  String? get modoRepeticion => data['ModoRepeticion'] as String?;
}

/// END LISTARSUBSECCIONES
///

///

/// BEGIN LISTARAULAS
Future<List<ListarAulas>> performListarAulas(
    Database database, {
      int? idFicha,
    }) {
  final query = '''
SELECT 
    TotalAulas  
FROM Fichas 
WHERE idFicha = ${idFicha};

''';
  return _readQuery(database, query, (d) => ListarAulas(d));
}

class ListarAulas extends SqliteRow {
  ListarAulas(Map<String, dynamic> data) : super(data);
  int? get totalAulas => data['TotalAulas'] as int?;
}

/// END LISTARAULAS


/// BEGIN LISTARPABELLON
Future<List<ListarPabellon>> performListarPabellon(
    Database database, {
      int? idFicha,
    }) {
  final query = '''
SELECT 
    TotalPabellon  
FROM Fichas 
WHERE idFicha = ${idFicha};

''';
  return _readQuery(database, query, (d) => ListarPabellon(d));
}

class ListarPabellon extends SqliteRow {
  ListarPabellon(Map<String, dynamic> data) : super(data);
  int? get totalPabellones => data['TotalPabellon'] as int?;
}



/// BEGIN LISTARPABELLON
Future<List<ListarLongitud>> performListarLongitud(
    Database database, {
      int? idFicha,
    }) {
  final query = '''
SELECT 
    Longitud  
FROM Fichas 
WHERE idFicha = ${idFicha};

''';
  return _readQuery(database, query, (d) => ListarLongitud(d));
}

class ListarLongitud extends SqliteRow {
  ListarLongitud(Map<String, dynamic> data) : super(data);
  double? get Longitud => data['Longitud'] as double?;
}

/// END LISTAPABELLON
///

/// BEGIN LISTARPABELLON
Future<List<ListarLatitud>> performListarLatitud(
    Database database, {
      int? idFicha,
    }) {
  final query = '''
SELECT 
    Latitud  
FROM Fichas 
WHERE idFicha = ${idFicha};

''';
  return _readQuery(database, query, (d) => ListarLatitud(d));
}

class ListarLatitud extends SqliteRow {
  ListarLatitud(Map<String, dynamic> data) : super(data);
  double? get Latitud => data['Latitud'] as double?;
}

/// BEGIN LISTARSSHH
Future<List<ListarSSHH>> performListarSSHH(
    Database database, {
      int? idFicha,
    }) {
  final query = '''
SELECT 
    TotalSSHH  
FROM Fichas 
WHERE idFicha = ${idFicha};

''';
  return _readQuery(database, query, (d) => ListarSSHH(d));
}

class ListarSSHH extends SqliteRow {
  ListarSSHH(Map<String, dynamic> data) : super(data);
  int? get totalSSHH => data['TotalSSHH'] as int?;
}
/// END LISTARSSHH

/// BEGIN LISTARPREGUNTAS
Future<List<ListarPreguntasRow>> performListarPreguntas(
  Database database, {
  int? idPlantillaSeccion,
  int? idPlantilla,
}) {
  final query = '''
SELECT 
    IdPlantillaPregunta, 
    IdPlantillaSeccion, 
    IdPregunta, 
    DescripcionPregunta, 
    FlagMandatorio, 
    IdPlantilla
FROM PlantillaPregunta where IdPlantillaSeccion =  '${idPlantillaSeccion}' 
and  IdPlantilla  = '${idPlantilla}';

''';
  return _readQuery(database, query, (d) => ListarPreguntasRow(d));
}

class ListarPreguntasRow extends SqliteRow {
  ListarPreguntasRow(Map<String, dynamic> data) : super(data);

  int? get idPlantillaPregunta => data['IdPlantillaPregunta'] as int?;
  int? get idPlantillaSeccion => data['IdPlantillaSeccion'] as int?;
  int? get idPregunta => data['IdPregunta'] as int?;
  String? get descripcionPregunta => data['DescripcionPregunta'] as String?;
  String? get flagMandatorio => data['FlagMandatorio'] as String?;
  int? get idPlantilla => data['IdPlantilla'] as int?;
}

/// END LISTARPREGUNTAS

/// BEGIN LISTAROPCIONES
Future<List<ListarOpcionesRow>> performListarOpciones(
  Database database, {
  int? idPlantilla,
  int? idPregunta,
  int? idPlantillaSeccion,
  int? idFicha,
  int? numero
}) {
  final query = '''
SELECT 
    po.IdPlantillaOpcion, 
    po.IdPlantillaSeccion, 
    po.IdPlantilla, 
    po.IdPregunta, 
    po.Descripcion, 
    po.ClasificacionOpcion,
    po.IdTipoOpcion,
    po.tipoOpcion,
    po.matIcon,
    fpr.respuesta as respuesta
FROM PlantillaOpcion po
LEFT JOIN FichaPreguntaRespuestas fpr ON po.IdPlantillaOpcion = fpr.IdPlantillaOpcion
    AND po.IdPregunta = fpr.IdPregunta
    AND po.IdPlantillaSeccion = fpr.IdPlantillaSeccion
    AND fpr.IdFicha = '${idFicha}'
    AND fpr.numerorepeticion =${numero}
WHERE 
    po.IdPlantillaSeccion = '${idPlantillaSeccion}'
    AND po.IdPlantilla = '${idPlantilla}'
    AND po.IdPregunta = '${idPregunta}'
    
''';
  return _readQuery(database, query, (d) => ListarOpcionesRow(d));
}

class ListarOpcionesRow extends SqliteRow {
  ListarOpcionesRow(Map<String, dynamic> data) : super(data);

  int? get idPlantillaOpcion => data['IdPlantillaOpcion'] as int?;
  int? get idPlantillaSeccion => data['IdPlantillaSeccion'] as int?;
  int? get idPlantilla => data['IdPlantilla'] as int?;
  int? get idPregunta => data['IdPregunta'] as int?;
  String? get descripcion => data['Descripcion'] as String?;
  String? get clasificacionOpcion => data['ClasificacionOpcion'] as String?;
  int? get idTipoOpcion => data['IdTipoOpcion'] as int?;
  String? get estadoAuditoria => data['EstadoAuditoria'] as String?;
  String? get tipoOpcion => data['tipoOpcion'] as String?;
  String? get matIcon => data['matIcon'] as String?;
  String? get respuesta => data['respuesta'] as String?;
}

/// END LISTAROPCIONES
///


Future<List<ListarPreguntasObligatoriasRow>> performListarObligatorias(
    Database database, {
      int? idFicha,
      int? numero,
      String? modorepeticion
    }) {
  final query = '''
SELECT 
		po.IdPlantillaOpcion, 
		po.IdPlantillaSeccion, 
		po.IdPlantilla, 
		po.IdPregunta, 
		po.Descripcion, 
		po.ClasificacionOpcion,
		po.IdTipoOpcion,
		po.tipoOpcion,
		po.matIcon,
		fpr.respuesta as respuesta,
	   pp.FlagMandatorio as mandatorio,
	   ps.ModoRepeticion as modorepeticion
	FROM PlantillaOpcion po
	LEFT JOIN FichaPreguntaRespuestas fpr ON po.IdPlantillaOpcion = fpr.IdPlantillaOpcion
		AND po.IdPregunta = fpr.IdPregunta
		AND po.IdPlantillaSeccion = fpr.IdPlantillaSeccion
		AND fpr.IdFicha =  ${idFicha}
		AND fpr.numerorepeticion =${numero}
	LEFT JOIN plantillapregunta pp ON  po.IdPregunta = pp.IdPregunta and po.IdPlantillaSeccion = pp.IdPlantillaSeccion and po.IdPlantilla = pp.IdPlantilla
	LEFT JOIN PlantillaSeccion ps ON PP.IdPlantillaSeccion = ps.IdPlantillaSeccion
	WHERE modorepeticion = '${modorepeticion}'
	and pp.FlagMandatorio='1'
	and fpr.respuesta is null 
    
''';
  return _readQuery(database, query, (d) => ListarPreguntasObligatoriasRow(d));
}

class ListarPreguntasObligatoriasRow extends SqliteRow {
  ListarPreguntasObligatoriasRow(Map<String, dynamic> data) : super(data);

  int? get idPlantillaOpcion => data['IdPlantillaOpcion'] as int?;
  int? get idPlantillaSeccion => data['IdPlantillaSeccion'] as int?;
  int? get idPlantilla => data['IdPlantilla'] as int?;
  int? get idPregunta => data['IdPregunta'] as int?;
  String? get descripcion => data['Descripcion'] as String?;
  String? get clasificacionOpcion => data['ClasificacionOpcion'] as String?;
  int? get idTipoOpcion => data['IdTipoOpcion'] as int?;
  String? get estadoAuditoria => data['EstadoAuditoria'] as String?;
  String? get tipoOpcion => data['tipoOpcion'] as String?;
  String? get matIcon => data['matIcon'] as String?;
  String? get respuesta => data['respuesta'] as String?;
  String? get mandatorio => data['mandatorio'] as String?;
  String? get modorepeticion => data['modorepeticion'] as String?;
}

/// END LISTAROPCIONES






/// BEGIN LISTARFICHASSINUPLOAD =1

Future<List<ListarFichasFirmas>> performListarFichaFirmas(Database database) {
  final query = '''
    SELECT *
    FROM FichasFirmas 
    WHERE uploadDocumento = 0;
  ''';
  return _readQuery(database, query, (data) => ListarFichasFirmas(data));
}

class ListarFichasFirmas extends SqliteRow {
  ListarFichasFirmas(Map<String, dynamic> data) : super(data);

  int? get idFichaFirmaMovil => data['idFichaFirmaMovil'] as int?;
  int? get idFichaFirma => data['idFichaFirma'] as int?;
  int? get idFicha => data['idFicha'] as int?;
  String? get nombres => data['nombres'] as String?;
  String? get apellidoPaterno => data['apellidoPaterno'] as String?;
  String? get apellidoMaterno => data['apellidoMaterno'] as String?;
  String? get nombreArchivo => data['nombreArchivo'] as String?;
  String? get extension => data['extension'] as String?;
  String? get ruta => data['ruta'] as String?;
  double? get peso => data['peso'] as double?;
  String? get tipoArchivo => data['tipoArchivo'] as String?;
  String? get numDocumento => data['numDocumento'] as String?;
  int? get idTipoDocumento => data['idTipoDocumento'] as int?;
  int? get idTipoPersona => data['idTipoPersona'] as int?;
  String? get estadoAuditoria => data['estadoAuditoria'] as String?;
  String? get usuarioCreacionAuditoria => data['usuarioCreacionAuditoria'] as String?;
  String? get usuarioModificacionAuditoria => data['usuarioModificacionAuditoria'] as String?;
  String? get fechaCreacionAuditoria => data['fechaCreacionAuditoria'] as String?;
  String? get fechaModificacionAuditoria => data['fechaModificacionAuditoria'] as String?;
  String? get equipoCreacionAuditoria => data['equipoCreacionAuditoria'] as String?;
  String? get equipoModificacionAuditoria => data['equipoModificacionAuditoria'] as String?;
  String? get programaCreacionAuditoria => data['programaCreacionAuditoria'] as String?;
  String? get programaModificacionAuditoria => data['programaModificacionAuditoria'] as String?;
  int? get modificacionMovil => data['modificacionMovil'] as int?;
  int? get uploadDocumento => data['uploadDocumento'] as int?;
  String? get rutalocal => data['rutalocal'] as String?;
}


///END LISTARFICHASSINUPLOAD
///
///

/// BEGIN LISTARFICHASSINUPLOAD =1

Future<List<ListarFichasArchivos>> performListarFichaArchivos(Database database) {
  final query = '''
    SELECT *
    FROM FichasArchivos 
    WHERE uploadDocumento = 0;
  ''';
  return _readQuery(database, query, (data) => ListarFichasArchivos(data));
}

class ListarFichasArchivos extends SqliteRow {
  ListarFichasArchivos(Map<String, dynamic> data) : super(data);
  int? get idFichaArchivoMovil => data['idFichaArchivoMovil'] as int?;
  int? get idFichaArchivo => data['idFichaArchivo'] as int?;
  int? get idFicha => data['idFicha'] as int?;
  String? get nombre => data['nombre'] as String?;
  String? get extension => data['extension'] as String?;
  String? get ruta => data['ruta'] as String?;
  double? get peso => data['peso'] as double?;
  String? get estadoAuditoria => data['estadoAuditoria'] as String?;
  String? get usuarioCreacionAuditoria => data['usuarioCreacionAuditoria'] as String?;
  String? get usuarioModificacionAuditoria => data['usuarioModificacionAuditoria'] as String?;
  String? get fechaCreacionAuditoria => data['fechaCreacionAuditoria'] as String?;
  String? get fechaModificacionAuditoria => data['fechaModificacionAuditoria'] as String?;
  String? get equipoCreacionAuditoria => data['equipoCreacionAuditoria'] as String?;
  String? get equipoModificacionAuditoria => data['equipoModificacionAuditoria'] as String?;
  String? get programaCreacionAuditoria => data['programaCreacionAuditoria'] as String?;
  String? get programaModificacionAuditoria => data['programaModificacionAuditoria'] as String?;
  int? get modificadoMovil => data['modificadoMovil'] as int?;
  int? get uploadDocumento => data['uploadDocumento'] as int?;
  String? get rutalocal => data['rutalocal'] as String?;
  String? get titulo => data['titulo'] as String?;
  String? get comentario => data['comentario'] as String?;
}



Future<List<ListarFichasPreguntaArchivos>> performListarFichaPreguntaArchivos(Database database) {
  final query = '''
    SELECT *
    FROM FichaPreguntaArchivo 
    WHERE uploadDocumento = 0;
  ''';
  return _readQuery(database, query, (data) => ListarFichasPreguntaArchivos(data));
}

class ListarFichasPreguntaArchivos extends SqliteRow {
  ListarFichasPreguntaArchivos(Map<String, dynamic> data) : super(data);
  int? get idFichaPreguntaArchivoLocal => data['IdFichaPreguntaArchivoLocal'] as int?;
  int? get idFichaPreguntaArchivo => data['IdFichaPreguntaArchivo'] as int?;
  int? get idFicha => data['IdFicha'] as int?;
  int? get idPregunta => data['IdPregunta'] as int?;
  int? get idPlantillaSeccion => data['idPlantillaSeccion'] as int?;
  String? get numeroRepeticion => data['numeroRepeticion'] as String?;
  String? get nombre => data['Nombre'] as String?;
  String? get extension => data['Extension'] as String?;
  String? get ruta => data['Ruta'] as String?;
  String? get rutalocal => data['rutaLocal'] as String?;
  String? get peso => data['Peso'] as String?;
  String? get estadoAuditoria => data['EstadoAuditoria'] as String?;
  String? get usuarioCreacionAuditoria => data['UsuarioCreacionAuditoria'] as String?;
  String? get usuarioModificacionAuditoria => data['UsuarioModificacionAuditoria'] as String?;
  String? get fechaCreacionAuditoria => data['FechaCreacionAuditoria'] as String?;
  String? get fechaModificacionAuditoria => data['FechaModificacionAuditoria'] as String?;
  String? get equipoCreacionAuditoria => data['EquipoCreacionAuditoria'] as String?;
  String? get equipoModificacionAuditoria => data['EquipoModificacionAuditoria'] as String?;
  String? get programaCreacionAuditoria => data['ProgramaCreacionAuditoria'] as String?;
  String? get programaModificacionAuditoria => data['ProgramaModificacionAuditoria'] as String?;
  int? get modificadoMovil => data['modificadoMovil'] as int?;
  int? get uploadDocumento => data ['uploadDocumento'] as int?;
}

///END LISTARFICHASSINUPLOAD


/// BEGIN LISTARPREGUNTAS
Future<List<ListarFichasModificacion>> performListarFichaMod(Database database, {
  String? dniInspector,
}) {
  final query = '''
    SELECT *
    FROM Fichas 
    WHERE modificadoMovil = 1 and DniInspector = '${dniInspector}'
  ''';
  return _readQuery(database, query, (data) => ListarFichasModificacion(data));
}

class ListarFichasModificacion extends SqliteRow {
  ListarFichasModificacion(Map<String, dynamic> data) : super(data);

  int? get idFichaLocal => data['IdFichaLocal'] as int?;
  int? get idFicha => data['idFicha'] as int?;
  int? get idPlantilla => data['IdPlantilla'] as int?;
  String? get codigoLocalColegio => data['CodigoLocalColegio'] as String?;
  String? get nombreLocalColegio => data['NombreLocalColegio'] as String?;
  String? get departamentoColegio => data['DepartamentoColegio'] as String?;
  String? get provinciaColegio => data['ProvinciaColegio'] as String?;
  String? get distritoColegio => data['DistritoColegio'] as String?;
  String? get centroPobladoColegio => data['CentroPobladoColegio'] as String?;
  String? get direccionColegio => data['DireccionColegio'] as String?;
  String? get zonaColegio => data['ZonaColegio'] as String?;
  int? get totalPabellon => data['TotalPabellon'] as int?;
  int? get totalAulas => data['TotalAulas'] as int?;
  int? get totalSSHH => data['TotalSSHH'] as int?;
  String? get dniInspector => data['DniInspector'] as String?;
  String? get nombreInspector => data['NombreInspector'] as String?;
  String? get correoInspector => data['CorreoInspector'] as String?;
  String? get telefonoInspector => data['TelefonoInspector'] as String?;
  String? get fechaInspeccion => data['FechaInspeccion'] as String?;
  String? get horaInspeccion => data['HoraInspeccion'] as String?;
  String? get tipoInspeccion => data['TipoInspeccion'] as String?;
  String? get dniDirector => data['DniDirector'] as String?;
  String? get nombreDirector => data['NombreDirector'] as String?;
  String? get correoDirector => data['CorreoDirector'] as String?;
  String? get telefonoDirector => data['TelefonoDirector'] as String?;
  String? get dniAlterno => data['DniAlterno'] as String?;
  String? get nombreAlterno => data['NombreAlterno'] as String?;
  String? get correoAlterno => data['CorreoAlterno'] as String?;
  String? get telefonoAlterno => data['TelefonoAlterno'] as String?;
  String? get estadoAuditoria => data['EstadoAuditoria'] as String?;
  String? get usuarioCreacionAuditoria => data['UsuarioCreacionAuditoria'] as String?;
  String? get usuarioModificacionAuditoria => data['UsuarioModificacionAuditoria'] as String?;
  String? get fechaCreacionAuditoria => data['FechaCreacionAuditoria'] as String?;
  String? get fechaModificacionAuditoria => data['FechaModificacionAuditoria'] as String?;
  String? get equipoCreacionAuditoria => data['EquipoCreacionAuditoria'] as String?;
  String? get equipoModificacionAuditoria => data['EquipoModificacionAuditoria'] as String?;
  String? get programaModificacionAuditoria => data['ProgramaModificacionAuditoria'] as String?;
  String? get programaCreacionAuditoria => data['ProgramaCreacionAuditoria'] as String?;
  int? get modificadoMovil => data['modificadoMovil'] as int?;
  double? get latitud => data['Latitud'] as double?;
  double? get longitud => data['Longitud'] as double?;
}
/// END LISTARPREGUNTAS
///


/// BEGIN LISTARFICHAFIRMA
///

Future<List<ListarFichasFirmaModificacion>> performListarFichaFirmaMod(Database database,{
  String? dniInspector,
}) {
  final query = '''
    SELECT *
    FROM FichasFirmas 
    WHERE modificacionMovil = 1 and idFicha in (Select idFicha from Fichas where dniInspector = '${dniInspector}')
  ''';
  return _readQuery(database, query, (data) => ListarFichasFirmaModificacion(data));
}

class ListarFichasFirmaModificacion extends SqliteRow {
  ListarFichasFirmaModificacion(Map<String, dynamic> data) : super(data);

  int? get idFichaFirmaMovil => data['idFichaFirmaMovil'] as int?;
  int? get idFichaFirma => data['idFichaFirma'] as int?;
  int? get idFicha => data['idFicha'] as int?;
  String? get nombres => data['nombres'] as String?;
  String? get apellidoPaterno => data['apellidoPaterno'] as String?;
  String? get apellidoMaterno => data['apellidoMaterno'] as String?;
  String? get nombreArchivo => data['nombreArchivo'] as String?;
  String? get extension => data['extension'] as String?;
  String? get ruta => data['ruta'] as String?;
  double? get peso => data['peso'] as double?;
  String? get tipoArchivo => data['tipoArchivo'] as String?;
  String? get numDocumento => data['numDocumento'] as String?;
  int? get idTipoDocumento => data['idTipoDocumento'] as int?;
  int? get idTipoPersona => data['idTipoPersona'] as int?;
  String? get estadoAuditoria => data['estadoAuditoria'] as String?;
  String? get usuarioCreacionAuditoria => data['usuarioCreacionAuditoria'] as String?;
  String? get usuarioModificacionAuditoria => data['usuarioModificacionAuditoria'] as String?;
  String? get fechaCreacionAuditoria => data['fechaCreacionAuditoria'] as String?;
  String? get fechaModificacionAuditoria => data['fechaModificacionAuditoria'] as String?;
  String? get equipoCreacionAuditoria => data['equipoCreacionAuditoria'] as String?;
  String? get equipoModificacionAuditoria => data['equipoModificacionAuditoria'] as String?;
  String? get programaCreacionAuditoria => data['programaCreacionAuditoria'] as String?;
  String? get programaModificacionAuditoria => data['programaModificacionAuditoria'] as String?;
  int? get modificacionMovil => data['modificacionMovil'] as int?;
  int? get uploadDocumento => data['uploadDocumento'] as int?;
  String? get rutalocal => data['rutalocal'] as String?;
}

/// END LISTARFICHAFIRMA


/// BEGIN LISTARFICHAFIRMA
///

Future<List<ListarFichasModificacionModificacion>> performListarFichaArchivosMod(Database database, {
  String? dniInspector,

}) {
  final query = '''
     SELECT *
    FROM FichasArchivos 
    WHERE modificadoMovil = 1 and idFicha in (Select idFicha from Fichas where dniInspector = '${dniInspector}') and( (estadoAuditoria = '0' and idFichaArchivo is  not null) or (estadoAuditoria = '1' and idFichaArchivo is  null))
  ''';
  return _readQuery(database, query, (data) => ListarFichasModificacionModificacion(data));
}

class ListarFichasModificacionModificacion extends SqliteRow {
  ListarFichasModificacionModificacion(Map<String, dynamic> data) : super(data);

  int? get idFichaArchivoMovil => data['idFichaArchivoMovil'] as int?;
  int? get idFichaArchivo => data['idFichaArchivo'] as int?;
  int? get idFicha => data['idFicha'] as int?;
  String? get nombre => data['nombre'] as String?;
  String? get extension => data['extension'] as String?;
  String? get ruta => data['ruta'] as String?;
  double? get peso => data['peso'] as double?;
  String? get estadoAuditoria => data['estadoAuditoria'] as String?;
  String? get usuarioCreacionAuditoria => data['usuarioCreacionAuditoria'] as String?;
  String? get usuarioModificacionAuditoria => data['usuarioModificacionAuditoria'] as String?;
  String? get fechaCreacionAuditoria => data['fechaCreacionAuditoria'] as String?;
  String? get fechaModificacionAuditoria => data['fechaModificacionAuditoria'] as String?;
  String? get equipoCreacionAuditoria => data['equipoCreacionAuditoria'] as String?;
  String? get equipoModificacionAuditoria => data['equipoModificacionAuditoria'] as String?;
  String? get programaCreacionAuditoria => data['programaCreacionAuditoria'] as String?;
  String? get programaModificacionAuditoria => data['programaModificacionAuditoria'] as String?;
  int? get modificadoMovil => data['modificadoMovil'] as int?;
  int? get uploadDocumento => data['uploadDocumento'] as int?;
  String? get rutalocal => data['rutalocal'] as String?;
  String? get titulo => data['titulo'] as String?;
  String? get comentario => data['comentario'] as String?;
}

/// END LISTARFICHAFIRMA



Future<List<FichaPreguntaRespuestas>> performListarFichaPreguntaRespuestas(Database database,
{
  String? dniInspector,
}) {
  final query = '''
    SELECT *
    FROM FichaPreguntaRespuestas 
    WHERE modificadoMovil = 1 and idFicha in (Select idFicha from Fichas where dniInspector = '${dniInspector}')
  ''';
  return _readQuery(database, query, (data) => FichaPreguntaRespuestas(data));
}
class FichaPreguntaRespuestas {
  final Map<String, dynamic> data;

  FichaPreguntaRespuestas(this.data);

  int? get idFichaPreguntaRespuestaLocal => data['IdFichaPreguntaRespuestaLocal'] as int?;
  int? get idFichaPreguntaRespuesta => data['IdFichaPreguntaRespuesta'] as int?;
  int? get idFicha => data['IdFicha'] as int?;
  int? get idPlantillaOpcion => data['IdPlantillaOpcion'] as int?;
  int? get idPregunta => data['IdPregunta'] as int?;
  int? get idPlantillaSeccion => data['IdPlantillaSeccion'] as int?;
  int? get numeroRepeticion => data['NumeroRepeticion'] as int?;
  String? get respuesta => data['Respuesta'] as String?;
  String? get estadoAuditoria => data['EstadoAuditoria'] as String?;
  String? get usuarioCreacionAuditoria => data['UsuarioCreacionAuditoria'] as String?;
  String? get usuarioModificacionAuditoria => data['UsuarioModificacionAuditoria'] as String?;
  String? get fechaCreacionAuditoria => data['FechaCreacionAuditoria'] as String?;
  String? get fechaModificacionAuditoria => data['FechaModificacionAuditoria'] as String?;
  String? get equipoCreacionAuditoria => data['EquipoCreacionAuditoria'] as String?;
  String? get programaCreacionAuditoria => data['ProgramaCreacionAuditoria'] as String?;
  String? get equipoModificacionAuditoria => data['EquipoModificacionAuditoria'] as String?;
  String? get programaModificacionAuditoria => data['ProgramaModificacionAuditoria'] as String?;
  int? get modificadoMovil => data['modificadoMovil'] as int?;
}


///
///LISTAR RESPUESTAS MODIFICADAS
///




///
/// END RESPUESTAS MODIFICADAS
///




/// BEGIN LISTARFICHASMODULARESPORIDFICHA
Future<List<ListarFichasModularesPorModificado>>
performListarFichasModularesPorModificado(
    Database database,
{
  String? dniInspector,
}) {
  final query = '''
SELECT 
    IdFichaModularLocal,
    IdFichaModular, 
    IdFicha, 
    CodigoModular, 
    CodigoLocal, 
    CodigoNivel, 
    Nivel,
    CodigoTipoDocente,
    TipoDocente,
    CodigoTipoSexo,
    TipoSexo,
    CodigoTurno,
    Turno,
    NumeroHombres,
    NumeroMujeres,
    NumeroAlumnos,
    NumeroDocente,
    NumeroSeccion,
    EstadoAuditoria,
    UsuarioCreacionAuditoria,
    UsuarioModiciacionAuditoria,
    FechaCreacionAuditoria,
    FechaModificacionAuditoria,
    EquipoCreacionAuditoria,
    EquipoModificacionAuditoria,
    ProgramaCreacionAuditoria
    ProgramaModificacionAuditoria
FROM FichaModular where modificadoMovil = 1 and idFicha in (Select idFicha from Fichas where dniInspector = '${dniInspector}')
''';
  return _readQuery(
      database, query, (d) => ListarFichasModularesPorModificado(d));
}

class ListarFichasModularesPorModificado extends SqliteRow {
  ListarFichasModularesPorModificado(Map<String, dynamic> data) : super(data);

  int? get idFichaModularlocal => data['IdFichaModularLocal'] as int?;
  int? get idFichaModular => data['IdFichaModular'] as int?;
  int? get idFicha => data['IdFicha'] as int?;
  String? get codigoModular => data['CodigoModular'] as String?;
  String? get codigoLocal => data['CodigoLocal'] as String?;
  String? get codigoNivel => data['CodigoNivel'] as String?;
  String? get nivel => data['Nivel'] as String?;
  String? get codigoTipoDocente => data['CodigoTipoDocente'] as String?;
  String? get tipoDocente => data['TipoDocente'] as String?;
  String? get codigoTipoSexo => data['CodigoTipoSexo'] as String?;
  String? get tipoSexo => data['TipoSexo'] as String?;
  String? get codigoTurno => data['CodigoTurno'] as String?;
  String? get turno => data['Turno'] as String?;
  int? get numeroHombres => data['NumeroHombres'] as int?;
  int? get numeroMujeres => data['NumeroMujeres'] as int?;
  int? get numeroAlumnos => data['NumeroAlumnos'] as int?;
  int? get numeroDocente => data['NumeroDocente'] as int?;
  int? get numeroSeccion => data['NumeroSeccion'] as int?;
  String? get estadoauditoria => data['EstadoAuditoria'] as String?;
  String? get usuariocreacion => data['UsuarioCreacionAuditoria'] as String?;
  String? get usuariomodificacion => data['UsuarioModiciacionAuditoria'] as String?;
  String? get fechacreacion => data['FechaCreacionAuditoria'] as String?;
  String? get fechamodificacion => data['FechaModificacionAuditoria'] as String?;
  String? get equipocreacion => data['EquipoCreacionAuditoria'] as String?;
  String? get equipomodificacion => data['EquipoModificacionAuditoria'] as String?;
  String? get programacreacion => data['ProgramaCreacionAuditoria'] as String?;
  String? get programamodificacion => data['ProgramaModificacionAuditoria'] as String?;
}

/// END LISTARFICHASMODULARESPORIDFICHA

/// BEGIN LISTARSincronizacionUltimo
Future<List<SincronizacionUltimo>>
performSincronizacionUltimo(
    Database database) {
  final query = '''
SELECT *
    FROM sincronizacion
    ORDER BY IdSincro DESC
    LIMIT 1;
''';
  return _readQuery(
      database, query, (d) => SincronizacionUltimo(d));
}

class SincronizacionUltimo extends SqliteRow {
  SincronizacionUltimo(Map<String, dynamic> data) : super(data);

  int? get idSincro => data['IdSincro'] as int?;
  int? get idSincroServer => data['IdSincroServer'] as int?;
  String? get fecha => data['Fecha'] as String?;
  int? get estado => data['Estado'] as int?;
  String? get ip => data['IP'] as String?;
  String? get latitud => data['Latitud'] as String?;
  String? get longitud => data['Longitud'] as String?;
  String? get cum => data['Cum'] as String?;
  String? get usuario => data['Usuario'] as String?;
  int? get inspeccionesCargadas => data['InspeccionesCargadas'] as int?;
  int? get inspeccionesCargadasServer => data['InspeccionesCargadasServer'] as int?;
  int? get inspeccionesDescargadasMovil => data['InspeccionesDescargadasMovil'] as int?;
  int? get inspeccionesDescargadasServer => data['InspeccionesDescargadasServer'] as int?;
}

/// END LISTARSincronizacionUltimo
///

/// BEGIN LISTARSincronizacionUltimo
Future<List<ColaSincronizacionList>>
performListColaSincronizacion(
    Database database) {
  final query = '''
SELECT *
    FROM ColaSincronizacion
    where EstadoSincronizacion = 1;
''';
  return _readQuery(
      database, query, (d) => ColaSincronizacionList(d));
}

class ColaSincronizacionList extends SqliteRow {
  ColaSincronizacionList(Map<String, dynamic> data) : super(data);

  int? get idCola => data['IdCola'] as int?;
  String get tipoDato => data['TipoDato'] as String;
  int get idDatoLocal => data['IdDatoLocal'] as int;
  int? get idDatoServer => data['IdDatoServer'] as int?;
  int get estadoSincronizacion => data['EstadoSincronizacion'] as int;
  int? get usuarioCreacion => data['UsuarioCreacion'] as int?;
  int get fechaCreacion => data['FechaCreacion'] as int;
  int? get longitudCreacion => data['LongitudCreacion'] as int?;
  int? get fechaModificacion => data['FechaModificacion'] as int?;
  int? get latitudModificacion => data['LatitudModificacion'] as int?;
  int? get longitudModificacion => data['LongitudModificacion'] as int?;
  int? get usuarioModificacion => data['UsuarioModificacion'] as int?;
  int? get fechaUltimoIntento => data['FechaUltimoIntento'] as int?;
  int? get fechaSincronizacion => data['FechaSincronizacion'] as int?;
  int? get latitudSincronizacion => data['LatitudSincronizacion'] as int?;
  int? get longitudSincronizacion => data['LongitudSincronizacion'] as int?;
  int? get idSincro => data['IdSincro'] as int?;
  int? get idColaServer => data['IdColaServer'] as int?;
  String? get UsuarioCreacionAuditoria => data['UsuarioCreacionAuditoria'] as String?;
  String? get EquipoCreacionAuditoria => data['EquipoCreacionAuditoria'] as String?;
  String? get FechaCreacionAuditoria => data['FechaCreacionAuditoria'] as String?;
  String? get ProgramaCreacionAuditoria => data['ProgramaCreacionAuditoria'] as String?;

// Nota: las propiedades adicionales que deseas deben ser agregadas aquí siguiendo el mismo patrón
}


/// END LISTARSincronizacionUltimo
///

Future<List<ExistFichaForId>>
performListarFichaExist(
    Database database, {
      int? idFicha,
    }) {
  final query = '''
SELECT 
    IdFicha
FROM Fichas where idFicha = ${idFicha};
''';
  return _readQuery(
      database, query, (d) => ExistFichaForId(d));
}
class ExistFichaForId extends SqliteRow {
  ExistFichaForId(Map<String, dynamic> data) : super(data);
  int? get idFicha => data['IdFicha'] as int?;

}

Future<List<ExistFichaModForId>>
performListarFichaModularExist(
    Database database, {
      int? idFichaModular,
    }) {
  final query = '''
SELECT 
    IdFichaModular
FROM FichaModular where IdFichaModular = ${idFichaModular};
''';
  return _readQuery(
      database, query, (d) => ExistFichaModForId(d));
}
class ExistFichaModForId extends SqliteRow {
  ExistFichaModForId(Map<String, dynamic> data) : super(data);
  int? get idFichaModular => data['IdFichaModular'] as int?;

}

///VALIDAR EXISTENCIA PLANTILLAS
///

Future<List<ExistPlantillaForId>>
performListarPlantillaExist(
    Database database, {
      int? idPlantilla,
    }) {
  final query = '''
SELECT 
    IdPlantilla
FROM Plantilla where IdPlantilla = ${idPlantilla};
''';
  return _readQuery(
      database, query, (d) => ExistPlantillaForId(d));
}
class ExistPlantillaForId extends SqliteRow {
  ExistPlantillaForId(Map<String, dynamic> data) : super(data);
  int? get idFichaModular => data['IdPlantilla'] as int?;

}

///VERIFICAR SI EXISTE INSPECCION
///
Future<List<ExistSeccionForId>>
performListarSeccionExist(
    Database database, {
      int? idPlantillaSeccion,
    }) {
  final query = '''
SELECT 
    IdPlantillaSeccion
FROM PlantillaSeccion where IdPlantillaSeccion = ${idPlantillaSeccion};
''';
  return _readQuery(
      database, query, (d) => ExistSeccionForId(d));
}
class ExistSeccionForId extends SqliteRow {
  ExistSeccionForId(Map<String, dynamic> data) : super(data);
  int? get idPlantillaSeccion => data['IdPlantillaSeccion'] as int?;

}

/// END VERIFICACION INSPECCION

Future<List<ExistInspeciconForId>>
performListarInspeccionExist(
    Database database, {
      int? idInspeccion,
    }) {
  final query = '''
SELECT 
     idInspeccion
FROM Inspecciones where idInspeccion = ${idInspeccion};
''';
  return _readQuery(
      database, query, (d) => ExistInspeciconForId(d));
}

class ExistInspeciconForId extends SqliteRow {
  ExistInspeciconForId(Map<String, dynamic> data) : super(data);
  int? get idInspeccion => data['idInspeccion'] as int?;

}
///

///VERIFICAR SI EXISTE OPCION
///
Future<List<ExistOpcionForId>>
performListarOpcionExist(
    Database database, {
      int? idPlantillaOpcion,
    }) {
  final query = '''
SELECT 
    IdPlantillaOpcion
FROM PlantillaOpcion where IdPlantillaOpcion = ${idPlantillaOpcion};
''';
  return _readQuery(
      database, query, (d) => ExistOpcionForId(d));
}
class ExistOpcionForId extends SqliteRow {
  ExistOpcionForId(Map<String, dynamic> data) : super(data);
  int? get idPlantillaOpcion => data['IdPlantillaOpcion'] as int?;

}
/// END VERIFICACION OPCION
///

///VERIFICAR SI EXISTE PREGUNTA
///
Future<List<ExistPreguntaForId>>
performListarPreguntaExist(
    Database database, {
      int? idPlantillaPregunta,
    }) {
  final query = '''
SELECT 
    IdPlantillaPregunta
FROM PlantillaPregunta where IdPlantillaPregunta = ${idPlantillaPregunta};
''';
  return _readQuery(
      database, query, (d) => ExistPreguntaForId(d));
}
class ExistPreguntaForId extends SqliteRow {
  ExistPreguntaForId(Map<String, dynamic> data) : super(data);
  int? get idPlantillaPregunta => data['IdPlantillaPregunta'] as int?;

}
/// END VERIFICACION PREGUNTA
///

///VERIFICAR SI EXISTE RESPUESTA
///
Future<List<ExistRespuestaForId>>
performListarRespuestaExist(
    Database database, {
      int? idFicha,
      int? idPlantillaOpcion,
      int? idPregunta,
      int? idPlantillaSeccion,
      String? numeroRepeticion,
    }) {
  final query = '''
SELECT 
    IdFichaPreguntaRespuesta
FROM FichaPreguntaRespuestas where IdFicha = ${idFicha} and
    IdPlantillaOpcion = ${idPlantillaOpcion} and
    IdPregunta = ${idPregunta} and
    IdPlantillaSeccion = ${idPlantillaSeccion} and
    NumeroRepeticion = '${numeroRepeticion}';
''';
  return _readQuery(
      database, query, (d) => ExistRespuestaForId(d));
}
class ExistRespuestaForId extends SqliteRow {
  ExistRespuestaForId(Map<String, dynamic> data) : super(data);
  int? get idFichaPreguntaRespuesta => data['IdFichaPreguntaRespuesta'] as int?;
}
/// END VERIFICACION PREGUNTAw
///

///VERIFICAR SI EXISTE FIRMA
///
Future<List<ExistFirmaForId>>
performListarFirmaExist(
    Database database, {
      int? idFicha,
      int? idFichaFirmaMovil,
    }) {
  final query = '''
SELECT 
    idFichaFirmaMovil
FROM FichasFirmas where idFicha = ${idFicha} and
    idFichaFirmaMovil = ${idFichaFirmaMovil} ;
''';
  return _readQuery(
      database, query, (d) => ExistFirmaForId(d));
}
class ExistFirmaForId extends SqliteRow {
  ExistFirmaForId(Map<String, dynamic> data) : super(data);
  int? get idFichaFirmaMovil => data['idFichaFirmaMovil'] as int?;
}
/// END VERIFICACION FIRMA
///


///VERIFICAR SI EXISTE FIRMA
///
Future<List<ExistFirmaNullForId>>
performListarFirmaExistNull(
    Database database, {
      int? idFicha,
      int? idFichaFirma,
      int? idFichaFirmaMovil,
    }) {
  final query = '''
SELECT idFicha
FROM FichasFirmas where (idFicha = ${idFicha} and idFichaFirma = ${idFichaFirma} and
    ruta is not null and idFichaFirmaMovil is not null) 
    or (idFicha = ${idFicha} and idFichaFirmaMovil = ${idFichaFirmaMovil} and
    ruta is not null and idFichaFirma is null);
''';
  return _readQuery(
      database, query, (d) => ExistFirmaNullForId(d));
}
class ExistFirmaNullForId extends SqliteRow {
  ExistFirmaNullForId(Map<String, dynamic> data) : super(data);
  int? get idFicha => data['idFicha'] as int?;
}
/// END VERIFICACION FIRMA
///
///

///VERIFICAR SI EXISTE FIRMA
///
Future<List<ExistArchivoNullForId>>
performListarArchivoExistNull(
    Database database, {
      int? idFicha,
      int? idFichaArchivo,
      int? idFichaArchivoMovil,
    }) {
  final query = '''
SELECT idFicha
FROM FichasArchivos where (idFicha = ${idFicha} and idFichaArchivo = ${idFichaArchivo} and
    ruta is not null and idFichaArchivoMovil is not null) 
    or (idFicha = ${idFicha} and idFichaArchivoMovil = ${idFichaArchivoMovil} and
    ruta is not null and idFichaArchivo is null);
''';
  return _readQuery(
      database, query, (d) => ExistArchivoNullForId(d));
}
class ExistArchivoNullForId extends SqliteRow {
  ExistArchivoNullForId(Map<String, dynamic> data) : super(data);
  int? get idFicha => data['idFicha'] as int?;
}
/// END VERIFICACION FIRMA
///



///VERIFICAR SI EXISTE OPCION
///
Future<List<FechaAnteriorForId>>
performFechaAnteriorForId(
    Database database, {
      int? idSincro,
    }) {
  int idSincroMenosuno = idSincro! -1;
  final query = '''
SELECT 
    Fecha
FROM Sincronizacion where IdSincro = ${idSincroMenosuno};
''';
  return _readQuery(
      database, query, (d) => FechaAnteriorForId(d));
}
class FechaAnteriorForId extends SqliteRow {
  FechaAnteriorForId(Map<String, dynamic> data) : super(data);
  String? get fecha => data['Fecha'] as String?;

}
/// END VERIFICACION OPCION
///

/// BEGIN LISTARPREGUNTAS
Future<List<ListarPreguntaComentarioRow>> performListarPreguntaComentario(
    Database database, {
      int? idPlantillaSeccion,
      int? idPregunta,
      int? idFicha,
      String? numeroRepeticion
    }) {
  final query = '''
SELECT *
FROM FichaPreguntaComentario where IdPlantillaSeccion =  '${idPlantillaSeccion}' 
and IdPregunta = '${idPregunta}' and IdFicha = '${idFicha}' and EstadoAuditoria = '1' and numeroRepeticion = '${numeroRepeticion}';

''';
  return _readQuery(database, query, (d) => ListarPreguntaComentarioRow(d));
}

class ListarPreguntaComentarioRow extends SqliteRow {
  ListarPreguntaComentarioRow(Map<String, dynamic> data) : super(data);

  int? get idFichaPreguntaComentarioLocal => data['IdFichaPreguntaComentarioLocal'] as int?;
  int? get idFichaPreguntaComentario => data['IdFichaPreguntaComentario'] as int?;
  int? get idFicha => data['IdFicha'] as int?;
  int? get idPregunta => data['IdPregunta'] as int?;
  int? get idPlantillaSeccion => data['IdPlantillaSeccion'] as int?;
  String? get observacion => data['Observacion'] as String?;
  String? get numeroRepeticion => data['numeroRepeticion'] as String?;
  String? get estadoAuditoria => data['EstadoAuditoria'] as String?;
  String? get usuarioCreacionAuditoria => data['UsuarioCreacionAuditoria'] as String?;
  String? get usuarioModificacionAuditoria => data['UsuarioModificacionAuditoria'] as String?;
  String? get fechaCreacionAuditoria => data['FechaCreacionAuditoria'] as String?;
  String? get fechaModificacionAuditoria => data['FechaModificacionAuditoria'] as String?;
  String? get equipoCreacionAuditoria => data['EquipoCreacionAuditoria'] as String?;
  String? get equipoModificacionAuditoria => data['EquipoModificacionAuditoria'] as String?;
  String? get programaCreacionAuditoria => data['ProgramaCreacionAuditoria'] as String?;
  String? get programaModificacionAuditoria => data['ProgramaModificacionAuditoria'] as String?;
  int? get modificadoMovil => data['modificadoMovil'] as int?;
  int? get uploadDocumento => data ['uploadDocumento'] as int?;
}


/// BEGIN LISTARPREGUNTAS
Future<List<ListarPreguntaArchivosRow>> performListarPreguntaArchivos(
    Database database, {
      int? idPlantillaSeccion,
      int? idPregunta,
      int? idFicha,
      String? numeroRepeticion
    }) {
  final query = '''
SELECT *
FROM FichaPreguntaArchivo where idPlantillaSeccion =  '${idPlantillaSeccion}' 
and IdPregunta = '${idPregunta}' and IdFicha = '${idFicha}' and EstadoAuditoria = '1' and numeroRepeticion = '${numeroRepeticion}';


''';
  return _readQuery(database, query, (d) => ListarPreguntaArchivosRow(d));
}

class ListarPreguntaArchivosRow extends SqliteRow {
  ListarPreguntaArchivosRow(Map<String, dynamic> data) : super(data);

  int? get idFichaPreguntaArchivoLocal => data['IdFichaPreguntaArchivoLocal'] as int?;
  int? get idFichaPreguntaArchivo => data['IdFichaPreguntaArchivo'] as int?;
  int? get idFicha => data['IdFicha'] as int?;
  int? get idPregunta => data['IdPregunta'] as int?;
  int? get idPlantillaSeccion => data['idPlantillaSeccion'] as int?;
  String? get numeroRepeticion => data['numeroRepeticion'] as String?;
  String? get nombre => data['Nombre'] as String?;
  String? get extension => data['Extension'] as String?;
  String? get ruta => data['Ruta'] as String?;
  String? get rutalocal => data['rutaLocal'] as String?;
  String? get peso => data['Peso'] as String?;
  String? get estadoAuditoria => data['EstadoAuditoria'] as String?;
  String? get usuarioCreacionAuditoria => data['UsuarioCreacionAuditoria'] as String?;
  String? get usuarioModificacionAuditoria => data['UsuarioModificacionAuditoria'] as String?;
  String? get fechaCreacionAuditoria => data['FechaCreacionAuditoria'] as String?;
  String? get fechaModificacionAuditoria => data['FechaModificacionAuditoria'] as String?;
  String? get equipoCreacionAuditoria => data['EquipoCreacionAuditoria'] as String?;
  String? get equipoModificacionAuditoria => data['EquipoModificacionAuditoria'] as String?;
  String? get programaCreacionAuditoria => data['ProgramaCreacionAuditoria'] as String?;
  String? get programaModificacionAuditoria => data['ProgramaModificacionAuditoria'] as String?;
  int? get modificadoMovil => data['modificadoMovil'] as int?;
  int? get uploadDocumento => data ['uploadDocumento'] as int?;
}

Future<List<ListarFichasComentarioModificacion>> performListarComentariosMod(Database database, {
  String? dniInspector,
}) {
  final query = '''
    SELECT *
    FROM FichaPreguntaComentario 
    WHERE modificadoMovil = 1 and IdFicha in (Select idFicha from Fichas where dniInspector = '${dniInspector}')
  ''';
  return _readQuery(database, query, (data) => ListarFichasComentarioModificacion(data));
}

class ListarFichasComentarioModificacion extends SqliteRow {
  ListarFichasComentarioModificacion(Map<String, dynamic> data) : super(data);

  int? get idFichaPreguntaComentarioLocal => data['IdFichaPreguntaComentarioLocal'] as int?;
  int? get idFichaPreguntaComentario => data['IdFichaPreguntaComentario'] as int?;
  int? get idFicha => data['IdFicha'] as int?;
  int? get idPregunta => data['IdPregunta'] as int?;
  int? get idPlantillaSeccion => data['IdPlantillaSeccion'] as int?;
  String? get observacion => data['Observacion'] as String?;
  String? get numeroRepeticion => data['numeroRepeticion'] as String?;
  String? get estadoAuditoria => data['EstadoAuditoria'] as String?;
  String? get usuarioCreacionAuditoria => data['UsuarioCreacionAuditoria'] as String?;
  String? get usuarioModificacionAuditoria => data['UsuarioModificacionAuditoria'] as String?;
  String? get fechaCreacionAuditoria => data['FechaCreacionAuditoria'] as String?;
  String? get fechaModificacionAuditoria => data['FechaModificacionAuditoria'] as String?;
  String? get equipoCreacionAuditoria => data['EquipoCreacionAuditoria'] as String?;
  String? get equipoModificacionAuditoria => data['EquipoModificacionAuditoria'] as String?;
  String? get programaCreacionAuditoria => data['ProgramaCreacionAuditoria'] as String?;
  String? get programaModificacionAuditoria => data['ProgramaModificacionAuditoria'] as String?;
  int? get modificadoMovil => data['modificadoMovil'] as int?;
}


Future<List<ListarFichasFichaArchivoModificacion>> performListarFichaArchivoMod(Database database, {
  String? dniInspector,
}) {
  final query = '''
    SELECT *
    FROM FichaPreguntaArchivo 
    WHERE modificadoMovil = 1 and IdFicha in (Select idFicha from Fichas where dniInspector = '${dniInspector}') and( (EstadoAuditoria = '0' and IdFichaPreguntaArchivo is  not null) or (EstadoAuditoria = '1' and IdFichaPreguntaArchivo is  null))
  ''';
  return _readQuery(database, query, (data) => ListarFichasFichaArchivoModificacion(data));
}

class ListarFichasFichaArchivoModificacion extends SqliteRow {
  ListarFichasFichaArchivoModificacion(Map<String, dynamic> data) : super(data);

  int? get idFichaPreguntaArchivoLocal => data['IdFichaPreguntaArchivoLocal'] as int?;
  int? get idFichaPreguntaArchivo => data['IdFichaPreguntaArchivo'] as int?;
  int? get idFicha => data['IdFicha'] as int?;
  int? get idPregunta => data['IdPregunta'] as int?;
  int? get idPlantillaSeccion => data['idPlantillaSeccion'] as int?;
  String? get numeroRepeticion => data['numeroRepeticion'] as String?;
  String? get nombre => data['Nombre'] as String?;
  String? get extension => data['Extension'] as String?;
  String? get ruta => data['Ruta'] as String?;
  String? get rutalocal => data['rutaLocal'] as String?;
  String? get peso => data['Peso'] as String?;
  String? get estadoAuditoria => data['EstadoAuditoria'] as String?;
  String? get usuarioCreacionAuditoria => data['UsuarioCreacionAuditoria'] as String?;
  String? get usuarioModificacionAuditoria => data['UsuarioModificacionAuditoria'] as String?;
  String? get fechaCreacionAuditoria => data['FechaCreacionAuditoria'] as String?;
  String? get fechaModificacionAuditoria => data['FechaModificacionAuditoria'] as String?;
  String? get equipoCreacionAuditoria => data['EquipoCreacionAuditoria'] as String?;
  String? get equipoModificacionAuditoria => data['EquipoModificacionAuditoria'] as String?;
  String? get programaCreacionAuditoria => data['ProgramaCreacionAuditoria'] as String?;
  String? get programaModificacionAuditoria => data['ProgramaModificacionAuditoria'] as String?;
  int? get modificadoMovil => data['modificadoMovil'] as int?;
  int? get uploadDocumento => data ['uploadDocumento'] as int?;
}

Future<List<ExistPreguntaArchivoNullForId>>
performListarPreguntaArchivoExistNull(
    Database database, {
      int? idFicha,
      int? IdFichaPreguntaArchivo,
      int? IdFichaPreguntaArchivoLocal,
    }) {
  final query = '''
SELECT IdFicha
FROM FichaPreguntaArchivo where (IdFicha = ${idFicha} and IdFichaPreguntaArchivo = ${IdFichaPreguntaArchivo} and
    ruta is not null and IdFichaPreguntaArchivoLocal is not null) 
    or (idFicha = ${idFicha} and IdFichaPreguntaArchivoLocal = ${IdFichaPreguntaArchivoLocal} and
    ruta is not null and IdFichaPreguntaArchivo is null);
''';
  return _readQuery(
      database, query, (d) => ExistPreguntaArchivoNullForId(d));
}
class ExistPreguntaArchivoNullForId extends SqliteRow {
  ExistPreguntaArchivoNullForId(Map<String, dynamic> data) : super(data);
  int? get idFicha => data['IdFicha'] as int?;
}

Future<List<ExistPreguntaComentarioNullForId>>
performListarPreguntaComentarioExistNull(
    Database database, {
      int? idFicha,
      int? idPregunta,
      int? idPlantillaSeccion,
      String? numeroRepeticion,
    }) {
  final query = '''
SELECT IdFicha
FROM FichaPreguntaComentario where IdFicha = ${idFicha} and
    IdPregunta = ${idPregunta} and
    IdPlantillaSeccion = ${idPlantillaSeccion} and
    numeroRepeticion = '${numeroRepeticion}'
''';
  return _readQuery(
      database, query, (d) => ExistPreguntaComentarioNullForId(d));
}
class ExistPreguntaComentarioNullForId extends SqliteRow {
  ExistPreguntaComentarioNullForId(Map<String, dynamic> data) : super(data);
  int? get idFicha => data['IdFicha'] as int?;
}

Future<List<ExistPreguntaComentarioARCEForId>>
performListarPreguntaComentarioARCExistNull(
    Database database, {
      int? idFicha,
      int? idPregunta,
      int? idPlantillaSeccion,
      String? numeroRepeticion,
    }) {
  final query = '''
SELECT IdFicha, IdFichaPreguntaArchivoLocal
FROM FichaPreguntaArchivo where IdFicha = ${idFicha} and
    IdPregunta = ${idPregunta} and
    idPlantillaSeccion = ${idPlantillaSeccion} and
    numeroRepeticion = '${numeroRepeticion}' ORDER BY IdFichaPreguntaArchivoLocal DESC
    LIMIT 1
''';
  return _readQuery(
      database, query, (d) => ExistPreguntaComentarioARCEForId(d));
}
class ExistPreguntaComentarioARCEForId extends SqliteRow {
  ExistPreguntaComentarioARCEForId(Map<String, dynamic> data) : super(data);
  int? get idFicha => data['IdFicha'] as int?;
  int? get idFichaPreguntaArchivoLocal => data['IdFichaPreguntaArchivoLocal'] as int?;
}

Future<List<ExistBuscarUsuario>>
performListarBuscarUsuario(
    Database database, {
      String? usuario,
    }) {
  final query = '''
SELECT Usuario, Contraseña, Username, NombreCompleto, Rol, UbicacionUser
FROM User where Usuario = '${usuario}'
''';
  return _readQuery(
      database, query, (d) => ExistBuscarUsuario(d));
}
class ExistBuscarUsuario extends SqliteRow {
  ExistBuscarUsuario(Map<String, dynamic> data) : super(data);
  String? get usuario => data['Usuario'] as String?;
  String? get contrase => data['Contraseña'] as String?;
  String? get username => data['Username'] as String?;
  String? get nomcomple => data['NombreCompleto'] as String?;
  String? get rol => data['Rol'] as String?;
  String? get ubicacion => data['UbicacionUser'] as String?;
}