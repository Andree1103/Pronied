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
      });
      // Actualizar el valor del campo de texto
      _dateController.text = '${picked.day}/${picked.month}/${picked.year}';
    }
  }
  TextEditingController _dateController = TextEditingController();

  DateTime? selectedDateTime;
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
          _dateTimeController.text = '${picked.day}/${picked.month}/${picked.year} ${pickedTime.format(context)}';
        });
      }
    }
  }
  TextEditingController _dateTimeController = TextEditingController();

  TimeOfDay? selectedTime;

// Función para mostrar el selector de hora
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
        // Actualiza el valor del controlador con la hora seleccionada
        _timeController.text = selectedTime!.format(context);
      });
    }
  }
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
                                                                                            // Verificar si la descripción es una cadena antes de usar split
                                                                                              if (columnListarOpcionesRow.descripcion is String && columnListarOpcionesRow.idTipoOpcion == 1) {
                                                                                                final opciones = (columnListarOpcionesRow.descripcion as String).split(';');
                                                                                                return Align(
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
                                                                                                              child: Column(
                                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                children: opciones
                                                                                                                    .map((opcion) => Row(
                                                                                                                  children: [
                                                                                                                    Radio<String>(
                                                                                                                      value: opcion,
                                                                                                                      groupValue: itemSelected,
                                                                                                                      onChanged: (value) {
                                                                                                                        setState(() {
                                                                                                                          itemSelected = value;
                                                                                                                        });
                                                                                                                      },
                                                                                                                    ),
                                                                                                                    Text(opcion),
                                                                                                                  ],
                                                                                                                ))
                                                                                                                    .toList(),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                );
                                                                                              } else {
                                                                                                // Manejar el caso donde la descripción no es una cadena
                                                                                                return SizedBox.shrink();
                                                                                              }

                                                                                          // Agrega otros casos según sea necesario
                                                                                            case 2:
                                                                                              if (columnListarOpcionesRow.descripcion is String) {
                                                                                                final opciones = (columnListarOpcionesRow.descripcion as String).split(';');
                                                                                                return Align(
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
                                                                                                              child: Column(
                                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                children: opciones
                                                                                                                    .map((opcion) => Row(
                                                                                                                  children: [
                                                                                                                    Checkbox(
                                                                                                                      value: itemsSelected.contains(opcion),
                                                                                                                      onChanged: (value) {
                                                                                                                        setState(() {
                                                                                                                          if (value != null && value) {
                                                                                                                            itemsSelected.add(opcion);
                                                                                                                          } else {
                                                                                                                            itemsSelected.remove(opcion);
                                                                                                                          }
                                                                                                                        });
                                                                                                                      },
                                                                                                                    ),
                                                                                                                    Text(opcion),
                                                                                                                  ],
                                                                                                                ))
                                                                                                                    .toList(),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                );
                                                                                              } else {
                                                                                                return SizedBox.shrink();
                                                                                              }

                                                                                              // Caso específico para el tipo de opción 3 (respuesta libre)
                                                                                            case 3:
                                                                                              return Align(
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
                                                                                                              onChanged: (value) {
                                                                                                                // Implementa la lógica para manejar el cambio en el valor del campo de texto
                                                                                                              },
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              );

                                                                                          // Caso específico para el tipo de opción 4 (lista desplegable)
                                                                                            case 4:
                                                                                            // Verificar si la descripción es una cadena antes de usar split
                                                                                              if (columnListarOpcionesRow.descripcion is String) {
                                                                                                final opciones = (columnListarOpcionesRow.descripcion as String).split(';');
                                                                                                return Align(
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
                                                                                                                    itemSelec = value!;
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
                                                                                                );
                                                                                              } else {
                                                                                                // Manejar el caso donde la descripción no es una cadena
                                                                                                return SizedBox.shrink();
                                                                                              }

                                                                                            case 5:
                                                                                              final opciones = (columnListarOpcionesRow.descripcion as String).split('|');
                                                                                              return Align(
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
                                                                                                      children: opciones.map((opcion) {
                                                                                                        return Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                                                                                                          child: Container(
                                                                                                            width: double.infinity,
                                                                                                            child: TextField(
                                                                                                              decoration: InputDecoration(
                                                                                                                labelText: opcion,
                                                                                                                hintText: opcion,
                                                                                                                border: OutlineInputBorder(),
                                                                                                              ),
                                                                                                              keyboardType: TextInputType.number,
                                                                                                              onChanged: (value) {
                                                                                                                // Implementa la lógica para manejar el cambio en el valor del campo de texto
                                                                                                              },
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      }).toList(),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              );

                                                                                            case 6:
                                                                                              return Align(
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
                                                                                                                      _selectDateTime(context);
                                                                                                                    },
                                                                                                                    child: TextFormField(
                                                                                                                      controller: _dateTimeController,
                                                                                                                      readOnly: true,
                                                                                                                      decoration: InputDecoration(
                                                                                                                        labelText: 'Fecha y Hora',
                                                                                                                        hintText: selectedDateTime != null
                                                                                                                            ? '${selectedDateTime!.day}/${selectedDateTime!.month}/${selectedDateTime!.year}'
                                                                                                                            : 'Seleccionar fecha y hora',
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
                                                                                              );

                                                                                            case 7:
                                                                                              return Align(
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
                                                                                                                      controller: _dateController,
                                                                                                                      readOnly: true,
                                                                                                                      decoration: InputDecoration(
                                                                                                                        labelText: 'Fecha',
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
                                                                                              );

                                                                                            case 8:
                                                                                              return Align(
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
                                                                                                                        labelText: 'Hora',
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
                                                                                              );

                                                                                            case 9:
                                                                                              return Align(
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
                                                                                                              keyboardType: TextInputType.number,
                                                                                                              inputFormatters: <TextInputFormatter>[
                                                                                                                FilteringTextInputFormatter.digitsOnly // Esto permite solo números
                                                                                                              ],
                                                                                                              onChanged: (value) {
                                                                                                                // Aquí puedes manejar los cambios en el valor del TextField
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
                                                                                              );

                                                                                            case 10:
                                                                                              final opciones = (columnListarOpcionesRow.descripcion as String).split('|');
                                                                                              return Align(
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
                                                                                                      children: opciones.map((opcion) {
                                                                                                        return Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                                                                                                          child: Container(
                                                                                                            width: double.infinity,
                                                                                                            child: TextField(
                                                                                                              decoration: InputDecoration(
                                                                                                                labelText: opcion,
                                                                                                                hintText: opcion,
                                                                                                                border: OutlineInputBorder(),
                                                                                                              ),
                                                                                                              keyboardType: TextInputType.number,
                                                                                                              onChanged: (value) {
                                                                                                                // Implementa la lógica para manejar el cambio en el valor del campo de texto
                                                                                                              },
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      }).toList(),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              );

                                                                                            case 11:
                                                                                              if (columnListarOpcionesRow.descripcion is String) {
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

                                                                                                // Unir las opciones con saltos de línea
                                                                                                final texto = opciones.join('\n');

                                                                                                return Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                                                                                                  child: TextField(
                                                                                                    keyboardType: TextInputType.multiline,
                                                                                                    maxLines: null,
                                                                                                    onChanged: (value) {
                                                                                                      // Aquí puedes manejar los cambios en el valor del TextField
                                                                                                    },
                                                                                                    decoration: InputDecoration(
                                                                                                      hintText: texto, // Mostrar el texto como hint
                                                                                                    ),
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
