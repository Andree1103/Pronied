import 'package:inspecciones_p_r_o_n_i_e_d/Utils/ConstAlerts.dart';
import 'package:inspecciones_p_r_o_n_i_e_d/Utils/ConstansColors.dart';
import 'package:inspecciones_p_r_o_n_i_e_d/Utils/ConstansText.dart';

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

    Future<bool> _onBackPressed() async {
      return (await showModalBottomSheet(context: context, builder: (context){
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
          child: Padding(
            padding: MediaQuery.viewInsetsOf(context),
            child: Container(
                height: 200,
                child: Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 4.0,
                        color: Color(0x33000000),
                        offset: Offset(
                          0.0,
                          2.0,
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 15.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                            child: Text(
                              ConstAlerts.cerrar_Sesion,
                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Outfit',
                                fontSize: 15.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              context.pushNamed(
                                  'Login');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    ConstAlerts.logoutsucess,
                                    style: TextStyle(
                                      color:
                                      FlutterFlowTheme.of(context).secondaryBackground,
                                    ),
                                  ),
                                  duration: const Duration(milliseconds: 4000),
                                  backgroundColor: FlutterFlowTheme.of(context).primary,
                                ),
                              );
                            },
                            text: ConstansTetx.aceptar,
                            options: FFButtonOptions(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 40.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                              iconPadding:
                              const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).error,
                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Outfit',
                                color: Colors.white,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                              ),
                              elevation: 3.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              Navigator.of(context).pop(false);
                            },
                            text: ConstansTetx.cancelar,
                            options: FFButtonOptions(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 40.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                              iconPadding:
                              const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primaryBackground,
                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Outfit',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                              ),
                              elevation: 3.0,
                              borderSide: const BorderSide(
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
                )
            ),
          ),
        );
      })) ?? false;
    }
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: _onBackPressed,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100),
            child: AppBar(
              backgroundColor: ConstansColors.bluedark,
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
                          Expanded(
                            child: Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                              child: Text(
                                ConstansTetx.inspecciones,
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                  fontFamily: 'Outfit',
                                  color: Colors.white,
                                  letterSpacing: 0,
                                  lineHeight: 1.2,
                                ),
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
                                            height: MediaQuery.of(context).size.height * 0.5,
                                            child: DropWidget(),
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                },
                                child: Icon(
                                  Icons.settings,
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
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 1,
                    decoration: BoxDecoration(
                      color: ConstansColors.bluedark,
                      border: Border.all(
                        color: Colors.transparent,
                        width: 0,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                                            text: ConstansTetx.todos,
                                          ),
                                        ],
                                      ),
                                      Tab(
                                        text: ConstansTetx.en_proceso1,
                                      ),
                                      Tab(
                                        text: ConstansTetx.realizada1,
                                      ),
                                      Tab(
                                        text: ConstansTetx.programadas1,
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
                                    physics: const NeverScrollableScrollPhysics(),
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
                                          child: Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                15, 15, 15, 25),
                                            child: FutureBuilder<
                                                List<ListarInspeccionesRow>>(
                                              future: SQLiteManager.instance
                                                  .listarInspecciones(
                                                  dniInspector: FFAppState().username
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
                                                final columnListarInspeccionesRowList =
                                                snapshot.data!;
                                                return SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize:
                                                    MainAxisSize.min,
                                                    children: columnListarInspeccionesRowList.isEmpty
                                                        ? [
                                                      Text(ConstAlerts.inspeccionesnull),
                                                    ]
                                                        : List.generate(
                                                        columnListarInspeccionesRowList
                                                            .length,
                                                            (columnIndex) {
                                                          final columnListarInspeccionesRow =
                                                          columnListarInspeccionesRowList[
                                                          columnIndex];
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
                                                                  .circular(8),
                                                            ),
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
                                                                setState(() {
                                                                  FFAppState()
                                                                      .IdFicha =
                                                                  columnListarInspeccionesRow
                                                                      .idFicha!;
                                                                  FFAppState()
                                                                      .idPlantillaSeccionPadre =
                                                                  columnListarInspeccionesRow
                                                                      .idPlantilla!;
                                                                  FFAppState()
                                                                      .idpregunta =
                                                                  columnListarInspeccionesRow
                                                                      .idInspeccion!;
                                                                  FFAppState()
                                                                      .IdPlantilla =
                                                                  columnListarInspeccionesRow
                                                                      .idPlantilla!;
                                                                  FFAppState()
                                                                      .idPlantillaSeccion =
                                                                  columnListarInspeccionesRow
                                                                      .idPlantilla!;
                                                                  FFAppState()
                                                                      .estadoInspeccion =
                                                                  columnListarInspeccionesRow
                                                                      .estado!;
                                                                  FFAppState()
                                                                      .idestadoInspeccion =
                                                                  columnListarInspeccionesRow
                                                                      .idEstado!;
                                                                  FFAppState()
                                                                      .idInspeccion =
                                                                  columnListarInspeccionesRow
                                                                      .idInspeccion!;
                                                                  FFAppState()
                                                                      .modificadoMovil =
                                                                  columnListarInspeccionesRow
                                                                      .modificadoMovil!;
                                                                });

                                                                var ssh = await SQLiteManager.instance.listarSSHH(
                                                                    idFicha: FFAppState().IdFicha
                                                                );
                                                                FFAppState().CantS= ssh[0].totalSSHH!;

                                                                var aulas = await SQLiteManager.instance.listarAulas(
                                                                    idFicha: FFAppState().IdFicha
                                                                );
                                                                FFAppState().CantA= aulas[0].totalAulas!;

                                                                var patios = await SQLiteManager.instance.listarPabellones(
                                                                    idFicha: FFAppState().IdFicha
                                                                );
                                                                FFAppState().CantP= patios[0].totalPabellones!;

                                                                var latitud = await SQLiteManager.instance.listarLatitud(
                                                                    idFicha: FFAppState().IdFicha
                                                                );
                                                                FFAppState().latitud = latitud[0].Latitud!;

                                                                var longitud = await SQLiteManager.instance.listarLongitud(
                                                                    idFicha: FFAppState().IdFicha
                                                                );

                                                                FFAppState().longitud = longitud[0].Longitud!;

                                                                context.pushNamed(
                                                                    'DatosGenerales');
                                                              },
                                                              child: Container(
                                                                width:
                                                                double.infinity,
                                                                decoration:
                                                                BoxDecoration(
                                                                  color: FlutterFlowTheme
                                                                      .of(context)
                                                                      .secondaryBackground,
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      blurRadius: 0,
                                                                      color: FlutterFlowTheme.of(
                                                                          context)
                                                                          .secondaryBackground,
                                                                      offset: Offset(
                                                                          0, 1),
                                                                    )
                                                                  ],
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      8),
                                                                  border: Border.all(
                                                                    color: FlutterFlowTheme
                                                                        .of(context)
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
                                                                            color: Color(
                                                                                0xFF086D82),
                                                                            size: 35,
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
                                                                                mainAxisSize:
                                                                                MainAxisSize.max,
                                                                                crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
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
                                                                                                  columnListarInspeccionesRow.codigoLocalColegio,
                                                                                                  'cod',
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                  fontFamily: 'Outfit',
                                                                                                  color: ConstansColors.cyan,
                                                                                                  fontWeight: FontWeight.bold,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Text(
                                                                                              valueOrDefault<String>(
                                                                                                columnListarInspeccionesRow.nombreLocalColegio,
                                                                                                's',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                fontFamily: 'Outfit',
                                                                                                color: ConstansColors.cyan,
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
                                                                                          columnListarInspeccionesRow.departamentoColegio,
                                                                                          ConstansTetx.departamento,
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
                                                                                          columnListarInspeccionesRow.provinciaColegio,
                                                                                          ConstansTetx.provincia,
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
                                                                                          columnListarInspeccionesRow.distritoColegio,
                                                                                          ConstansTetx.distrito,
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
                                                                          -1, 0),
                                                                      child:
                                                                      Container(
                                                                        width: double
                                                                            .infinity,
                                                                        decoration:
                                                                        BoxDecoration(
                                                                          color: FlutterFlowTheme.of(
                                                                              context)
                                                                              .lineColor,
                                                                        ),
                                                                        child:
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional
                                                                              .fromSTEB(
                                                                              55,
                                                                              10,
                                                                              10,
                                                                              10),
                                                                          child: Text(
                                                                            valueOrDefault<
                                                                                String>(
                                                                              columnListarInspeccionesRow
                                                                                  .nombreEvento,
                                                                              ConstansTetx.nombre,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(
                                                                                context)
                                                                                .bodyMedium,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width: double
                                                                          .infinity,
                                                                      decoration:
                                                                      BoxDecoration(
                                                                        color: FlutterFlowTheme.of(
                                                                            context)
                                                                            .secondaryBackground,
                                                                        borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                            12),
                                                                      ),
                                                                      child: Padding(
                                                                        padding: EdgeInsetsDirectional
                                                                            .fromSTEB(
                                                                            25,
                                                                            10,
                                                                            25,
                                                                            10),
                                                                        child: Row(
                                                                          mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                          mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                          children: [
                                                                            Container(
                                                                              width:
                                                                              130,
                                                                              decoration:
                                                                              BoxDecoration(
                                                                                color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child:
                                                                              Column(
                                                                                mainAxisSize:
                                                                                MainAxisSize.max,
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
                                                                                              if (columnListarInspeccionesRow.idEstado == 3) {
                                                                                                return FlutterFlowTheme.of(context).darkSeaGreen;
                                                                                              } else if (columnListarInspeccionesRow.idEstado == 2) {
                                                                                                return FlutterFlowTheme.of(context).gray600;
                                                                                              } else if (columnListarInspeccionesRow.idEstado == 4) {
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
                                                                                            columnListarInspeccionesRow.estado,
                                                                                            ConstansTetx.estado,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              width:
                                                                              130,
                                                                              decoration:
                                                                              BoxDecoration(
                                                                                color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child:
                                                                              Column(
                                                                                mainAxisSize:
                                                                                MainAxisSize.max,
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
                                                                                            color: columnListarInspeccionesRow.modificadoMovil == 0
                                                                                                ? Colors.blue
                                                                                                : Colors.red, // Conditionally set icon color
                                                                                            size: 24,
                                                                                          ),
                                                                                        ),
                                                                                        Text(
                                                                                            columnListarInspeccionesRow.modificadoMovil == 0
                                                                                                ? ConstansTetx.SINCRONIZADO
                                                                                                : ConstansTetx.NOSINCRONIZADO, // Conditionally set text
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
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }),
                                                  ),
                                                );
                                              },
                                            ),
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
                                          child: Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                15, 15, 15, 25),
                                            child: FutureBuilder<
                                                List<
                                                    ListarInspeccionesProcessRow>>(
                                              future: SQLiteManager.instance
                                                  .listarInspeccionesProcess(
                                                  dniInspector: FFAppState().username
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
                                                final columnListarInspeccionesProcessRowList =
                                                snapshot.data!;
                                                return SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize:
                                                    MainAxisSize.min,
                                                    children: columnListarInspeccionesProcessRowList.isEmpty
                                                        ? [
                                                      Text(ConstAlerts.inspeccionesnull),
                                                    ] : List.generate(
                                                        columnListarInspeccionesProcessRowList
                                                            .length,
                                                            (columnIndex) {
                                                          final columnListarInspeccionesProcessRow =
                                                          columnListarInspeccionesProcessRowList[
                                                          columnIndex];
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
                                                                  .circular(8),
                                                            ),
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
                                                                setState(() {
                                                                  FFAppState()
                                                                      .IdFicha =
                                                                  columnListarInspeccionesProcessRow
                                                                      .idFicha!;
                                                                  FFAppState()
                                                                      .idPlantillaSeccionPadre =
                                                                  columnListarInspeccionesProcessRow
                                                                      .idPlantilla!;
                                                                  FFAppState()
                                                                      .idpregunta =
                                                                  columnListarInspeccionesProcessRow
                                                                      .idInspeccion!;
                                                                  FFAppState()
                                                                      .IdPlantilla =
                                                                  columnListarInspeccionesProcessRow
                                                                      .idPlantilla!;
                                                                  FFAppState()
                                                                      .idPlantillaSeccion =
                                                                  columnListarInspeccionesProcessRow
                                                                      .idPlantilla!;
                                                                  FFAppState()
                                                                      .estadoInspeccion =
                                                                  columnListarInspeccionesProcessRow
                                                                      .estado!;
                                                                  FFAppState()
                                                                      .idestadoInspeccion =
                                                                  columnListarInspeccionesProcessRow
                                                                      .idEstado!;
                                                                  FFAppState()
                                                                      .idInspeccion =
                                                                  columnListarInspeccionesProcessRow
                                                                      .idInspeccion!;
                                                                  FFAppState()
                                                                      .modificadoMovil =
                                                                  columnListarInspeccionesProcessRow
                                                                      .modificadoMovil!;
                                                                });

                                                                var ssh = await SQLiteManager.instance.listarSSHH(
                                                                    idFicha: FFAppState().IdFicha
                                                                );
                                                                FFAppState().CantS= ssh[0].totalSSHH!;

                                                                var aulas = await SQLiteManager.instance.listarAulas(
                                                                    idFicha: FFAppState().IdFicha
                                                                );
                                                                FFAppState().CantA= aulas[0].totalAulas!;

                                                                var patios = await SQLiteManager.instance.listarPabellones(
                                                                    idFicha: FFAppState().IdFicha
                                                                );
                                                                FFAppState().CantP= patios[0].totalPabellones!;

                                                                var latitud = await SQLiteManager.instance.listarLatitud(
                                                                    idFicha: FFAppState().IdFicha
                                                                );
                                                                FFAppState().latitud = latitud[0].Latitud!;

                                                                var longitud = await SQLiteManager.instance.listarLongitud(
                                                                    idFicha: FFAppState().IdFicha
                                                                );

                                                                FFAppState().longitud = longitud[0].Longitud!;
                                                                context.pushNamed(
                                                                    'DatosGenerales');
                                                              },
                                                              child: Container(
                                                                width:
                                                                double.infinity,
                                                                decoration:
                                                                BoxDecoration(
                                                                  color: FlutterFlowTheme
                                                                      .of(context)
                                                                      .secondaryBackground,
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      blurRadius: 0,
                                                                      color: FlutterFlowTheme.of(
                                                                          context)
                                                                          .secondaryBackground,
                                                                      offset: Offset(
                                                                          0, 1),
                                                                    )
                                                                  ],
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      8),
                                                                  border: Border.all(
                                                                    color: FlutterFlowTheme
                                                                        .of(context)
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
                                                                            color: ConstansColors.cyan,
                                                                            size: 35,
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
                                                                                mainAxisSize:
                                                                                MainAxisSize.max,
                                                                                crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
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
                                                                                                  columnListarInspeccionesProcessRow.codigoLocalColegio,
                                                                                                  's',
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                  fontFamily: 'Outfit',
                                                                                                  color: ConstansColors.cyan,
                                                                                                  fontWeight: FontWeight.bold,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Text(
                                                                                              valueOrDefault<String>(
                                                                                                columnListarInspeccionesProcessRow.nombreLocalColegio,
                                                                                                's',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                fontFamily: 'Outfit',
                                                                                                color: ConstansColors.cyan,
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
                                                                                          columnListarInspeccionesProcessRow.departamentoColegio,
                                                                                          ConstansTetx.departamento,
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
                                                                                          columnListarInspeccionesProcessRow.provinciaColegio,
                                                                                          ConstansTetx.provincia,
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
                                                                                          columnListarInspeccionesProcessRow.distritoColegio,
                                                                                          ConstansTetx.distrito,
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
                                                                          -1, 0),
                                                                      child:
                                                                      Container(
                                                                        width: double
                                                                            .infinity,
                                                                        decoration:
                                                                        BoxDecoration(
                                                                          color: FlutterFlowTheme.of(
                                                                              context)
                                                                              .lineColor,
                                                                        ),
                                                                        child:
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional
                                                                              .fromSTEB(
                                                                              55,
                                                                              10,
                                                                              10,
                                                                              10),
                                                                          child: Text(
                                                                            valueOrDefault<
                                                                                String>(
                                                                              columnListarInspeccionesProcessRow
                                                                                  .nombreEvento,
                                                                              ConstansTetx.nombre,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(
                                                                                context)
                                                                                .bodyMedium,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width: double
                                                                          .infinity,
                                                                      decoration:
                                                                      BoxDecoration(
                                                                        color: FlutterFlowTheme.of(
                                                                            context)
                                                                            .secondaryBackground,
                                                                        borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                            12),
                                                                      ),
                                                                      child: Padding(
                                                                        padding: EdgeInsetsDirectional
                                                                            .fromSTEB(
                                                                            25,
                                                                            10,
                                                                            25,
                                                                            10),
                                                                        child: Row(
                                                                          mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                          mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                          children: [
                                                                            Container(
                                                                              width:
                                                                              130,
                                                                              decoration:
                                                                              BoxDecoration(
                                                                                color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child:
                                                                              Column(
                                                                                mainAxisSize:
                                                                                MainAxisSize.max,
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
                                                                                              if (columnListarInspeccionesProcessRow.idEstado == 3) {
                                                                                                return FlutterFlowTheme.of(context).darkSeaGreen;
                                                                                              } else if (columnListarInspeccionesProcessRow.idEstado == 2) {
                                                                                                return FlutterFlowTheme.of(context).gray600;
                                                                                              } else if (columnListarInspeccionesProcessRow.idEstado == 4) {
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
                                                                                            columnListarInspeccionesProcessRow.estado,
                                                                                            ConstansTetx.estado,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              width:
                                                                              130,
                                                                              decoration:
                                                                              BoxDecoration(
                                                                                color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child:
                                                                              Column(
                                                                                mainAxisSize:
                                                                                MainAxisSize.max,
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
                                                                                            color: columnListarInspeccionesProcessRow.modificadoMovil == 0
                                                                                                ? Colors.blue
                                                                                                : Colors.red, // Conditionally set icon color
                                                                                            size: 24,
                                                                                          ),
                                                                                        ),
                                                                                        Text(
                                                                                            columnListarInspeccionesProcessRow.modificadoMovil == 0
                                                                                                ? ConstansTetx.SINCRONIZADO
                                                                                                : ConstansTetx.NOSINCRONIZADO, // Conditionally set text
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
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }),
                                                  ),
                                                );
                                              },
                                            ),
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
                                          child: Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                15, 15, 15, 25),
                                            child: FutureBuilder<
                                                List<
                                                    ListarInspeccionesRealizadaRow>>(
                                              future: SQLiteManager.instance
                                                  .listarInspeccionesRealizada(
                                                  dniInspector: FFAppState().username
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
                                                final columnListarInspeccionesRealizadaRowList =
                                                snapshot.data!;
                                                return SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize:
                                                    MainAxisSize.min,
                                                    children: columnListarInspeccionesRealizadaRowList.isEmpty
                                                        ? [
                                                      Text(ConstAlerts.inspeccionesnull),
                                                    ] : List.generate(
                                                        columnListarInspeccionesRealizadaRowList
                                                            .length,
                                                            (columnIndex) {
                                                          final columnListarInspeccionesRealizadaRow =
                                                          columnListarInspeccionesRealizadaRowList[
                                                          columnIndex];
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
                                                                  .circular(8),
                                                            ),
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
                                                                setState(() {
                                                                  FFAppState()
                                                                      .IdFicha =
                                                                  columnListarInspeccionesRealizadaRow
                                                                      .idFicha!;
                                                                  FFAppState()
                                                                      .idPlantillaSeccionPadre =
                                                                  columnListarInspeccionesRealizadaRow
                                                                      .idPlantilla!;
                                                                  FFAppState()
                                                                      .idpregunta =
                                                                  columnListarInspeccionesRealizadaRow
                                                                      .idInspeccion!;
                                                                  FFAppState()
                                                                      .IdPlantilla =
                                                                  columnListarInspeccionesRealizadaRow
                                                                      .idPlantilla!;
                                                                  FFAppState()
                                                                      .idPlantillaSeccion =
                                                                  columnListarInspeccionesRealizadaRow
                                                                      .idPlantilla!;
                                                                  FFAppState()
                                                                      .estadoInspeccion =
                                                                  columnListarInspeccionesRealizadaRow
                                                                      .estado!;
                                                                  FFAppState()
                                                                      .idestadoInspeccion =
                                                                  columnListarInspeccionesRealizadaRow
                                                                      .idEstado!;
                                                                  FFAppState()
                                                                      .idInspeccion =
                                                                  columnListarInspeccionesRealizadaRow
                                                                      .idInspeccion!;
                                                                  FFAppState()
                                                                      .modificadoMovil =
                                                                  columnListarInspeccionesRealizadaRow
                                                                      .modificadoMovil!;
                                                                });
                                                                var ssh = await SQLiteManager.instance.listarSSHH(
                                                                    idFicha: FFAppState().IdFicha
                                                                );
                                                                FFAppState().CantS= ssh[0].totalSSHH!;

                                                                var aulas = await SQLiteManager.instance.listarAulas(
                                                                    idFicha: FFAppState().IdFicha
                                                                );
                                                                FFAppState().CantA= aulas[0].totalAulas!;

                                                                var patios = await SQLiteManager.instance.listarPabellones(
                                                                    idFicha: FFAppState().IdFicha
                                                                );
                                                                FFAppState().CantP= patios[0].totalPabellones!;

                                                                var latitud = await SQLiteManager.instance.listarLatitud(
                                                                    idFicha: FFAppState().IdFicha
                                                                );
                                                                FFAppState().latitud = latitud[0].Latitud!;

                                                                var longitud = await SQLiteManager.instance.listarLongitud(
                                                                    idFicha: FFAppState().IdFicha
                                                                );

                                                                FFAppState().longitud = longitud[0].Longitud!;
                                                                context.pushNamed(
                                                                    'DatosGenerales');
                                                              },
                                                              child: Container(
                                                                width:
                                                                double.infinity,
                                                                decoration:
                                                                BoxDecoration(
                                                                  color: FlutterFlowTheme
                                                                      .of(context)
                                                                      .secondaryBackground,
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      blurRadius: 0,
                                                                      color: FlutterFlowTheme.of(
                                                                          context)
                                                                          .secondaryBackground,
                                                                      offset: Offset(
                                                                          0, 1),
                                                                    )
                                                                  ],
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      8),
                                                                  border: Border.all(
                                                                    color: FlutterFlowTheme
                                                                        .of(context)
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
                                                                            color: ConstansColors.cyan,
                                                                            size: 35,
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
                                                                                mainAxisSize:
                                                                                MainAxisSize.max,
                                                                                crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
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
                                                                                                  columnListarInspeccionesRealizadaRow.codigoLocalColegio,
                                                                                                  's',
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                  fontFamily: 'Outfit',
                                                                                                  color: ConstansColors.cyan,
                                                                                                  fontWeight: FontWeight.bold,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Text(
                                                                                              valueOrDefault<String>(
                                                                                                columnListarInspeccionesRealizadaRow.nombreLocalColegio,
                                                                                                's',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                fontFamily: 'Outfit',
                                                                                                color: ConstansColors.cyan,
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
                                                                                          columnListarInspeccionesRealizadaRow.departamentoColegio,
                                                                                          ConstansTetx.departamento,
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
                                                                                          columnListarInspeccionesRealizadaRow.provinciaColegio,
                                                                                          ConstansTetx.provincia,
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
                                                                                          columnListarInspeccionesRealizadaRow.distritoColegio,
                                                                                          ConstansTetx.distrito,
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
                                                                          -1, 0),
                                                                      child:
                                                                      Container(
                                                                        width: double
                                                                            .infinity,
                                                                        decoration:
                                                                        BoxDecoration(
                                                                          color: FlutterFlowTheme.of(
                                                                              context)
                                                                              .lineColor,
                                                                        ),
                                                                        child:
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional
                                                                              .fromSTEB(
                                                                              55,
                                                                              10,
                                                                              10,
                                                                              10),
                                                                          child: Text(
                                                                            valueOrDefault<
                                                                                String>(
                                                                              columnListarInspeccionesRealizadaRow
                                                                                  .nombreEvento,
                                                                              ConstansTetx.nombre,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(
                                                                                context)
                                                                                .bodyMedium,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width: double
                                                                          .infinity,
                                                                      decoration:
                                                                      BoxDecoration(
                                                                        color: FlutterFlowTheme.of(
                                                                            context)
                                                                            .secondaryBackground,
                                                                        borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                            12),
                                                                      ),
                                                                      child: Padding(
                                                                        padding: EdgeInsetsDirectional
                                                                            .fromSTEB(
                                                                            25,
                                                                            10,
                                                                            25,
                                                                            10),
                                                                        child: Row(
                                                                          mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                          mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                          children: [
                                                                            Container(
                                                                              width:
                                                                              130,
                                                                              decoration:
                                                                              BoxDecoration(
                                                                                color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child:
                                                                              Column(
                                                                                mainAxisSize:
                                                                                MainAxisSize.max,
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
                                                                                              if (columnListarInspeccionesRealizadaRow.idEstado == 3) {
                                                                                                return FlutterFlowTheme.of(context).darkSeaGreen;
                                                                                              } else if (columnListarInspeccionesRealizadaRow.idEstado == 2) {
                                                                                                return FlutterFlowTheme.of(context).gray600;
                                                                                              } else if (columnListarInspeccionesRealizadaRow.idEstado == 4) {
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
                                                                                            columnListarInspeccionesRealizadaRow.estado,
                                                                                            ConstansTetx.estado,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              width:
                                                                              130,
                                                                              decoration:
                                                                              BoxDecoration(
                                                                                color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child:
                                                                              Column(
                                                                                mainAxisSize:
                                                                                MainAxisSize.max,
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
                                                                                            color: columnListarInspeccionesRealizadaRow.modificadoMovil == 0
                                                                                                ? Colors.blue
                                                                                                : Colors.red, // Conditionally set icon color
                                                                                            size: 24,
                                                                                          ),
                                                                                        ),
                                                                                        Text(
                                                                                            columnListarInspeccionesRealizadaRow.modificadoMovil == 0
                                                                                                ? ConstansTetx.SINCRONIZADO
                                                                                                : ConstansTetx.NOSINCRONIZADO, // Conditionally set text
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
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }),
                                                  ),
                                                );
                                              },
                                            ),
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
                                          child: Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                15, 15, 15, 25),
                                            child: FutureBuilder<
                                                List<
                                                    ListarInspeccionesProgramadaRow>>(
                                              future: SQLiteManager.instance
                                                  .listarInspeccionesProgramada(
                                                  dniInspector: FFAppState().username
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
                                                final columnListarInspeccionesProgramadaRowList =
                                                snapshot.data!;
                                                return SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize:
                                                    MainAxisSize.min,
                                                    children: columnListarInspeccionesProgramadaRowList.isEmpty
                                                        ? [
                                                      Text(ConstAlerts.inspeccionesnull),
                                                    ] : List.generate(
                                                        columnListarInspeccionesProgramadaRowList
                                                            .length,
                                                            (columnIndex) {
                                                          final columnListarInspeccionesProgramadaRow =
                                                          columnListarInspeccionesProgramadaRowList[
                                                          columnIndex];
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
                                                                  .circular(8),
                                                            ),
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
                                                                setState(() {
                                                                  FFAppState()
                                                                      .IdFicha =
                                                                  columnListarInspeccionesProgramadaRow
                                                                      .idFicha!;
                                                                  FFAppState()
                                                                      .idPlantillaSeccionPadre =
                                                                  columnListarInspeccionesProgramadaRow
                                                                      .idPlantilla!;
                                                                  FFAppState()
                                                                      .idpregunta =
                                                                  columnListarInspeccionesProgramadaRow
                                                                      .idInspeccion!;
                                                                  FFAppState()
                                                                      .IdPlantilla =
                                                                  columnListarInspeccionesProgramadaRow
                                                                      .idPlantilla!;
                                                                  FFAppState()
                                                                      .idPlantillaSeccion =
                                                                  columnListarInspeccionesProgramadaRow
                                                                      .idPlantilla!;
                                                                  FFAppState()
                                                                      .estadoInspeccion =
                                                                  columnListarInspeccionesProgramadaRow
                                                                      .estado!;
                                                                  FFAppState()
                                                                      .idestadoInspeccion =
                                                                  columnListarInspeccionesProgramadaRow
                                                                      .idEstado!;
                                                                  FFAppState()
                                                                      .idInspeccion =
                                                                  columnListarInspeccionesProgramadaRow
                                                                      .idInspeccion!;
                                                                  FFAppState()
                                                                      .modificadoMovil =
                                                                  columnListarInspeccionesProgramadaRow
                                                                      .modificadoMovil!;
                                                                });

                                                                var ssh = await SQLiteManager.instance.listarSSHH(
                                                                    idFicha: FFAppState().IdFicha
                                                                );
                                                                FFAppState().CantS= ssh[0].totalSSHH!;

                                                                var aulas = await SQLiteManager.instance.listarAulas(
                                                                    idFicha: FFAppState().IdFicha
                                                                );
                                                                FFAppState().CantA= aulas[0].totalAulas!;

                                                                var patios = await SQLiteManager.instance.listarPabellones(
                                                                    idFicha: FFAppState().IdFicha
                                                                );
                                                                FFAppState().CantP= patios[0].totalPabellones!;

                                                                var latitud = await SQLiteManager.instance.listarLatitud(
                                                                    idFicha: FFAppState().IdFicha
                                                                );
                                                                FFAppState().latitud = latitud[0].Latitud!;

                                                                var longitud = await SQLiteManager.instance.listarLongitud(
                                                                    idFicha: FFAppState().IdFicha
                                                                );

                                                                FFAppState().longitud = longitud[0].Longitud!;

                                                                context.pushNamed(
                                                                    'DatosGenerales');
                                                              },
                                                              child: Container(
                                                                width:
                                                                double.infinity,
                                                                decoration:
                                                                BoxDecoration(
                                                                  color: FlutterFlowTheme
                                                                      .of(context)
                                                                      .secondaryBackground,
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      blurRadius: 0,
                                                                      color: FlutterFlowTheme.of(
                                                                          context)
                                                                          .secondaryBackground,
                                                                      offset: Offset(
                                                                          0, 1),
                                                                    )
                                                                  ],
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      8),
                                                                  border: Border.all(
                                                                    color: FlutterFlowTheme
                                                                        .of(context)
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
                                                                            color: ConstansColors.cyan,
                                                                            size: 35,
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
                                                                                mainAxisSize:
                                                                                MainAxisSize.max,
                                                                                crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
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
                                                                                                  columnListarInspeccionesProgramadaRow.codigoLocalColegio,
                                                                                                  's',
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                  fontFamily: 'Outfit',
                                                                                                  color: ConstansColors.cyan,
                                                                                                  fontWeight: FontWeight.bold,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Text(
                                                                                              valueOrDefault<String>(
                                                                                                columnListarInspeccionesProgramadaRow.nombreLocalColegio,
                                                                                                ConstansTetx.nombre,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                fontFamily: 'Outfit',
                                                                                                color: ConstansColors.cyan,
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
                                                                                          columnListarInspeccionesProgramadaRow.departamentoColegio,
                                                                                          ConstansTetx.departamento,
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
                                                                                          columnListarInspeccionesProgramadaRow.provinciaColegio,
                                                                                          ConstansTetx.provincia,
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
                                                                                          columnListarInspeccionesProgramadaRow.distritoColegio,
                                                                                          ConstansTetx.distrito,
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
                                                                          -1, 0),
                                                                      child:
                                                                      Container(
                                                                        width: double
                                                                            .infinity,
                                                                        decoration:
                                                                        BoxDecoration(
                                                                          color: FlutterFlowTheme.of(
                                                                              context)
                                                                              .lineColor,
                                                                        ),
                                                                        child:
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional
                                                                              .fromSTEB(
                                                                              55,
                                                                              10,
                                                                              10,
                                                                              10),
                                                                          child: Text(
                                                                            valueOrDefault<
                                                                                String>(
                                                                              columnListarInspeccionesProgramadaRow
                                                                                  .nombreEvento,
                                                                              ConstansTetx.nombre,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(
                                                                                context)
                                                                                .bodyMedium,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width: double
                                                                          .infinity,
                                                                      decoration:
                                                                      BoxDecoration(
                                                                        color: FlutterFlowTheme.of(
                                                                            context)
                                                                            .secondaryBackground,
                                                                        borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                            12),
                                                                      ),
                                                                      child: Padding(
                                                                        padding: EdgeInsetsDirectional
                                                                            .fromSTEB(
                                                                            25,
                                                                            10,
                                                                            25,
                                                                            10),
                                                                        child: Row(
                                                                          mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                          mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                          children: [
                                                                            Container(
                                                                              width:
                                                                              130,
                                                                              decoration:
                                                                              BoxDecoration(
                                                                                color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child:
                                                                              Column(
                                                                                mainAxisSize:
                                                                                MainAxisSize.max,
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
                                                                                              if (columnListarInspeccionesProgramadaRow.idEstado == 3) {
                                                                                                return FlutterFlowTheme.of(context).darkSeaGreen;
                                                                                              } else if (columnListarInspeccionesProgramadaRow.idEstado == 2) {
                                                                                                return FlutterFlowTheme.of(context).gray600;
                                                                                              } else if (columnListarInspeccionesProgramadaRow.idEstado == 4) {
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
                                                                                            columnListarInspeccionesProgramadaRow.estado,
                                                                                            ConstansTetx.estado,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              width:
                                                                              130,
                                                                              decoration:
                                                                              BoxDecoration(
                                                                                color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child:
                                                                              Column(
                                                                                mainAxisSize:
                                                                                MainAxisSize.max,
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
                                                                                            color: columnListarInspeccionesProgramadaRow.modificadoMovil == 0
                                                                                                ? Colors.blue
                                                                                                : Colors.red, // Conditionally set icon color
                                                                                            size: 24,
                                                                                          ),
                                                                                        ),
                                                                                        Text(
                                                                                            columnListarInspeccionesProgramadaRow.modificadoMovil == 0
                                                                                                ? ConstansTetx.SINCRONIZADO
                                                                                                : ConstansTetx.NOSINCRONIZADO, // Conditionally set text
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
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }),
                                                  ),
                                                );
                                              },
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
            ],
          ),
        ),
      ),
    );
  }
}

