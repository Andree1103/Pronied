import '/backend/sqlite/sqlite_manager.dart';
import '/components/drop_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'lista_inspecciones_model.dart';
export 'lista_inspecciones_model.dart';

class ListaInspeccionesWidget extends StatefulWidget {
  const ListaInspeccionesWidget({super.key});

  @override
  State<ListaInspeccionesWidget> createState() =>
      _ListaInspeccionesWidgetState();
}

class _ListaInspeccionesWidgetState extends State<ListaInspeccionesWidget>
    with TickerProviderStateMixin {
  late ListaInspeccionesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListaInspeccionesModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 4,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: AppBar(
            backgroundColor: Color(0xFF0E1C27),
            automaticallyImplyLeading: false,
            actions: [],
            flexibleSpace: FlexibleSpaceBar(
              title: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30,
                              borderWidth: 1,
                              buttonSize: 50,
                              icon: Icon(
                                Icons.arrow_back_rounded,
                                color: Colors.white,
                                size: 30,
                              ),
                              onPressed: () async {
                                context.pushNamed('Login');
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Inspecciones',
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                              fontFamily: 'Outfit',
                              color: Colors.white,
                              lineHeight: 1.2,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return GestureDetector(
                                      onTap: () => _model
                                          .unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                          .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                      child: Padding(
                                        padding:
                                        MediaQuery.viewInsetsOf(context),
                                        child: Container(
                                          height: 200,
                                          child: DropWidget(),
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              },
                              child: Icon(
                                Icons.more_vert_sharp,
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              centerTitle: true,
              expandedTitleScale: 1.0,
            ),
            elevation: 0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  height: 700,
                  decoration: BoxDecoration(
                    color: Color(0xFF0E1C27),
                    border: Border.all(
                      color: Colors.transparent,
                      width: 0,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment(0, 0),
                                child: FlutterFlowButtonTabBar(
                                  useToggleButtonStyle: false,
                                  isScrollable: true,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                    fontFamily: 'Outfit',
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  unselectedLabelStyle: TextStyle(),
                                  labelColor:
                                  FlutterFlowTheme.of(context).primaryText,
                                  unselectedLabelColor:
                                  FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  backgroundColor:
                                  FlutterFlowTheme.of(context).accent1,
                                  unselectedBackgroundColor:
                                  FlutterFlowTheme.of(context).alternate,
                                  borderColor:
                                  FlutterFlowTheme.of(context).primary,
                                  unselectedBorderColor:
                                  FlutterFlowTheme.of(context).alternate,
                                  borderWidth: 2,
                                  borderRadius: 8,
                                  elevation: 0,
                                  labelPadding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 10, 0),
                                  buttonMargin: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 10, 0),
                                  padding: EdgeInsets.all(2),
                                  tabs: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 5, 0),
                                          child: FaIcon(
                                            FontAwesomeIcons.stream,
                                            size: 12,
                                          ),
                                        ),
                                        Tab(
                                          text: 'Todos',
                                        ),
                                      ],
                                    ),
                                    Tab(
                                      text: 'En Proceso',
                                    ),
                                    Tab(
                                      text: 'Realizada',
                                    ),
                                    Tab(
                                      text: 'Programadas',
                                    ),
                                  ],
                                  controller: _model.tabBarController,
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
                                  controller: _model.tabBarController,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 0),
                                      child: Container(
                                        width: 100,
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Flexible(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(15, 15, 15, 0),
                                                child: FutureBuilder<
                                                    List<
                                                        ListarInspeccionesRow>>(
                                                  future: SQLiteManager.instance
                                                      .listarInspecciones(),
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
                                                    final listViewListarInspeccionesRowList =
                                                    snapshot.data!;
                                                    return ListView.separated(
                                                      padding: EdgeInsets.zero,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                      Axis.vertical,
                                                      itemCount:
                                                      listViewListarInspeccionesRowList
                                                          .length,
                                                      separatorBuilder: (_,
                                                          __) =>
                                                          SizedBox(height: 15),
                                                      itemBuilder: (context,
                                                          listViewIndex) {
                                                        final listViewListarInspeccionesRow =
                                                        listViewListarInspeccionesRowList[
                                                        listViewIndex];
                                                        return Card(
                                                          clipBehavior: Clip
                                                              .antiAliasWithSaveLayer,
                                                          color: FlutterFlowTheme
                                                              .of(context)
                                                              .secondaryBackground,
                                                          elevation: 6,
                                                          shape:
                                                          RoundedRectangleBorder(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                8),
                                                          ),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                            Colors
                                                                .transparent,
                                                            onTap: () async {
                                                              setState(() {
                                                                FFAppState()
                                                                    .IdFicha =
                                                                listViewListarInspeccionesRow
                                                                    .idFicha!;
                                                                FFAppState()
                                                                    .idPlantillaSeccionPadre =
                                                                listViewListarInspeccionesRow
                                                                    .idPlantilla!;
                                                                FFAppState()
                                                                    .idpregunta =
                                                                listViewListarInspeccionesRow
                                                                    .idInspeccion!;
                                                                FFAppState()
                                                                    .IdPlantilla =
                                                                listViewListarInspeccionesRow
                                                                    .idPlantilla!;
                                                                FFAppState()
                                                                    .idPlantillaSeccion =
                                                                listViewListarInspeccionesRow
                                                                    .idPlantilla!;
                                                              });

                                                              context.pushNamed(
                                                                  'DatosGenerales');
                                                            },
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                              BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                    context)
                                                                    .secondaryBackground,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    blurRadius:
                                                                    0,
                                                                    color: FlutterFlowTheme.of(
                                                                        context)
                                                                        .secondaryBackground,
                                                                    offset:
                                                                    Offset(
                                                                        0,
                                                                        1),
                                                                  )
                                                                ],
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    8),
                                                                border:
                                                                Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                      context)
                                                                      .secondaryBackground,
                                                                ),
                                                              ),
                                                              child: Column(
                                                                mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                                children: [
                                                                  Padding(
                                                                    padding:
                                                                    EdgeInsets
                                                                        .all(8),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                      children: [
                                                                        Icon(
                                                                          Icons
                                                                              .school,
                                                                          color:
                                                                          Color(0xFF086D82),
                                                                          size:
                                                                          35,
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                12,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                            Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                                                                                  child: Container(
                                                                                    width: double.infinity,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    ),
                                                                                    child: SingleChildScrollView(
                                                                                      scrollDirection: Axis.horizontal,
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                                                                                            child: Text(
                                                                                              valueOrDefault<String>(
                                                                                                listViewListarInspeccionesRow.codigoLocalColegio,
                                                                                                's',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                fontFamily: 'Outfit',
                                                                                                color: Color(0xFF086D82),
                                                                                                fontWeight: FontWeight.bold,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Text(
                                                                                            valueOrDefault<String>(
                                                                                              listViewListarInspeccionesRow.nombreLocalColegio,
                                                                                              's',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                              fontFamily: 'Outfit',
                                                                                              color: Color(0xFF086D82),
                                                                                              fontWeight: FontWeight.bold,
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Text(
                                                                                      valueOrDefault<String>(
                                                                                        listViewListarInspeccionesRow.departamentoColegio,
                                                                                        's',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Outfit',
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        fontSize: 13,
                                                                                      ),
                                                                                    ),
                                                                                    Text(
                                                                                      '/',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                    ),
                                                                                    Text(
                                                                                      valueOrDefault<String>(
                                                                                        listViewListarInspeccionesRow.provinciaColegio,
                                                                                        's',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Outfit',
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        fontSize: 13,
                                                                                      ),
                                                                                    ),
                                                                                    Text(
                                                                                      '/',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                    ),
                                                                                    Text(
                                                                                      valueOrDefault<String>(
                                                                                        listViewListarInspeccionesRow.distritoColegio,
                                                                                        's',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Outfit',
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        fontSize: 13,
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
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                    AlignmentDirectional(
                                                                        -1,
                                                                        0),
                                                                    child:
                                                                    Container(
                                                                      width: double
                                                                          .infinity,
                                                                      decoration:
                                                                      BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .lineColor,
                                                                      ),
                                                                      child:
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            55,
                                                                            10,
                                                                            10,
                                                                            10),
                                                                        child:
                                                                        Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            listViewListarInspeccionesRow.nombreEvento,
                                                                            'ssss',
                                                                          ),
                                                                          style:
                                                                          FlutterFlowTheme.of(context).bodyMedium,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: double
                                                                        .infinity,
                                                                    height: 64,
                                                                    decoration:
                                                                    BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                          context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          12),
                                                                    ),
                                                                    child:
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          25,
                                                                          10,
                                                                          25,
                                                                          10),
                                                                      child:
                                                                      Row(
                                                                        mainAxisSize:
                                                                        MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                        MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                            130,
                                                                            height:
                                                                            100,
                                                                            decoration:
                                                                            BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            child:
                                                                            Column(
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
                                                                                          Icons.sd_card_alert,
                                                                                          color: () {
                                                                                            if (listViewListarInspeccionesRow.idEstado == 3) {
                                                                                              return FlutterFlowTheme.of(context).darkSeaGreen;
                                                                                            } else if (listViewListarInspeccionesRow.idEstado == 2) {
                                                                                              return FlutterFlowTheme.of(context).gray600;
                                                                                            } else if (listViewListarInspeccionesRow.idEstado == 4) {
                                                                                              return FlutterFlowTheme.of(context).warning;
                                                                                            } else {
                                                                                              return FlutterFlowTheme.of(context).secondary;
                                                                                            }
                                                                                          }(),
                                                                                          size: 24,
                                                                                        ),
                                                                                      ),
                                                                                      Text(
                                                                                        valueOrDefault<String>(
                                                                                          listViewListarInspeccionesRow.estado,
                                                                                          'estado',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(14, 0, 0, 0),
                                                                                  child: Text(
                                                                                    '30/01/2023 10:45 AM',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Outfit',
                                                                                      fontSize: 9,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                            130,
                                                                            height:
                                                                            100,
                                                                            decoration:
                                                                            BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            child:
                                                                            Column(
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
                                                                                          color: FlutterFlowTheme.of(context).darkSeaGreen,
                                                                                          size: 24,
                                                                                        ),
                                                                                      ),
                                                                                      Text(
                                                                                        'Realizada',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(14, 0, 0, 0),
                                                                                  child: Text(
                                                                                    '30/01/2023 10:45 AM',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 0),
                                      child: Container(
                                        width: 100,
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Flexible(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(15, 15, 15, 0),
                                                child: FutureBuilder<
                                                    List<
                                                        ListarInspeccionesProcessRow>>(
                                                  future: SQLiteManager.instance
                                                      .listarInspeccionesProcess(),
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
                                                    final listViewListarInspeccionesProcessRowList =
                                                    snapshot.data!;
                                                    return ListView.separated(
                                                      padding: EdgeInsets.zero,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                      Axis.vertical,
                                                      itemCount:
                                                      listViewListarInspeccionesProcessRowList
                                                          .length,
                                                      separatorBuilder: (_,
                                                          __) =>
                                                          SizedBox(height: 15),
                                                      itemBuilder: (context,
                                                          listViewIndex) {
                                                        final listViewListarInspeccionesProcessRow =
                                                        listViewListarInspeccionesProcessRowList[
                                                        listViewIndex];
                                                        return Card(
                                                          clipBehavior: Clip
                                                              .antiAliasWithSaveLayer,
                                                          color: FlutterFlowTheme
                                                              .of(context)
                                                              .secondaryBackground,
                                                          elevation: 6,
                                                          shape:
                                                          RoundedRectangleBorder(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                8),
                                                          ),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                            Colors
                                                                .transparent,
                                                            onTap: () async {
                                                              setState(() {
                                                                FFAppState()
                                                                    .IdFicha =
                                                                listViewListarInspeccionesProcessRow
                                                                    .idFicha!;
                                                                FFAppState()
                                                                    .idPlantillaSeccionPadre =
                                                                listViewListarInspeccionesProcessRow
                                                                    .idPlantilla!;
                                                                FFAppState()
                                                                    .idpregunta =
                                                                listViewListarInspeccionesProcessRow
                                                                    .idInspeccion!;
                                                                FFAppState()
                                                                    .IdPlantilla =
                                                                listViewListarInspeccionesProcessRow
                                                                    .idPlantilla!;
                                                                FFAppState()
                                                                    .idPlantillaSeccion =
                                                                listViewListarInspeccionesProcessRow
                                                                    .idPlantilla!;
                                                              });

                                                              context.pushNamed(
                                                                  'DatosGenerales');
                                                            },
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                              BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                    context)
                                                                    .secondaryBackground,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    blurRadius:
                                                                    0,
                                                                    color: FlutterFlowTheme.of(
                                                                        context)
                                                                        .secondaryBackground,
                                                                    offset:
                                                                    Offset(
                                                                        0,
                                                                        1),
                                                                  )
                                                                ],
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    8),
                                                                border:
                                                                Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                      context)
                                                                      .secondaryBackground,
                                                                ),
                                                              ),
                                                              child: Column(
                                                                mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                                children: [
                                                                  Padding(
                                                                    padding:
                                                                    EdgeInsets
                                                                        .all(8),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                      children: [
                                                                        Icon(
                                                                          Icons
                                                                              .school,
                                                                          color:
                                                                          Color(0xFF086D82),
                                                                          size:
                                                                          35,
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                12,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                            Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                                                                                  child: Container(
                                                                                    width: double.infinity,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    ),
                                                                                    child: SingleChildScrollView(
                                                                                      scrollDirection: Axis.horizontal,
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                                                                                            child: Text(
                                                                                              valueOrDefault<String>(
                                                                                                listViewListarInspeccionesProcessRow.codigoLocalColegio,
                                                                                                's',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                fontFamily: 'Outfit',
                                                                                                color: Color(0xFF086D82),
                                                                                                fontWeight: FontWeight.bold,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Text(
                                                                                            valueOrDefault<String>(
                                                                                              listViewListarInspeccionesProcessRow.nombreLocalColegio,
                                                                                              's',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                              fontFamily: 'Outfit',
                                                                                              color: Color(0xFF086D82),
                                                                                              fontWeight: FontWeight.bold,
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Text(
                                                                                      valueOrDefault<String>(
                                                                                        listViewListarInspeccionesProcessRow.departamentoColegio,
                                                                                        's',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Outfit',
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        fontSize: 13,
                                                                                      ),
                                                                                    ),
                                                                                    Text(
                                                                                      '/',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                    ),
                                                                                    Text(
                                                                                      valueOrDefault<String>(
                                                                                        listViewListarInspeccionesProcessRow.provinciaColegio,
                                                                                        's',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Outfit',
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        fontSize: 13,
                                                                                      ),
                                                                                    ),
                                                                                    Text(
                                                                                      '/',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                    ),
                                                                                    Text(
                                                                                      valueOrDefault<String>(
                                                                                        listViewListarInspeccionesProcessRow.distritoColegio,
                                                                                        's',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Outfit',
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        fontSize: 13,
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
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                    AlignmentDirectional(
                                                                        -1,
                                                                        0),
                                                                    child:
                                                                    Container(
                                                                      width: double
                                                                          .infinity,
                                                                      decoration:
                                                                      BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .lineColor,
                                                                      ),
                                                                      child:
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            55,
                                                                            10,
                                                                            10,
                                                                            10),
                                                                        child:
                                                                        Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            listViewListarInspeccionesProcessRow.nombreEvento,
                                                                            'ssss',
                                                                          ),
                                                                          style:
                                                                          FlutterFlowTheme.of(context).bodyMedium,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: double
                                                                        .infinity,
                                                                    height: 64,
                                                                    decoration:
                                                                    BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                          context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          12),
                                                                    ),
                                                                    child:
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          25,
                                                                          10,
                                                                          25,
                                                                          10),
                                                                      child:
                                                                      Row(
                                                                        mainAxisSize:
                                                                        MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                        MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                            130,
                                                                            height:
                                                                            100,
                                                                            decoration:
                                                                            BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            child:
                                                                            Column(
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
                                                                                          Icons.sd_card_alert,
                                                                                          color: () {
                                                                                            if (listViewListarInspeccionesProcessRow.idEstado == 3) {
                                                                                              return FlutterFlowTheme.of(context).darkSeaGreen;
                                                                                            } else if (listViewListarInspeccionesProcessRow.idEstado == 2) {
                                                                                              return FlutterFlowTheme.of(context).gray600;
                                                                                            } else if (listViewListarInspeccionesProcessRow.idEstado == 4) {
                                                                                              return FlutterFlowTheme.of(context).warning;
                                                                                            } else {
                                                                                              return FlutterFlowTheme.of(context).secondary;
                                                                                            }
                                                                                          }(),
                                                                                          size: 24,
                                                                                        ),
                                                                                      ),
                                                                                      Text(
                                                                                        valueOrDefault<String>(
                                                                                          listViewListarInspeccionesProcessRow.estado,
                                                                                          'estado',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(14, 0, 0, 0),
                                                                                  child: Text(
                                                                                    '30/01/2023 10:45 AM',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Outfit',
                                                                                      fontSize: 9,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                            130,
                                                                            height:
                                                                            100,
                                                                            decoration:
                                                                            BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            child:
                                                                            Column(
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
                                                                                          color: FlutterFlowTheme.of(context).darkSeaGreen,
                                                                                          size: 24,
                                                                                        ),
                                                                                      ),
                                                                                      Text(
                                                                                        'Realizada',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(14, 0, 0, 0),
                                                                                  child: Text(
                                                                                    '30/01/2023 10:45 AM',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 0),
                                      child: Container(
                                        width: 100,
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Flexible(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(15, 15, 15, 0),
                                                child: FutureBuilder<
                                                    List<
                                                        ListarInspeccionesRealizadaRow>>(
                                                  future: SQLiteManager.instance
                                                      .listarInspeccionesRealizada(),
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
                                                    final listViewListarInspeccionesRealizadaRowList =
                                                    snapshot.data!;
                                                    return ListView.separated(
                                                      padding: EdgeInsets.zero,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                      Axis.vertical,
                                                      itemCount:
                                                      listViewListarInspeccionesRealizadaRowList
                                                          .length,
                                                      separatorBuilder: (_,
                                                          __) =>
                                                          SizedBox(height: 15),
                                                      itemBuilder: (context,
                                                          listViewIndex) {
                                                        final listViewListarInspeccionesRealizadaRow =
                                                        listViewListarInspeccionesRealizadaRowList[
                                                        listViewIndex];
                                                        return Card(
                                                          clipBehavior: Clip
                                                              .antiAliasWithSaveLayer,
                                                          color: FlutterFlowTheme
                                                              .of(context)
                                                              .secondaryBackground,
                                                          elevation: 6,
                                                          shape:
                                                          RoundedRectangleBorder(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                8),
                                                          ),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                            Colors
                                                                .transparent,
                                                            onTap: () async {
                                                              setState(() {
                                                                FFAppState()
                                                                    .IdFicha =
                                                                listViewListarInspeccionesRealizadaRow
                                                                    .idFicha!;
                                                                FFAppState()
                                                                    .idPlantillaSeccionPadre =
                                                                listViewListarInspeccionesRealizadaRow
                                                                    .idPlantilla!;
                                                                FFAppState()
                                                                    .idpregunta =
                                                                listViewListarInspeccionesRealizadaRow
                                                                    .idInspeccion!;
                                                                FFAppState()
                                                                    .IdPlantilla =
                                                                listViewListarInspeccionesRealizadaRow
                                                                    .idPlantilla!;
                                                                FFAppState()
                                                                    .idPlantillaSeccion =
                                                                listViewListarInspeccionesRealizadaRow
                                                                    .idPlantilla!;
                                                              });

                                                              context.pushNamed(
                                                                  'DatosGenerales');
                                                            },
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                              BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                    context)
                                                                    .secondaryBackground,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    blurRadius:
                                                                    0,
                                                                    color: FlutterFlowTheme.of(
                                                                        context)
                                                                        .secondaryBackground,
                                                                    offset:
                                                                    Offset(
                                                                        0,
                                                                        1),
                                                                  )
                                                                ],
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    8),
                                                                border:
                                                                Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                      context)
                                                                      .secondaryBackground,
                                                                ),
                                                              ),
                                                              child: Column(
                                                                mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                                children: [
                                                                  Padding(
                                                                    padding:
                                                                    EdgeInsets
                                                                        .all(8),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                      children: [
                                                                        Icon(
                                                                          Icons
                                                                              .school,
                                                                          color:
                                                                          Color(0xFF086D82),
                                                                          size:
                                                                          35,
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                12,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                            Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                                                                                  child: Container(
                                                                                    width: double.infinity,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    ),
                                                                                    child: SingleChildScrollView(
                                                                                      scrollDirection: Axis.horizontal,
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                                                                                            child: Text(
                                                                                              valueOrDefault<String>(
                                                                                                listViewListarInspeccionesRealizadaRow.codigoLocalColegio,
                                                                                                's',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                fontFamily: 'Outfit',
                                                                                                color: Color(0xFF086D82),
                                                                                                fontWeight: FontWeight.bold,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Text(
                                                                                            valueOrDefault<String>(
                                                                                              listViewListarInspeccionesRealizadaRow.nombreLocalColegio,
                                                                                              's',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                              fontFamily: 'Outfit',
                                                                                              color: Color(0xFF086D82),
                                                                                              fontWeight: FontWeight.bold,
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Text(
                                                                                      valueOrDefault<String>(
                                                                                        listViewListarInspeccionesRealizadaRow.departamentoColegio,
                                                                                        's',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Outfit',
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        fontSize: 13,
                                                                                      ),
                                                                                    ),
                                                                                    Text(
                                                                                      '/',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                    ),
                                                                                    Text(
                                                                                      valueOrDefault<String>(
                                                                                        listViewListarInspeccionesRealizadaRow.provinciaColegio,
                                                                                        's',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Outfit',
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        fontSize: 13,
                                                                                      ),
                                                                                    ),
                                                                                    Text(
                                                                                      '/',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                    ),
                                                                                    Text(
                                                                                      valueOrDefault<String>(
                                                                                        listViewListarInspeccionesRealizadaRow.distritoColegio,
                                                                                        's',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Outfit',
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        fontSize: 13,
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
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                    AlignmentDirectional(
                                                                        -1,
                                                                        0),
                                                                    child:
                                                                    Container(
                                                                      width: double
                                                                          .infinity,
                                                                      decoration:
                                                                      BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .lineColor,
                                                                      ),
                                                                      child:
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            55,
                                                                            10,
                                                                            10,
                                                                            10),
                                                                        child:
                                                                        Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            listViewListarInspeccionesRealizadaRow.nombreEvento,
                                                                            'ssss',
                                                                          ),
                                                                          style:
                                                                          FlutterFlowTheme.of(context).bodyMedium,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: double
                                                                        .infinity,
                                                                    height: 64,
                                                                    decoration:
                                                                    BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                          context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          12),
                                                                    ),
                                                                    child:
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          25,
                                                                          10,
                                                                          25,
                                                                          10),
                                                                      child:
                                                                      Row(
                                                                        mainAxisSize:
                                                                        MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                        MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                            130,
                                                                            height:
                                                                            100,
                                                                            decoration:
                                                                            BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            child:
                                                                            Column(
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
                                                                                          Icons.sd_card_alert,
                                                                                          color: () {
                                                                                            if (listViewListarInspeccionesRealizadaRow.idEstado == 3) {
                                                                                              return FlutterFlowTheme.of(context).darkSeaGreen;
                                                                                            } else if (listViewListarInspeccionesRealizadaRow.idEstado == 2) {
                                                                                              return FlutterFlowTheme.of(context).gray600;
                                                                                            } else if (listViewListarInspeccionesRealizadaRow.idEstado == 4) {
                                                                                              return FlutterFlowTheme.of(context).warning;
                                                                                            } else {
                                                                                              return FlutterFlowTheme.of(context).secondary;
                                                                                            }
                                                                                          }(),
                                                                                          size: 24,
                                                                                        ),
                                                                                      ),
                                                                                      Text(
                                                                                        valueOrDefault<String>(
                                                                                          listViewListarInspeccionesRealizadaRow.estado,
                                                                                          'estado',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(14, 0, 0, 0),
                                                                                  child: Text(
                                                                                    '30/01/2023 10:45 AM',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Outfit',
                                                                                      fontSize: 9,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                            130,
                                                                            height:
                                                                            100,
                                                                            decoration:
                                                                            BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            child:
                                                                            Column(
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
                                                                                          color: FlutterFlowTheme.of(context).darkSeaGreen,
                                                                                          size: 24,
                                                                                        ),
                                                                                      ),
                                                                                      Text(
                                                                                        'Realizada',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(14, 0, 0, 0),
                                                                                  child: Text(
                                                                                    '30/01/2023 10:45 AM',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 0),
                                      child: Container(
                                        width: 100,
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Flexible(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(15, 15, 15, 0),
                                                child: FutureBuilder<
                                                    List<
                                                        ListarInspeccionesProgramadaRow>>(
                                                  future: SQLiteManager.instance
                                                      .listarInspeccionesProgramada(),
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
                                                    final listViewListarInspeccionesProgramadaRowList =
                                                    snapshot.data!;
                                                    return ListView.separated(
                                                      padding: EdgeInsets.zero,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                      Axis.vertical,
                                                      itemCount:
                                                      listViewListarInspeccionesProgramadaRowList
                                                          .length,
                                                      separatorBuilder: (_,
                                                          __) =>
                                                          SizedBox(height: 15),
                                                      itemBuilder: (context,
                                                          listViewIndex) {
                                                        final listViewListarInspeccionesProgramadaRow =
                                                        listViewListarInspeccionesProgramadaRowList[
                                                        listViewIndex];
                                                        return Card(
                                                          clipBehavior: Clip
                                                              .antiAliasWithSaveLayer,
                                                          color: FlutterFlowTheme
                                                              .of(context)
                                                              .secondaryBackground,
                                                          elevation: 6,
                                                          shape:
                                                          RoundedRectangleBorder(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                8),
                                                          ),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                            Colors
                                                                .transparent,
                                                            onTap: () async {
                                                              setState(() {
                                                                FFAppState()
                                                                    .IdFicha =
                                                                listViewListarInspeccionesProgramadaRow
                                                                    .idFicha!;
                                                                FFAppState()
                                                                    .idPlantillaSeccionPadre =
                                                                listViewListarInspeccionesProgramadaRow
                                                                    .idPlantilla!;
                                                                FFAppState()
                                                                    .idpregunta =
                                                                listViewListarInspeccionesProgramadaRow
                                                                    .idInspeccion!;
                                                                FFAppState()
                                                                    .IdPlantilla =
                                                                listViewListarInspeccionesProgramadaRow
                                                                    .idPlantilla!;
                                                                FFAppState()
                                                                    .idPlantillaSeccion =
                                                                listViewListarInspeccionesProgramadaRow
                                                                    .idPlantilla!;
                                                              });

                                                              context.pushNamed(
                                                                  'DatosGenerales');
                                                            },
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                              BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                    context)
                                                                    .secondaryBackground,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    blurRadius:
                                                                    0,
                                                                    color: FlutterFlowTheme.of(
                                                                        context)
                                                                        .secondaryBackground,
                                                                    offset:
                                                                    Offset(
                                                                        0,
                                                                        1),
                                                                  )
                                                                ],
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    8),
                                                                border:
                                                                Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                      context)
                                                                      .secondaryBackground,
                                                                ),
                                                              ),
                                                              child: Column(
                                                                mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                                children: [
                                                                  Padding(
                                                                    padding:
                                                                    EdgeInsets
                                                                        .all(8),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                      children: [
                                                                        Icon(
                                                                          Icons
                                                                              .school,
                                                                          color:
                                                                          Color(0xFF086D82),
                                                                          size:
                                                                          35,
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                12,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                            Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                                                                                  child: Container(
                                                                                    width: double.infinity,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    ),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                                                                                          child: Text(
                                                                                            valueOrDefault<String>(
                                                                                              listViewListarInspeccionesProgramadaRow.codigoLocalColegio,
                                                                                              's',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                              fontFamily: 'Outfit',
                                                                                              color: Color(0xFF086D82),
                                                                                              fontWeight: FontWeight.bold,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Text(
                                                                                          valueOrDefault<String>(
                                                                                            listViewListarInspeccionesProgramadaRow.nombreLocalColegio,
                                                                                            's',
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                            fontFamily: 'Outfit',
                                                                                            color: Color(0xFF086D82),
                                                                                            fontWeight: FontWeight.bold,
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Text(
                                                                                      valueOrDefault<String>(
                                                                                        listViewListarInspeccionesProgramadaRow.departamentoColegio,
                                                                                        's',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Outfit',
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        fontSize: 13,
                                                                                      ),
                                                                                    ),
                                                                                    Text(
                                                                                      '/',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                    ),
                                                                                    Text(
                                                                                      valueOrDefault<String>(
                                                                                        listViewListarInspeccionesProgramadaRow.provinciaColegio,
                                                                                        's',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Outfit',
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        fontSize: 13,
                                                                                      ),
                                                                                    ),
                                                                                    Text(
                                                                                      '/',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                    ),
                                                                                    Text(
                                                                                      valueOrDefault<String>(
                                                                                        listViewListarInspeccionesProgramadaRow.distritoColegio,
                                                                                        's',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Outfit',
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        fontSize: 13,
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
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                    AlignmentDirectional(
                                                                        -1,
                                                                        0),
                                                                    child:
                                                                    Container(
                                                                      width: double
                                                                          .infinity,
                                                                      decoration:
                                                                      BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .lineColor,
                                                                      ),
                                                                      child:
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            55,
                                                                            10,
                                                                            10,
                                                                            10),
                                                                        child:
                                                                        Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            listViewListarInspeccionesProgramadaRow.nombreEvento,
                                                                            'ssss',
                                                                          ),
                                                                          style:
                                                                          FlutterFlowTheme.of(context).bodyMedium,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: double
                                                                        .infinity,
                                                                    height: 64,
                                                                    decoration:
                                                                    BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                          context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          12),
                                                                    ),
                                                                    child:
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          25,
                                                                          10,
                                                                          25,
                                                                          10),
                                                                      child:
                                                                      Row(
                                                                        mainAxisSize:
                                                                        MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                        MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                            130,
                                                                            height:
                                                                            100,
                                                                            decoration:
                                                                            BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            child:
                                                                            Column(
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
                                                                                          Icons.sd_card_alert,
                                                                                          color: () {
                                                                                            if (listViewListarInspeccionesProgramadaRow.idEstado == 3) {
                                                                                              return FlutterFlowTheme.of(context).darkSeaGreen;
                                                                                            } else if (listViewListarInspeccionesProgramadaRow.idEstado == 2) {
                                                                                              return FlutterFlowTheme.of(context).gray600;
                                                                                            } else if (listViewListarInspeccionesProgramadaRow.idEstado == 4) {
                                                                                              return FlutterFlowTheme.of(context).warning;
                                                                                            } else {
                                                                                              return FlutterFlowTheme.of(context).secondary;
                                                                                            }
                                                                                          }(),
                                                                                          size: 24,
                                                                                        ),
                                                                                      ),
                                                                                      Text(
                                                                                        valueOrDefault<String>(
                                                                                          listViewListarInspeccionesProgramadaRow.estado,
                                                                                          'estado',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(14, 0, 0, 0),
                                                                                  child: Text(
                                                                                    '30/01/2023 10:45 AM',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Outfit',
                                                                                      fontSize: 9,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                            130,
                                                                            height:
                                                                            100,
                                                                            decoration:
                                                                            BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            child:
                                                                            Column(
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
                                                                                          color: FlutterFlowTheme.of(context).darkSeaGreen,
                                                                                          size: 24,
                                                                                        ),
                                                                                      ),
                                                                                      Text(
                                                                                        'Realizada',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(14, 0, 0, 0),
                                                                                  child: Text(
                                                                                    '30/01/2023 10:45 AM',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
