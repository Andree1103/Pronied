import 'dart:io';

import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:inspecciones_p_r_o_n_i_e_d/Utils/ConstansAlerts.dart';
import 'package:inspecciones_p_r_o_n_i_e_d/Utils/Constans.dart';
import 'package:inspecciones_p_r_o_n_i_e_d/Utils/ConstansColors.dart';
import 'package:inspecciones_p_r_o_n_i_e_d/Utils/ConstansText.dart';
import 'package:inspecciones_p_r_o_n_i_e_d/components/FullScreenImage.dart';

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

import 'galeria_fotos_model.dart';
export 'galeria_fotos_model.dart';

class GaleriaFotosWidget extends StatefulWidget {
  const GaleriaFotosWidget({super.key});

  @override
  State<GaleriaFotosWidget> createState() => _GaleriaFotosWidgetState();
}

class _GaleriaFotosWidgetState extends State<GaleriaFotosWidget> {
  late GaleriaFotosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GaleriaFotosModel());
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
        backgroundColor: ConstansColors.bluedark,
        floatingActionButton:
        Visibility(
          visible: FFAppState().idestadoInspeccion == Sincronizacion.estado_cola_incompleto && FFAppState().estadoInspeccion == Sincronizacion.estado_inspeccion_enregistro,
          child: FloatingActionButton(
            onPressed: () {
              context.pushNamed('AddFoto');
            },
            backgroundColor: ConstansColors.cyan,
            elevation: 8,
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pushNamed('AddFoto');
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
                            color: ConstansColors.bluedark,
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
                                      color: ConstansColors.bluedark,
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
                                                      color: ConstansColors.cyan,
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
                                                      color: ConstansColors.bluedark,
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
                                                          ConstansTetx.departamento,
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
                                                          ConstansTetx.provincia,
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
                                                          ConstansTetx.distrito,
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
                                                      color: ConstansColors.bluedark,
                                                    ),
                                                    child: Padding(
                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                          0, 5, 0, 0),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          containerListarInspeccionesPorIdFichaRowList
                                                              .first.nombreEvento,
                                                          ConstansTetx.evento,
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
                                                          ConstansTetx.estado,
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
                                                              ? ConstansTetx.inspeccion_sicronizada
                                                              : ConstansTetx.inspeccion_no_sincronizada, // Conditionally set text
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
                  Flexible(child:
                  Align(
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
                              FutureBuilder<List<ListarFotosRow>>(
                                future: SQLiteManager.instance.listarFotos(
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
                                          valueColor:
                                          AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  final columnListarFotosRowList =
                                  snapshot.data!;
                                  if(columnListarFotosRowList.length == 0){
                                    return Text(
                                    ConstAlerts.foto_no_encontrada);
                                  }else {
                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: List.generate(
                                          columnListarFotosRowList.length,
                                              (columnIndex) {
                                            final columnListarFotosRow =
                                            columnListarFotosRowList[columnIndex];
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

                                                  child: columnListarFotosRow.extension == 'pdf' ?
                                                  Stack(
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
                                                                      filePath: columnListarFotosRow.imagen,
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
                                                                  Sincronizacion.url_pdf,
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
                                                                          columnListarFotosRow.titulo != 'null'
                                                                              ? columnListarFotosRow.titulo!
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
                                                                              columnListarFotosRow.comentario != 'null'
                                                                                  ? columnListarFotosRow.comentario!
                                                                                  : '',
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
                                                      if(FFAppState().idestadoInspeccion == Sincronizacion.estado_cola_incompleto && FFAppState().estadoInspeccion == Sincronizacion.estado_inspeccion_enregistro)
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
                                                              ConstansColors.reddark,
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
                                                                      .id!;
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
                                                  ) :
                                                  Stack(
                                                    children: [
                                                      Column(
                                                        mainAxisSize: MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                                                            child: GestureDetector(
                                                              onTap: () {
                                                                Navigator.of(context).push(MaterialPageRoute(
                                                                  builder: (context) => FullScreenImage(
                                                                    imageFile: File(valueOrDefault<String>(
                                                                      columnListarFotosRow.imagen,
                                                                      'imagen',
                                                                    )),
                                                                  ),
                                                                ));
                                                              },
                                                              child: ClipRRect(
                                                                borderRadius: BorderRadius.circular(8),
                                                                child: Image.file(
                                                                  File(valueOrDefault<String>(
                                                                    columnListarFotosRow.imagen,
                                                                    'imagen',
                                                                  )),
                                                                  width: 300,
                                                                  height: 200,
                                                                  fit: BoxFit.cover,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment: AlignmentDirectional(-1, 1),
                                                            child: Container(
                                                              width: MediaQuery.of(context).size.width * 0.7,
                                                              decoration: BoxDecoration(
                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                              ),
                                                              child: Column(
                                                                mainAxisSize: MainAxisSize.max,
                                                                children: [
                                                                  Align(
                                                                    alignment: AlignmentDirectional(-1, 0),
                                                                    child: Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(25, 10, 0, 0),
                                                                      child: Text(
                                                                        columnListarFotosRow.titulo != 'null'
                                                                            ? columnListarFotosRow.titulo!
                                                                            : columnListarFotosRow.nombre!,
                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                          fontFamily: 'Outfit',
                                                                          fontSize: 14,
                                                                          fontWeight: FontWeight.w600,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize: MainAxisSize.max,
                                                                    children: [
                                                                      Expanded(
                                                                        child: Align(
                                                                          alignment: AlignmentDirectional(-1, 0),
                                                                          child: Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(25, 0, 0, 10),
                                                                            child: Text(
                                                                              columnListarFotosRow.comentario != 'null'
                                                                                  ? columnListarFotosRow.comentario!
                                                                                  : '',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
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
                                                      if (FFAppState().idestadoInspeccion == Sincronizacion.estado_cola_incompleto && FFAppState().estadoInspeccion == Sincronizacion.estado_inspeccion_enregistro)
                                                        Align(
                                                          alignment: AlignmentDirectional(1, 1),
                                                          child: Padding(
                                                            padding: EdgeInsetsDirectional.fromSTEB(0, 217, 25, 0),
                                                            child: FlutterFlowIconButton(
                                                              borderColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                              borderRadius: 20,
                                                              borderWidth: 2,
                                                              buttonSize: 50,
                                                              fillColor: ConstansColors.reddark,
                                                              icon: Icon(
                                                                Icons.delete,
                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                size: 26,
                                                              ),
                                                              onPressed: () async {
                                                                setState(() {
                                                                  FFAppState().IdFoto = columnListarFotosRow.id!;
                                                                });
                                                                await showModalBottomSheet(
                                                                  isScrollControlled: true,
                                                                  backgroundColor: Colors.transparent,
                                                                  enableDrag: false,
                                                                  context: context,
                                                                  builder: (context) {
                                                                    return GestureDetector(
                                                                      onTap: () => _model.unfocusNode.canRequestFocus
                                                                          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                          : FocusScope.of(context).unfocus(),
                                                                      child: Padding(
                                                                        padding: MediaQuery.of(context).viewInsets,
                                                                        child: Container(
                                                                          height: 200,
                                                                          child: AlertDeleteFotoWidget(),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                ).then((value) => safeSetState(() {}));
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          })
                                          .divide(SizedBox(height: 20))
                                          .around(SizedBox(height: 20)),
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
