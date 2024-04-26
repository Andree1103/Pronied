import 'dart:io';

import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:inspecciones_p_r_o_n_i_e_d/components/alert_delete_archivo_widget.dart';
import 'package:inspecciones_p_r_o_n_i_e_d/flutter_flow/upload_data.dart';
import 'package:path_provider/path_provider.dart';

import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';


import 'galeria_archivos_model.dart';
export 'galeria_archivos_model.dart';

class GaleriaArchivosWidget extends StatefulWidget {
  const GaleriaArchivosWidget({super.key});

  @override
  State<GaleriaArchivosWidget> createState() => _GaleriaArchivosWidgetState();
}

class _GaleriaArchivosWidgetState extends State<GaleriaArchivosWidget> {
  late GaleriaArchivosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GaleriaArchivosModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  String? savedImagePath;

  Future<String> saveImageToDevice(FFUploadedFile imageFile) async {
    try {
      final appDir = await getApplicationDocumentsDirectory();
      final ext = imageFile.name!.split('.').last;
      final fileName = DateTime.now().millisecondsSinceEpoch.toString() + '.${ext}';
      final filePath = '${appDir.path}/$fileName';
      await File(filePath).writeAsBytes(imageFile.bytes!);
      return filePath;
    } catch (e) {
      // En caso de cualquier error, imprime el error y retorna una cadena vacía
      print('Error al guardar la imagen: $e');
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    String descripcionpgt = "";
    if(FFAppState().nrmRepeticion == "1") {
      descripcionpgt = "${FFAppState().descPregunta}";
    } else {
      descripcionpgt = "${FFAppState().descPregunta} x(${FFAppState().nrmRepeticion})";
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFF0E1C27),
        //backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,


        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  // Generated code for this Container Widget...
                  Align(
                    alignment: AlignmentDirectional(-1, 0),
                    child: FutureBuilder<List<ListarInspeccionesPorIdFichaRow>>(
                      future: SQLiteManager.instance.listarInspeccionesPorIdFicha(
                        idFicha: FFAppState().IdFicha,
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
                        final containerListarInspeccionesPorIdFichaRowList = snapshot.data!;
                        return Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xFF0E1C27),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF0E1C27),
                                      border: Border.all(
                                        color: Colors.transparent,
                                        width: 0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(25, 0, 0, 5),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(0, 0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional.fromSTEB(
                                                      10, 0, 0, 0),
                                                  child: InkWell(
                                                    splashColor: Colors.transparent,
                                                    focusColor: Colors.transparent,
                                                    hoverColor: Colors.transparent,
                                                    highlightColor: Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed('ListaInspecciones');
                                                    },
                                                    child: Icon(
                                                      Icons.house,
                                                      color: FlutterFlowTheme.of(context)
                                                          .primaryBackground,
                                                      size: 35,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(0, 0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional.fromSTEB(
                                                      10, 10, 0, 0),
                                                  child: InkWell(
                                                    splashColor: Colors.transparent,
                                                    focusColor: Colors.transparent,
                                                    hoverColor: Colors.transparent,
                                                    highlightColor: Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        'UbicacionInstitucion',
                                                        extra: <String, dynamic>{
                                                          kTransitionInfoKey: TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                            PageTransitionType.fade,
                                                            duration:
                                                            Duration(milliseconds: 1000),
                                                          ),
                                                        },
                                                      );
                                                    },
                                                    child: Icon(
                                                      Icons.add_location_rounded,
                                                      color: Color(0xFF086D82),
                                                      size: 35,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Align(
                                            alignment: AlignmentDirectional(-1, -1),
                                            child: Padding(
                                              padding:
                                              EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: 278,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFF0E1C27),
                                                    ),
                                                    child: Padding(
                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                          0, 0, 0, 5),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          containerListarInspeccionesPorIdFichaRowList
                                                              .first.nombreLocalColegio,
                                                          'ss',
                                                        ),
                                                        textAlign: TextAlign.start,
                                                        style: FlutterFlowTheme.of(context)
                                                            .headlineMedium
                                                            .override(
                                                          fontFamily: 'Outfit',
                                                          color: Colors.white,
                                                          fontSize: 25,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize: MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        valueOrDefault<String>(
                                                          containerListarInspeccionesPorIdFichaRowList
                                                              .first.departamentoColegio,
                                                          'de',
                                                        ),
                                                        style: FlutterFlowTheme.of(context)
                                                            .bodyMedium
                                                            .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                          FlutterFlowTheme.of(context)
                                                              .secondaryBackground,
                                                          fontSize: 13,
                                                        ),
                                                      ),
                                                      Text(
                                                        '/',
                                                        style: FlutterFlowTheme.of(context)
                                                            .bodyMedium
                                                            .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                          FlutterFlowTheme.of(context)
                                                              .secondaryBackground,
                                                        ),
                                                      ),
                                                      Text(
                                                        valueOrDefault<String>(
                                                          containerListarInspeccionesPorIdFichaRowList
                                                              .first.provinciaColegio,
                                                          'pro',
                                                        ),
                                                        style: FlutterFlowTheme.of(context)
                                                            .bodyMedium
                                                            .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                          FlutterFlowTheme.of(context)
                                                              .secondaryBackground,
                                                          fontSize: 13,
                                                        ),
                                                      ),
                                                      Text(
                                                        '/',
                                                        style: FlutterFlowTheme.of(context)
                                                            .bodyMedium
                                                            .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                          FlutterFlowTheme.of(context)
                                                              .secondaryBackground,
                                                        ),
                                                      ),
                                                      Text(
                                                        valueOrDefault<String>(
                                                          containerListarInspeccionesPorIdFichaRowList
                                                              .first.distritoColegio,
                                                          'dist',
                                                        ),
                                                        style: FlutterFlowTheme.of(context)
                                                            .bodyMedium
                                                            .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                          FlutterFlowTheme.of(context)
                                                              .secondaryBackground,
                                                          fontSize: 13,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    width: 278,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFF0E1C27),
                                                    ),
                                                    child: Padding(
                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                          0, 5, 0, 0),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          containerListarInspeccionesPorIdFichaRowList
                                                              .first.nombreEvento,
                                                          'envet',
                                                        ),
                                                        style: FlutterFlowTheme.of(context)
                                                            .bodyMedium
                                                            .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                          FlutterFlowTheme.of(context)
                                                              .primaryBackground,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1, 0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 45,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context).gray200,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(35, 10, 35, 10),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: 130,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              color: FlutterFlowTheme.of(context).gray200,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Align(
                                                  alignment: AlignmentDirectional(0, 0),
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                            0, 0, 5, 0),
                                                        child: Icon(
                                                          Icons.sd_card_alert,
                                                          color: () {
                                                            if (containerListarInspeccionesPorIdFichaRowList
                                                                .first.idEstado ==
                                                                3) {
                                                              return FlutterFlowTheme.of(
                                                                  context)
                                                                  .darkSeaGreen;
                                                            } else if (containerListarInspeccionesPorIdFichaRowList
                                                                .first.idEstado ==
                                                                2) {
                                                              return FlutterFlowTheme.of(
                                                                  context)
                                                                  .gray600;
                                                            } else if (containerListarInspeccionesPorIdFichaRowList
                                                                .first.idEstado ==
                                                                4) {
                                                              return FlutterFlowTheme.of(
                                                                  context)
                                                                  .warning;
                                                            } else {
                                                              return FlutterFlowTheme.of(
                                                                  context)
                                                                  .secondary;
                                                            }
                                                          }(),
                                                          size: 24,
                                                        ),
                                                      ),
                                                      Text(
                                                        valueOrDefault<String>(
                                                          containerListarInspeccionesPorIdFichaRowList
                                                              .first.estado,
                                                          'es',
                                                        ),
                                                        style: FlutterFlowTheme.of(context)
                                                            .bodyMedium,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: 130,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              color: FlutterFlowTheme.of(context).gray200,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Align(
                                                  alignment: AlignmentDirectional(0, 0),
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                                                        child: Icon(
                                                          Icons.check_circle_outline,
                                                          color: containerListarInspeccionesPorIdFichaRowList.first.modificadoMovil == 0
                                                              ? Colors.blue
                                                              : Colors.red, // Conditionally set icon color
                                                          size: 24,
                                                        ),
                                                      ),
                                                      Text(
                                                          containerListarInspeccionesPorIdFichaRowList.first.modificadoMovil == 0
                                                              ? 'Sincronizado'
                                                              : 'No Sincronizado', // Conditionally set text
                                                          style: FlutterFlowTheme.of(context).bodyMedium
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Column(
                      children: [
                        Align(
                            alignment: AlignmentDirectional(-1, -1),
                            child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFF086D82), // Light background color for contrast
                                    borderRadius: BorderRadius.circular(8), // Rounded corners for the container
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5), // Shadow for 3D effect
                                        spreadRadius: 1,
                                        blurRadius: 3,
                                        offset: Offset(0, 3), // Position of shadow
                                      ),
                                    ],
                                  ),
                                  margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5), // Space around the container
                                  padding: EdgeInsets.symmetric(horizontal: 16, vertical : 10), // Padding inside the container
                                  child: Align(
                                    alignment: AlignmentDirectional.center, // Correctly align text to center
                                    child: Text(
                                      valueOrDefault<String>(
                                        FFAppState().nomSeccion,
                                        'Sección',
                                      ),
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600, // Slightly bolder weight
                                        color: Colors.white, // Text color
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                )
                            )

                        ),
                        Align(
                            alignment: AlignmentDirectional(-1, -1),
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).secondaryBackground,
                              ),
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 20, vertical : 5),
                                padding: EdgeInsets.symmetric(horizontal: 16, vertical : 8), // Añade un padding interno de 16 píxeles por todos los lados.
                                decoration: BoxDecoration(
                                  color: Color(0xFF1CA8B5), // Color de fondo del container.
                                  borderRadius: BorderRadius.circular(8.0), // Redondea las esquinas del container.
                                  boxShadow: [ // Añade sombra alrededor del container para un efecto elevado.
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1), // Color de la sombra.
                                      spreadRadius: 1, // Alcance de la extensión de la sombra.
                                      blurRadius: 5, // Difuminado de la sombra.
                                      offset: Offset(0, 2), // Desplazamiento vertical de la sombra.
                                    ),
                                  ],
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(-1, 0), // Alineación del texto dentro del container.
                                  child: Text(
                                    valueOrDefault<String>(
                                      FFAppState().nombresubSeccion, // Obtiene la descripción desde una fila de datos.
                                      'Subsección', // Valor por defecto si la descripción es nula.
                                    ),
                                    style: FlutterFlowTheme.of(context).titleMedium.override(
                                      fontFamily: 'Outfit', // Establece la familia de fuente.
                                      fontSize: 15, // Tamaño de la fuente.
                                      fontWeight: FontWeight.bold, // Grosor de la fuente.
                                      color: Colors.white, // Color del texto para contraste con el fondo.
                                    ),
                                  ),
                                ),
                              ),
                            )

                        ),
                        Align(
                            alignment: AlignmentDirectional(-1, -1),
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).secondaryBackground,
                              ),
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 20, vertical : 5),
                                padding: EdgeInsets.symmetric(horizontal: 16, vertical : 8), // Añade un padding interno de 16 píxeles por todos los lados.
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black, width: 1),// Color de fondo del container.
                                  borderRadius: BorderRadius.circular(8.0), // Redondea las esquinas del container.

                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(-1, 0), // Alineación del texto dentro del container.
                                  child: Text(
                                    valueOrDefault<String>(
                                      descripcionpgt , // Obtiene la descripción desde una fila de datos.
                                      'Subsección', // Valor por defecto si la descripción es nula.
                                    ),
                                    style: FlutterFlowTheme.of(context).titleMedium.override(
                                      fontFamily: 'Outfit', // Establece la familia de fuente.
                                      fontSize: 15, // Tamaño de la fuente.
                                      fontWeight: FontWeight.bold, // Grosor de la fuente.
                                      color: Colors.black, // Color del texto para contraste con el fondo.
                                    ),
                                  ),
                                ),
                              ),
                            )

                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Align(
                      alignment: AlignmentDirectional(-1, -1),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width,
                        height: MediaQuery.sizeOf(context).height * 1,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 15, 20, 0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                FutureBuilder<List<ListarPreguntaArchivosRow>>(
                                  future: SQLiteManager.instance.listarPreguntaArchivoss(
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
                                            valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    final columnListarPreguntaArchivosRowList =
                                    snapshot.data!;
                                    FFAppState().countArchivo = columnListarPreguntaArchivosRowList.length + 1;
                                    if(columnListarPreguntaArchivosRowList.length == 0){
                                      return Text(
                                        "No se han encontrado archivos");
                                    }else {
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: List.generate(
                                            columnListarPreguntaArchivosRowList.length,
                                                (columnIndex) {
                                              final columnListarFotosRow =
                                              columnListarPreguntaArchivosRowList[columnIndex];
                                              switch (columnListarFotosRow.extension){
                                                case 'pdf':
                                                  return Card(
                                                    clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                    color: FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                    elevation: 4,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(8),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                      AlignmentDirectional(-1, 1),
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration: BoxDecoration(
                                                          color:
                                                          FlutterFlowTheme.of(context)
                                                              .secondaryBackground,
                                                        ),

                                                        child: Stack(
                                                          children: [
                                                            Column(
                                                              mainAxisSize:
                                                              MainAxisSize.max,
                                                              children: [
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    if (columnListarFotosRow.extension == 'pdf') {
                                                                      Navigator.push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                          builder: (context) => PDFView(
                                                                            filePath: columnListarFotosRow.rutalocal,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                  },
                                                                  child: Padding(
                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                                                                    child: ClipRRect(
                                                                      borderRadius: BorderRadius.circular(8),
                                                                      child: Image.asset(
                                                                        'assets/images/pdflogo.png',
                                                                        width: 300,
                                                                        height: 200,
                                                                        fit: BoxFit.contain,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                  AlignmentDirectional(
                                                                      -1, 1),
                                                                  child: Container(
                                                                    width:
                                                                    MediaQuery.sizeOf(
                                                                        context)
                                                                        .width *
                                                                        0.7,
                                                                    decoration:
                                                                    BoxDecoration(
                                                                      color: FlutterFlowTheme
                                                                          .of(context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                    child: Column(
                                                                      mainAxisSize:
                                                                      MainAxisSize.max,
                                                                      children: [
                                                                        Align(
                                                                          alignment:
                                                                          AlignmentDirectional(
                                                                              -1, 0),
                                                                          child: Padding(
                                                                              padding:
                                                                              EdgeInsetsDirectional
                                                                                  .fromSTEB(
                                                                                  25,
                                                                                  10,
                                                                                  0,
                                                                                  0),
                                                                              child: Text(
                                                                                columnListarFotosRow.nombre != 'null'
                                                                                    ? columnListarFotosRow.nombre!
                                                                                    : columnListarFotosRow.nombre!,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Outfit',
                                                                                  fontSize: 14,
                                                                                  fontWeight: FontWeight.w600,
                                                                                ),
                                                                              )
                                                                          ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Align(
                                                                                alignment:
                                                                                AlignmentDirectional(
                                                                                    -1,
                                                                                    0),
                                                                                child:
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional
                                                                                      .fromSTEB(
                                                                                      25,
                                                                                      0,
                                                                                      0,
                                                                                      10),
                                                                                  child:
                                                                                  Text(
                                                                                    '',
                                                                                    style: FlutterFlowTheme.of(context)
                                                                                        .bodyMedium,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            if(FFAppState().idestadoInspeccion == 4 && FFAppState().estadoInspeccion == 'EN REGISTRO')
                                                              Align(
                                                                alignment:
                                                                AlignmentDirectional(
                                                                    1, 1),
                                                                child: Padding(
                                                                  padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                      0, 217, 25, 0),
                                                                  child:
                                                                  FlutterFlowIconButton(
                                                                    borderColor:
                                                                    FlutterFlowTheme.of(
                                                                        context)
                                                                        .secondaryBackground,
                                                                    borderRadius: 20,
                                                                    borderWidth: 2,
                                                                    buttonSize: 50,
                                                                    fillColor:
                                                                    Color(0xFFAF2D3F),
                                                                    icon: Icon(
                                                                      Icons.delete,
                                                                      color: FlutterFlowTheme
                                                                          .of(context)
                                                                          .primaryBackground,
                                                                      size: 26,
                                                                    ),
                                                                    onPressed: () async {
                                                                      setState(() {
                                                                        FFAppState().IdFoto =
                                                                        columnListarFotosRow
                                                                            .idFichaPreguntaArchivoLocal!;
                                                                      });
                                                                      await showModalBottomSheet(
                                                                        isScrollControlled:
                                                                        true,
                                                                        backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                        enableDrag: false,
                                                                        context: context,
                                                                        builder: (context) {
                                                                          return GestureDetector(
                                                                            onTap: () => _model
                                                                                .unfocusNode
                                                                                .canRequestFocus
                                                                                ? FocusScope.of(
                                                                                context)
                                                                                .requestFocus(
                                                                                _model
                                                                                    .unfocusNode)
                                                                                : FocusScope.of(
                                                                                context)
                                                                                .unfocus(),
                                                                            child: Padding(
                                                                              padding: MediaQuery
                                                                                  .viewInsetsOf(
                                                                                  context),
                                                                              child:
                                                                              Container(
                                                                                height: 200,
                                                                                child:
                                                                                AlertDeleteArchivoWidget(),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          safeSetState(
                                                                                  () {}));
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                case 'jpeg':
                                                  return Card(
                                                    clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                    color: FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                    elevation: 4,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(8),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                      AlignmentDirectional(-1, 1),
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration: BoxDecoration(
                                                          color:
                                                          FlutterFlowTheme.of(context)
                                                              .secondaryBackground,
                                                        ),

                                                        child:  Stack(
                                                        children: [
                                                        Column(
                                              mainAxisSize:
                                              MainAxisSize.max,
                                              children: [
                                              Padding(
                                              padding:
                                              EdgeInsetsDirectional
                                                  .fromSTEB(
                                              0, 10, 0, 10),
                                              child: ClipRRect(
                                              borderRadius:
                                              BorderRadius
                                                  .circular(8),
                                              child: Image.file(
                                              File(valueOrDefault<String>(
                                              columnListarFotosRow
                                                  .rutalocal,
                                              'imagen',
                                              )),
                                              width: 300,
                                              height: 200,
                                              fit: BoxFit.cover,
                                              ),
                                              ),
                                              ),
                                              Align(
                                              alignment:
                                              AlignmentDirectional(
                                              -1, 1),
                                              child: Container(
                                              width:
                                              MediaQuery.sizeOf(
                                              context)
                                                  .width *
                                              0.7,
                                              decoration:
                                              BoxDecoration(
                                              color: FlutterFlowTheme
                                                  .of(context)
                                                  .secondaryBackground,
                                              ),
                                              child: Column(
                                              mainAxisSize:
                                              MainAxisSize.max,
                                              children: [
                                              Align(
                                              alignment:
                                              AlignmentDirectional(
                                              -1, 0),
                                              child: Padding(
                                              padding:
                                              EdgeInsetsDirectional
                                                  .fromSTEB(
                                              25,
                                              10,
                                              0,
                                              0),
                                              child: Text(
                                              columnListarFotosRow.nombre != 'null'
                                              ? columnListarFotosRow.nombre!
                                                  : columnListarFotosRow.nombre!,
                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                              fontFamily: 'Outfit',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              ),
                                              )
                                              ),
                                              ),
                                              Row(
                                              mainAxisSize:
                                              MainAxisSize
                                                  .max,
                                              children: [
                                              Expanded(
                                              child: Align(
                                              alignment:
                                              AlignmentDirectional(
                                              -1,
                                              0),
                                              child:
                                              Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                              25,
                                              0,
                                              0,
                                              10),
                                              child:
                                              Text(
                                              '',
                                              style: FlutterFlowTheme.of(context)
                                                  .bodyMedium,
                                              ),
                                              ),
                                              ),
                                              ),
                                              ],
                                              ),
                                              ],
                                              ),
                                              ),
                                              ),
                                              ],
                                              ),
                                              if(FFAppState().idestadoInspeccion == 4 && FFAppState().estadoInspeccion == 'EN REGISTRO')
                                              Align(
                                              alignment:
                                              AlignmentDirectional(
                                              1, 1),
                                              child: Padding(
                                              padding:
                                              EdgeInsetsDirectional
                                                  .fromSTEB(
                                              0, 217, 25, 0),
                                              child:
                                              FlutterFlowIconButton(
                                              borderColor:
                                              FlutterFlowTheme.of(
                                              context)
                                                  .secondaryBackground,
                                              borderRadius: 20,
                                              borderWidth: 2,
                                              buttonSize: 50,
                                              fillColor:
                                              Color(0xFFAF2D3F),
                                              icon: Icon(
                                              Icons.delete,
                                              color: FlutterFlowTheme
                                                  .of(context)
                                                  .primaryBackground,
                                              size: 26,
                                              ),
                                              onPressed: () async {
                                              setState(() {
                                              FFAppState().IdFoto =
                                              columnListarFotosRow
                                                  .idFichaPreguntaArchivoLocal!;
                                              });
                                              await showModalBottomSheet(
                                              isScrollControlled:
                                              true,
                                              backgroundColor:
                                              Colors
                                                  .transparent,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                              return GestureDetector(
                                              onTap: () => _model
                                                  .unfocusNode
                                                  .canRequestFocus
                                              ? FocusScope.of(
                                              context)
                                                  .requestFocus(
                                              _model
                                                  .unfocusNode)
                                                  : FocusScope.of(
                                              context)
                                                  .unfocus(),
                                              child: Padding(
                                              padding: MediaQuery
                                                  .viewInsetsOf(
                                              context),
                                              child:
                                              Container(
                                              height: 200,
                                              child:
                                              AlertDeleteArchivoWidget(),
                                              ),
                                              ),
                                              );
                                              },
                                              ).then((value) =>
                                              safeSetState(
                                              () {}));
                                              },
                                              ),
                                              ),
                                              ),
                                              ])
                                                      ),
                                                    ),
                                                  );
                                                case 'jpg':
                                                  return Card(
                                                    clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                    color: FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                    elevation: 4,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(8),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                      AlignmentDirectional(-1, 1),
                                                      child: Container(
                                                          width: double.infinity,
                                                          decoration: BoxDecoration(
                                                            color:
                                                            FlutterFlowTheme.of(context)
                                                                .secondaryBackground,
                                                          ),

                                                          child:  Stack(
                                                              children: [
                                                                Column(
                                                                  mainAxisSize:
                                                                  MainAxisSize.max,
                                                                  children: [
                                                                    Padding(
                                                                      padding:
                                                                      EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          0, 10, 0, 10),
                                                                      child: ClipRRect(
                                                                        borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                        child: Image.file(
                                                                          File(valueOrDefault<String>(
                                                                            columnListarFotosRow
                                                                                .rutalocal,
                                                                            'imagen',
                                                                          )),
                                                                          width: 300,
                                                                          height: 200,
                                                                          fit: BoxFit.cover,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                      AlignmentDirectional(
                                                                          -1, 1),
                                                                      child: Container(
                                                                        width:
                                                                        MediaQuery.sizeOf(
                                                                            context)
                                                                            .width *
                                                                            0.7,
                                                                        decoration:
                                                                        BoxDecoration(
                                                                          color: FlutterFlowTheme
                                                                              .of(context)
                                                                              .secondaryBackground,
                                                                        ),
                                                                        child: Column(
                                                                          mainAxisSize:
                                                                          MainAxisSize.max,
                                                                          children: [
                                                                            Align(
                                                                              alignment:
                                                                              AlignmentDirectional(
                                                                                  -1, 0),
                                                                              child: Padding(
                                                                                  padding:
                                                                                  EdgeInsetsDirectional
                                                                                      .fromSTEB(
                                                                                      25,
                                                                                      10,
                                                                                      0,
                                                                                      0),
                                                                                  child: Text(
                                                                                    columnListarFotosRow.nombre != 'null'
                                                                                        ? columnListarFotosRow.nombre!
                                                                                        : columnListarFotosRow.nombre!,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Outfit',
                                                                                      fontSize: 14,
                                                                                      fontWeight: FontWeight.w600,
                                                                                    ),
                                                                                  )
                                                                              ),
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize:
                                                                              MainAxisSize
                                                                                  .max,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Align(
                                                                                    alignment:
                                                                                    AlignmentDirectional(
                                                                                        -1,
                                                                                        0),
                                                                                    child:
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional
                                                                                          .fromSTEB(
                                                                                          25,
                                                                                          0,
                                                                                          0,
                                                                                          10),
                                                                                      child:
                                                                                      Text(
                                                                                        '',
                                                                                        style: FlutterFlowTheme.of(context)
                                                                                            .bodyMedium,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                if(FFAppState().idestadoInspeccion == 4 && FFAppState().estadoInspeccion == 'EN REGISTRO')
                                                                  Align(
                                                                    alignment:
                                                                    AlignmentDirectional(
                                                                        1, 1),
                                                                    child: Padding(
                                                                      padding:
                                                                      EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          0, 217, 25, 0),
                                                                      child:
                                                                      FlutterFlowIconButton(
                                                                        borderColor:
                                                                        FlutterFlowTheme.of(
                                                                            context)
                                                                            .secondaryBackground,
                                                                        borderRadius: 20,
                                                                        borderWidth: 2,
                                                                        buttonSize: 50,
                                                                        fillColor:
                                                                        Color(0xFFAF2D3F),
                                                                        icon: Icon(
                                                                          Icons.delete,
                                                                          color: FlutterFlowTheme
                                                                              .of(context)
                                                                              .primaryBackground,
                                                                          size: 26,
                                                                        ),
                                                                        onPressed: () async {
                                                                          setState(() {
                                                                            FFAppState().IdFoto =
                                                                            columnListarFotosRow
                                                                                .idFichaPreguntaArchivoLocal!;
                                                                          });
                                                                          await showModalBottomSheet(
                                                                            isScrollControlled:
                                                                            true,
                                                                            backgroundColor:
                                                                            Colors
                                                                                .transparent,
                                                                            enableDrag: false,
                                                                            context: context,
                                                                            builder: (context) {
                                                                              return GestureDetector(
                                                                                onTap: () => _model
                                                                                    .unfocusNode
                                                                                    .canRequestFocus
                                                                                    ? FocusScope.of(
                                                                                    context)
                                                                                    .requestFocus(
                                                                                    _model
                                                                                        .unfocusNode)
                                                                                    : FocusScope.of(
                                                                                    context)
                                                                                    .unfocus(),
                                                                                child: Padding(
                                                                                  padding: MediaQuery
                                                                                      .viewInsetsOf(
                                                                                      context),
                                                                                  child:
                                                                                  Container(
                                                                                    height: 200,
                                                                                    child:
                                                                                    AlertDeleteArchivoWidget(),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ).then((value) =>
                                                                              safeSetState(
                                                                                      () {}));
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ),
                                                              ])
                                                      ),
                                                    ),
                                                  );
                                                default:
                                                  return Card(
                                                    clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                    color: FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                    elevation: 4,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(8),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                      AlignmentDirectional(-1, 1),
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration: BoxDecoration(
                                                          color:
                                                          FlutterFlowTheme.of(context)
                                                              .secondaryBackground,
                                                        ),

                                                        child: Stack(
                                                          children: [
                                                            Column(
                                                              mainAxisSize:
                                                              MainAxisSize.max,
                                                              children: [
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    if (columnListarFotosRow.extension == 'pdf') {
                                                                      Navigator.push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                          builder: (context) => PDFView(
                                                                            filePath: columnListarFotosRow.rutalocal,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                  },
                                                                  child: Padding(
                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                                                                    child: ClipRRect(
                                                                      borderRadius: BorderRadius.circular(8),
                                                                      child: Image.asset(
                                                                        'assets/images/images.png',
                                                                        width: 300,
                                                                        height: 200,
                                                                        fit: BoxFit.contain,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                  AlignmentDirectional(
                                                                      -1, 1),
                                                                  child: Container(
                                                                    width:
                                                                    MediaQuery.sizeOf(
                                                                        context)
                                                                        .width *
                                                                        0.7,
                                                                    decoration:
                                                                    BoxDecoration(
                                                                      color: FlutterFlowTheme
                                                                          .of(context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                    child: Column(
                                                                      mainAxisSize:
                                                                      MainAxisSize.max,
                                                                      children: [
                                                                        Align(
                                                                          alignment:
                                                                          AlignmentDirectional(
                                                                              -1, 0),
                                                                          child: Padding(
                                                                              padding:
                                                                              EdgeInsetsDirectional
                                                                                  .fromSTEB(
                                                                                  25,
                                                                                  10,
                                                                                  0,
                                                                                  0),
                                                                              child: Text(
                                                                                columnListarFotosRow.nombre != 'null'
                                                                                    ? columnListarFotosRow.nombre!
                                                                                    : columnListarFotosRow.nombre!,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Outfit',
                                                                                  fontSize: 14,
                                                                                  fontWeight: FontWeight.w600,
                                                                                ),
                                                                              )
                                                                          ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Align(
                                                                                alignment:
                                                                                AlignmentDirectional(
                                                                                    -1,
                                                                                    0),
                                                                                child:
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional
                                                                                      .fromSTEB(
                                                                                      25,
                                                                                      0,
                                                                                      0,
                                                                                      10),
                                                                                  child:
                                                                                  Text(
                                                                                    '',
                                                                                    style: FlutterFlowTheme.of(context)
                                                                                        .bodyMedium,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            if(FFAppState().idestadoInspeccion == 4 && FFAppState().estadoInspeccion == 'EN REGISTRO')
                                                              Align(
                                                                alignment:
                                                                AlignmentDirectional(
                                                                    1, 1),
                                                                child: Padding(
                                                                  padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                      0, 217, 25, 0),
                                                                  child:
                                                                  FlutterFlowIconButton(
                                                                    borderColor:
                                                                    FlutterFlowTheme.of(
                                                                        context)
                                                                        .secondaryBackground,
                                                                    borderRadius: 20,
                                                                    borderWidth: 2,
                                                                    buttonSize: 50,
                                                                    fillColor:
                                                                    Color(0xFFAF2D3F),
                                                                    icon: Icon(
                                                                      Icons.delete,
                                                                      color: FlutterFlowTheme
                                                                          .of(context)
                                                                          .primaryBackground,
                                                                      size: 26,
                                                                    ),
                                                                    onPressed: () async {
                                                                      setState(() {
                                                                        FFAppState().IdFoto =
                                                                        columnListarFotosRow
                                                                            .idFichaPreguntaArchivoLocal!;
                                                                      });
                                                                      await showModalBottomSheet(
                                                                        isScrollControlled:
                                                                        true,
                                                                        backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                        enableDrag: false,
                                                                        context: context,
                                                                        builder: (context) {
                                                                          return GestureDetector(
                                                                            onTap: () => _model
                                                                                .unfocusNode
                                                                                .canRequestFocus
                                                                                ? FocusScope.of(
                                                                                context)
                                                                                .requestFocus(
                                                                                _model
                                                                                    .unfocusNode)
                                                                                : FocusScope.of(
                                                                                context)
                                                                                .unfocus(),
                                                                            child: Padding(
                                                                              padding: MediaQuery
                                                                                  .viewInsetsOf(
                                                                                  context),
                                                                              child:
                                                                              Container(
                                                                                height: 200,
                                                                                child:
                                                                                AlertDeleteArchivoWidget(),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          safeSetState(
                                                                                  () {}));
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                              }
                                            })
                                      );
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                  )
                  )
                ],
              ),
              Align(
                alignment: AlignmentDirectional(-1,1),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 30),
                  child: FloatingActionButton(
                    onPressed: () async {
                      Navigator.of(context).pop();
                    },
                    backgroundColor: Color(0xFF086D82),
                    elevation: 8,
                    shape: CircleBorder(),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: FFAppState().idestadoInspeccion == 4 && FFAppState().estadoInspeccion == 'EN REGISTRO',
                child:Align(
                  alignment: AlignmentDirectional(1,1),
                  child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 30),
                      child: FloatingActionButton(
                        onPressed: () async {
                          final selectedMedia =
                          await selectMediaWithSourceBottomSheet(
                            context: context,
                            allowPhoto: true,
                          );
                          if (selectedMedia != null &&
                              selectedMedia.every((m) =>
                                  validateFileFormat(
                                      m.storagePath,
                                      context))) {
                            setState(() =>
                            _model.isDataUploading = true);
                            var selectedUploadedFiles =
                            <FFUploadedFile>[];

                            try {
                              selectedUploadedFiles =
                                  selectedMedia
                                      .map(
                                          (m) => FFUploadedFile(
                                        name: m
                                            .storagePath
                                            .split('/')
                                            .last,
                                        bytes: m.bytes,
                                        height: m
                                            .dimensions
                                            ?.height,
                                        width: m
                                            .dimensions
                                            ?.width,
                                        blurHash:
                                        m.blurHash,
                                      ))
                                      .toList();
                            } finally {
                              _model.isDataUploading = false;
                            }
                            if (selectedUploadedFiles.length ==
                                selectedMedia.length) {
                              setState(() {
                                _model.uploadedLocalFile =
                                    selectedUploadedFiles.first;
                              });
                            } else {
                              setState(() {});
                              return;
                            }
                          }
                          if (_model.uploadedLocalFile == null ||
                              (_model.uploadedLocalFile.bytes ?? [])
                                  .isEmpty) {
                            return;
                          }
                          savedImagePath  = await saveImageToDevice(_model.uploadedLocalFile);
                          final ultima = await SQLiteManager.instance.VerificarSiExistePreguntaComentarioARCENUll(
                            idFicha: FFAppState().IdFicha,
                            numeroRepeticion: FFAppState().nrmRepeticion,
                            idPregunta: FFAppState().idPregunta,
                            idPlantillaSeccion: FFAppState().idPlantillaSeccion,
                          );
                          int indexer = 1;
                          if(ultima.isNotEmpty) {
                            indexer = ultima[0].idFichaPreguntaArchivoLocal! + 1;
                          }
                          await SQLiteManager.instance.CrearPreguntaArchivoAPI(
                            idPregunta: FFAppState().idPregunta,
                            idFicha: FFAppState().IdFicha,
                            idPlantillaSeccion: FFAppState().idPlantillaSeccion,
                            nombre: "Archivo N° ${FFAppState().countArchivo}",
                            extension: _model.uploadedLocalFile.name!.split('.').last,
                            rutaLocal: savedImagePath,
                            modificadoMovil: 1,
                            estadoAuditoria: '1',
                            uploadDocumento: 0,
                            numeroRepeticion: FFAppState().nrmRepeticion,
                            usuarioCreacionAuditoria: FFAppState().username,
                            fechaCreacionAuditoria: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                            equipoCreacionAuditoria: FFAppState().cummovil,
                            programaCreacionAuditoria: FFAppState().programacreacion,
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
                                'Archivo guardado correctamente',
                                style: TextStyle(
                                  color:
                                  FlutterFlowTheme.of(context).secondaryBackground,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor: FlutterFlowTheme.of(context).primary,
                            ),
                          );
                          Navigator.of(context);
                          //context.pushNamed('GaleriaArchivos');
                        },
                        backgroundColor: Color(0xFF086D82),
                        elevation: 8,
                        shape: CircleBorder(),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            final selectedMedia =
                            await selectMediaWithSourceBottomSheet(
                              context: context,
                              allowPhoto: true,
                            );
                            if (selectedMedia != null &&
                                selectedMedia.every((m) =>
                                    validateFileFormat(
                                        m.storagePath,
                                        context))) {
                              setState(() =>
                              _model.isDataUploading = true);
                              var selectedUploadedFiles =
                              <FFUploadedFile>[];

                              try {
                                selectedUploadedFiles =
                                    selectedMedia
                                        .map(
                                            (m) => FFUploadedFile(
                                          name: m
                                              .storagePath
                                              .split('/')
                                              .last,
                                          bytes: m.bytes,
                                          height: m
                                              .dimensions
                                              ?.height,
                                          width: m
                                              .dimensions
                                              ?.width,
                                          blurHash:
                                          m.blurHash,
                                        ))
                                        .toList();
                              } finally {
                                _model.isDataUploading = false;
                              }
                              if (selectedUploadedFiles.length ==
                                  selectedMedia.length) {
                                setState(() {
                                  _model.uploadedLocalFile =
                                      selectedUploadedFiles.first;
                                });
                              } else {
                                setState(() {});
                                return;
                              }
                            }
                            if (_model.uploadedLocalFile == null ||
                                (_model.uploadedLocalFile.bytes ?? [])
                                    .isEmpty) {
                              return;
                            }
                            savedImagePath  = await saveImageToDevice(_model.uploadedLocalFile);
                            final ultima = await SQLiteManager.instance.VerificarSiExistePreguntaComentarioARCENUll(
                              idFicha: FFAppState().IdFicha,
                              numeroRepeticion: FFAppState().nrmRepeticion,
                              idPregunta: FFAppState().idPregunta,
                              idPlantillaSeccion: FFAppState().idPlantillaSeccion,
                            );
                            int indexer = 1;
                            if(ultima.isNotEmpty) {
                              indexer = ultima[0].idFichaPreguntaArchivoLocal! + 1;
                            }
                            await SQLiteManager.instance.CrearPreguntaArchivoAPI(
                              idPregunta: FFAppState().idPregunta,
                              idFicha: FFAppState().IdFicha,
                              idPlantillaSeccion: FFAppState().idPlantillaSeccion,
                              nombre: "Archivo N° ${FFAppState().countArchivo}",
                              extension: _model.uploadedLocalFile.name!.split('.').last,
                              rutaLocal: savedImagePath,
                              modificadoMovil: 1,
                              estadoAuditoria: '1',
                              uploadDocumento: 0,
                              numeroRepeticion: FFAppState().nrmRepeticion,
                              usuarioCreacionAuditoria: FFAppState().username,
                              fechaCreacionAuditoria: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                              equipoCreacionAuditoria: FFAppState().cummovil,
                              programaCreacionAuditoria: FFAppState().programacreacion,
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
                                  'Archivo guardado correctamente',
                                  style: TextStyle(
                                    color:
                                    FlutterFlowTheme.of(context).secondaryBackground,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor: FlutterFlowTheme.of(context).primary,
                              ),
                            );
                            Navigator.of(context);
                            //context.pushNamed('GaleriaArchivos');
                          },
                          child: Icon(
                            Icons.add,
                            color: FlutterFlowTheme.of(context).secondaryBackground,
                            size: 24,
                          ),
                        ),
                      ),
                  ),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}