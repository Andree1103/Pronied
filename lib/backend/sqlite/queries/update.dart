import 'package:sqflite/sqflite.dart';

/// BEGIN CREARFOTO
Future performCrearFoto(
  Database database, {
  String? titulo,
  String? comentario,
  String? imagen,
}) {
  final query = '''
INSERT INTO Fotos (Titulo, Comentario, Imagen) VALUES ('${titulo}','${comentario}','${imagen}')
''';
  return database.rawQuery(query);
}

/// END CREARFOTO
///
/// BEGIN CREARFIRMA
Future performCrearFirma(
    Database database, {
      String? persona,
      String? documento,
      String? numeroDoc,
      String? apePaterno,
      String? apeMaterno,
      String? image,
      String? nombre,
    }) {
  final query = '''
  INSERT INTO Firma (Persona, Documento, NumeroDoc, ApePaterno, ApeMaterno,Image,Nombre) VALUES ('${persona}','${documento}','${numeroDoc}','${apePaterno}','${apeMaterno}','${image}','${nombre}')
''';
  return database.rawQuery(query);
}

/// END CREARFIRMA

/// BEGIN DELETEFIRMA
Future performDeleteFirma(
    Database database, {
      int? id,
    }) {
  final query = '''
Delete FROM Firma  where Id =${id}
''';
  return database.rawQuery(query);
}


/// END DELETEFIRMA

/// BEGIN DELETE FOTO
Future performDeleteFoto(
  Database database, {
  int? idFoto,
}) {
  final query = '''
Delete FROM Fotos where Id = ${idFoto}
''';
  return database.rawQuery(query);
}

/// END DELETE FOTO

/// BEGIN CARGARDATA
Future performCargarData(
  Database database, {
  int? idInspeccion,
  String? nombreIns,
  int? idFichaIns,
  int? idPlantillaIns,
  String? codigolocalIns,
  String? nombreLocalIns,
  String? departamentoIns,
  String? provinciaIns,
  String? distritoIns,
  int? idEstadoIns,
  String? estadoIns,
}) {
  final query = '''
INSERT INTO Inspecciones (idInspeccion, nombreEvento, idFicha, idPlantilla, codigoLocalColegio, nombreLocalColegio, departamentoColegio, provinciaColegio, distritoColegio, idEstado, estado)
VALUES ('${idInspeccion}', '${nombreIns}', '${idFichaIns}', '${idPlantillaIns}', '${codigolocalIns}','${nombreLocalIns}', '${departamentoIns}', '${provinciaIns}', '${distritoIns}', '${idEstadoIns}', '${estadoIns}');

''';
  return database.rawQuery(query);
}

/// END CARGARDATA


/// BEGIN CARGARFICHA
Future performCargarFicha(
    Database database, {
      int? idFicha,
      int? idPlantilla,
      String? codigoLocalColegio,
      String? nombreLocalColegio,
      String? departamentoColegio,
      String? provinciaColegio,
      String? distritoColegio,
      String? centroPobladoColegio,
      String? direccionColegio,
      String? zonaColegio,
      int? totalPabellon,
      int? totalAulas,
      int? totalSSHH,
      String? dniInspector,
      String? nombreInspector,
      String? correoInspector,
      String? telefonoInspector,
      String? fechaInspeccion,
      String? horaInspeccion,
      String? tipoInspeccion,
      String? dniDirector,
      String? nombreDirector,
      String? correoDirector,
      String? telefonoDirector,
      String? dniAlterno,
      String? nombreAlterno,
      String? correoAlterno,
      String? telefonoAlterno,
    }) {
  final query = '''
INSERT INTO Fichas (
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
    TelefonoAlterno,
    EstadoAuditoria
) VALUES ('${idFicha}','${idPlantilla}',
'${codigoLocalColegio}',
'${nombreLocalColegio}',
'${departamentoColegio}',
'${provinciaColegio}',
'${distritoColegio}',
'${centroPobladoColegio}',
'${direccionColegio}',
'${zonaColegio}',
'${totalPabellon}',
'${totalAulas}',
'${totalSSHH}',
'${dniInspector}',
'${nombreInspector}',
'${correoInspector}',
'${telefonoInspector}',
'${fechaInspeccion}',
'${horaInspeccion}',
'${tipoInspeccion}',
'${dniDirector}',
'${nombreDirector}',
'${correoDirector}',
'${telefonoDirector}',
'${dniAlterno}',
'${nombreAlterno}',
'${correoAlterno}',
'${telefonoAlterno}',
'1'
);
''';
  return database.rawQuery(query);
}

/// END CARGARFICHA

/// BEGIN CARGARFICHAMODULAR
Future performCargarFichaModular(
    Database database, {
      int? idFichaModular,
      int? idFicha,
      String? codigoModular,
      String? codigoLocal,
      String? codigoNivel,
      String? nivel,
      String? codigoTipoDocente,
      String? tipoDocente,
      String? codigoTipoSexo,
      String? tipoSexo,
      String? codigoTurno,
      String? turno,
      int? numeroHombres,
      int? numeroMujeres,
      int? numeroAlumnos,
      int? numeroDocente,
      int? numeroSeccion,
    }) {
  final query = '''
INSERT INTO FichaModular (
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
    turno,
    NumeroHombres,
    NumeroMujeres,
    NumeroAlumnos,
    NumeroDocente,
    NumeroSeccion,
    EstadoAuditoria
) VALUES ('${idFichaModular}','${idFicha}',
'${codigoModular}',
'${codigoLocal}',
'${codigoNivel}',
'${nivel}',
'${codigoTipoDocente}',
'${tipoDocente}',
'${codigoTipoSexo}',
'${tipoSexo}',
'${codigoTurno}',
'${turno}',
'${numeroHombres}',
'${numeroMujeres}',
'${numeroAlumnos}',
'${numeroDocente}',
'${numeroSeccion}',
1
);
''';
  return database.rawQuery(query);
}

/// END CARGARFICHAMODULAR

/// BEGIN CARGARPLANTILLA
Future performCargarPlantilla(
  Database database, {
  int? idPlantilla,
  String? nombreFicha,
  int? idUnidadTrabajo,
  String? nombreUnidadTrabajo,
}) {
  final query = '''
Insert into Plantilla  (IdPlantilla, NombreFicha, IdUnidadTrabajo, NombreUnidadTrabajo)
values  ('${idPlantilla}','${nombreFicha}','${idUnidadTrabajo}','${nombreUnidadTrabajo}')
''';
  return database.rawQuery(query);
}

/// END CARGARPLANTILLA

/// BEGIN CARGARPLANTILLASECCIONES
Future performCargarPlantillaSecciones(
  Database database, {
  int? idPlantillaSeccion,
  int? idPlantillaSeccionPadre,
  int? idPlantilla,
  String? descripcion,
  String? modoRepeticion,
}) {
  final query = '''
Insert into PlantillaSeccion  (IdPlantillaSeccion, IdPlantillaSeccionPadre, IdPlantilla, Descripcion,ModoRepeticion)
values  ('${idPlantillaSeccion}','${idPlantillaSeccionPadre}','${idPlantilla}','${descripcion}','${modoRepeticion}')
''';
  return database.rawQuery(query);
}

/// END CARGARPLANTILLASECCIONES

/// BEGIN CARGARPLANTILLAOPCIONES
Future performCargarPlantillaOpciones(
  Database database, {
  int? idPlantillaOpcion,
  int? idPlantillaSeccion,
  int? idPlantilla,
  int? idPregunta,
  String? descripcion,
  String? clasificacionOpcion,
  int? idTipoOpcion,
  String? tipoOpcion,
  String? matIcon,
}) {
  final query = '''
Insert into PlantillaOpcion  (IdPlantillaOpcion, 
IdPlantillaSeccion, 
IdPlantilla, 
IdPregunta,
Descripcion,
ClasificacionOpcion,
IdTipoOpcion,
TipoOpcion,
matIcon
)
values  ('${idPlantillaOpcion}','${idPlantillaSeccion}','${idPlantilla}','${idPregunta}','${descripcion}','${clasificacionOpcion}',
'${idTipoOpcion}','${tipoOpcion}','${matIcon}')
''';
  return database.rawQuery(query);
}

/// END CARGARPLANTILLAOPCIONES

/// BEGIN CARGARPLANTILLAPREGUNTA
Future performCargarPlantillaPregunta(
  Database database, {
  int? idPlantillaPregunta,
  int? idPlantillaSeccion,
  int? idPregunta,
  String? descripcionPregunta,
  int? flagMandatorio,
  int? idPlantilla,
}) {
  final query = '''
Insert into PlantillaPregunta  ( 
IdPlantillaPregunta, 
IdPlantillaSeccion, 
IdPregunta,
DescripcionPregunta,
FlagMandatorio,
IdPlantilla
)
values  ('${idPlantillaPregunta}','${idPlantillaSeccion}','${idPregunta}','${descripcionPregunta}','${flagMandatorio}',
'${idPlantilla}')
''';
  return database.rawQuery(query);
}

/// END CARGARPLANTILLAPREGUNTA

/// BEGIN ACTUALIZARFICHA
Future performActualizarFicha(
  Database database, {
  int? idFicha,
  String? centroPobladoColegio,
  String? direccionColegio,
  String? zonaColegio,
  int? totalPabellon,
  int? totalAulas,
  int? totalSSHH,
  String? dniDirector,
  String? nombreDirector,
  String? correoDirector,
  String? telefonoDirector,
  String? dniAlterno,
  String? nombreAlterno,
  String? correoAlterno,
  String? telefonoAlterno,
  String? dniInspector,
  String? nombreInspector,
  String? correoInspector,
  String? telefonoInspector,
  String? fechaInspeccion,
  String? horaInspeccion,
  String? tipoInspeccion,
}) {
  final query = '''
UPDATE Fichas
SET
    CentroPobladoColegio = '${centroPobladoColegio}',
    DireccionColegio = '${direccionColegio}',
    ZonaColegio = '${zonaColegio}',
    TotalPabellon = '${totalPabellon}',
    TotalAulas = '${totalAulas}', -- Parece que debería ser 'totalAulas' en lugar de 'totalPabellon'
    TotalSSHH = '${totalSSHH}',
    DniDirector = '${dniDirector}',
    NombreDirector = '${nombreDirector}',
    CorreoDirector = '${correoDirector}',
    TelefonoDirector = '${telefonoDirector}',
    DniAlterno = '${dniAlterno}',
    NombreAlterno = '${nombreAlterno}',
    CorreoAlterno = '${correoAlterno}',
    TelefonoAlterno = '${telefonoAlterno}',
    DniInspector = '${dniInspector}',
    NombreInspector = '${nombreInspector}',
    CorreoInspector = '${correoInspector}',
    TelefonoInspector = '${telefonoInspector}',
    FechaInspeccion = '${fechaInspeccion}',
    HoraInspeccion = '${horaInspeccion}',
    TipoInspeccion = '${tipoInspeccion}'
WHERE 
    idFicha = ${idFicha};


''';
  return database.rawQuery(query);
}



Future performActualizarFichaMod(
    Database database, {
      String? codigoModular,
      int? numeroHombres,
      int? numeroMujeres,
      int? numeroAlumnos,
      int? numeroDocente,
      int? numeroSeccion
    }) {
  final query = '''
UPDATE FichaModular
SET
    NumeroHombres = ${numeroHombres},
    NumeroMujeres = ${numeroMujeres},
    NumeroAlumnos = ${numeroAlumnos},
    NumeroDocente = ${numeroDocente},
    NumeroSeccion = ${numeroSeccion}
WHERE 
    CodigoModular = '${codigoModular}';


''';
  return database.rawQuery(query);
}


/// END ACTUALIZARFICHA
