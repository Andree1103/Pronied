import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:inspecciones_p_r_o_n_i_e_d/Utils/Constans.dart';
import 'package:inspecciones_p_r_o_n_i_e_d/Utils/ConstansAlerts.dart';
import 'package:inspecciones_p_r_o_n_i_e_d/Utils/ConstansText.dart';
import 'package:inspecciones_p_r_o_n_i_e_d/app_state.dart';
import 'package:inspecciones_p_r_o_n_i_e_d/backend/sqlite/sqlite_manager.dart';
import 'package:inspecciones_p_r_o_n_i_e_d/flutter_flow/flutter_flow_theme.dart';
import 'package:inspecciones_p_r_o_n_i_e_d/flutter_flow/flutter_flow_util.dart';
import 'package:painter/painter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';

class DrawingPage extends StatefulWidget {
  final ImageProvider image;  // Cambiado de ui.Image a ImageProvider para facilidad
  final int tipopersona;
  final int tipodocumento;
  final String numdocumento;
  final String nombres;
  final String apepaterno;
  final String apematerno;

  DrawingPage({
    Key? key,
    required this.image,
    required this.tipopersona,
    required this.tipodocumento,
    required this.numdocumento,
    required this.nombres,
    required this.apepaterno,
    required this.apematerno,
  }) : super(key: key);

  @override
  _DrawingPageState createState() => _DrawingPageState();
}

class _DrawingPageState extends State<DrawingPage> {
  late PainterController _controller;
  ScreenshotController screenshotController = ScreenshotController();
  bool _isLoading = true;

  void _showLoadingDialog() {
    showDialog(
      context: context,
      barrierDismissible: false, // Evita que el usuario cierre el diálogo tocando fuera de él.
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(width: 24),
                Text(ConstAlerts.cargando_loading, style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        );
      },
    );

    // Cerrar el diálogo después de 2 segundos
    Future.delayed(Duration(seconds: 2), () {
      if (Navigator.of(context).canPop()) {
        Navigator.of(context).pop(); // Asegúrate de cerrar el diálogo
      }
    });
  }


  @override
  void initState() {
    super.initState();
    _controller = _newController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showLoadingDialog();
    });
  }

  PainterController _newController() {
    PainterController controller = PainterController();
    controller.thickness = 5.0;
    controller.backgroundColor = Colors.transparent; // Asegúrate de que el fondo sea transparente
    return controller;
  }

  Future<String> _saveImageToLocal() async {
    final Uint8List? imageBytes = await screenshotController.capture();
    if (imageBytes != null) {
      final filePath = await saveImageToDevice(imageBytes);
      return filePath;
    } else {
      return '';
    }
  }

  Future<String> saveImageToDevice(Uint8List imageBytes) async {
    try {
      final appDir = await getApplicationDocumentsDirectory();
      final fileName = DateTime.now().millisecondsSinceEpoch.toString() + '.png';
      final filePath = '${appDir.path}/$fileName';
      await File(filePath).writeAsBytes(imageBytes);
      return filePath;
    } catch (e) {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ConstansTetx.firma),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              _controller.clear();
            },
          ),
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () async {
              var img = await _saveImageToLocal();
              await SQLiteManager.instance.crearFichaFirma(
                idFicha: FFAppState().IdFicha,
                idTipoPersona: widget.tipopersona,
                idTipoDocumento: widget.tipodocumento,
                numDocumento: widget.numdocumento,
                nombres: widget.nombres,
                apellidoPaterno: widget.apepaterno,
                apellidoMaterno: widget.apematerno,
                estadoAuditoria: Sincronizacion.estado_adutoria_true,
                tipoArchivo: Sincronizacion.tipo_archivo_firma,
                rutalocal: img,
                modificacionMovil: 1,
                uploadDocumento: 0,
                fechaCreacionAuditoria: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                equipoCreacionAuditoria: FFAppState().cummovil,
                programaCreacionAuditoria: FFAppState().programacreacion,
                usuarioCreacionAuditoria: FFAppState().username,
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
              ScaffoldMessenger.of(context)
                  .showSnackBar(
                SnackBar(
                  content: Text(
                    ConstAlerts.firma_success,
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
                ),
              );
              int count = 0;
              Navigator.popUntil(context, (route) {
                return count++ == 2;
              });
            },
          ),
        ],
      ),
      body: Screenshot(
        controller: screenshotController,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image(
                image: widget.image,
                fit: BoxFit.contain, // Ajusta según necesites
              ),
            ),
            Positioned.fill(
                child: Painter(_controller)
            ),
          ],
        ),
      )
    );
  }
}

