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

  Future<List<ListarFotosRow>> listarFotos() => performListarFotos(
        _database,
      );

  Future<List<ListarFirmasRow>> listarFirmas() => performListarFirmas(
        _database,
      );

  Future<List<ListarInspeccionesRow>> listarInspecciones() =>
      performListarInspecciones(
        _database,
      );

  Future<List<ListarInspeccionesProcessRow>> listarInspeccionesProcess() =>
      performListarInspeccionesProcess(
        _database,
      );

  Future<List<ListarInspeccionesRealizadaRow>> listarInspeccionesRealizada() =>
      performListarInspeccionesRealizada(
        _database,
      );

  Future<List<ListarInspeccionesProgramadaRow>>
      listarInspeccionesProgramada() => performListarInspeccionesProgramada(
            _database,
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
  listarFichasModularesPorModificad() =>
      performListarFichasModularesPorModificado(
        _database
      );

  Future<List<ListarFichasModificacion>>
  listarFichasModificas() =>
      performListarFichaMod(
          _database
      );

  Future<List<FichaPreguntaRespuestas>>
  listarRespuestasModificas() =>
      performListarFichaPreguntaRespuestas(
          _database
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

  Future<List<ListarPreguntasRow>> listarPreguntas({
    int? idPlantillaSeccion,
    int? idPlantilla,
  }) =>
      performListarPreguntas(
        _database,
        idPlantillaSeccion: idPlantillaSeccion,
        idPlantilla: idPlantilla,
      );

  Future<List<ListarOpcionesRow>> listarOpciones({
    int? idPlantilla,
    int? idPregunta,
    int? idPlantillaSeccion,
    int? idFicha
  }) =>
      performListarOpciones(
        _database,
        idPlantilla: idPlantilla,
        idPregunta: idPregunta,
        idPlantillaSeccion: idPlantillaSeccion,
        idFicha: idFicha
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

  Future deleteFirma({
    int? id,
  }) =>
      performDeleteFirma(
        _database,
        id: id,
      );

  Future deleteFoto({
    int? idFoto,
  }) =>
      performDeleteFoto(
        _database,
        idFoto: idFoto,
      );

  Future cargarData({
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
    String? dniInspector,
    String? nombreInspector,
    String? correoInspector,
    String? telefonoInspector,
    String? fechaInspeccion,
    String? horaInspeccion,
    String? tipoInspeccion,
    String? UsuarioModificacionAudi,
    String? FechaModificacionAuditoria,
    String? EquipoModificacionAuditoria,
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
        dniInspector : dniInspector,
        nombreInspector : nombreInspector,
        correoInspector: correoInspector,
        telefonoInspector:telefonoInspector,
        fechaInspeccion:fechaInspeccion,
        horaInspeccion:horaInspeccion,
        tipoInspeccion:tipoInspeccion,
        EquipoModificacionAuditoria: EquipoModificacionAuditoria,
        FechaModificacionAuditoria: FechaModificacionAuditoria,
        modificadoMovil: modificadoMovil,
        UsuarioModificacionAudi: UsuarioModificacionAudi
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
          FechaModificacionAuditoria: FechaModificacionAuditoria
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
    String? programaModificacion
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
        usuarioModificacion: usuarioModificacion
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
          fechaCreacion: fechaCreacion
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
    int? IdSincro
  }) =>
      performColaSincronizacion(
          _database,
          TipoDato: TipoDato,
          Estado: Estado,
          IdDatoLocal: IdDatoLocal,
          IdDatoServer: IdDatoServer,
          IdSincro: IdSincro
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
    String? estado
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
    estado: estado
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
    int? idFichaPreguntaRespuesta
  }) =>
      performListarRespuestaExist(
        _database,
        idFichaPreguntaRespuesta: idFichaPreguntaRespuesta,
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
}
