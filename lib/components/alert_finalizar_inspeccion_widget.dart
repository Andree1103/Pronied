import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'alert_finalizar_inspeccion_model.dart';
export 'alert_finalizar_inspeccion_model.dart';

class AlertFinalizarInspeccionWidget extends StatefulWidget {
  const AlertFinalizarInspeccionWidget({super.key});

  @override
  State<AlertFinalizarInspeccionWidget> createState() =>
      _AlertFinalizarInspeccionWidgetState();
}

class _AlertFinalizarInspeccionWidgetState
    extends State<AlertFinalizarInspeccionWidget> {
  late AlertFinalizarInspeccionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AlertFinalizarInspeccionModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  int CantObligatoria = 0;
  int retornoConsultaA = 0;
  int retornoConsultaS = 0;
  int retornoConsultaP = 0;
  int retornoConsultaX = 0;
  List<String> preguntaDesc = [];
  List<ListarPreguntasObligatoriasRow> preguntasFaltanteA = [];
  List<ListarPreguntasObligatoriasRow> preguntasFaltanteS = [];
  List<ListarPreguntasObligatoriasRow> preguntasFaltanteP = [];
  List<ListarPreguntasObligatoriasRow> preguntasFaltanteX = [];

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: const [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x33000000),
            offset: Offset(
              0.0,
              2.0,
            ),
          )
        ],
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 15.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                child: Text(
                  '¿Está usted seguro de finalizar la inspección?',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Outfit',
                        fontSize: 15.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
              child: FFButtonWidget(
                onPressed: () async {
                  final cantidadP = FFAppState().CantP;
                  final cantidadS = FFAppState().CantS;
                  final cantidadA = FFAppState().CantA;
                  for(int i = 0; i<cantidadP; i++){
                    preguntasFaltanteP = await preguntasrestantes2(FFAppState().IdFicha, i+1, 'P');
                    retornoConsultaP = preguntasFaltanteP.length;
                    CantObligatoria += retornoConsultaP;
                    if(retornoConsultaP > 0){
                      for(var p in preguntasFaltanteP){
                        preguntaDesc.add(p.descripcion!);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Pendientes ${retornoConsultaP} preguntas obligatorias por responder. "${p.descripcion}"',
                              style: TextStyle(
                                color:
                                FlutterFlowTheme.of(context).secondaryBackground,
                              ),
                            ),
                            duration: const Duration(milliseconds: 4000),
                            backgroundColor: FlutterFlowTheme.of(context).primary,
                          ),
                        );
                      }
                    }

                  }
                  for(int i = 0; i<cantidadS; i++){
                    preguntasFaltanteS = await preguntasrestantes2(FFAppState().IdFicha, i+1, 'S');
                    retornoConsultaS = preguntasFaltanteS.length;
                    CantObligatoria += retornoConsultaS;
                    if(retornoConsultaS > 0){
                      for(var p in preguntasFaltanteS){
                        preguntaDesc.add(p.descripcion!);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Pendientes ${retornoConsultaS} preguntas obligatorias por responder. "${p.descripcion}"',
                              style: TextStyle(
                                color:
                                FlutterFlowTheme.of(context).secondaryBackground,
                              ),
                            ),
                            duration: const Duration(milliseconds: 4000),
                            backgroundColor: FlutterFlowTheme.of(context).primary,
                          ),
                        );
                      }
                    }
                  }
                  for(int i = 0; i<cantidadA; i++){
                    preguntasFaltanteA = await preguntasrestantes2(FFAppState().IdFicha, i+1, 'A');
                    retornoConsultaA = preguntasFaltanteA.length;
                    CantObligatoria += retornoConsultaA;
                    if(retornoConsultaA > 0){
                      for(var p in preguntasFaltanteA){
                        preguntaDesc.add(p.descripcion!);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Pendientes ${retornoConsultaA} preguntas obligatorias por responder. "${p.descripcion}"',
                              style: TextStyle(
                                color:
                                FlutterFlowTheme.of(context).secondaryBackground,
                              ),
                            ),
                            duration: const Duration(milliseconds: 4000),
                            backgroundColor: FlutterFlowTheme.of(context).primary,
                          ),
                        );
                      }
                    }
                  }
                  for(int i = 0; i<1 ; i++){
                    preguntasFaltanteX = await preguntasrestantes2(FFAppState().IdFicha, 1, 'X');
                    retornoConsultaX = preguntasFaltanteX.length;
                    CantObligatoria += retornoConsultaX;
                    if(retornoConsultaX > 0){
                      for(var p in preguntasFaltanteX){
                        preguntaDesc.add(p.descripcion!);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Pendientes ${retornoConsultaX} preguntas obligatorias por responder. "${p.descripcion}"',
                              style: TextStyle(
                                color:
                                FlutterFlowTheme.of(context).secondaryBackground,
                              ),
                            ),
                            duration: const Duration(milliseconds: 4000),
                            backgroundColor: FlutterFlowTheme.of(context).primary,
                          ),
                        );
                      }
                    }
                  }


                  if(CantObligatoria > 0) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Pendientes ${CantObligatoria} preguntas obligatorias por responder.',
                          style: TextStyle(
                            color:
                            FlutterFlowTheme.of(context).secondaryBackground,
                          ),
                        ),
                        duration: const Duration(milliseconds: 4000),
                        backgroundColor: FlutterFlowTheme.of(context).primary,
                      ),
                    );
                    Navigator.pop(context);
                  } else {
                    await SQLiteManager.instance.actualizarFinalizarInspeccion(
                      idInspeccion: FFAppState().idInspeccion,
                      programaModificacionAuditoria:  FFAppState().programacreacion,
                      equipoModificacionAuditoria: FFAppState().cummovil,
                      fechaModificacionAuditoria: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                      usuarioModificacionAuditoria: FFAppState().username,
                    );
                    setState(() {
                      FFAppState().estadoInspeccion = 'REALIZADA';
                      FFAppState().idestadoInspeccion = 3;
                      SQLiteManager.instance.inspeccion1(
                        idFicha: FFAppState().IdFicha,
                      );
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Inspección finalizada correctamente',
                          style: TextStyle(
                            color:
                            FlutterFlowTheme.of(context).secondaryBackground,
                          ),
                        ),
                        duration: const Duration(milliseconds: 4000),
                        backgroundColor: FlutterFlowTheme.of(context).primary,
                      ),
                    );
                    CantObligatoria = 0;
                    Navigator.pop(context);

                    //context.pushNamed('DatosInspeccion');
                  }
                },
                text: 'Aceptar',
                options: FFButtonOptions(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 40.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).error,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Outfit',
                        color: Colors.white,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.normal,
                      ),
                  elevation: 3.0,
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
              child: FFButtonWidget(
                onPressed: () async {
                  Navigator.pop(context);
                },
                text: 'Cancelar',
                options: FFButtonOptions(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 40.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Outfit',
                        color: FlutterFlowTheme.of(context).primaryText,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                  elevation: 3.0,
                  borderSide: const BorderSide(
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
    );
  }
}

Future<int> preguntasrestantes  ( int idficha, int numero, String repeticion) async {
  final preguntas = await SQLiteManager.instance.listarPreguntasObligatorias(
    modorepeticion: repeticion,
    idFicha: idficha,
    numero: numero
  );
  return preguntas.length;
}

Future<List<ListarPreguntasObligatoriasRow>> preguntasrestantes2  ( int idficha, int numero, String repeticion) async {
  final preguntas = await SQLiteManager.instance.listarPreguntasObligatorias(
      modorepeticion: repeticion,
      idFicha: idficha,
      numero: numero
  );
  return preguntas;
}