import 'dart:io';

import 'package:path_provider/path_provider.dart';

import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'add_foto_model.dart';
export 'add_foto_model.dart';

class AddFotoWidget extends StatefulWidget {
  const AddFotoWidget({super.key});

  @override
  State<AddFotoWidget> createState() => _AddFotoWidgetState();
}

String? savedImagePath;

Future<String> saveImageToDevice(FFUploadedFile imageFile) async {
  try {
    // Obtener el directorio de almacenamiento local
    final appDir = await getApplicationDocumentsDirectory();
    // Generar un nombre de archivo único
    final fileName = DateTime.now().millisecondsSinceEpoch.toString() + '.png';
    // Construir la ruta del archivo
    final filePath = '${appDir.path}/$fileName';
    // Escribir los bytes de la imagen en el archivo
    await File(filePath).writeAsBytes(imageFile.bytes!);
    // Retorna la ruta del archivo guardado en el directorio de documentos
    return filePath;
  } catch (e) {
    // En caso de cualquier error, imprime el error y retorna una cadena vacía
    print('Error al guardar la imagen: $e');
    return '';
  }
}

class _AddFotoWidgetState extends State<AddFotoWidget> {
  late AddFotoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddFotoModel());

    _model.dat1Controller1 ??= TextEditingController();
    _model.dat1FocusNode1 ??= FocusNode();

    _model.dat1Controller2 ??= TextEditingController();
    _model.dat1FocusNode2 ??= FocusNode();
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
                Align(
                  alignment: AlignmentDirectional(-1.0, -1.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Form(
                      key: _model.formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 15.0),
                        child: SingleChildScrollView(
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
                                    'Agregar Foto',
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
                                child: Container(
                                  width: double.infinity,
                                  child: TextFormField(
                                    controller: _model.dat1Controller1,
                                    focusNode: _model.dat1FocusNode1,
                                    autofocus: true,
                                    autofillHints: [AutofillHints.birthday],
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Título de foto',
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
                                    autofillHints: [AutofillHints.name],
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Comentario',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                        fontFamily: 'Outfit',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                      ),
                                      alignLabelWithHint: true,
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
                                    textAlign: TextAlign.start,
                                    maxLines: 5,
                                    validator: _model.dat1Controller2Validator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 10.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
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
                                          }

                                          await actions.guardarFoto(
                                            _model.uploadedLocalFile,
                                          );
                                        },
                                        child: Icon(
                                          Icons.camera_alt_outlined,
                                          color: Color(0xFF086D82),
                                          size: 35.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Flexible(
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 12.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await Navigator.push(
                                          context,
                                          PageTransition(
                                            type: PageTransitionType.fade,
                                            child: FlutterFlowExpandedImageView(
                                              image: Image.memory(
                                                _model.uploadedLocalFile
                                                    .bytes ??
                                                    Uint8List.fromList([]),
                                                fit: BoxFit.contain,
                                              ),
                                              allowRotation: false,
                                              tag: 'imageTag',
                                              useHeroAnimation: true,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Hero(
                                        tag: 'imageTag',
                                        transitionOnUserGestures: true,
                                        child: ClipRRect(
                                          borderRadius:
                                          BorderRadius.circular(8.0),
                                          child: Image.memory(
                                            _model.uploadedLocalFile.bytes ??
                                                Uint8List.fromList([]),
                                            width: 294.0,
                                            height: 200.0,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 25.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      if (_model.formKey.currentState == null ||
                                          !_model.formKey.currentState!
                                              .validate()) {
                                        return;
                                      }
                                      if (_model.uploadedLocalFile == null ||
                                          (_model.uploadedLocalFile.bytes ?? [])
                                              .isEmpty) {
                                        return;
                                      }
                                      savedImagePath  = await saveImageToDevice(_model.uploadedLocalFile);
                                      await SQLiteManager.instance.crearFoto(
                                        titulo: _model.dat1Controller1.text,
                                        comentario: _model.dat1Controller2.text,
                                        imagen: savedImagePath,
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Foto Agregada!',
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

                                      context.pushNamed('GaleriaFotos');
                                    },
                                    text: 'Guardar foto',
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
                            ],
                          ),
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
