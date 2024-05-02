import 'dart:convert';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:crypto/crypto.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/services.dart';
import 'package:inspecciones_p_r_o_n_i_e_d/Utils/ConstAlerts.dart';
import 'package:inspecciones_p_r_o_n_i_e_d/Utils/Constans.dart';
import 'package:inspecciones_p_r_o_n_i_e_d/Utils/ConstansColors.dart';
import 'package:inspecciones_p_r_o_n_i_e_d/Utils/ConstansText.dart';
import 'package:inspecciones_p_r_o_n_i_e_d/backend/sqlite/sqlite_manager.dart';

import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'login_model.dart';
export 'login_model.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget>
    with TickerProviderStateMixin {
  late LoginModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: Offset(0, 140),
          end: Offset(0, 0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: Offset(0.9, 0.9),
          end: Offset(1, 1),
        ),
        TiltEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: Offset(-0.349, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginModel());

    _model.emailAddressController ??= TextEditingController();
    _model.emailAddressFocusNode ??= FocusNode();

    _model.passwordController ??= TextEditingController();
    _model.passwordFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () async {
          SystemNavigator.pop();
          return false;
        },
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          body: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 6,
                child: Container(
                  width: 100,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [ConstansColors.bluedark, ConstansColors.bluedark],
                      stops: [0, 1],
                      begin: AlignmentDirectional(0, -1),
                      end: AlignmentDirectional(0, 1),
                    ),
                  ),
                  alignment: AlignmentDirectional(0, -1),
                  child: Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 70, 0, 15),
                            child: Container(
                              width: 265,
                              height: 98,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              alignment: AlignmentDirectional(0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    ConstansTetx.pronied,
                                    style: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .override(
                                      fontFamily: 'Outfit',
                                      color: Colors.white,
                                      letterSpacing: 0,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 5, 0, 5),
                                    child: Text(
                                      ConstansTetx.title,
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                        fontFamily: 'Outfit',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBtnText,
                                        fontSize: 15,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0, -1),
                            child: Padding(
                              padding: EdgeInsets.all(16),
                              child: Container(
                                width: double.infinity,
                                constraints: BoxConstraints(
                                  minHeight: 530,
                                  maxWidth: 570,
                                ),
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4,
                                      color: Color(0x33000000),
                                      offset: Offset(
                                        0,
                                        2,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Form(
                                  key: _model.formKey,
                                  autovalidateMode: AutovalidateMode.disabled,
                                  child: Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: EdgeInsets.all(32),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                            BorderRadius.circular(8),
                                            child: Image.asset(
                                              Sincronizacion.url_title,
                                              width: MediaQuery.sizeOf(context)
                                                  .width,
                                              height: MediaQuery.sizeOf(context)
                                                  .height *
                                                  0.07,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0, 15, 0, 15),
                                            child: Text(
                                              ConstansTetx.sistema_inspecciones,
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .override(
                                                fontFamily: 'Outfit',
                                                fontSize: 20,
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.w800,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0, 0, 0, 16),
                                            child: Container(
                                              width: double.infinity,
                                              child: TextFormField(
                                                controller:
                                                _model.emailAddressController,
                                                focusNode:
                                                _model.emailAddressFocusNode,
                                                autofocus: true,
                                                autofillHints: [
                                                  AutofillHints.email
                                                ],
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText: ConstansTetx.usuario,
                                                  labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                    fontFamily: 'Outfit',
                                                    letterSpacing: 0,
                                                  ),
                                                  enabledBorder:
                                                  OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: FlutterFlowTheme.of(
                                                          context)
                                                          .primaryBackground,
                                                      width: 2,
                                                    ),
                                                    borderRadius:
                                                    BorderRadius.circular(12),
                                                  ),
                                                  focusedBorder:
                                                  OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: FlutterFlowTheme.of(
                                                          context)
                                                          .primary,
                                                      width: 2,
                                                    ),
                                                    borderRadius:
                                                    BorderRadius.circular(12),
                                                  ),
                                                  errorBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: FlutterFlowTheme.of(
                                                          context)
                                                          .alternate,
                                                      width: 2,
                                                    ),
                                                    borderRadius:
                                                    BorderRadius.circular(12),
                                                  ),
                                                  focusedErrorBorder:
                                                  OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: FlutterFlowTheme.of(
                                                          context)
                                                          .alternate,
                                                      width: 2,
                                                    ),
                                                    borderRadius:
                                                    BorderRadius.circular(12),
                                                  ),
                                                  filled: true,
                                                  fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                                ),
                                                style:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .override(
                                                  fontFamily: 'Outfit',
                                                  letterSpacing: 0,
                                                ),
                                                minLines: null,
                                                keyboardType:
                                                TextInputType.emailAddress,
                                                validator: _model
                                                    .emailAddressControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0, 0, 0, 16),
                                            child: Container(
                                              width: double.infinity,
                                              child: TextFormField(
                                                controller:
                                                _model.passwordController,
                                                focusNode:
                                                _model.passwordFocusNode,
                                                autofocus: true,
                                                autofillHints: [
                                                  AutofillHints.password
                                                ],
                                                obscureText:
                                                !_model.passwordVisibility,
                                                decoration: InputDecoration(
                                                  labelText: ConstansTetx.contrasena,
                                                  labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                    fontFamily: 'Outfit',
                                                    letterSpacing: 0,
                                                  ),
                                                  enabledBorder:
                                                  OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: FlutterFlowTheme.of(
                                                          context)
                                                          .primaryBackground,
                                                      width: 2,
                                                    ),
                                                    borderRadius:
                                                    BorderRadius.circular(12),
                                                  ),
                                                  focusedBorder:
                                                  OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: FlutterFlowTheme.of(
                                                          context)
                                                          .primary,
                                                      width: 2,
                                                    ),
                                                    borderRadius:
                                                    BorderRadius.circular(12),
                                                  ),
                                                  errorBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: FlutterFlowTheme.of(
                                                          context)
                                                          .error,
                                                      width: 2,
                                                    ),
                                                    borderRadius:
                                                    BorderRadius.circular(12),
                                                  ),
                                                  focusedErrorBorder:
                                                  OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: FlutterFlowTheme.of(
                                                          context)
                                                          .error,
                                                      width: 2,
                                                    ),
                                                    borderRadius:
                                                    BorderRadius.circular(12),
                                                  ),
                                                  filled: true,
                                                  fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                                  suffixIcon: InkWell(
                                                    onTap: () => setState(
                                                          () => _model
                                                          .passwordVisibility =
                                                      !_model
                                                          .passwordVisibility,
                                                    ),
                                                    focusNode: FocusNode(
                                                        skipTraversal: true),
                                                    child: Icon(
                                                      _model.passwordVisibility
                                                          ? Icons
                                                          .visibility_outlined
                                                          : Icons
                                                          .visibility_off_outlined,
                                                      color: FlutterFlowTheme.of(
                                                          context)
                                                          .secondaryText,
                                                      size: 24,
                                                    ),
                                                  ),
                                                ),
                                                style:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .override(
                                                  fontFamily: 'Outfit',
                                                  letterSpacing: 0,
                                                ),
                                                minLines: null,
                                                validator: _model
                                                    .passwordControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0, 0, 0, 16),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                bool hasInternet = await isConnected();
                                                if (hasInternet) {
                                                  log("Estás conectado a Internet.");
                                                  var _shouldSetState = false;
                                                  _model.obtenerTok =
                                                  await APIObtenerTOKENCall
                                                      .call(
                                                    usuario: _model
                                                        .emailAddressController
                                                        .text,
                                                    clave: _model
                                                        .passwordController.text,
                                                    appId: Sincronizacion.sismon,
                                                  );
                                                  _shouldSetState = true;
                                                  if ((APIObtenerTOKENCall.response(
                                                    (_model.obtenerTok
                                                        ?.jsonBody ??
                                                        ''),
                                                  ) ==
                                                      'OK') &&
                                                      ((_model.obtenerTok
                                                          ?.succeeded ??
                                                          true) ==
                                                          true)) {
                                                    _model.apiResultjyh =
                                                    await ApiTokenFinalCall
                                                        .call(
                                                      applicationId: Sincronizacion.sismon,
                                                      tokenSesion:
                                                      APIObtenerTOKENCall.code(
                                                        (_model.obtenerTok
                                                            ?.jsonBody ??
                                                            ''),
                                                      ),
                                                    );
                                                    _shouldSetState = true;
                                                    if (ApiTokenFinalCall.mensaje(
                                                      (_model.apiResultjyh
                                                          ?.jsonBody ??
                                                          ''),
                                                    ) ==
                                                        'OK') {
                                                      _model.apiResult2ws =
                                                      await ApiAutorizacionCall
                                                          .call(
                                                        applicationId: Sincronizacion.sismon,
                                                        tokenSesion:
                                                        APIObtenerTOKENCall.code(
                                                          (_model.obtenerTok
                                                              ?.jsonBody ??
                                                              ''),
                                                        ),
                                                      );
                                                      _shouldSetState = true;
                                                      if (ApiAutorizacionCall
                                                          .mensaje(
                                                        (_model.apiResult2ws
                                                            ?.jsonBody ??
                                                            ''),
                                                      ) ==
                                                          'OK') {
                                                        ScaffoldMessenger.of(
                                                            context)
                                                            .clearSnackBars();
                                                        ScaffoldMessenger.of(
                                                            context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              ConstAlerts.loginsuccess,
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme
                                                                    .of(context)
                                                                    .secondaryBackground,
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds: 2000),
                                                            backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                context)
                                                                .primaryText,
                                                          ),
                                                        );

                                                        ///TODO
                                                        FFAppState().rol = ApiAutorizacionCall.roles(
                                                          (_model.apiResult2ws
                                                              ?.jsonBody ??
                                                              ''),
                                                        )!;

                                                        FFAppState().tokenFinal = ApiTokenFinalCall.jwtoketn(_model.apiResultjyh
                                                            ?.jsonBody ??
                                                            '')!;
                                                        FFAppState().nombrecompletouser = ApiAutorizacionCall.nombre(
                                                          (_model.apiResult2ws
                                                              ?.jsonBody ??
                                                              ''),
                                                        )! + ' ' + ApiAutorizacionCall.apepaterno(
                                                          (_model.apiResult2ws
                                                              ?.jsonBody ??
                                                              ''),
                                                        )! + ' ' + ApiAutorizacionCall.apematerno(
                                                          (_model.apiResult2ws
                                                              ?.jsonBody ??
                                                              ''),
                                                        )!;

                                                        var area = ApiAutorizacionCall.nombrearea(
                                                            _model.apiResult2ws?.jsonBody ?? 'No tiene área asignada'
                                                        );
                                                        if (area != null) {
                                                          FFAppState().ubicacionuse = area;
                                                        } else {
                                                          // Maneja el caso cuando 'area' es null, por ejemplo:
                                                          FFAppState().ubicacionuse = 'No tiene área asignada';
                                                        }

                                                        DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
                                                        AndroidDeviceInfo androidInfo;
                                                        androidInfo = await deviceInfo.androidInfo;
                                                        FFAppState().cummovil = androidInfo.androidId;
                                                        // Actualiza el estado de tu aplicación aquí utilizando el valor del controlador
                                                        FFAppState().username = ApiAutorizacionCall.numerodocidad(
                                                          (_model.apiResult2ws
                                                              ?.jsonBody ??
                                                              ''),
                                                        )!;
                                                        FFAppState().programacreacion= Sincronizacion.inspeccionmovil;

                                                        ///TODO INSERT O UPDATE TABLA USER
                                                        final password = _model.passwordController.text;
                                                        var bytes = utf8.encode(password); // data being hashed
                                                        var digest = sha256.convert(bytes).toString();

                                                        final userbd = await SQLiteManager.instance.VerificarSiExisteUser(
                                                            usuario: _model.emailAddressController.text
                                                        );
                                                        if(userbd.length >= 1){
                                                          SQLiteManager.instance.actualizarUser(
                                                              usuario: _model.emailAddressController.text,
                                                              contra: digest,
                                                              username: FFAppState().username,
                                                              nombrecompleto: FFAppState().nombrecompletouser,
                                                              rol: FFAppState().rol,
                                                              ubicacion: FFAppState().ubicacionuse
                                                          );
                                                        } else {
                                                          SQLiteManager.instance.createUser(
                                                              usuario: _model.emailAddressController.text,
                                                              contra: digest,
                                                              username: FFAppState().username,
                                                              nombrecompleto: FFAppState().nombrecompletouser,
                                                              rol: FFAppState().rol,
                                                              ubicacion: FFAppState().ubicacionuse
                                                          );
                                                        }

                                                        context.pushNamed(
                                                          'ListaInspecciones',
                                                          extra: <String, dynamic>{
                                                            kTransitionInfoKey:
                                                            TransitionInfo(
                                                              hasTransition: true,
                                                              transitionType:
                                                              PageTransitionType
                                                                  .rightToLeft,
                                                            ),
                                                          },
                                                        );

                                                        if (_shouldSetState)
                                                          setState(() {});
                                                        return;
                                                      } else {
                                                        ScaffoldMessenger.of(
                                                            context)
                                                            .clearSnackBars();
                                                        ScaffoldMessenger.of(
                                                            context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                ApiAutorizacionCall
                                                                    .mensaje(
                                                                  (_model.apiResult2ws
                                                                      ?.jsonBody ??
                                                                      ''),
                                                                ),
                                                                'Error',
                                                              ),
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme
                                                                    .of(context)
                                                                    .secondaryBackground,
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds: 2000),
                                                            backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                context)
                                                                .primaryText,
                                                          ),
                                                        );
                                                        if (_shouldSetState)
                                                          setState(() {});
                                                        return;
                                                      }
                                                    } else {
                                                      ScaffoldMessenger.of(context)
                                                          .clearSnackBars();
                                                      ScaffoldMessenger.of(context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            valueOrDefault<String>(
                                                              ApiTokenFinalCall
                                                                  .mensaje(
                                                                (_model.apiResultjyh
                                                                    ?.jsonBody ??
                                                                    ''),
                                                              ),
                                                              'Error',
                                                            ),
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                  .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds: 2000),
                                                          backgroundColor:
                                                          FlutterFlowTheme.of(
                                                              context)
                                                              .primaryText,
                                                        ),
                                                      );
                                                      if (_shouldSetState)
                                                        setState(() {});
                                                      return;
                                                    }
                                                  } else {
                                                    ScaffoldMessenger.of(context)
                                                        .clearSnackBars();
                                                    ScaffoldMessenger.of(context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          APIObtenerTOKENCall
                                                              .response(
                                                            (_model.obtenerTok
                                                                ?.jsonBody ??
                                                                ''),
                                                          )!,
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 2000),
                                                        backgroundColor:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .primaryText,
                                                      ),
                                                    );
                                                    if (_shouldSetState)
                                                      setState(() {});
                                                    return;
                                                  }
                                                } else {
                                                  log("No hay conexión a Internet.");
                                                  final userlg = await SQLiteManager.instance.VerificarSiExisteUser(
                                                      usuario: _model.emailAddressController.text
                                                  );
                                                  if(userlg.isEmpty){
                                                    ScaffoldMessenger.of(
                                                        context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          ConstAlerts.usernot,
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 2000),
                                                        backgroundColor:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .primaryText,
                                                      ),
                                                    );
                                                  } else {
                                                    final passwordoff = _model.passwordController.text;
                                                    var bytesoff = utf8.encode(passwordoff); // data being hashed
                                                    var digestoff = sha256.convert(bytesoff).toString();

                                                    if(userlg.first.usuario == _model.emailAddressController.text && userlg.first.contrase == digestoff){
                                                      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();        AndroidDeviceInfo androidInfo;
                                                      androidInfo = await deviceInfo.androidInfo;
                                                      FFAppState().cummovil = androidInfo.androidId;
                                                      FFAppState().programacreacion= Sincronizacion.inspeccionmovil;
                                                      FFAppState().username = userlg.first.username!;
                                                      FFAppState().ubicacionuse = userlg.first.ubicacion!;
                                                      FFAppState().nombrecompletouser = userlg.first.nomcomple!;
                                                      FFAppState().rol = userlg.first.rol!;
                                                      context.pushNamed(
                                                        'ListaInspecciones',
                                                        extra: <String, dynamic>{
                                                          kTransitionInfoKey:
                                                          TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                            PageTransitionType
                                                                .rightToLeft,
                                                          ),
                                                        },
                                                      );
                                                      ScaffoldMessenger.of(
                                                          context)
                                                          .clearSnackBars();
                                                      ScaffoldMessenger.of(
                                                          context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            ConstAlerts.loginsuccess,
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                  .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds: 2000),
                                                          backgroundColor:
                                                          FlutterFlowTheme.of(
                                                              context)
                                                              .primaryText,
                                                        ),


                                                      );
                                                    }
                                                    else {
                                                      ScaffoldMessenger.of(
                                                          context)
                                                          .clearSnackBars();
                                                      ScaffoldMessenger.of(
                                                          context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            ConstAlerts.userincorrect,
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                  .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds: 2000),
                                                          backgroundColor:
                                                          FlutterFlowTheme.of(
                                                              context)
                                                              .primaryText,
                                                        ),
                                                      );
                                                    }
                                                  }
                                                }

                                              },
                                              text: ConstansTetx.iniciar_sesion,
                                              options: FFButtonOptions(
                                                width: double.infinity,
                                                height: 44,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 0),
                                                iconPadding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 0),
                                                color: ConstansColors.cyan,
                                                textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                  fontFamily: 'Outfit',
                                                  color: Colors.white,
                                                  letterSpacing: 0,
                                                ),
                                                elevation: 3,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(12),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ).animateOnPageLoad(
                                  animationsMap['containerOnPageLoadAnimation']!),
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

