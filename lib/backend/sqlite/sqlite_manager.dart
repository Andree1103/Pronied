import 'package:flutter/foundation.dart';

import '/backend/sqlite/init.dart';
import 'queries/read.dart';
import 'queries/update.dart';

import 'package:sqflite/sqflite.dart';
export 'queries/read.dart';
export 'queries/update.dart';

class SQLiteManager {
  SQLiteManager._();

  static SQLiteManager? _instance;
  static SQLiteManager get instance => _instance ??= SQLiteManager._();

  static late Database _database;
  Database get database => _database;

  static Future initialize() async {
    if (kIsWeb) {
      return;
    }
    _database = await initializeDatabaseFromDbFile(
      'db_inspecciones_proniedv1',
      'InspeccionesPronied.db',
    );
  }

  /// START READ QUERY CALLS

  Future<List<ListarFotosRow>> listarFotos({
    int? idFicha,
}) => performListarFotos(
        _database,
        idFicha: idFicha,
      );

  Future<List<ListarFirmasRow>> listarFirmas({
    int? idFicha,
  }) =>
      performListarFirmas(
        _database,
        idFicha: idFicha,
      );

  Future<List<ListarInspeccionesRow>> listarInspecciones({
    String? dniInspector,
}) =>
      performListarInspecciones(
        _database,
        dniInspector: dniInspector,
      );

  Future<List<ListarInspeccionesProcessRow>> listarInspeccionesProcess({
    String? dniInspector,
}) =>
      performListarInspeccionesProcess(
        _database,
        dniInspector: dniInspector,
      );

  Future<List<ListarInspeccionesRealizadaRow>> listarInspeccionesRealizada(
    {String? dniInspector}
      ) =>
      performListarInspeccionesRealizada(
        _database,
        dniInspector: dniInspector,
      );

  Future<List<ListarInspeccionesProgramadaRow>>
      listarInspeccionesProgramada({
    String? dniInspector,
}) => performListarInspeccionesProgramada(
            _database,
            dniInspector: dniInspector,
          );

  Future<List<ListarInspeccionesMod1Row>>
  listarInspeccionesMod1({
   String? dniInspector,
}) => performListarInspeccionesMod1(
    _database,
    dniInspector: dniInspector,
  );

  Future<List<ListarFichaPorIdFichaRow>> listarFichaPorIdFicha({
    int? idFicha,
  }) =>
      performListarFichaPorIdFicha(
        _database,
        idFicha: idFicha,
      );

  Future<List<ListarInspeccionesPorIdFichaRow>> listarInspeccionesPorIdFicha({
    int? idFicha,
  }) =>
      performListarInspeccionesPorIdFicha(
        _database,
        idFicha: idFicha,
      );

  Future<List<ListarFichasModularesPorIdFichaRow>>
      listarFichasModularesPorIdFicha({
    int? idFicha,
  }) =>
          performListarFichasModularesPorIdFicha(
            _database,
            idFicha: idFicha,
          );

  Future<List<ListarFichasModularesPorModificado>>
  listarFichasModularesPorModificad({
    String? dniInspector,
  }) =>
      performListarFichasModularesPorModificado(
        _database,
        dniInspector: dniInspector,
      );

  Future<List<ListarFichasModificacion>>
  listarFichasModificas({
    String? dniInspector,
}) =>
      performListarFichaMod(
          _database,
          dniInspector: dniInspector
      );

  Future<List<ListarFichasFirmaModificacion>>
  listarFichasFirmaModificas({
    String? dniInspector,
}) =>
      performListarFichaFirmaMod(
          _database,
        dniInspector: dniInspector
      );

  Future<List<ListarFichasModificacionModificacion>>
  listarFichasArchivosModificas({
    String? dniInspector,
}) =>
      performListarFichaArchivosMod(
          _database,
          dniInspector: dniInspector
      );


  Future<List<ListarFichasFirmas>>
  listarFichasFirmas1() =>
      performListarFichaFirmas(
          _database
      );

  Future<List<ListarFichasArchivos>>
  listarFichasArchivos1() =>
      performListarFichaArchivos(
          _database
      );

  Future<List<ListarFichasPreguntaArchivos>>
  listarFichasPreguntaArchivos1() =>
      performListarFichaPreguntaArchivos(
          _database
      );

  Future<List<FichaPreguntaRespuestas>>
  listarRespuestasModificas({
    String? dniInspector,
}) =>
      performListarFichaPreguntaRespuestas(
          _database,
          dniInspector: dniInspector
      );

  Future<List<ListarFichasComentarioModificacion>>
  listarComentariosModificas({
    String? dniInspector,
  }) =>
      performListarComentariosMod(
          _database,
          dniInspector: dniInspector
      );

  Future<List<ListarFichasFichaArchivoModificacion>>
  listarFichaArchivModificas({
    String? dniInspector,
  }) =>
      performListarFichaArchivoMod(
          _database,
          dniInspector: dniInspector
      );

  Future<List<SincronizacionUltimo>>
  listarSincronizacionUltimo() =>
      performSincronizacionUltimo(
          _database
      );

  Future<List<ColaSincronizacionList>>
  ListarColaSincronizacion() =>
      performListColaSincronizacion(
          _database
      );

  Future<List<ListarPlantillaSeccionRow>> listarPlantillaSeccion({
    int? idPlantilla,
  }) =>
      performListarPlantillaSeccion(
        _database,
        idPlantilla: idPlantilla,
      );

  Future<List<ListarSubseccionesRow>> listarSubsecciones({
    int? idPlantilla,
    int? idPlantillaSeccionPadre,
  }) =>
      performListarSubsecciones(
        _database,
        idPlantilla: idPlantilla,
        idPlantillaSeccionPadre: idPlantillaSeccionPadre,
      );

  Future<List<ListarSubseccionRow>> listarSubseccion({
    int? idPlantillaSeccion,
  }) =>
      performListarSubseccion(
        _database,
        idPlantillaSeccion: idPlantillaSeccion,
      );

  Future<List<ListarAulas>> listarAulas({
    int? idFicha
  }) =>
      performListarAulas(
        _database,
        idFicha: idFicha,
      );

  Future<List<ListarPabellon>> listarPabellones({
    int? idFicha
  }) =>
      performListarPabellon(
        _database,
        idFicha: idFicha,
      );

  Future<List<ListarLatitud>> listarLatitud({
    int? idFicha
  }) =>
      performListarLatitud(
        _database,
        idFicha: idFicha,
      );

  Future<List<ListarLongitud>> listarLongitud({
    int? idFicha
  }) =>
      performListarLongitud(
        _database,
        idFicha: idFicha,
      );

  Future<List<ListarSSHH>> listarSSHH({
    int? idFicha
  }) =>
      performListarSSHH(
        _database,
        idFicha: idFicha,
      );

  Future<List<ListarPreguntasRow>> listarPreguntas({
    int? idPlantillaSeccion,
    int? idPlantilla,
  }) =>
      performListarPreguntas(
        _database,
        idPlantillaSeccion: idPlantillaSeccion,
        idPlantilla: idPlantilla,
      );

  Future<List<ListarPreguntaComentarioRow>> listarComentarios ({
    int? idPlantillaSeccion,
    int? idPregunta,
    int? idFicha,
    String? numeroRpe
}) =>
      performListarPreguntaComentario(
        _database,
        idPlantillaSeccion: idPlantillaSeccion,
        idPregunta: idPregunta,
        idFicha: idFicha,
        numeroRepeticion: numeroRpe
      );

  Future<List<ListarPreguntaArchivosRow>> listarPreguntaArchivoss ({
    int? idPlantillaSeccion,
    int? idPregunta,
    int? idFicha,
    String? numeroRpe
  }) =>
      performListarPreguntaArchivos(
          _database,
          idPlantillaSeccion: idPlantillaSeccion,
          idPregunta: idPregunta,
          idFicha: idFicha,
          numeroRepeticion: numeroRpe
      );

  Future<List<ListarOpcionesRow>> listarOpciones({
    int? idPlantilla,
    int? idPregunta,
    int? idPlantillaSeccion,
    int? idFicha,
    int? numero
  }) =>
      performListarOpciones(
        _database,
        idPlantilla: idPlantilla,
        idPregunta: idPregunta,
        idPlantillaSeccion: idPlantillaSeccion,
        idFicha: idFicha,
        numero: numero
      );

  Future<List<ListarPreguntasObligatoriasRow>> listarPreguntasObligatorias({
    int? idFicha,
    int? numero,
    String? modorepeticion
  }) =>
      performListarObligatorias(
          _database,
          idFicha: idFicha,
          numero: numero,
          modorepeticion: modorepeticion
      );

  /// END READ QUERY CALLS

  /// START UPDATE QUERY CALLS

  Future crearFoto({
    String? titulo,
    String? comentario,
    String? imagen,
  }) =>
      performCrearFoto(
        _database,
        titulo: titulo,
        comentario: comentario,
        imagen: imagen,
      );

  Future crearFirma({
    String? persona,
    String? documento,
    String? numeroDoc,
    String? apePaterno,
    String? apeMaterno,
    String? image,
    String? nombre,
  }) =>
      performCrearFirma(
        _database,
        persona: persona,
        documento: documento,
        numeroDoc: numeroDoc,
        apePaterno: apePaterno,
        apeMaterno: apeMaterno,
        image: image,
        nombre: nombre,
      );


  Future crearFichaFirma({
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
}) => performCrearFichaFirma(
    _database,
    idFichaFirmaMovil: idFichaFirmaMovil,
    idFichaFirma: idFichaFirma,
    idFicha: idFicha,
    nombres: nombres,
    apellidoPaterno: apellidoPaterno,
    apellidoMaterno: apellidoMaterno,
    nombreArchivo: nombreArchivo,
    extension: extension,
    ruta: ruta,
    peso: peso,
    tipoArchivo: tipoArchivo,
    numDocumento: numDocumento,
    idTipoDocumento: idTipoDocumento,
    idTipoPersona: idTipoPersona,
    estadoAuditoria: estadoAuditoria,
    usuarioCreacionAuditoria: usuarioCreacionAuditoria,
    usuarioModificacionAuditoria: usuarioModificacionAuditoria,
    fechaCreacionAuditoria: fechaCreacionAuditoria,
    fechaModificacionAuditoria: fechaModificacionAuditoria,
    equipoCreacionAuditoria: equipoCreacionAuditoria,
    equipoModificacionAuditoria: equipoModificacionAuditoria,
    programaCreacionAuditoria: programaCreacionAuditoria,
    programaModificacionAuditoria: programaModificacionAuditoria,
    modificacionMovil: modificacionMovil,
    uploadDocumento: uploadDocumento,
    rutalocal: rutalocal
  );

  Future crearFichaArchivo({
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
  }) => performfichaArchivos(
      _database,
    idFicha: idFicha,
    idFichaArchivo: idFichaArchivo,
    idFichaArchivoMovil: idFichaArchivoMovil,
    nombre: nombre,
    extension: extension,
    ruta: ruta,
    peso: peso,
    estadoAuditoria: estadoAuditoria,
    usuarioCreacionAuditoria: usuarioCreacionAuditoria,
    usuarioModificacionAuditoria: usuarioModificacionAuditoria,
    fechaCreacionAuditoria: fechaCreacionAuditoria,
    fechaModificacionAuditoria: fechaModificacionAuditoria,
    equipoCreacionAuditoria: equipoCreacionAuditoria,
    equipoModificacionAuditoria: equipoModificacionAuditoria,
    programaCreacionAuditoria: programaCreacionAuditoria,
    programaModificacionAuditoria: programaModificacionAuditoria,
    modificadoMovil: modificadoMovil,
    uploadDocumento: uploadDocumento,
    rutalocal: rutalocal,
    titulo: titulo,
    comentario: comentario
  );


  Future deleteFirma({
    int? id,
    String? usuarioModificacionAuditoria,
    String? fechaModificacionAuditoria,
    String? equipoModificacionAuditoria,
    String? programaModificacionAuditoria
  }) =>
      performDeleteFirma(
        _database,
        id: id,
        usuarioModificacionAuditoria: usuarioModificacionAuditoria,
        fechaModificacionAuditoria: fechaModificacionAuditoria,
        equipoModificacionAuditoria: equipoModificacionAuditoria,
        programaModificacionAuditoria: programaModificacionAuditoria
      );

  Future deleteFoto({
    int? idFoto,
    String? usuarioModificacionAuditoria,
    String? fechaModificacionAuditoria,
    String? equipoModificacionAuditoria,
    String? programaModificacionAuditoria
  }) =>
      performDeleteFoto(
        _database,
        idFoto: idFoto,
        usuarioModificacionAuditoria: usuarioModificacionAuditoria,
        fechaModificacionAuditoria: fechaModificacionAuditoria,
        equipoModificacionAuditoria: equipoModificacionAuditoria,
        programaModificacionAuditoria: programaModificacionAuditoria
      );

  Future deletePreARCHIVO({
    int? idFoto,
    String? usuarioModificacionAuditoria,
    String? fechaModificacionAuditoria,
    String? equipoModificacionAuditoria,
    String? programaModificacionAuditoria
  }) =>
      performDeleteArchivo(
          _database,
          idFoto: idFoto,
          usuarioModificacionAuditoria: usuarioModificacionAuditoria,
          fechaModificacionAuditoria: fechaModificacionAuditoria,
          equipoModificacionAuditoria: equipoModificacionAuditoria,
          programaModificacionAuditoria: programaModificacionAuditoria
      );

  Future cargarData({
    int? idInspeccion,
    String? nombreIns,
    int? idFichaIns,
    int? idPlantillaIns,
    String? dniIns,
    String? codigolocalIns,
    String? nombreLocalIns,
    String? departamentoIns,
    String? provinciaIns,
    String? distritoIns,
    int? idEstadoIns,
    String? estadoIns,
    String? usuarioCreacionAuditoria,
    String? usuarioModificacionAuditoria,
    String? fechaCreacionAuditoria,
    String? fechaModificacionAuditoria,
    String? equipoCreacionAuditoria,
    String? equipoModificacionAuditoria,
    String? programaCreacionAuditoria,
    String? programaModificacionAuditoria
  }) =>
      performCargarData(
        _database,
        idInspeccion: idInspeccion,
        nombreIns: nombreIns,
        idFichaIns: idFichaIns,
        idPlantillaIns: idPlantillaIns,
        codigolocalIns: codigolocalIns,
        nombreLocalIns: nombreLocalIns,
        departamentoIns: departamentoIns,
        provinciaIns: provinciaIns,
        distritoIns: distritoIns,
        idEstadoIns: idEstadoIns,
        estadoIns: estadoIns,
        usuarioCreacionAuditoria: usuarioCreacionAuditoria,
        usuarioModificacionAuditoria: usuarioModificacionAuditoria,
        fechaCreacionAuditoria: fechaCreacionAuditoria,
        fechaModificacionAuditoria: fechaModificacionAuditoria,
        equipoCreacionAuditoria: equipoCreacionAuditoria,
        equipoModificacionAuditoria: equipoModificacionAuditoria,
        programaCreacionAuditoria: programaCreacionAuditoria,
        programaModificacionAuditoria: programaModificacionAuditoria,
        dniIns: dniIns
      );

  Future cargarFicha({
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
    String? programaModificacion
  }) =>
      performCargarFicha(
        _database,
        idFicha: idFicha,
        idPlantilla: idPlantilla,
        codigoLocalColegio: codigoLocalColegio,
        nombreLocalColegio: nombreLocalColegio,
        departamentoColegio: departamentoColegio,
        provinciaColegio: provinciaColegio,
        distritoColegio: distritoColegio,
        centroPobladoColegio: centroPobladoColegio,
        direccionColegio: direccionColegio,
        zonaColegio: zonaColegio,
        totalPabellon: totalPabellon,
        totalAulas: totalAulas,
        totalSSHH: totalSSHH,
        dniInspector: dniInspector,
        nombreInspector: nombreInspector,
        correoInspector: correoInspector,
        telefonoInspector: telefonoInspector,
        fechaInspeccion: fechaInspeccion,
        horaInspeccion: horaInspeccion,
        tipoInspeccion: tipoInspeccion,
        dniDirector: dniDirector,
        nombreDirector: nombreDirector,
        correoDirector: correoDirector,
        telefonoDirector: telefonoDirector,
        dniAlterno: dniAlterno,
        nombreAlterno: nombreAlterno,
        correoAlterno: correoAlterno,
        telefonoAlterno: telefonoAlterno,
        latitud: latitud,
        longitud: longitud,
        usuarioCreacion: usuarioCreacion,
        usuarioModificacion: usuarioModificacion,
        fechaCreacion: fechaCreacion,
        fechaModificacion: fechaModificacion,
        equipoCreacion: equipoCreacion,
        equipoModificacion: equipoModificacion,
        programaCreacion: programaCreacion,
        programaModificacion: programaModificacion
      );

  Future cargarFichaModular({
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
  }) =>
      performCargarFichaModular(
        _database,
        idFichaModular: idFichaModular,
        idFicha: idFicha,
        codigoModular: codigoModular,
        codigoLocal: codigoLocal,
        codigoNivel: codigoNivel,
        nivel: nivel,
        codigoTipoDocente: codigoTipoDocente,
        tipoDocente: tipoDocente,
        codigoTipoSexo: codigoTipoSexo,
        tipoSexo: tipoSexo,
        codigoTurno: codigoTurno,
        turno: turno,
        numeroHombres: numeroHombres,
        numeroMujeres: numeroMujeres,
        numeroAlumnos: numeroAlumnos,
        numeroDocente: numeroDocente,
        numeroSeccion: numeroSeccion,
        estadoAuditoria: estadoAuditoria,
        usuarioCreacionAuditoria: usuarioCreacionAuditoria,
        usuarioModificacionAuditoria: usuarioModificacionAuditoria,
        fechaCreacionAuditoria: fechaCreacionAuditoria,
        fechaModificacionAuditoria: fechaModificacionAuditoria,
        equipoCreacionAuditoria: equipoCreacionAuditoria,
        equipoModificacionAuditoria: equipoModificacionAuditoria,
        programaCreacionAuditoria: programaCreacionAuditoria,
        programaModificacionAuditoria: programaModificacionAuditoria
      );

  Future cargarPlantilla({
    int? idPlantilla,
    String? nombreFicha,
    int? idUnidadTrabajo,
    String? nombreUnidadTrabajo,
  }) =>
      performCargarPlantilla(
        _database,
        idPlantilla: idPlantilla,
        nombreFicha: nombreFicha,
        idUnidadTrabajo: idUnidadTrabajo,
        nombreUnidadTrabajo: nombreUnidadTrabajo,
      );

  Future cargarPlantillaSecciones({
    int? idPlantillaSeccion,
    int? idPlantillaSeccionPadre,
    int? idPlantilla,
    String? descripcion,
    String? modoRepeticion,
  }) =>
      performCargarPlantillaSecciones(
        _database,
        idPlantillaSeccion: idPlantillaSeccion,
        idPlantillaSeccionPadre: idPlantillaSeccionPadre,
        idPlantilla: idPlantilla,
        descripcion: descripcion,
        modoRepeticion: modoRepeticion,
      );

  Future cargarPlantillaOpciones({
    int? idPlantillaOpcion,
    int? idPlantillaSeccion,
    int? idPlantilla,
    int? idPregunta,
    String? descripcion,
    String? clasificacionOpcion,
    int? idTipoOpcion,
    String? tipoOpcion,
    String? matIcon,
  }) =>
      performCargarPlantillaOpciones(
        _database,
        idPlantillaOpcion: idPlantillaOpcion,
        idPlantillaSeccion: idPlantillaSeccion,
        idPlantilla: idPlantilla,
        idPregunta: idPregunta,
        descripcion: descripcion,
        clasificacionOpcion: clasificacionOpcion,
        idTipoOpcion: idTipoOpcion,
        tipoOpcion: tipoOpcion,
        matIcon: matIcon,
      );

  Future cargarPlantillaPregunta({
    int? idPlantillaPregunta,
    int? idPlantillaSeccion,
    int? idPregunta,
    String? descripcionPregunta,
    int? flagMandatorio,
    int? idPlantilla,
  }) =>
      performCargarPlantillaPregunta(
        _database,
        idPlantillaPregunta: idPlantillaPregunta,
        idPlantillaSeccion: idPlantillaSeccion,
        idPregunta: idPregunta,
        descripcionPregunta: descripcionPregunta,
        flagMandatorio: flagMandatorio,
        idPlantilla: idPlantilla,
      );

  Future actualizarFicha({
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
    int? modificadoMovil
  }) =>
      performActualizarFicha(
        _database,
        idFicha: idFicha,
        centroPobladoColegio: centroPobladoColegio,
        direccionColegio: direccionColegio,
        zonaColegio: zonaColegio,
        totalPabellon: totalPabellon,
        totalAulas: totalAulas,
        totalSSHH: totalSSHH,
        dniDirector: dniDirector,
        nombreDirector: nombreDirector,
        correoDirector: correoDirector,
        telefonoDirector: telefonoDirector,
        dniAlterno: dniAlterno,
        nombreAlterno: nombreAlterno,
        correoAlterno: correoAlterno,
        telefonoAlterno: telefonoAlterno,
        //dniInspector : dniInspector,
        //nombreInspector : nombreInspector,
        correoInspector: correoInspector,
        telefonoInspector:telefonoInspector,
        fechaInspeccion:fechaInspeccion,
        horaInspeccion:horaInspeccion,
        tipoInspeccion:tipoInspeccion,
        EquipoModificacionAuditoria: EquipoModificacionAuditoria,
        FechaModificacionAuditoria: FechaModificacionAuditoria,
        modificadoMovil: modificadoMovil,
        UsuarioModificacionAudi: UsuarioModificacionAudi,
        ProgramaModificacionAuditoria: ProgramaModificacionAuditoria
      );


  Future actualizarFichaFirmaUpload({
    int? idFicha,
    String? rutalocal,
    String? nombreArchivo,
    String? extension,
    String? ruta,
    double? peso,
    int? uploadDocumento
  }) =>
      performFirmaUpload(
          _database,
          idFicha: idFicha,
          rutalocal: rutalocal,
          nombreArchivo: nombreArchivo,
          extension: extension,
          ruta: ruta,
          peso: peso,
          uploadDocumento: uploadDocumento
      );

  Future actualizarFichaArchivosUpload({
    int? idFicha,
    String? rutalocal,
    String? nombreArchivo,
    String? extension,
    String? ruta,
    double? peso,
    int? uploadDocumento
  }) =>
      performArchivosUpload(
          _database,
          idFicha: idFicha,
          rutalocal: rutalocal,
          nombreArchivo: nombreArchivo,
          extension: extension,
          ruta: ruta,
          peso: peso,
          uploadDocumento: uploadDocumento
      );

  Future actualizarFichaPreguntaArchivosUpload({
    int? idFicha,
    String? rutalocal,
    String? nombreArchivo,
    String? extension,
    String? ruta,
    double? peso,
    int? uploadDocumento
  }) =>
      performPreguntaArchivosUpload(
          _database,
          idFicha: idFicha,
          rutalocal: rutalocal,
          nombreArchivo: nombreArchivo,
          extension: extension,
          ruta: ruta,
          peso: peso,
          uploadDocumento: uploadDocumento
      );

  Future actualizarFichaAPI({
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
  }) =>
      performActualizarFichaAPI(
          _database,
          idFicha: idFicha,
          idPlantilla: idPlantilla,
          codigoLocalColegio: codigoLocalColegio,
          nombreLocalColegio: nombreLocalColegio,
          departamentloColegio: departamentloColegio,
          provinciaColegio: provinciaColegio,
          distritoColegio: distritoColegio,
          centroPobladoColegio: centroPobladoColegio,
          direccionColegio: direccionColegio,
          zonaColegio: zonaColegio,
          latitud: latitud,
          longitud: longitud,
          totalPabellon: totalPabellon,
          totalAulas: totalAulas,
          totalSSHH: totalSSHH,
          dniInspector : dniInspector,
          nombreInspector : nombreInspector,
          correoInspector: correoInspector,
          telefonoInspector:telefonoInspector,
          fechaInspeccion:fechaInspeccion,
          horaInspeccion:horaInspeccion,
          tipoInspeccion:tipoInspeccion,
          dniDirector: dniDirector,
          nombreDirector: nombreDirector,
          correoDirector: correoDirector,
          telefonoDirector: telefonoDirector,
          dniAlterno: dniAlterno,
          nombreAlterno: nombreAlterno,
          correoAlterno: correoAlterno,
          telefonoAlterno: telefonoAlterno,
          usuarioCreacionAudi: usuarioCreacionAudi,
          usuarioModificacionAudi: usuarioModificacionAudi,
          fechaCreacionAuditoria: fechaCreacionAuditoria,
          fechaModificacionAuditoria: fechaModificacionAuditoria,
          equipoCreacionAuditoria: equipoCreacionAuditoria,
          equipoModificacionAuditoria: equipoModificacionAuditoria,
          programaCreacionAuditoria: programaCreacionAuditoria,
          programaModificacionAuditoria: programaModificacionAuditoria
      );


  Future actualizarFichaMod({
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
  }) =>
      performActualizarFichaMod(
          _database,
          codigoModular:codigoModular,
          numeroHombres:numeroHombres,
          numeroMujeres:numeroMujeres,
          numeroAlumnos:numeroAlumnos,
          numeroDocente:numeroDocente,
          numeroSeccion:numeroSeccion,
          EquipoModificacionAuditoria: EquipoModificacionAuditoria,
          modificadoMovil: modificadoMovil,
          UsuarioModificacionAudi: UsuarioModificacionAudi,
          FechaModificacionAuditoria: FechaModificacionAuditoria,
          ProgramaModificacionAuditoria: ProgramaModificacionAuditoria
      );

  Future actualizarRpta({
    String? rpta,
    int? idficha,
    int? idplantillaopcion,
    int? idplanitllaseccion,
    int? idpregunta,
    String? usuarioModificacion,
    String? fechaModificacion,
    String? equipoModificacion,
    String? programaModificacion,
    int? numero
  }) =>
      performActualizarRpta(
          _database,
        idficha: idficha,
        idplantillaseccion: idplanitllaseccion,
        idplantilla: idplantillaopcion,
        idpregunta: idpregunta,
        rpta: rpta,
        programaModificacion: programaModificacion,
        equipoModificacion: equipoModificacion,
        fechaModificacion: fechaModificacion,
        usuarioModificacion: usuarioModificacion,
        numero: numero
      );

  Future crearRpta({
    String? rpta,
    int? idficha,
    int? idplantillaopcion,
    int? idplanitllaseccion,
    int? idpregunta,
    String? usuarioCreacion,
    String? fechaCreacion,
    String? equipoCreacion,
    String? programaCreacion,
    int? numero,
  }) =>
      performCrearRpta(
          _database,
          idficha: idficha,
          idplantillaseccion: idplanitllaseccion,
          idplantilla: idplantillaopcion,
          idpregunta: idpregunta,
          rpta: rpta,
          usuarioCreacion: usuarioCreacion,
          programaCreacion: programaCreacion,
          equipoCreacion: equipoCreacion,
          fechaCreacion: fechaCreacion,
          numero: numero
      );


  Future cargarFichaRespuesta({
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
  }) =>
      performCargarFichaRespuesta(
        _database,
        idFichaPreguntaRespuesta: idFichaPreguntaRespuesta,
        idFicha: idFicha,
        idPlantillaOpcion: idPlantillaOpcion,
        idPregunta: idPregunta,
        idPlantillaSeccion: idPlantillaSeccion,
        numeroRepeticion: numeroRepeticion,
        respuesta: respuesta,
        estadoAuditoria: estadoAuditoria,
        usuarioCreacionAuditoria: usuarioCreacionAuditoria,
        usuarioModificacionAuditoria: usuarioModificacionAuditoria,
        fechaCreacionAuditoria: fechaCreacionAuditoria,
        fechaModificacionAuditoria: fechaModificacionAuditoria,
        equipoCreacionAuditoria: equipoCreacionAuditoria,
        equipoModificacionAuditoria: equipoModificacionAuditoria,
        programaCreacionAuditoria: programaCreacionAuditoria,
        programaModificacionAuditoria: programaModificacionAuditoria
      );


/// END UPDATE QUERY CALLS

  Future cargarSincronizacion({
    String? Fecha,
    int? Estado,
    String? IP,
    String? Latitud,
    String? Longitud,
    String? Cum,
    String? Usuario
  }) =>
      performCargarSincronizacion(
        _database,
        Fecha: Fecha,
        Estado: Estado,
        IP: IP,
        Latitud: Latitud,
        Longitud: Longitud,
        Cum: Cum,
        Usuario: Usuario
      );


  Future cargarColaSincronizacion({
    String? TipoDato,
    int? Estado,
    int? IdDatoLocal,
    int? IdDatoServer,
    int? IdSincro,
    String? UsuarioCreacionAuditoria,
    String? EquipoCreacionAuditoria,
    String? FechaCreacionAuditoria,
    String? ProgramaCreacionAuditoria
  }) =>
      performColaSincronizacion(
          _database,
          TipoDato: TipoDato,
          Estado: Estado,
          IdDatoLocal: IdDatoLocal,
          IdDatoServer: IdDatoServer,
          IdSincro: IdSincro,
          UsuarioCreacionAuditoria: UsuarioCreacionAuditoria,
          EquipoCreacionAuditoria: EquipoCreacionAuditoria,
          FechaCreacionAuditoria: FechaCreacionAuditoria,
          ProgramaCreacionAuditoria: ProgramaCreacionAuditoria
      );

  Future actualizarInspeccionesApi ({
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
    String? dniInspector
  }) => performActualizarInspeccionApi (
    _database,
    idInspeccion:idInspeccion,
    nombreEvento: nombreEvento,
    idFicha: idFicha,
    idPlantilla: idPlantilla,
    codigoLocalColegio: codigoLocalColegio,
    nombreLocalColegio: nombreLocalColegio,
    departamentoColegio: departamentoColegio,
    provinciaColegio: provinciaColegio,
    distritoColegio: distritoColegio,
    idEstado: idEstado,
    estado: estado,
    usuarioCreacionAuditoria: usuarioCreacionAuditoria,
    usuarioModificacionAuditoria: usuarioModificacionAuditoria,
    fechaCreacionAuditoria: fechaCreacionAuditoria,
    fechaModificacionAuditoria: fechaModificacionAuditoria,
    equipoCreacionAuditoria: equipoCreacionAuditoria,
    equipoModificacionAuditoria: equipoModificacionAuditoria,
    programaCreacionAuditoria: programaCreacionAuditoria,
    programaModificacionAuditoria: programaModificacionAuditoria,
    dniInspector: dniInspector
  );

  Future actualizarInspeccionesEstado ({
    int? idInspeccion,
    String? usuarioModificacionAuditoria,
    String? fechaModificacionAuditoria,
    String? equipoModificacionAuditoria,
    String? programaModificacionAuditoria
  }) => performActualizarInspeccionEstado (
    _database,
    idInspeccion: idInspeccion,
    usuarioModificacionAuditoria: usuarioModificacionAuditoria,
    fechaModificacionAuditoria: fechaModificacionAuditoria,
    equipoModificacionAuditoria: equipoModificacionAuditoria,
    programaModificacionAuditoria: programaModificacionAuditoria
  );

  Future actualizarFinalizarInspeccion ({
    int? idInspeccion,
    String? usuarioModificacionAuditoria,
    String? fechaModificacionAuditoria,
    String? equipoModificacionAuditoria,
    String? programaModificacionAuditoria
  }) => performFinalizarInspeccion (
    _database,
    idInspeccion: idInspeccion,
    usuarioModificacionAuditoria: usuarioModificacionAuditoria,
    fechaModificacionAuditoria: fechaModificacionAuditoria,
    equipoModificacionAuditoria: equipoModificacionAuditoria,
    programaModificacionAuditoria: programaModificacionAuditoria
  );

  Future actualizarestaFichaCola({
    int? idCola,
  }) =>
      performColaSincronizacionCompleto(
          _database,
          IdColaSinc: idCola
      );

  Future actualizarestaFichaCola3({
    int? idCola,
  }) =>
      performColaSincronizacionCompleto3(
          _database,
          IdColaSinc: idCola
      );

  Future<List<ExistFichaForId>> VerificarSiExisteFicha({
    int? IdColaSinc
  }) =>
      performListarFichaExist(
        _database,
        idFicha: IdColaSinc,
      );

  Future<List<ExistFichaModForId>> VerificarSiExisteFichaModulares({
    int? idFichaModular
  }) =>
      performListarFichaModularExist(
        _database,
        idFichaModular: idFichaModular,
      );

  ///PLANTILLAS
  Future<List<ExistPlantillaForId>> VerificarSiExistePlantillas({
    int? IdPlantilla
  }) =>
      performListarPlantillaExist(
        _database,
        idPlantilla: IdPlantilla,
      );

  ///SECCION
  Future<List<ExistSeccionForId>> VerificarSiExisteSeccion({
    int? idPlantillaSeccion
  }) =>
      performListarSeccionExist(
        _database,
        idPlantillaSeccion: idPlantillaSeccion,
      );

  ///OPCIONES
  Future<List<ExistOpcionForId>> VerificarSiExisteOpccion({
    int? idPlantillaOpcion
  }) =>
      performListarOpcionExist(
        _database,
        idPlantillaOpcion: idPlantillaOpcion,
      );

  ///PREGUNTAS
  Future<List<ExistPreguntaForId>> VerificarSiExistePregunta({
    int? idPlantillaPregunta
  }) =>
      performListarPreguntaExist(
        _database,
        idPlantillaPregunta: idPlantillaPregunta,
      );

  ///RESPUESTAS
  Future<List<ExistRespuestaForId>> VerificarSiExisteRespuesta({
    int? idFicha,
    int? idPlantillaOpcion,
    int? idPregunta,
    int? idPlantillaSeccion,
    String? numeroRepeticion,
  }) =>
      performListarRespuestaExist(
        _database,
        idPlantillaSeccion: idPlantillaSeccion,
        idFicha: idFicha,
        idPregunta: idPregunta,
        idPlantillaOpcion:  idPlantillaOpcion,
        numeroRepeticion: numeroRepeticion
      );

  ///FIRMAS
  ///

  Future<List<ExistFirmaForId>> VerificarSiExisteFirma({
    int? idFicha,
    int? idFichaFirmaMovil
  }) =>
      performListarFirmaExist(
          _database,
        idFicha: idFicha,
        idFichaFirmaMovil: idFichaFirmaMovil
      );


  ///FIRMAS RUTA NOT NULL Y MOVIL NULL
  ///

  Future<List<ExistFirmaNullForId>> VerificarSiExisteFirmaNotNUll({
    int? idFicha,
    int? idFichaFirma,
    int? idFichaFirmaMovil
  }) =>
      performListarFirmaExistNull(
          _database,
          idFicha: idFicha,
          idFichaFirma: idFichaFirma,
          idFichaFirmaMovil: idFichaFirmaMovil
      );

  Future<List<ExistArchivoNullForId>> VerificarSiExisteArchivoNotNUll({
    int? idFicha,
    int? idFichaArchivo,
    int? idFichaArchivoMovil
  }) =>
      performListarArchivoExistNull(
          _database,
          idFicha: idFicha,
          idFichaArchivo: idFichaArchivo,
          idFichaArchivoMovil: idFichaArchivoMovil
      );

  Future<List<ExistPreguntaArchivoNullForId>> VerificarSiExistePreguntaArchivoNotNUll({
    int? idFicha,
    int? IdFichaPreguntaArchivo,
    int? IdFichaPreguntaArchivoLocal
  }) =>
      performListarPreguntaArchivoExistNull(
          _database,
          idFicha: idFicha,
          IdFichaPreguntaArchivo: IdFichaPreguntaArchivo,
          IdFichaPreguntaArchivoLocal: IdFichaPreguntaArchivoLocal
      );

  Future<List<ExistPreguntaComentarioNullForId>> VerificarSiExistePreguntaComentarioNotNUll({
    int? idFicha,
    int? idPregunta,
    int? idPlantillaSeccion,
    String? numeroRepeticion,
  }) =>
      performListarPreguntaComentarioExistNull(
          _database,
          idFicha: idFicha,
          idPregunta: idPregunta,
          idPlantillaSeccion: idPlantillaSeccion,
          numeroRepeticion: numeroRepeticion
      );

  Future<List<ExistPreguntaComentarioARCEForId>> VerificarSiExistePreguntaComentarioARCENUll({
    int? idFicha,
    int? idPregunta,
    int? idPlantillaSeccion,
    String? numeroRepeticion,
  }) =>
      performListarPreguntaComentarioARCExistNull(
          _database,
          idFicha: idFicha,
          idPregunta: idPregunta,
          idPlantillaSeccion: idPlantillaSeccion,
          numeroRepeticion: numeroRepeticion
      );

  Future<List<ExistBuscarUsuario>> VerificarSiExisteUser({
    String? usuario
  }) =>
      performListarBuscarUsuario(
          _database,
        usuario: usuario
      );

  Future<List<UltimaSincronizacion>> UltimaSincronizacionUser({
    String? usuario
  }) =>
      performListarBuscarUltimaSincro(
          _database,
          usuario: usuario
      );


  ///INSPECCION
  Future<List<ExistInspeciconForId>> VerificarSiExisteInspeccion({
    int? idInspeccion
  }) =>
      performListarInspeccionExist(
        _database,
        idInspeccion: idInspeccion,
      );


  Future actualizarFichaModAPI({
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
  }) =>
      performActualizarFichaModAPI(
          _database,
          idFichaModular: idFichaModular,
          idFicha: idFicha,
          codigoModular:codigoModular,
          codigoLocal: codigoLocal,
          codigoNivel: codigoNivel,
          nivel: nivel,
          codigoTipoDocente: codigoTipoDocente,
          tipoDocente: tipoDocente,
          codigoTipoSexo: codigoTipoSexo,
          tipoSexo: tipoSexo,
          codigoTurno: codigoTurno,
          turno: turno,
          numeroHombres:numeroHombres,
          numeroMujeres:numeroMujeres,
          numeroAlumnos:numeroAlumnos,
          numeroDocente:numeroDocente,
          numeroSeccion:numeroSeccion,
          estadoAuditoria: estadoAuditoria,
          usuacrioCreacionAudi: usuacrioCreacionAudi,
          usuarioModificacionAudi: usuarioModificacionAudi,
          fechaCrecionAuditoria: fechaCrecionAuditoria,
          fechaModificacionAuditoria: fechaModificacionAuditoria,
          equipoCreacionAuditoria: equipoCreacionAuditoria,
          equipoModificacionAuditoria: equipoModificacionAuditoria,
          programaCreacionAuditoria: programaCreacionAuditoria,
          programaModificacionAuditoria: programaModificacionAuditoria
      );


  ///FICHA API
  ///

  Future actualizarFichaFirmasAPI({
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
  }) =>
      performActualizarFichaFirmasMod(
          _database,
          idFicha: idFicha,
          idFichaFirma: idFichaFirma,
          idFichaFirmaMovil: idFichaFirmaMovil,
          nombres: nombres,
          apellidoPaterno:apellidoPaterno,
          apellidoMaterno:apellidoMaterno,
          nombreArchivo:nombreArchivo,
          extension:extension,
          ruta:ruta,
          peso:peso,
          tipoArchivo:tipoArchivo,
          numDocumento:numDocumento,
          idTipoDocumento:idTipoDocumento,
          idTipoPersona:idTipoPersona,
          estadoAuditoria:estadoAuditoria,
          usuarioCreacionAuditoria:usuarioCreacionAuditoria,
          usuarioModificacionAuditoria:usuarioModificacionAuditoria,
          fechaCreacionAuditoria:fechaCreacionAuditoria,
          fechaModificacionAuditoria:fechaModificacionAuditoria,
          equipoCreacionAuditoria:equipoCreacionAuditoria,
          equipoModificacionAuditoria:equipoModificacionAuditoria,
          programaCreacionAuditoria:programaCreacionAuditoria,
          programaModificacionAuditoria:programaModificacionAuditoria,
          modificacionMovil:modificacionMovil
      );


  Future actualizarFichaArchivosAPI({
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
  }) =>
      performActualizarFichaArchivosMod(
          _database,
          idFicha: idFicha,
          idFichaArchivo: idFichaArchivo,
          idFichaArchivoMovil: idFichaArchivoMovil,
          nombre: nombre,
          extension: extension,
          ruta: ruta,
          peso: peso,
          estadoAuditoria: estadoAuditoria,
          usuarioCreacionAuditoria: usuarioCreacionAuditoria,
          usuarioModificacionAuditoria: usuarioModificacionAuditoria,
          fechaCreacionAuditoria: fechaCreacionAuditoria,
          fechaModificacionAuditoria: fechaModificacionAuditoria,
          equipoCreacionAuditoria: equipoCreacionAuditoria,
          equipoModificacionAuditoria: equipoModificacionAuditoria,
          programaCreacionAuditoria: programaCreacionAuditoria,
          programaModificacionAuditoria: programaModificacionAuditoria,
          modificadoMovil: modificadoMovil
      );



///PLANTILLA API
  Future actualizarPlantillaAPI({
    int? idPlantilla,
    String? nombreFicha,
    int? idUnidadTrabajo,
    String? nombreUnidadTrabajo
  }) =>
      performActualizarPlantillaAPI(
          _database,
        idPlantilla: idPlantilla,
        nombreFicha: nombreFicha,
        idUnidadTrabajo: idUnidadTrabajo,
        nombreUnidadTrabajo: nombreUnidadTrabajo
      );

///PLANTILLA SECCION
///
  Future actualizarSeccionAPI({
    int? idPlantillaSeccion,
    int? idPlantillaSeccionPadre,
    int? idPlantilla,
    String? descripcion,
    String? modoRepeticion
  }) =>
      performActualizarSeccionAPI(
          _database,
        idPlantillaSeccion: idPlantillaSeccion,
        idPlantillaSeccionPadre: idPlantillaSeccionPadre,
        idPlantilla: idPlantilla,
        descripcion: descripcion,
        modoRepeticion: modoRepeticion
      );


  ///PLANTILLA OPCION
  ///
  Future actualizarOpcionAPI({
    int? idPlantillaOpcion,
    int? idPlantillaSeccion,
    int? idPlantilla,
    int? idPregunta,
    String? descripcion,
    String? clasificacionOpcion,
    int? idTipoOpcion,
    String? tipoOpcion,
    String? matIcon
  }) =>
      performActualizarOpcionAPI(
          _database,
          idPlantillaOpcion: idPlantillaOpcion,
          idPlantillaSeccion: idPlantillaSeccion,
          idPlantilla : idPlantilla,
          idPregunta: idPregunta,
          descripcion: descripcion,
          clasificacionOpcion: clasificacionOpcion,
          idTipoOpcion: idTipoOpcion,
          tipoOpcion: tipoOpcion,
          matIcon: matIcon
      );


  ///PLANTILLA PREGUNTA
  ///
  Future actualizarPreguntaAPI({
    int? idPlantillaPregunta,
    int? idPlantillaSeccion,
    int? idPregunta,
    String? descripcionPregunta,
    int? flagMandatorio,
    int? idPlantilla
  }) =>
      performActualizarPreguntaAPI(
          _database,
        idPlantillaPregunta: idPlantillaPregunta,
        idPlantillaSeccion: idPlantillaSeccion,
        idPregunta: idPregunta,
        descripcionPregunta: descripcionPregunta,
        flagMandatorio: flagMandatorio,
        idPlantilla: idPlantilla
      );

  ///PLANTILLA PREGUNTA
  ///
  Future actualizarRespuestaAPI({
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
  }) =>
      performActualizarRespuestaAPI(
          _database,
          idFichaPreguntaRespuesta: idFichaPreguntaRespuesta,
          idFicha: idFicha,
          idPlantillaOpcion: idPlantillaOpcion,
          idPregunta: idPregunta,
          idPlantillaSeccion: idPlantillaSeccion,
          numeroRepeticion: numeroRepeticion,
          respuesta: respuesta,
          estadoAuditoria: estadoAuditoria,
          usuarioCreacionAuditoria: usuarioCreacionAuditoria,
          usuarioModificacionAuditoria: usuarioModificacionAuditoria,
          fechaCreacionAuditoria: fechaCreacionAuditoria,
          fechaModificacionAuditoria: fechaModificacionAuditoria,
          equipoCreacionAuditoria: equipoCreacionAuditoria,
          equipoModificacionAuditoria: equipoModificacionAuditoria,
          programaCreacionAuditoria: programaCreacionAuditoria,
          programaModificacionAuditoria: programaModificacionAuditoria
      );

  Future ActualizarFichaModificacion0({
    int? idFicha
  }) =>
      performActualizarFichaModificacion0(
          _database,
        idFicha: idFicha
      );

  Future ActualizarFichaModularModificacion0({
    int? idFichaModular
  }) =>
      performActualizarFichaModularModificacion0(
          _database,
          idFichaModular: idFichaModular
      );

  Future ActualizarFichaRespuestaModificacion0({
    int? idFichaPreguntaRespuesta
  }) =>
      performActualizarFichaRespuestaModificacion0(
          _database,
          idFichaPreguntaRespuesta: idFichaPreguntaRespuesta
      );


  ///PLANTILLA PREGUNTA
  ///
  Future actualizarSincAPI({
    int? idSincroMovil,
    int? idSincroServer,
    int? inspeccionesCargadasServer,
    int? inspeccionesDescargadasServer,
    int? idEstadoSincronizacion
  }) =>
      performActualizarSincAPI(
          _database,
        idEstadoSincronizacion: idEstadoSincronizacion,
        idSincroMovil: idSincroMovil,
        idSincroServer: idSincroServer,
        inspeccionesDescargadasServer: inspeccionesDescargadasServer
      );

  ///ULTIMA FECHA
  Future<List<FechaAnteriorForId>> UltimaFecha({
    int? idSincro
  }) =>
      performFechaAnteriorForId(
        _database,
        idSincro: idSincro,
      );

  ///ULTIMA FECHA
  Future inspeccion0({
    int? idFicha
  }) =>
      performModificacionInspecicon0(
          _database,
          idFicha: idFicha
      );

  Future inspeccion1({
    int? idFicha,
    String? usuarioModificacionAuditoria,
    String? fechaModificacionAuditoria,
    String? equipoModificacionAuditoria,
    String? programaModificacionAuditoria
  }) =>
      performModificacionInspecicon1(
          _database,
          idFicha: idFicha,
          usuarioModificacionAuditoria: usuarioModificacionAuditoria,
          fechaModificacionAuditoria: fechaModificacionAuditoria,
          equipoModificacionAuditoria: equipoModificacionAuditoria,
          programaModificacionAuditoria: programaModificacionAuditoria
      );

  Future fichamod1({
    int? idFicha
  }) =>
      performModificacionFicha1(
          _database,
          idFicha: idFicha
      );

  Future crearComentario({
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
}) => performCrearComentarioAPI(
    _database,
    idFichaPreguntaComentario: idFichaPreguntaComentario,
    idFicha: idFicha,
    idPregunta: idPregunta,
    idPlantillaSeccion: idPlantillaSeccion,
    observacion: observacion,
    numeroRepeticion: numeroRepeticion,
    estadoAuditoria: estadoAuditoria,
    usuarioCreacionAuditoria: usuarioCreacionAuditoria,
    usuarioModificacionAuditoria: usuarioModificacionAuditoria,
    fechaCreacionAuditoria: fechaCreacionAuditoria,
    fechaModificacionAuditoria: fechaModificacionAuditoria,
    equipoCreacionAuditoria: equipoCreacionAuditoria,
    equipoModificacionAuditoria: equipoModificacionAuditoria,
    programaCreacionAuditoria: programaCreacionAuditoria,
    programaModificacionAuditoria: programaModificacionAuditoria,
    modificadoMovil: modificadoMovil
  );

  Future actualizarComentario({
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
  }) => performActualizarComentario(
      _database,
      idFichaPreguntaComentarioLocal: idFichaPreguntaComentarioLocal,
      idFichaPreguntaComentario: idFichaPreguntaComentario,
      idFicha: idFicha,
      idPregunta: idPregunta,
      idPlantillaSeccion: idPlantillaSeccion,
      observacion: observacion,
      numeroRepeticion: numeroRepeticion,
      estadoAuditoria: estadoAuditoria,
      usuarioModificacionAuditoria: usuarioModificacionAuditoria,
      fechaModificacionAuditoria: fechaModificacionAuditoria,
      equipoModificacionAuditoria: equipoModificacionAuditoria,
      programaModificacionAuditoria: programaModificacionAuditoria,
      modificadoMovil: modificadoMovil
  );

  Future actualizarComentarioAPI({
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
  }) => performActualizarPreguntaComentarioAPI(
      _database,
      idFichaPreguntaComentarioLocal: idFichaPreguntaComentarioLocal,
      idFichaPreguntaComentario: idFichaPreguntaComentario,
      idFicha: idFicha,
      idPregunta: idPregunta,
      idPlantillaSeccion: idPlantillaSeccion,
      observacion: observacion,
      numeroRepeticion: numeroRepeticion,
      estadoAuditoria: estadoAuditoria,
      usuarioCreacionAuditoria: usuarioCreacionAuditoria,
      usuarioModificacionAuditoria: usuarioModificacionAuditoria,
      fechaCreacionAuditoria: fechaCreacionAuditoria,
      fechaModificacionAuditoria: fechaModificacionAuditoria,
      equipoCreacionAuditoria: equipoCreacionAuditoria,
      equipoModificacionAuditoria: equipoModificacionAuditoria,
      programaCreacionAuditoria: programaCreacionAuditoria,
      programaModificacionAuditoria: programaModificacionAuditoria,
      modificadoMovil: modificadoMovil
  );

  Future CrearPreguntaArchivoAPI({
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
  }) => performCrearPreguntaArchivoAPI(
      _database,
      idFichaPreguntaArchivo: idFichaPreguntaArchivo,
      idFicha: idFicha,
      idPlantillaSeccion: idPlantillaSeccion,
      idPregunta: idPregunta,
      nombre: nombre,
      extension: extension,
      ruta: ruta,
      rutaLocal: rutaLocal,
      peso: peso,
      numeroRepeticion: numeroRepeticion,
      estadoAuditoria: estadoAuditoria,
      usuarioCreacionAuditoria: usuarioCreacionAuditoria,
      usuarioModificacionAuditoria: usuarioModificacionAuditoria,
      fechaCreacionAuditoria: fechaCreacionAuditoria,
      fechaModificacionAuditoria: fechaModificacionAuditoria,
      equipoCreacionAuditoria: equipoCreacionAuditoria,
      equipoModificacionAuditoria: equipoModificacionAuditoria,
      programaCreacionAuditoria: programaCreacionAuditoria,
      programaModificacionAuditoria: programaModificacionAuditoria,
      modificadoMovil: modificadoMovil,
      uploadDocumento: uploadDocumento
  );

  Future actualizarPreguntaarchivoAPI({
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
  }) => performActualizarPreguntaArchivoAPI(
      _database,
    idFichaPreguntaArchivo: idFichaPreguntaArchivo,
    idFichaPreguntaArchivoLocal: idFichaPreguntaArchivoLocal,
    idFicha: idFicha,
    idPregunta: idPregunta,
    idPlantillaSeccion: idPlantillaSeccion,
    numeroRepeticion: numeroRepeticion,
    nombre: nombre,
    extension: extension,
    ruta: ruta,
    peso: peso,
    estadoAuditoria: estadoAuditoria,
    usuarioCreacionAuditoria: usuarioCreacionAuditoria,
    usuarioModificacionAuditoria: usuarioModificacionAuditoria,
    fechaCreacionAuditoria: fechaCreacionAuditoria,
    fechaModificacionAuditoria: fechaModificacionAuditoria,
    equipoCreacionAuditoria: equipoCreacionAuditoria,
    modificadoMovil: modificadoMovil,
    uploadDocumento: uploadDocumento,
    equipoModificacionAuditoria: equipoModificacionAuditoria,
    programaCreacionAuditoria: programaCreacionAuditoria,
    programaModificacionAuditoria: programaModificacionAuditoria
  );

  Future createUser({
    String? usuario,
    String? contra,
    String? username,
    String? nombrecompleto,
    String? rol,
    String? ubicacion
  }) =>
      performCrearUsuario(
          _database,
          contra: contra,
          usuario: usuario,
          nombrecompleto: nombrecompleto,
          rol: rol,
          username: username,
          ubicacion: ubicacion
      );

  Future actualizarUser({
    String? usuario,
    String? contra,
    String? username,
    String? nombrecompleto,
    String? rol,
    String? ubicacion
  }) =>
      performActualizarUsuario(
          _database,
          contra: contra,
          usuario: usuario,
          nombrecompleto: nombrecompleto,
          rol: rol,
          username: username,
          ubicacion: username
      );


  Future<List<ListarPersonas>> ListarPersonasDrop() =>
      performListarPersonas(
          _database
      );

  Future<List<ListarZonas>> ListarZonasDrop() =>
      performListarZonas(
          _database
      );
  
}
