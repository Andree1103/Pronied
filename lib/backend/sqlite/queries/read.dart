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
) {
  final query = '''
SELECT Id, Titulo, Comentario, Imagen
FROM Fotos
''';
  return _readQuery(database, query, (d) => ListarFotosRow(d));
}

class ListarFotosRow extends SqliteRow {
  ListarFotosRow(Map<String, dynamic> data) : super(data);

  int? get id => data['Id'] as int?;
  String? get titulo => data['Titulo'] as String?;
  String? get comentario => data['Comentario'] as String?;
  String? get imagen => data['Imagen'] as String?;
}

/// END LISTARFOTOS

/// BEGIN LISTARFIRMAS
Future<List<ListarFirmasRow>> performListarFirmas(
  Database database,
) {
  final query = '''
SELECT 
    Id, 
    Persona, 
    Documento, 
    NumeroDoc, 
    ApePaterno, 
    ApeMaterno,
    Image,
    Nombre,
    Nombre || ' ' || ApePaterno || ' ' || ApeMaterno AS NombresCompletos
FROM Firma;

''';
  return _readQuery(database, query, (d) => ListarFirmasRow(d));
}

class ListarFirmasRow extends SqliteRow {
  ListarFirmasRow(Map<String, dynamic> data) : super(data);

  int? get id => data['Id'] as int?;
  String? get persona => data['Persona'] as String?;
  String? get documento => data['Documento'] as String?;
  String? get numeroDoc => data['NumeroDoc'] as String?;
  String? get apePaterno => data['ApePaterno'] as String?;
  String? get apeMaterno => data['ApeMaterno'] as String?;
  String? get image => data['Image'] as String?;
  String? get nombre => data['Nombre'] as String?;
  String? get nombresCompletos => data['NombresCompletos'] as String?;
}

/// END LISTARFIRMAS

/// BEGIN LISTARINSPECCIONES
Future<List<ListarInspeccionesRow>> performListarInspecciones(
  Database database,
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
    estado
FROM Inspecciones;
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
}

/// END LISTARINSPECCIONES

/// BEGIN LISTARINSPECCIONESPROCESS
Future<List<ListarInspeccionesProcessRow>> performListarInspeccionesProcess(
  Database database,
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
    estado
FROM Inspecciones where idEstado = 4;
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
}

/// END LISTARINSPECCIONESPROCESS

/// BEGIN LISTARINSPECCIONESREALIZADA
Future<List<ListarInspeccionesRealizadaRow>> performListarInspeccionesRealizada(
  Database database,
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
    estado
FROM Inspecciones where idEstado = 3;
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
}

/// END LISTARINSPECCIONESREALIZADA

/// BEGIN LISTARINSPECCIONESPROGRAMADA
Future<List<ListarInspeccionesProgramadaRow>>
    performListarInspeccionesProgramada(
  Database database,
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
    estado
FROM Inspecciones where idEstado = 2;
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
    estado
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

/// END LISTARFICHASMODULARESPORIDFICHA

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
WHERE IdPlantilla = '${idPlantilla}' and  IdPlantillaSeccionPadre  = '${idPlantillaSeccionPadre}';

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

/// END LISTARSUBSECCIONES

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
  int? get flagMandatorio => data['FlagMandatorio'] as int?;
  int? get idPlantilla => data['IdPlantilla'] as int?;
}

/// END LISTARPREGUNTAS

/// BEGIN LISTAROPCIONES
Future<List<ListarOpcionesRow>> performListarOpciones(
  Database database, {
  int? idPlantilla,
  int? idPregunta,
  int? idPlantillaSeccion,
}) {
  final query = '''
SELECT 
    IdPlantillaOpcion, 
    IdPlantillaSeccion, 
    IdPlantilla, 
    IdPregunta, 
    Descripcion, 
    ClasificacionOpcion,
    IdTipoOpcion,
    tipoOpcion,
    matIcon
FROM PlantillaOpcion where IdPlantillaSeccion =  '${idPlantillaSeccion}'
and  IdPlantilla  = '${idPlantilla}'
and IdPregunta = '${idPregunta}'
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
}

/// END LISTAROPCIONES
