import 'dart:io';

import 'package:path_provider/path_provider.dart';

import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:signature/signature.dart';
import 'add_firma_model.dart';
export 'add_firma_model.dart';

class AddFirmaWidget extends StatefulWidget {
  const AddFirmaWidget({super.key});

  @override
  State<AddFirmaWidget> createState() => _AddFirmaWidgetState();
}

class _AddFirmaWidgetState extends State<AddFirmaWidget> {
  late AddFirmaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddFirmaModel());

    _model.dat1Controller1 ??= TextEditingController();
    _model.dat1FocusNode1 ??= FocusNode();

    _model.dat1Controller2 ??= TextEditingController();
    _model.dat1FocusNode2 ??= FocusNode();

    _model.dat1Controller3 ??= TextEditingController();
    _model.dat1FocusNode3 ??= FocusNode();

    _model.dat1Controller4 ??= TextEditingController();
    _model.dat1FocusNode4 ??= FocusNode();
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

    Uint8List? exportedImge;
    String? savedImagePath;

    Future<String> saveImageToDevice(Uint8List imageBytes) async {
      try {
        // Obtener el directorio de almacenamiento local
        final appDir = await getApplicationDocumentsDirectory();
        // Generar un nombre de archivo único
        final fileName = DateTime.now().millisecondsSinceEpoch.toString() + '.png';
        // Construir la ruta del archivo
        final filePath = '${appDir.path}/$fileName';
        // Escribir los bytes de la imagen en el archivo
        await File(filePath).writeAsBytes(imageBytes);
        // Guardar la imagen en la galería (opcional)
        // final result = await ImageGallerySaver.saveFile(filePath);
        // return result['isSuccess'] ? filePath : '';
        // Retorna la ruta del archivo guardado en el directorio de documentos
        return filePath;
      } catch (e) {
        // En caso de cualquier error, imprime el error y retorna una cadena vacía
        print('Error al guardar la imagen: $e');
        return '';
      }
    }
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
                  alignment: AlignmentDirectional(-1.0, -1.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Form(
                      key: _model.formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 15.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 15.0),
                                child: Text(
                                  'Agregar Firma',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 15.0),
                              child: FlutterFlowDropDown<String>(
                                controller:
                                _model.dropDownValueController1 ??=
                                    FormFieldController<String>(null),
                                options: ['Director', 'Profesor'],
                                onChanged: (val) => setState(
                                        () => _model.dropDownValue1 = val),
                                width: double.infinity,
                                height: 50.0,
                                textStyle:
                                FlutterFlowTheme.of(context).bodyMedium,
                                hintText: 'Tipo de Persona',
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 2.0,
                                borderColor:
                                FlutterFlowTheme.of(context).alternate,
                                borderWidth: 2.0,
                                borderRadius: 8.0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 4.0, 16.0, 4.0),
                                hidesUnderline: true,
                                isOverButton: true,
                                isSearchable: false,
                                isMultiSelect: false,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 15.0),
                              child: FlutterFlowDropDown<String>(
                                controller:
                                _model.dropDownValueController2 ??=
                                    FormFieldController<String>(null),
                                options: ['DNI'],
                                onChanged: (val) => setState(
                                        () => _model.dropDownValue2 = val),
                                width: double.infinity,
                                height: 50.0,
                                textStyle:
                                FlutterFlowTheme.of(context).bodyMedium,
                                hintText: 'Tipo de documento',
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 2.0,
                                borderColor:
                                FlutterFlowTheme.of(context).alternate,
                                borderWidth: 2.0,
                                borderRadius: 8.0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 4.0, 16.0, 4.0),
                                hidesUnderline: true,
                                isOverButton: true,
                                isSearchable: false,
                                isMultiSelect: false,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 15.0),
                              child: Container(
                                width: double.infinity,
                                child: TextFormField(
                                  controller: _model.dat1Controller1,
                                  focusNode: _model.dat1FocusNode1,
                                  autofocus: true,
                                  autofillHints: [AutofillHints.birthday],
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Número de documento',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .override(
                                      fontFamily: 'Outfit',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius:
                                      BorderRadius.circular(12.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius:
                                      BorderRadius.circular(12.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius:
                                      BorderRadius.circular(12.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius:
                                      BorderRadius.circular(12.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                    fontFamily: 'Outfit',
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                                  keyboardType: TextInputType.datetime,
                                  inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(8)],
                                  validator: _model.dat1Controller1Validator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 15.0),
                              child: Container(
                                width: double.infinity,
                                child: TextFormField(
                                  controller: _model.dat1Controller2,
                                  focusNode: _model.dat1FocusNode2,
                                  autofocus: true,
                                  autofillHints: [AutofillHints.birthday],
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Nombres',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .override(
                                      fontFamily: 'Outfit',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius:
                                      BorderRadius.circular(12.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius:
                                      BorderRadius.circular(12.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius:
                                      BorderRadius.circular(12.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius:
                                      BorderRadius.circular(12.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                    fontFamily: 'Outfit',
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                                  inputFormatters: [ LengthLimitingTextInputFormatter(100)],
                                  validator: _model.dat1Controller2Validator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 15.0),
                              child: Container(
                                width: double.infinity,
                                child: TextFormField(
                                  controller: _model.dat1Controller3,
                                  focusNode: _model.dat1FocusNode3,
                                  autofocus: true,
                                  autofillHints: [AutofillHints.birthday],
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Primer Apellido',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .override(
                                      fontFamily: 'Outfit',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius:
                                      BorderRadius.circular(12.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius:
                                      BorderRadius.circular(12.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius:
                                      BorderRadius.circular(12.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius:
                                      BorderRadius.circular(12.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                    fontFamily: 'Outfit',
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                                  inputFormatters: [ LengthLimitingTextInputFormatter(100)],
                                  validator: _model.dat1Controller3Validator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 15.0),
                              child: Container(
                                width: double.infinity,
                                child: TextFormField(
                                  controller: _model.dat1Controller4,
                                  focusNode: _model.dat1FocusNode4,
                                  autofocus: true,
                                  autofillHints: [AutofillHints.birthday],
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Segundo Apellido',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .override(
                                      fontFamily: 'Outfit',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius:
                                      BorderRadius.circular(12.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius:
                                      BorderRadius.circular(12.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius:
                                      BorderRadius.circular(12.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius:
                                      BorderRadius.circular(12.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                    fontFamily: 'Outfit',
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                                  inputFormatters: [ LengthLimitingTextInputFormatter(100)],
                                  validator: _model.dat1Controller4Validator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 10.0),
                              child: Text(
                                'Firma',
                                style:
                                FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 145.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                border: Border.all(
                                  width: 1.0,
                                ),
                              ),
                              child: ClipRect(
                                child: Signature(
                                  controller: _model.signatureController ??=
                                      SignatureController(
                                        penStrokeWidth: 2.0,
                                        penColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        exportBackgroundColor: Color(0x00000000),
                                      ),
                                  backgroundColor:
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  height: double.infinity,
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 5.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    _model.signatureController?.clear();
                                  },
                                  text: 'Limpiar firma',
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding:
                                    EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context)
                                        .darkSeaGreen,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                      fontFamily: 'Outfit',
                                      color: Colors.white,
                                    ),
                                    elevation: 3.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 25.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    if (_model.formKey.currentState == null ||
                                        !_model.formKey.currentState!
                                            .validate()) {
                                      return;
                                    }
                                    if (_model.dropDownValue1 == null) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Seleccionar tipo de persona',
                                            style: TextStyle(
                                              color:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                            ),
                                          ),
                                          duration:
                                          Duration(milliseconds: 2000),
                                          backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .primary,
                                        ),
                                      );
                                      return;
                                    }
                                    if (_model.dropDownValue2 == null) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Seleccionar tipo de documento',
                                            style: TextStyle(
                                              color:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                            ),
                                          ),
                                          duration:
                                          Duration(milliseconds: 2000),
                                          backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .primary,
                                        ),
                                      );
                                      return;
                                    }
                                    exportedImge = await _model.signatureController?.toPngBytes();
                                    savedImagePath = await saveImageToDevice(exportedImge!);
                                    setState(() {
                                      SQLiteManager.instance.inspeccion1(
                                        idFicha: FFAppState().IdFicha,
                                        usuarioModificacionAuditoria: FFAppState().username,
                                        fechaModificacionAuditoria: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                                        equipoModificacionAuditoria: FFAppState().cummovil,
                                        programaModificacionAuditoria: FFAppState().programacreacion,
                                      );
                                    });
                                    /*await SQLiteManager.instance.crearFirma(
                                      persona: _model.dropDownValue1,
                                      documento: _model.dropDownValue2,
                                      numeroDoc: _model.dat1Controller1.text,
                                      apePaterno: _model.dat1Controller3.text,
                                      apeMaterno: _model.dat1Controller4.text,
                                      image: savedImagePath,
                                      nombre: _model.dat1Controller2.text,
                                    );*/
                                    await SQLiteManager.instance.crearFichaFirma(
                                      idFicha: FFAppState().IdFicha,
                                      idTipoPersona: _model.dropDownValue1 == 'Director' ? 1 : 2,
                                      idTipoDocumento: _model.dropDownValue2 == 'DNI' ? 1 : 2,
                                      numDocumento: _model.dat1Controller1.text,
                                      nombres: _model.dat1Controller2.text,
                                      apellidoPaterno: _model.dat1Controller3.text,
                                      apellidoMaterno: _model.dat1Controller4.text,
                                      estadoAuditoria: '1',
                                      tipoArchivo: 'F',
                                      rutalocal: savedImagePath,
                                      modificacionMovil: 1,
                                      uploadDocumento: 0,
                                      fechaCreacionAuditoria: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                                      equipoCreacionAuditoria: FFAppState().cummovil,
                                      programaCreacionAuditoria: FFAppState().programacreacion,
                                      usuarioCreacionAuditoria: FFAppState().username,
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'La firma ha sido agregada satisfactoriamente',
                                          style: TextStyle(
                                            color:
                                            FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                        ),
                                        duration:
                                        Duration(milliseconds: 4000),
                                        backgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                    );

                                    context.pushNamed('Firmas');
                                  },
                                  text: 'Guardar firma',
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding:
                                    EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: Color(0xFF086D82),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                      fontFamily: 'Outfit',
                                      color: Colors.white,
                                    ),
                                    elevation: 3.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 25.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    context.pushNamed('Firmas');
                                  },
                                  text: 'Cancelar',
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding:
                                    EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: Color(0xFFDE1B1B),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                      fontFamily: 'Outfit',
                                      color: Colors.white,
                                    ),
                                    elevation: 3.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
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
        ),
      ),
    );
  }
}
