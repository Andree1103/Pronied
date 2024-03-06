import 'dart:convert';
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

class ApiProniedCall {
  static Future<ApiCallResponse> call({
    dynamic? corcheJson,
  }) async {
    final corche = _serializeJson(corcheJson);
    final ffApiRequestBody = '''
${corche}''';
    return ApiManager.instance.makeApiCall(
      callName: 'API PRONIED',
      apiUrl:
          'https://inspeccionesback.ngrok.io/monitoreoback/api/sincronizacion/sincrodown',
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
  static int? usuarioCreacionAuditoriaRpta(dynamic response, int index) =>
      castToType<int>(getJsonField(
      response,
      '\$.dato.fichasPreguntasRespuestas[$index].usuarioCreacionAuditoria',
    ));
  static int? usuarioModificacionAuditoriaRpta(dynamic response, int index) =>
      castToType<int>(getJsonField(
        response,
        '\$.dato.fichasPreguntasRespuestas[$index].usuarioModificacionAuditoria',
      ));
  static String? fechaCreacionAuditoriaRpta(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasPreguntasRespuestas[$index].fechaCreacionAuditoria',
      ));
  static int? equipoCreacionAuditoriaRpta(dynamic response, int index) =>
      castToType<int>(getJsonField(
        response,
        '\$.dato.fichasPreguntasRespuestas[$index].equipoCreacionAuditoria',
  ));
  static int? equipoModificacionAuditoriaRpta(dynamic response, int index) =>
      castToType<int>(getJsonField(
        response,
        '\$.dato.fichasPreguntasRespuestas[$index].equipoModificacionAuditoria',
      ));
  static int? programaCreacionAuditoriaRpta(dynamic response, int index) =>
    castToType<int>(getJsonField(
      response,
      '\$.dato.fichasPreguntasRespuestas[$index].programaCreacionAuditoria',
  ));
  static String? fechaModificacionAuditoriaRpta(dynamic response, int index) =>
      castToType<String>(getJsonField(
        response,
        '\$.dato.fichasPreguntasRespuestas[$index].fechaModificacionAuditoria',
      ));
  static int? programaModificacionAuditoriaRpta(dynamic response, int index) =>
      castToType<int>(getJsonField(
        response,
        '\$.dato.fichasPreguntasRespuestas[$index].programaModificacionAuditoria',
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
