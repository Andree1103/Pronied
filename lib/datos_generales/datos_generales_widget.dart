import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'datos_generales_model.dart';
export 'datos_generales_model.dart';

class DatosGeneralesWidget extends StatefulWidget {
  const DatosGeneralesWidget({super.key});

  @override
  State<DatosGeneralesWidget> createState() => _DatosGeneralesWidgetState();
}

class _DatosGeneralesWidgetState extends State<DatosGeneralesWidget>
    with TickerProviderStateMixin {
  late DatosGeneralesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DatosGeneralesModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 4,
      initialIndex: 0,
    )..addListener(() => setState(() {}));

    _model.dat1FocusNode1 ??= FocusNode();

    _model.dat1FocusNode2 ??= FocusNode();

    _model.dat1FocusNode3 ??= FocusNode();

    _model.dat1FocusNode4 ??= FocusNode();

    _model.dat1FocusNode5 ??= FocusNode();

    _model.dat1FocusNode6 ??= FocusNode();

    _model.dat1FocusNode7 ??= FocusNode();

    _model.dat1FocusNode8 ??= FocusNode();

    _model.dat1FocusNode9 ??= FocusNode();

    _model.dat1FocusNode10 ??= FocusNode();

    _model.dat1FocusNode11 ??= FocusNode();

    _model.dat1FocusNode12 ??= FocusNode();

    _model.dat1FocusNode13 ??= FocusNode();

    _model.dat1FocusNode14 ??= FocusNode();

    _model.dat1FocusNode15 ??= FocusNode();

    _model.dat1FocusNode16 ??= FocusNode();

    _model.dat1FocusNode17 ??= FocusNode();

    _model.dat1FocusNode18 ??= FocusNode();

    _model.dat1FocusNode19 ??= FocusNode();

    _model.dat1FocusNode20 ??= FocusNode();

    _model.dat1FocusNode21 ??= FocusNode();

    _model.dat1FocusNode22 ??= FocusNode();

    _model.dat1FocusNode23 ??= FocusNode();

    _model.dat1FocusNode24 ??= FocusNode();

    _model.dat1FocusNode25 ??= FocusNode();

    _model.dat1FocusNode26 ??= FocusNode();

    _model.dat1FocusNode27 ??= FocusNode();

    _model.dat1FocusNode28 ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }


  List<FichaModularData> fichasModularesData = [];

  List<TextEditingController> codDigoControllers = [];
  List<TextEditingController> turnoControllers = [];
  List<TextEditingController> tipoDocenteControllers = [];
  List<TextEditingController> numeroAlumnosControllers = [];



  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<ListarFichaPorIdFichaRow>>(
      future: SQLiteManager.instance.listarFichaPorIdFicha(
        idFicha: FFAppState().IdFicha,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Color(0xFF0E1C27),
            body: Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final datosGeneralesListarFichaPorIdFichaRowList = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Color(0xFF0E1C27),
            body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
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
                                              25, 0, 0, 5),
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
                                                                    1000),
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
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1, -1),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(20, 0, 20, 0),
                                                  child: Column(
                                                    mainAxisSize:
                                                    MainAxisSize.max,
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
                                                            .fromSTEB(
                                                            0, 0, 0, 5),
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
                                                              fontSize: 13,
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
                                                              fontSize: 13,
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
                                                              fontSize: 13,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Container(
                                                        width: 278,
                                                        decoration:
                                                        BoxDecoration(
                                                          color:
                                                          Color(0xFF0E1C27),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(0,
                                                              5, 0, 0),
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
                        child: Align(
                          alignment: AlignmentDirectional(-1, -1),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width,
                            height: MediaQuery.sizeOf(context).height * 1,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(20, 15, 20, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Flexible(
                                    child: Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment(-1, 0),
                                            child: FlutterFlowButtonTabBar(
                                              useToggleButtonStyle: true,
                                              isScrollable: true,
                                              labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLarge,
                                              unselectedLabelStyle: TextStyle(),
                                              labelColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBtnText,
                                              unselectedLabelColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBtnText,
                                              backgroundColor:
                                              Color(0xFF086D82),
                                              unselectedBackgroundColor:
                                              Color(0xFF0E1C27),
                                              borderColor: Color(0xFF0E1C27),
                                              unselectedBorderColor:
                                              Color(0xFF0E1C27),
                                              borderWidth: 0,
                                              borderRadius: 8,
                                              elevation: 1,
                                              labelPadding:
                                              EdgeInsetsDirectional
                                                  .fromSTEB(16, 0, 16, 0),
                                              buttonMargin:
                                              EdgeInsetsDirectional
                                                  .fromSTEB(16, 8, 0, 8),
                                              tabs: [
                                                Tab(
                                                  text: 'Informacion General',
                                                ),
                                                Tab(
                                                  text: 'Niveles',
                                                ),
                                                Tab(
                                                  text: 'Director',
                                                ),
                                                Tab(
                                                  text: 'Inspección',
                                                ),
                                              ],
                                              controller:
                                              _model.tabBarController,
                                              onTap: (i) async {
                                                [
                                                      () async {},
                                                      () async {},
                                                      () async {},
                                                      () async {}
                                                ][i]();
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: TabBarView(
                                              controller:
                                              _model.tabBarController,
                                              children: [
                                                KeepAliveWidgetWrapper(
                                                  builder: (context) => Padding(
                                                    padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        0, 15, 0, 15),
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                          context)
                                                          .width,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                            .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child:
                                                      SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                          MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  0,
                                                                  5,
                                                                  0,
                                                                  15),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                child:
                                                                TextFormField(
                                                                  controller: _model
                                                                      .dat1Controller1 ??=
                                                                      TextEditingController(
                                                                        text: datosGeneralesListarFichaPorIdFichaRowList
                                                                            .first
                                                                            .centroPobladoColegio,
                                                                      ),
                                                                  focusNode: _model
                                                                      .dat1FocusNode1,
                                                                  autofocus:
                                                                  true,
                                                                  autofillHints: [
                                                                    AutofillHints
                                                                        .birthday
                                                                  ],
                                                                  obscureText:
                                                                  false,
                                                                  decoration:
                                                                  InputDecoration(
                                                                    labelText:
                                                                    'Centro Poblado',
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                        .labelLarge
                                                                        .override(
                                                                      fontFamily:
                                                                      'Outfit',
                                                                      color:
                                                                      FlutterFlowTheme.of(context).secondaryText,
                                                                    ),
                                                                    enabledBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide:
                                                                      BorderSide(
                                                                        color: Color(
                                                                            0xFF2C313E),
                                                                        width:
                                                                        0.5,
                                                                      ),
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          12),
                                                                    ),
                                                                    focusedBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide:
                                                                      BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        width:
                                                                        0.5,
                                                                      ),
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          12),
                                                                    ),
                                                                    errorBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide:
                                                                      BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        width:
                                                                        0.5,
                                                                      ),
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          12),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide:
                                                                      BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        width:
                                                                        0.5,
                                                                      ),
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          12),
                                                                    ),
                                                                    filled:
                                                                    true,
                                                                    fillColor: FlutterFlowTheme.of(
                                                                        context)
                                                                        .primaryBtnText,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                      context)
                                                                      .bodyLarge
                                                                      .override(
                                                                    fontFamily:
                                                                    'Outfit',
                                                                    fontSize:
                                                                    13,
                                                                    fontWeight:
                                                                    FontWeight.w300,
                                                                  ),
                                                                  validator: _model
                                                                      .dat1Controller1Validator
                                                                      .asValidator(
                                                                      context),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  0,
                                                                  0,
                                                                  0,
                                                                  15),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                child:
                                                                TextFormField(
                                                                  controller: _model
                                                                      .dat1Controller2 ??=
                                                                      TextEditingController(
                                                                        text: datosGeneralesListarFichaPorIdFichaRowList
                                                                            .first
                                                                            .direccionColegio,
                                                                      ),
                                                                  focusNode: _model
                                                                      .dat1FocusNode2,
                                                                  autofocus:
                                                                  true,
                                                                  autofillHints: [
                                                                    AutofillHints
                                                                        .birthday
                                                                  ],
                                                                  obscureText:
                                                                  false,
                                                                  decoration:
                                                                  InputDecoration(
                                                                    labelText:
                                                                    'Dirección',
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                        .labelLarge
                                                                        .override(
                                                                      fontFamily:
                                                                      'Outfit',
                                                                      color:
                                                                      FlutterFlowTheme.of(context).secondaryText,
                                                                      fontSize:
                                                                      14,
                                                                      fontWeight:
                                                                      FontWeight.w500,
                                                                    ),
                                                                    enabledBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide:
                                                                      BorderSide(
                                                                        color: Color(
                                                                            0xFF2C313E),
                                                                        width:
                                                                        0.5,
                                                                      ),
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          12),
                                                                    ),
                                                                    focusedBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide:
                                                                      BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        width:
                                                                        0.5,
                                                                      ),
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          12),
                                                                    ),
                                                                    errorBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide:
                                                                      BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        width:
                                                                        0.5,
                                                                      ),
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          12),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide:
                                                                      BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        width:
                                                                        0.5,
                                                                      ),
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          12),
                                                                    ),
                                                                    filled:
                                                                    true,
                                                                    fillColor: FlutterFlowTheme.of(
                                                                        context)
                                                                        .primaryBtnText,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                      context)
                                                                      .bodyLarge
                                                                      .override(
                                                                    fontFamily:
                                                                    'Outfit',
                                                                    fontSize:
                                                                    13,
                                                                    fontWeight:
                                                                    FontWeight.w300,
                                                                  ),
                                                                  validator: _model
                                                                      .dat1Controller2Validator
                                                                      .asValidator(
                                                                      context),
                                                                ),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                              AlignmentDirectional(
                                                                  -1, 0),
                                                              child: Padding(
                                                                padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    0,
                                                                    0,
                                                                    0,
                                                                    15),
                                                                child:
                                                                FlutterFlowDropDown<
                                                                    String>(
                                                                  controller: _model
                                                                      .dat1ValueController ??=
                                                                      FormFieldController<
                                                                          String>(
                                                                        _model.dat1Value ??=
                                                                            valueOrDefault<
                                                                                String>(
                                                                              datosGeneralesListarFichaPorIdFichaRowList
                                                                                  .first
                                                                                  .zonaColegio,
                                                                              'zona',
                                                                            ),
                                                                      ),
                                                                  options: [
                                                                    'Urbano',
                                                                    'Urb. Marg',
                                                                    'Urb PPJJ',
                                                                    'Rural',
                                                                    'Frontera',
                                                                    'Emergencia'
                                                                  ],
                                                                  onChanged: (val) =>
                                                                      setState(() =>
                                                                      _model.dat1Value =
                                                                          val),
                                                                  width: double
                                                                      .infinity,
                                                                  height: 50,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                      context)
                                                                      .bodyMedium,
                                                                  hintText:
                                                                  'Zona',
                                                                  icon: Icon(
                                                                    Icons
                                                                        .keyboard_arrow_down_rounded,
                                                                    color: FlutterFlowTheme.of(
                                                                        context)
                                                                        .secondaryText,
                                                                    size: 24,
                                                                  ),
                                                                  fillColor: FlutterFlowTheme.of(
                                                                      context)
                                                                      .secondaryBackground,
                                                                  elevation: 2,
                                                                  borderColor:
                                                                  FlutterFlowTheme.of(
                                                                      context)
                                                                      .alternate,
                                                                  borderWidth:
                                                                  2,
                                                                  borderRadius:
                                                                  8,
                                                                  margin: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                      16,
                                                                      4,
                                                                      16,
                                                                      4),
                                                                  hidesUnderline:
                                                                  true,
                                                                  isOverButton:
                                                                  true,
                                                                  isSearchable:
                                                                  false,
                                                                  isMultiSelect:
                                                                  false,
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  0,
                                                                  0,
                                                                  0,
                                                                  15),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                child:
                                                                TextFormField(
                                                                  controller: _model
                                                                      .dat1Controller3 ??=
                                                                      TextEditingController(
                                                                        text: datosGeneralesListarFichaPorIdFichaRowList.first.totalPabellon ==
                                                                            null
                                                                            ? '0'
                                                                            : datosGeneralesListarFichaPorIdFichaRowList
                                                                            .first
                                                                            .totalPabellon
                                                                            ?.toString(),
                                                                      ),
                                                                  focusNode: _model
                                                                      .dat1FocusNode3,
                                                                  autofocus:
                                                                  true,
                                                                  autofillHints: [
                                                                    AutofillHints
                                                                        .birthday
                                                                  ],
                                                                  obscureText:
                                                                  false,
                                                                  decoration:
                                                                  InputDecoration(
                                                                    labelText:
                                                                    'Pabellones',
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                        .labelLarge
                                                                        .override(
                                                                      fontFamily:
                                                                      'Outfit',
                                                                      color:
                                                                      FlutterFlowTheme.of(context).secondaryText,
                                                                      fontSize:
                                                                      14,
                                                                      fontWeight:
                                                                      FontWeight.w500,
                                                                    ),
                                                                    enabledBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide:
                                                                      BorderSide(
                                                                        color: Color(
                                                                            0xFF2C313E),
                                                                        width:
                                                                        0.5,
                                                                      ),
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          12),
                                                                    ),
                                                                    focusedBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide:
                                                                      BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        width:
                                                                        0.5,
                                                                      ),
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          12),
                                                                    ),
                                                                    errorBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide:
                                                                      BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        width:
                                                                        0.5,
                                                                      ),
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          12),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide:
                                                                      BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        width:
                                                                        0.5,
                                                                      ),
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          12),
                                                                    ),
                                                                    filled:
                                                                    true,
                                                                    fillColor: FlutterFlowTheme.of(
                                                                        context)
                                                                        .primaryBtnText,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                      context)
                                                                      .bodyLarge
                                                                      .override(
                                                                    fontFamily:
                                                                    'Outfit',
                                                                    fontSize:
                                                                    13,
                                                                    fontWeight:
                                                                    FontWeight.w300,
                                                                  ),
                                                                  keyboardType:
                                                                  TextInputType
                                                                      .number,
                                                                  validator: _model
                                                                      .dat1Controller3Validator
                                                                      .asValidator(
                                                                      context),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  0,
                                                                  0,
                                                                  0,
                                                                  15),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                child:
                                                                TextFormField(
                                                                  controller: _model
                                                                      .dat1Controller4 ??=
                                                                      TextEditingController(
                                                                        text: datosGeneralesListarFichaPorIdFichaRowList.first.totalAulas ==
                                                                            null
                                                                            ? '0'
                                                                            : datosGeneralesListarFichaPorIdFichaRowList
                                                                            .first
                                                                            .totalAulas
                                                                            ?.toString(),
                                                                      ),
                                                                  focusNode: _model
                                                                      .dat1FocusNode4,
                                                                  autofocus:
                                                                  true,
                                                                  autofillHints: [
                                                                    AutofillHints
                                                                        .birthday
                                                                  ],
                                                                  obscureText:
                                                                  false,
                                                                  decoration:
                                                                  InputDecoration(
                                                                    labelText:
                                                                    'Aulas',
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                        .labelLarge
                                                                        .override(
                                                                      fontFamily:
                                                                      'Outfit',
                                                                      color:
                                                                      FlutterFlowTheme.of(context).secondaryText,
                                                                      fontSize:
                                                                      14,
                                                                      fontWeight:
                                                                      FontWeight.w500,
                                                                    ),
                                                                    enabledBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide:
                                                                      BorderSide(
                                                                        color: Color(
                                                                            0xFF2C313E),
                                                                        width:
                                                                        0.5,
                                                                      ),
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          12),
                                                                    ),
                                                                    focusedBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide:
                                                                      BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        width:
                                                                        0.5,
                                                                      ),
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          12),
                                                                    ),
                                                                    errorBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide:
                                                                      BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        width:
                                                                        0.5,
                                                                      ),
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          12),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide:
                                                                      BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        width:
                                                                        0.5,
                                                                      ),
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          12),
                                                                    ),
                                                                    filled:
                                                                    true,
                                                                    fillColor: FlutterFlowTheme.of(
                                                                        context)
                                                                        .primaryBtnText,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                      context)
                                                                      .bodyLarge
                                                                      .override(
                                                                    fontFamily:
                                                                    'Outfit',
                                                                    fontSize:
                                                                    13,
                                                                    fontWeight:
                                                                    FontWeight.w300,
                                                                  ),
                                                                  keyboardType:
                                                                  TextInputType
                                                                      .number,
                                                                  validator: _model
                                                                      .dat1Controller4Validator
                                                                      .asValidator(
                                                                      context),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  0,
                                                                  0,
                                                                  0,
                                                                  15),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                child:
                                                                TextFormField(
                                                                  controller: _model
                                                                      .dat1Controller5 ??=
                                                                      TextEditingController(
                                                                        text: datosGeneralesListarFichaPorIdFichaRowList.first.totalSSHH ==
                                                                            null
                                                                            ? '0'
                                                                            : datosGeneralesListarFichaPorIdFichaRowList
                                                                            .first
                                                                            .totalSSHH
                                                                            ?.toString(),
                                                                      ),
                                                                  focusNode: _model
                                                                      .dat1FocusNode5,
                                                                  autofocus:
                                                                  true,
                                                                  autofillHints: [
                                                                    AutofillHints
                                                                        .birthday
                                                                  ],
                                                                  obscureText:
                                                                  false,
                                                                  decoration:
                                                                  InputDecoration(
                                                                    labelText:
                                                                    'SS.HH',
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                        .labelLarge
                                                                        .override(
                                                                      fontFamily:
                                                                      'Outfit',
                                                                      color:
                                                                      FlutterFlowTheme.of(context).secondaryText,
                                                                      fontSize:
                                                                      14,
                                                                      fontWeight:
                                                                      FontWeight.w500,
                                                                    ),
                                                                    enabledBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide:
                                                                      BorderSide(
                                                                        color: Color(
                                                                            0xFF2C313E),
                                                                        width:
                                                                        0.5,
                                                                      ),
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          12),
                                                                    ),
                                                                    focusedBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide:
                                                                      BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        width:
                                                                        0.5,
                                                                      ),
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          12),
                                                                    ),
                                                                    errorBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide:
                                                                      BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        width:
                                                                        0.5,
                                                                      ),
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          12),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide:
                                                                      BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        width:
                                                                        0.5,
                                                                      ),
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          12),
                                                                    ),
                                                                    filled:
                                                                    true,
                                                                    fillColor: FlutterFlowTheme.of(
                                                                        context)
                                                                        .primaryBtnText,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                      context)
                                                                      .bodyLarge
                                                                      .override(
                                                                    fontFamily:
                                                                    'Outfit',
                                                                    fontSize:
                                                                    13,
                                                                    fontWeight:
                                                                    FontWeight.w300,
                                                                  ),
                                                                  keyboardType:
                                                                  TextInputType
                                                                      .number,
                                                                  validator: _model
                                                                      .dat1Controller5Validator
                                                                      .asValidator(
                                                                      context),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                KeepAliveWidgetWrapper(
                                                  builder: (context) => Padding(
                                                    padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        0, 15, 0, 15),
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                          context)
                                                          .width,
                                                      height: 400,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                            .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                        AlignmentDirectional(
                                                            0, 1),
                                                        child: FutureBuilder<
                                                            List<
                                                                ListarFichasModularesPorIdFichaRow>>(
                                                          future: SQLiteManager
                                                              .instance
                                                              .listarFichasModularesPorIdFicha(
                                                            idFicha:
                                                            FFAppState()
                                                                .IdFicha,
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
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
                                                            final columnListarFichasModularesPorIdFichaRowList = snapshot.data!;
                                                            return SingleChildScrollView(
                                                              child: Column(
                                                                mainAxisSize: MainAxisSize.max,
                                                                children: List.generate(
                                                                  columnListarFichasModularesPorIdFichaRowList.length,
                                                                      (columnIndex) {
                                                                    final columnListarFichasModularesPorIdFichaRow =
                                                                    columnListarFichasModularesPorIdFichaRowList[columnIndex];

                                                                    final TextEditingController codDigo = TextEditingController(text: columnListarFichasModularesPorIdFichaRow.codigoModular);
                                                                    final TextEditingController turnoController = TextEditingController(text: columnListarFichasModularesPorIdFichaRow.turno);
                                                                    final TextEditingController tipoDocenteController = TextEditingController(text: columnListarFichasModularesPorIdFichaRow.tipoDocente);
                                                                    final TextEditingController tipoSexoController = TextEditingController(text: columnListarFichasModularesPorIdFichaRow.tipoSexo);
                                                                    final TextEditingController numeroAlumnosController = TextEditingController(text: columnListarFichasModularesPorIdFichaRow.numeroAlumnos.toString());
                                                                    final TextEditingController numeroHombresController = TextEditingController(text: columnListarFichasModularesPorIdFichaRow.numeroHombres.toString());
                                                                    final TextEditingController numeroMujeresController = TextEditingController(text: columnListarFichasModularesPorIdFichaRow.numeroMujeres.toString());
                                                                    final TextEditingController numeroDocentesController = TextEditingController(text: columnListarFichasModularesPorIdFichaRow.numeroDocente.toString());
                                                                    final TextEditingController numeroseccinesController = TextEditingController(text: columnListarFichasModularesPorIdFichaRow.numeroSeccion.toString());

                                                                    codDigoControllers.add(codDigo);
                                                                    turnoControllers.add(turnoController);
                                                                    tipoDocenteControllers.add(tipoDocenteController);
                                                                    numeroAlumnosControllers.add(numeroAlumnosController);

                                                                    return Align(
                                                                      alignment: AlignmentDirectional(-1, 0),
                                                                      child: Container(
                                                                        width: double.infinity,
                                                                        decoration: BoxDecoration(
                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                        child: Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                                                                          child: SingleChildScrollView(
                                                                            child: Column(
                                                                              mainAxisSize: MainAxisSize.max,
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
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(5, 15, 5, 15),
                                                                                            child: Text(
                                                                                              valueOrDefault<String>(
                                                                                                columnListarFichasModularesPorIdFichaRow.nivel,
                                                                                                'nivel',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Outfit',
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0, 15, 5, 15),
                                                                                            child: Text(
                                                                                              valueOrDefault<String>(
                                                                                                columnListarFichasModularesPorIdFichaRow.codigoLocal,
                                                                                                'cod',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Outfit',
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 15),
                                                                                  child: Container(
                                                                                    width: double.infinity,
                                                                                    child: TextFormField(
                                                                                      controller: turnoController,
                                                                                      focusNode: _model.dat1FocusNode6,
                                                                                      autofocus: true,
                                                                                      autofillHints: [
                                                                                        AutofillHints.birthday
                                                                                      ],
                                                                                      readOnly: true,
                                                                                      obscureText: false,
                                                                                      decoration: InputDecoration(
                                                                                        labelText: 'Turno',
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
                                                                                      validator: _model.dat1Controller6Validator.asValidator(context),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                                                                                  child: Container(
                                                                                    width: double.infinity,
                                                                                    child: TextFormField(
                                                                                      controller: tipoDocenteController,
                                                                                      focusNode: _model.dat1FocusNode7,
                                                                                      autofocus: true,
                                                                                      autofillHints: [
                                                                                        AutofillHints.birthday
                                                                                      ],
                                                                                      readOnly: true,
                                                                                      obscureText: false,
                                                                                      decoration: InputDecoration(
                                                                                        labelText: 'Tipo Docente',
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
                                                                                      validator: _model.dat1Controller7Validator.asValidator(context),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                                                                                  child: Container(
                                                                                    width: double.infinity,
                                                                                    child: TextFormField(
                                                                                      controller: tipoSexoController,
                                                                                      focusNode: _model.dat1FocusNode8,
                                                                                      autofocus: true,
                                                                                      autofillHints: [
                                                                                        AutofillHints.birthday
                                                                                      ],
                                                                                      readOnly: true,
                                                                                      obscureText: false,
                                                                                      decoration: InputDecoration(
                                                                                        labelText: 'Tipo Sexo',
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
                                                                                      validator: _model.dat1Controller8Validator.asValidator(context),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                                                                                  child: Container(
                                                                                    width: double.infinity,
                                                                                    child: TextFormField(
                                                                                      controller: numeroAlumnosController,
                                                                                      onChanged: (value) {
                                                                                        final int numeroAlumnos = int.parse(value);
                                                                                        actualizarFichaMod(
                                                                                          codigoModular: codDigo.text,
                                                                                          numeroAlumnos: numeroAlumnos,
                                                                                          numeroSeccion: int.parse(numeroseccinesController.text),
                                                                                          numeroDocente: int.parse(numeroDocentesController.text),
                                                                                          numeroMujeres: int.parse(numeroMujeresController.text),
                                                                                          numeroHombres: int.parse(numeroHombresController.text),
                                                                                          // Proporciona los otros parámetros según sea necesario...
                                                                                        );
                                                                                      },
                                                                                      autofocus: true,
                                                                                      autofillHints: [
                                                                                        AutofillHints.birthday
                                                                                      ],
                                                                                      obscureText: false,
                                                                                      decoration: InputDecoration(
                                                                                        labelText: 'Número de Alumnos',
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
                                                                                      keyboardType: TextInputType.number,
                                                                                      validator: _model.dat1Controller9Validator.asValidator(context),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                                                                                  child: Container(
                                                                                    width: double.infinity,
                                                                                    child: TextFormField(
                                                                                      controller: numeroHombresController,
                                                                                      onChanged: (value) {
                                                                                        final int numeroAlumnos = int.parse(value);
                                                                                        actualizarFichaMod(
                                                                                          codigoModular: codDigo.text,
                                                                                          numeroAlumnos: int.parse(numeroAlumnosController.text),
                                                                                          numeroSeccion: int.parse(numeroseccinesController.text),
                                                                                          numeroDocente: int.parse(numeroDocentesController.text),
                                                                                          numeroMujeres: int.parse(numeroMujeresController.text),
                                                                                          numeroHombres: numeroAlumnos,
                                                                                          // Proporciona los otros parámetros según sea necesario...
                                                                                        );
                                                                                      },
                                                                                      autofocus: true,
                                                                                      autofillHints: [
                                                                                        AutofillHints.birthday
                                                                                      ],
                                                                                      obscureText: false,
                                                                                      decoration: InputDecoration(
                                                                                        labelText: 'Número de Hombres',
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
                                                                                      keyboardType: TextInputType.number,
                                                                                      validator: _model.dat1Controller10Validator.asValidator(context),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                                                                                  child: Container(
                                                                                    width: double.infinity,
                                                                                    child: TextFormField(
                                                                                      controller: numeroMujeresController,
                                                                                      onChanged: (value) {
                                                                                        final int numeroAlumnos = int.parse(value);
                                                                                        actualizarFichaMod(
                                                                                          codigoModular: codDigo.text,
                                                                                          numeroAlumnos: int.parse(numeroAlumnosController.text),
                                                                                          numeroSeccion: int.parse(numeroseccinesController.text),
                                                                                          numeroDocente: int.parse(numeroDocentesController.text),
                                                                                          numeroMujeres: numeroAlumnos,
                                                                                          numeroHombres: int.parse(numeroHombresController.text),
                                                                                          // Proporciona los otros parámetros según sea necesario...
                                                                                        );
                                                                                      },
                                                                                      autofocus: true,
                                                                                      autofillHints: [
                                                                                        AutofillHints.birthday
                                                                                      ],
                                                                                      obscureText: false,
                                                                                      decoration: InputDecoration(
                                                                                        labelText: 'Número de Mujeres',
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
                                                                                      keyboardType: TextInputType.number,
                                                                                      validator: _model.dat1Controller11Validator.asValidator(context),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                                                                                  child: Container(
                                                                                    width: double.infinity,
                                                                                    child: TextFormField(
                                                                                      controller: numeroDocentesController,
                                                                                      onChanged: (value) {
                                                                                        final int numeroAlumnos = int.parse(value);
                                                                                        actualizarFichaMod(
                                                                                          codigoModular: codDigo.text,
                                                                                          numeroAlumnos: int.parse(numeroAlumnosController.text),
                                                                                          numeroSeccion: int.parse(numeroseccinesController.text),
                                                                                          numeroDocente: numeroAlumnos,
                                                                                          numeroMujeres: int.parse(numeroMujeresController.text),
                                                                                          numeroHombres: int.parse(numeroHombresController.text),
                                                                                          // Proporciona los otros parámetros según sea necesario...
                                                                                        );
                                                                                      },
                                                                                      autofocus: true,
                                                                                      autofillHints: [
                                                                                        AutofillHints.birthday
                                                                                      ],
                                                                                      obscureText: false,
                                                                                      decoration: InputDecoration(
                                                                                        labelText: 'Número de Docentes',
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
                                                                                      keyboardType: TextInputType.number,
                                                                                      validator: _model.dat1Controller12Validator.asValidator(context),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                                                                                  child: Container(
                                                                                    width: double.infinity,
                                                                                    child: TextFormField(
                                                                                      controller: numeroseccinesController,
                                                                                      onChanged: (value) {
                                                                                        final int numeroAlumnos = int.parse(value);
                                                                                        actualizarFichaMod(
                                                                                          codigoModular: codDigo.text,
                                                                                          numeroAlumnos: int.parse(numeroAlumnosController.text),
                                                                                          numeroSeccion: numeroAlumnos,
                                                                                          numeroDocente: int.parse(numeroDocentesController.text),
                                                                                          numeroMujeres: int.parse(numeroMujeresController.text),
                                                                                          numeroHombres: int.parse(numeroHombresController.text),
                                                                                          // Proporciona los otros parámetros según sea necesario...
                                                                                        );
                                                                                      },
                                                                                      autofocus: true,
                                                                                      autofillHints: [
                                                                                        AutofillHints.birthday
                                                                                      ],
                                                                                      obscureText: false,
                                                                                      decoration: InputDecoration(
                                                                                        labelText: 'Número de Secciones',
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
                                                                                      keyboardType: TextInputType.number,
                                                                                      validator: _model.dat1Controller13Validator.asValidator(context),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            );

                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                KeepAliveWidgetWrapper(
                                                  builder: (context) => Padding(
                                                    padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        0, 15, 0, 15),
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                          context)
                                                          .width,
                                                      height: 500,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                            .of(context)
                                                            .secondaryBackground,
                                                        shape:
                                                        BoxShape.rectangle,
                                                      ),
                                                      child: Form(
                                                        key: _model.formKey,
                                                        autovalidateMode:
                                                        AutovalidateMode
                                                            .disabled,
                                                        child:
                                                        SingleChildScrollView(
                                                          child: Column(
                                                            mainAxisSize:
                                                            MainAxisSize
                                                                .min,
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                AlignmentDirectional(
                                                                    -1, -1),
                                                                child: Text(
                                                                  'Director',
                                                                  style: FlutterFlowTheme.of(
                                                                      context)
                                                                      .bodyMedium
                                                                      .override(
                                                                    fontFamily:
                                                                    'Outfit',
                                                                    fontSize:
                                                                    18,
                                                                    fontWeight:
                                                                    FontWeight.bold,
                                                                  ),
                                                                ),
                                                              ),
                                                              Divider(
                                                                thickness: 2,
                                                                color: FlutterFlowTheme.of(
                                                                    context)
                                                                    .secondaryText,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    0,
                                                                    0,
                                                                    0,
                                                                    15),
                                                                child:
                                                                Container(
                                                                  width: double
                                                                      .infinity,
                                                                  child:
                                                                  TextFormField(
                                                                    controller:
                                                                    _model.dat1Controller14 ??=
                                                                        TextEditingController(
                                                                          text: datosGeneralesListarFichaPorIdFichaRowList
                                                                              .first
                                                                              .dniDirector != 'null'
                                                                              ? datosGeneralesListarFichaPorIdFichaRowList.first.dniDirector
                                                                              : '',
                                                                        ),
                                                                    focusNode:
                                                                    _model
                                                                        .dat1FocusNode14,
                                                                    autofocus:
                                                                    true,
                                                                    autofillHints: [
                                                                      AutofillHints
                                                                          .birthday
                                                                    ],
                                                                    obscureText:
                                                                    false,
                                                                    decoration:
                                                                    InputDecoration(
                                                                      labelText:
                                                                      'DNI',
                                                                      labelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                          .labelLarge
                                                                          .override(
                                                                        fontFamily:
                                                                        'Outfit',
                                                                        color:
                                                                        FlutterFlowTheme.of(context).secondaryText,
                                                                      ),
                                                                      enabledBorder:
                                                                      OutlineInputBorder(
                                                                        borderSide:
                                                                        BorderSide(
                                                                          color:
                                                                          Color(0xFF2C313E),
                                                                          width:
                                                                          0.5,
                                                                        ),
                                                                        borderRadius:
                                                                        BorderRadius.circular(12),
                                                                      ),
                                                                      focusedBorder:
                                                                      OutlineInputBorder(
                                                                        borderSide:
                                                                        BorderSide(
                                                                          color:
                                                                          FlutterFlowTheme.of(context).primary,
                                                                          width:
                                                                          0.5,
                                                                        ),
                                                                        borderRadius:
                                                                        BorderRadius.circular(12),
                                                                      ),
                                                                      errorBorder:
                                                                      OutlineInputBorder(
                                                                        borderSide:
                                                                        BorderSide(
                                                                          color:
                                                                          FlutterFlowTheme.of(context).alternate,
                                                                          width:
                                                                          0.5,
                                                                        ),
                                                                        borderRadius:
                                                                        BorderRadius.circular(12),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                        borderSide:
                                                                        BorderSide(
                                                                          color:
                                                                          FlutterFlowTheme.of(context).alternate,
                                                                          width:
                                                                          0.5,
                                                                        ),
                                                                        borderRadius:
                                                                        BorderRadius.circular(12),
                                                                      ),
                                                                      filled:
                                                                      true,
                                                                      fillColor:
                                                                      FlutterFlowTheme.of(context)
                                                                          .primaryBtnText,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                        context)
                                                                        .bodyLarge
                                                                        .override(
                                                                      fontFamily:
                                                                      'Outfit',
                                                                      fontSize:
                                                                      13,
                                                                      fontWeight:
                                                                      FontWeight.w300,
                                                                    ),
                                                                    keyboardType:
                                                                    TextInputType
                                                                        .number,
                                                                    validator: _model
                                                                        .dat1Controller14Validator
                                                                        .asValidator(
                                                                        context),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    0,
                                                                    0,
                                                                    0,
                                                                    15),
                                                                child:
                                                                Container(
                                                                  width: double
                                                                      .infinity,
                                                                  child:
                                                                  TextFormField(
                                                                    controller:
                                                                    _model.dat1Controller15 ??=
                                                                        TextEditingController(
                                                                          text: datosGeneralesListarFichaPorIdFichaRowList
                                                                              .first
                                                                              .nombreDirector != 'null'
                                                                              ? datosGeneralesListarFichaPorIdFichaRowList.first.nombreDirector
                                                                              : '',
                                                                        ),
                                                                    focusNode:
                                                                    _model
                                                                        .dat1FocusNode15,
                                                                    autofocus:
                                                                    true,
                                                                    autofillHints: [
                                                                      AutofillHints
                                                                          .birthday
                                                                    ],
                                                                    obscureText:
                                                                    false,
                                                                    decoration:
                                                                    InputDecoration(
                                                                      labelText:
                                                                      'Nombres',
                                                                      labelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                          .labelLarge
                                                                          .override(
                                                                        fontFamily:
                                                                        'Outfit',
                                                                        color:
                                                                        FlutterFlowTheme.of(context).secondaryText,
                                                                      ),
                                                                      enabledBorder:
                                                                      OutlineInputBorder(
                                                                        borderSide:
                                                                        BorderSide(
                                                                          color:
                                                                          Color(0xFF2C313E),
                                                                          width:
                                                                          0.5,
                                                                        ),
                                                                        borderRadius:
                                                                        BorderRadius.circular(12),
                                                                      ),
                                                                      focusedBorder:
                                                                      OutlineInputBorder(
                                                                        borderSide:
                                                                        BorderSide(
                                                                          color:
                                                                          FlutterFlowTheme.of(context).primary,
                                                                          width:
                                                                          0.5,
                                                                        ),
                                                                        borderRadius:
                                                                        BorderRadius.circular(12),
                                                                      ),
                                                                      errorBorder:
                                                                      OutlineInputBorder(
                                                                        borderSide:
                                                                        BorderSide(
                                                                          color:
                                                                          FlutterFlowTheme.of(context).alternate,
                                                                          width:
                                                                          0.5,
                                                                        ),
                                                                        borderRadius:
                                                                        BorderRadius.circular(12),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                        borderSide:
                                                                        BorderSide(
                                                                          color:
                                                                          FlutterFlowTheme.of(context).alternate,
                                                                          width:
                                                                          0.5,
                                                                        ),
                                                                        borderRadius:
                                                                        BorderRadius.circular(12),
                                                                      ),
                                                                      filled:
                                                                      true,
                                                                      fillColor:
                                                                      FlutterFlowTheme.of(context)
                                                                          .primaryBtnText,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                        context)
                                                                        .bodyLarge
                                                                        .override(
                                                                      fontFamily:
                                                                      'Outfit',
                                                                      fontSize:
                                                                      13,
                                                                      fontWeight:
                                                                      FontWeight.w300,
                                                                    ),
                                                                    validator: _model
                                                                        .dat1Controller15Validator
                                                                        .asValidator(
                                                                        context),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    0,
                                                                    0,
                                                                    0,
                                                                    15),
                                                                child:
                                                                Container(
                                                                  width: double
                                                                      .infinity,
                                                                  child:
                                                                  TextFormField(
                                                                    controller: _model.dat1Controller16 ??= TextEditingController(
                                                                      text: datosGeneralesListarFichaPorIdFichaRowList.first.correoDirector != 'null'
                                                                          ? datosGeneralesListarFichaPorIdFichaRowList.first.correoDirector
                                                                          : '',
                                                                    ),
                                                                    focusNode:
                                                                    _model
                                                                        .dat1FocusNode16,
                                                                    autofocus:
                                                                    true,
                                                                    autofillHints: [
                                                                      AutofillHints
                                                                          .birthday
                                                                    ],
                                                                    obscureText:
                                                                    false,
                                                                    decoration:
                                                                    InputDecoration(
                                                                      labelText:
                                                                      'Correo',
                                                                      labelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                          .labelLarge
                                                                          .override(
                                                                        fontFamily:
                                                                        'Outfit',
                                                                        color:
                                                                        FlutterFlowTheme.of(context).secondaryText,
                                                                      ),
                                                                      enabledBorder:
                                                                      OutlineInputBorder(
                                                                        borderSide:
                                                                        BorderSide(
                                                                          color:
                                                                          Color(0xFF2C313E),
                                                                          width:
                                                                          0.5,
                                                                        ),
                                                                        borderRadius:
                                                                        BorderRadius.circular(12),
                                                                      ),
                                                                      focusedBorder:
                                                                      OutlineInputBorder(
                                                                        borderSide:
                                                                        BorderSide(
                                                                          color:
                                                                          FlutterFlowTheme.of(context).primary,
                                                                          width:
                                                                          0.5,
                                                                        ),
                                                                        borderRadius:
                                                                        BorderRadius.circular(12),
                                                                      ),
                                                                      errorBorder:
                                                                      OutlineInputBorder(
                                                                        borderSide:
                                                                        BorderSide(
                                                                          color:
                                                                          FlutterFlowTheme.of(context).alternate,
                                                                          width:
                                                                          0.5,
                                                                        ),
                                                                        borderRadius:
                                                                        BorderRadius.circular(12),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                        borderSide:
                                                                        BorderSide(
                                                                          color:
                                                                          FlutterFlowTheme.of(context).alternate,
                                                                          width:
                                                                          0.5,
                                                                        ),
                                                                        borderRadius:
                                                                        BorderRadius.circular(12),
                                                                      ),
                                                                      filled:
                                                                      true,
                                                                      fillColor:
                                                                      FlutterFlowTheme.of(context)
                                                                          .primaryBtnText,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                        context)
                                                                        .bodyLarge
                                                                        .override(
                                                                      fontFamily:
                                                                      'Outfit',
                                                                      fontSize:
                                                                      13,
                                                                      fontWeight:
                                                                      FontWeight.w300,
                                                                    ),
                                                                    validator: _model
                                                                        .dat1Controller16Validator
                                                                        .asValidator(
                                                                        context),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    0,
                                                                    0,
                                                                    0,
                                                                    15),
                                                                child:
                                                                Container(
                                                                  width: double
                                                                      .infinity,
                                                                  child:
                                                                  TextFormField(
                                                                    controller:
                                                                    _model.dat1Controller17 ??=
                                                                        TextEditingController(
                                                                          text: datosGeneralesListarFichaPorIdFichaRowList
                                                                              .first
                                                                              .telefonoDirector != 'null'
                                                                              ? datosGeneralesListarFichaPorIdFichaRowList.first.telefonoDirector
                                                                              : '',
                                                                        ),
                                                                    focusNode:
                                                                    _model
                                                                        .dat1FocusNode17,
                                                                    autofocus:
                                                                    true,
                                                                    autofillHints: [
                                                                      AutofillHints
                                                                          .birthday
                                                                    ],
                                                                    obscureText:
                                                                    false,
                                                                    decoration:
                                                                    InputDecoration(
                                                                      labelText:
                                                                      'Teléfono',
                                                                      labelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                          .labelLarge
                                                                          .override(
                                                                        fontFamily:
                                                                        'Outfit',
                                                                        color:
                                                                        FlutterFlowTheme.of(context).secondaryText,
                                                                      ),
                                                                      enabledBorder:
                                                                      OutlineInputBorder(
                                                                        borderSide:
                                                                        BorderSide(
                                                                          color:
                                                                          Color(0xFF2C313E),
                                                                          width:
                                                                          0.5,
                                                                        ),
                                                                        borderRadius:
                                                                        BorderRadius.circular(12),
                                                                      ),
                                                                      focusedBorder:
                                                                      OutlineInputBorder(
                                                                        borderSide:
                                                                        BorderSide(
                                                                          color:
                                                                          FlutterFlowTheme.of(context).primary,
                                                                          width:
                                                                          0.5,
                                                                        ),
                                                                        borderRadius:
                                                                        BorderRadius.circular(12),
                                                                      ),
                                                                      errorBorder:
                                                                      OutlineInputBorder(
                                                                        borderSide:
                                                                        BorderSide(
                                                                          color:
                                                                          FlutterFlowTheme.of(context).alternate,
                                                                          width:
                                                                          0.5,
                                                                        ),
                                                                        borderRadius:
                                                                        BorderRadius.circular(12),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                        borderSide:
                                                                        BorderSide(
                                                                          color:
                                                                          FlutterFlowTheme.of(context).alternate,
                                                                          width:
                                                                          0.5,
                                                                        ),
                                                                        borderRadius:
                                                                        BorderRadius.circular(12),
                                                                      ),
                                                                      filled:
                                                                      true,
                                                                      fillColor:
                                                                      FlutterFlowTheme.of(context)
                                                                          .primaryBtnText,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                        context)
                                                                        .bodyLarge
                                                                        .override(
                                                                      fontFamily:
                                                                      'Outfit',
                                                                      fontSize:
                                                                      13,
                                                                      fontWeight:
                                                                      FontWeight.w300,
                                                                    ),
                                                                    keyboardType:
                                                                    TextInputType
                                                                        .number,
                                                                    validator: _model
                                                                        .dat1Controller17Validator
                                                                        .asValidator(
                                                                        context),
                                                                  ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                AlignmentDirectional(
                                                                    -1, -1),
                                                                child: Text(
                                                                  'Contacto Alterno',
                                                                  style: FlutterFlowTheme.of(
                                                                      context)
                                                                      .bodyMedium
                                                                      .override(
                                                                    fontFamily:
                                                                    'Outfit',
                                                                    fontSize:
                                                                    18,
                                                                    fontWeight:
                                                                    FontWeight.bold,
                                                                  ),
                                                                ),
                                                              ),
                                                              Divider(
                                                                thickness: 2,
                                                                color: FlutterFlowTheme.of(
                                                                    context)
                                                                    .secondaryText,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    0,
                                                                    5,
                                                                    0,
                                                                    15),
                                                                child:
                                                                Container(
                                                                  width: double
                                                                      .infinity,
                                                                  child:
                                                                  TextFormField(
                                                                    controller:
                                                                    _model.dat1Controller18 ??=
                                                                        TextEditingController(
                                                                          text: datosGeneralesListarFichaPorIdFichaRowList
                                                                              .first
                                                                              .dniAlterno != 'null'
                                                                              ? datosGeneralesListarFichaPorIdFichaRowList.first.dniAlterno
                                                                              : '',
                                                                        ),
                                                                    focusNode:
                                                                    _model
                                                                        .dat1FocusNode18,
                                                                    autofocus:
                                                                    true,
                                                                    autofillHints: [
                                                                      AutofillHints
                                                                          .birthday
                                                                    ],
                                                                    obscureText:
                                                                    false,
                                                                    decoration:
                                                                    InputDecoration(
                                                                      labelText:
                                                                      'DNI',
                                                                      labelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                          .labelLarge
                                                                          .override(
                                                                        fontFamily:
                                                                        'Outfit',
                                                                        color:
                                                                        FlutterFlowTheme.of(context).secondaryText,
                                                                      ),
                                                                      enabledBorder:
                                                                      OutlineInputBorder(
                                                                        borderSide:
                                                                        BorderSide(
                                                                          color:
                                                                          Color(0xFF2C313E),
                                                                          width:
                                                                          0.5,
                                                                        ),
                                                                        borderRadius:
                                                                        BorderRadius.circular(12),
                                                                      ),
                                                                      focusedBorder:
                                                                      OutlineInputBorder(
                                                                        borderSide:
                                                                        BorderSide(
                                                                          color:
                                                                          FlutterFlowTheme.of(context).primary,
                                                                          width:
                                                                          0.5,
                                                                        ),
                                                                        borderRadius:
                                                                        BorderRadius.circular(12),
                                                                      ),
                                                                      errorBorder:
                                                                      OutlineInputBorder(
                                                                        borderSide:
                                                                        BorderSide(
                                                                          color:
                                                                          FlutterFlowTheme.of(context).alternate,
                                                                          width:
                                                                          0.5,
                                                                        ),
                                                                        borderRadius:
                                                                        BorderRadius.circular(12),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                        borderSide:
                                                                        BorderSide(
                                                                          color:
                                                                          FlutterFlowTheme.of(context).alternate,
                                                                          width:
                                                                          0.5,
                                                                        ),
                                                                        borderRadius:
                                                                        BorderRadius.circular(12),
                                                                      ),
                                                                      filled:
                                                                      true,
                                                                      fillColor:
                                                                      FlutterFlowTheme.of(context)
                                                                          .primaryBtnText,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                        context)
                                                                        .bodyLarge
                                                                        .override(
                                                                      fontFamily:
                                                                      'Outfit',
                                                                      fontSize:
                                                                      13,
                                                                      fontWeight:
                                                                      FontWeight.w300,
                                                                    ),
                                                                    validator: _model
                                                                        .dat1Controller18Validator
                                                                        .asValidator(
                                                                        context),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    0,
                                                                    0,
                                                                    0,
                                                                    15),
                                                                child:
                                                                Container(
                                                                  width: double
                                                                      .infinity,
                                                                  child:
                                                                  TextFormField(
                                                                    controller:
                                                                    _model.dat1Controller19 ??=
                                                                        TextEditingController(
                                                                          text: datosGeneralesListarFichaPorIdFichaRowList
                                                                              .first
                                                                              .nombreAlterno != 'null'
                                                                              ? datosGeneralesListarFichaPorIdFichaRowList.first.nombreAlterno
                                                                              : '',
                                                                        ),
                                                                    focusNode:
                                                                    _model
                                                                        .dat1FocusNode19,
                                                                    autofocus:
                                                                    true,
                                                                    autofillHints: [
                                                                      AutofillHints
                                                                          .birthday
                                                                    ],
                                                                    obscureText:
                                                                    false,
                                                                    decoration:
                                                                    InputDecoration(
                                                                      labelText:
                                                                      'Nombres',
                                                                      labelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                          .labelLarge
                                                                          .override(
                                                                        fontFamily:
                                                                        'Outfit',
                                                                        color:
                                                                        FlutterFlowTheme.of(context).secondaryText,
                                                                      ),
                                                                      enabledBorder:
                                                                      OutlineInputBorder(
                                                                        borderSide:
                                                                        BorderSide(
                                                                          color:
                                                                          Color(0xFF2C313E),
                                                                          width:
                                                                          0.5,
                                                                        ),
                                                                        borderRadius:
                                                                        BorderRadius.circular(12),
                                                                      ),
                                                                      focusedBorder:
                                                                      OutlineInputBorder(
                                                                        borderSide:
                                                                        BorderSide(
                                                                          color:
                                                                          FlutterFlowTheme.of(context).primary,
                                                                          width:
                                                                          0.5,
                                                                        ),
                                                                        borderRadius:
                                                                        BorderRadius.circular(12),
                                                                      ),
                                                                      errorBorder:
                                                                      OutlineInputBorder(
                                                                        borderSide:
                                                                        BorderSide(
                                                                          color:
                                                                          FlutterFlowTheme.of(context).alternate,
                                                                          width:
                                                                          0.5,
                                                                        ),
                                                                        borderRadius:
                                                                        BorderRadius.circular(12),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                        borderSide:
                                                                        BorderSide(
                                                                          color:
                                                                          FlutterFlowTheme.of(context).alternate,
                                                                          width:
                                                                          0.5,
                                                                        ),
                                                                        borderRadius:
                                                                        BorderRadius.circular(12),
                                                                      ),
                                                                      filled:
                                                                      true,
                                                                      fillColor:
                                                                      FlutterFlowTheme.of(context)
                                                                          .primaryBtnText,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                        context)
                                                                        .bodyLarge
                                                                        .override(
                                                                      fontFamily:
                                                                      'Outfit',
                                                                      fontSize:
                                                                      13,
                                                                      fontWeight:
                                                                      FontWeight.w300,
                                                                    ),
                                                                    validator: _model
                                                                        .dat1Controller19Validator
                                                                        .asValidator(
                                                                        context),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    0,
                                                                    0,
                                                                    0,
                                                                    15),
                                                                child:
                                                                Container(
                                                                  width: double
                                                                      .infinity,
                                                                  child:
                                                                  TextFormField(
                                                                    controller:
                                                                    _model.dat1Controller20 ??=
                                                                        TextEditingController(
                                                                          text: datosGeneralesListarFichaPorIdFichaRowList
                                                                              .first
                                                                              .correoAlterno != 'null'
                                                                              ? datosGeneralesListarFichaPorIdFichaRowList.first.correoAlterno
                                                                              : '',
                                                                        ),
                                                                    focusNode:
                                                                    _model
                                                                        .dat1FocusNode20,
                                                                    autofocus:
                                                                    true,
                                                                    autofillHints: [
                                                                      AutofillHints
                                                                          .birthday
                                                                    ],
                                                                    obscureText:
                                                                    false,
                                                                    decoration:
                                                                    InputDecoration(
                                                                      labelText:
                                                                      'Correo',
                                                                      labelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                          .labelLarge
                                                                          .override(
                                                                        fontFamily:
                                                                        'Outfit',
                                                                        color:
                                                                        FlutterFlowTheme.of(context).secondaryText,
                                                                      ),
                                                                      enabledBorder:
                                                                      OutlineInputBorder(
                                                                        borderSide:
                                                                        BorderSide(
                                                                          color:
                                                                          Color(0xFF2C313E),
                                                                          width:
                                                                          0.5,
                                                                        ),
                                                                        borderRadius:
                                                                        BorderRadius.circular(12),
                                                                      ),
                                                                      focusedBorder:
                                                                      OutlineInputBorder(
                                                                        borderSide:
                                                                        BorderSide(
                                                                          color:
                                                                          FlutterFlowTheme.of(context).primary,
                                                                          width:
                                                                          0.5,
                                                                        ),
                                                                        borderRadius:
                                                                        BorderRadius.circular(12),
                                                                      ),
                                                                      errorBorder:
                                                                      OutlineInputBorder(
                                                                        borderSide:
                                                                        BorderSide(
                                                                          color:
                                                                          FlutterFlowTheme.of(context).alternate,
                                                                          width:
                                                                          0.5,
                                                                        ),
                                                                        borderRadius:
                                                                        BorderRadius.circular(12),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                        borderSide:
                                                                        BorderSide(
                                                                          color:
                                                                          FlutterFlowTheme.of(context).alternate,
                                                                          width:
                                                                          0.5,
                                                                        ),
                                                                        borderRadius:
                                                                        BorderRadius.circular(12),
                                                                      ),
                                                                      filled:
                                                                      true,
                                                                      fillColor:
                                                                      FlutterFlowTheme.of(context)
                                                                          .primaryBtnText,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                        context)
                                                                        .bodyLarge
                                                                        .override(
                                                                      fontFamily:
                                                                      'Outfit',
                                                                      fontSize:
                                                                      13,
                                                                      fontWeight:
                                                                      FontWeight.w300,
                                                                    ),
                                                                    validator: _model
                                                                        .dat1Controller20Validator
                                                                        .asValidator(
                                                                        context),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    0,
                                                                    0,
                                                                    0,
                                                                    15),
                                                                child:
                                                                Container(
                                                                  width: double
                                                                      .infinity,
                                                                  child:
                                                                  TextFormField(
                                                                    controller:
                                                                    _model.dat1Controller21 ??=
                                                                        TextEditingController(
                                                                          text: datosGeneralesListarFichaPorIdFichaRowList
                                                                              .first
                                                                              .telefonoAlterno != 'null'
                                                                              ? datosGeneralesListarFichaPorIdFichaRowList.first.telefonoAlterno
                                                                              : '',
                                                                        ),
                                                                    focusNode:
                                                                    _model
                                                                        .dat1FocusNode21,
                                                                    autofocus:
                                                                    true,
                                                                    autofillHints: [
                                                                      AutofillHints
                                                                          .birthday
                                                                    ],
                                                                    obscureText:
                                                                    false,
                                                                    decoration:
                                                                    InputDecoration(
                                                                      labelText:
                                                                      'Teléfono',
                                                                      labelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                          .labelLarge
                                                                          .override(
                                                                        fontFamily:
                                                                        'Outfit',
                                                                        color:
                                                                        FlutterFlowTheme.of(context).secondaryText,
                                                                      ),
                                                                      enabledBorder:
                                                                      OutlineInputBorder(
                                                                        borderSide:
                                                                        BorderSide(
                                                                          color:
                                                                          Color(0xFF2C313E),
                                                                          width:
                                                                          0.5,
                                                                        ),
                                                                        borderRadius:
                                                                        BorderRadius.circular(12),
                                                                      ),
                                                                      focusedBorder:
                                                                      OutlineInputBorder(
                                                                        borderSide:
                                                                        BorderSide(
                                                                          color:
                                                                          FlutterFlowTheme.of(context).primary,
                                                                          width:
                                                                          0.5,
                                                                        ),
                                                                        borderRadius:
                                                                        BorderRadius.circular(12),
                                                                      ),
                                                                      errorBorder:
                                                                      OutlineInputBorder(
                                                                        borderSide:
                                                                        BorderSide(
                                                                          color:
                                                                          FlutterFlowTheme.of(context).alternate,
                                                                          width:
                                                                          0.5,
                                                                        ),
                                                                        borderRadius:
                                                                        BorderRadius.circular(12),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                        borderSide:
                                                                        BorderSide(
                                                                          color:
                                                                          FlutterFlowTheme.of(context).alternate,
                                                                          width:
                                                                          0.5,
                                                                        ),
                                                                        borderRadius:
                                                                        BorderRadius.circular(12),
                                                                      ),
                                                                      filled:
                                                                      true,
                                                                      fillColor:
                                                                      FlutterFlowTheme.of(context)
                                                                          .primaryBtnText,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                        context)
                                                                        .bodyLarge
                                                                        .override(
                                                                      fontFamily:
                                                                      'Outfit',
                                                                      fontSize:
                                                                      13,
                                                                      fontWeight:
                                                                      FontWeight.w300,
                                                                    ),
                                                                    keyboardType:
                                                                    TextInputType
                                                                        .number,
                                                                    validator: _model
                                                                        .dat1Controller21Validator
                                                                        .asValidator(
                                                                        context),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                KeepAliveWidgetWrapper(
                                                  builder: (context) => Padding(
                                                    padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        0, 15, 0, 15),
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                          context)
                                                          .width,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                            .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child:
                                                      SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                          MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  0,
                                                                  5,
                                                                  0,
                                                                  15),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                child:
                                                                TextFormField(
                                                                  controller: _model
                                                                      .dat1Controller22 ??=
                                                                      TextEditingController(
                                                                        text: datosGeneralesListarFichaPorIdFichaRowList
                                                                            .first
                                                                            .dniInspector != 'null'
                                                                            ? datosGeneralesListarFichaPorIdFichaRowList.first.dniInspector
                                                                            : '',
                                                                      ),
                                                                  focusNode: _model
                                                                      .dat1FocusNode22,
                                                                  autofocus:
                                                                  true,
                                                                  autofillHints: [
                                                                    AutofillHints
                                                                        .birthday
                                                                  ],
                                                                  obscureText:
                                                                  false,
                                                                  decoration:
                                                                  InputDecoration(
                                                                    labelText:
                                                                    'DNI',
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                        .labelLarge
                                                                        .override(
                                                                      fontFamily:
                                                                      'Outfit',
                                                                      color:
                                                                      FlutterFlowTheme.of(context).secondaryText,
                                                                    ),
                                                                    enabledBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide:
                                                                      BorderSide(
                                                                        color: Color(
                                                                            0xFF2C313E),
                                                                        width:
                                                                        0.5,
                                                                      ),
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          12),
                                                                    ),
                                                                    focusedBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide:
                                                                      BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        width:
                                                                        0.5,
                                                                      ),
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          12),
                                                                    ),
                                                                    errorBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide:
                                                                      BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        width:
                                                                        0.5,
                                                                      ),
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          12),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide:
                                                                      BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        width:
                                                                        0.5,
                                                                      ),
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          12),
                                                                    ),
                                                                    filled:
                                                                    true,
                                                                    fillColor: FlutterFlowTheme.of(
                                                                        context)
                                                                        .primaryBtnText,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                      context)
                                                                      .bodyLarge
                                                                      .override(
                                                                    fontFamily:
                                                                    'Outfit',
                                                                    fontSize:
                                                                    13,
                                                                    fontWeight:
                                                                    FontWeight.w300,
                                                                  ),
                                                                  validator: _model
                                                                      .dat1Controller22Validator
                                                                      .asValidator(
                                                                      context),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  0,
                                                                  0,
                                                                  0,
                                                                  15),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                child:
                                                                TextFormField(
                                                                  controller: _model
                                                                      .dat1Controller23 ??=
                                                                      TextEditingController(
                                                                        text: datosGeneralesListarFichaPorIdFichaRowList
                                                                            .first
                                                                            .nombreInspector != 'null'
                                                                            ? datosGeneralesListarFichaPorIdFichaRowList.first.nombreInspector
                                                                            : '',
                                                                      ),
                                                                  focusNode: _model
                                                                      .dat1FocusNode23,
                                                                  autofocus:
                                                                  true,
                                                                  autofillHints: [
                                                                    AutofillHints
                                                                        .birthday
                                                                  ],
                                                                  obscureText:
                                                                  false,
                                                                  decoration:
                                                                  InputDecoration(
                                                                    labelText:
                                                                    'Nombre Del Inspector',
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                        .labelLarge
                                                                        .override(
                                                                      fontFamily:
                                                                      'Outfit',
                                                                      color:
                                                                      FlutterFlowTheme.of(context).secondaryText,
                                                                      fontSize:
                                                                      14,
                                                                      fontWeight:
                                                                      FontWeight.w500,
                                                                    ),
                                                                    enabledBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide:
                                                                      BorderSide(
                                                                        color: Color(
                                                                            0xFF2C313E),
                                                                        width:
                                                                        0.5,
                                                                      ),
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          12),
                                                                    ),
                                                                    focusedBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide:
                                                                      BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        width:
                                                                        0.5,
                                                                      ),
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          12),
                                                                    ),
                                                                    errorBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide:
                                                                      BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        width:
                                                                        0.5,
                                                                      ),
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          12),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide:
                                                                      BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        width:
                                                                        0.5,
                                                                      ),
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          12),
                                                                    ),
                                                                    filled:
                                                                    true,
                                                                    fillColor: FlutterFlowTheme.of(
                                                                        context)
                                                                        .primaryBtnText,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                      context)
                                                                      .bodyLarge
                                                                      .override(
                                                                    fontFamily:
                                                                    'Outfit',
                                                                    fontSize:
                                                                    13,
                                                                    fontWeight:
                                                                    FontWeight.w300,
                                                                  ),
                                                                  validator: _model
                                                                      .dat1Controller23Validator
                                                                      .asValidator(
                                                                      context),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  0,
                                                                  0,
                                                                  0,
                                                                  15),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                child:
                                                                TextFormField(
                                                                  controller: _model
                                                                      .dat1Controller24 ??=
                                                                      TextEditingController(
                                                                        text: datosGeneralesListarFichaPorIdFichaRowList
                                                                            .first
                                                                            .correoInspector != 'null'
                                                                            ? datosGeneralesListarFichaPorIdFichaRowList.first.correoInspector
                                                                            : '',
                                                                      ),
                                                                  focusNode: _model
                                                                      .dat1FocusNode24,
                                                                  autofocus:
                                                                  true,
                                                                  autofillHints: [
                                                                    AutofillHints
                                                                        .birthday
                                                                  ],
                                                                  obscureText:
                                                                  false,
                                                                  decoration:
                                                                  InputDecoration(
                                                                    labelText:
                                                                    'Correo',
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                        .labelLarge
                                                                        .override(
                                                                      fontFamily:
                                                                      'Outfit',
                                                                      color:
                                                                      FlutterFlowTheme.of(context).secondaryText,
                                                                      fontSize:
                                                                      14,
                                                                      fontWeight:
                                                                      FontWeight.w500,
                                                                    ),
                                                                    enabledBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide:
                                                                      BorderSide(
                                                                        color: Color(
                                                                            0xFF2C313E),
                                                                        width:
                                                                        0.5,
                                                                      ),
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          12),
                                                                    ),
                                                                    focusedBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide:
                                                                      BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        width:
                                                                        0.5,
                                                                      ),
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          12),
                                                                    ),
                                                                    errorBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide:
                                                                      BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        width:
                                                                        0.5,
                                                                      ),
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          12),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide:
                                                                      BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        width:
                                                                        0.5,
                                                                      ),
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          12),
                                                                    ),
                                                                    filled:
                                                                    true,
                                                                    fillColor: FlutterFlowTheme.of(
                                                                        context)
                                                                        .primaryBtnText,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                      context)
                                                                      .bodyLarge
                                                                      .override(
                                                                    fontFamily:
                                                                    'Outfit',
                                                                    fontSize:
                                                                    13,
                                                                    fontWeight:
                                                                    FontWeight.w300,
                                                                  ),
                                                                  validator: _model
                                                                      .dat1Controller24Validator
                                                                      .asValidator(
                                                                      context),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  0,
                                                                  0,
                                                                  0,
                                                                  15),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                child:
                                                                TextFormField(
                                                                  controller: _model
                                                                      .dat1Controller25 ??=
                                                                      TextEditingController(
                                                                        text: datosGeneralesListarFichaPorIdFichaRowList
                                                                            .first
                                                                            .telefonoInspector != 'null'
                                                                            ? datosGeneralesListarFichaPorIdFichaRowList.first.telefonoInspector
                                                                            : '',
                                                                      ),
                                                                  focusNode: _model
                                                                      .dat1FocusNode25,
                                                                  autofocus:
                                                                  true,
                                                                  autofillHints: [
                                                                    AutofillHints
                                                                        .birthday
                                                                  ],
                                                                  obscureText:
                                                                  false,
                                                                  decoration:
                                                                  InputDecoration(
                                                                    labelText:
                                                                    'Teléfono',
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                        .labelLarge
                                                                        .override(
                                                                      fontFamily:
                                                                      'Outfit',
                                                                      color:
                                                                      FlutterFlowTheme.of(context).secondaryText,
                                                                      fontSize:
                                                                      14,
                                                                      fontWeight:
                                                                      FontWeight.w500,
                                                                    ),
                                                                    enabledBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide:
                                                                      BorderSide(
                                                                        color: Color(
                                                                            0xFF2C313E),
                                                                        width:
                                                                        0.5,
                                                                      ),
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          12),
                                                                    ),
                                                                    focusedBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide:
                                                                      BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        width:
                                                                        0.5,
                                                                      ),
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          12),
                                                                    ),
                                                                    errorBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide:
                                                                      BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        width:
                                                                        0.5,
                                                                      ),
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          12),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide:
                                                                      BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        width:
                                                                        0.5,
                                                                      ),
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          12),
                                                                    ),
                                                                    filled:
                                                                    true,
                                                                    fillColor: FlutterFlowTheme.of(
                                                                        context)
                                                                        .primaryBtnText,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                      context)
                                                                      .bodyLarge
                                                                      .override(
                                                                    fontFamily:
                                                                    'Outfit',
                                                                    fontSize:
                                                                    13,
                                                                    fontWeight:
                                                                    FontWeight.w300,
                                                                  ),
                                                                  validator: _model
                                                                      .dat1Controller25Validator
                                                                      .asValidator(
                                                                      context),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  0,
                                                                  0,
                                                                  0,
                                                                  15),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                child:
                                                                TextFormField(
                                                                  controller: _model
                                                                      .dat1Controller26 ??=
                                                                      TextEditingController(
                                                                        text: datosGeneralesListarFichaPorIdFichaRowList
                                                                            .first
                                                                            .tipoInspeccion != 'null'
                                                                            ? datosGeneralesListarFichaPorIdFichaRowList.first.tipoInspeccion
                                                                            : '',
                                                                      ),
                                                                  focusNode: _model
                                                                      .dat1FocusNode26,
                                                                  autofocus:
                                                                  true,
                                                                  autofillHints: [
                                                                    AutofillHints
                                                                        .birthday
                                                                  ],
                                                                  obscureText:
                                                                  false,
                                                                  decoration:
                                                                  InputDecoration(
                                                                    labelText:
                                                                    'Tipo Inspección',
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                        .labelLarge
                                                                        .override(
                                                                      fontFamily:
                                                                      'Outfit',
                                                                      color:
                                                                      FlutterFlowTheme.of(context).secondaryText,
                                                                      fontSize:
                                                                      14,
                                                                      fontWeight:
                                                                      FontWeight.w500,
                                                                    ),
                                                                    enabledBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide:
                                                                      BorderSide(
                                                                        color: Color(
                                                                            0xFF2C313E),
                                                                        width:
                                                                        0.5,
                                                                      ),
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          12),
                                                                    ),
                                                                    focusedBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide:
                                                                      BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        width:
                                                                        0.5,
                                                                      ),
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          12),
                                                                    ),
                                                                    errorBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide:
                                                                      BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        width:
                                                                        0.5,
                                                                      ),
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          12),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide:
                                                                      BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        width:
                                                                        0.5,
                                                                      ),
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          12),
                                                                    ),
                                                                    filled:
                                                                    true,
                                                                    fillColor: FlutterFlowTheme.of(
                                                                        context)
                                                                        .primaryBtnText,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                      context)
                                                                      .bodyLarge
                                                                      .override(
                                                                    fontFamily:
                                                                    'Outfit',
                                                                    fontSize:
                                                                    13,
                                                                    fontWeight:
                                                                    FontWeight.w300,
                                                                  ),
                                                                  validator: _model
                                                                      .dat1Controller26Validator
                                                                      .asValidator(
                                                                      context),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  0,
                                                                  0,
                                                                  0,
                                                                  15),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                child:
                                                                TextFormField(
                                                                  controller: _model
                                                                      .dat1Controller27 ??=
                                                                      TextEditingController(
                                                                        text: datosGeneralesListarFichaPorIdFichaRowList
                                                                            .first
                                                                            .fechaInspeccion != 'null'
                                                                            ? datosGeneralesListarFichaPorIdFichaRowList.first.fechaInspeccion
                                                                            : '',
                                                                      ),
                                                                  focusNode: _model
                                                                      .dat1FocusNode27,
                                                                  autofocus:
                                                                  true,
                                                                  autofillHints: [
                                                                    AutofillHints
                                                                        .birthday
                                                                  ],
                                                                  obscureText:
                                                                  false,
                                                                  decoration:
                                                                  InputDecoration(
                                                                    labelText:
                                                                    'Fecha de Inspeción',
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                        .labelLarge
                                                                        .override(
                                                                      fontFamily:
                                                                      'Outfit',
                                                                      color:
                                                                      FlutterFlowTheme.of(context).secondaryText,
                                                                      fontSize:
                                                                      14,
                                                                      fontWeight:
                                                                      FontWeight.w500,
                                                                    ),
                                                                    enabledBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide:
                                                                      BorderSide(
                                                                        color: Color(
                                                                            0xFF2C313E),
                                                                        width:
                                                                        0.5,
                                                                      ),
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          12),
                                                                    ),
                                                                    focusedBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide:
                                                                      BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        width:
                                                                        0.5,
                                                                      ),
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          12),
                                                                    ),
                                                                    errorBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide:
                                                                      BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        width:
                                                                        0.5,
                                                                      ),
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          12),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide:
                                                                      BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        width:
                                                                        0.5,
                                                                      ),
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          12),
                                                                    ),
                                                                    filled:
                                                                    true,
                                                                    fillColor: FlutterFlowTheme.of(
                                                                        context)
                                                                        .primaryBtnText,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                      context)
                                                                      .bodyLarge
                                                                      .override(
                                                                    fontFamily:
                                                                    'Outfit',
                                                                    fontSize:
                                                                    13,
                                                                    fontWeight:
                                                                    FontWeight.w300,
                                                                  ),
                                                                  keyboardType:
                                                                  TextInputType
                                                                      .datetime,
                                                                  validator: _model
                                                                      .dat1Controller27Validator
                                                                      .asValidator(
                                                                      context),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  0,
                                                                  0,
                                                                  0,
                                                                  15),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                child:
                                                                TextFormField(
                                                                  controller: _model
                                                                      .dat1Controller28 ??=
                                                                      TextEditingController(
                                                                        text: datosGeneralesListarFichaPorIdFichaRowList
                                                                            .first
                                                                            .horaInspeccion != 'null'
                                                                            ? datosGeneralesListarFichaPorIdFichaRowList.first.horaInspeccion
                                                                            : '',
                                                                      ),
                                                                  focusNode: _model
                                                                      .dat1FocusNode28,
                                                                  autofocus:
                                                                  true,
                                                                  autofillHints: [
                                                                    AutofillHints
                                                                        .birthday
                                                                  ],
                                                                  obscureText:
                                                                  false,
                                                                  decoration:
                                                                  InputDecoration(
                                                                    labelText:
                                                                    'Hora de Inspección',
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                        .labelLarge
                                                                        .override(
                                                                      fontFamily:
                                                                      'Outfit',
                                                                      color:
                                                                      FlutterFlowTheme.of(context).secondaryText,
                                                                      fontSize:
                                                                      14,
                                                                      fontWeight:
                                                                      FontWeight.w500,
                                                                    ),
                                                                    enabledBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide:
                                                                      BorderSide(
                                                                        color: Color(
                                                                            0xFF2C313E),
                                                                        width:
                                                                        0.5,
                                                                      ),
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          12),
                                                                    ),
                                                                    focusedBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide:
                                                                      BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        width:
                                                                        0.5,
                                                                      ),
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          12),
                                                                    ),
                                                                    errorBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide:
                                                                      BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        width:
                                                                        0.5,
                                                                      ),
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          12),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide:
                                                                      BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        width:
                                                                        0.5,
                                                                      ),
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          12),
                                                                    ),
                                                                    filled:
                                                                    true,
                                                                    fillColor: FlutterFlowTheme.of(
                                                                        context)
                                                                        .primaryBtnText,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                      context)
                                                                      .bodyLarge
                                                                      .override(
                                                                    fontFamily:
                                                                    'Outfit',
                                                                    fontSize:
                                                                    13,
                                                                    fontWeight:
                                                                    FontWeight.w300,
                                                                  ),
                                                                  keyboardType:
                                                                  TextInputType
                                                                      .datetime,
                                                                  validator: _model
                                                                      .dat1Controller28Validator
                                                                      .asValidator(
                                                                      context),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
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
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: AlignmentDirectional(1, 1),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 25, 25),
                      child: FlutterFlowIconButton(
                        borderColor: FlutterFlowTheme.of(context).primary,
                        borderRadius: 25,
                        borderWidth: 1,
                        buttonSize: 50,
                        fillColor: Color(0xFF086D82),
                        icon: Icon(
                          Icons.save,
                          color:
                          FlutterFlowTheme.of(context).secondaryBackground,
                          size: 30,
                        ),
                        onPressed: () async {
                          await SQLiteManager.instance.actualizarFicha(
                            idFicha: FFAppState().IdFicha,
                            centroPobladoColegio: _model.dat1Controller1.text,
                            direccionColegio: _model.dat1Controller2.text,
                            zonaColegio: _model.dat1Value,
                            totalPabellon:
                            int.tryParse(_model.dat1Controller3.text),
                            totalAulas:
                            int.tryParse(_model.dat1Controller4.text),
                            totalSSHH:
                            int.tryParse(_model.dat1Controller5.text),
                            dniDirector: _model.dat1Controller14.text,
                            nombreDirector: _model.dat1Controller15.text,
                            correoDirector: _model.dat1Controller16.text,
                            telefonoDirector: _model.dat1Controller17.text,
                            dniAlterno: _model.dat1Controller18.text,
                            nombreAlterno: _model.dat1Controller19.text,
                            correoAlterno: _model.dat1Controller20.text,
                            telefonoAlterno: _model.dat1Controller21.text,
                            dniInspector: _model.dat1Controller22.text,
                            nombreInspector: _model.dat1Controller23.text,
                            correoInspector: _model.dat1Controller24.text,
                            telefonoInspector: _model.dat1Controller25.text,
                            fechaInspeccion: _model.dat1Controller27.text,
                            horaInspeccion: _model.dat1Controller28.text,
                            tipoInspeccion: _model.dat1Controller26.text,
                            UsuarioModificacionAudi: "SAMADOR",
                            modificadoMovil: 1,
                            FechaModificacionAuditoria: DateTime.now().toString(),
                            EquipoModificacionAuditoria: "localhost"
                          );


                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Actualizado Correctamente',
                                style: TextStyle(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                              FlutterFlowTheme.of(context).primary,
                            ),
                          );
                        },
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

class FichaModularData {
  String? codigoModular;
  int? numeroAlumnos;
  int? numeroHombres;
  int? numeroMujeres;
  int? numeroDocente;
  int? numeroSeccion;

  FichaModularData({
    required this.codigoModular,
    required this.numeroAlumnos,
    required this.numeroHombres,
    required this.numeroMujeres,
    required this.numeroDocente,
    required this.numeroSeccion,
  });
}

void actualizarFichaMod({
  required String codigoModular,
  required int numeroHombres,
  required int numeroMujeres,
  required int numeroDocente,
  required int numeroSeccion,
  required int numeroAlumnos
  // Agrega otros parámetros según sea necesario...
}) async {
  await SQLiteManager.instance.actualizarFichaMod(
    codigoModular: codigoModular,
    numeroHombres: numeroHombres,
    numeroMujeres: numeroMujeres,
    numeroDocente: numeroDocente,
    numeroSeccion: numeroSeccion,
    numeroAlumnos: numeroAlumnos,
    FechaModificacionAuditoria: DateTime.now().toString(),
    UsuarioModificacionAudi: "SAMADOR",
    modificadoMovil: 1,
    EquipoModificacionAuditoria: "localhost"
    // Proporciona los otros parámetros según sea necesario...
  );
}


