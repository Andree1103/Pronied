import '/backend/api_requests/api_calls.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'drop_model.dart';
export 'drop_model.dart';

class DropWidget extends StatefulWidget {
  const DropWidget({super.key});

  @override
  State<DropWidget> createState() => _DropWidgetState();
}

class _DropWidgetState extends State<DropWidget> {
  late DropModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DropModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x33000000),
            offset: Offset(0.0, 2.0),
          )
        ],
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 15.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 10.0, 0.0),
                            child: Icon(
                              Icons.person,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 10.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Monitor',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Outfit',
                                  fontSize: 12.0,
                                ),
                              ),
                              Text(
                                'Luis Pedro Reyes Loaiza',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Outfit',
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                'UNIDAD ZONAL DE LAMBAYEQUE',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Outfit',
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                      EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 5.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          context.pushNamed('Login');
                        },
                        text: 'Cerrar Sesión',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).error,
                          textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily: 'Outfit',
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 5.0, 20.0, 20.0),
              child: FFButtonWidget(
                onPressed: () async {
                  _model.apiResponseDatos = await ApiProniedCall.call(
                    corcheJson: {},
                  );
                  if ((_model.apiResponseDatos?.succeeded ?? true)) {
                    var inspecciones = ApiProniedCall.listName(_model.apiResponseDatos?.jsonBody);

                    if (inspecciones != null) {
                      for (var i = 0; i < inspecciones.length; i++) {
                        await SQLiteManager.instance.cargarData(
                          idInspeccion: ApiProniedCall.idInspeccion(_model.apiResponseDatos?.jsonBody, i),
                          nombreIns: ApiProniedCall.nombreInspeccion(_model.apiResponseDatos?.jsonBody, i),
                          idFichaIns: ApiProniedCall.idFichaIns(_model.apiResponseDatos?.jsonBody, i),
                          idPlantillaIns: ApiProniedCall.idPlantillaId(_model.apiResponseDatos?.jsonBody, i),
                          codigolocalIns: ApiProniedCall.codigoLocalIns(_model.apiResponseDatos?.jsonBody, i),
                          nombreLocalIns: ApiProniedCall.nombreLocalIns(_model.apiResponseDatos?.jsonBody, i),
                          departamentoIns: ApiProniedCall.departamentoInst(_model.apiResponseDatos?.jsonBody, i),
                          provinciaIns: ApiProniedCall.provinciaIns(_model.apiResponseDatos?.jsonBody, i),
                          distritoIns: ApiProniedCall.destritoIns(_model.apiResponseDatos?.jsonBody, i),
                          idEstadoIns: ApiProniedCall.idEstadoIns(_model.apiResponseDatos?.jsonBody, i),
                          estadoIns: ApiProniedCall.estadoIns(_model.apiResponseDatos?.jsonBody, i),
                        );
                      }
                    }

                    var fichas = ApiProniedCall.fichas(_model.apiResponseDatos?.jsonBody);

                    if(fichas != null){
                      for (var i=0; i < fichas.length; i++){
                        await SQLiteManager.instance.cargarFicha(
                            idFicha: ApiProniedCall.idFicha(_model.apiResponseDatos?.jsonBody, i),
                            idPlantilla: ApiProniedCall.idPlantilla(_model.apiResponseDatos?.jsonBody, i),
                            codigoLocalColegio: ApiProniedCall.fichaCodigoLocal(_model.apiResponseDatos?.jsonBody, i),
                            nombreLocalColegio: ApiProniedCall.fichaNombreLocal(_model.apiResponseDatos?.jsonBody, i),
                            departamentoColegio: ApiProniedCall.fichaDepartamento(_model.apiResponseDatos?.jsonBody, i),
                            provinciaColegio: ApiProniedCall.fichaProvincia(_model.apiResponseDatos?.jsonBody, i),
                            distritoColegio: ApiProniedCall.fichaDistrito(_model.apiResponseDatos?.jsonBody, i),
                            centroPobladoColegio: ApiProniedCall.fichaCentroPoblado(_model.apiResponseDatos?.jsonBody, i),
                            direccionColegio: ApiProniedCall.fichaDireccion(_model.apiResponseDatos?.jsonBody, i),
                            zonaColegio: ApiProniedCall.fichaZona(_model.apiResponseDatos?.jsonBody, i),
                            totalPabellon : ApiProniedCall.fichaPabellon(_model.apiResponseDatos?.jsonBody, i),
                            totalAulas: ApiProniedCall.fichaAulas(_model.apiResponseDatos?.jsonBody, i),
                            totalSSHH: ApiProniedCall.fichaSSHH(_model.apiResponseDatos?.jsonBody, i),
                            dniInspector: ApiProniedCall.fichaDniInspector(_model.apiResponseDatos?.jsonBody, i),
                            nombreInspector: ApiProniedCall.fichaNombreInspector(_model.apiResponseDatos?.jsonBody, i),
                            correoInspector: ApiProniedCall.fichaCorreoInspector(_model.apiResponseDatos?.jsonBody, i),
                            telefonoInspector: ApiProniedCall.fichaTelefonoIns(_model.apiResponseDatos?.jsonBody, i),
                            fechaInspeccion: ApiProniedCall.fichaFechaInspeccion(_model.apiResponseDatos?.jsonBody, i),
                            horaInspeccion: ApiProniedCall.fichaHoraInspeccion(_model.apiResponseDatos?.jsonBody, i),
                            tipoInspeccion: ApiProniedCall.fichaTipoInspeccion(_model.apiResponseDatos?.jsonBody, i),
                            dniDirector: ApiProniedCall.fichaDniDirector(_model.apiResponseDatos?.jsonBody, i),
                            nombreDirector: ApiProniedCall.fichaNombreDirector(_model.apiResponseDatos?.jsonBody, i),
                            correoDirector: ApiProniedCall.fichaCorreoDirector(_model.apiResponseDatos?.jsonBody, i),
                            telefonoDirector: ApiProniedCall.fichaTelefonoDirector(_model.apiResponseDatos?.jsonBody, i),
                            dniAlterno: ApiProniedCall.fichaDniAlterno(_model.apiResponseDatos?.jsonBody, i),
                            nombreAlterno: ApiProniedCall.fichaNombreAlterno(_model.apiResponseDatos?.jsonBody, i),
                            correoAlterno: ApiProniedCall.fichaCorreoAlterno(_model.apiResponseDatos?.jsonBody, i),
                            telefonoAlterno: ApiProniedCall.fichaTelefonoAlterno(_model.apiResponseDatos?.jsonBody, i)
                        );
                      }
                    }

                    var fichasModulares = ApiProniedCall.fichaModular(_model.apiResponseDatos?.jsonBody);
                    if(fichasModulares != null){
                      for (var i=0; i < fichasModulares.length; i++){
                        await SQLiteManager.instance.cargarFichaModular(
                          idFichaModular: ApiProniedCall.idFichaModular(_model.apiResponseDatos?.jsonBody, i),
                          idFicha: ApiProniedCall.idFichaModularFicha(_model.apiResponseDatos?.jsonBody, i),
                          codigoModular: ApiProniedCall.codigoModular(_model.apiResponseDatos?.jsonBody, i),
                          codigoLocal: ApiProniedCall.codigoLocalModular(_model.apiResponseDatos?.jsonBody, i),
                          codigoNivel: ApiProniedCall.codigoNivelModular(_model.apiResponseDatos?.jsonBody, i),
                          nivel: ApiProniedCall.nivelModular(_model.apiResponseDatos?.jsonBody, i),
                          codigoTipoDocente: ApiProniedCall.tipoDocenteMod(_model.apiResponseDatos?.jsonBody, i),
                          tipoDocente: ApiProniedCall.tipoDocenteMod(_model.apiResponseDatos?.jsonBody, i),
                          codigoTipoSexo: ApiProniedCall.tipoSexcionMod(_model.apiResponseDatos?.jsonBody, i),
                          tipoSexo: ApiProniedCall.tipoSexoMod(_model.apiResponseDatos?.jsonBody, i),
                          codigoTurno: ApiProniedCall.codigoTurnoMod(_model.apiResponseDatos?.jsonBody, i),
                          turno: ApiProniedCall.turnoMod(_model.apiResponseDatos?.jsonBody, i),
                          numeroHombres: ApiProniedCall.numeroHombreMod(_model.apiResponseDatos?.jsonBody, i),
                          numeroMujeres: ApiProniedCall.numeroMujeresMod(_model.apiResponseDatos?.jsonBody, i),
                          numeroAlumnos: ApiProniedCall.numeroAlumnoMod(_model.apiResponseDatos?.jsonBody, i),
                          numeroDocente: ApiProniedCall.numeroDocenteMod(_model.apiResponseDatos?.jsonBody, i),
                          numeroSeccion: ApiProniedCall.numeroSeccinMod(_model.apiResponseDatos?.jsonBody, i),
                        );
                      }
                    }

                    var plantillas = ApiProniedCall.plantillas(_model.apiResponseDatos?.jsonBody);
                    if (plantillas != null) {
                      for (var i=0; i < plantillas.length; i++){
                        await SQLiteManager.instance.cargarPlantilla(
                          idPlantilla: ApiProniedCall.idPlantillas(_model.apiResponseDatos?.jsonBody, i),
                          nombreFicha: ApiProniedCall.nombreFichaPla(_model.apiResponseDatos?.jsonBody, i),
                          idUnidadTrabajo : ApiProniedCall.idUnidadTrabajoPla(_model.apiResponseDatos?.jsonBody, i),
                          nombreUnidadTrabajo: ApiProniedCall.nomUnidadTrabajoPla(_model.apiResponseDatos?.jsonBody, i),
                        );
                      }
                    }

                    var secciones = ApiProniedCall.secciones(_model.apiResponseDatos?.jsonBody);
                    if (secciones != null){
                      for (var i=0; i < secciones.length; i++){
                        await SQLiteManager.instance.cargarPlantillaSecciones(
                          idPlantillaSeccion: ApiProniedCall.idPLantillaSecc(_model.apiResponseDatos?.jsonBody, i),
                          idPlantillaSeccionPadre: ApiProniedCall.idPlantillaSeccPa(_model.apiResponseDatos?.jsonBody, i),
                          idPlantilla: ApiProniedCall.idePlantillaSec(_model.apiResponseDatos?.jsonBody, i),
                          descripcion: ApiProniedCall.descripcionSec(_model.apiResponseDatos?.jsonBody, i),
                          modoRepeticion: ApiProniedCall.modoRepeticionSec(_model.apiResponseDatos?.jsonBody, i),
                        );
                      }
                    }

                    var opciones = ApiProniedCall.opciones(_model.apiResponseDatos?.jsonBody);
                    if (opciones != null) {
                      for (var i=0; i< opciones.length; i++){
                        await SQLiteManager.instance.cargarPlantillaOpciones(
                          idPlantillaOpcion: ApiProniedCall.idPlantillaOpciones(_model.apiResponseDatos?.jsonBody, i),
                          idPlantillaSeccion: ApiProniedCall.idPlantillaSeccOP(_model.apiResponseDatos?.jsonBody, i),
                          idPlantilla: ApiProniedCall.idPlantillaOP(_model.apiResponseDatos?.jsonBody, i),
                          idPregunta: ApiProniedCall.idPreguntaOP(_model.apiResponseDatos?.jsonBody, i),
                          descripcion: ApiProniedCall.descriopcionOP(_model.apiResponseDatos?.jsonBody, i),
                          clasificacionOpcion: ApiProniedCall.clasificacionOP(_model.apiResponseDatos?.jsonBody, i),
                          idTipoOpcion: ApiProniedCall.idTipoOpcion(_model.apiResponseDatos?.jsonBody, i),
                          tipoOpcion: ApiProniedCall.tipoOpcionOP(_model.apiResponseDatos?.jsonBody, i),
                          matIcon: ApiProniedCall.matIconOP(_model.apiResponseDatos?.jsonBody, i),
                        );
                      }
                    }

                    var preguntas = ApiProniedCall.preguntasPre(_model.apiResponseDatos?.jsonBody);
                    if (preguntas != null){
                      for (var i=0; i< preguntas.length; i++){
                        await SQLiteManager.instance.cargarPlantillaPregunta(
                          idPlantillaPregunta: ApiProniedCall.idPlantillaPregunta(_model.apiResponseDatos?.jsonBody, i),
                          idPlantillaSeccion: ApiProniedCall.idPlantillaSecPres(_model.apiResponseDatos?.jsonBody, i),
                          idPregunta: ApiProniedCall.idPreguntaPres(_model.apiResponseDatos?.jsonBody, i),
                          descripcionPregunta: ApiProniedCall.descripciondePres(_model.apiResponseDatos?.jsonBody, i),
                          flagMandatorio: ApiProniedCall.flagMandatorioPres(_model.apiResponseDatos?.jsonBody, i),
                          idPlantilla: ApiProniedCall.idPlantillaPres(_model.apiResponseDatos?.jsonBody, i),
                        );
                      }
                    }

                    SnackBar(
                      content: Text(
                        'Inspecciones Sincronizadas!',
                        style: TextStyle(
                          color:
                          FlutterFlowTheme.of(context)
                              .primaryBackground,
                        ),
                      ),
                      duration:
                      Duration(milliseconds: 4000),
                      backgroundColor:
                      FlutterFlowTheme.of(context)
                          .primary,
                    );
                  } else {
                    SnackBar(
                      content: Text(
                        'Error en la Sincronizacion!',
                        style: TextStyle(
                          color:
                          FlutterFlowTheme.of(context)
                              .primaryBackground,
                        ),
                      ),
                      duration:
                      Duration(milliseconds: 4000),
                      backgroundColor:
                      FlutterFlowTheme.of(context)
                          .primary,
                    );
                  }
                  Navigator.pop(context);

                  setState(() {});
                },
                text: 'Descargar Datos',
                options: FFButtonOptions(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                  EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Outfit',
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                  elevation: 3.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Text(
                'Última sincronización: 30/01/2024 10:00:00',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Outfit',
                  fontSize: 10.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
