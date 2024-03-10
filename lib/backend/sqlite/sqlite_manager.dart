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
        tipoInspeccion:tipoInspeccion
      );


  Future actualizarFichaMod({
    String? codigoModular,
    int? numeroHombres,
    int? numeroMujeres,
    int? numeroAlumnos,
    int? numeroDocente,
    int? numeroSeccion
  }) =>
      performActualizarFichaMod(
          _database,
          codigoModular:codigoModular,
          numeroHombres:numeroHombres,
          numeroMujeres:numeroMujeres,
          numeroAlumnos:numeroAlumnos,
          numeroDocente:numeroDocente,
          numeroSeccion:numeroSeccion
      );

  Future actualizarRpta({
    String? rpta,
    int? idficha,
    int? idplantillaopcion,
    int? idplanitllaseccion,
    int? idpregunta
  }) =>
      performActualizarRpta(
          _database,
        idficha: idficha,
        idplantillaseccion: idplanitllaseccion,
        idplantilla: idplantillaopcion,
        idpregunta: idpregunta,
        rpta: rpta
      );

  Future crearRpta({
    String? rpta,
    int? idficha,
    int? idplantillaopcion,
    int? idplanitllaseccion,
    int? idpregunta
  }) =>
      performCrearRpta(
          _database,
          idficha: idficha,
          idplantillaseccion: idplanitllaseccion,
          idplantilla: idplantillaopcion,
          idpregunta: idpregunta,
          rpta: rpta,
      );


  Future cargarFichaRespuesta({
    int? idFichaPreguntaRespuesta,
    int? idFicha,
    int? idPlantillaOpcion,
    int? idPregunta,
    int? idPlantillaSeccion,
    String? numeroRepeticion,
    String? respuesta,
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
      );


/// END UPDATE QUERY CALLS



}
