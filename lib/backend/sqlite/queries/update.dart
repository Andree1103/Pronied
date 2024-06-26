import 'package:sqflite/sqflite.dart';

/// BEGIN CREARFOTO
Future performCrearFoto(
  Database database, {
  String? titulo,
  String? comentario,
  String? imagen,
}) {
  final query = '''
INSERT INTO FichasArchivos (titulo, comentario, rutalocal) VALUES ('${titulo}','${comentario}','${imagen}')
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


/// BEGIN CREARFOTO
Future performfichaArchivos(
    Database database, {
      int? idFichaArchivoMovil,
      int? idFichaArchivo,
      int? idFicha,
      String? nombre,
      String? extension,
      String? ruta,
      double? peso,
      String? estadoAuditoria,
      String? usuarioCreacionAuditoria,
      String? usuarioModificacionAuditoria,
      String? fechaCreacionAuditoria,
      String? fechaModificacionAuditoria,
      String? equipoCreacionAuditoria,
      String? equipoModificacionAuditoria,
      String? programaCreacionAuditoria,
      String? programaModificacionAuditoria,
      int? modificadoMovil,
      int? uploadDocumento,
      String? rutalocal,
      String? titulo,
      String? comentario
    }) {
  final query = '''
INSERT INTO FichasArchivos (idFichaArchivoMovil,
   idFichaArchivo,idFicha, nombre, extension,ruta, peso, estadoAuditoria, usuarioCreacionAuditoria, usuarioModificacionAuditoria,
    fechaCreacionAuditoria, fechaModificacionAuditoria, equipoCreacionAuditoria, equipoModificacionAuditoria, programaCreacionAuditoria,
    programaModificacionAuditoria,modificadoMovil,uploadDocumento,rutalocal,titulo,comentario)
    VALUES (${idFichaArchivoMovil}, ${idFichaArchivo}, ${idFicha}, '${nombre}', '${extension}', '${ruta}', ${peso}, '${estadoAuditoria}',
     '${usuarioCreacionAuditoria}','${usuarioModificacionAuditoria}','${fechaCreacionAuditoria}', '${fechaModificacionAuditoria}', '${equipoCreacionAuditoria}',
      '${equipoModificacionAuditoria}', '${programaCreacionAuditoria}', '${programaModificacionAuditoria}', ${modificadoMovil},${uploadDocumento},'${rutalocal}','${titulo}','${comentario}')
''';
  return database.rawQuery(query);
}


///
/// BEGIN CREARFICHAFIRMA
Future performCrearFichaFirma(
    Database database, {
      int? idFichaFirmaMovil,
      int? idFichaFirma,
      int? idFicha,
      String? nombres,
      String? apellidoPaterno,
      String? apellidoMaterno,
      String? nombreArchivo,
      String? extension,
      String? ruta,
      double? peso,
      String? tipoArchivo,
      String? numDocumento,
      int? idTipoDocumento,
      int? idTipoPersona,
      String? estadoAuditoria,
      String? usuarioCreacionAuditoria,
      String? usuarioModificacionAuditoria,
      String? fechaCreacionAuditoria,
      String? fechaModificacionAuditoria,
      String? equipoCreacionAuditoria,
      String? equipoModificacionAuditoria,
      String? programaCreacionAuditoria,
      String? programaModificacionAuditoria,
      int? modificacionMovil,
      int? uploadDocumento,
      String? rutalocal
    }) {
  final query = '''
  INSERT INTO FichasFirmas (idFichaFirmaMovil,
   idFichaFirma,idFicha, nombres, apellidoPaterno,apellidoMaterno, nombreArchivo, extension,
   ruta, peso, tipoArchivo, numDocumento,idTipoDocumento, idTipoPersona, estadoAuditoria,
   usuarioCreacionAuditoria, usuarioModificacionAuditoria,fechaCreacionAuditoria, fechaModificacionAuditoria,
   equipoCreacionAuditoria, equipoModificacionAuditoria, programaCreacionAuditoria, programaModificacionAuditoria,modificacionMovil,uploadDocumento,rutalocal) 
   VALUES (${idFichaFirmaMovil}, ${idFichaFirma}, ${idFicha}, '${nombres}', '${apellidoPaterno}', 
   '${apellidoMaterno}', '${nombreArchivo}', '${extension}', '${ruta}', ${peso}, '${tipoArchivo}', 
   '${numDocumento}', ${idTipoDocumento}, ${idTipoPersona}, '${estadoAuditoria}', '${usuarioCreacionAuditoria}',
    '${usuarioModificacionAuditoria}', '${fechaCreacionAuditoria}', '${fechaModificacionAuditoria}', 
    '${equipoCreacionAuditoria}', '${equipoModificacionAuditoria}', '${programaCreacionAuditoria}', 
    '${programaModificacionAuditoria}', ${modificacionMovil},${uploadDocumento},'${rutalocal}')
''';
  return database.rawQuery(query);
}

/// END CREARFIRMA

/// BEGIN DELETEFIRMA
Future performDeleteFirma(
    Database database, {
      int? id,
      String? usuarioModificacionAuditoria,
      String? fechaModificacionAuditoria,
      String? equipoModificacionAuditoria,
      String? programaModificacionAuditoria
    }) {
  final query = '''
UPDATE FichasFirmas
SET estadoAuditoria = '0', modificacionMovil = 1,
    usuarioModificacionAuditoria = '${usuarioModificacionAuditoria}',
    fechaModificacionAuditoria = '${fechaModificacionAuditoria}',
    equipoModificacionAuditoria = '${equipoModificacionAuditoria}',
    programaModificacionAuditoria = '${programaModificacionAuditoria}'
WHERE idFichaFirmaMovil = ${id};
''';
  return database.rawQuery(query);
}


/// END DELETEFIRMA

/// BEGIN DELETE FOTO
Future performDeleteFoto(
  Database database, {
  int? idFoto,
  String? usuarioModificacionAuditoria,
  String? fechaModificacionAuditoria,
  String? equipoModificacionAuditoria,
  String? programaModificacionAuditoria
}) {
  final query = '''
UPDATE FichasArchivos
SET estadoAuditoria = '0', modificadoMovil = 1,
    usuarioModificacionAuditoria = '${usuarioModificacionAuditoria}',
    fechaModificacionAuditoria = '${fechaModificacionAuditoria}',
    equipoModificacionAuditoria = '${equipoModificacionAuditoria}',
    programaModificacionAuditoria = '${programaModificacionAuditoria}'
WHERE idFichaArchivoMovil = ${idFoto};
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
      String? dniIns,
  String? estadoIns,
  String? usuarioCreacionAuditoria,
  String? usuarioModificacionAuditoria,
  String? fechaCreacionAuditoria,
  String? fechaModificacionAuditoria,
  String? equipoCreacionAuditoria,
  String? equipoModificacionAuditoria,
  String? programaCreacionAuditoria,
  String? programaModificacionAuditoria

}) {
  final query = '''
INSERT INTO Inspecciones (idInspeccion, nombreEvento, idFicha, idPlantilla, codigoLocalColegio, nombreLocalColegio, departamentoColegio, provinciaColegio, distritoColegio, idEstado, estado,modificadoMovil,
usuarioCreacionAuditoria,usuarioModificacionAuditoria,fechaCreacionAuditoria,fechaModificacionAuditoria,equipoCreacionAuditoria,equipoModificacionAuditoria,programaCreacionAuditoria,programaModificacionAuditoria,dniInspector )
VALUES ('${idInspeccion}', '${nombreIns}', '${idFichaIns}', '${idPlantillaIns}', '${codigolocalIns}','${nombreLocalIns}', '${departamentoIns}', '${provinciaIns}', '${distritoIns}', '${idEstadoIns}', '${estadoIns}',0,
'${usuarioCreacionAuditoria}','${usuarioModificacionAuditoria}','${fechaCreacionAuditoria}','${fechaModificacionAuditoria}','${equipoCreacionAuditoria}','${equipoModificacionAuditoria}','${programaCreacionAuditoria}','${programaModificacionAuditoria}','${dniIns}')

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
      double? latitud,
      double? longitud,
      String? usuarioCreacion,
      String? usuarioModificacion,
      String? fechaCreacion,
      String? fechaModificacion,
      String? equipoCreacion,
      String? equipoModificacion,
      String? programaCreacion,
      String? programaModificacion,
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
    EstadoAuditoria,
    Latitud,
    Longitud,
    UsuarioCreacionAuditoria,
    UsuarioModificacionAuditoria,
    FechaCreacionAuditoria,
    FechaModificacionAuditoria,
    EquipoCreacionAuditoria,
    EquipoModificacionAuditoria,
    ProgramaCreacionAuditoria,
    ProgramaModificacionAuditoria,
    modificadoMovil
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
'1',
'${latitud}',
'${longitud}',
'${usuarioCreacion}',
'${usuarioModificacion}',
'${fechaCreacion}',
'${fechaModificacion}',
'${equipoCreacion}',
'${equipoModificacion}',
'${programaCreacion}',
'${programaModificacion}',
0
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
      String? estadoAuditoria,
      String? usuarioCreacionAuditoria,
      String? usuarioModificacionAuditoria,
      String? fechaCreacionAuditoria,
      String? fechaModificacionAuditoria,
      String? equipoCreacionAuditoria,
      String? equipoModificacionAuditoria,
      String? programaCreacionAuditoria,
      String? programaModificacionAuditoria
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
    EstadoAuditoria,
    UsuarioCreacionAuditoria,
    UsuarioModiciacionAuditoria,
    FechaCreacionAuditoria,
    FechaModificacionAuditoria,
    EquipoCreacionAuditoria,
    EquipoModificacionAuditoria,
    ProgramaCreacionAuditoria,
    ProgramaModificacionAuditoria
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
'${estadoAuditoria}',
'${usuarioCreacionAuditoria}',
'${usuarioModificacionAuditoria}',
'${fechaCreacionAuditoria}',
'${fechaModificacionAuditoria}',
'${equipoCreacionAuditoria}',
'${equipoModificacionAuditoria}',
'${programaCreacionAuditoria}',
'${programaModificacionAuditoria}'
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
  //String? dniInspector,
  //String? nombreInspector,
  String? correoInspector,
  String? telefonoInspector,
  String? fechaInspeccion,
  String? horaInspeccion,
  String? tipoInspeccion,
  String? UsuarioModificacionAudi,
  String? FechaModificacionAuditoria,
  String? EquipoModificacionAuditoria,
      String? ProgramaModificacionAuditoria,
  int? modificadoMovil,
}) {
  final query = '''
UPDATE Fichas
SET
    CentroPobladoColegio = '${centroPobladoColegio}',
    DireccionColegio = '${direccionColegio}',
    ZonaColegio = '${zonaColegio}',
    TotalPabellon = '${totalPabellon}',
    TotalAulas = '${totalAulas}',
    TotalSSHH = '${totalSSHH}',
    DniDirector = '${dniDirector}',
    NombreDirector = '${nombreDirector}',
    CorreoDirector = '${correoDirector}',
    TelefonoDirector = '${telefonoDirector}',
    DniAlterno = '${dniAlterno}',
    NombreAlterno = '${nombreAlterno}',
    CorreoAlterno = '${correoAlterno}',
    TelefonoAlterno = '${telefonoAlterno}',
   
    CorreoInspector = '${correoInspector}',
    TelefonoInspector = '${telefonoInspector}',
    FechaInspeccion = '${fechaInspeccion}',
    HoraInspeccion = '${horaInspeccion}',
    TipoInspeccion = '${tipoInspeccion}',
    UsuarioModificacionAuditoria = '${UsuarioModificacionAudi}',
    FechaModificacionAuditoria = '${FechaModificacionAuditoria}',
    EquipoModificacionAuditoria = '${EquipoModificacionAuditoria}',
    ProgramaModificacionAuditoria = '${ProgramaModificacionAuditoria}',
    modificadoMovil = ${modificadoMovil}
    
WHERE 
    idFicha = ${idFicha};


''';
  return database.rawQuery(query);
}

/// BEGIN ACTUALIZARFICHA
Future performFirmaUpload(
    Database database, {
      int? idFicha,
      String? rutalocal,
      String? nombreArchivo,
      String? extension,
      String? ruta,
      double? peso,
      int? uploadDocumento
    }) {
  final query = '''
UPDATE FichasFirmas
SET
    nombreArchivo = '${nombreArchivo}',
    extension = '${extension}',
    ruta = '${ruta}',
    peso = ${peso},
    uploadDocumento = ${uploadDocumento}
WHERE 
    idFicha = ${idFicha} and rutalocal = '${rutalocal}';


''';
  return database.rawQuery(query);
}


/// BEGIN ACTUALIZARFICHA
Future performArchivosUpload(
    Database database, {
      int? idFicha,
      String? rutalocal,
      String? nombreArchivo,
      String? extension,
      String? ruta,
      double? peso,
      int? uploadDocumento
    }) {
  final query = '''
UPDATE FichasArchivos
SET
    nombre = '${nombreArchivo}',
    extension = '${extension}',
    ruta = '${ruta}',
    peso = ${peso},
    uploadDocumento = ${uploadDocumento}
WHERE 
    idFicha = ${idFicha} and rutalocal = '${rutalocal}';


''';
  return database.rawQuery(query);
}

/// BEGIN ACTUALIZARFICHA
Future performPreguntaArchivosUpload(
    Database database, {
      int? idFicha,
      String? rutalocal,
      String? nombreArchivo,
      String? extension,
      String? ruta,
      double? peso,
      //Nombre = '${nombreArchivo}',
      int? uploadDocumento
    }) {
  final query = '''
UPDATE FichaPreguntaArchivo
SET
    Extension = '${extension}',
    Ruta = '${ruta}',
    Peso = ${peso},
    uploadDocumento = ${uploadDocumento}
WHERE 
    IdFicha = ${idFicha} and rutaLocal = '${rutalocal}';


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
      int? numeroSeccion,
      String? UsuarioModificacionAudi,
      String? FechaModificacionAuditoria,
      String? EquipoModificacionAuditoria,
      String? ProgramaModificacionAuditoria,
      int? modificadoMovil,
    }) {
  final query = '''
UPDATE FichaModular
SET
    NumeroHombres = ${numeroHombres},
    NumeroMujeres = ${numeroMujeres},
    NumeroAlumnos = ${numeroAlumnos},
    NumeroDocente = ${numeroDocente},
    NumeroSeccion = ${numeroSeccion},
    UsuarioModiciacionAuditoria = '${UsuarioModificacionAudi}',
    FechaModificacionAuditoria = '${FechaModificacionAuditoria}',
    EquipoModificacionAuditoria = '${EquipoModificacionAuditoria}',
    ProgramaModificacionAuditoria = '${ProgramaModificacionAuditoria}',
    modificadoMovil = ${modificadoMovil}
WHERE 
    CodigoModular = '${codigoModular}';


''';
  return database.rawQuery(query);
}


Future performActualizarFichaModAPI(
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
      String? estadoAuditoria,
      String? usuacrioCreacionAudi,
      String? usuarioModificacionAudi,
      String? fechaCrecionAuditoria,
      String? fechaModificacionAuditoria,
      String? equipoCreacionAuditoria,
      String? equipoModificacionAuditoria,
      String? programaCreacionAuditoria,
      String? programaModificacionAuditoria
    }) {
  final query = '''
UPDATE FichaModular
SET
    IdFicha = ${idFicha},
    CodigoModular = '${codigoModular}',
    CodigoLocal = '${codigoLocal}',
    CodigoNivel = '${codigoNivel}',
    Nivel = '${nivel}',
    CodigoTipoDocente = '${codigoTipoDocente}',
    TipoDocente = '${tipoDocente}',
    CodigoTipoSexo = '${codigoTipoSexo}',
    TipoSexo = '${tipoSexo}',
    CodigoTurno = '${codigoTurno}',
    Turno = '${turno}',
    NumeroHombres = ${numeroHombres},
    NumeroMujeres = ${numeroMujeres},
    NumeroAlumnos = ${numeroAlumnos},
    NumeroDocente = ${numeroDocente},
    NumeroSeccion = ${numeroSeccion},
    EstadoAuditoria = '${estadoAuditoria}',
    UsuarioCreacionAuditoria = '${usuacrioCreacionAudi}',
    UsuarioModiciacionAuditoria = '${usuarioModificacionAudi}',
    FechaCreacionAuditoria = '${fechaCrecionAuditoria}',
    FechaModificacionAuditoria = '${fechaModificacionAuditoria}',
    equipoCreacionAuditoria = '${equipoCreacionAuditoria}',
    EquipoModificacionAuditoria = '${equipoModificacionAuditoria}',
    ProgramaCreacionAuditoria = '${programaCreacionAuditoria}',
    ProgramaModificacionAuditoria = '${programaModificacionAuditoria}'
WHERE 
    IdFichaModular = '${idFichaModular}';


''';
  return database.rawQuery(query);
}

Future performActualizarFichaFirmasMod(
    Database database, {
      int? idFichaFirma,
      int? idFichaFirmaMovil,
      int? idFicha,
      String? nombres,
      String? apellidoPaterno,
      String? apellidoMaterno,
      String? nombreArchivo,
      String? extension,
      String? ruta,
      double? peso,
      String? tipoArchivo,
      String? numDocumento,
      int? idTipoDocumento,
      int? idTipoPersona,
      String? estadoAuditoria,
      String? usuarioCreacionAuditoria,
      String? usuarioModificacionAuditoria,
      String? fechaCreacionAuditoria,
      String? fechaModificacionAuditoria,
      String? equipoCreacionAuditoria,
      String? equipoModificacionAuditoria,
      String? programaCreacionAuditoria,
      String? programaModificacionAuditoria,
      int? modificacionMovil,
    }) {
  final query = '''
UPDATE FichasFirmas
SET
    idFicha = ${idFicha},
    idFichaFirma = ${idFichaFirma},
    nombres = '${nombres}',
    apellidoPaterno = '${apellidoPaterno}',
    apellidoMaterno = '${apellidoMaterno}',
    nombreArchivo = '${nombreArchivo}',
    extension = '${extension}',
    ruta = '${ruta}',
    peso = ${peso},
    tipoArchivo = '${tipoArchivo}',
    numDocumento = '${numDocumento}',
    idTipoDocumento = ${idTipoDocumento},
    idTipoPersona = ${idTipoPersona},
    estadoAuditoria = '${estadoAuditoria}',
    usuarioCreacionAuditoria = '${usuarioCreacionAuditoria}',
    usuarioModificacionAuditoria = '${usuarioModificacionAuditoria}',
    fechaCreacionAuditoria = '${fechaCreacionAuditoria}',
    fechaModificacionAuditoria = '${fechaModificacionAuditoria}',
    equipoCreacionAuditoria = '${equipoCreacionAuditoria}',
    equipoModificacionAuditoria = '${equipoModificacionAuditoria}',
    programaCreacionAuditoria = '${programaCreacionAuditoria}',
    programaModificacionAuditoria = '${programaModificacionAuditoria}',
    modificacionMovil = ${modificacionMovil}
WHERE 
    (idFichaFirmaMovil = ${idFichaFirmaMovil} or idFichaFirma = ${idFichaFirma}) and idFicha = ${idFicha};


''';
  return database.rawQuery(query);
}


Future performActualizarFichaArchivosMod(
    Database database, {
      int? idFichaArchivo,
      int? idFichaArchivoMovil,
      int? idFicha,
      String? nombre,
      String? extension,
      String? ruta,
      String? peso,
      String? estadoAuditoria,
      String? usuarioCreacionAuditoria,
      String? usuarioModificacionAuditoria,
      String? fechaCreacionAuditoria,
      String? fechaModificacionAuditoria,
      String? equipoCreacionAuditoria,
      String? equipoModificacionAuditoria,
      String? programaCreacionAuditoria,
      String? programaModificacionAuditoria,
      int? modificadoMovil,
    }) {
  final query = '''
UPDATE FichasArchivos
SET
    idFicha = ${idFicha},
    idFichaArchivo = ${idFichaArchivo},
    nombre = '${nombre}',
    extension = '${extension}',
    ruta = '${ruta}',
    peso = ${peso},
    estadoAuditoria = '${estadoAuditoria}',
    usuarioCreacionAuditoria = '${usuarioCreacionAuditoria}',
    usuarioModificacionAuditoria = '${usuarioModificacionAuditoria}',
    fechaCreacionAuditoria = '${fechaCreacionAuditoria}',
    fechaModificacionAuditoria = '${fechaModificacionAuditoria}',
    equipoCreacionAuditoria = '${equipoCreacionAuditoria}',
    equipoModificacionAuditoria = '${equipoModificacionAuditoria}',
    programaCreacionAuditoria = '${programaCreacionAuditoria}',
    programaModificacionAuditoria = '${programaModificacionAuditoria}',
    modificadoMovil = ${modificadoMovil}
WHERE 
    (idFichaArchivoMovil = ${idFichaArchivoMovil} or idFichaArchivo = ${idFichaArchivo}) and idFicha = ${idFicha};


''';
  return database.rawQuery(query);
}




Future performActualizarRpta(
    Database database, {
      String? rpta,
      int? idficha,
      int? idplantilla,
      int? idplantillaseccion,
      int? idpregunta,
      String? usuarioModificacion,
      String? fechaModificacion,
      String? equipoModificacion,
      String? programaModificacion,
      int?  numero
    }) {
  final query = '''
UPDATE FichaPreguntaRespuestas
SET
    Respuesta = '${rpta}',
    UsuarioModificacionAuditoria = '${usuarioModificacion}',
    FechaModificacionAuditoria = '${fechaModificacion}',
    EquipoModificacionAuditoria = '${equipoModificacion}',
    ProgramaModificacionAuditoria = '${programaModificacion}',
    NumeroRepeticion = ${numero},
    modificadoMovil = 1
WHERE 
    IdFicha = ${idficha} and 
    IdPlantillaOpcion = ${idplantilla} and
    IdPlantillaSeccion = ${idplantillaseccion} and
    IdPregunta = ${idpregunta} and
    NumeroRepeticion = ${numero}
''';
  return database.rawQuery(query);
}

Future performCrearRpta(
    Database database, {
      String? rpta,
      int? idficha,
      int? idplantilla,
      int? idplantillaseccion,
      int? idpregunta,
      String? usuarioCreacion,
      String? fechaCreacion,
      String? equipoCreacion,
      String? programaCreacion,
      int? numero
    }) {
  final query = '''
INSERT INTO FichaPreguntaRespuestas (
  Respuesta,
  IdFicha,
  IdPlantillaOpcion,
  IdPlantillaSeccion,
  IdPregunta,
  NumeroRepeticion,
  EstadoAuditoria,
  UsuarioCreacionAuditoria,
  FechaCreacionAuditoria,
  EquipoCreacionAuditoria,
  ProgramaCreacionAuditoria,
  modificadoMovil
) VALUES (
  '${rpta}',
  ${idficha},
  ${idplantilla},
  ${idplantillaseccion},
  ${idpregunta},
  ${numero},
  "1",
  '${usuarioCreacion}',
  '${fechaCreacion}',
  '${equipoCreacion}',
  '${programaCreacion}',
  1
)
''';
  return database.rawQuery(query);
}



/// END ACTUALIZARFICHA

/// BEGIN CARGARFICHARESPUESTA
Future performCargarFichaRespuesta(
    Database database, {
      int? idFichaPreguntaRespuesta,
      int? idFicha,
      int? idPlantillaOpcion,
      int? idPregunta,
      int? idPlantillaSeccion,
      String? numeroRepeticion,
      String? respuesta,
      String? estadoAuditoria,
      String? usuarioCreacionAuditoria,
      String? usuarioModificacionAuditoria,
      String? fechaCreacionAuditoria,
      String? fechaModificacionAuditoria,
      String? equipoCreacionAuditoria,
      String? equipoModificacionAuditoria,
      String? programaCreacionAuditoria,
      String? programaModificacionAuditoria
    }) {
  final query = '''
Insert into FichaPreguntaRespuestas  (
IdFichaPreguntaRespuesta, 
IdFicha, 
IdPlantillaOpcion,
IdPregunta,
IdPlantillaSeccion,
NumeroRepeticion,
Respuesta,
EstadoAuditoria,
UsuarioCreacionAuditoria,
UsuarioModificacionAuditoria,
FechaCreacionAuditoria,
FechaModificacionAuditoria,
EquipoCreacionAuditoria,
EquipoModificacionAuditoria,
ProgramaCreacionAuditoria,
ProgramaModificacionAuditoria
)
values  ('${idFichaPreguntaRespuesta}','${idFicha}','${idPlantillaOpcion}','${idPregunta}','${idPlantillaSeccion}',
'${numeroRepeticion}','${respuesta}','${estadoAuditoria}','${usuarioCreacionAuditoria}','${usuarioModificacionAuditoria}','${fechaCreacionAuditoria}',
'${fechaModificacionAuditoria}','${equipoCreacionAuditoria}','${equipoModificacionAuditoria}','${programaCreacionAuditoria}',
'${programaModificacionAuditoria}')
''';
  return database.rawQuery(query);
}

/// END CARGARFICHARESPUESTA

///SINCRONIZACION
Future performCargarSincronizacion(
    Database database, {
      String? Fecha,
      int? Estado,
      String? IP,
      String? Latitud,
      String? Longitud,
      String? Cum,
      String? Usuario
    }) {
  final query = '''
Insert into Sincronizacion  (
Fecha, 
Estado, 
IP,
Latitud,
Longitud,
Cum,
Usuario
)
values  ('${Fecha}','${Estado}','${IP}','${Latitud}','${Longitud}',
'${Cum}','${Usuario}')
''';
  return database.rawQuery(query);
}

///END SINCRONIZACIONC

///COLA COLASINCRONIZACION
Future performColaSincronizacion(
    Database database, {
      String? TipoDato,
      int? Estado,
      int? IdDatoLocal,
      int? IdDatoServer,
      int? IdSincro,
      String? UsuarioCreacionAuditoria,
      String? EquipoCreacionAuditoria,
      String? FechaCreacionAuditoria,
      String? ProgramaCreacionAuditoria
    }) {
  final query = '''
Insert into ColaSincronizacion  (
TipoDato, 
EstadoSincronizacion, 
IdDatoLocal,
IdDatoServer,
IdSincro,
UsuarioCreacionAuditoria,
EquipoCreacionAuditoria,
FechaCreacionAuditoria,
ProgramaCreacionAuditoria
)
values  ('${TipoDato}',${Estado},${IdDatoLocal},${IdDatoServer},${IdSincro}, '${UsuarioCreacionAuditoria}', '${EquipoCreacionAuditoria}', '${FechaCreacionAuditoria}','${ProgramaCreacionAuditoria}')
''';
  return database.rawQuery(query);
}


///COLA COLASINCRONIZACIONupdatependiente
Future performColaSincronizacionCompleto(
    Database database, {
      int? IdColaSinc
    }) {
  final query = '''
UPDATE ColaSincronizacion 
SET EstadoSincronizacion = 2
WHERE IdCola = ${IdColaSinc}
    
''';
  return database.rawQuery(query);
}

///COLA COLASINCRONIZACIONupdatependiente
Future performColaSincronizacionCompleto3(
    Database database, {
      int? IdColaSinc
    }) {
  final query = '''
UPDATE ColaSincronizacion 
SET EstadoSincronizacion = 3
WHERE IdCola = ${IdColaSinc}
    
''';
  return database.rawQuery(query);
}


Future performActualizarInspeccionApi(
    Database database, {
      int? idInspeccion,
      String? nombreEvento,
      int? idFicha,
      int? idPlantilla,
      String? codigoLocalColegio,
      String? nombreLocalColegio,
      String? departamentoColegio,
      String? provinciaColegio,
      String? distritoColegio,
      int? idEstado,
      String? estado,
      String? usuarioCreacionAuditoria,
      String? usuarioModificacionAuditoria,
      String? fechaCreacionAuditoria,
      String? fechaModificacionAuditoria,
      String? equipoCreacionAuditoria,
      String? equipoModificacionAuditoria,
      String? programaCreacionAuditoria,
      String? programaModificacionAuditoria,
      String? dniInspector,
    }) {
  final query = '''
UPDATE Inspecciones
SET
    nombreEvento = '${nombreEvento}',
    idPlantilla = ${idPlantilla},
    codigoLocalColegio = '${codigoLocalColegio}',
    nombreLocalColegio = '${nombreLocalColegio}',
    departamentoColegio = '${departamentoColegio}',
    provinciaColegio = '${provinciaColegio}',
    distritoColegio = '${distritoColegio}',
    idEstado = ${idEstado},
    estado = '${estado}',
    usuarioCreacionAuditoria = '${usuarioCreacionAuditoria}',
    usuarioModificacionAuditoria = '${usuarioModificacionAuditoria}',
    fechaCreacionAuditoria = '${fechaCreacionAuditoria}',
    fechaModificacionAuditoria = '${fechaModificacionAuditoria}',
    equipoCreacionAuditoria = '${equipoCreacionAuditoria}',
    equipoModificacionAuditoria = '${equipoModificacionAuditoria}',
    programaCreacionAuditoria = '${programaCreacionAuditoria}',
    programaModificacionAuditoria = '${programaModificacionAuditoria}',
    dniInspector = '${dniInspector}'
WHERE 
    idInspeccion = ${idInspeccion}

''';
  return database.rawQuery(query);
}

Future performActualizarInspeccionEstado(
    Database database, {
      int? idInspeccion,
      String? usuarioModificacionAuditoria,
      String? fechaModificacionAuditoria,
      String? equipoModificacionAuditoria,
      String? programaModificacionAuditoria
    }) {
  final query = '''
UPDATE Inspecciones
SET
    idEstado = 4,
    estado = 'EN REGISTRO',
    usuarioModificacionAuditoria = '${usuarioModificacionAuditoria}',
    fechaModificacionAuditoria = '${fechaModificacionAuditoria}',
    equipoModificacionAuditoria = '${equipoModificacionAuditoria}',
    programaModificacionAuditoria = '${programaModificacionAuditoria}'
WHERE 
    idInspeccion = ${idInspeccion}

''';
  return database.rawQuery(query);
}


Future performFinalizarInspeccion(
    Database database, {
      int? idInspeccion,
      String? usuarioModificacionAuditoria,
      String? fechaModificacionAuditoria,
      String? equipoModificacionAuditoria,
      String? programaModificacionAuditoria
    }) {
  final query = '''
UPDATE Inspecciones
SET
    idEstado = 3,
    estado = 'REALIZADA',
    usuarioModificacionAuditoria = '${usuarioModificacionAuditoria}',
    fechaModificacionAuditoria = '${fechaModificacionAuditoria}',
    equipoModificacionAuditoria = '${equipoModificacionAuditoria}',
    programaModificacionAuditoria = '${programaModificacionAuditoria}'
WHERE 
    idInspeccion = ${idInspeccion}

''';
  return database.rawQuery(query);
}


Future performActualizarFichaAPI(
    Database database, {
      int? idFicha,
      int? idPlantilla,
      String? codigoLocalColegio,
      String? nombreLocalColegio,
      String? departamentloColegio,
      String? provinciaColegio,
      String? distritoColegio,
      String? centroPobladoColegio,
      String? direccionColegio,
      String? zonaColegio,
      double? latitud,
      double? longitud,
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
      String? usuarioCreacionAudi,
      String? usuarioModificacionAudi,
      String? fechaCreacionAuditoria,
      String? fechaModificacionAuditoria,
      String? equipoCreacionAuditoria,
      String? equipoModificacionAuditoria,
      String? programaCreacionAuditoria,
      String? programaModificacionAuditoria
    }) {
  final query = '''
UPDATE Fichas
SET
    IdPlantilla = ${idPlantilla},
    CodigoLocalColegio = '${codigoLocalColegio}',
    NombreLocalColegio = '${nombreLocalColegio}',
    DepartamentoColegio = '${departamentloColegio}',
    ProvinciaColegio = '${provinciaColegio}',
    DistritoColegio = '${distritoColegio}', -- Parece que debería ser 'totalAulas' en lugar de 'totalPabellon'
    CentroPobladoColegio = '${centroPobladoColegio}',
    DireccionColegio = '${direccionColegio}',
    ZonaColegio = '${zonaColegio}',
    TotalPabellon = '${totalPabellon}',
    TotalAulas = '${totalAulas}',
    TotalSSHH = '${totalSSHH}',
    DniInspector = '${dniInspector}',
    NombreInspector = '${nombreInspector}',
    CorreoInspector = '${correoInspector}',
    TelefonoInspector = '${telefonoInspector}',
    FechaInspeccion = '${fechaInspeccion}',
    HoraInspeccion = '${horaInspeccion}',
    TipoInspeccion = '${tipoInspeccion}',
    DniDirector = '${dniDirector}',
    NombreDirector = '${nombreDirector}',
    CorreoDirector = '${correoDirector}',
    TelefonoDirector = '${telefonoDirector}',
    DniAlterno = '${dniAlterno}',
    NombreAlterno = '${nombreAlterno}',
    CorreoAlterno = '${correoAlterno}',
    TelefonoAlterno = '${telefonoAlterno}',
    UsuarioCreacionAuditoria = '${usuarioCreacionAudi}',
    UsuarioModificacionAuditoria = '${usuarioModificacionAudi}',
    FechaCreacionAuditoria = '${fechaCreacionAuditoria}',
    FechaModificacionAuditoria = '${fechaModificacionAuditoria}',
    EquipoCreacionAuditoria = '${equipoCreacionAuditoria}',
    EquipoModificacionAuditoria = '${equipoModificacionAuditoria}',
    ProgramaModificacionAuditoria = '${programaModificacionAuditoria}'
    WHERE 
      idFicha = ${idFicha};


''';
  return database.rawQuery(query);
}

///ACTUALIZARPLANTILLASAPI
///

Future performActualizarPlantillaAPI(
    Database database, {
      int? idPlantilla,
      String? nombreFicha,
      int? idUnidadTrabajo,
      String? nombreUnidadTrabajo
    }) {
  final query = '''
UPDATE Plantilla
SET
    NombreFicha = '${nombreFicha}',
    IdUnidadTrabajo = ${idUnidadTrabajo},
    NombreUnidadTrabajo = '${nombreUnidadTrabajo}'
WHERE 
    IdPlantilla = ${idPlantilla};


''';
  return database.rawQuery(query);
}


///ACTUALIZARSECCIONAPI
///

Future performActualizarSeccionAPI(
    Database database, {
      int? idPlantillaSeccion,
      int? idPlantillaSeccionPadre,
      int? idPlantilla,
      String? descripcion,
      String? modoRepeticion
    }) {
  final query = '''
UPDATE PlantillaSeccion
SET
    IdPlantillaSeccionPadre = ${idPlantillaSeccionPadre},
    IdPlantilla = ${idPlantilla},
    Descripcion = '${descripcion}',
    ModoRepeticion = '${modoRepeticion}'
WHERE 
    IdPlantillaSeccion = ${idPlantillaSeccion};


''';
  return database.rawQuery(query);
}

///ACTUALIZAROPCIONAPI
///

Future performActualizarOpcionAPI(
    Database database, {
      int? idPlantillaOpcion,
      int? idPlantillaSeccion,
      int? idPlantilla,
      int? idPregunta,
      String? descripcion,
      String? clasificacionOpcion,
      int? idTipoOpcion,
      String? tipoOpcion,
      String? matIcon
    }) {
  final query = '''
UPDATE PlantillaOpcion
SET
    IdPlantilla = ${idPlantilla},
    IdPlantillaSeccion = ${idPlantillaSeccion},
    IdPregunta = ${idPregunta},
    Descripcion = '${descripcion}',
    ClasificacionOpcion = '${clasificacionOpcion}',
    IdTipoOpcion = ${idTipoOpcion},
    TipoOpcion = '${tipoOpcion}',
    matIcon = '${matIcon}'
WHERE 
    IdPlantillaOpcion = ${idPlantillaOpcion};


''';
  return database.rawQuery(query);
}


///ACTUALIZAROPCIONAPI
///

Future performActualizarPreguntaAPI(
    Database database, {
      int? idPlantillaPregunta,
      int? idPlantillaSeccion,
      int? idPregunta,
      String? descripcionPregunta,
      int? flagMandatorio,
      int? idPlantilla
    }) {
  final query = '''
UPDATE PlantillaPregunta
SET
    IdPlantillaSeccion = ${idPlantillaSeccion},
    IdPregunta = ${idPregunta},
    DescripcionPregunta = '${descripcionPregunta}',
    FlagMandatorio = ${flagMandatorio},
    IdPlantilla = ${idPlantilla}
WHERE 
    IdPlantillaPregunta = ${idPlantillaPregunta};


''';
  return database.rawQuery(query);
}


///ACTUALIZARRESPUESTAAPI
///

Future performActualizarRespuestaAPI(
    Database database, {
      int? idFichaPreguntaRespuesta,
      int? idFicha,
      int? idPlantillaOpcion,
      int? idPregunta,
      int? idPlantillaSeccion,
      String? numeroRepeticion,
      String? respuesta,
      String? estadoAuditoria,
      String? usuarioCreacionAuditoria,
      String? usuarioModificacionAuditoria,
      String? fechaCreacionAuditoria,
      String? fechaModificacionAuditoria,
      String? equipoCreacionAuditoria,
      String? equipoModificacionAuditoria,
      String? programaCreacionAuditoria,
      String? programaModificacionAuditoria
    }) {
  final query = '''
UPDATE FichaPreguntaRespuestas
SET
    IdFicha = ${idFicha},
    IdPlantillaOpcion = ${idPlantillaOpcion},
    IdPregunta = ${idPregunta},
    IdPlantillaSeccion = ${idPlantillaSeccion},
    NumeroRepeticion = '${numeroRepeticion}',
    Respuesta = '${respuesta}',
    EstadoAuditoria = '${estadoAuditoria}',
    UsuarioCreacionAuditoria = '${usuarioCreacionAuditoria}',
    UsuarioModificacionAuditoria = '${usuarioModificacionAuditoria}',
    FechaCreacionAuditoria = '${fechaCreacionAuditoria}',
    FechaModificacionAuditoria = '${fechaModificacionAuditoria}',
    EquipoCreacionAuditoria = '${equipoCreacionAuditoria}',
    EquipoModificacionAuditoria = '${equipoModificacionAuditoria}',
    ProgramaCreacionAuditoria = '${programaCreacionAuditoria}',
    ProgramaModificacionAuditoria = '${programaModificacionAuditoria}'
WHERE 
    IdFicha = ${idFicha} and
    IdPlantillaOpcion = ${idPlantillaOpcion} and
    IdPregunta = ${idPregunta} and
    IdPlantillaSeccion = ${idPlantillaSeccion} and
    NumeroRepeticion = '${numeroRepeticion}';


''';
  return database.rawQuery(query);
}


///FICHA MODIFICACION MOVIL 0
///

Future performActualizarFichaModificacion0(
    Database database, {
      int? idFicha
    }) {
  final query = '''
UPDATE Fichas
SET
    modificadoMovil = 0
    WHERE 
      idFicha = ${idFicha};

''';
  return database.rawQuery(query);
}


///FICHA FIRMAS MOVIL 0
///

Future performActualizarFichaFirmas0(
    Database database, {
      int? idFicha
    }) {
  final query = '''
UPDATE FichasFirmas
SET
    modificadoMovil = 0
    WHERE 
      idFichaFirmaMovil = ${idFicha};

''';
  return database.rawQuery(query);
}


///FICHA MODIFICACION MOVIL 0
///

Future performActualizarFichaModularModificacion0(
    Database database, {
      int? idFichaModular
    }) {
  final query = '''
UPDATE FichaModular
SET
    modificadoMovil = 0
    WHERE 
      IdFichaModular = ${idFichaModular};

''';
  return database.rawQuery(query);
}



///FICHA RESPUESTA MOVIL 0
///

Future performActualizarFichaRespuestaModificacion0(
    Database database, {
      int? idFichaPreguntaRespuesta
    }) {
  final query = '''
UPDATE FichaPreguntaRespuestas
SET
    modificadoMovil = 0
    WHERE 
      IdFichaPreguntaRespuesta = ${idFichaPreguntaRespuesta};

''';
  return database.rawQuery(query);
}

///ACTUALIZARSINCRONIZACIONMOVIL
///

Future performActualizarSincAPI(
    Database database, {
      int? idSincroMovil,
      int? idSincroServer,
      int? inspeccionesCargadasServer,
      int? inspeccionesDescargadasServer,
      int? idEstadoSincronizacion
    }) {
  final query = '''
UPDATE Sincronizacion
SET
    IdSincroServer = ${idSincroServer},
    InspeccionesCargadasServer = ${inspeccionesCargadasServer},
    InspeccionesDescargadasServer = ${inspeccionesDescargadasServer},
    Estado = ${idEstadoSincronizacion}
WHERE 
    IdSincro = ${idSincroMovil};


''';
  return database.rawQuery(query);
}

///ACTUALIZARSINCRONIZACIONMOVILINSPECCIONES

Future performModificacionInspecicon1(
    Database database, {
      int? idFicha,
      String? usuarioModificacionAuditoria,
      String? fechaModificacionAuditoria,
      String? equipoModificacionAuditoria,
      String? programaModificacionAuditoria
    }) {
  final query = '''
UPDATE Inspecciones 
SET modificadoMovil = 1,
    usuarioModificacionAuditoria = '${usuarioModificacionAuditoria}',
    fechaModificacionAuditoria = '${fechaModificacionAuditoria}',
    equipoModificacionAuditoria = '${equipoModificacionAuditoria}',
    programaModificacionAuditoria = '${programaModificacionAuditoria}'
WHERE idFicha = ${idFicha}
    
''';
  return database.rawQuery(query);
}
///END

///ACTUALIZARSINCRONIZACIONMOVILINSPECCIONESs

Future performModificacionInspecicon0(
    Database database, {
      int? idFicha,
    }) {
  final query = '''
UPDATE Inspecciones 
SET modificadoMovil = 0
WHERE idFicha = ${idFicha}
    
''';
  return database.rawQuery(query);
}
///END
///

///FICHAMODIFICADOMOVIL

Future performModificacionFicha1(
    Database database, {
      int? idFicha
    }) {
  final query = '''
UPDATE Fichas 
SET modificadoMovil = 1
WHERE idFicha = ${idFicha}
    
''';
  return database.rawQuery(query);
}
///END
///
///
/// FICHAPREGUNTACOMENTARIO

Future performActualizarComentarioAPI(
    Database database, {
      int? idFichaPreguntaComentarioLocal,
      int? idFichaPreguntaComentario,
      int? idFicha,
      int? idPregunta,
      int? idPlantillaSeccion,
      String? observacion,
      String? numeroRepeticion,
      String? estadoAuditoria,
      String? usuarioCreacionAuditoria,
      String? usuarioModificacionAuditoria,
      String? fechaCreacionAuditoria,
      String? fechaModificacionAuditoria,
      String? equipoCreacionAuditoria,
      String? equipoModificacionAuditoria,
      String? programaCreacionAuditoria,
      String? programaModificacionAuditoria,
      int? modificadoMovil
    }) {
  final query = '''
UPDATE FichaPreguntaRespuestas
SET
    IdFichaPreguntaComentario = ${idFichaPreguntaComentario},
    IdFicha = ${idFicha},
    IdPregunta = ${idPregunta},
    IdPlantillaSeccion = ${idPlantillaSeccion},
    Observacion = '${observacion}',
    numeroRepeticion = '${numeroRepeticion}',
    EstadoAuditoria = '${estadoAuditoria}',
    UsuarioCreacionAuditoria = '${usuarioCreacionAuditoria}',
    UsuarioModificacionAuditoria = '${usuarioModificacionAuditoria}',
    FechaCreacionAuditoria = '${fechaCreacionAuditoria}',
    FechaModificacionAuditoria = '${fechaModificacionAuditoria}',
    EquipoCreacionAuditoria = '${equipoCreacionAuditoria}',
    EquipoModificacionAuditoria = '${equipoModificacionAuditoria}',
    ProgramaCreacionAuditoria = '${programaCreacionAuditoria}',
    ProgramaModificacionAuditoria = '${programaModificacionAuditoria}',
    modificadoMovil = ${modificadoMovil}
WHERE 
    (IdFichaPreguntaComentarioLocal = ${idFichaPreguntaComentario} or IdFichaPreguntaComentario = ${idFichaPreguntaComentarioLocal}) and IdFicha = ${idFicha};
''';
  return database.rawQuery(query);
}

Future performCrearComentarioAPI(
    Database database, {
      //int? idFichaPreguntaComentarioLocal,
      int? idFichaPreguntaComentario,
      int? idFicha,
      int? idPregunta,
      int? idPlantillaSeccion,
      String? observacion,
      String? numeroRepeticion,
      String? estadoAuditoria,
      String? usuarioCreacionAuditoria,
      String? usuarioModificacionAuditoria,
      String? fechaCreacionAuditoria,
      String? fechaModificacionAuditoria,
      String? equipoCreacionAuditoria,
      String? equipoModificacionAuditoria,
      String? programaCreacionAuditoria,
      String? programaModificacionAuditoria,
      int? modificadoMovil
    }) {
  final query = '''
INSERT INTO FichaPreguntaComentario (
  IdFichaPreguntaComentario,
  IdFicha,
  IdPregunta,
  IdPlantillaSeccion,
  Observacion,
  numeroRepeticion,
  EstadoAuditoria,
  UsuarioCreacionAuditoria,
  UsuarioModificacionAuditoria,
  FechaCreacionAuditoria,
  FechaModificacionAuditoria,
  EquipoCreacionAuditoria,
  EquipoModificacionAuditoria,
  ProgramaCreacionAuditoria,
  ProgramaModificacionAuditoria,
  modificadoMovil
) VALUES (
  ${idFichaPreguntaComentario},
  ${idFicha},
  ${idPregunta},
  ${idPlantillaSeccion},
  '${observacion}',
  '${numeroRepeticion}',
  '${estadoAuditoria}',
  '${usuarioCreacionAuditoria}',
  '${usuarioModificacionAuditoria}',
  '${fechaCreacionAuditoria}',
  '${fechaModificacionAuditoria}',
  '${equipoCreacionAuditoria}',
  '${equipoModificacionAuditoria}',
  '${programaCreacionAuditoria}',
  '${programaModificacionAuditoria}',
  ${modificadoMovil}
)
''';
  return database.rawQuery(query);
}

Future performActualizarComentario(
    Database database, {
      int? idFichaPreguntaComentarioLocal,
      int? idFichaPreguntaComentario,
      int? idFicha,
      int? idPregunta,
      int? idPlantillaSeccion,
      String? observacion,
      String? numeroRepeticion,
      String? estadoAuditoria,
      String? usuarioModificacionAuditoria,
      String? fechaModificacionAuditoria,
      String? equipoModificacionAuditoria,
      String? programaModificacionAuditoria,
      int? modificadoMovil
    }) {
  final query = '''
UPDATE FichaPreguntaComentario
SET
    IdFichaPreguntaComentario = ${idFichaPreguntaComentario},
    IdFicha = ${idFicha},
    IdPregunta = ${idPregunta},
    IdPlantillaSeccion = ${idPlantillaSeccion},
    Observacion = '${observacion}',
    numeroRepeticion = '${numeroRepeticion}',
    EstadoAuditoria = '${estadoAuditoria}',
    UsuarioModificacionAuditoria = '${usuarioModificacionAuditoria}',
    FechaModificacionAuditoria = '${fechaModificacionAuditoria}',
    EquipoModificacionAuditoria = '${equipoModificacionAuditoria}',
    ProgramaModificacionAuditoria = '${programaModificacionAuditoria}',
    modificadoMovil = ${modificadoMovil}
WHERE 
    (IdFichaPreguntaComentario = ${idFichaPreguntaComentario} or IdFichaPreguntaComentarioLocal = ${idFichaPreguntaComentarioLocal}) and IdFicha = ${idFicha};
''';
  return database.rawQuery(query);
}

Future performActualizarPreguntaComentarioAPI(
    Database database, {
      int? idFichaPreguntaComentarioLocal,
      int? idFichaPreguntaComentario,
      int? idFicha,
      int? idPregunta,
      int? idPlantillaSeccion,
      String? observacion,
      String? numeroRepeticion,
      String? estadoAuditoria,
      String? usuarioCreacionAuditoria,
      String? usuarioModificacionAuditoria,
      String? fechaCreacionAuditoria,
      String? fechaModificacionAuditoria,
      String? equipoCreacionAuditoria,
      String? equipoModificacionAuditoria,
      String? programaCreacionAuditoria,
      String? programaModificacionAuditoria,
      int? modificadoMovil
    }) {
  final query = '''
UPDATE FichaPreguntaComentario
SET
    IdFichaPreguntaComentario = ${idFichaPreguntaComentario},
    IdFicha = ${idFicha},
    IdPregunta = ${idPregunta},
    IdPlantillaSeccion = ${idPlantillaSeccion},
    Observacion = '${observacion}',
    numeroRepeticion = '${numeroRepeticion}',
    EstadoAuditoria = '${estadoAuditoria}',
    UsuarioCreacionAuditoria = '${usuarioCreacionAuditoria}',
    UsuarioModificacionAuditoria = '${usuarioModificacionAuditoria}',
    FechaCreacionAuditoria = '${fechaCreacionAuditoria}',
    FechaModificacionAuditoria = '${fechaModificacionAuditoria}',
    EquipoCreacionAuditoria = '${equipoCreacionAuditoria}',
    EquipoModificacionAuditoria = '${equipoModificacionAuditoria}',
    ProgramaCreacionAuditoria = '${programaCreacionAuditoria}',
    ProgramaModificacionAuditoria = '${programaModificacionAuditoria}',
    modificadoMovil = ${modificadoMovil}
WHERE 
    (IdFichaPreguntaComentarioLocal = ${idFichaPreguntaComentarioLocal} or IdFichaPreguntaComentario = ${idFichaPreguntaComentario}) and IdFicha = ${idFicha};
''';
  return database.rawQuery(query);
}

///PREGUNTA ARCHIVOS
///

Future performCrearPreguntaArchivoAPI(
    Database database, {
      //int? IdFichaPreguntaArchivoLocal,
      int? idFichaPreguntaArchivo,
      int? idFicha,
      int? idPlantillaSeccion,
      int? idPregunta,
      String? nombre,
      String? extension,
      String? ruta,
      String? rutaLocal,
      String? peso,
      String? numeroRepeticion,
      String? estadoAuditoria,
      String? usuarioCreacionAuditoria,
      String? usuarioModificacionAuditoria,
      String? fechaCreacionAuditoria,
      String? fechaModificacionAuditoria,
      String? equipoCreacionAuditoria,
      String? equipoModificacionAuditoria,
      String? programaCreacionAuditoria,
      String? programaModificacionAuditoria,
      int? modificadoMovil,
      int? uploadDocumento
    }) {
  final query = '''
INSERT INTO FichaPreguntaArchivo (
  IdFichaPreguntaArchivo,
  IdFicha,
  idPlantillaSeccion,
  IdPregunta,
  numeroRepeticion,
  Nombre,
  Extension,
  Ruta,
  Peso,
  EstadoAuditoria,
  UsuarioCreacionAuditoria,
  UsuarioModificacionAuditoria,
  FechaCreacionAuditoria,
  FechaModificacionAuditoria,
  EquipoCreacionAuditoria,
  EquipoModificacionAuditoria,
  ProgramaCreacionAuditoria,
  ProgramaModificacionAuditoria,
  modificadoMovil,
  rutaLocal,
  uploadDocumento
) VALUES (
  ${idFichaPreguntaArchivo},
  ${idFicha},
  ${idPlantillaSeccion},
  ${idPregunta},
  '${numeroRepeticion}',
  '${nombre}',
  '${extension}',
  '${ruta}',
  '${peso}',
  '${estadoAuditoria}',
  '${usuarioCreacionAuditoria}',
  '${usuarioModificacionAuditoria}',
  '${fechaCreacionAuditoria}',
  '${fechaModificacionAuditoria}',
  '${equipoCreacionAuditoria}',
  '${equipoModificacionAuditoria}',
  '${programaCreacionAuditoria}',
  '${programaModificacionAuditoria}',
  ${modificadoMovil},
  '${rutaLocal}',
  ${uploadDocumento}
)
''';
  return database.rawQuery(query);
}

Future performActualizarPreguntaArchivoAPI(
    Database database, {
      int? idFichaPreguntaArchivoLocal,
      int? idFichaPreguntaArchivo,
      int? idFicha,
      int? idPregunta,
      int? idPlantillaSeccion,
      String? numeroRepeticion,
      String? nombre,
      String? extension,
      String? ruta,
      String? peso,
      String? estadoAuditoria,
      String? usuarioCreacionAuditoria,
      String? usuarioModificacionAuditoria,
      String? fechaCreacionAuditoria,
      String? fechaModificacionAuditoria,
      String? equipoCreacionAuditoria,
      String? equipoModificacionAuditoria,
      String? programaCreacionAuditoria,
      String? programaModificacionAuditoria,
      int? modificadoMovil,
      int? uploadDocumento
    }) {
  final query = '''
UPDATE FichaPreguntaArchivo
SET
    IdFichaPreguntaArchivo = ${idFichaPreguntaArchivo},
    IdFicha = ${idFicha},
    IdPregunta = ${idPregunta},
    IdPlantillaSeccion = ${idPlantillaSeccion},
    numeroRepeticion = '${numeroRepeticion}',
    Nombre = '${nombre}',
    Extension = '${extension}',
    Ruta = '${ruta}',
    Peso = '${peso}',
    EstadoAuditoria = '${estadoAuditoria}',
    UsuarioCreacionAuditoria = '${usuarioCreacionAuditoria}',
    UsuarioModificacionAuditoria = '${usuarioModificacionAuditoria}',
    FechaCreacionAuditoria = '${fechaCreacionAuditoria}',
    FechaModificacionAuditoria = '${fechaModificacionAuditoria}',
    EquipoCreacionAuditoria = '${equipoCreacionAuditoria}',
    EquipoModificacionAuditoria = '${equipoModificacionAuditoria}',
    ProgramaCreacionAuditoria = '${programaCreacionAuditoria}',
    ProgramaModificacionAuditoria = '${programaModificacionAuditoria}',
    modificadoMovil = ${modificadoMovil},
    uploadDocumento = ${uploadDocumento}
WHERE 
    (IdFichaPreguntaArchivoLocal = ${idFichaPreguntaArchivoLocal} or IdFichaPreguntaArchivo = ${idFichaPreguntaArchivo}) and IdFicha = ${idFicha};
''';
  return database.rawQuery(query);
}

Future performDeleteArchivo(
    Database database, {
      int? idFoto,
      String? usuarioModificacionAuditoria,
      String? fechaModificacionAuditoria,
      String? equipoModificacionAuditoria,
      String? programaModificacionAuditoria
    }) {
  final query = '''
UPDATE FichaPreguntaArchivo
SET EstadoAuditoria = '0', modificadoMovil = 1,
    UsuarioModificacionAuditoria = '${usuarioModificacionAuditoria}',
    FechaModificacionAuditoria = '${fechaModificacionAuditoria}',
    EquipoModificacionAuditoria = '${equipoModificacionAuditoria}',
    ProgramaModificacionAuditoria = '${programaModificacionAuditoria}'
WHERE IdFichaPreguntaArchivoLocal = ${idFoto};
''';
  return database.rawQuery(query);
}

Future performCrearUsuario(
    Database database, {
      String? usuario,
      String? contra,
      String? username,
      String? nombrecompleto,
      String? rol,
      String? ubicacion
    }) {
  final query = '''
INSERT INTO User (
  Usuario,
  Contraseña,
  Username,
  NombreCompleto,
  Rol,
  UbicacionUser
) VALUES (
  '${usuario}',
  '${contra}',
  '${username}',
  '${nombrecompleto}',
  '${rol}',
  '${ubicacion}'
)
''';
  return database.rawQuery(query);
}

Future performActualizarUsuario(
    Database database, {
      String? usuario,
      String? contra,
      String? username,
      String? nombrecompleto,
      String? rol,
      String? ubicacion
    }) {
  final query = '''
UPDATE User
SET Usuario = '${usuario}',
    Contraseña = '${contra}',
    Username = '${username}',
    NombreCompleto = '${nombrecompleto}',
    Rol = '${rol}',
    UbicacionUser = '${ubicacion}'
WHERE Usuario = '${usuario}';
''';
  return database.rawQuery(query);
}

