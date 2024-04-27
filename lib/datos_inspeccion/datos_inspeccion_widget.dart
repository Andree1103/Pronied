import 'dart:async';

import 'package:flutter/services.dart';
import 'package:inspecciones_p_r_o_n_i_e_d/Utils/Constans.dart';
import 'package:inspecciones_p_r_o_n_i_e_d/components/agregar_comentario_widget.dart';
import 'package:inspecciones_p_r_o_n_i_e_d/components/alert_edit_inspeccion_widget.dart';
import 'package:inspecciones_p_r_o_n_i_e_d/components/alert_finalizar_inspeccion_widget.dart';

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
          child: Stack(
            children: [
              Column(
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
                                                borderRadius: BorderRadius.circular(8),
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
                                                          .fromSTEB(5, 10, 0, 10),
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
                                                  String subsecciontext = "";
                                                  if(cantidadRepeticiones == 1){
                                                    subsecciontext = "${columnListarSubseccionesRow.descripcion!}";
                                                  } else {
                                                    subsecciontext = "${columnListarSubseccionesRow.descripcion!} (${cantidadRepeticiones})";
                                                  }
                                                  _addTabController(listViewIndex, columnIndex, cantidadRepeticiones);
                                                  if (cantidadRepeticiones != 0){
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
                                                                InkWell(
                                                                  onTap: () {
                                                                    FFAppState().nomSeccion = listViewListarPlantillaSeccionRow.descripcion!;
                                                                    FFAppState().IdSecUtil = columnListarSubseccionesRow.idPlantillaSeccion!;
                                                                    context.pushNamed('GaleriaPreguntas');
                                                                  },
                                                                  child: Container(
                                                                    decoration: BoxDecoration(
                                                                      color: Color(0xFF1CA8B5),
                                                                      borderRadius: BorderRadius.circular(10),
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          color: Colors.black.withOpacity(0.1),
                                                                          spreadRadius: 0,
                                                                          blurRadius: 10,
                                                                          offset: Offset(0, 5),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    margin: EdgeInsetsDirectional.fromSTEB(5, 2, 5, 2),
                                                                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 4),
                                                                    child: Row(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Asegura el espacio entre el texto y el botón
                                                                      children: [
                                                                        Expanded(
                                                                          flex:8,
                                                                          child: Text(
                                                                          valueOrDefault<String>(
                                                                            subsecciontext,
                                                                            'Subsección',
                                                                          ),
                                                                          style: TextStyle(
                                                                            color: Colors.white,
                                                                            fontSize: 16,
                                                                            fontWeight: FontWeight.bold,
                                                                            fontFamily: 'Outfit',
                                                                          ),
                                                                        ),),
                                                                        Expanded(
                                                                          flex: 2,
                                                                          child: Container(
                                                                            height: 45,
                                                                            width: 45,
                                                                            child: FloatingActionButton(
                                                                              onPressed: () {
                                                                                FFAppState().nomSeccion = listViewListarPlantillaSeccionRow.descripcion!;
                                                                                FFAppState().IdSecUtil = columnListarSubseccionesRow.idPlantillaSeccion!;
                                                                                context.pushNamed('GaleriaPreguntas');
                                                                              },
                                                                              backgroundColor: Colors.white,
                                                                              elevation: 3,
                                                                              shape: CircleBorder(),
                                                                              child: Icon(
                                                                                Icons.arrow_forward_ios_outlined, // Icono de ejemplo, puedes cambiarlo según la funcionalidad
                                                                                color: Colors.black,
                                                                                size: 20,
                                                                              ),
                                                                            ),
                                                                          ))
                                                                      ],
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  } else {
                                                    return Container();
                                                  }
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
              if(FFAppState().idestadoInspeccion == Sincronizacion.INCOMPLETO && FFAppState().estadoInspeccion == 'EN REGISTRO')
                Align(
                  alignment: AlignmentDirectional(1, 1),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 25, 25),
                    child: FFButtonWidget(
                      onPressed: () async {
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          enableDrag: false,
                          context: context,
                          builder: (context) {
                            return GestureDetector(
                              onTap: () => _model.unfocusNode.canRequestFocus
                                  ? FocusScope.of(context)
                                  .requestFocus(_model.unfocusNode)
                                  : FocusScope.of(context).unfocus(),
                              child: Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: Container(
                                  height: 200,
                                  child: AlertFinalizarInspeccionWidget(),
                                ),
                              ),
                            );
                          },
                        ).then((value) => safeSetState(() {}));
                      },
                      text: 'Finalizar Inspección',
                      options: FFButtonOptions(
                        height: 40,
                        padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                        iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        color: Color(0xFF086D82),
                        textStyle:
                        FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Outfit',
                          color: Colors.white,
                          letterSpacing: 0,
                        ),
                        elevation: 3,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              Visibility(
                visible: FFAppState().idestadoInspeccion == Sincronizacion.COMPLETO && FFAppState().estadoInspeccion == 'REALIZADA' && FFAppState().modificadoMovil == 1,
                child: Align(
                alignment: AlignmentDirectional(1, 1),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 25, 25),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return GestureDetector(
                            onTap: () => _model.unfocusNode.canRequestFocus
                                ? FocusScope.of(context)
                                .requestFocus(_model.unfocusNode)
                                : FocusScope.of(context).unfocus(),
                            child: Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: Container(
                                height: 200,
                                child: AlertEditInspeccionWidget(),
                              ),
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    },
                    text: 'Editar Inspección',
                    options: FFButtonOptions(
                      height: 40,
                      padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                      iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      color: Color(0xFF086D82),
                      textStyle:
                      FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Outfit',
                        color: Colors.white,
                        letterSpacing: 0,
                      ),
                      elevation: 3,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),)
            ],
          )
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
Future<int> buscarcomentario(int pregunta, int seccion, String num, int ficha) async {
  var cnt = await SQLiteManager.instance.VerificarSiExistePreguntaComentarioNotNUll(
    idPregunta: pregunta,
    idPlantillaSeccion: seccion,
    numeroRepeticion: num,
    idFicha: ficha,
  );
  return cnt.length;
}

Future<int> buscararchivo(int pregunta, int seccion, String num, int ficha) async {
  var cnt = await SQLiteManager.instance.VerificarSiExistePreguntaComentarioARCENUll(
    idPregunta: pregunta,
    idPlantillaSeccion: seccion,
    numeroRepeticion: num,
    idFicha: ficha,
  );
  return cnt.length;
}



