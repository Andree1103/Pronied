import 'package:inspecciones_p_r_o_n_i_e_d/Utils/ConstAlerts.dart';
import 'package:inspecciones_p_r_o_n_i_e_d/Utils/ConstansText.dart';

import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'alert_delete_archivo_model.dart';
export 'alert_delete_archivo_model.dart';

class AlertDeleteArchivoWidget extends StatefulWidget {
  const AlertDeleteArchivoWidget({super.key});

  @override
  State<AlertDeleteArchivoWidget> createState() => _AlertDeleteArchivoWidgetState();
}

class _AlertDeleteArchivoWidgetState extends State<AlertDeleteArchivoWidget> {
  late AlertDeleteArchivoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AlertDeleteArchivoModel());
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
      height: double.infinity,
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
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                child: Text(
                  ConstansTetx.eliminar_archivo,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Outfit',
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
              child: FFButtonWidget(
                onPressed: () async {
                  await SQLiteManager.instance.deletePreARCHIVO(
                    idFoto: FFAppState().IdFoto,
                    usuarioModificacionAuditoria: FFAppState().username,
                    fechaModificacionAuditoria: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                    equipoModificacionAuditoria: FFAppState().cummovil,
                    programaModificacionAuditoria: FFAppState().programacreacion,
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
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        ConstAlerts.archivo_eliminado,
                        style: TextStyle(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                      ),
                      duration: Duration(milliseconds: 4000),
                      backgroundColor: FlutterFlowTheme.of(context).primary,
                    ),
                  );
                  Navigator.pop(context);

                  context.pushNamed('GaleriaArchivos');
                },
                text: ConstansTetx.aceptar,
                options: FFButtonOptions(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).error,
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
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
              child: FFButtonWidget(
                onPressed: () async {
                  Navigator.pop(context);
                },
                text: ConstansTetx.cancelar,
                options: FFButtonOptions(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Outfit',
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontWeight: FontWeight.bold,
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
    );
  }
}
