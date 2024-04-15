import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';

import '/backend/sqlite/sqlite_manager.dart';
import '/components/alert_delete_foto_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:file_selector/file_selector.dart';


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

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFF0E1C27),
        floatingActionButton:
        Visibility(
          visible: FFAppState().idestadoInspeccion == 4 && FFAppState().estadoInspeccion == 'EN REGISTRO',
          child: FloatingActionButton(
            onPressed: () async{
              try {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  allowMultiple: true,
                );

                if (result != null) {
                  // El usuario seleccionó archivo(s)
                  for (var file in result.files) {
                    print('Archivo seleccionado: ${file.name}');
                  }
                } else {
                  // El usuario canceló la selección de archivos
                  print('El usuario canceló la selección de archivos');
                }
              } catch (e) {
                print('Error al seleccionar archivos: $e');
              }
            },
            backgroundColor: Color(0xFF086D82),
            elevation: 8,
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async{
                var pathdirc;
                try {
                  final typeGroup = XTypeGroup(
                    label: 'Archivos',
                    extensions: ['*'], // Permitir cualquier tipo de archivo
                  );
                  final files = await openFiles(
                    acceptedTypeGroups: [typeGroup],
                  );

                  if (files != null && files.isNotEmpty) {
                    for (var file in files) {
                      print('Archivo seleccionado: ${file.path}');
                      final tens = file.mimeType!.split('/').last;
                      final appDir = await getApplicationDocumentsDirectory();
                      final savedFile = File('${appDir.path}/${file.name}');
                      await savedFile.writeAsBytes(await file.readAsBytes());
                      print('Archivo guardado en: ${savedFile.path}');
                      await SQLiteManager.instance.CrearPreguntaArchivoAPI(
                        idPregunta: FFAppState().idPregunta,
                        idFicha: FFAppState().IdFicha,
                        idPlantillaSeccion: FFAppState().idPlantillaSeccion,
                        nombre: file.name,
                        extension: tens,
                        rutaLocal: savedFile.path,
                        modificadoMovil: 1,
                        estadoAuditoria: '1',
                        numeroRepeticion: FFAppState().nrmRepeticion,
                        usuarioCreacionAuditoria: FFAppState().username,
                        fechaCreacionAuditoria: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                        equipoCreacionAuditoria: FFAppState().cummovil,
                        programaCreacionAuditoria: FFAppState().programacreacion,
                      );
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
                      context.pushNamed('GaleriaArchivos');
                    }
                  } else {
                    print('El usuario canceló la selección de archivos');
                  }
                } catch (e) {
                  print('Error al seleccionar archivos: $e');
                }
              },
              child: Icon(
                Icons.add,
                color: FlutterFlowTheme.of(context).secondaryBackground,
                size: 24,
              ),
            ),
          ),
        ),
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
                                    if(columnListarPreguntaArchivosRowList.length == 0){
                                      return Text(
                                        "No se han encontrado archivos",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.center, // Centra el texto
                                      );
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
                                                                                AlertDeleteFotoWidget(),
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
                                              AlertDeleteFotoWidget(),
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
                                                                                    AlertDeleteFotoWidget(),
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
                                                                                AlertDeleteFotoWidget(),
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
            ],
          ),
        ),
      ),
    );
  }
}