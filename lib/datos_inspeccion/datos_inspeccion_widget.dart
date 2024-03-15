import 'dart:async';

import 'package:flutter/services.dart';

import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'datos_inspeccion_model.dart';
export 'datos_inspeccion_model.dart';

class DatosInspeccionWidget extends StatefulWidget {
  const DatosInspeccionWidget({super.key});

  @override
  State<DatosInspeccionWidget> createState() => _DatosInspeccionWidgetState();
}

class _DatosInspeccionWidgetState extends State<DatosInspeccionWidget> {
  late DatosInspeccionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DatosInspeccionModel());

    _model.dat1Controller ??=
        TextEditingController(text: 'Generando en Desarrollo');
    _model.dat1FocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }


  String? itemSelected;
  String? itemSelec;
  List<String> itemselecteds = [];
  List<String> itemsSelected = [];
  Map<String, String?> selectedValuesss = {};

  DateTime? selectedDate;

  TextEditingController _dateController = TextEditingController();

  DateTime? selectedDateTime;
  TextEditingController _dateTimeController = TextEditingController();

  TimeOfDay? selectedTime;

// Función para mostrar el selector de hora
  TextEditingController _timeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFF0E1C27),
          body: SafeArea(
            top: true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(-1, 0),
                  child: FutureBuilder<
                      List<ListarInspeccionesPorIdFichaRow>>(
                    future: SQLiteManager.instance
                        .listarInspeccionesPorIdFicha(
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
                      final containerListarInspeccionesPorIdFichaRowList =
                      snapshot.data!;
                      return Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xFF0E1C27),
                        ),
                        child: Padding(
                          padding:
                          EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 20, 0, 0),
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
                                    padding:
                                    EdgeInsetsDirectional.fromSTEB(
                                        25, 0, 20, 5),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Align(
                                              alignment:
                                              AlignmentDirectional(
                                                  0, 0),
                                              child: Padding(
                                                padding:
                                                EdgeInsetsDirectional
                                                    .fromSTEB(
                                                    10, 0, 0, 0),
                                                child: InkWell(
                                                  splashColor:
                                                  Colors.transparent,
                                                  focusColor:
                                                  Colors.transparent,
                                                  hoverColor:
                                                  Colors.transparent,
                                                  highlightColor:
                                                  Colors.transparent,
                                                  onTap: () async {
                                                    context.pushNamed(
                                                        'ListaInspecciones');
                                                  },
                                                  child: Icon(
                                                    Icons.house,
                                                    color: FlutterFlowTheme
                                                        .of(context)
                                                        .primaryBackground,
                                                    size: 35,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment:
                                              AlignmentDirectional(
                                                  0, 0),
                                              child: Padding(
                                                padding:
                                                EdgeInsetsDirectional
                                                    .fromSTEB(
                                                    10, 10, 0, 0),
                                                child: InkWell(
                                                  splashColor:
                                                  Colors.transparent,
                                                  focusColor:
                                                  Colors.transparent,
                                                  hoverColor:
                                                  Colors.transparent,
                                                  highlightColor:
                                                  Colors.transparent,
                                                  onTap: () async {
                                                    context.pushNamed(
                                                      'UbicacionInstitucion',
                                                      extra: <String,
                                                          dynamic>{
                                                        kTransitionInfoKey:
                                                        TransitionInfo(
                                                          hasTransition:
                                                          true,
                                                          transitionType:
                                                          PageTransitionType
                                                              .fade,
                                                          duration: Duration(
                                                              milliseconds:
                                                              2000),
                                                        ),
                                                      },
                                                    );
                                                  },
                                                  child: Icon(
                                                    Icons
                                                        .add_location_rounded,
                                                    color:
                                                    Color(0xFF086D82),
                                                    size: 35,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Flexible(
                                          child: Align(
                                            alignment:
                                            AlignmentDirectional(
                                                -1, -1),
                                            child: Padding(
                                              padding:
                                              EdgeInsetsDirectional
                                                  .fromSTEB(
                                                  20, 0, 20, 0),
                                              child: Column(
                                                mainAxisSize:
                                                MainAxisSize.min,
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .center,
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(0,
                                                        0, 0, 5),
                                                    child: Text(
                                                      valueOrDefault<
                                                          String>(
                                                        containerListarInspeccionesPorIdFichaRowList
                                                            .first
                                                            .nombreLocalColegio,
                                                        'ss',
                                                      ),
                                                      textAlign:
                                                      TextAlign.start,
                                                      style: FlutterFlowTheme
                                                          .of(context)
                                                          .headlineMedium
                                                          .override(
                                                        fontFamily:
                                                        'Outfit',
                                                        color: Colors
                                                            .white,
                                                        fontSize: 25,
                                                        fontWeight:
                                                        FontWeight
                                                            .bold,
                                                      ),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                    MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        valueOrDefault<
                                                            String>(
                                                          containerListarInspeccionesPorIdFichaRowList
                                                              .first
                                                              .departamentoColegio,
                                                          'de',
                                                        ),
                                                        style: FlutterFlowTheme
                                                            .of(context)
                                                            .bodyMedium
                                                            .override(
                                                          fontFamily:
                                                          'Outfit',
                                                          color: FlutterFlowTheme.of(
                                                              context)
                                                              .secondaryBackground,
                                                          fontSize:
                                                          13,
                                                        ),
                                                      ),
                                                      Text(
                                                        '/',
                                                        style: FlutterFlowTheme
                                                            .of(context)
                                                            .bodyMedium
                                                            .override(
                                                          fontFamily:
                                                          'Outfit',
                                                          color: FlutterFlowTheme.of(
                                                              context)
                                                              .secondaryBackground,
                                                        ),
                                                      ),
                                                      Text(
                                                        valueOrDefault<
                                                            String>(
                                                          containerListarInspeccionesPorIdFichaRowList
                                                              .first
                                                              .provinciaColegio,
                                                          'pro',
                                                        ),
                                                        style: FlutterFlowTheme
                                                            .of(context)
                                                            .bodyMedium
                                                            .override(
                                                          fontFamily:
                                                          'Outfit',
                                                          color: FlutterFlowTheme.of(
                                                              context)
                                                              .secondaryBackground,
                                                          fontSize:
                                                          13,
                                                        ),
                                                      ),
                                                      Text(
                                                        '/',
                                                        style: FlutterFlowTheme
                                                            .of(context)
                                                            .bodyMedium
                                                            .override(
                                                          fontFamily:
                                                          'Outfit',
                                                          color: FlutterFlowTheme.of(
                                                              context)
                                                              .secondaryBackground,
                                                        ),
                                                      ),
                                                      Text(
                                                        valueOrDefault<
                                                            String>(
                                                          containerListarInspeccionesPorIdFichaRowList
                                                              .first
                                                              .distritoColegio,
                                                          'dist',
                                                        ),
                                                        style: FlutterFlowTheme
                                                            .of(context)
                                                            .bodyMedium
                                                            .override(
                                                          fontFamily:
                                                          'Outfit',
                                                          color: FlutterFlowTheme.of(
                                                              context)
                                                              .secondaryBackground,
                                                          fontSize:
                                                          13,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    width:
                                                    MediaQuery.sizeOf(
                                                        context)
                                                        .width,
                                                    decoration:
                                                    BoxDecoration(
                                                      color: Color(
                                                          0xFF0E1C27),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0,
                                                          5,
                                                          0,
                                                          0),
                                                      child: Text(
                                                        valueOrDefault<
                                                            String>(
                                                          containerListarInspeccionesPorIdFichaRowList
                                                              .first
                                                              .nombreEvento,
                                                          'envet',
                                                        ),
                                                        style: FlutterFlowTheme
                                                            .of(context)
                                                            .bodyMedium
                                                            .override(
                                                          fontFamily:
                                                          'Outfit',
                                                          color: FlutterFlowTheme.of(
                                                              context)
                                                              .primaryBackground,
                                                          fontSize:
                                                          12,
                                                        ),
                                                      ),
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
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1, 0),
                                child: Container(
                                  width: double.infinity,
                                  height: 55,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .gray200,
                                  ),
                                  child: Padding(
                                    padding:
                                    EdgeInsetsDirectional.fromSTEB(
                                        35, 10, 35, 10),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 130,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(
                                                context)
                                                .gray200,
                                          ),
                                          child: Column(
                                            mainAxisSize:
                                            MainAxisSize.max,
                                            children: [
                                              Align(
                                                alignment:
                                                AlignmentDirectional(
                                                    0, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                  MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0,
                                                          0,
                                                          5,
                                                          0),
                                                      child: Icon(
                                                        Icons
                                                            .sd_card_alert,
                                                        color: () {
                                                          if (containerListarInspeccionesPorIdFichaRowList
                                                              .first
                                                              .idEstado ==
                                                              3) {
                                                            return FlutterFlowTheme.of(
                                                                context)
                                                                .darkSeaGreen;
                                                          } else if (containerListarInspeccionesPorIdFichaRowList
                                                              .first
                                                              .idEstado ==
                                                              2) {
                                                            return FlutterFlowTheme.of(
                                                                context)
                                                                .gray600;
                                                          } else if (containerListarInspeccionesPorIdFichaRowList
                                                              .first
                                                              .estado ==
                                                              '4') {
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
                                                      valueOrDefault<
                                                          String>(
                                                        containerListarInspeccionesPorIdFichaRowList
                                                            .first.estado,
                                                        'es',
                                                      ),
                                                      style: FlutterFlowTheme
                                                          .of(context)
                                                          .bodyMedium,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                EdgeInsetsDirectional
                                                    .fromSTEB(
                                                    14, 0, 0, 0),
                                                child: Text(
                                                  '30/01/2023 10:45 AM',
                                                  style:
                                                  FlutterFlowTheme.of(
                                                      context)
                                                      .bodyMedium
                                                      .override(
                                                    fontFamily:
                                                    'Outfit',
                                                    fontSize: 9,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 130,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(
                                                context)
                                                .gray200,
                                          ),
                                          child: Column(
                                            mainAxisSize:
                                            MainAxisSize.max,
                                            children: [
                                              Align(
                                                alignment:
                                                AlignmentDirectional(
                                                    0, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                  MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0,
                                                          0,
                                                          5,
                                                          0),
                                                      child: Icon(
                                                        Icons
                                                            .sd_card_alert,
                                                        color: () {
                                                          if (containerListarInspeccionesPorIdFichaRowList
                                                              .first
                                                              .idEstado ==
                                                              3) {
                                                            return FlutterFlowTheme.of(
                                                                context)
                                                                .darkSeaGreen;
                                                          } else if (containerListarInspeccionesPorIdFichaRowList
                                                              .first
                                                              .idEstado ==
                                                              2) {
                                                            return FlutterFlowTheme.of(
                                                                context)
                                                                .gray600;
                                                          } else if (containerListarInspeccionesPorIdFichaRowList
                                                              .first
                                                              .idEstado ==
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
                                                      valueOrDefault<
                                                          String>(
                                                        containerListarInspeccionesPorIdFichaRowList
                                                            .first.estado,
                                                        'ssss',
                                                      ),
                                                      style: FlutterFlowTheme
                                                          .of(context)
                                                          .bodyMedium,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                EdgeInsetsDirectional
                                                    .fromSTEB(
                                                    14, 0, 0, 0),
                                                child: Text(
                                                  '30/01/2023 10:45 AM',
                                                  style:
                                                  FlutterFlowTheme.of(
                                                      context)
                                                      .bodyMedium
                                                      .override(
                                                    fontFamily:
                                                    'Outfit',
                                                    fontSize: 9,
                                                  ),
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
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height * 1,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 15, 20, 0),
                      child: FutureBuilder<List<ListarPlantillaSeccionRow>>(
                        future: SQLiteManager.instance.listarPlantillaSeccion(
                          idPlantilla: FFAppState().IdPlantilla,
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
                          final listViewListarPlantillaSeccionRowList =
                          snapshot.data!;
                          return ListView.separated(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            itemCount:
                            listViewListarPlantillaSeccionRowList.length,
                            separatorBuilder: (_, __) => SizedBox(height: 15),
                            itemBuilder: (context, listViewIndex) {
                              final listViewListarPlantillaSeccionRow =
                              listViewListarPlantillaSeccionRowList[
                              listViewIndex];
                              return Align(
                                alignment: AlignmentDirectional(-1, 0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 15),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Align(
                                          alignment: AlignmentDirectional(-1, 0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Color(0xFF086D82),
                                            ),
                                            child: Align(
                                              alignment:
                                              AlignmentDirectional(-1, -1),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsetsDirectional
                                                        .fromSTEB(5, 15, 0, 15),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        listViewListarPlantillaSeccionRow
                                                            .descripcion,
                                                        '0',
                                                      ),
                                                      style: FlutterFlowTheme.of(
                                                          context)
                                                          .titleSmall
                                                          .override(
                                                        fontFamily: 'Outfit',
                                                        color: FlutterFlowTheme
                                                            .of(context)
                                                            .secondaryBackground,
                                                        fontSize: 24,
                                                        fontWeight:
                                                        FontWeight.w600,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        FutureBuilder<
                                            List<ListarSubseccionesRow>>(
                                          future: SQLiteManager.instance
                                              .listarSubsecciones(
                                            idPlantilla: FFAppState().IdPlantilla,
                                            idPlantillaSeccionPadre:
                                            listViewListarPlantillaSeccionRow
                                                .idPlantillaSeccion,
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50,
                                                  height: 50,
                                                  child:
                                                  CircularProgressIndicator(
                                                    valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                      FlutterFlowTheme.of(context)
                                                          .primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            final columnListarSubseccionesRowList =
                                            snapshot.data!;
                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: List.generate(
                                                  columnListarSubseccionesRowList
                                                      .length, (columnIndex) {
                                                final columnListarSubseccionesRow =
                                                columnListarSubseccionesRowList[
                                                columnIndex];
                                                return Align(
                                                  alignment:
                                                  AlignmentDirectional(-1, 0),
                                                  child: Padding(
                                                    padding: EdgeInsetsDirectional
                                                        .fromSTEB(0, 10, 0, 0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                            .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                        AlignmentDirectional(
                                                            -1, 0),
                                                        child: Column(
                                                          mainAxisSize:
                                                          MainAxisSize.max,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                              AlignmentDirectional(
                                                                  -1, 0),
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  columnListarSubseccionesRow
                                                                      .descripcion,
                                                                  'Subseccion',
                                                                ),
                                                                style: FlutterFlowTheme
                                                                    .of(context)
                                                                    .titleMedium
                                                                    .override(
                                                                  fontFamily:
                                                                  'Outfit',
                                                                  fontSize:
                                                                  20,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                                ),
                                                              ),
                                                            ),
                                                            FutureBuilder<
                                                                List<
                                                                    ListarPreguntasRow>>(
                                                              future: SQLiteManager
                                                                  .instance
                                                                  .listarPreguntas(
                                                                idPlantillaSeccion:
                                                                columnListarSubseccionesRow
                                                                    .idPlantillaSeccion,
                                                                idPlantilla:
                                                                columnListarSubseccionesRow
                                                                    .idPlantilla,
                                                              ),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                    SizedBox(
                                                                      width: 50,
                                                                      height: 50,
                                                                      child:
                                                                      CircularProgressIndicator(
                                                                        valueColor:
                                                                        AlwaysStoppedAnimation<
                                                                            Color>(
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                final columnListarPreguntasRowList =
                                                                snapshot
                                                                    .data!;
                                                                return Column(
                                                                  mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                                  children: List.generate(
                                                                      columnListarPreguntasRowList
                                                                          .length,
                                                                          (columnIndex) {
                                                                        final columnListarPreguntasRow =
                                                                        columnListarPreguntasRowList[
                                                                        columnIndex];
                                                                        return Padding(
                                                                          padding: EdgeInsetsDirectional
                                                                              .fromSTEB(
                                                                              0,
                                                                              5,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                          Container(
                                                                            width: double
                                                                                .infinity,
                                                                            decoration:
                                                                            BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context)
                                                                                  .secondaryBackground,
                                                                            ),
                                                                            child:
                                                                            Column(
                                                                              mainAxisSize:
                                                                              MainAxisSize.max,
                                                                              children: [
                                                                                Align(
                                                                                  alignment:
                                                                                  AlignmentDirectional(-1, 0),
                                                                                  child:
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                                                    child: Text(
                                                                                      valueOrDefault<String>(
                                                                                        columnListarPreguntasRow.descripcionPregunta,
                                                                                        'Pregunta',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Outfit',
                                                                                        fontWeight: FontWeight.w600,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Align(
                                                                                  alignment:
                                                                                  AlignmentDirectional(0, 0),
                                                                                  child:
                                                                                  FutureBuilder<List<ListarOpcionesRow>>(
                                                                                    future: SQLiteManager.instance.listarOpciones(
                                                                                      idPlantilla: FFAppState().IdPlantilla,
                                                                                      idPregunta: columnListarPreguntasRow.idPregunta,
                                                                                      idPlantillaSeccion: columnListarPreguntasRow.idPlantillaSeccion,
                                                                                      idFicha: FFAppState().IdFicha
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

                                                                                      final columnListarOpcionesRowList = snapshot.data!;
                                                                                      return Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: List.generate(columnListarOpcionesRowList.length, (columnIndex) {
                                                                                          final columnListarOpcionesRow = columnListarOpcionesRowList[columnIndex];
                                                                                          switch (columnListarOpcionesRow.idTipoOpcion) {
                                                                                            case 1:
                                                                                              if (columnListarOpcionesRow.descripcion is String && columnListarOpcionesRow.idTipoOpcion == 1) {
                                                                                                final opciones = (columnListarOpcionesRow.descripcion as String).split(';');
                                                                                                final respuesta = columnListarOpcionesRow.respuesta;

                                                                                                // Variable para almacenar la posición de la opción seleccionada
                                                                                                int? seleccionActual;

                                                                                                // Variable para almacenar la respuesta actual
                                                                                                String respuestaActual = '';

                                                                                                // Si hay respuesta, encontrar la posición de la opción correspondiente
                                                                                                if (respuesta != null && respuesta.isNotEmpty) {
                                                                                                  final respuestaSplit = respuesta.split(';');
                                                                                                  for (int i = 0; i < respuestaSplit.length; i++) {
                                                                                                    if (respuestaSplit[i] == 'S') {
                                                                                                      seleccionActual = i;
                                                                                                      break;
                                                                                                    }
                                                                                                  }
                                                                                                }

                                                                                                if (respuesta != null) {
                                                                                                  return Column(
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Align(
                                                                                                        alignment: AlignmentDirectional(-1, 0),
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                                                                          child: Container(
                                                                                                            width: double.infinity,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            ),
                                                                                                            child: Column(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: opciones.asMap().entries.map((entry) => Row(
                                                                                                                children: [
                                                                                                                  Radio<int>(
                                                                                                                    value: entry.key,
                                                                                                                    groupValue: seleccionActual,
                                                                                                                    onChanged: (value) {
                                                                                                                      setState(() {
                                                                                                                        // Actualizar la posición de la opción seleccionada
                                                                                                                        seleccionActual = value;

                                                                                                                        // Actualizar la respuesta actual
                                                                                                                        respuestaActual = '';
                                                                                                                        for (int i = 0; i < opciones.length; i++) {
                                                                                                                          respuestaActual += (i == value) ? 'S' : 'N';
                                                                                                                          if (i < opciones.length - 1) {
                                                                                                                            respuestaActual += ';';
                                                                                                                          }
                                                                                                                        }
                                                                                                                        SQLiteManager.instance.actualizarRpta(
                                                                                                                            rpta: respuestaActual,
                                                                                                                            idpregunta: columnListarOpcionesRow.idPregunta!,
                                                                                                                            idplantillaopcion: columnListarOpcionesRow.idPlantillaOpcion!,
                                                                                                                            idplanitllaseccion: columnListarOpcionesRow.idPlantillaSeccion!,
                                                                                                                            idficha: FFAppState().IdFicha
                                                                                                                          // Proporciona los otros parámetros según sea necesario...
                                                                                                                        );
                                                                                                                      });
                                                                                                                    },
                                                                                                                  ),
                                                                                                                  Text(entry.value),
                                                                                                                ],
                                                                                                              )).toList(),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  );
                                                                                                } else {
                                                                                                  return Column(
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Align(
                                                                                                        alignment: AlignmentDirectional(-1, 0),
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                                                                          child: Container(
                                                                                                            width: double.infinity,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            ),
                                                                                                            child: Column(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: opciones.asMap().entries.map((entry) => Row(
                                                                                                                children: [
                                                                                                                  Radio<int>(
                                                                                                                    value: entry.key,
                                                                                                                    groupValue: seleccionActual,
                                                                                                                    onChanged: (value) {
                                                                                                                      setState(() {
                                                                                                                        // Actualizar la posición de la opción seleccionada
                                                                                                                        seleccionActual = value;

                                                                                                                        // Actualizar la respuesta actual
                                                                                                                        respuestaActual = '';
                                                                                                                        for (int i = 0; i < opciones.length; i++) {
                                                                                                                          respuestaActual += (i == value) ? 'S' : 'N';
                                                                                                                          if (i < opciones.length - 1) {
                                                                                                                            respuestaActual += ';';
                                                                                                                          }
                                                                                                                        }
                                                                                                                        print("valor ${respuestaActual}");
                                                                                                                         SQLiteManager.instance.crearRpta(
                                                                                                                            rpta: respuestaActual,
                                                                                                                            idpregunta: columnListarOpcionesRow.idPregunta!,
                                                                                                                            idplantillaopcion: columnListarOpcionesRow.idPlantillaOpcion!,
                                                                                                                            idplanitllaseccion: columnListarOpcionesRow.idPlantillaSeccion!,
                                                                                                                            idficha: FFAppState().IdFicha
                                                                                                                          // Proporciona los otros parámetros según sea necesario...
                                                                                                                        );
                                                                                                                      });
                                                                                                                    },
                                                                                                                  ),
                                                                                                                  Text(entry.value),
                                                                                                                ],
                                                                                                              )).toList(),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  );
                                                                                                }
                                                                                              } else {
                                                                                                // Manejar el caso donde la descripción no es una cadena
                                                                                                return SizedBox.shrink();
                                                                                              }


                                                                                          // Agrega otros casos según sea necesario
                                                                                            case 2:
                                                                                            // Variable para almacenar la respuesta actual
                                                                                              String respuestaActual = '';

                                                                                              // Obtener la respuesta actual (si existe)
                                                                                              final respuesta = columnListarOpcionesRow.respuesta;
                                                                                              if (respuesta != null && respuesta.isNotEmpty) {
                                                                                                respuestaActual = respuesta;
                                                                                              } else {
                                                                                                // Inicializar la respuesta actual con N para todas las opciones
                                                                                                final opciones = (columnListarOpcionesRow.descripcion as String).split(';');
                                                                                                respuestaActual = List.filled(opciones.length, 'N').join(';');
                                                                                              }

                                                                                              if (columnListarOpcionesRow.descripcion is String) {
                                                                                                final opciones = (columnListarOpcionesRow.descripcion as String).split(';');
                                                                                                String? seleccionActual;

                                                                                                // Convertir la respuesta a una lista
                                                                                                final respuestaLista = respuestaActual.split(';');

                                                                                                if(respuesta != null) {
                                                                                                  return Column(
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Align(
                                                                                                        alignment: AlignmentDirectional(-1, 0),
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                                                                          child: Container(
                                                                                                            width: double.infinity,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            ),
                                                                                                            child: Column(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: opciones.asMap().entries.map((entry) {
                                                                                                                final index = entry.key;
                                                                                                                final opcion = entry.value;
                                                                                                                bool isChecked = respuestaLista[index] == 'S'; // Ajuste aquí para obtener la respuesta correcta

                                                                                                                return Row(
                                                                                                                  children: [
                                                                                                                    Checkbox(
                                                                                                                      value: isChecked,
                                                                                                                      onChanged: (value) {
                                                                                                                        setState(() {
                                                                                                                          // Actualizar la respuesta actual
                                                                                                                          respuestaLista[index] = value! ? 'S' : 'N';
                                                                                                                          respuestaActual = respuestaLista.join(';');
                                                                                                                          SQLiteManager.instance.actualizarRpta(
                                                                                                                              rpta: respuestaActual,
                                                                                                                              idpregunta: columnListarOpcionesRow.idPregunta!,
                                                                                                                              idplantillaopcion: columnListarOpcionesRow.idPlantillaOpcion!,
                                                                                                                              idplanitllaseccion: columnListarOpcionesRow.idPlantillaSeccion!,
                                                                                                                              idficha: FFAppState().IdFicha
                                                                                                                            // Proporciona los otros parámetros según sea necesario...
                                                                                                                          );
                                                                                                                        });
                                                                                                                      },
                                                                                                                    ),
                                                                                                                    Text(opcion),
                                                                                                                  ],
                                                                                                                );
                                                                                                              }).toList(),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  );
                                                                                                } else {
                                                                                                  return Column(
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Align(
                                                                                                        alignment: AlignmentDirectional(-1, 0),
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                                                                          child: Container(
                                                                                                            width: double.infinity,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            ),
                                                                                                            child: Column(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: opciones.asMap().entries.map((entry) {
                                                                                                                final index = entry.key;
                                                                                                                final opcion = entry.value;
                                                                                                                bool isChecked = respuestaLista[index] == 'S'; // Ajuste aquí para obtener la respuesta correcta

                                                                                                                return Row(
                                                                                                                  children: [
                                                                                                                    Checkbox(
                                                                                                                      value: isChecked,
                                                                                                                      onChanged: (value) {
                                                                                                                        setState(() {
                                                                                                                          // Actualizar la respuesta actual
                                                                                                                          respuestaLista[index] = value! ? 'S' : 'N';
                                                                                                                          respuestaActual = respuestaLista.join(';');
                                                                                                                          SQLiteManager.instance.crearRpta(
                                                                                                                              rpta: respuestaActual,
                                                                                                                              idpregunta: columnListarOpcionesRow.idPregunta!,
                                                                                                                              idplantillaopcion: columnListarOpcionesRow.idPlantillaOpcion!,
                                                                                                                              idplanitllaseccion: columnListarOpcionesRow.idPlantillaSeccion!,
                                                                                                                              idficha: FFAppState().IdFicha
                                                                                                                            // Proporciona los otros parámetros según sea necesario...
                                                                                                                          );
                                                                                                                        });
                                                                                                                      },
                                                                                                                    ),
                                                                                                                    Text(opcion),
                                                                                                                  ],
                                                                                                                );
                                                                                                              }).toList(),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  );
                                                                                                }
                                                                                              } else {
                                                                                                return SizedBox.shrink(); // Ocultar si la descripción no es una cadena
                                                                                              }



                                                                                          // Caso específico para el tipo de opción 3 (respuesta libre)
                                                                                            case 3:
                                                                                              final respuesta = columnListarOpcionesRow.respuesta;
                                                                                              Timer? _debounce;
                                                                                              if(respuesta != null) {
                                                                                                return Column(
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Align(
                                                                                                      alignment: AlignmentDirectional(-1, 0),
                                                                                                      child: Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                                                                        child: Container(
                                                                                                          width: double.infinity,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                          ),
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                                                                                                                child: Container(
                                                                                                                  width: double.infinity,
                                                                                                                  child: TextField(
                                                                                                                    decoration: InputDecoration(
                                                                                                                      labelText: 'Ingrese su respuesta',
                                                                                                                      border: OutlineInputBorder(),
                                                                                                                    ),
                                                                                                                    controller: TextEditingController(text: respuesta),
                                                                                                                    onChanged: (value)  {
                                                                                                                       SQLiteManager.instance.actualizarRpta(
                                                                                                                          rpta: value,
                                                                                                                          idpregunta: columnListarOpcionesRow.idPregunta!,
                                                                                                                          idplantillaopcion: columnListarOpcionesRow.idPlantillaOpcion!,
                                                                                                                          idplanitllaseccion: columnListarOpcionesRow.idPlantillaSeccion!,
                                                                                                                          idficha: FFAppState().IdFicha
                                                                                                                        // Proporciona los otros parámetros según sea necesario...
                                                                                                                      );
                                                                                                                    },
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                );
                                                                                              } else {
                                                                                                return Column(
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Align(
                                                                                                      alignment: AlignmentDirectional(-1, 0),
                                                                                                      child: Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                                                                        child: Container(
                                                                                                          width: double.infinity,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                          ),
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                                                                                                                child: Container(
                                                                                                                  width: double.infinity,
                                                                                                                  child: TextField(
                                                                                                                    decoration: InputDecoration(
                                                                                                                      labelText: 'Ingrese su respuesta',
                                                                                                                      border: OutlineInputBorder(),
                                                                                                                    ),
                                                                                                                    controller: TextEditingController(text: respuesta),
                                                                                                                    onChanged: (value) {
                                                                                                                      if (_debounce != null && _debounce!.isActive) {
                                                                                                                        _debounce!.cancel(); // Cancela el temporizador anterior si aún está activo
                                                                                                                      }

                                                                                                                      // Crea un nuevo temporizador para esperar 500 milisegundos después de que el usuario termine de escribir
                                                                                                                      _debounce = Timer(Duration(milliseconds: 1000), () {
                                                                                                                        SQLiteManager.instance.crearRpta(
                                                                                                                          rpta: value,
                                                                                                                          idpregunta: columnListarOpcionesRow.idPregunta!,
                                                                                                                          idplantillaopcion: columnListarOpcionesRow.idPlantillaOpcion!,
                                                                                                                          idplanitllaseccion: columnListarOpcionesRow.idPlantillaSeccion!,
                                                                                                                          idficha: FFAppState().IdFicha,
                                                                                                                          // Proporciona los otros parámetros según sea necesario...
                                                                                                                        );
                                                                                                                      });
                                                                                                                    },
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                );
                                                                                              }


                                                                                          // Caso específico para el tipo de opción 4 (lista desplegable)

                                                                                            case 4:
                                                                                              if (columnListarOpcionesRow.descripcion is String) {
                                                                                                // Obtener las opciones y la respuesta
                                                                                                List<String> opciones = (columnListarOpcionesRow.descripcion as String).split(';');
                                                                                                String respuesta = columnListarOpcionesRow.respuesta ?? "";

                                                                                                // Buscar la posición del 'S' en la respuesta
                                                                                                int indexSeleccionado = respuesta.split(';').indexOf('S');

                                                                                                // Inicializar la variable para la posición del valor seleccionado
                                                                                                int posicionSeleccionada = indexSeleccionado;

                                                                                                // Establecer el valor inicial de itemSelec basado en la posición del 'S' en la respuesta
                                                                                                String itemSelec = indexSeleccionado != -1 ? opciones[indexSeleccionado] : opciones[0];

                                                                                                if(respuesta != ""){
                                                                                                  return Column(
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Align(
                                                                                                        alignment: AlignmentDirectional(-1, 0),
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                                                                          child: Container(
                                                                                                            width: double.infinity,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            ),
                                                                                                            child: Column(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                                                                                                                  child: Container(
                                                                                                                    width: double.infinity,
                                                                                                                    child: DropdownButton<String>(
                                                                                                                      value: itemSelec,
                                                                                                                      onChanged: (value) {
                                                                                                                        setState(() {
                                                                                                                          // Actualizar la variable 'posicionSeleccionada'
                                                                                                                          posicionSeleccionada = opciones.indexOf(value!);

                                                                                                                          // Generar la cadena con el formato N;N;S
                                                                                                                          String cadenaFormatoSN = generarCadenaFormatoSN(posicionSeleccionada, opciones);

                                                                                                                          // Almacenar la cadena con el formato N;N;S
                                                                                                                          // Aquí debes agregar el código para almacenar la variable `cadenaFormatoSN`.

                                                                                                                          itemSelec = value!;

                                                                                                                          print(cadenaFormatoSN);
                                                                                                                          SQLiteManager.instance.actualizarRpta(
                                                                                                                              rpta: cadenaFormatoSN,
                                                                                                                              idpregunta: columnListarOpcionesRow.idPregunta!,
                                                                                                                              idplantillaopcion: columnListarOpcionesRow.idPlantillaOpcion!,
                                                                                                                              idplanitllaseccion: columnListarOpcionesRow.idPlantillaSeccion!,
                                                                                                                              idficha: FFAppState().IdFicha
                                                                                                                            // Proporciona los otros parámetros según sea necesario...
                                                                                                                          );
                                                                                                                        });
                                                                                                                      },
                                                                                                                      items: opciones.map<DropdownMenuItem<String>>((opcion) {
                                                                                                                        return DropdownMenuItem<String>(
                                                                                                                          value: opcion,
                                                                                                                          child: Text(opcion),
                                                                                                                        );
                                                                                                                      }).toList(),
                                                                                                                      hint: Text("Seleccionar una opción"), // Agregar el hint aquí
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  );
                                                                                                } else {
                                                                                                  return Column(
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Align(
                                                                                                        alignment: AlignmentDirectional(-1, 0),
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                                                                          child: Container(
                                                                                                            width: double.infinity,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            ),
                                                                                                            child: Column(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                                                                                                                  child: Container(
                                                                                                                    width: double.infinity,
                                                                                                                    child: DropdownButton<String>(
                                                                                                                      value: itemSelec,
                                                                                                                      onChanged: (value) {
                                                                                                                        setState(() {
                                                                                                                          // Actualizar la variable 'posicionSeleccionada'
                                                                                                                          posicionSeleccionada = opciones.indexOf(value!);

                                                                                                                          // Generar la cadena con el formato N;N;S
                                                                                                                          String cadenaFormatoSN = generarCadenaFormatoSN(posicionSeleccionada, opciones);

                                                                                                                          // Almacenar la cadena con el formato N;N;S
                                                                                                                          // Aquí debes agregar el código para almacenar la variable `cadenaFormatoSN`.

                                                                                                                          itemSelec = value!;

                                                                                                                          print(cadenaFormatoSN);
                                                                                                                          SQLiteManager.instance.crearRpta(
                                                                                                                              rpta: cadenaFormatoSN,
                                                                                                                              idpregunta: columnListarOpcionesRow.idPregunta!,
                                                                                                                              idplantillaopcion: columnListarOpcionesRow.idPlantillaOpcion!,
                                                                                                                              idplanitllaseccion: columnListarOpcionesRow.idPlantillaSeccion!,
                                                                                                                              idficha: FFAppState().IdFicha
                                                                                                                            // Proporciona los otros parámetros según sea necesario...
                                                                                                                          );
                                                                                                                        });
                                                                                                                      },
                                                                                                                      items: opciones.map<DropdownMenuItem<String>>((opcion) {
                                                                                                                        return DropdownMenuItem<String>(
                                                                                                                          value: opcion,
                                                                                                                          child: Text(opcion),
                                                                                                                        );
                                                                                                                      }).toList(),
                                                                                                                      hint: Text("Seleccionar una opción"), // Agregar el hint aquí
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  );
                                                                                                }
                                                                                              } else {
                                                                                                // Manejar el caso donde la descripción no es una cadena
                                                                                                return SizedBox.shrink();
                                                                                              }

                                                                                            case 5:
                                                                                              final respuesta = columnListarOpcionesRow.respuesta != null
                                                                                                  ? columnListarOpcionesRow.respuesta!.split('|')
                                                                                                  : List.filled((columnListarOpcionesRow.descripcion as String).split('|').length, ""); // Rellenar con cadenas vacías si no hay respuesta

                                                                                              if (columnListarOpcionesRow.respuesta == null) {
                                                                                                SQLiteManager.instance.crearRpta(
                                                                                                    rpta: "01|02|03",
                                                                                                    idpregunta: columnListarOpcionesRow.idPregunta!,
                                                                                                    idplantillaopcion: columnListarOpcionesRow.idPlantillaOpcion!,
                                                                                                    idplanitllaseccion: columnListarOpcionesRow.idPlantillaSeccion!,
                                                                                                    idficha: FFAppState().IdFicha
                                                                                                  // Proporciona los otros parámetros según sea necesario...
                                                                                                );
                                                                                              }
                                                                                              final opciones = (columnListarOpcionesRow.descripcion as String).split('|');

                                                                                              // Variable para almacenar la lista de valores
                                                                                              List<String> listaValores = respuesta.toList();
                                                                                              Timer? _debounce;
                                                                                              return Column(
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                  Align(
                                                                                                    alignment: AlignmentDirectional(-1, 0),
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                                                                      child: Container(
                                                                                                        width: double.infinity,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                        ),
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: List.generate(opciones.length, (index) {
                                                                                                            return Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                                                                                                              child: Container(
                                                                                                                width: double.infinity,
                                                                                                                child: TextField(
                                                                                                                  decoration: InputDecoration(
                                                                                                                    labelText: opciones[index],
                                                                                                                    hintText: opciones[index],
                                                                                                                    border: OutlineInputBorder(),
                                                                                                                  ),
                                                                                                                  keyboardType: TextInputType.number,
                                                                                                                  onChanged: (value) {
                                                                                                                    if (_debounce?.isActive ?? false) _debounce?.cancel();

                                                                                                                    _debounce = Timer(Duration(milliseconds: 2000), () {
                                                                                                                      setState(() {
                                                                                                                        // Actualizar la variable 'listaValores' solo si el valor ha cambiado
                                                                                                                        if (listaValores[index] != value) {
                                                                                                                          listaValores[index] = value;
                                                                                                                          String cadenaValores = listaValores.join('|');
                                                                                                                          SQLiteManager.instance.actualizarRpta(
                                                                                                                              rpta: cadenaValores,
                                                                                                                              idpregunta: columnListarOpcionesRow.idPregunta!,
                                                                                                                              idplantillaopcion: columnListarOpcionesRow.idPlantillaOpcion!,
                                                                                                                              idplanitllaseccion: columnListarOpcionesRow.idPlantillaSeccion!,
                                                                                                                              idficha: FFAppState().IdFicha
                                                                                                                            // Proporciona los otros parámetros según sea necesario...
                                                                                                                          );
                                                                                                                        }
                                                                                                                      });
                                                                                                                    });
                                                                                                                  },
                                                                                                                  controller: TextEditingController(text: respuesta.length > index ? respuesta[index] : ''), // Asignar el valor de la respuesta al controlador del campo de texto
                                                                                                                ),
                                                                                                              ),
                                                                                                            );
                                                                                                          }),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              );



                                                                                            case 6:
                                                                                              final respuesta = columnListarOpcionesRow.respuesta ?? ""; // Obtener la respuesta o cadena vacía

                                                                                              // Variable para almacenar la fecha y hora seleccionada
                                                                                              DateTime selectedDateTime = respuesta.isNotEmpty
                                                                                                  ? DateTime.parse(respuesta) // Analizar la respuesta existente a DateTime
                                                                                                  : DateTime.now(); // Usar la hora actual como predeterminada

                                                                                              Future<void> _selectDateTime(BuildContext context) async {
                                                                                                final DateTime? picked = await showDatePicker(
                                                                                                  context: context,
                                                                                                  initialDate: selectedDateTime ?? DateTime.now(),
                                                                                                  firstDate: DateTime(2000),
                                                                                                  lastDate: DateTime(2101),
                                                                                                );
                                                                                                if (picked != null) {
                                                                                                  final TimeOfDay? pickedTime = await showTimePicker(
                                                                                                    context: context,
                                                                                                    initialTime: TimeOfDay.fromDateTime(selectedDateTime ?? DateTime.now()),
                                                                                                  );
                                                                                                  if (pickedTime != null) {
                                                                                                    setState(() {
                                                                                                      selectedDateTime = DateTime(picked.year, picked.month, picked.day, pickedTime.hour, pickedTime.minute);
                                                                                                      _dateTimeController.text = DateFormat('yyyy-MM-ddTHH:mm').format(selectedDateTime);
                                                                                                      //print(_dateTimeController.text);
                                                                                                      if(respuesta == ""){
                                                                                                        SQLiteManager.instance.crearRpta(
                                                                                                            rpta:selectedDateTime.toString(),
                                                                                                            idpregunta: columnListarOpcionesRow.idPregunta!,
                                                                                                            idplantillaopcion: columnListarOpcionesRow.idPlantillaOpcion!,
                                                                                                            idplanitllaseccion: columnListarOpcionesRow.idPlantillaSeccion!,
                                                                                                            idficha: FFAppState().IdFicha);
                                                                                                      } else {
                                                                                                        SQLiteManager.instance.actualizarRpta(
                                                                                                            rpta:selectedDateTime.toString(),
                                                                                                            idpregunta: columnListarOpcionesRow.idPregunta!,
                                                                                                            idplantillaopcion: columnListarOpcionesRow.idPlantillaOpcion!,
                                                                                                            idplanitllaseccion: columnListarOpcionesRow.idPlantillaSeccion!,
                                                                                                            idficha: FFAppState().IdFicha
                                                                                                          // Proporciona los otros parámetros según sea necesario...
                                                                                                        );
                                                                                                      }
                                                                                                    });
                                                                                                  }
                                                                                                }
                                                                                              }

                                                                                              String formattedDateTime = selectedDateTime.toIso8601String();


                                                                                              return Column(
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                  Align(
                                                                                                    alignment: AlignmentDirectional(-1, 0),
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                                                                      child: Container(
                                                                                                        width: double.infinity,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                        ),
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                                                                                                              child: Container(
                                                                                                                width: double.infinity,
                                                                                                                child: Row(
                                                                                                                  children: [
                                                                                                                    Expanded(
                                                                                                                      child: GestureDetector(
                                                                                                                        child: TextFormField(
                                                                                                                          controller: TextEditingController(text: respuesta),
                                                                                                                          readOnly: true, // Solo lectura
                                                                                                                          decoration: InputDecoration(
                                                                                                                            labelText: 'Fecha y Hora',
                                                                                                                            hintText: 'Seleccionar fecha y hora',
                                                                                                                            border: OutlineInputBorder(),
                                                                                                                          ),
                                                                                                                          keyboardType: TextInputType.datetime,
                                                                                                                        ),
                                                                                                                        onTap: () {
                                                                                                                          _selectDateTime(context);
                                                                                                                          print(_dateTimeController);
                                                                                                                        },
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    IconButton(
                                                                                                                      onPressed: () {
                                                                                                                        _selectDateTime(context);
                                                                                                                      },
                                                                                                                      icon: Icon(Icons.calendar_today),
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
                                                                                                ],
                                                                                              );


                                                                                            case 7:
                                                                                              final respuesta = columnListarOpcionesRow.respuesta != null
                                                                                                  ? "${columnListarOpcionesRow.respuesta}"
                                                                                                  : "";

                                                                                              String? Rptadate = '';
                                                                                              Future<void> _selectDate(BuildContext context) async {
                                                                                                final DateTime? picked = await showDatePicker(
                                                                                                  context: context,
                                                                                                  initialDate: selectedDate ?? DateTime.now(),
                                                                                                  firstDate: DateTime(2000),
                                                                                                  lastDate: DateTime(2101),
                                                                                                );
                                                                                                if (picked != null && picked != selectedDate) {
                                                                                                  setState(() {
                                                                                                    selectedDate = picked;

                                                                                                    Rptadate = '${picked.day}/${picked.month}/${picked.year}';
                                                                                                    if(respuesta == ""){
                                                                                                      SQLiteManager.instance.crearRpta(
                                                                                                          rpta:Rptadate,
                                                                                                          idpregunta: columnListarOpcionesRow.idPregunta!,
                                                                                                          idplantillaopcion: columnListarOpcionesRow.idPlantillaOpcion!,
                                                                                                          idplanitllaseccion: columnListarOpcionesRow.idPlantillaSeccion!,
                                                                                                          idficha: FFAppState().IdFicha);
                                                                                                    } else {
                                                                                                      SQLiteManager.instance.actualizarRpta(
                                                                                                          rpta:Rptadate,
                                                                                                          idpregunta: columnListarOpcionesRow.idPregunta!,
                                                                                                          idplantillaopcion: columnListarOpcionesRow.idPlantillaOpcion!,
                                                                                                          idplanitllaseccion: columnListarOpcionesRow.idPlantillaSeccion!,
                                                                                                          idficha: FFAppState().IdFicha
                                                                                                        // Proporciona los otros parámetros según sea necesario...
                                                                                                      );
                                                                                                    }
                                                                                                  });
                                                                                                  // Actualizar el valor del campo de texto
                                                                                                  //_dateController.text = '${picked.day}/${picked.month}/${picked.year}';
                                                                                                }
                                                                                              }

                                                                                              return Column(
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                  Align(
                                                                                                    alignment: AlignmentDirectional(-1, 0),
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                                                                      child: Container(
                                                                                                        width: double.infinity,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                        ),
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                                                                                                              child: Container(
                                                                                                                width: double.infinity,
                                                                                                                child: Row(
                                                                                                                  children: [
                                                                                                                    Expanded(
                                                                                                                      child: GestureDetector(
                                                                                                                        onTap: () {
                                                                                                                          _selectDate(context);
                                                                                                                        },
                                                                                                                        child: TextFormField(
                                                                                                                          controller: TextEditingController(text: Rptadate),
                                                                                                                          readOnly: true,
                                                                                                                          decoration: InputDecoration(
                                                                                                                            labelText: respuesta,
                                                                                                                            hintText: selectedDate != null
                                                                                                                                ? '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'
                                                                                                                                : 'Seleccionar',
                                                                                                                            border: OutlineInputBorder(),
                                                                                                                          ),
                                                                                                                          keyboardType: TextInputType.datetime,
                                                                                                                          onChanged: (value) {
                                                                                                                            // Implementa la lógica para manejar el cambio en el valor del campo de texto
                                                                                                                          },
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    IconButton(
                                                                                                                      onPressed: () {
                                                                                                                        _selectDate(context);
                                                                                                                      },
                                                                                                                      icon: Icon(Icons.calendar_today),
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
                                                                                                ],
                                                                                              );

                                                                                            case 8:
                                                                                              final respuesta = columnListarOpcionesRow.respuesta != null
                                                                                                  ? "${columnListarOpcionesRow.respuesta}"
                                                                                                  : "";

                                                                                              String? RptaHora = '';
                                                                                              Future<void> _selectTime(BuildContext context) async {
                                                                                                final TimeOfDay? picked = await showTimePicker(
                                                                                                  context: context,
                                                                                                  initialTime: selectedTime ?? TimeOfDay.now(),
                                                                                                );
                                                                                                if (picked != null && picked != selectedTime) {
                                                                                                  setState(() {
                                                                                                    selectedTime = picked;
                                                                                                    // Actualiza el valor del controlador con la hora seleccionada
                                                                                                    RptaHora = '${picked.hour}:${picked.minute}';
                                                                                                    if(respuesta == ""){
                                                                                                      SQLiteManager.instance.crearRpta(
                                                                                                          rpta:RptaHora,
                                                                                                          idpregunta: columnListarOpcionesRow.idPregunta!,
                                                                                                          idplantillaopcion: columnListarOpcionesRow.idPlantillaOpcion!,
                                                                                                          idplanitllaseccion: columnListarOpcionesRow.idPlantillaSeccion!,
                                                                                                          idficha: FFAppState().IdFicha);
                                                                                                    } else {
                                                                                                      SQLiteManager.instance.actualizarRpta(
                                                                                                          rpta:RptaHora,
                                                                                                          idpregunta: columnListarOpcionesRow.idPregunta!,
                                                                                                          idplantillaopcion: columnListarOpcionesRow.idPlantillaOpcion!,
                                                                                                          idplanitllaseccion: columnListarOpcionesRow.idPlantillaSeccion!,
                                                                                                          idficha: FFAppState().IdFicha
                                                                                                        // Proporciona los otros parámetros según sea necesario...
                                                                                                      );
                                                                                                    }
                                                                                                  });
                                                                                                }
                                                                                              }

                                                                                              return Column(
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                  Align(
                                                                                                    alignment: AlignmentDirectional(-1, 0),
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                                                                      child: Container(
                                                                                                        width: double.infinity,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                        ),
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                                                                                                              child: Container(
                                                                                                                width: double.infinity,
                                                                                                                child: Row(
                                                                                                                  children: [
                                                                                                                    Expanded(
                                                                                                                      child: GestureDetector(
                                                                                                                        onTap: () {
                                                                                                                          _selectTime(context); // Mostrar el selector de hora al hacer clic
                                                                                                                        },
                                                                                                                        child: TextFormField(
                                                                                                                          controller: _timeController,
                                                                                                                          readOnly: true,
                                                                                                                          decoration: InputDecoration(
                                                                                                                            labelText: respuesta,
                                                                                                                            hintText: selectedTime != null
                                                                                                                                ? '${selectedTime!.hour}:${selectedTime!.minute}'
                                                                                                                                : 'Seleccionar hora',
                                                                                                                            border: OutlineInputBorder(),
                                                                                                                          ),
                                                                                                                          keyboardType: TextInputType.datetime,
                                                                                                                          onChanged: (value) {
                                                                                                                            // Implementa la lógica para manejar el cambio en el valor del campo de texto
                                                                                                                          },
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    IconButton(
                                                                                                                      onPressed: () {
                                                                                                                        _selectTime(context); // Mostrar el selector de hora al hacer clic en el icono
                                                                                                                      },
                                                                                                                      icon: Icon(Icons.access_time),
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
                                                                                                ],
                                                                                              );

                                                                                            case 9:
                                                                                              final respuesta = columnListarOpcionesRow.respuesta != null
                                                                                                  ? "${columnListarOpcionesRow.respuesta}"
                                                                                                  : "";
                                                                                              Timer? _debounce;
                                                                                              if(respuesta != "") {
                                                                                                return Column(
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Align(
                                                                                                      alignment: AlignmentDirectional(-1, 0),
                                                                                                      child: Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                                                                        child: Container(
                                                                                                          width: double.infinity,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                          ),
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Text("Respuesta9: ${respuesta}"),
                                                                                                              Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                                                                                                                child: Container(
                                                                                                                  width: double.infinity,
                                                                                                                  child: TextField(
                                                                                                                    controller: TextEditingController(text: respuesta),
                                                                                                                    keyboardType: TextInputType.number,
                                                                                                                    inputFormatters: <TextInputFormatter>[
                                                                                                                      FilteringTextInputFormatter.digitsOnly // Esto permite solo números
                                                                                                                    ],
                                                                                                                    onChanged: (value) {
                                                                                                                      SQLiteManager.instance.actualizarRpta(
                                                                                                                          rpta: value,
                                                                                                                          idpregunta: columnListarOpcionesRow.idPregunta!,
                                                                                                                          idplantillaopcion: columnListarOpcionesRow.idPlantillaOpcion!,
                                                                                                                          idplanitllaseccion: columnListarOpcionesRow.idPlantillaSeccion!,
                                                                                                                          idficha: FFAppState().IdFicha
                                                                                                                        // Proporciona los otros parámetros según sea necesario...
                                                                                                                      );
                                                                                                                    },
                                                                                                                    decoration: InputDecoration(
                                                                                                                      hintText: 'Ingrese un número', // Hint para indicar al usuario qué debe ingresar
                                                                                                                      border: OutlineInputBorder(), // Borde del TextField
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                );
                                                                                              } else {
                                                                                                return Column(
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    // Mostrar la respuesta en alguna parte
                                                                                                    Text("Respuesta9: ${respuesta}"),
                                                                                                    Align(
                                                                                                      alignment: AlignmentDirectional(-1, 0),
                                                                                                      child: Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                                                                        child: Container(
                                                                                                          width: double.infinity,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                          ),
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                                                                                                                child: Container(
                                                                                                                  width: double.infinity,
                                                                                                                  child: TextField(
                                                                                                                    controller: TextEditingController(text: respuesta),
                                                                                                                    keyboardType: TextInputType.number,
                                                                                                                    inputFormatters: <TextInputFormatter>[
                                                                                                                      FilteringTextInputFormatter.digitsOnly // Esto permite solo números
                                                                                                                    ],
                                                                                                                    onChanged: (value) {
                                                                                                                      if (_debounce?.isActive ?? false) _debounce!.cancel(); // Cancela el temporizador activo si existe
                                                                                                                      // Crea un nuevo temporizador para ejecutar la llamada después de un cierto tiempo (por ejemplo, 500 milisegundos)
                                                                                                                      _debounce = Timer(Duration(milliseconds: 2000), () {
                                                                                                                        SQLiteManager.instance.crearRpta(
                                                                                                                            rpta: value,
                                                                                                                            idpregunta: columnListarOpcionesRow.idPregunta!,
                                                                                                                            idplantillaopcion: columnListarOpcionesRow.idPlantillaOpcion!,
                                                                                                                            idplanitllaseccion: columnListarOpcionesRow.idPlantillaSeccion!,
                                                                                                                            idficha: FFAppState().IdFicha
                                                                                                                          // Proporciona los otros parámetros según sea necesario...
                                                                                                                        );
                                                                                                                      });
                                                                                                                    },
                                                                                                                    decoration: InputDecoration(
                                                                                                                      hintText: 'Ingrese un número', // Hint para indicar al usuario qué debe ingresar
                                                                                                                      border: OutlineInputBorder(), // Borde del TextField
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                );
                                                                                              }



                                                                                            case 10:
                                                                                              final respuesta = columnListarOpcionesRow.respuesta != null
                                                                                                  ? columnListarOpcionesRow.respuesta!.split('|')
                                                                                                  : List.filled((columnListarOpcionesRow.descripcion as String).split('|').length, ""); // Rellenar con cadenas vacías si no hay respuesta

                                                                                              if (columnListarOpcionesRow.respuesta == null) {
                                                                                                SQLiteManager.instance.crearRpta(
                                                                                                    rpta: "01|02|03",
                                                                                                    idpregunta: columnListarOpcionesRow.idPregunta!,
                                                                                                    idplantillaopcion: columnListarOpcionesRow.idPlantillaOpcion!,
                                                                                                    idplanitllaseccion: columnListarOpcionesRow.idPlantillaSeccion!,
                                                                                                    idficha: FFAppState().IdFicha
                                                                                                  // Proporciona los otros parámetros según sea necesario...
                                                                                                );
                                                                                              }
                                                                                              final opciones = (columnListarOpcionesRow.descripcion as String).split('|');

                                                                                              // Variable para almacenar la lista de valores
                                                                                              List<String> listaValores = respuesta.toList();
                                                                                              Timer? _debounce;
                                                                                              return Column(
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                  Align(
                                                                                                    alignment: AlignmentDirectional(-1, 0),
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                                                                      child: Container(
                                                                                                        width: double.infinity,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                        ),
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: List.generate(opciones.length, (index) {
                                                                                                            return Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                                                                                                              child: Container(
                                                                                                                width: double.infinity,
                                                                                                                child: TextField(
                                                                                                                  decoration: InputDecoration(
                                                                                                                    labelText: opciones[index],
                                                                                                                    hintText: opciones[index],
                                                                                                                    border: OutlineInputBorder(),
                                                                                                                  ),
                                                                                                                  keyboardType: TextInputType.number,
                                                                                                                  onChanged: (value) {
                                                                                                                    if (_debounce?.isActive ?? false) _debounce?.cancel();

                                                                                                                    _debounce = Timer(Duration(milliseconds: 2000), () {
                                                                                                                      setState(() {
                                                                                                                        // Actualizar la variable 'listaValores' solo si el valor ha cambiado
                                                                                                                        if (listaValores[index] != value) {
                                                                                                                          listaValores[index] = value;
                                                                                                                          String cadenaValores = listaValores.join('|');
                                                                                                                          SQLiteManager.instance.actualizarRpta(
                                                                                                                              rpta: cadenaValores,
                                                                                                                              idpregunta: columnListarOpcionesRow.idPregunta!,
                                                                                                                              idplantillaopcion: columnListarOpcionesRow.idPlantillaOpcion!,
                                                                                                                              idplanitllaseccion: columnListarOpcionesRow.idPlantillaSeccion!,
                                                                                                                              idficha: FFAppState().IdFicha
                                                                                                                            // Proporciona los otros parámetros según sea necesario...
                                                                                                                          );
                                                                                                                        }
                                                                                                                      });
                                                                                                                    });
                                                                                                                  },
                                                                                                                  controller: TextEditingController(text: respuesta.length > index ? respuesta[index] : ''), // Asignar el valor de la respuesta al controlador del campo de texto
                                                                                                                ),
                                                                                                              ),
                                                                                                            );
                                                                                                          }),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              );


                                                                                            case 11:
                                                                                              if (columnListarOpcionesRow.descripcion is String) {
                                                                                                final respuesta = columnListarOpcionesRow.respuesta != null
                                                                                                    ? "Respuesta11: ${columnListarOpcionesRow.respuesta}"
                                                                                                    : "Respuesta11: (No hay respuesta)";
                                                                                                final opcionesPorEtiqueta = (columnListarOpcionesRow.descripcion as String).split('|');
                                                                                                return Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                                                                                                  child: SingleChildScrollView(
                                                                                                    scrollDirection: Axis.horizontal,
                                                                                                    child: Row(
                                                                                                      children: opcionesPorEtiqueta.map<Widget>((opcionesEtiqueta) {
                                                                                                        final partes = opcionesEtiqueta.split('#');
                                                                                                        final etiqueta = partes[0];
                                                                                                        final opciones = partes[1].split(';');

                                                                                                        return Padding(
                                                                                                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                                                                                                          child: Column(
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              // Mostrar la respuesta en alguna parte
                                                                                                              Text("Respuesta: ${respuesta}"),
                                                                                                              Text(etiqueta), // Mostrar la etiqueta
                                                                                                              DropdownButton<String>(
                                                                                                                value: selectedValuesss[etiqueta], // Obtener el valor seleccionado
                                                                                                                onChanged: (value) {
                                                                                                                  // Actualizar el valor seleccionado en el estado
                                                                                                                  setState(() {
                                                                                                                    selectedValuesss[etiqueta] = value;
                                                                                                                  });
                                                                                                                },
                                                                                                                items: opciones.map<DropdownMenuItem<String>>((String value) {
                                                                                                                  return DropdownMenuItem<String>(
                                                                                                                    value: value,
                                                                                                                    child: Text(value),
                                                                                                                  );
                                                                                                                }).toList(),
                                                                                                                hint: Text("Seleccionar una opción"),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        );
                                                                                                      }).toList(),
                                                                                                    ),
                                                                                                  ),
                                                                                                );
                                                                                              } else {
                                                                                                // Manejar el caso donde la descripción no es una cadena
                                                                                                return SizedBox.shrink();
                                                                                              }

                                                                                            case 12:
                                                                                              if (columnListarOpcionesRow.descripcion is String) {
                                                                                                final opciones = (columnListarOpcionesRow.descripcion as String).split('|');
                                                                                                final respuesta = columnListarOpcionesRow.respuesta != null
                                                                                                    ? "Respuesta: ${columnListarOpcionesRow.respuesta}"
                                                                                                    : "Respuesta: (No hay respuesta)";
                                                                                                // Unir las opciones con saltos de línea
                                                                                                final texto = opciones.join('\n');

                                                                                                return Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                                                                                                  child: Column(
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      // Mostrar la respuesta en alguna parte
                                                                                                      Text("Respuesta12: ${respuesta}"),
                                                                                                      TextField(
                                                                                                        keyboardType: TextInputType.multiline,
                                                                                                        maxLines: null,
                                                                                                        onChanged: (value) {
                                                                                                          // Aquí puedes manejar los cambios en el valor del TextField
                                                                                                        },
                                                                                                        decoration: InputDecoration(
                                                                                                          hintText: texto, // Mostrar el texto como hint
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                );
                                                                                              } else {
                                                                                                // Manejar el caso donde la descripción no es una cadena
                                                                                                return SizedBox.shrink();
                                                                                              }


                                                                                          // Agrega más casos según sea necesario
                                                                                          default:
                                                                                          // Si el tipo de opción no coincide con ningún caso, no se muestra nada
                                                                                            return
                                                                                        Align(
                                                                                        alignment: AlignmentDirectional(-1, 0),
                                                                                        child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                        child: Text(
                                                                                        valueOrDefault<String>(
                                                                                        columnListarOpcionesRow.tipoOpcion,
                                                                                        'opciones',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                        ),
                                                                                        ),
                                                                                        );
                                                                                        }
                                                                                        // Agregamos un retorno por defecto para asegurar que siempre se devuelva un widget
                                                                                        return Align(
                                                                                          alignment: AlignmentDirectional(-1, 0),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                            child: Text(
                                                                                              valueOrDefault<String>(
                                                                                                columnListarOpcionesRow.tipoOpcion,
                                                                                                'opciones',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      }),
                                                                                    );

                                                                                  },
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }),
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class ChangeRpta {
  String? rpta;
  int? idficha;
  int? idplantilla;
  int? idpregunta;
  int? idplantillaseccion;
  ChangeRpta({
    required this.rpta,
    required this.idficha,
    required this.idplantilla,
    required this.idpregunta,
    required this.idplantillaseccion
  });
}

void actualizarFichaMod({
  required String rpta,
  required int idficha,
  required int idplantilla,
  required int idpregunta,
  required int idplantillaseccion,
  // Agrega otros parámetros según sea necesario...
}) async {
  await SQLiteManager.instance.actualizarRpta(
      rpta: rpta,
      idpregunta: idpregunta,
      idplantillaopcion: idplantilla,
      idplanitllaseccion: idplantillaseccion,
      idficha: idficha
    // Proporciona los otros parámetros según sea necesario...
  );
}




String generarCadenaFormatoSN(int posicionSeleccionada, List<String> opciones) {
  List<String> listaSN = List.filled(opciones.length, 'N');
  listaSN[posicionSeleccionada] = 'S';
  return listaSN.join(';');
}
