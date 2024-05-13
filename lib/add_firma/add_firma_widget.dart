import 'dart:developer';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:image/image.dart' as img;
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:inspecciones_p_r_o_n_i_e_d/Utils/ConstansAlerts.dart';
import 'package:inspecciones_p_r_o_n_i_e_d/Utils/Constans.dart';
import 'package:inspecciones_p_r_o_n_i_e_d/Utils/ConstansColors.dart';
import 'package:inspecciones_p_r_o_n_i_e_d/Utils/ConstansText.dart';
import 'package:inspecciones_p_r_o_n_i_e_d/add_firma/ImageDrawPage.dart';
import 'package:inspecciones_p_r_o_n_i_e_d/backend/api_requests/api_maestro.dart';
import 'package:inspecciones_p_r_o_n_i_e_d/flutter_flow/flutter_flow_google_map.dart';
import 'package:inspecciones_p_r_o_n_i_e_d/flutter_flow/upload_data.dart';
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

  var readon = false;
  var selectfoto = false;
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
    Future<Uint8List> combineImageAndSignature(Uint8List backgroundImage, Uint8List signatureImage, double scale) async {
      // Decode the background and the signature images
      img.Image bgImg = img.decodeImage(backgroundImage)!;
      img.Image sigImg = img.decodeImage(signatureImage)!;

      // Redimensionar la firma basado en el parámetro de escala
      int newWidth = (sigImg.width * scale).toInt();
      int newHeight = (sigImg.height * scale).toInt();
      sigImg = img.copyResize(sigImg, width: newWidth, height: newHeight);

      // Calculate the position to center the signature at the bottom
      int offsetX = (bgImg.width - sigImg.width) ~/ 2;
      int offsetY = bgImg.height - sigImg.height - 20;  // 20 pixels from the bottom

      // Draw the signature image onto the background image
      img.compositeImage(bgImg, sigImg, dstX: offsetX, dstY: offsetY);

      // Encode the resulting image back to Uint8List
      return Uint8List.fromList(img.encodePng(bgImg));
    }

    Future<String> saveImageToDevice(Uint8List imageBytes) async {
      try {
        final appDir = await getApplicationDocumentsDirectory();
        final fileName = DateTime.now().millisecondsSinceEpoch.toString() + '.png';
        final filePath = '${appDir.path}/$fileName';
        await File(filePath).writeAsBytes(imageBytes);
        return filePath;
      } catch (e) {
        log('Error al guardar la imagen: $e');
        return '';
      }
    }

    Future<ui.Image> loadImage(List<int> imgBytes) async {
      final Completer<ui.Image> completer = new Completer();
      ui.decodeImageFromList(Uint8List.fromList(imgBytes), (ui.Image img) {
        return completer.complete(img);
      });
      return completer.future;
    }

    Future<ImageProvider> loadImageprovider(List<int> imgBytes) async {
      return MemoryImage(Uint8List.fromList(imgBytes));
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
                          color: ConstansColors.bluedark,
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
                                    color: ConstansColors.bluedark,
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
                                                    color: ConstansColors.cyan,
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
                                                    color: ConstansColors.bluedark,
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
                                                    color: ConstansColors.bluedark,
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
                                                            ? ConstansTetx.inspeccion_sicronizada
                                                            : ConstansTetx.inspeccion_no_sincronizada, // Conditionally set text
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
                                  ConstansTetx.agregar_firma,
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
                              child: FutureBuilder<List<ListarPersonas>>(
                                future: SQLiteManager.instance.ListarPersonasDrop(),
                                builder: (context, snapshot){
                                  if(!snapshot.hasData){
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
                                  final dropDownListarPersonasRowList = snapshot.data!;
                                  return FlutterFlowDropDown<int>(
                                    controller: _model.dropDownValueController1 ??= FormFieldController<int>(null),
                                    options: dropDownListarPersonasRowList.map((e) => e.id).whereType<int>().toList(),
                                    optionLabels: dropDownListarPersonasRowList.map((e) => e.descripcion).whereType<String>().toList(),
                                    width: double.infinity,
                                    onChanged: (int? newValue) {
                                      setState(() {
                                        _model.dropDownValue1 = newValue;
                                      });
                                    },
                                    height: 50,
                                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                      fontFamily: 'Outfit',
                                      letterSpacing: 0,
                                    ),
                                    hintText: ConstansTetx.tipo_persona,
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context).secondaryText,
                                      size: 24,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                    elevation: 2,
                                    borderColor: FlutterFlowTheme.of(context).alternate,
                                    borderWidth: 2,
                                    borderRadius: 8,
                                    margin: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 4),
                                    hidesUnderline: true,
                                    isOverButton: true,
                                    isSearchable: false,
                                    isMultiSelect: false,
                                  );

                                }
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
                                hintText: ConstansTetx.tipo_documento,
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
                                child: Focus(
                                  onFocusChange: (hasfocus) async{
                                    bool hasInternet = await isConnected();
                                    if (hasInternet){
                                      print(ConstAlerts.conectado_internet);
                                      if(_model.dat1Controller1.text != "" && _model.dat1Controller1.text.length > 7){
                                        final user = await APIRENIEC.call(
                                            dni: _model.dat1Controller1.text
                                        );
                                        if(APIRENIEC.estado(user?.jsonBody) == 1){
                                          setState(() {
                                            readon = true;
                                            _model.dat1Controller2.text = APIRENIEC.nombres(user?.jsonBody)!;
                                            _model.dat1Controller3.text = APIRENIEC.apellidopaterno(user?.jsonBody)!;
                                            _model.dat1Controller4.text = APIRENIEC.apellidomaterno(user?.jsonBody)!;
                                          });
                                        }
                                        log(ConstAlerts.error_servicio);
                                      } else {
                                        log("Input Vacio");
                                      }
                                    } else {
                                      print(ConstAlerts.no_conectado_internet);
                                    }
                                  },
                                  child: TextFormField(
                                    controller: _model.dat1Controller1,
                                    focusNode: _model.dat1FocusNode1,
                                    autofocus: true,
                                    autofillHints: [AutofillHints.birthday],
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: ConstansTetx.numero_documento,
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
                                )
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
                                  readOnly: readon,
                                  autofocus: true,
                                  autofillHints: [AutofillHints.birthday],
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: ConstansTetx.nombres,
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
                                    fillColor: readon? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).primaryBtnText,
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
                                  readOnly: readon,
                                  autofocus: true,
                                  autofillHints: [AutofillHints.birthday],
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: ConstansTetx.primer_apellido,
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
                                    fillColor: readon? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).primaryBtnText,
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
                                  readOnly: readon,
                                  autofillHints: [AutofillHints.birthday],
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: ConstansTetx.segundo_apellido,
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
                                    fillColor: readon? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).primaryBtnText,
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
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    ConstansTetx.firma,
                                    style:
                                    FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.camera_alt,
                                      color: FlutterFlowTheme.of(context).secondaryText,
                                      size: 30,
                                    ),
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
                                              ConstAlerts.selec_tip_persona,
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
                                              ConstAlerts.selec_tip_document,
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
                                      final selectedMedia =
                                          await selectMediaWithSourceBottomSheet(
                                            context: context,
                                            allowPhoto: true,
                                      );
                                      if (selectedMedia != null &&
                                          selectedMedia.every((m) =>
                                              validateFileFormat(
                                                  m.storagePath,
                                                  context))) {
                                        setState(() =>
                                        _model.isDataUploading = true);
                                        try {
                                          var image = await loadImage(selectedMedia.first.bytes);
                                          var provider = await loadImageprovider(selectedMedia.first.bytes);
                                          Navigator.push(context, MaterialPageRoute(
                                            builder: (context) => DrawingPage(image: provider,tipopersona: _model.dropDownValue1!, tipodocumento: _model.dropDownValue2 == 'DNI' ? 1 : 2,
                                            apematerno:_model.dat1Controller4.text!,nombres: _model.dat1Controller2.text!,apepaterno: _model.dat1Controller3.text!,numdocumento: _model.dat1Controller1.text!),
                                          ));
                                        } finally {
                                          _model.isDataUploading = false;
                                        }
                                        var selectedUploadedFiles =
                                        <FFUploadedFile>[];

                                        try {
                                          selectedUploadedFiles =
                                              selectedMedia
                                                  .map(
                                                      (m) => FFUploadedFile(
                                                    name: m
                                                        .storagePath
                                                        .split('/')
                                                        .last,
                                                    bytes: m.bytes,
                                                    height: m
                                                        .dimensions
                                                        ?.height,
                                                    width: m
                                                        .dimensions
                                                        ?.width,
                                                    blurHash:
                                                    m.blurHash,
                                                  ))
                                                  .toList();
                                        } finally {
                                          _model.isDataUploading = false;
                                        }
                                        if (selectedUploadedFiles.length ==
                                            selectedMedia.length) {
                                          setState(() {
                                            _model.uploadedLocalFile =
                                                selectedUploadedFiles.first;
                                          });
                                        } else {
                                          setState(() {});
                                          return;
                                        }
                                        selectfoto = true;
                                      }
                                    },
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 230,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                border: Border.all(
                                  width: 1.0,
                                ),
                              ),
                              child:
                              ClipRect(
                                child: Signature(
                                  controller: _model.signatureController ??=
                                      SignatureController(
                                        penStrokeWidth: 2.0,
                                        penColor:FlutterFlowTheme.of(context)
                                            .primaryText,
                                        exportBackgroundColor: Color(0x00000000),
                                      ),
                                  backgroundColor:
                                  Colors.transparent,
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
                                  text: ConstansTetx.limpiar_firma,
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
                                    0.0, 10.0, 0.0, 10.0),
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
                                            ConstAlerts.selec_tip_persona,
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
                                            ConstAlerts.selec_tip_document,
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
                                    if (selectfoto == true){
                                      Uint8List? signatureBytes = await _model.signatureController?.toPngBytes();
                                      Uint8List combinedImage = await combineImageAndSignature(_model.uploadedLocalFile.bytes!, signatureBytes!, 5.5);
                                      savedImagePath = await saveImageToDevice(combinedImage!);
                                    } else {
                                      exportedImge = await _model.signatureController?.toPngBytes();
                                      savedImagePath = await saveImageToDevice(exportedImge!);
                                    }

                                    await SQLiteManager.instance.crearFichaFirma(
                                      idFicha: FFAppState().IdFicha,
                                      idTipoPersona: _model.dropDownValue1,
                                      idTipoDocumento: _model.dropDownValue2 == 'DNI' ? 1 : 2,
                                      numDocumento: _model.dat1Controller1.text,
                                      nombres: _model.dat1Controller2.text,
                                      apellidoPaterno: _model.dat1Controller3.text,
                                      apellidoMaterno: _model.dat1Controller4.text,
                                      estadoAuditoria: Sincronizacion.estado_adutoria_true,
                                      tipoArchivo: Sincronizacion.tipo_archivo_firma,
                                      rutalocal: savedImagePath,
                                      modificacionMovil: 1,
                                      uploadDocumento: 0,
                                      fechaCreacionAuditoria: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                                      equipoCreacionAuditoria: FFAppState().cummovil,
                                      programaCreacionAuditoria: FFAppState().programacreacion,
                                      usuarioCreacionAuditoria: FFAppState().username,
                                    );
                                    setState(() {
                                      SQLiteManager.instance.inspeccion1(
                                        idFicha: FFAppState().IdFicha,
                                        usuarioModificacionAuditoria: FFAppState().username,
                                        fechaModificacionAuditoria: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                                        equipoModificacionAuditoria: FFAppState().cummovil,
                                        programaModificacionAuditoria: FFAppState().programacreacion,
                                      );
                                    });
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          ConstAlerts.firma_success,
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
                                    //Navigator.of(context);
                                    //context.pushNamed('Firmas');
                                    selectfoto = false;
                                    Navigator.pop(context);
                                  },
                                  text: ConstansTetx.guardar_firma,
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
                                    Navigator.pop(context);
                                  },
                                  text: ConstansTetx.cancelar,
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding:
                                    EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: ConstansColors.red,
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
Future<bool> isConnected() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
    return true;
  } else {
    return false;
  }
}