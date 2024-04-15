import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'agregar_comentario_model.dart';
export 'agregar_comentario_model.dart';

class AgregarComentarioWidget extends StatefulWidget {
  const AgregarComentarioWidget({super.key});

  @override
  State<AgregarComentarioWidget> createState() =>
      _AgregarComentarioWidgetState();
}

class _AgregarComentarioWidgetState extends State<AgregarComentarioWidget> {
  late AgregarComentarioModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AgregarComentarioModel());

    _model.dat1FocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ListarPreguntaComentarioRow>>(
      future: SQLiteManager.instance.listarComentarios(
        idPregunta: FFAppState().idPregunta,
        idFicha: FFAppState().IdFicha,
        idPlantillaSeccion: FFAppState().idPlantillaSeccion,
        numeroRpe: FFAppState().nrmRepeticion,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  FlutterFlowTheme.of(context).primary,
                ),
              ),
            ),
          );
        }
        final dropdown8OptionsListarFotosRowList = snapshot.data!;
        return Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                color: Color(0x33000000),
                offset: Offset(
                  0,
                  2,
                ),
              )
            ],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 15),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                      child: Text(
                        'Agregar Comentario',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Outfit',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                    child: Container(
                      width: double.infinity,
                      child: TextFormField(
                        controller: _model.dat1Controller ??=
                            TextEditingController(
                              text: dropdown8OptionsListarFotosRowList.isNotEmpty
                                  ? dropdown8OptionsListarFotosRowList[0].observacion
                                  : '',
                            ),
                        focusNode: _model.dat1FocusNode,
                        autofocus: true,
                        autofillHints: [AutofillHints.name],
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Comentario',
                          labelStyle: FlutterFlowTheme.of(context)
                              .labelLarge
                              .override(
                            fontFamily: 'Outfit',
                            color:
                            FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0,
                          ),
                          alignLabelWithHint: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          fillColor:
                          FlutterFlowTheme.of(context).primaryBtnText,
                        ),
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'Outfit',
                          fontSize: 13,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w300,
                        ),
                        textAlign: TextAlign.start,
                        maxLines: 5,
                        validator:
                        _model.dat1ControllerValidator.asValidator(context),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 25),
                      child: FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');
                          if(dropdown8OptionsListarFotosRowList.isEmpty) {
                            SQLiteManager.instance.crearComentario(
                                idPregunta: FFAppState().idPregunta,
                                idFicha: FFAppState().IdFicha,
                                idPlantillaSeccion: FFAppState().idPlantillaSeccion,
                                observacion: _model.dat1Controller?.text ?? '',
                                estadoAuditoria: '1',
                                numeroRepeticion: FFAppState().nrmRepeticion,
                                usuarioCreacionAuditoria: FFAppState().username,
                                fechaCreacionAuditoria: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                                equipoCreacionAuditoria: FFAppState().cummovil,
                                programaCreacionAuditoria: FFAppState().programacreacion,
                                modificadoMovil: 1
                            );
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Comentario guardado correctamente',
                                  style: TextStyle(
                                    color:
                                    FlutterFlowTheme.of(context).secondaryBackground,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor: FlutterFlowTheme.of(context).primary,
                              ),
                            );
                            setState(() {
                              SQLiteManager.instance.inspeccion1(
                                idFicha: FFAppState().IdFicha,
                                usuarioModificacionAuditoria: FFAppState().username,
                                fechaModificacionAuditoria: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                                equipoModificacionAuditoria: FFAppState().cummovil,
                                programaModificacionAuditoria: FFAppState().programacreacion,
                              );
                            });
                          } else {
                            SQLiteManager.instance.actualizarComentario(
                              idPlantillaSeccion: FFAppState().idPlantillaSeccion,
                              idFicha: FFAppState().IdFicha,
                              idPregunta: FFAppState().idPregunta,
                              observacion: _model.dat1Controller?.text ?? '',
                              estadoAuditoria: '1',
                              numeroRepeticion: FFAppState().nrmRepeticion,
                              usuarioModificacionAuditoria: FFAppState().username,
                              fechaModificacionAuditoria: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                              equipoModificacionAuditoria: FFAppState().cummovil,
                              programaModificacionAuditoria: FFAppState().programacreacion,
                              idFichaPreguntaComentario: dropdown8OptionsListarFotosRowList[0].idFichaPreguntaComentario,
                              idFichaPreguntaComentarioLocal: dropdown8OptionsListarFotosRowList[0].idFichaPreguntaComentarioLocal,
                              modificadoMovil: 1
                            );
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Comentario actualizado correctamente',
                                  style: TextStyle(
                                    color:
                                    FlutterFlowTheme.of(context).secondaryBackground,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor: FlutterFlowTheme.of(context).primary,
                              ),
                            );
                            setState(() {
                              SQLiteManager.instance.inspeccion1(
                                idFicha: FFAppState().IdFicha,
                                usuarioModificacionAuditoria: FFAppState().username,
                                fechaModificacionAuditoria: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                                equipoModificacionAuditoria: FFAppState().cummovil,
                                programaModificacionAuditoria: FFAppState().programacreacion,
                              );
                            });
                          }

                        },
                        text: 'Guardar Comentario',
                        options: FFButtonOptions(
                          height: 40,
                          padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                          iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          color: Color(0xFF086D82),
                          textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily: 'Outfit',
                            color: Colors.white,
                            letterSpacing: 0,
                          ),
                          elevation: 3,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
