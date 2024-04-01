import 'dart:async';

import 'package:flutter/services.dart';

import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';


import 'datos_inspeccion_model.dart';
export 'datos_inspeccion_model.dart';

class DatosInspeccionWidget extends StatefulWidget {
  const DatosInspeccionWidget({super.key});


  @override
  State<DatosInspeccionWidget> createState() => _DatosInspeccionWidgetState();
}

class _DatosInspeccionWidgetState extends State<DatosInspeccionWidget>
    with TickerProviderStateMixin {
  late DatosInspeccionModel _model;

  late List<List<TabController>> _tabControllersList;
  late List<List<int>> _currentTabIndicesList;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DatosInspeccionModel());
    _tabControllersList = [];
    _currentTabIndicesList = [];
  }

  @override
  void dispose() {
    _model.dispose();
    for (var tabControllers in _tabControllersList) {
      for (var controller in tabControllers) {
        controller.dispose();
      }
    }
    super.dispose();
  }

  String? itemSelected;
  String? itemSelec;
  List<String> itemselecteds = [];
  List<String> itemsSelected = [];
  Map<String, String?> selectedValuesss = {};

  int currentTabIndex = 0; // Declaración de la variable fuera del método _addTabController

  void _addTabController(int sectionIndex, int subSectionIndex, int length) {
    // Verifica si la lista de controladores de la sección ya existe
    if (_tabControllersList.length <= sectionIndex) {
      _tabControllersList.add([]);
      _currentTabIndicesList.add([]);
    }
    // Verifica si la lista de controladores de la subsección ya existe
    if (_tabControllersList[sectionIndex].length <= subSectionIndex) {
      final controller = TabController(length: length, vsync: this);
      controller.addListener(() {
        setState(() {
          currentTabIndex = controller.index; // Asigna el valor a la variable
          print('Se cambió a la pestaña $currentTabIndex');
          print('Controller iNDEX ${controller.index}');
          _currentTabIndicesList[sectionIndex][subSectionIndex] = currentTabIndex;
        });
      });
      _tabControllersList[sectionIndex].add(controller);
      _currentTabIndicesList[sectionIndex].add(0); // Establece el índice inicial en 0
    }
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
                                      FutureBuilder<List<ListarSubseccionesRow>>(
                                        future: SQLiteManager.instance.listarSubsecciones(
                                          idPlantilla: FFAppState().IdPlantilla,
                                          idPlantillaSeccionPadre: listViewListarPlantillaSeccionRow.idPlantillaSeccion,
                                        ),
                                        builder: (context, snapshot) {
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
                                          final columnListarSubseccionesRowList = snapshot.data!;
                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: List.generate(columnListarSubseccionesRowList.length, (columnIndex) {
                                              final columnListarSubseccionesRow = columnListarSubseccionesRowList[columnIndex];
                                              int cantidadRepeticiones;
                                              String? NameSub;
                                              switch (columnListarSubseccionesRow.modoRepeticion) {
                                                case 'P':
                                                  cantidadRepeticiones =  FFAppState().CantP;
                                                  NameSub = 'Pabellón';
                                                  break;
                                                case 'A':
                                                  cantidadRepeticiones = FFAppState().CantA;
                                                  NameSub = 'Aula';
                                                  break;
                                                case 'S':
                                                  cantidadRepeticiones = FFAppState().CantS;
                                                  NameSub = 'SSHH';
                                                  break;
                                                default:
                                                  cantidadRepeticiones = 1;
                                                  NameSub = '';
                                                  break;
                                              }
                                              _addTabController(listViewIndex, columnIndex, cantidadRepeticiones);
                                              return Align(
                                                alignment: AlignmentDirectional(-1, 0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                    ),
                                                    child: Align(
                                                      alignment: AlignmentDirectional(-1, 0),
                                                      child: Column(
                                                        mainAxisSize: MainAxisSize.max,
                                                        children: [
                                                          Align(
                                                            alignment: AlignmentDirectional(-1, 0),
                                                            child: Text(
                                                              valueOrDefault<String>(
                                                                columnListarSubseccionesRow.descripcion,
                                                                'Subseccion',
                                                              ),
                                                              style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                fontFamily: 'Outfit',
                                                                fontSize: 20,
                                                                fontWeight: FontWeight.bold,
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment: AlignmentDirectional(-1, 0),
                                                            child: Container(
                                                              width: double.infinity,
                                                              decoration: BoxDecoration(
                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                              ),
                                                              child: Container(
                                                                height: 400,
                                                                child: Column(
                                                                  children: [
                                                                    SingleChildScrollView(
                                                                      scrollDirection: Axis.horizontal,
                                                                      child: Visibility(
                                                                        visible: cantidadRepeticiones! > 1,
                                                                        child: TabBar(
                                                                          controller: _tabControllersList[listViewIndex][columnIndex],
                                                                          isScrollable: true,
                                                                          labelColor: FlutterFlowTheme.of(context).primary,
                                                                          unselectedLabelColor: FlutterFlowTheme.of(context).primary,
                                                                          indicatorColor: FlutterFlowTheme.of(context).primary,
                                                                          tabs: List.generate(
                                                                            cantidadRepeticiones!,
                                                                                (index) => Tab(
                                                                              text: '${NameSub} ${index + 1}',
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      )
                                                                    ),
                                                                    Expanded(
                                                                      child: TabBarView(
                                                                        controller: _tabControllersList[listViewIndex][columnIndex],
                                                                        children: List.generate(
                                                                          cantidadRepeticiones!,
                                                                              (index) => FutureBuilder<List<ListarPreguntasRow>>(
                                                                            future: SQLiteManager.instance.listarPreguntas(
                                                                              idPlantillaSeccion: columnListarSubseccionesRow.idPlantillaSeccion,
                                                                              idPlantilla: columnListarSubseccionesRow.idPlantilla,
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
                                                                              final columnListarPreguntasRowList = snapshot.data!;
                                                                              var nrm = index +1;
                                                                              return SingleChildScrollView(
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: List.generate(
                                                                                      columnListarPreguntasRowList.length,
                                                                                          (columnIndex) {
                                                                                        final columnListarPreguntasRow =
                                                                                        columnListarPreguntasRowList[columnIndex];
                                                                                        return Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                                                          child: Container(
                                                                                            width: double.infinity,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context)
                                                                                                  .secondaryBackground,
                                                                                            ),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Align(
                                                                                                  alignment: AlignmentDirectional(-1, 0),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(
                                                                                                        10, 0, 0, 0),
                                                                                                    child: Text(
                                                                                                      valueOrDefault<String>(
                                                                                                        columnListarPreguntasRow
                                                                                                            .descripcionPregunta,
                                                                                                        'Pregunta',
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context)
                                                                                                          .bodyMedium
                                                                                                          .override(
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
                                                                                                        idFicha: FFAppState().IdFicha,
                                                                                                        numero: index + 1
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
                                                                                                                                        if(FFAppState().idestadoInspeccion == 4 && FFAppState().estadoInspeccion == 'EN REGISTRO'){
                                                                                                                                          SQLiteManager.instance.actualizarRpta(
                                                                                                                                              rpta: respuestaActual,
                                                                                                                                              idpregunta: columnListarOpcionesRow.idPregunta!,
                                                                                                                                              idplantillaopcion: columnListarOpcionesRow.idPlantillaOpcion!,
                                                                                                                                              idplanitllaseccion: columnListarOpcionesRow.idPlantillaSeccion!,
                                                                                                                                              idficha: FFAppState().IdFicha,
                                                                                                                                              usuarioModificacion: FFAppState().username,
                                                                                                                                              fechaModificacion: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                                                                                                                                              equipoModificacion: FFAppState().cummovil,
                                                                                                                                              programaModificacion: FFAppState().programacreacion,
                                                                                                                                              numero: nrm
                                                                                                                                            // Proporciona los otros parámetros según sea necesario...
                                                                                                                                          );
                                                                                                                                          SQLiteManager.instance.inspeccion1(
                                                                                                                                            idFicha: FFAppState().IdFicha,
                                                                                                                                          );
                                                                                                                                        }
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
                                                                                                                                        if(FFAppState().idestadoInspeccion == 4 && FFAppState().estadoInspeccion == 'EN REGISTRO'){
                                                                                                                                          SQLiteManager.instance.crearRpta(
                                                                                                                                              rpta: respuestaActual,
                                                                                                                                              idpregunta: columnListarOpcionesRow.idPregunta!,
                                                                                                                                              idplantillaopcion: columnListarOpcionesRow.idPlantillaOpcion!,
                                                                                                                                              idplanitllaseccion: columnListarOpcionesRow.idPlantillaSeccion!,
                                                                                                                                              idficha: FFAppState().IdFicha,
                                                                                                                                              fechaCreacion: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                                                                                                                                              equipoCreacion: FFAppState().cummovil,
                                                                                                                                              programaCreacion: FFAppState().programacreacion,
                                                                                                                                              usuarioCreacion: FFAppState().username,
                                                                                                                                              numero: nrm
                                                                                                                                            // Proporciona los otros parámetros según sea necesario...
                                                                                                                                          );
                                                                                                                                          SQLiteManager.instance.inspeccion1(
                                                                                                                                            idFicha: FFAppState().IdFicha,
                                                                                                                                          );
                                                                                                                                        }
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
                                                                                                                                          if(FFAppState().idestadoInspeccion == 4 && FFAppState().estadoInspeccion == 'EN REGISTRO'){
                                                                                                                                            SQLiteManager.instance.actualizarRpta(
                                                                                                                                                rpta: respuestaActual,
                                                                                                                                                idpregunta: columnListarOpcionesRow.idPregunta!,
                                                                                                                                                idplantillaopcion: columnListarOpcionesRow.idPlantillaOpcion!,
                                                                                                                                                idplanitllaseccion: columnListarOpcionesRow.idPlantillaSeccion!,
                                                                                                                                                idficha: FFAppState().IdFicha,
                                                                                                                                                usuarioModificacion: FFAppState().username,
                                                                                                                                                fechaModificacion: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                                                                                                                                                equipoModificacion: FFAppState().cummovil,
                                                                                                                                                programaModificacion: FFAppState().programacreacion,
                                                                                                                                                numero: nrm
                                                                                                                                              // Proporciona los otros parámetros según sea necesario...
                                                                                                                                            );
                                                                                                                                            SQLiteManager.instance.inspeccion1(
                                                                                                                                              idFicha: FFAppState().IdFicha,
                                                                                                                                            );
                                                                                                                                          }
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
                                                                                                                                          if(FFAppState().idestadoInspeccion == 4 && FFAppState().estadoInspeccion == 'EN REGISTRO'){
                                                                                                                                            SQLiteManager.instance.crearRpta(
                                                                                                                                                rpta: respuestaActual,
                                                                                                                                                idpregunta: columnListarOpcionesRow.idPregunta!,
                                                                                                                                                idplantillaopcion: columnListarOpcionesRow.idPlantillaOpcion!,
                                                                                                                                                idplanitllaseccion: columnListarOpcionesRow.idPlantillaSeccion!,
                                                                                                                                                idficha: FFAppState().IdFicha,
                                                                                                                                                fechaCreacion: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                                                                                                                                                equipoCreacion: FFAppState().cummovil,
                                                                                                                                                programaCreacion: FFAppState().programacreacion,
                                                                                                                                                usuarioCreacion: FFAppState().username,
                                                                                                                                                numero: nrm
                                                                                                                                              // Proporciona los otros parámetros según sea necesario...
                                                                                                                                            );
                                                                                                                                            SQLiteManager.instance.inspeccion1(
                                                                                                                                              idFicha: FFAppState().IdFicha,
                                                                                                                                            );
                                                                                                                                          }
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
                                                                                                                                    onSubmitted: (value) {
                                                                                                                                      if(FFAppState().idestadoInspeccion == 4 && FFAppState().estadoInspeccion == 'EN REGISTRO'){
                                                                                                                                        SQLiteManager.instance.actualizarRpta(
                                                                                                                                            rpta: value,
                                                                                                                                            idpregunta: columnListarOpcionesRow.idPregunta!,
                                                                                                                                            idplantillaopcion: columnListarOpcionesRow.idPlantillaOpcion!,
                                                                                                                                            idplanitllaseccion: columnListarOpcionesRow.idPlantillaSeccion!,
                                                                                                                                            idficha: FFAppState().IdFicha,
                                                                                                                                            usuarioModificacion: FFAppState().username,
                                                                                                                                            fechaModificacion: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                                                                                                                                            equipoModificacion: FFAppState().cummovil,
                                                                                                                                            programaModificacion: FFAppState().programacreacion,
                                                                                                                                            numero: nrm
                                                                                                                                          // Proporciona los otros parámetros según sea necesario...
                                                                                                                                        );
                                                                                                                                        SQLiteManager.instance.inspeccion1(
                                                                                                                                          idFicha: FFAppState().IdFicha,
                                                                                                                                        );
                                                                                                                                      }
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
                                                                                                                                    onSubmitted: (value){
                                                                                                                                      if(FFAppState().idestadoInspeccion == 4 && FFAppState().estadoInspeccion == 'EN REGISTRO'){
                                                                                                                                        SQLiteManager.instance.crearRpta(
                                                                                                                                            rpta: value,
                                                                                                                                            idpregunta: columnListarOpcionesRow.idPregunta!,
                                                                                                                                            idplantillaopcion: columnListarOpcionesRow.idPlantillaOpcion!,
                                                                                                                                            idplanitllaseccion: columnListarOpcionesRow.idPlantillaSeccion!,
                                                                                                                                            idficha: FFAppState().IdFicha,
                                                                                                                                            fechaCreacion: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                                                                                                                                            equipoCreacion: FFAppState().cummovil,
                                                                                                                                            programaCreacion: FFAppState().programacreacion,
                                                                                                                                            usuarioCreacion: FFAppState().username,
                                                                                                                                            numero: nrm
                                                                                                                                          // Proporciona los otros parámetros según sea necesario...
                                                                                                                                        );
                                                                                                                                        SQLiteManager.instance.inspeccion1(
                                                                                                                                          idFicha: FFAppState().IdFicha,
                                                                                                                                        );
                                                                                                                                      }
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
                                                                                                                                          itemSelec = value!;

                                                                                                                                          print(cadenaFormatoSN);
                                                                                                                                          if(FFAppState().idestadoInspeccion == 4 && FFAppState().estadoInspeccion == 'EN REGISTRO'){
                                                                                                                                            SQLiteManager.instance.actualizarRpta(
                                                                                                                                                rpta: cadenaFormatoSN,
                                                                                                                                                idpregunta: columnListarOpcionesRow.idPregunta!,
                                                                                                                                                idplantillaopcion: columnListarOpcionesRow.idPlantillaOpcion!,
                                                                                                                                                idplanitllaseccion: columnListarOpcionesRow.idPlantillaSeccion!,
                                                                                                                                                idficha: FFAppState().IdFicha,
                                                                                                                                                usuarioModificacion: FFAppState().username,
                                                                                                                                                fechaModificacion: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                                                                                                                                                equipoModificacion: FFAppState().cummovil,
                                                                                                                                                programaModificacion: FFAppState().programacreacion,
                                                                                                                                                numero: nrm
                                                                                                                                              // Proporciona los otros parámetros según sea necesario...
                                                                                                                                            );
                                                                                                                                            SQLiteManager.instance.inspeccion1(
                                                                                                                                              idFicha: FFAppState().IdFicha,
                                                                                                                                            );
                                                                                                                                          }
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
                                                                                                                                          if(FFAppState().idestadoInspeccion == 4 && FFAppState().estadoInspeccion == 'EN REGISTRO'){
                                                                                                                                            SQLiteManager.instance.crearRpta(
                                                                                                                                                rpta: cadenaFormatoSN,
                                                                                                                                                idpregunta: columnListarOpcionesRow.idPregunta!,
                                                                                                                                                idplantillaopcion: columnListarOpcionesRow.idPlantillaOpcion!,
                                                                                                                                                idplanitllaseccion: columnListarOpcionesRow.idPlantillaSeccion!,
                                                                                                                                                idficha: FFAppState().IdFicha,
                                                                                                                                                fechaCreacion: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                                                                                                                                                equipoCreacion: FFAppState().cummovil,
                                                                                                                                                programaCreacion: FFAppState().programacreacion,
                                                                                                                                                usuarioCreacion: FFAppState().username,
                                                                                                                                                numero: nrm
                                                                                                                                              // Proporciona los otros parámetros según sea necesario...
                                                                                                                                            );
                                                                                                                                            SQLiteManager.instance.inspeccion1(
                                                                                                                                              idFicha: FFAppState().IdFicha,
                                                                                                                                            );
                                                                                                                                          }
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
                                                                                                              var rptanull = List.filled((columnListarOpcionesRow.descripcion as String).split('|').length, "");
                                                                                                              final respuesta = columnListarOpcionesRow.respuesta != null
                                                                                                                  ? columnListarOpcionesRow.respuesta!.split('|')
                                                                                                                  : rptanull; // Rellenar con cadenas vacías si no hay respuesta
                                                                                                              print(rptanull);

                                                                                                              if (columnListarOpcionesRow.respuesta == null) {

                                                                                                              }
                                                                                                              final opciones = (columnListarOpcionesRow.descripcion as String).split('|');

                                                                                                              // Variable para almacenar la lista de valores
                                                                                                              List<String> listaValores = respuesta.toList();
                                                                                                              if(respuesta == rptanull){
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
                                                                                                                                    keyboardType: TextInputType.text,
                                                                                                                                    onSubmitted: (value) {
                                                                                                                                      setState(() {
                                                                                                                                        if (listaValores[index] != value) {
                                                                                                                                          listaValores[index] = value;
                                                                                                                                          String cadenaValores = listaValores.join('|');
                                                                                                                                          if(FFAppState().idestadoInspeccion == 4 && FFAppState().estadoInspeccion == 'EN REGISTRO'){
                                                                                                                                            SQLiteManager.instance.crearRpta(
                                                                                                                                                rpta: cadenaValores,
                                                                                                                                                idpregunta: columnListarOpcionesRow.idPregunta!,
                                                                                                                                                idplantillaopcion: columnListarOpcionesRow.idPlantillaOpcion!,
                                                                                                                                                idplanitllaseccion: columnListarOpcionesRow.idPlantillaSeccion!,
                                                                                                                                                idficha: FFAppState().IdFicha,
                                                                                                                                                fechaCreacion: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                                                                                                                                                equipoCreacion: FFAppState().cummovil,
                                                                                                                                                programaCreacion: FFAppState().programacreacion,
                                                                                                                                                usuarioCreacion: FFAppState().username,
                                                                                                                                                numero: nrm
                                                                                                                                              // Proporciona los otros parámetros según sea necesario...
                                                                                                                                            );
                                                                                                                                            SQLiteManager.instance.inspeccion1(
                                                                                                                                              idFicha: FFAppState().IdFicha,
                                                                                                                                            );
                                                                                                                                          }
                                                                                                                                        }
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
                                                                                                                                    keyboardType: TextInputType.text,
                                                                                                                                    onSubmitted: (value) {
                                                                                                                                      if (listaValores[index] != value) {
                                                                                                                                        listaValores[index] = value;
                                                                                                                                        String cadenaValores = listaValores.join('|');
                                                                                                                                        if(FFAppState().idestadoInspeccion == 4 && FFAppState().estadoInspeccion == 'EN REGISTRO'){
                                                                                                                                          SQLiteManager.instance.actualizarRpta(
                                                                                                                                              rpta: cadenaValores,
                                                                                                                                              idpregunta: columnListarOpcionesRow.idPregunta!,
                                                                                                                                              idplantillaopcion: columnListarOpcionesRow.idPlantillaOpcion!,
                                                                                                                                              idplanitllaseccion: columnListarOpcionesRow.idPlantillaSeccion!,
                                                                                                                                              idficha: FFAppState().IdFicha,
                                                                                                                                              usuarioModificacion: FFAppState().username,
                                                                                                                                              fechaModificacion: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                                                                                                                                              equipoModificacion: FFAppState().cummovil,
                                                                                                                                              programaModificacion: FFAppState().programacreacion,
                                                                                                                                              numero: nrm
                                                                                                                                            // Proporciona los otros parámetros según sea necesario...
                                                                                                                                          );
                                                                                                                                          SQLiteManager.instance.inspeccion1(
                                                                                                                                            idFicha: FFAppState().IdFicha,
                                                                                                                                          );
                                                                                                                                        }

                                                                                                                                      }
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
                                                                                                              }




                                                                                                            case 6:
                                                                                                              TextEditingController _dateTimeController = TextEditingController();
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
                                                                                                                      _dateTimeController.text = DateFormat('yyyy-MM-dd HH:mm').format(selectedDateTime);
                                                                                                                      print(_dateTimeController.text);
                                                                                                                      //print(_dateTimeController.text);
                                                                                                                      if(respuesta == ""){
                                                                                                                        if(FFAppState().idestadoInspeccion == 4 && FFAppState().estadoInspeccion == 'EN REGISTRO'){
                                                                                                                          SQLiteManager.instance.crearRpta(
                                                                                                                              rpta: _dateTimeController.text,
                                                                                                                              idpregunta: columnListarOpcionesRow.idPregunta!,
                                                                                                                              idplantillaopcion: columnListarOpcionesRow.idPlantillaOpcion!,
                                                                                                                              idplanitllaseccion: columnListarOpcionesRow.idPlantillaSeccion!,
                                                                                                                              idficha: FFAppState().IdFicha,
                                                                                                                              fechaCreacion: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                                                                                                                              equipoCreacion: FFAppState().cummovil,
                                                                                                                              programaCreacion: FFAppState().programacreacion,
                                                                                                                              usuarioCreacion: FFAppState().username,
                                                                                                                              numero: nrm
                                                                                                                            // Proporciona los otros parámetros según sea necesario...
                                                                                                                          );
                                                                                                                          SQLiteManager.instance.inspeccion1(
                                                                                                                            idFicha: FFAppState().IdFicha,
                                                                                                                          );
                                                                                                                        }
                                                                                                                      } else {
                                                                                                                        if(FFAppState().idestadoInspeccion == 4 && FFAppState().estadoInspeccion == 'EN REGISTRO'){
                                                                                                                          SQLiteManager.instance.actualizarRpta(
                                                                                                                              rpta:_dateTimeController.text,
                                                                                                                              idpregunta: columnListarOpcionesRow.idPregunta!,
                                                                                                                              idplantillaopcion: columnListarOpcionesRow.idPlantillaOpcion!,
                                                                                                                              idplanitllaseccion: columnListarOpcionesRow.idPlantillaSeccion!,
                                                                                                                              idficha: FFAppState().IdFicha,
                                                                                                                              usuarioModificacion: FFAppState().username,
                                                                                                                              fechaModificacion: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),                                                                                                            equipoModificacion: FFAppState().cummovil,
                                                                                                                              programaModificacion: FFAppState().programacreacion,
                                                                                                                              numero: nrm
                                                                                                                            // Proporciona los otros parámetros según sea necesario...
                                                                                                                          );
                                                                                                                          SQLiteManager.instance.inspeccion1(
                                                                                                                            idFicha: FFAppState().IdFicha,
                                                                                                                          );
                                                                                                                        }
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
                                                                                                                                          keyboardType: TextInputType.text,
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

                                                                                                              DateTime? selectedDate;

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
                                                                                                                      if(FFAppState().idestadoInspeccion == 4 && FFAppState().estadoInspeccion == 'EN REGISTRO'){
                                                                                                                        SQLiteManager.instance.crearRpta(
                                                                                                                            rpta: Rptadate,
                                                                                                                            idpregunta: columnListarOpcionesRow.idPregunta!,
                                                                                                                            idplantillaopcion: columnListarOpcionesRow.idPlantillaOpcion!,
                                                                                                                            idplanitllaseccion: columnListarOpcionesRow.idPlantillaSeccion!,
                                                                                                                            idficha: FFAppState().IdFicha,
                                                                                                                            fechaCreacion: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                                                                                                                            equipoCreacion: FFAppState().cummovil,
                                                                                                                            programaCreacion: FFAppState().programacreacion,
                                                                                                                            usuarioCreacion: FFAppState().username,
                                                                                                                            numero: nrm
                                                                                                                          // Proporciona los otros parámetros según sea necesario...
                                                                                                                        );
                                                                                                                        SQLiteManager.instance.inspeccion1(
                                                                                                                          idFicha: FFAppState().IdFicha,
                                                                                                                        );
                                                                                                                      }

                                                                                                                    } else {
                                                                                                                      if(FFAppState().idestadoInspeccion == 4 && FFAppState().estadoInspeccion == 'EN REGISTRO'){
                                                                                                                        SQLiteManager.instance.actualizarRpta(
                                                                                                                            rpta:Rptadate,
                                                                                                                            idpregunta: columnListarOpcionesRow.idPregunta!,
                                                                                                                            idplantillaopcion: columnListarOpcionesRow.idPlantillaOpcion!,
                                                                                                                            idplanitllaseccion: columnListarOpcionesRow.idPlantillaSeccion!,
                                                                                                                            idficha: FFAppState().IdFicha,
                                                                                                                            usuarioModificacion: FFAppState().username,
                                                                                                                            fechaModificacion: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),                                                                                                          equipoModificacion: FFAppState().cummovil,
                                                                                                                            programaModificacion: FFAppState().programacreacion,
                                                                                                                            numero: nrm
                                                                                                                          // Proporciona los otros parámetros según sea necesario...
                                                                                                                        );
                                                                                                                        SQLiteManager.instance.inspeccion1(
                                                                                                                          idFicha: FFAppState().IdFicha,
                                                                                                                        );
                                                                                                                      }
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
                                                                                                              TimeOfDay? selectedTime;
                                                                                                              TextEditingController _timeController = TextEditingController();
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
                                                                                                                      if(FFAppState().idestadoInspeccion == 4 && FFAppState().estadoInspeccion == 'EN REGISTRO'){
                                                                                                                        SQLiteManager.instance.crearRpta(
                                                                                                                            rpta: RptaHora,
                                                                                                                            idpregunta: columnListarOpcionesRow.idPregunta!,
                                                                                                                            idplantillaopcion: columnListarOpcionesRow.idPlantillaOpcion!,
                                                                                                                            idplanitllaseccion: columnListarOpcionesRow.idPlantillaSeccion!,
                                                                                                                            idficha: FFAppState().IdFicha,
                                                                                                                            fechaCreacion: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                                                                                                                            equipoCreacion: FFAppState().cummovil,
                                                                                                                            programaCreacion: FFAppState().programacreacion,
                                                                                                                            usuarioCreacion: FFAppState().username,
                                                                                                                            numero: nrm
                                                                                                                          // Proporciona los otros parámetros según sea necesario...
                                                                                                                        );
                                                                                                                        SQLiteManager.instance.inspeccion1(
                                                                                                                          idFicha: FFAppState().IdFicha,
                                                                                                                        );
                                                                                                                      }
                                                                                                                    } else {
                                                                                                                      if(FFAppState().idestadoInspeccion == 4 && FFAppState().estadoInspeccion == 'EN REGISTRO'){
                                                                                                                        SQLiteManager.instance.actualizarRpta(
                                                                                                                            rpta:RptaHora,
                                                                                                                            idpregunta: columnListarOpcionesRow.idPregunta!,
                                                                                                                            idplantillaopcion: columnListarOpcionesRow.idPlantillaOpcion!,
                                                                                                                            idplanitllaseccion: columnListarOpcionesRow.idPlantillaSeccion!,
                                                                                                                            idficha: FFAppState().IdFicha,
                                                                                                                            usuarioModificacion: FFAppState().username,
                                                                                                                            fechaModificacion: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),                                                                                                          equipoModificacion: FFAppState().cummovil,
                                                                                                                            programaModificacion: FFAppState().programacreacion,
                                                                                                                            numero: nrm
                                                                                                                          // Proporciona los otros parámetros según sea necesario...
                                                                                                                        );
                                                                                                                        SQLiteManager.instance.inspeccion1(
                                                                                                                          idFicha: FFAppState().IdFicha,
                                                                                                                        );
                                                                                                                      }
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
                                                                                                                                    onSubmitted: (value) {
                                                                                                                                      setState(() {
                                                                                                                                        if(FFAppState().idestadoInspeccion == 4 && FFAppState().estadoInspeccion == 'EN REGISTRO'){
                                                                                                                                          if(value != ""){
                                                                                                                                            SQLiteManager.instance.actualizarRpta(
                                                                                                                                                rpta: value,
                                                                                                                                                idpregunta: columnListarOpcionesRow.idPregunta!,
                                                                                                                                                idplantillaopcion: columnListarOpcionesRow.idPlantillaOpcion!,
                                                                                                                                                idplanitllaseccion: columnListarOpcionesRow.idPlantillaSeccion!,
                                                                                                                                                idficha: FFAppState().IdFicha,
                                                                                                                                                usuarioModificacion: FFAppState().username,
                                                                                                                                                fechaModificacion: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                                                                                                                                                equipoModificacion: FFAppState().cummovil,
                                                                                                                                                programaModificacion: FFAppState().programacreacion,
                                                                                                                                                numero: nrm
                                                                                                                                              // Proporciona los otros parámetros según sea necesario...
                                                                                                                                            );
                                                                                                                                            SQLiteManager.instance.inspeccion1(
                                                                                                                                              idFicha: FFAppState().IdFicha,
                                                                                                                                            );
                                                                                                                                          }
                                                                                                                                          else {
                                                                                                                                            ScaffoldMessenger.of(context).showSnackBar(
                                                                                                                                              SnackBar(
                                                                                                                                                content: Text(
                                                                                                                                                  'No se pueden guardar valores nulos',
                                                                                                                                                  style: TextStyle(
                                                                                                                                                    color:
                                                                                                                                                    FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                                  ),
                                                                                                                                                ),
                                                                                                                                                duration: Duration(milliseconds: 2000),
                                                                                                                                                backgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                                                                              ),
                                                                                                                                            );
                                                                                                                                          }
                                                                                                                                        }
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
                                                                                                                                    controller: TextEditingController(text: respuesta),
                                                                                                                                    keyboardType: TextInputType.number,
                                                                                                                                    inputFormatters: <TextInputFormatter>[
                                                                                                                                      FilteringTextInputFormatter.digitsOnly // Esto permite solo números
                                                                                                                                    ],
                                                                                                                                    onSubmitted: (value) {
                                                                                                                                      if(FFAppState().idestadoInspeccion == 4 && FFAppState().estadoInspeccion == 'EN REGISTRO'){
                                                                                                                                        if(value != ""){
                                                                                                                                          setState(() {
                                                                                                                                            SQLiteManager.instance.crearRpta(
                                                                                                                                                rpta: value,
                                                                                                                                                idpregunta: columnListarOpcionesRow.idPregunta!,
                                                                                                                                                idplantillaopcion: columnListarOpcionesRow.idPlantillaOpcion!,
                                                                                                                                                idplanitllaseccion: columnListarOpcionesRow.idPlantillaSeccion!,
                                                                                                                                                idficha: FFAppState().IdFicha,
                                                                                                                                                fechaCreacion: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                                                                                                                                                equipoCreacion: FFAppState().cummovil,
                                                                                                                                                programaCreacion: FFAppState().programacreacion,
                                                                                                                                                usuarioCreacion: FFAppState().username,
                                                                                                                                                numero: nrm
                                                                                                                                              // Proporciona los otros parámetros según sea necesario...
                                                                                                                                            );
                                                                                                                                            SQLiteManager.instance.inspeccion1(
                                                                                                                                              idFicha: FFAppState().IdFicha,
                                                                                                                                            );
                                                                                                                                          });
                                                                                                                                        }
                                                                                                                                        else {
                                                                                                                                          ScaffoldMessenger.of(context).showSnackBar(
                                                                                                                                            SnackBar(
                                                                                                                                              content: Text(
                                                                                                                                                'No se pueden guardar valores nulos',
                                                                                                                                                style: TextStyle(
                                                                                                                                                  color:
                                                                                                                                                  FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                              duration: Duration(milliseconds: 2000),
                                                                                                                                              backgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                                                                            ),
                                                                                                                                          );
                                                                                                                                        }
                                                                                                                                      }
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
                                                                                                              var rptanull = List.filled((columnListarOpcionesRow.descripcion as String).split('|').length, "");
                                                                                                              final respuesta = columnListarOpcionesRow.respuesta != null
                                                                                                                  ? columnListarOpcionesRow.respuesta!.split('|')
                                                                                                                  : rptanull;// Rellenar con cadenas vacías si no hay respuesta
                                                                                                              final opciones = (columnListarOpcionesRow.descripcion as String).split('|');

                                                                                                              // Variable para almacenar la lista de valores
                                                                                                              List<String> listaValores = respuesta.toList();

                                                                                                              if(respuesta == rptanull){
                                                                                                                return SingleChildScrollView(
                                                                                                                  scrollDirection: Axis.horizontal,
                                                                                                                  child: Row(
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      Align(
                                                                                                                        alignment: AlignmentDirectional(-1, 0),
                                                                                                                        child: Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                                                                                          child: Container(
                                                                                                                            width: MediaQuery.of(context).size.width, // Ancho máximo posible
                                                                                                                            decoration: BoxDecoration(
                                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                            ),
                                                                                                                            child: SizedBox(
                                                                                                                              height: 100, // Altura máxima posible
                                                                                                                              child: ListView.builder(
                                                                                                                                scrollDirection: Axis.horizontal,
                                                                                                                                itemCount: opciones.length,
                                                                                                                                itemBuilder: (context, index) {
                                                                                                                                  return Padding(
                                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 5, 0),
                                                                                                                                    child: Container(
                                                                                                                                      width: 150,
                                                                                                                                      child: TextField(
                                                                                                                                        decoration: InputDecoration(
                                                                                                                                          labelText: opciones[index],
                                                                                                                                          hintText: opciones[index],
                                                                                                                                          border: OutlineInputBorder(),
                                                                                                                                        ),
                                                                                                                                        keyboardType: TextInputType.number,
                                                                                                                                        onSubmitted: (value) {
                                                                                                                                          if(FFAppState().idestadoInspeccion == 4 && FFAppState().estadoInspeccion == 'EN REGISTRO'){
                                                                                                                                            if(value != ""){
                                                                                                                                              setState(() {
                                                                                                                                                if (listaValores[index] != value) {
                                                                                                                                                  listaValores[index] = value;
                                                                                                                                                  String cadenaValores = listaValores.join('|');
                                                                                                                                                  SQLiteManager.instance.crearRpta(
                                                                                                                                                      rpta: cadenaValores,
                                                                                                                                                      idpregunta: columnListarOpcionesRow.idPregunta!,
                                                                                                                                                      idplantillaopcion: columnListarOpcionesRow.idPlantillaOpcion!,
                                                                                                                                                      idplanitllaseccion: columnListarOpcionesRow.idPlantillaSeccion!,
                                                                                                                                                      idficha: FFAppState().IdFicha,
                                                                                                                                                      fechaCreacion: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                                                                                                                                                      equipoCreacion: FFAppState().cummovil,
                                                                                                                                                      programaCreacion: FFAppState().programacreacion,
                                                                                                                                                      usuarioCreacion: FFAppState().username,
                                                                                                                                                      numero: nrm
                                                                                                                                                  );
                                                                                                                                                  SQLiteManager.instance.inspeccion1(
                                                                                                                                                    idFicha: FFAppState().IdFicha,
                                                                                                                                                  );
                                                                                                                                                }
                                                                                                                                              });
                                                                                                                                            }
                                                                                                                                            else{
                                                                                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                                                                                SnackBar(
                                                                                                                                                  content: Text(
                                                                                                                                                    'No se pueden guardar valores nulos',
                                                                                                                                                    style: TextStyle(
                                                                                                                                                      color:
                                                                                                                                                      FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                                    ),
                                                                                                                                                  ),
                                                                                                                                                  duration: Duration(milliseconds: 2000),
                                                                                                                                                  backgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                                                                                ),
                                                                                                                                              );
                                                                                                                                            }
                                                                                                                                          }

                                                                                                                                        },
                                                                                                                                        controller: TextEditingController(text: respuesta.length > index ? respuesta[index] : ''),
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  );
                                                                                                                                },
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                );
                                                                                                              } else {
                                                                                                                return SingleChildScrollView(
                                                                                                                  scrollDirection: Axis.horizontal,
                                                                                                                  child: Row(
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      Align(
                                                                                                                        alignment: AlignmentDirectional(-1, 0),
                                                                                                                        child: Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                                                                                          child: Container(
                                                                                                                            width: MediaQuery.of(context).size.width, // Ancho máximo posible
                                                                                                                            decoration: BoxDecoration(
                                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                            ),
                                                                                                                            child: SizedBox(
                                                                                                                              height: 100, // Altura máxima posible
                                                                                                                              child: ListView.builder(
                                                                                                                                scrollDirection: Axis.horizontal,
                                                                                                                                itemCount: opciones.length,
                                                                                                                                itemBuilder: (context, index) {
                                                                                                                                  return Padding(
                                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 5, 0),
                                                                                                                                    child: Container(
                                                                                                                                      width: 150,
                                                                                                                                      child: TextField(
                                                                                                                                        decoration: InputDecoration(
                                                                                                                                          labelText: opciones[index],
                                                                                                                                          hintText: opciones[index],
                                                                                                                                          border: OutlineInputBorder(),
                                                                                                                                        ),
                                                                                                                                        keyboardType: TextInputType.number,
                                                                                                                                        onSubmitted: (value) {
                                                                                                                                          if (listaValores[index] != value) {
                                                                                                                                            listaValores[index] = value;
                                                                                                                                            String cadenaValores = listaValores.join('|');
                                                                                                                                            if(FFAppState().idestadoInspeccion == 4 && FFAppState().estadoInspeccion == 'EN REGISTRO'){
                                                                                                                                              SQLiteManager.instance.actualizarRpta(
                                                                                                                                                  rpta: cadenaValores,
                                                                                                                                                  idpregunta: columnListarOpcionesRow.idPregunta!,
                                                                                                                                                  idplantillaopcion: columnListarOpcionesRow.idPlantillaOpcion!,
                                                                                                                                                  idplanitllaseccion: columnListarOpcionesRow.idPlantillaSeccion!,
                                                                                                                                                  idficha: FFAppState().IdFicha,
                                                                                                                                                  usuarioModificacion: FFAppState().username,
                                                                                                                                                  fechaModificacion: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                                                                                                                                                  equipoModificacion: FFAppState().cummovil,
                                                                                                                                                  programaModificacion: FFAppState().programacreacion,
                                                                                                                                                  numero: nrm
                                                                                                                                                // Proporciona los otros parámetros según sea necesario...
                                                                                                                                              );
                                                                                                                                              SQLiteManager.instance.inspeccion1(
                                                                                                                                                idFicha: FFAppState().IdFicha,
                                                                                                                                              );
                                                                                                                                            }

                                                                                                                                          }
                                                                                                                                        },
                                                                                                                                        controller: TextEditingController(text: respuesta.length > index ? respuesta[index] : ''),
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  );
                                                                                                                                },
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                );
                                                                                                              }


                                                                                                            case 11:
                                                                                                              if (columnListarOpcionesRow.descripcion is String) {
                                                                                                                Map<String, String> seleccionesPorEtiqueta = {};
                                                                                                                var respuesta = columnListarOpcionesRow.respuesta ?? '';
                                                                                                                var opi = columnListarOpcionesRow.respuesta ?? ''; // Respuesta inicial vacía
                                                                                                                final opcionesPorEtiqueta = (columnListarOpcionesRow.descripcion as String).split('|');
                                                                                                                if (respuesta == ''){
                                                                                                                  return Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 10),
                                                                                                                    child: SingleChildScrollView(
                                                                                                                      scrollDirection: Axis.horizontal,
                                                                                                                      child: Row(
                                                                                                                        children: opcionesPorEtiqueta.map<Widget>((opcionesEtiqueta) {
                                                                                                                          final partes = opcionesEtiqueta.split('#');
                                                                                                                          final etiqueta = partes[0];
                                                                                                                          final opciones = partes[1].split(';');

                                                                                                                          String? opcionSeleccionada;

                                                                                                                          if ((respuesta != '') && respuesta.split('|').length > opcionesPorEtiqueta.indexOf(opcionesEtiqueta)) {
                                                                                                                            final respuestaEtiqueta = respuesta.split('|')[opcionesPorEtiqueta.indexOf(opcionesEtiqueta)];
                                                                                                                            final valores = respuestaEtiqueta.split(';');

                                                                                                                            // Buscar el primer índice con valor 'S'
                                                                                                                            for (int i = 0; i < valores.length; i++) {
                                                                                                                              if (valores[i] == 'S') {
                                                                                                                                opcionSeleccionada = opciones[i];
                                                                                                                                break;
                                                                                                                              }
                                                                                                                            }

                                                                                                                            // Si no se encontró ninguna opción con valor 'S', seleccionar la primera opción
                                                                                                                            if (opcionSeleccionada == null) {
                                                                                                                              opcionSeleccionada = opciones[0];
                                                                                                                            }
                                                                                                                          }

                                                                                                                          return Padding(
                                                                                                                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                                                                                                                            child: Column(
                                                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                              children: [
                                                                                                                                Text(etiqueta), // Mostrar la etiqueta
                                                                                                                                DropdownButton<String>(
                                                                                                                                  value: opcionSeleccionada,
                                                                                                                                  onChanged: (value)  {
                                                                                                                                    // Actualizar el valor seleccionado en la variable local
                                                                                                                                    setState(()  {
                                                                                                                                      final index = opciones.indexOf(value!);
                                                                                                                                      final etiqueta = partes[0]; // Suponiendo que partes[0] es la etiqueta
                                                                                                                                      seleccionesPorEtiqueta[etiqueta] = List.generate(opciones.length, (i) => (i == index) ? 'S' : 'N').join(';');
                                                                                                                                      List<String> etiquetas = [];
                                                                                                                                      for (var opcion in opcionesPorEtiqueta) {
                                                                                                                                        final partes = opcion.split('#');
                                                                                                                                        final etiqueta = partes[0];
                                                                                                                                        etiquetas.add(etiqueta);
                                                                                                                                      }
                                                                                                                                      String opi = '';
                                                                                                                                      for (int i = 0; i < etiquetas.length; i++) {
                                                                                                                                        final seleccionEtiqueta = seleccionesPorEtiqueta[etiquetas[i]] ?? '';
                                                                                                                                        opi += seleccionEtiqueta;
                                                                                                                                        if (i < etiquetas.length - 1) {
                                                                                                                                          opi += '|'; // Añadir pipe '|' después de cada etiqueta excepto la última
                                                                                                                                        }
                                                                                                                                      }
                                                                                                                                      if(FFAppState().idestadoInspeccion == 4 && FFAppState().estadoInspeccion == 'EN REGISTRO'){
                                                                                                                                        SQLiteManager.instance.crearRpta(
                                                                                                                                            rpta: opi,
                                                                                                                                            idpregunta: columnListarOpcionesRow.idPregunta!,
                                                                                                                                            idplantillaopcion: columnListarOpcionesRow.idPlantillaOpcion!,
                                                                                                                                            idplanitllaseccion: columnListarOpcionesRow.idPlantillaSeccion!,
                                                                                                                                            idficha: FFAppState().IdFicha,
                                                                                                                                            fechaCreacion: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                                                                                                                                            equipoCreacion: FFAppState().cummovil,
                                                                                                                                            programaCreacion: FFAppState().programacreacion,
                                                                                                                                            usuarioCreacion: FFAppState().username,
                                                                                                                                            numero: nrm
                                                                                                                                          // Proporciona los otros parámetros según sea necesario...
                                                                                                                                        );
                                                                                                                                        SQLiteManager.instance.inspeccion1(
                                                                                                                                          idFicha: FFAppState().IdFicha,
                                                                                                                                        );
                                                                                                                                      }
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
                                                                                                                  return Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 10),
                                                                                                                    child: SingleChildScrollView(
                                                                                                                      scrollDirection: Axis.horizontal,
                                                                                                                      child: Row(
                                                                                                                        children: opcionesPorEtiqueta.map<Widget>((opcionesEtiqueta) {
                                                                                                                          final partes = opcionesEtiqueta.split('#');
                                                                                                                          final etiqueta = partes[0];
                                                                                                                          final opciones = partes[1].split(';');

                                                                                                                          String? opcionSeleccionada;

                                                                                                                          if ((respuesta != '') && respuesta.split('|').length > opcionesPorEtiqueta.indexOf(opcionesEtiqueta)) {
                                                                                                                            final respuestaEtiqueta = respuesta.split('|')[opcionesPorEtiqueta.indexOf(opcionesEtiqueta)];
                                                                                                                            final valores = respuestaEtiqueta.split(';');

                                                                                                                            opcionSeleccionada = valores.contains('S') ? opciones[valores.indexOf('S')] : opciones[0];

                                                                                                                            // Buscar el primer índice con valor 'S'
                                                                                                                            for (int i = 0; i < valores.length; i++) {
                                                                                                                              if (valores[i] == 'S') {
                                                                                                                                opcionSeleccionada = opciones[i];
                                                                                                                                break;
                                                                                                                              }
                                                                                                                            }

                                                                                                                            // Si no se encontró ninguna opción con valor 'S', seleccionar la primera opción
                                                                                                                            if (opcionSeleccionada == null) {
                                                                                                                              opcionSeleccionada = opciones[0];
                                                                                                                            }
                                                                                                                          }

                                                                                                                          return Padding(
                                                                                                                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                                                                                                                            child: Column(
                                                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                              children: [
                                                                                                                                Text(etiqueta), // Mostrar la etiqueta
                                                                                                                                DropdownButton<String>(
                                                                                                                                  value: opcionSeleccionada,
                                                                                                                                  onChanged: (value) {
                                                                                                                                    setState(() {
                                                                                                                                      final index = opciones.indexOf(value!);
                                                                                                                                      final etiqueta = partes[0];

                                                                                                                                      // Copiar el estado actual de seleccionesPorEtiqueta a un nuevo mapa para mantener las selecciones de otras etiquetas intactas
                                                                                                                                      Map<String, String> nuevasSelecciones = Map.from(seleccionesPorEtiqueta);

                                                                                                                                      // Actualizar solo la selección de la etiqueta actual
                                                                                                                                      nuevasSelecciones[etiqueta] = List.generate(opciones.length, (i) => (i == index) ? 'S' : 'N').join(';');

                                                                                                                                      // Actualizar el estado con el nuevo mapa de selecciones
                                                                                                                                      seleccionesPorEtiqueta = nuevasSelecciones;

                                                                                                                                      // Obtener todas las etiquetas actuales
                                                                                                                                      List<String> etiquetas = [];
                                                                                                                                      for (var opcion in opcionesPorEtiqueta) {
                                                                                                                                        final partes = opcion.split('#');
                                                                                                                                        final etiqueta = partes[0];
                                                                                                                                        etiquetas.add(etiqueta);
                                                                                                                                      }

                                                                                                                                      // Construir la cadena 'opi' utilizando las selecciones de todas las etiquetas
                                                                                                                                      String opi = '';
                                                                                                                                      for (int i = 0; i < etiquetas.length; i++) {
                                                                                                                                        final seleccionEtiqueta = seleccionesPorEtiqueta[etiquetas[i]] ?? '';
                                                                                                                                        if (respuesta.contains('|$seleccionEtiqueta|')) {
                                                                                                                                          opi += '$seleccionEtiqueta';
                                                                                                                                        } else {
                                                                                                                                          opi += seleccionEtiqueta;
                                                                                                                                        }
                                                                                                                                        if (i < etiquetas.length - 1) {
                                                                                                                                          opi += '|'; // Añadir pipe '|' después de cada etiqueta excepto la última
                                                                                                                                        }
                                                                                                                                      }

                                                                                                                                      // Imprimir el valor de la selección de la etiqueta actual para verificar
                                                                                                                                      print("Valor de selección de $etiqueta después de la actualización: ${seleccionesPorEtiqueta[etiqueta]}");

                                                                                                                                      // Imprimir el valor de opi para verificar
                                                                                                                                      print("Valor de opi después de la actualización: $opi");
                                                                                                                                      // Concatenar opi y respuesta
                                                                                                                                      String opiYRespuesta = '';
                                                                                                                                      List<String> opiParts = opi.split('|');
                                                                                                                                      List<String> respuestaParts = respuesta.split('|');
                                                                                                                                      for (int i = 0; i < opiParts.length; i++) {
                                                                                                                                        if (i < respuestaParts.length) {
                                                                                                                                          String seleccionOpi = opiParts[i];
                                                                                                                                          String seleccionRespuesta = respuestaParts[i];

                                                                                                                                          // Si la selección en opi está vacía o es igual a la selección en respuesta, tomamos la selección de respuesta
                                                                                                                                          if ((seleccionOpi == "") || seleccionOpi == seleccionRespuesta) {
                                                                                                                                            opiYRespuesta += seleccionRespuesta;
                                                                                                                                          } else {
                                                                                                                                            // De lo contrario, tomamos la selección de opi
                                                                                                                                            opiYRespuesta += seleccionOpi;
                                                                                                                                          }
                                                                                                                                        } else {
                                                                                                                                          // Si no hay una parte correspondiente en respuesta, usamos la selección de opi
                                                                                                                                          opiYRespuesta += opiParts[i];
                                                                                                                                        }
                                                                                                                                        if (i < opiParts.length - 1) {
                                                                                                                                          // Añadir pipe '|' después de cada parte excepto la última
                                                                                                                                          opiYRespuesta += '|';
                                                                                                                                        }
                                                                                                                                      }

                                                                                                                                      // Si hay partes adicionales en respuesta que no están en opi, las agregamos
                                                                                                                                      if (respuestaParts.length > opiParts.length) {
                                                                                                                                        opiYRespuesta += respuestaParts.sublist(opiParts.length).join('|');
                                                                                                                                      }

                                                                                                                                      // Imprimir el valor de la concatenación de opi y respuesta para verificar
                                                                                                                                      print("Concatenación de opi y respuesta: $opiYRespuesta");

                                                                                                                                      // Actualizar la respuesta en la base de datos
                                                                                                                                      if(FFAppState().idestadoInspeccion == 4 && FFAppState().estadoInspeccion == 'EN REGISTRO'){
                                                                                                                                        SQLiteManager.instance.actualizarRpta(
                                                                                                                                            rpta: opiYRespuesta,
                                                                                                                                            idpregunta: columnListarOpcionesRow.idPregunta!,
                                                                                                                                            idplantillaopcion: columnListarOpcionesRow.idPlantillaOpcion!,
                                                                                                                                            idplanitllaseccion: columnListarOpcionesRow.idPlantillaSeccion!,
                                                                                                                                            idficha: FFAppState().IdFicha,
                                                                                                                                            fechaModificacion: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                                                                                                                                            equipoModificacion: FFAppState().cummovil,
                                                                                                                                            programaModificacion: FFAppState().programacreacion,
                                                                                                                                            usuarioModificacion: FFAppState().username,
                                                                                                                                            numero: nrm
                                                                                                                                          // Proporciona los otros parámetros según sea necesario...
                                                                                                                                        );
                                                                                                                                        SQLiteManager.instance.inspeccion1(
                                                                                                                                          idFicha: FFAppState().IdFicha,
                                                                                                                                        );
                                                                                                                                      }
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
                                                                                                                }
                                                                                                              } else {
                                                                                                                // Manejar el caso donde la descripción no es una cadena
                                                                                                                return SizedBox.shrink();
                                                                                                              }





                                                                                                            case 12:
                                                                                                              if (columnListarOpcionesRow.descripcion is String) {
                                                                                                                final opciones = (columnListarOpcionesRow.descripcion as String).split('|');
                                                                                                                // Unir las opciones con saltos de línea
                                                                                                                final texto = opciones.join('\n');

                                                                                                                return Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 10),
                                                                                                                  child: Column(
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                    children: [
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
                                                                                                        }),
                                                                                                      );
                                                                                                    },
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    ),
                                                                                  )
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
String generarCadenaFormatoSN(int posicionSeleccionada, List<String> opciones) {
  List<String> listaSN = List.filled(opciones.length, 'N');
  listaSN[posicionSeleccionada] = 'S';
  return listaSN.join(';');
}

