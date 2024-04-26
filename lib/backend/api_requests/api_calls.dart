import 'dart:convert';
import 'dart:ffi';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class APIDatosCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'API Datos',
      apiUrl: 'https://jsonplaceholder.typicode.com/todos/1',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static int? userId(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.userId''',
      ));
  static int? id(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.id''',
      ));
  static String? nombre(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.title''',
      ));
  static dynamic datos(dynamic response) => getJsonField(
        response,
        r'''$.datos''',
      );
}

class APIRENIEC {
  static Future<ApiCallResponse> call({
    String? dni = '',
}) async {
    final ffApiRequestBody = '''
{
  "dato": {
    "tipodocumento": 0,
    "numerodocumento": "$dni",
    "appid": "SISMON"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'API Reniec',
      //apiUrl: 'https://calidad.ngrok.io/maestroback/api/persona/v1/consulta-tipo-documento',
      apiUrl: 'https://calidad.pronied.gob.pe/maestroback/api/persona/v1/consulta-tipo-documento',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? mensaje(dynamic response) => castToType<String>(getJsonField(
    response,
    r'''$.mensaje''',
  ));
  static String? tipodocumento(dynamic response) => castToType<String>(getJsonField(
    response,
    r'''$.dato.tipodocumento''',
  ));
  static String? numerodocumento(dynamic response) => castToType<String>(getJsonField(
    response,
    r'''$.dato.numerodocumento''',
  ));
  static String? nombres(dynamic response) => castToType<String>(getJsonField(
    response,
    r'''$.dato.nombres''',
  ));
  static String? apellidopaterno(dynamic response) => castToType<String>(getJsonField(
    response,
    r'''$.dato.apellidopaterno''',
  ));
  static String? apellidomaterno(dynamic response) => castToType<String>(getJsonField(
    response,
    r'''$.dato.apellidomaterno''',
  ));
  static int? estado(dynamic response) => castToType<int>(getJsonField(
    response,
    r'''$.estado''',
  ));
}

class UploaddocCall {
  static Future<ApiCallResponse> call({
    FFUploadedFile? archivos,
    String? tag = '',
    String? codigoapp = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'uploaddoc',
      apiUrl: 'https://cargaarchivos.ngrok.io/segedo/api/genimagen/uploaddocumentos',
      //apiUrl: 'https://calidad.pronied.gob.pe/segedo/api/genimagen/uploaddocumentos',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'archivos': archivos,
        'tag': tag,
        'codigoapp': codigoapp,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
  static int? id(dynamic response) => castToType<int>(getJsonField(
    response,
    '\$.[0].id',
  ));
  static String? url(dynamic response) => castToType<String>(getJsonField(
    response,
    '\$[0].url',
  ));
  static String? nombrearchivo(dynamic response) => castToType<String>(getJsonField(
    response,
    '\$[0].nombrearchivo',
  ));
  static String? extension(dynamic response) => castToType<String>(getJsonField(
    response,
    '\$[0].extension',
  ));
  static String? tamano(dynamic response) => castToType<String>(getJsonField(
    response,
    '\$[0].tamano',
  ));
  static String? tag(dynamic response) => castToType<String>(getJsonField(
    response,
    '\$[0].tag',
  ));
  static bool? estado(dynamic response) => castToType<bool>(getJsonField(
    response,
    '\$[0].estado',
  ));
  static String? mensaje(dynamic response) => castToType<String>(getJsonField(
    response,
    '\$[0].mensaje',
  ));
}

class ApiProniedCall {
  static Future<ApiCallResponse> call({
    dynamic? corcheJson,
    String? token
  }) async {
    final corche = _serializeJson(corcheJson);
    final ffApiRequestBody = '''
${corche}''';
    return ApiManager.instance.makeApiCall(
      callName: 'API PRONIED',
      apiUrl:
      //'https://calidad.pronied.gob.pe/monitoreoback/api/sincronizacion/sincronizar',
      'https://inspeccionesback.ngrok.io/monitoreoback/api/sincronizacion/sincronizar',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? listName(dynamic response) => getJsonField(
    response,
    r'''$.dato.inspecciones''',
    true,
  ) as List?;
  static int? idInspeccion(dynamic response, int index) => castToType<int>(getJsonField(
    response,
    '\$.dato.inspecciones[$index].idInspeccion',
  ));
  static String? nombreInspeccion(dynamic response, int index) => castToType<String>(getJsonField(
    response,
    '\$.dato.inspecciones[$index].nombreEvento',
  ));
  static String? dniInspeccion(dynamic response, int index) => castToType<String>(getJsonField(
    response,
    '\$.dato.inspecciones[$index].dniInspector',
  ));
  static int? idFichaIns(dynamic response, int index) => castToType<int>(getJsonField(
    response,
    '\$.dato.inspecciones[$index].idFicha',
  ));
  static int? idPlantillaId(dynamic response, int index) => castToType<int>(getJsonField(
    response,
    '\$.dato.inspecciones[$index].idPlantilla',
  ));
  static String? codigoLocalIns(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.inspecciones[$index].codigoLocalColegio',
      ));
  static String? nombreLocalIns(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.inspecciones[$index].nombreLocalColegio',
      ));
  static String? departamentoInst(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.inspecciones[$index].departamentoColegio',
      ));
  static String? provinciaIns(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.inspecciones[$index].provinciaColegio',
      ));
  static String? destritoIns(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.inspecciones[$index].distritoColegio',
      ));
  static int? idEstadoIns(dynamic response, int index) => castToType<int>(getJsonField(
    response,
    '\$.dato.inspecciones[$index].idEstado',
  ));
  static String? estadoIns(dynamic response, int index) => castToType<String>(getJsonField(
    response,
    '\$.dato.inspecciones[$index].estado',
  ));
  static String? usuarioCreacionAuditoriains(dynamic response, int index) => castToType<String>(getJsonField(
    response,
    '\$.dato.inspecciones[$index].usuarioCreacionAuditoria',
  ));
  static String? usuarioModificacionAuditoriains(dynamic response, int index) => castToType<String>(getJsonField(
    response,
    '\$.dato.inspecciones[$index].usuarioModificacionAuditoria',
  ));
  static String? fechaCreacionAuditoriains(dynamic response, int index) => castToType<String>(getJsonField(
    response,
    '\$.dato.inspecciones[$index].fechaCreacionAuditoria',
  ));
  static String? fechaModificacionAuditoriains(dynamic response, int index) => castToType<String>(getJsonField(
    response,
    '\$.dato.inspecciones[$index].fechaModificacionAuditoria',
  ));
  static String? equipoCreacionAuditoriains(dynamic response, int index) => castToType<String>(getJsonField(
    response,
    '\$.dato.inspecciones[$index].equipoCreacionAuditoria',
  ));
  static String? equipoModificacionAuditoriains(dynamic response, int index) => castToType<String>(getJsonField(
    response,
    '\$.dato.inspecciones[$index].equipoModificacionAuditoria',
  ));
  static String? programaCreacionAuditoriains(dynamic response, int index) => castToType<String>(getJsonField(
    response,
    '\$.dato.inspecciones[$index].programaCreacionAuditoria',
  ));
  static String? programaModificacionAuditoriains(dynamic response, int index) => castToType<String>(getJsonField(
    response,
    '\$.dato.inspecciones[$index].programaModificacionAuditoria',
  ));



  static List? fichas(dynamic response) => getJsonField(
    response,
    r'''$.dato.fichas''',
    true,
  ) as List?;
  static int? idFicha(dynamic response, int index) => castToType<int>(getJsonField(
    response,
    '\$.dato.fichas[$index].idFicha',
  ));
  static int? idPlantilla(dynamic response, int index) => castToType<int>(getJsonField(
    response,
    '\$.dato.fichas[$index].idPlantilla',
  ));
  static String? fichaCodigoLocal(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichas[$index].codigoLocalColegio',
      ));
  static String? fichaNombreLocal(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichas[$index].nombreLocalColegio',
      ));
  static String? fichaDepartamento(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichas[$index].departamentoColegio',
      ));
  static String? fichaProvincia(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichas[$index].provinciaColegio',
      ));
  static String? fichaDistrito(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichas[$index].distritoColegio',
      ));
  static String? fichaCentroPoblado(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichas[$index].centroPobladoColegio',
      ));
  static String? fichaDireccion(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichas[$index].direccionColegio',
      ));
  static dynamic fichaZona(dynamic response, int index) => getJsonField(
    response,
    '\$.dato.fichas[$index].zonaColegio',
  );
  static double? fichaLatitud(dynamic response, int index) =>
      castToType<double>(getJsonField(
        response,
        '\$.dato.fichas[$index].latitud',
      ));
  static double? fichaLongitud(dynamic response, int index) =>
      castToType<double>(getJsonField(
        response,
        '\$.dato.fichas[$index].longitud',
      ));
  static dynamic fichaPabellon(dynamic response, int index) => getJsonField(
    response,
    '\$.dato.fichas[$index].totalPabellon',
  );
  static dynamic fichaAulas(dynamic response, int index) => getJsonField(
    response,
    '\$.dato.fichas[$index].totalAulas',
  );
  static dynamic fichaSSHH(dynamic response, int index) => getJsonField(
    response,
    '\$.dato.fichas[$index].totalSSHH',
  );
  static int? fichaIdEstado(dynamic response, int index) => castToType<int>(getJsonField(
    response,
    '\$.dato.fichas[$index].idEstado',
  ));
  static String? fichaEstado(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichas[$index].estado',
      ));
  static String? fichaDniInspector(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichas[$index].dniInspector',
      ));
  static String? fichaNombreInspector(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichas[$index].nombreInspector',
      ));
  static dynamic fichaCorreoInspector(dynamic response, int index) => getJsonField(
    response,
    '\$.dato.fichas[$index].correoInspector',
  );
  static dynamic fichaTelefonoIns(dynamic response, int index) => getJsonField(
    response,
    '\$.dato.fichas[$index].telefonoInspector',
  );
  static dynamic fichaFechaInspeccion(dynamic response, int index) => getJsonField(
    response,
    '\$.dato.fichas[$index].fechaInspeccion',
  );
  static dynamic fichaHoraInspeccion(dynamic response, int index) => getJsonField(
    response,
    '\$.dato.fichas[$index].horaInspeccion',
  );
  static dynamic fichaTipoInspeccion(dynamic response, int index) => getJsonField(
    response,
    '\$.dato.fichas[$index].tipoInspeccion',
  );
  static String? fichaDniDirector(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichas[$index].dniDirector',
      ));
  static String? fichaNombreDirector(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichas[$index].nombreDirector',
      ));
  static dynamic fichaCorreoDirector(dynamic response, int index) => getJsonField(
    response,
    '\$.dato.fichas[$index].correoDirector',
  );
  static dynamic fichaTelefonoDirector(dynamic response, int index) => getJsonField(
    response,
    '\$.dato.fichas[$index].telefonoDirector',
  );
  static dynamic fichaDniAlterno(dynamic response, int index) => getJsonField(
    response,
    '\$.dato.fichas[$index].dniAlterno',
  );
  static dynamic fichaNombreAlterno(dynamic response, int index) => getJsonField(
    response,
    '\$.dato.fichas[$index].nombreAlterno',
  );
  static dynamic fichaCorreoAlterno(dynamic response, int index) => getJsonField(
    response,
    '\$.dato.fichas[$index].correoAlterno',
  );
  static dynamic fichaTelefonoAlterno(dynamic response, int index) => getJsonField(
    response,
    '\$.dato.fichas[$index].telefonoAlterno',
  );
  static String? fichausuariocreacion(dynamic response, int index) => getJsonField(
    response,
    '\$.dato.fichas[$index].usuarioCreacionAuditoria',
  );
  static String? fichausuariomodificacion(dynamic response, int index) => getJsonField(
    response,
    '\$.dato.fichas[$index].usuarioModificacionAuditoria',
  );
  static String? fichaFecha(dynamic response, int index) => getJsonField(
    response,
    '\$.dato.fichas[$index].fechaCreacionAuditoria',
  );
  static String? fichaFechaModificacion(dynamic response, int index) => getJsonField(
    response,
    '\$.dato.fichas[$index].fechaModificacionAuditoria',
  );
  static String? fichaEquipoCreacion(dynamic response, int index) => getJsonField(
    response,
    '\$.dato.fichas[$index].equipoCreacionAuditoria',
  );
  static String? fichaEquipoModificacionAuditoria(dynamic response, int index) => getJsonField(
    response,
    '\$.dato.fichas[$index].equipoModificacionAuditoria',
  );
  static String? fichaprogramaCreacionAuditoria(dynamic response, int index) => getJsonField(
    response,
    '\$.dato.fichas[$index].programaCreacionAuditoria',
  );
  static String? fichaprogramaModificacionAuditoria(dynamic response, int index) => getJsonField(
    response,
    '\$.dato.fichas[$index].programaModificacionAuditoria',
  );


  static dynamic fichaArchivos(dynamic response) => getJsonField(
    response,
    r'''$.dato.fichasArchivos''',
  );



  static List? fichaModular(dynamic response) => getJsonField(
    response,
    r'''$.dato.fichasModulares''',
    true,
  ) as List?;
  static int? idFichaModular(dynamic response, int index) => getJsonField(
    response,
    '\$.dato.fichasModulares[$index].idFichaModular',
  );

  static int? idFichaModularFicha(dynamic response, int index) => getJsonField(
    response,
    '\$.dato.fichasModulares[$index].idFicha',
  );

  static String? codigoModular(dynamic response, int index) => getJsonField(
    response,
    '\$.dato.fichasModulares[$index].codigoModular',
  );

  static String? codigoLocalModular(dynamic response, int index) => getJsonField(
    response,
    '\$.dato.fichasModulares[$index].codigoLocal',
  );

  static String? codigoNivelModular(dynamic response, int index) => getJsonField(
    response,
    '\$.dato.fichasModulares[$index].codigoNivel',
  );

  static String? nivelModular(dynamic response, int index) => getJsonField(
    response,
    '\$.dato.fichasModulares[$index].nivel',
  );

  static String? codigoTipoDocenteMod(dynamic response, int index) => getJsonField(
    response,
    '\$.dato.fichasModulares[$index].codigoTipoDocente',
  );

  static String? tipoDocenteMod(dynamic response, int index) => getJsonField(
    response,
    '\$.dato.fichasModulares[$index].tipoDocente',
  );

  static String? tipoSexcionMod(dynamic response, int index) => getJsonField(
    response,
    '\$.dato.fichasModulares[$index].codigoTipoSexo',
  );

  static String? tipoSexoMod(dynamic response, int index) => getJsonField(
    response,
    '\$.dato.fichasModulares[$index].tipoSexo',
  );

  static String? codigoTurnoMod(dynamic response, int index) => getJsonField(
    response,
    '\$.dato.fichasModulares[$index].codigoTurno',
  );

  static String? turnoMod(dynamic response, int index) => getJsonField(
    response,
    '\$.dato.fichasModulares[$index].turno',
  );

  static int? numeroHombreMod(dynamic response, int index) => getJsonField(
    response,
    '\$.dato.fichasModulares[$index].numeroHombres',
  );

  static int? numeroMujeresMod(dynamic response, int index) => getJsonField(
    response,
    '\$.dato.fichasModulares[$index].numeroMujeres',
  );

  static int? numeroAlumnoMod(dynamic response, int index) => getJsonField(
    response,
    '\$.dato.fichasModulares[$index].numeroAlumnos',
  );

  static int? numeroDocenteMod(dynamic response, int index) => getJsonField(
    response,
    '\$.dato.fichasModulares[$index].numeroDocente',
  );
  static int? numeroSeccinMod(dynamic response, int index) => getJsonField(
    response,
    '\$.dato.fichasModulares[$index].numeroSeccion',
  );
  static String? estadoAuditoriaModular(dynamic response, int index) => getJsonField(
    response,
    '\$.dato.fichasModulares[$index].estadoAuditoria',
  );
  static String? usuarioCreacionAuditoriaModular(dynamic response, int index) => getJsonField(
    response,
    '\$.dato.fichasModulares[$index].usuarioCreacionAuditoria',
  );
  static String? usuarioModificacionAuditoriaModular(dynamic response, int index) => getJsonField(
    response,
    '\$.dato.fichasModulares[$index].usuarioModificacionAuditoria',
  );
  static String? fichaFechaModular(dynamic response, int index) => getJsonField(
    response,
    '\$.dato.fichasModulares[$index].fechaCreacionAuditoria',
  );
  static String? fichaFechaModificacionModular(dynamic response, int index) => getJsonField(
    response,
    '\$.dato.fichasModulares[$index].fechaModificacionAuditoria',
  );
  static String? equipoCreacionAuditoriaModular(dynamic response, int index) => getJsonField(
    response,
    '\$.dato.fichasModulares[$index].equipoCreacionAuditoria',
  );
  static String? equipoModificacionAuditoriaModular(dynamic response, int index) => getJsonField(
    response,
    '\$.dato.fichasModulares[$index].equipoModificacionAuditoria',
  );
  static String? programaCreacionAuditoriaModular(dynamic response, int index) => getJsonField(
    response,
    '\$.dato.fichasModulares[$index].programaCreacionAuditoria',
  );
  static String? programaModificacionAuditoriaModular(dynamic response, int index) => getJsonField(
    response,
    '\$.dato.fichasModulares[$index].programaModificacionAuditoria',
  );



  static List? plantillas(dynamic response) => getJsonField(
        response,
        r'''$.dato.plantillas''',
        true,
      ) as List?;
  static int? idPlantillas(dynamic response, int index) => castToType<int>(getJsonField(
        response,
        '\$.dato.plantillas[$index].idPlantilla',
      ));
  static String? nombreFichaPla(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.plantillas[$index].nombreFicha',
      ));
  static int? idUnidadTrabajoPla(dynamic response, int index) =>
      castToType<int>(getJsonField(
        response,
        '\$.dato.plantillas[$index].idUnidadTrabajo',
      ));
  static String? nomUnidadTrabajoPla(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.plantillas[$index].nombreUnidadTrabajo',
      ));


  static List? secciones(dynamic response) => getJsonField(
        response,
        r'''$.dato.plantillasSecciones''',
        true,
      ) as List?;
  static int? idPLantillaSecc(dynamic response, int index) => castToType<int>(getJsonField(
        response,
        '\$.dato.plantillasSecciones[$index].idPlantillaSeccion',
      ));
  static dynamic idPlantillaSeccPa(dynamic response, int index) => getJsonField(
        response,
        '\$.dato.plantillasSecciones[$index].idPlantillaSeccionPadre',
      );
  static int? idePlantillaSec(dynamic response, int index) => castToType<int>(getJsonField(
        response,
        '\$.dato.plantillasSecciones[$index].idPlantilla',
      ));
  static String? descripcionSec(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.plantillasSecciones[$index].descripcion',
      ));
  static String? modoRepeticionSec(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.plantillasSecciones[$index].modoRepeticion',
      ));


  static List? opciones(dynamic response) => getJsonField(
        response,
        r'''$.dato.plantillasOpciones''',
        true,
      ) as List?;
  static int? idPlantillaOpciones(dynamic response, int index) =>
      castToType<int>(getJsonField(
        response,
        '\$.dato.plantillasOpciones[$index].idPlantillaOpcion',
      ));
  static int? idPlantillaSeccOP(dynamic response, int index) =>
      castToType<int>(getJsonField(
        response,
        '\$.dato.plantillasOpciones[$index].idPlantillaSeccion',
      ));
  static int? idPlantillaOP(dynamic response, int index) => castToType<int>(getJsonField(
        response,
        '\$.dato.plantillasOpciones[$index].idPlantilla',
      ));
  static int? idPreguntaOP(dynamic response, int index) => castToType<int>(getJsonField(
        response,
        '\$.dato.plantillasOpciones[$index].idPregunta',
      ));
  static String? descriopcionOP(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.plantillasOpciones[$index].descripcion',
      ));
  static String? clasificacionOP(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.plantillasOpciones[$index].clasificacionOpcion',
      ));
  static int? idTipoOpcion(dynamic response, int index) => castToType<int>(getJsonField(
        response,
        '\$.dato.plantillasOpciones[$index].idTipoOpcion',
      ));
  static String? tipoOpcionOP(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.plantillasOpciones[$index].tipoOpcion',
      ));
  static String? matIconOP(dynamic response, int index) => castToType<String>(getJsonField(
        response,
        '\$.dato.plantillasOpciones[$index].matIcon',
      ));




  static List? preguntasPre(dynamic response) => getJsonField(
        response,
        r'''$.dato.plantillasPreguntas''',
        true,
      ) as List?;
  static int? idPlantillaPregunta(dynamic response, int index) =>
      castToType<int>(getJsonField(
        response,
        '\$.dato.plantillasPreguntas[$index].idPlantillaPregunta',
      ));
  static int? idPlantillaSecPres(dynamic response, int index) =>
      castToType<int>(getJsonField(
        response,
        '\$.dato.plantillasPreguntas[$index].idPlantillaSeccion',
      ));
  static int? idPlantillaPres(dynamic response, int index) => castToType<int>(getJsonField(
        response,
        '\$.dato.plantillasPreguntas[$index].idPlantilla',
      ));
  static int? flagMandatorioPres(dynamic response, int index) =>
      castToType<int>(getJsonField(
        response,
        '\$.dato.plantillasPreguntas[$index].flagMandatorio',
      ));
  static String? descripciondePres(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.plantillasPreguntas[$index].descripcionPregunta',
      ));
  static int? idPreguntaPres(dynamic response, int index) => castToType<int>(getJsonField(
        response,
        '\$.dato.plantillasPreguntas[$index].idPregunta',
      ));



  static List? fichasPreguntasRespuestas(dynamic response) => getJsonField(
    response,
    r'''$.dato.fichasPreguntasRespuestas''',
    true,
  ) as List?;
  static int? idFichaPreguntaRespuestaRpta(dynamic response, int index) =>
      castToType<int>(getJsonField(
        response,
        '\$.dato.fichasPreguntasRespuestas[$index].idFichaPreguntaRespuesta',
      ));
  static int? idFichaRpta(dynamic response, int index) => castToType<int>(getJsonField(
    response,
        '\$.dato.fichasPreguntasRespuestas[$index].idFicha',
  ));
  static int? idPlantillaOpcionRpta(dynamic response, int index) =>
      castToType<int>(getJsonField(
        response,
        '\$.dato.fichasPreguntasRespuestas[$index].idPlantillaOpcion',
      ));
  static int? idPreguntaRpta(dynamic response, int index) => castToType<int>(getJsonField(
    response,
        '\$.dato.fichasPreguntasRespuestas[$index].idPregunta',
  ));
  static int? idPlantillaSeccionRpta(dynamic response, int index) =>
      castToType<int>(getJsonField(
        response,
        '\$.dato.fichasPreguntasRespuestas[$index].idPlantillaSeccion',
      ));
  static String? numeroRepeticionRpta(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasPreguntasRespuestas[$index].numeroRepeticion',
      ));
  static String? respuestaRpta(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasPreguntasRespuestas[$index].respuesta',
      ));
  static String? estadoAuditoriaRpta(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasPreguntasRespuestas[$index].estadoAuditoria',
      ));
  static String? usuarioCreacionAuditoriaRpta(dynamic response, int index) =>
      castToType<String>(getJsonField(
      response,
      '\$.dato.fichasPreguntasRespuestas[$index].usuarioCreacionAuditoria',
    ));
  static String? usuarioModificacionAuditoriaRpta(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasPreguntasRespuestas[$index].usuarioModificacionAuditoria',
      ));
  static String? fechaCreacionAuditoriaRpta(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasPreguntasRespuestas[$index].fechaCreacionAuditoria',
      ));
  static String? equipoCreacionAuditoriaRpta(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasPreguntasRespuestas[$index].equipoCreacionAuditoria',
  ));
  static String? equipoModificacionAuditoriaRpta(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasPreguntasRespuestas[$index].equipoModificacionAuditoria',
      ));
  static String? programaCreacionAuditoriaRpta(dynamic response, int index) =>
    castToType<String>(getJsonField(
      response,
      '\$.dato.fichasPreguntasRespuestas[$index].programaCreacionAuditoria',
  ));
  static String? fechaModificacionAuditoriaRpta(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasPreguntasRespuestas[$index].fechaModificacionAuditoria',
      ));
  static String? programaModificacionAuditoriaRpta(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasPreguntasRespuestas[$index].programaModificacionAuditoria',
      ));


  ///FICHAFIRMAS
  ///

  static List? fichasFirmas(dynamic response) => getJsonField(
    response,
    r'''$.dato.fichasFirmas''',
    true,
  ) as List?;
  static int? idFichaFirma(dynamic response, int index) =>
      castToType<int>(getJsonField(
        response,
        '\$.dato.fichasFirmas[$index].idFichaFirma',
      ));
  static int? idFichaFirmaMovil(dynamic response, int index) => castToType<int>(getJsonField(
    response,
    '\$.dato.fichasFirmas[$index].idFichaFirmaMovil',
  ));
  static int? idFichaFirmasfir(dynamic response, int index) =>
      castToType<int>(getJsonField(
        response,
        '\$.dato.fichasFirmas[$index].idFicha',
      ));
  static String? nombresfir(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasFirmas[$index].nombres',
      ));
  static String? apellidoPaternofir(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasFirmas[$index].apellidoPaterno',
      ));
  static String? apellidoMaternofir(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasFirmas[$index].apellidoMaterno',
      ));
  static String? nombreArchivofir(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasFirmas[$index].nombreArchivo',
      ));
  static String? extensionfir(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasFirmas[$index].extension',
      ));
  static String? rutafir(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasFirmas[$index].ruta',
      ));
  static double? pesofir(dynamic response, int index) =>
      castToType<double>(getJsonField(
        response,
        '\$.dato.fichasFirmas[$index].peso',
      ));
  static String? tipoArchivofir(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasFirmas[$index].tipoArchivo',
      ));
  static String? numDocumentofir(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasFirmas[$index].numDocumento',
      ));
  static int? idTipoDocumentofir(dynamic response, int index) =>
      castToType<int>(getJsonField(
        response,
        '\$.dato.fichasFirmas[$index].idTipoDocumento',
      ));
  static int? idTipoPersonafir(dynamic response, int index) =>
      castToType<int>(getJsonField(
        response,
        '\$.dato.fichasFirmas[$index].idTipoPersona',
      ));
  static String? estadoAuditoriafir(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasFirmas[$index].estadoAuditoria',
      ));
  static String? usuarioCreacionAuditoriafir(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasFirmas[$index].usuarioCreacionAuditoria',
      ));
  static String? usuarioModificacionAuditoriafir(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasFirmas[$index].usuarioModificacionAuditoria',
      ));
  static String? fechaCreacionAuditoriafir(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasFirmas[$index].fechaCreacionAuditoria',
      ));
  static String? fechaModificacionAuditoriafir(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasFirmas[$index].fechaModificacionAuditoria',
      ));
  static String? equipoCreacionAuditoriafir(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasFirmas[$index].equipoCreacionAuditoria',
      ));
  static String? equipoModificacionAuditoriafir(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasFirmas[$index].equipoModificacionAuditoria',
      ));
  static String? programaCreacionAuditoriafir(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasFirmas[$index].programaCreacionAuditoria',
      ));
  static String? programaModificacionAuditoriafir(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasFirmas[$index].programaModificacionAuditoria',
      ));
///FICHA ARCHIVOS

  static List? fichasArchivos(dynamic response) => getJsonField(
    response,
    r'''$.dato.fichasArchivos''',
    true,
  ) as List?;
  static int? idFichaArchivoArc(dynamic response, int index) =>
      castToType<int>(getJsonField(
        response,
        '\$.dato.fichasArchivos[$index].idFichaArchivo',
      ));
  static int? idFichaArchivoMovilArc(dynamic response, int index) => castToType<int>(getJsonField(
    response,
    '\$.dato.fichasArchivos[$index].idFichaArchivoMovil',
  ));
  static int? idFichaArc(dynamic response, int index) =>
      castToType<int>(getJsonField(
        response,
        '\$.dato.fichasArchivos[$index].idFicha',
      ));
  static String? nombreArc(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasArchivos[$index].nombre',
      ));
  static String? extensionarc(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasArchivos[$index].extension',
      ));
  static String? rutaarc(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasArchivos[$index].ruta',
      ));
  static String? pesoarc(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasArchivos[$index].peso',
      ));
  static String? tituloarc(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasArchivos[$index].titulo',
      ));
  static String? comentarioarc(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasArchivos[$index].comentario',
      ));
  static String? estadoAuditoriaarc(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasArchivos[$index].estadoAuditoria',
      ));
  static String? usuarioCreacionAuditoriaarc(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasArchivos[$index].usuarioCreacionAuditoria',
      ));
  static String? usuarioModificacionAuditoriaarc(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasArchivos[$index].usuarioModificacionAuditoria',
      ));
  static String? fechaCreacionAuditoriaarc(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasArchivos[$index].fechaCreacionAuditoria',
      ));
  static String? fechaModificacionAuditoriaarc(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasArchivos[$index].fechaModificacionAuditoria',
      ));
  static String? equipoCreacionAuditoriaarc(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasArchivos[$index].equipoCreacionAuditoria',
      ));
  static String? equipoModificacionAuditoriaarc(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasArchivos[$index].equipoModificacionAuditoria',
      ));
  static String? programaCreacionAuditoriaarc(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasArchivos[$index].programaCreacionAuditoria',
      ));
  static String? programaModificacionAuditoriaarc(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasArchivos[$index].programaModificacionAuditoria',
      ));


  ///SINC
  ///

  static List? sincro(dynamic response) => getJsonField(
    response,
    r'''$.dato.sincro''',
    true,
  ) as List?;
  static int? idSincroServer(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$.dato.sincro.idSincroServer''',
      ));
  static int? inspeccionesCargadasServer(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$.dato.sincro.inspeccionesCargadasServer''',
      ));
  static int? inspeccionesDescargadasServer(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$.dato.sincro.inspeccionesDescargadasServer''',
      ));
  static int? idEstadoSincronizacion(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$.dato.sincro.idEstadoSincronizacion''',
      ));
  static int? idSincroMovil(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$.dato.sincro.idSincroMovil''',
      ));

  ///PREGUNTAARCHIVOS
  static List? fichasPreguntasArchivos(dynamic response) => getJsonField(
    response,
    r'''$.dato.fichasPreguntasArchivos''',
    true,
  ) as List?;

  static int? idFichaPreguntaArchivo(dynamic response, int index) =>
      castToType<int>(getJsonField(
        response,
        '\$.dato.fichasPreguntasArchivos[$index].idFichaPreguntaArchivo',
      ));
  static int? idFichaPreguntaArchivoMovil(dynamic response, int index) =>
      castToType<int>(getJsonField(
        response,
        '\$.dato.fichasPreguntasArchivos[$index].idFichaPreguntaArchivoMovil',
      ));
  static int? idFichaprear(dynamic response, int index) =>
      castToType<int>(getJsonField(
        response,
        '\$.dato.fichasPreguntasArchivos[$index].idFicha',
      ));
  static int? idPreguntaprear(dynamic response, int index) =>
      castToType<int>(getJsonField(
        response,
        '\$.dato.fichasPreguntasArchivos[$index].idPregunta',
      ));
  static int? idPlantillaSeccionprear(dynamic response, int index) =>
      castToType<int>(getJsonField(
        response,
        '\$.dato.fichasPreguntasArchivos[$index].idPlantillaSeccion',
      ));
  static String? numeroRepeticionprear(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasPreguntasArchivos[$index].numeroRepeticion',
      ));
  static String? nombreprear(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasPreguntasArchivos[$index].nombre',
      ));
  static String? extensionprear(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasPreguntasArchivos[$index].extension',
      ));
  static String? rutaprear(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasPreguntasArchivos[$index].ruta',
      ));
  static String? pesoprear(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasPreguntasArchivos[$index].peso',
      ));
  static String? estadoAuditoriaprear(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasPreguntasArchivos[$index].estadoAuditoria',
      ));
  static String? usuarioCreacionAuditoriaprear(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasPreguntasArchivos[$index].usuarioCreacionAuditoria',
      ));
  static String? usuarioModificacionAuditoriaprear(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasPreguntasArchivos[$index].usuarioModificacionAuditoria',
      ));
  static String? fechaCreacionAuditoriaprear(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasPreguntasArchivos[$index].fechaCreacionAuditoria',
      ));
  static String? fechaModificacionAuditoriaprear(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasPreguntasArchivos[$index].fechaModificacionAuditoria',
      ));
  static String? equipoCreacionAuditoriaprear(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasPreguntasArchivos[$index].equipoCreacionAuditoria',
      ));
  static String? equipoModificacionAuditoriaprear(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasPreguntasArchivos[$index].equipoModificacionAuditoria',
      ));
  static String? programaCreacionAuditoriaprear(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasPreguntasArchivos[$index].programaCreacionAuditoria',
      ));
  static String? programaModificacionAuditoriaprear(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasPreguntasArchivos[$index].programaModificacionAuditoria',
      ));

  ///PREGUNTA COMENTARIOS

  static List? fichasPreguntasComentarios(dynamic response) => getJsonField(
    response,
    r'''$.dato.fichasPreguntasComentarios''',
    true,
  ) as List?;
  static int? idFichaPreguntaComentariocomen(dynamic response, int index) =>
      castToType<int>(getJsonField(
        response,
        '\$.dato.fichasPreguntasComentarios[$index].idFichaPreguntaComentario',
      ));
  static int? idFichaPreguntaComentarioMovilcomen(dynamic response, int index) =>
      castToType<int>(getJsonField(
        response,
        '\$.dato.fichasPreguntasComentarios[$index].idFichaPreguntaComentarioMovil',
      ));
  static int? idFichacomen(dynamic response, int index) =>
      castToType<int>(getJsonField(
        response,
        '\$.dato.fichasPreguntasComentarios[$index].idFicha',
      ));
  static int? idPreguntacomen(dynamic response, int index) =>
      castToType<int>(getJsonField(
        response,
        '\$.dato.fichasPreguntasComentarios[$index].idPregunta',
      ));
  static int? idPlantillaSeccioncomen(dynamic response, int index) =>
      castToType<int>(getJsonField(
        response,
        '\$.dato.fichasPreguntasComentarios[$index].idPlantillaSeccion',
      ));
  static String? observacioncomen(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasPreguntasComentarios[$index].observacion',
      ));
  static String? numeroRepeticioncomen(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasPreguntasComentarios[$index].numeroRepeticion',
      ));
  static String? estadoAuditoriacomen(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasPreguntasComentarios[$index].estadoAuditoria',
      ));
  static String? usuarioCreacionAuditoriacomen(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasPreguntasComentarios[$index].usuarioCreacionAuditoria',
      ));
  static String? usuarioModificacionAuditoriacomen(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasPreguntasComentarios[$index].usuarioModificacionAuditoria',
      ));
  static String? fechaCreacionAuditoriacomen(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasPreguntasComentarios[$index].fechaCreacionAuditoria',
      ));
  static String? fechaModificacionAuditoriacomen(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasPreguntasComentarios[$index].fechaModificacionAuditoria',
      ));
  static String? equipoCreacionAuditoriacomen(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasPreguntasComentarios[$index].equipoCreacionAuditoria',
      ));
  static String? equipoModificacionAuditoriacomen(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasPreguntasComentarios[$index].equipoModificacionAuditoria',
      ));
  static String? programaCreacionAuditoriacomen(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasPreguntasComentarios[$index].programaCreacionAuditoria',
      ));
  static String? programaModificacionAuditoriacomen(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasPreguntasComentarios[$index].programaModificacionAuditoria',
      ));

  static String? mensajeApiCall (dynamic response) =>
      castToType<String>(getJsonField(
        response,
        '\$.mensaje',
      ));
}

class APIObtenerTOKENCall {
  static Future<ApiCallResponse> call({
    String? usuario = '',
    String? clave = '',
    String? appId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "dato": {
    "app_id": "$appId",
    "usuario": "$usuario",
    "clave": "$clave"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'API Obtener TOKEN',
      apiUrl: 'https://autenticacion.ngrok.io/pronied-servicio-seguridad/api/oauth/v1/autenticacion-app',
      //apiUrl: 'https://calidad.pronied.gob.pe/pronied-servicio-seguridad/api/oauth/v1/autenticacion-app',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? response(dynamic response) => castToType<String>(getJsonField(
    response,
    r'''$.mensaje''',
  ));
  static dynamic dato(dynamic response) => getJsonField(
    response,
    r'''$.dato''',
  );
  static String? code(dynamic response) => castToType<String>(getJsonField(
    response,
    r'''$.dato.code''',
  ));
  static String? usuario(dynamic response) => castToType<String>(getJsonField(
    response,
    r'''$.dato.usuario''',
  ));
  static int? estado(dynamic response) => castToType<int>(getJsonField(
    response,
    r'''$.estado''',
  ));
}

class ApiAutorizacionCall {
  static Future<ApiCallResponse> call({
    String? applicationId = '',
    String? tokenSesion = '',
  }) async {
    final ffApiRequestBody = '''
{
  "dato": {
    "application_id": "$applicationId",
    "token_sesion": "$tokenSesion"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'API AUTORIZACION',
      apiUrl: 'https://autenticacion.ngrok.io/pronied-servicio-seguridad/api/oauth/v1/autorizacion',
      //apiUrl: 'https://calidad.pronied.gob.pe/pronied-servicio-seguridad/api/oauth/v1/autorizacion',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic informacion(dynamic response) => getJsonField(
    response,
    r'''$.dato.informacion''',
  );
  static int? idpersona(dynamic response) => castToType<int>(getJsonField(
    response,
    r'''$.dato.informacion.idpersona''',
  ));
  static String? nombre(dynamic response) => castToType<String>(getJsonField(
    response,
    r'''$.dato.informacion.nombre''',
  ));
  static String? apepaterno(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.dato.informacion.apellidopaterno''',
      ));
  static String? apematerno(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.dato.informacion.apellidomaterno''',
      ));
  static String? correo(dynamic response) => castToType<String>(getJsonField(
    response,
    r'''$.dato.informacion.correo''',
  ));
  static String? tipdocidentidad(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.dato.informacion.tipodocumentoidentidad''',
      ));
  static String? numerodocidad(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.dato.informacion.numerodocumentoidentidad''',
      ));
  static String? codigoarea(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.dato.informacion.codigoarea''',
      ));
  static String? nombrearea(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.dato.informacion.nombrearea''',
      ));
  static String? codusuario(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.dato.informacion.codusuario''',
      ));
  static String? idtipdocidentidad(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.dato.informacion.idtipodocumentoidentidad''',
      ));
  static String? celular(dynamic response) => castToType<String>(getJsonField(
    response,
    r'''$.dato.informacion.celular''',
  ));
  static String? direccion(dynamic response) => castToType<String>(getJsonField(
    response,
    r'''$.dato.informacion.direccion''',
  ));
  static String? recuperarclave(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.dato.informacion.opcionrecuperarclave''',
      ));
  static String? perteneceinstitucion(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.dato.informacion.perteneceinstitucion''',
      ));
  static String? sexo(dynamic response) => castToType<String>(getJsonField(
    response,
    r'''$.dato.informacion.sexo''',
  ));
  static int? estado(dynamic response) => castToType<int>(getJsonField(
    response,
    r'''$.estado''',
  ));
  static String? mensaje(dynamic response) => castToType<String>(getJsonField(
    response,
    r'''$.mensaje''',
  ));

  static String? roles(dynamic response) => castToType<String>(getJsonField(
    response,
    r'''$.dato.perfiles[0].nombre''',
  ));
}

class ApiTokenFinalCall {
  static Future<ApiCallResponse> call({
    String? applicationId = '',
    String? tokenSesion = '',
  }) async {
    final ffApiRequestBody = '''
{
  "dato": {
    "application_id": "$applicationId",
    "token_sesion": "$tokenSesion"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'API TOKEN FINAL',
      apiUrl: 'https://autenticacion.ngrok.io/pronied-servicio-seguridad/api/oauth/v1/access_token-app',
      //apiUrl: 'https://calidad.pronied.gob.pe/pronied-servicio-seguridad/api/oauth/v1/access_token-app',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? mensaje(dynamic response) => castToType<String>(getJsonField(
    response,
    r'''$.mensaje''',
  ));
  static dynamic dato(dynamic response) => getJsonField(
    response,
    r'''$.dato''',
  );
  static String? creadortoken(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.dato.creatortoken''',
      ));
  static String? jwtoketn(dynamic response) => castToType<String>(getJsonField(
    response,
    r'''$.dato.jwttoken''',
  ));
  static String? fechaexpiracion(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.dato.fechaexpiration''',
      ));
  static int? estado(dynamic response) => castToType<int>(getJsonField(
    response,
    r'''$.estado''',
  ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
