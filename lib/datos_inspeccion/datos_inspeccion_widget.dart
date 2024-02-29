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
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
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
                                  height: 55,
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
                                                              .first.estado ==
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
                                              Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(
                                                    14, 0, 0, 0),
                                                child: Text(
                                                  '30/01/2023 10:45 AM',
                                                  style: FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                    fontFamily: 'Outfit',
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
                                                        'ssss',
                                                      ),
                                                      style: FlutterFlowTheme.of(context)
                                                          .bodyMedium,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(
                                                    14, 0, 0, 0),
                                                child: Text(
                                                  '30/01/2023 10:45 AM',
                                                  style: FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                    fontFamily: 'Outfit',
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
                // Generated code for this Container Widget...
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height * 0.7,
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
                        final listViewListarPlantillaSeccionRowList = snapshot.data!;
                        return ListView.separated(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewListarPlantillaSeccionRowList.length,
                          separatorBuilder: (_, __) => SizedBox(height: 15),
                          itemBuilder: (context, listViewIndex) {
                            final listViewListarPlantillaSeccionRow =
                            listViewListarPlantillaSeccionRowList[listViewIndex];
                            return Align(
                              alignment: AlignmentDirectional(-1, 0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
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
                                            alignment: AlignmentDirectional(-1, -1),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional.fromSTEB(
                                                      5, 15, 0, 15),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      listViewListarPlantillaSeccionRow
                                                          .descripcion,
                                                      '0',
                                                    ),
                                                    style: FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                      fontFamily: 'Outfit',
                                                      color: FlutterFlowTheme.of(context)
                                                          .secondaryBackground,
                                                      fontSize: 24,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      FutureBuilder<List<ListarSubseccionesRow>>(
                                        future: SQLiteManager.instance.listarSubsecciones(
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
                                                child: CircularProgressIndicator(
                                                  valueColor: AlwaysStoppedAnimation<Color>(
                                                    FlutterFlowTheme.of(context).primary,
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
                                                columnListarSubseccionesRowList.length,
                                                    (columnIndex) {
                                                  final columnListarSubseccionesRow =
                                                  columnListarSubseccionesRowList[
                                                  columnIndex];
                                                  return Align(
                                                    alignment: AlignmentDirectional(-1, 0),
                                                    child: Padding(
                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                          0, 10, 0, 0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration: BoxDecoration(
                                                          color: FlutterFlowTheme.of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Align(
                                                          alignment: AlignmentDirectional(-1, 0),
                                                          child: Column(
                                                            mainAxisSize: MainAxisSize.max,
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                AlignmentDirectional(-1, 0),
                                                                child: Text(
                                                                  valueOrDefault<String>(
                                                                    columnListarSubseccionesRow
                                                                        .descripcion,
                                                                    'Subseccion',
                                                                  ),
                                                                  style:
                                                                  FlutterFlowTheme.of(context)
                                                                      .titleMedium
                                                                      .override(
                                                                    fontFamily: 'Outfit',
                                                                    fontSize: 20,
                                                                    fontWeight:
                                                                    FontWeight.bold,
                                                                  ),
                                                                ),
                                                              ),
                                                              FutureBuilder<
                                                                  List<ListarPreguntasRow>>(
                                                                future: SQLiteManager.instance
                                                                    .listarPreguntas(
                                                                  idPlantillaSeccion:
                                                                  columnListarSubseccionesRow
                                                                      .idPlantillaSeccion,
                                                                  idPlantilla:
                                                                  columnListarSubseccionesRow
                                                                      .idPlantilla,
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
                                                                            FlutterFlowTheme.of(
                                                                                context)
                                                                                .primary,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  final columnListarPreguntasRowList =
                                                                  snapshot.data!;
                                                                  return Column(
                                                                    mainAxisSize:
                                                                    MainAxisSize.max,
                                                                    children: List.generate(
                                                                        columnListarPreguntasRowList
                                                                            .length,
                                                                            (columnIndex) {
                                                                          final columnListarPreguntasRow =
                                                                          columnListarPreguntasRowList[
                                                                          columnIndex];
                                                                          return Padding(
                                                                            padding:
                                                                            EdgeInsetsDirectional
                                                                                .fromSTEB(
                                                                                0, 5, 0, 0),
                                                                            child: Container(
                                                                              width: double.infinity,
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
                                                                                          10,
                                                                                          0,
                                                                                          0,
                                                                                          0),
                                                                                      child: Text(
                                                                                        valueOrDefault<
                                                                                            String>(
                                                                                          columnListarPreguntasRow
                                                                                              .descripcionPregunta,
                                                                                          'Pregunta',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(
                                                                                            context)
                                                                                            .bodyMedium
                                                                                            .override(
                                                                                          fontFamily:
                                                                                          'Outfit',
                                                                                          fontWeight:
                                                                                          FontWeight.w600,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Align(
                                                                                    alignment:
                                                                                    AlignmentDirectional(
                                                                                        0, 0),
                                                                                    child: FutureBuilder<
                                                                                        List<
                                                                                            ListarOpcionesRow>>(
                                                                                      future: SQLiteManager
                                                                                          .instance
                                                                                          .listarOpciones(
                                                                                        idPlantilla:
                                                                                        FFAppState()
                                                                                            .IdPlantilla,
                                                                                        idPregunta:
                                                                                        columnListarPreguntasRow
                                                                                            .idPregunta,
                                                                                        idPlantillaSeccion:
                                                                                        columnListarPreguntasRow
                                                                                            .idPlantillaSeccion,
                                                                                      ),
                                                                                      builder: (context,
                                                                                          snapshot) {
                                                                                        // Customize what your widget looks like when it's loading.
                                                                                        if (!snapshot
                                                                                            .hasData) {
                                                                                          return Center(
                                                                                            child:
                                                                                            SizedBox(
                                                                                              width:
                                                                                              50,
                                                                                              height:
                                                                                              50,
                                                                                              child:
                                                                                              CircularProgressIndicator(
                                                                                                valueColor:
                                                                                                AlwaysStoppedAnimation<Color>(
                                                                                                  FlutterFlowTheme.of(context).primary,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        }
                                                                                        final columnListarOpcionesRowList =
                                                                                        snapshot
                                                                                            .data!;
                                                                                        return Column(
                                                                                          mainAxisSize:
                                                                                          MainAxisSize
                                                                                              .max,
                                                                                          children: List.generate(
                                                                                              columnListarOpcionesRowList
                                                                                                  .length,
                                                                                                  (columnIndex) {
                                                                                                final columnListarOpcionesRow =
                                                                                                columnListarOpcionesRowList[
                                                                                                columnIndex];
                                                                                                return Align(
                                                                                                  alignment: AlignmentDirectional(
                                                                                                      -1,
                                                                                                      0),
                                                                                                  child:
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(
                                                                                                        0,
                                                                                                        5,
                                                                                                        0,
                                                                                                        0),
                                                                                                    child:
                                                                                                    Container(
                                                                                                      width:
                                                                                                      double.infinity,
                                                                                                      decoration:
                                                                                                      BoxDecoration(
                                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                      ),
                                                                                                      child:
                                                                                                      Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
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
                                                                                                          ),
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                                                                                                            child: Container(
                                                                                                              width: double.infinity,
                                                                                                              child: TextFormField(
                                                                                                                controller: _model.dat1Controller,
                                                                                                                focusNode: _model.dat1FocusNode,
                                                                                                                autofocus: true,
                                                                                                                autofillHints: [
                                                                                                                  AutofillHints.birthday
                                                                                                                ],
                                                                                                                obscureText: false,
                                                                                                                decoration: InputDecoration(
                                                                                                                  labelText: 'En desarrollo',
                                                                                                                  labelStyle: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                    fontFamily: 'Outfit',
                                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                  ),
                                                                                                                  enabledBorder: OutlineInputBorder(
                                                                                                                    borderSide: BorderSide(
                                                                                                                      color: Color(0xFF2C313E),
                                                                                                                      width: 0.5,
                                                                                                                    ),
                                                                                                                    borderRadius: BorderRadius.circular(12),
                                                                                                                  ),
                                                                                                                  focusedBorder: OutlineInputBorder(
                                                                                                                    borderSide: BorderSide(
                                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                                      width: 0.5,
                                                                                                                    ),
                                                                                                                    borderRadius: BorderRadius.circular(12),
                                                                                                                  ),
                                                                                                                  errorBorder: OutlineInputBorder(
                                                                                                                    borderSide: BorderSide(
                                                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                                                      width: 0.5,
                                                                                                                    ),
                                                                                                                    borderRadius: BorderRadius.circular(12),
                                                                                                                  ),
                                                                                                                  focusedErrorBorder: OutlineInputBorder(
                                                                                                                    borderSide: BorderSide(
                                                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                                                      width: 0.5,
                                                                                                                    ),
                                                                                                                    borderRadius: BorderRadius.circular(12),
                                                                                                                  ),
                                                                                                                  filled: true,
                                                                                                                  fillColor: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                                                ),
                                                                                                                style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                                  fontFamily: 'Outfit',
                                                                                                                  fontSize: 13,
                                                                                                                  fontWeight: FontWeight.w300,
                                                                                                                ),
                                                                                                                validator: _model.dat1ControllerValidator.asValidator(context),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
