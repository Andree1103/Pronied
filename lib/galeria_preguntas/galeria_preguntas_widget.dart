import 'dart:io';

import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:inspecciones_p_r_o_n_i_e_d/components/agregar_comentario_widget.dart';
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


import 'galeria_preguntas_model.dart';
export 'galeria_preguntas_model.dart';

class GaleriaPreguntasWidget extends StatefulWidget {
  const GaleriaPreguntasWidget({super.key});

  @override
  State<GaleriaPreguntasWidget> createState() => _GaleriaPreguntasWidgetState();
}

class _GaleriaPreguntasWidgetState extends State<GaleriaPreguntasWidget>
    with TickerProviderStateMixin{
  late GaleriaPreguntasModel _model;
  late List<TabController> _tabControllersList;
  late List<int> _currentTabIndicesList;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GaleriaPreguntasModel());
    _tabControllersList = [];
    _currentTabIndicesList = [];
  }

  @override
  void dispose() {
    _model.dispose();
    for (var controller in _tabControllersList) {
      controller.dispose();
    }
    super.dispose();
  }

  String? itemSelected;
  String? itemSelec;
  List<String> itemselecteds = [];
  List<String> itemsSelected = [];
  Map<String, String?> selectedValuesss = {};

  int currentTabIndex = 0; // Declaración de la variable fuera del método _addTabController

  void _addTabController(int subSectionIndex, int length) {
    // Verifica si el controlador para la subsección ya existe
    if (_tabControllersList.length <= subSectionIndex) {
      final controller = TabController(length: length, vsync: this);
      controller.addListener(() {
        setState(() {
          currentTabIndex = controller.index; // Asigna el valor a la variable
          print('Se cambió a la pestaña $currentTabIndex');
          print('Controller iNDEX ${controller.index}');
          _currentTabIndicesList[subSectionIndex] = currentTabIndex;
        });
      });
      _tabControllersList.add(controller);
      _currentTabIndicesList.add(0); // Establece el índice inicial en 0
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

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFF0E1C27),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton:
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
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
          ],
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
                        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10), // Space around the container
                        padding: EdgeInsets.all(15), // Padding inside the container
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
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                FutureBuilder<List<ListarSubseccionRow>>(
                                  future: SQLiteManager.instance.listarSubseccion(
                                    idPlantillaSeccion: FFAppState().IdSecUtil,
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
                                        _addTabController( columnIndex, cantidadRepeticiones);
                                        if (cantidadRepeticiones != 0){
                                          return Align(
                                            alignment: AlignmentDirectional(-1, 0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
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
                                                      Container(
                                                        padding: EdgeInsets.all(16.0), // Añade un padding interno de 16 píxeles por todos los lados.
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
                                                              columnListarSubseccionesRow.descripcion, // Obtiene la descripción desde una fila de datos.
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
                                                      Align(
                                                        alignment: AlignmentDirectional(-1, 0),
                                                        child: Container(
                                                          width: double.infinity,
                                                          decoration: BoxDecoration(
                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                          ),
                                                          child: Container(
                                                            height: MediaQuery.of(context).size.width * 1,
                                                            child: Column(
                                                              children: [
                                                                SingleChildScrollView(
                                                                    scrollDirection: Axis.horizontal,
                                                                    child: Visibility(
                                                                      visible: cantidadRepeticiones! > 1,
                                                                      child: TabBar(
                                                                        controller: _tabControllersList[columnIndex],
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
                                                                    controller: _tabControllersList[columnIndex],
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

                                                                                    int pregs= columnListarPreguntasRow.idPregunta!;
                                                                                    int secs= columnListarPreguntasRow.idPlantillaSeccion!;
                                                                                    String nums= nrm.toString();
                                                                                    int fichac= FFAppState().IdFicha;

                                                                                    Future<int> numberColor = buscarcomentario(pregs, secs, nums, fichac);

                                                                                    var mostarred = columnListarPreguntasRow.flagMandatorio == "1" ? true : false;


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
                                                                                              child: Container(
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                ),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Expanded(
                                                                                                      flex: 7,
                                                                                                      child: Container(
                                                                                                        width: MediaQuery.sizeOf(context).width * 0.65,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context)
                                                                                                              .secondaryBackground,
                                                                                                        ),
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            Expanded(
                                                                                                                flex:9,
                                                                                                                child: Text(
                                                                                                                  valueOrDefault<String>(
                                                                                                                    columnListarPreguntasRow.descripcionPregunta,
                                                                                                                    'Pregunta',
                                                                                                                  ),
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: 'Outfit',
                                                                                                                    fontWeight: FontWeight.w600,
                                                                                                                  ),
                                                                                                                )
                                                                                                            ),
                                                                                                            if (mostarred == true)
                                                                                                              Expanded(
                                                                                                                flex:1,
                                                                                                                  child: Text(
                                                                                                                "(*)",
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: 'Outfit',
                                                                                                                    fontWeight: FontWeight.w600,
                                                                                                                    color: Colors.red
                                                                                                                ),
                                                                                                              ))
                                                                                                          ].divide(SizedBox(width: 5)),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Expanded(
                                                                                                        flex: 3,
                                                                                                        child: Container(
                                                                                                            width: MediaQuery.sizeOf(context).width * 0.20,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context)
                                                                                                                  .secondaryBackground,
                                                                                                            ),
                                                                                                            child: Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                                                                                                                child: Row(
                                                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                  children: [
                                                                                                                    FutureBuilder(
                                                                                                                      future: buscarcomentario(pregs, secs, nums, fichac),
                                                                                                                      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                                                                                                                        if (snapshot
                                                                                                                            .hasData) {
                                                                                                                          return IconButton(
                                                                                                                            icon: Icon(
                                                                                                                                Icons
                                                                                                                                    .comment),
                                                                                                                            color: snapshot
                                                                                                                                .data ==
                                                                                                                                1
                                                                                                                                ? Color(0xFF086D82)
                                                                                                                                : Color(0xFF000000),
                                                                                                                            onPressed: () async {
                                                                                                                              FFAppState().nombresubSeccion = columnListarSubseccionesRow.descripcion!;
                                                                                                                              FFAppState().idPlantillaSeccion = columnListarPreguntasRow.idPlantillaSeccion!;
                                                                                                                              FFAppState().idPregunta = columnListarPreguntasRow.idPregunta!;
                                                                                                                              FFAppState().nrmRepeticion = nrm.toString();
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
                                                                                                                                      padding: MediaQuery.viewInsetsOf(context),
                                                                                                                                      child: AgregarComentarioWidget(),
                                                                                                                                    ),
                                                                                                                                  );
                                                                                                                                },
                                                                                                                              ).then((value) => safeSetState(() {}));
                                                                                                                            },
                                                                                                                          );
                                                                                                                        } else {
                                                                                                                          return CircularProgressIndicator();
                                                                                                                        }
                                                                                                                      },
                                                                                                                    ),
                                                                                                                    FutureBuilder(
                                                                                                                      future: buscararchivo(pregs, secs, nums, fichac),
                                                                                                                      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                                                                                                                        if (snapshot
                                                                                                                            .hasData) {
                                                                                                                          return IconButton(
                                                                                                                            icon: Icon(Icons.insert_drive_file),
                                                                                                                            color: snapshot
                                                                                                                                .data! >
                                                                                                                                0
                                                                                                                                ? Color(0xFF086D82)
                                                                                                                                : Color(0xFF000000),
                                                                                                                            onPressed: () {
                                                                                                                              FFAppState().nombresubSeccion = columnListarSubseccionesRow.descripcion!;
                                                                                                                              FFAppState().descPregunta = columnListarPreguntasRow.descripcionPregunta!;
                                                                                                                              FFAppState().idPlantillaSeccion = columnListarPreguntasRow.idPlantillaSeccion!;
                                                                                                                              FFAppState().idPregunta = columnListarPreguntasRow.idPregunta!;
                                                                                                                              FFAppState().nrmRepeticion = nrm.toString();
                                                                                                                              context.pushNamed('GaleriaArchivos');
                                                                                                                            },
                                                                                                                          );
                                                                                                                        } else {
                                                                                                                          return CircularProgressIndicator();
                                                                                                                        }
                                                                                                                      },
                                                                                                                    ),

                                                                                                                  ],
                                                                                                                )
                                                                                                            )
                                                                                                        ))
                                                                                                  ],
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
                                                                                                                                        usuarioModificacionAuditoria: FFAppState().username,
                                                                                                                                        fechaModificacionAuditoria: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                                                                                                                                        equipoModificacionAuditoria: FFAppState().cummovil,
                                                                                                                                        programaModificacionAuditoria: FFAppState().programacreacion,
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
                                                                                                                                        usuarioModificacionAuditoria: FFAppState().username,
                                                                                                                                        fechaModificacionAuditoria: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                                                                                                                                        equipoModificacionAuditoria: FFAppState().cummovil,
                                                                                                                                        programaModificacionAuditoria: FFAppState().programacreacion,
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
                                                                                                                                          usuarioModificacionAuditoria: FFAppState().username,
                                                                                                                                          fechaModificacionAuditoria: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                                                                                                                                          equipoModificacionAuditoria: FFAppState().cummovil,
                                                                                                                                          programaModificacionAuditoria: FFAppState().programacreacion,
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
                                                                                                                                          usuarioModificacionAuditoria: FFAppState().username,
                                                                                                                                          fechaModificacionAuditoria: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                                                                                                                                          equipoModificacionAuditoria: FFAppState().cummovil,
                                                                                                                                          programaModificacionAuditoria: FFAppState().programacreacion,
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
                                                                                                          var readon = FFAppState().idestadoInspeccion == 4 && FFAppState().estadoInspeccion == 'EN REGISTRO' ? false : true;
                                                                                                          TextEditingController _textController = TextEditingController(text: respuesta);

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
                                                                                                                        color: readon ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                      ),
                                                                                                                      child: Column(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        children: [
                                                                                                                          Padding(
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                                                                                                                            child: Container(
                                                                                                                                width: double.infinity,
                                                                                                                                child: Focus(
                                                                                                                                  onFocusChange: (hasFocus){
                                                                                                                                    if(!hasFocus){
                                                                                                                                      if(FFAppState().idestadoInspeccion == 4 && FFAppState().estadoInspeccion == 'EN REGISTRO'){
                                                                                                                                        SQLiteManager.instance.actualizarRpta(
                                                                                                                                            rpta: _textController.text,
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
                                                                                                                                          usuarioModificacionAuditoria: FFAppState().username,
                                                                                                                                          fechaModificacionAuditoria: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                                                                                                                                          equipoModificacionAuditoria: FFAppState().cummovil,
                                                                                                                                          programaModificacionAuditoria: FFAppState().programacreacion,
                                                                                                                                        );
                                                                                                                                      }
                                                                                                                                    }
                                                                                                                                  },
                                                                                                                                  child: TextField(
                                                                                                                                    decoration: InputDecoration(
                                                                                                                                      labelText: 'Ingrese su respuesta',
                                                                                                                                      border: OutlineInputBorder(),
                                                                                                                                    ),
                                                                                                                                    controller: _textController,
                                                                                                                                    readOnly: readon,
                                                                                                                                  ),
                                                                                                                                )
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
                                                                                                                        color: readon ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                      ),
                                                                                                                      child: Column(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        children: [
                                                                                                                          Padding(
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                                                                            child: Container(
                                                                                                                                width: double.infinity,
                                                                                                                                child: Focus(
                                                                                                                                  onFocusChange: (hasFocus){
                                                                                                                                    if(!hasFocus){
                                                                                                                                      if(FFAppState().idestadoInspeccion == 4 && FFAppState().estadoInspeccion == 'EN REGISTRO'){
                                                                                                                                        if(_textController.text != ""){
                                                                                                                                          SQLiteManager.instance.crearRpta(
                                                                                                                                              rpta: _textController.text,
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
                                                                                                                                            usuarioModificacionAuditoria: FFAppState().username,
                                                                                                                                            fechaModificacionAuditoria: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                                                                                                                                            equipoModificacionAuditoria: FFAppState().cummovil,
                                                                                                                                            programaModificacionAuditoria: FFAppState().programacreacion,
                                                                                                                                          );
                                                                                                                                        } else {
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
                                                                                                                                    }
                                                                                                                                  },
                                                                                                                                  child: TextField(
                                                                                                                                    decoration: InputDecoration(
                                                                                                                                      labelText: 'Ingrese su respuesta',
                                                                                                                                      border: OutlineInputBorder(),
                                                                                                                                    ),
                                                                                                                                    controller: _textController,
                                                                                                                                    readOnly: readon,
                                                                                                                                    /*onSubmitted: (value){
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
                                                                                                                                              },*/
                                                                                                                                  ),
                                                                                                                                )
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
                                                                                                                                          usuarioModificacionAuditoria: FFAppState().username,
                                                                                                                                          fechaModificacionAuditoria: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                                                                                                                                          equipoModificacionAuditoria: FFAppState().cummovil,
                                                                                                                                          programaModificacionAuditoria: FFAppState().programacreacion,
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
                                                                                                                                          usuarioModificacionAuditoria: FFAppState().username,
                                                                                                                                          fechaModificacionAuditoria: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                                                                                                                                          equipoModificacionAuditoria: FFAppState().cummovil,
                                                                                                                                          programaModificacionAuditoria: FFAppState().programacreacion,
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
                                                                                                          var readon = FFAppState().idestadoInspeccion == 4 && FFAppState().estadoInspeccion == 'EN REGISTRO' ? false : true;

                                                                                                          if (columnListarOpcionesRow.respuesta == null) {

                                                                                                          }

                                                                                                          final opciones = (columnListarOpcionesRow.descripcion as String).split('|');
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
                                                                                                                          TextEditingController _textController = TextEditingController(text: respuesta.length > index ? respuesta[index] : '');
                                                                                                                          return Padding(
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                                                                                                                            child: Container(
                                                                                                                              width: double.infinity,
                                                                                                                              decoration: BoxDecoration(
                                                                                                                                color: readon ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                              ),
                                                                                                                              child: Focus(
                                                                                                                                  onFocusChange: (hasFocus){
                                                                                                                                    if(!hasFocus){
                                                                                                                                      setState(() {
                                                                                                                                        if (listaValores[index] != _textController.text) {
                                                                                                                                          listaValores[index] = _textController.text;
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
                                                                                                                                              usuarioModificacionAuditoria: FFAppState().username,
                                                                                                                                              fechaModificacionAuditoria: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                                                                                                                                              equipoModificacionAuditoria: FFAppState().cummovil,
                                                                                                                                              programaModificacionAuditoria: FFAppState().programacreacion,
                                                                                                                                            );
                                                                                                                                          }
                                                                                                                                        }
                                                                                                                                      });
                                                                                                                                    }
                                                                                                                                  },
                                                                                                                                  child:TextField(
                                                                                                                                    decoration: InputDecoration(
                                                                                                                                      labelText: opciones[index],
                                                                                                                                      hintText: opciones[index],
                                                                                                                                      border: OutlineInputBorder(),
                                                                                                                                    ),
                                                                                                                                    keyboardType: TextInputType.text,
                                                                                                                                    readOnly: readon,
                                                                                                                                    /*onSubmitted: (value) {
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
                                                                                                                                                        usuarioModificacionAuditoria: FFAppState().username,
                                                                                                                                                        fechaModificacionAuditoria: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                                                                                                                                                        equipoModificacionAuditoria: FFAppState().cummovil,
                                                                                                                                                        programaModificacionAuditoria: FFAppState().programacreacion,
                                                                                                                                                      );
                                                                                                                                                    }
                                                                                                                                                  }
                                                                                                                                                });
                                                                                                                                              },*/
                                                                                                                                    controller: _textController, // Asignar el valor de la respuesta al controlador del campo de texto
                                                                                                                                  )
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
                                                                                                                          TextEditingController _textController = TextEditingController(text: respuesta.length > index ? respuesta[index] : '');
                                                                                                                          return Padding(
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                                                                                                                            child: Container(
                                                                                                                              width: double.infinity,
                                                                                                                              decoration: BoxDecoration(
                                                                                                                                color: readon ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                              ),
                                                                                                                              child: Focus(
                                                                                                                                  onFocusChange: (hasFocus){
                                                                                                                                    if(!hasFocus){
                                                                                                                                      setState(() {
                                                                                                                                        if (listaValores[index] != _textController.text) {
                                                                                                                                          listaValores[index] = _textController.text;
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
                                                                                                                                              usuarioModificacionAuditoria: FFAppState().username,
                                                                                                                                              fechaModificacionAuditoria: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                                                                                                                                              equipoModificacionAuditoria: FFAppState().cummovil,
                                                                                                                                              programaModificacionAuditoria: FFAppState().programacreacion,
                                                                                                                                            );
                                                                                                                                          }
                                                                                                                                        }
                                                                                                                                      });
                                                                                                                                    }
                                                                                                                                  },
                                                                                                                                  child: TextField(
                                                                                                                                    decoration: InputDecoration(
                                                                                                                                      labelText: opciones[index],
                                                                                                                                      hintText: opciones[index],
                                                                                                                                      border: OutlineInputBorder(),
                                                                                                                                    ),
                                                                                                                                    keyboardType: TextInputType.text,
                                                                                                                                    /*onSubmitted: (value) {
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
                                                                                                                                              },*/
                                                                                                                                    readOnly: readon,
                                                                                                                                    controller: _textController, // Asignar el valor de la respuesta al controlador del campo de texto
                                                                                                                                  )
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
                                                                                                          final respuesta = columnListarOpcionesRow.respuesta ?? ""; //

                                                                                                          // Variable para almacenar la fecha y hora seleccionada
                                                                                                          DateTime selectedDateTime = respuesta.isNotEmpty
                                                                                                              ? fecharpta(respuesta) // Analizar la respuesta existente a DateTime
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
                                                                                                                  _dateTimeController.text = '${picked.day}/${picked.month}/${picked.year} ${pickedTime.hour}:${pickedTime.minute}';
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
                                                                                                                        usuarioModificacionAuditoria: FFAppState().username,
                                                                                                                        fechaModificacionAuditoria: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                                                                                                                        equipoModificacionAuditoria: FFAppState().cummovil,
                                                                                                                        programaModificacionAuditoria: FFAppState().programacreacion,
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
                                                                                                                        usuarioModificacionAuditoria: FFAppState().username,
                                                                                                                        fechaModificacionAuditoria: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                                                                                                                        equipoModificacionAuditoria: FFAppState().cummovil,
                                                                                                                        programaModificacionAuditoria: FFAppState().programacreacion,
                                                                                                                      );
                                                                                                                    }
                                                                                                                  }
                                                                                                                });
                                                                                                              }
                                                                                                            }
                                                                                                          }

                                                                                                          String formattedDateTime = selectedDateTime.toIso8601String();
                                                                                                          var readon = FFAppState().idestadoInspeccion == 4 && FFAppState().estadoInspeccion == 'EN REGISTRO' ? false : true;

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
                                                                                                                                    child: Container (
                                                                                                                                      decoration: BoxDecoration(
                                                                                                                                        color: readon ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                      ),
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
                                                                                                                                    ),
                                                                                                                                    onTap: () {
                                                                                                                                      if(readon == true) {
                                                                                                                                        print(_dateTimeController);
                                                                                                                                      }else {
                                                                                                                                        _selectDateTime(context);
                                                                                                                                        print(_dateTimeController);
                                                                                                                                      }
                                                                                                                                    },
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                                IconButton(
                                                                                                                                  onPressed: () {
                                                                                                                                    if(readon == true) {
                                                                                                                                      ///:D
                                                                                                                                    } else {
                                                                                                                                      _selectDateTime(context);
                                                                                                                                    }
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
                                                                                                                      usuarioModificacionAuditoria: FFAppState().username,
                                                                                                                      fechaModificacionAuditoria: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                                                                                                                      equipoModificacionAuditoria: FFAppState().cummovil,
                                                                                                                      programaModificacionAuditoria: FFAppState().programacreacion,
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
                                                                                                                      usuarioModificacionAuditoria: FFAppState().username,
                                                                                                                      fechaModificacionAuditoria: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                                                                                                                      equipoModificacionAuditoria: FFAppState().cummovil,
                                                                                                                      programaModificacionAuditoria: FFAppState().programacreacion,
                                                                                                                    );
                                                                                                                  }
                                                                                                                }
                                                                                                              });
                                                                                                              // Actualizar el valor del campo de texto
                                                                                                              //_dateController.text = '${picked.day}/${picked.month}/${picked.year}';
                                                                                                            }
                                                                                                          }
                                                                                                          var readon = FFAppState().idestadoInspeccion == 4 && FFAppState().estadoInspeccion == 'EN REGISTRO' ? false : true;

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
                                                                                                                                      if(readon == true) {
                                                                                                                                        ///:D
                                                                                                                                      } else {
                                                                                                                                        _selectDate(context);
                                                                                                                                      }
                                                                                                                                    },
                                                                                                                                    child: Container (
                                                                                                                                        decoration: BoxDecoration(
                                                                                                                                          color: readon ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                        ),
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
                                                                                                                                        )
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                                IconButton(
                                                                                                                                  onPressed: () {
                                                                                                                                    if(readon == true) {
                                                                                                                                      ///:D
                                                                                                                                    } else {
                                                                                                                                      _selectDate(context);
                                                                                                                                    }
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
                                                                                                                      usuarioModificacionAuditoria: FFAppState().username,
                                                                                                                      fechaModificacionAuditoria: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                                                                                                                      equipoModificacionAuditoria: FFAppState().cummovil,
                                                                                                                      programaModificacionAuditoria: FFAppState().programacreacion,
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
                                                                                                                      usuarioModificacionAuditoria: FFAppState().username,
                                                                                                                      fechaModificacionAuditoria: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                                                                                                                      equipoModificacionAuditoria: FFAppState().cummovil,
                                                                                                                      programaModificacionAuditoria: FFAppState().programacreacion,
                                                                                                                    );
                                                                                                                  }
                                                                                                                }
                                                                                                              });
                                                                                                            }
                                                                                                          }
                                                                                                          var readon = FFAppState().idestadoInspeccion == 4 && FFAppState().estadoInspeccion == 'EN REGISTRO' ? false : true;
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
                                                                                                                                      if(readon == true) {
                                                                                                                                        ///:D
                                                                                                                                      } else {
                                                                                                                                        _selectTime(context);
                                                                                                                                      } // Mostrar el selector de hora al hacer clic
                                                                                                                                    },
                                                                                                                                    child: Container(
                                                                                                                                      decoration: BoxDecoration(
                                                                                                                                        color: readon ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                      ),
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
                                                                                                                                ),
                                                                                                                                IconButton(
                                                                                                                                  onPressed: () {
                                                                                                                                    if(readon == true) {
                                                                                                                                      ///:D
                                                                                                                                    } else {
                                                                                                                                      _selectTime(context);
                                                                                                                                    } // Mostar el selector de hora al hacer clic
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
                                                                                                          var readon = FFAppState().idestadoInspeccion == 4 && FFAppState().estadoInspeccion == 'EN REGISTRO' ? false : true;
                                                                                                          if(respuesta != "") {
                                                                                                            TextEditingController _textController = TextEditingController(text: respuesta);
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
                                                                                                                              decoration: BoxDecoration(
                                                                                                                                color: readon ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                              ),

                                                                                                                              child: Focus(
                                                                                                                                  onFocusChange: (hasFocus){
                                                                                                                                    if(!hasFocus){
                                                                                                                                      setState(() {
                                                                                                                                        if(FFAppState().idestadoInspeccion == 4 && FFAppState().estadoInspeccion == 'EN REGISTRO'){
                                                                                                                                          if(_textController.text != ""){
                                                                                                                                            SQLiteManager.instance.actualizarRpta(
                                                                                                                                                rpta: _textController.text,
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
                                                                                                                                              usuarioModificacionAuditoria: FFAppState().username,
                                                                                                                                              fechaModificacionAuditoria: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                                                                                                                                              equipoModificacionAuditoria: FFAppState().cummovil,
                                                                                                                                              programaModificacionAuditoria: FFAppState().programacreacion,
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
                                                                                                                                    }
                                                                                                                                  },
                                                                                                                                  child:TextField(
                                                                                                                                    controller: _textController,
                                                                                                                                    readOnly: readon,
                                                                                                                                    keyboardType: TextInputType.number,
                                                                                                                                    inputFormatters: <TextInputFormatter>[
                                                                                                                                      FilteringTextInputFormatter.digitsOnly // Esto permite solo números
                                                                                                                                    ],
                                                                                                                                    /*onSubmitted: (value) {
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
                                                                                                                                                        usuarioModificacionAuditoria: FFAppState().username,
                                                                                                                                                        fechaModificacionAuditoria: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                                                                                                                                                        equipoModificacionAuditoria: FFAppState().cummovil,
                                                                                                                                                        programaModificacionAuditoria: FFAppState().programacreacion,
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
                                                                                                                                              },*/
                                                                                                                                    decoration: InputDecoration(
                                                                                                                                      hintText: 'Ingrese un número', // Hint para indicar al usuario qué debe ingresar
                                                                                                                                      border: OutlineInputBorder(), // Borde del TextField
                                                                                                                                    ),
                                                                                                                                  )
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
                                                                                                            TextEditingController _textController = TextEditingController(text: respuesta);
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
                                                                                                                              decoration: BoxDecoration(
                                                                                                                                color: readon ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                              ),
                                                                                                                              child: Focus(
                                                                                                                                  onFocusChange: (hasFocus){
                                                                                                                                    if(!hasFocus){
                                                                                                                                      setState(() {
                                                                                                                                        if(FFAppState().idestadoInspeccion == 4 && FFAppState().estadoInspeccion == 'EN REGISTRO'){
                                                                                                                                          if(_textController.text != ""){
                                                                                                                                            SQLiteManager.instance.crearRpta(
                                                                                                                                                rpta: _textController.text,
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
                                                                                                                                              usuarioModificacionAuditoria: FFAppState().username,
                                                                                                                                              fechaModificacionAuditoria: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                                                                                                                                              equipoModificacionAuditoria: FFAppState().cummovil,
                                                                                                                                              programaModificacionAuditoria: FFAppState().programacreacion,
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
                                                                                                                                    }
                                                                                                                                  },
                                                                                                                                  child: TextField(
                                                                                                                                    controller: _textController,
                                                                                                                                    readOnly: readon,
                                                                                                                                    keyboardType: TextInputType.number,
                                                                                                                                    inputFormatters: <TextInputFormatter>[
                                                                                                                                      FilteringTextInputFormatter.digitsOnly // Esto permite solo números
                                                                                                                                    ],
                                                                                                                                    /*onSubmitted: (value) {
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
                                                                                                                                                        usuarioModificacionAuditoria: FFAppState().username,
                                                                                                                                                        fechaModificacionAuditoria: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                                                                                                                                                        equipoModificacionAuditoria: FFAppState().cummovil,
                                                                                                                                                        programaModificacionAuditoria: FFAppState().programacreacion,
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
                                                                                                                                              },*/
                                                                                                                                    decoration: InputDecoration(
                                                                                                                                      hintText: 'Ingrese un número', // Hint para indicar al usuario qué debe ingresar
                                                                                                                                      border: OutlineInputBorder(), // Borde del TextField
                                                                                                                                    ),
                                                                                                                                  )
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
                                                                                                          var readon = FFAppState().idestadoInspeccion == 4 && FFAppState().estadoInspeccion == 'EN REGISTRO' ? false : true;


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
                                                                                                                          height: 70, // Altura máxima posible
                                                                                                                          child: ListView.builder(
                                                                                                                            scrollDirection: Axis.horizontal,
                                                                                                                            itemCount: opciones.length,
                                                                                                                            itemBuilder: (context, index) {
                                                                                                                              TextEditingController _textController = TextEditingController(text: respuesta.length > index ? respuesta[index] : '');
                                                                                                                              return Padding(
                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 15),
                                                                                                                                child: Container(
                                                                                                                                  width: 150,
                                                                                                                                  height: 70,
                                                                                                                                  decoration: BoxDecoration(
                                                                                                                                    color: readon ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                  ),
                                                                                                                                  child: Focus(
                                                                                                                                      onFocusChange: (hasFocus){
                                                                                                                                        if(!hasFocus){
                                                                                                                                          if(FFAppState().idestadoInspeccion == 4 && FFAppState().estadoInspeccion == 'EN REGISTRO'){
                                                                                                                                            if(_textController.text != ""){
                                                                                                                                              setState(() {
                                                                                                                                                if (listaValores[index] != _textController.text) {
                                                                                                                                                  listaValores[index] = _textController.text;
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
                                                                                                                                                    usuarioModificacionAuditoria: FFAppState().username,
                                                                                                                                                    fechaModificacionAuditoria: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                                                                                                                                                    equipoModificacionAuditoria: FFAppState().cummovil,
                                                                                                                                                    programaModificacionAuditoria: FFAppState().programacreacion,
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
                                                                                                                                        }
                                                                                                                                      },
                                                                                                                                      child: TextField(
                                                                                                                                        decoration: InputDecoration(
                                                                                                                                          hintText: opciones[index],
                                                                                                                                          border: OutlineInputBorder(),
                                                                                                                                        ),
                                                                                                                                        keyboardType: TextInputType.number,
                                                                                                                                        readOnly: readon,
                                                                                                                                        /*onSubmitted: (value) {
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
                                                                                                                                                  },*/
                                                                                                                                        controller: _textController,
                                                                                                                                      )
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
                                                                                                                          height: 70, // Altura máxima posible
                                                                                                                          child: ListView.builder(
                                                                                                                            scrollDirection: Axis.horizontal,
                                                                                                                            itemCount: opciones.length,
                                                                                                                            itemBuilder: (context, index) {
                                                                                                                              TextEditingController _textController = TextEditingController(text: respuesta.length > index ? respuesta[index] : '');
                                                                                                                              return Padding(
                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 5, 15),
                                                                                                                                child: Container(
                                                                                                                                  width: 150,
                                                                                                                                  height: 70,
                                                                                                                                  decoration: BoxDecoration(
                                                                                                                                    color: readon ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                  ),
                                                                                                                                  child: Focus(
                                                                                                                                      onFocusChange: (hasFocus){
                                                                                                                                        if(!hasFocus){
                                                                                                                                          if(FFAppState().idestadoInspeccion == 4 && FFAppState().estadoInspeccion == 'EN REGISTRO'){
                                                                                                                                            if(_textController.text != ""){
                                                                                                                                              setState(() {
                                                                                                                                                if (listaValores[index] != _textController.text) {
                                                                                                                                                  listaValores[index] = _textController.text;
                                                                                                                                                  String cadenaValores = listaValores.join('|');
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
                                                                                                                                                    usuarioModificacionAuditoria: FFAppState().username,
                                                                                                                                                    fechaModificacionAuditoria: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                                                                                                                                                    equipoModificacionAuditoria: FFAppState().cummovil,
                                                                                                                                                    programaModificacionAuditoria: FFAppState().programacreacion,
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
                                                                                                                                        }
                                                                                                                                      },
                                                                                                                                      child: TextField(
                                                                                                                                        decoration: InputDecoration(
                                                                                                                                          labelText: opciones[index],
                                                                                                                                          hintText: opciones[index],
                                                                                                                                          border: OutlineInputBorder(),
                                                                                                                                        ),
                                                                                                                                        keyboardType: TextInputType.number,
                                                                                                                                        readOnly: readon,
                                                                                                                                        /*onSubmitted: (value) {
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
                                                                                                                                                  },*/
                                                                                                                                        controller: _textController,
                                                                                                                                      )
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
                                                                                                                          //opcionSeleccionada = opciones[0];
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
                                                                                                                                      usuarioModificacionAuditoria: FFAppState().username,
                                                                                                                                      fechaModificacionAuditoria: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                                                                                                                                      equipoModificacionAuditoria: FFAppState().cummovil,
                                                                                                                                      programaModificacionAuditoria: FFAppState().programacreacion,
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

                                                                                                                        opcionSeleccionada = valores.contains('S') ? opciones[valores.indexOf('S')] : null;

                                                                                                                        // Buscar el primer índice con valor 'S'
                                                                                                                        for (int i = 0; i < valores.length; i++) {
                                                                                                                          if (valores[i] == 'S') {
                                                                                                                            opcionSeleccionada = opciones[i];
                                                                                                                            break;
                                                                                                                          }
                                                                                                                        }

                                                                                                                        // Si no se encontró ninguna opción con valor 'S', seleccionar la primera opción
                                                                                                                        if (opcionSeleccionada == null) {
                                                                                                                          //opcionSeleccionada = opciones[0];
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
                                                                                                                                      usuarioModificacionAuditoria: FFAppState().username,
                                                                                                                                      fechaModificacionAuditoria: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                                                                                                                                      equipoModificacionAuditoria: FFAppState().cummovil,
                                                                                                                                      programaModificacionAuditoria: FFAppState().programacreacion,
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
                                                                                                            var readon = FFAppState().idestadoInspeccion == 4 && FFAppState().estadoInspeccion == 'EN REGISTRO' ? false : true;

                                                                                                            return Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 10),
                                                                                                              child: Column(
                                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                children: [
                                                                                                                  Container(
                                                                                                                    decoration: BoxDecoration(
                                                                                                                      color: readon ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                    ),
                                                                                                                    child:TextField(
                                                                                                                      keyboardType: TextInputType.multiline,
                                                                                                                      maxLines: null,
                                                                                                                      onChanged: (value) {
                                                                                                                        // Aquí puedes manejar los cambios en el valor del TextField
                                                                                                                      },
                                                                                                                      readOnly: true,
                                                                                                                      decoration: InputDecoration(
                                                                                                                        hintText: texto, // Mostrar el texto como hint
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  )
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
String generarCadenaFormatoSN(int posicionSeleccionada, List<String> opciones) {
  List<String> listaSN = List.filled(opciones.length, 'N');
  listaSN[posicionSeleccionada] = 'S';
  return listaSN.join(';');
}

DateTime fecharpta (String respuesta){
  List<String> parts = respuesta.split(' ');
  String fechaPart = parts[0];
  String horaPart = parts.length > 1 ? parts[1] : "00:00";
  // Dividir la fecha en día, mes y año
  List<String> dateParts = fechaPart.split('/');
  int day = int.parse(dateParts[0]);
  int month = int.parse(dateParts[1]);
  int year = int.parse(dateParts[2]);

  // Dividir la hora en horas y minutos
  List<String> timeParts = horaPart.split(':');
  int hour = int.parse(timeParts[0]);
  int minute = int.parse(timeParts[1]);

  // Crear el objeto DateTime
  DateTime fechahoy = DateTime(year, month, day, hour, minute);
  return fechahoy;
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
