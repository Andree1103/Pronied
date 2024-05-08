import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:inspecciones_p_r_o_n_i_e_d/Utils/ConstansAlerts.dart';
import 'package:inspecciones_p_r_o_n_i_e_d/Utils/Constans.dart';
import 'package:inspecciones_p_r_o_n_i_e_d/Utils/ConstansText.dart';
import 'package:path_provider/path_provider.dart';

import '/backend/api_requests/api_calls.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sincronizar_model.dart';
export 'sincronizar_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:device_info/device_info.dart';
import 'package:path/path.dart' as path;
import 'package:http/http.dart' as http;

class SincronizarWidget extends StatefulWidget {
  const SincronizarWidget({super.key});

  @override
  State<SincronizarWidget> createState() => _SincronizarWidgetState();
}

class _SincronizarWidgetState extends State<SincronizarWidget> {
  late SincronizarModel _model;


  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SincronizarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x33000000),
            offset: Offset(0.0, 2.0),
          )
        ],
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 15.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                child: Text(
                  ConstansTetx.sincronizar_pregunta,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Outfit',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
              child: FFButtonWidget(
                onPressed: () async {
                  bool hasInternet = await isConnected();
                  if (hasInternet){
                    List<Map<String, dynamic>> fichasModularesObj = [];
                    List<Map<String, dynamic>> fichasObj = [];
                    List<Map<String, dynamic>> fichasFichasObj = [];
                    List<Map<String, dynamic>> fichasArchivosObj = [];
                    List<Map<String, dynamic>> inspeccionesObj = [];
                    List<Map<String, dynamic>> sincroColaObj = [];
                    List<Map<String, dynamic>> respuestasColaObj = [];
                    List<Map<String, dynamic>> fichacomentarioObj = [];
                    List<Map<String, dynamic>> fichaarchivosObj = [];
                    Map<String, dynamic> sincronz = {};

                    Position position = await Geolocator.getCurrentPosition(
                        desiredAccuracy: LocationAccuracy.high);

                    var fichasinupload = await SQLiteManager.instance.listarFichasFirmas1();
                    if(fichasinupload != null) {
                      for(var ficha in fichasinupload){
                        File file = File(ficha.rutalocal!);
                        if (await file.exists()) {
                          try {
                            List<int> bytes = await file.readAsBytes();
                            String fileName = path.basename(file.path);
                            Uint8List uint8List = Uint8List.fromList(bytes);
                            FFUploadedFile uploadedFile = FFUploadedFile(bytes: uint8List,name: fileName);
                            var response = await UploaddocCall.call(
                              archivos: uploadedFile,
                              codigoapp: Sincronizacion.codigo_app,
                              tag: Sincronizacion.codigo_tag,
                            );
                            // Verificar el código de estado de la respuesta para determinar si la llamada fue exitosa
                            if (response.statusCode == 200) {
                              await SQLiteManager.instance.actualizarFichaFirmaUpload(
                                idFicha: ficha.idFicha,
                                rutalocal: ficha.rutalocal,
                                ruta: UploaddocCall.url(response?.jsonBody),
                                extension: UploaddocCall.extension(response?.jsonBody),
                                nombreArchivo: UploaddocCall.nombrearchivo(response?.jsonBody),
                                peso: double.parse(UploaddocCall.tamano(response?.jsonBody)!),
                                uploadDocumento: 1,
                              );
                            } else {
                              log('La llamada ficha firmas falló con el código de estado: ${response.statusCode}');
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    ConstAlerts.error_carga_archivo,
                                    style: TextStyle(
                                      color:
                                      FlutterFlowTheme.of(context).secondaryBackground,
                                    ),
                                  ),
                                  duration: const Duration(milliseconds: 4000),
                                  backgroundColor: FlutterFlowTheme.of(context).primary,
                                ),
                              );
                              return null;
                            }
                          } catch (e) {
                            // Manejar excepciones si la llamada falla
                            log('Se produjo un error al realizar la llamada: $e');
                          }
                        } else {
                          log('El archivo no existe en la ruta especificada.');
                        }
                      }
                    }

                    var archivossinupload = await SQLiteManager.instance.listarFichasArchivos1();
                    if(archivossinupload != null){
                      for(var arc in archivossinupload){
                        File file = File(arc.rutalocal!);
                        if (await file.exists()) {
                          try {
                            List<int> bytes = await file.readAsBytes();
                            String fileName = path.basename(file.path);
                            Uint8List uint8List = Uint8List.fromList(bytes);
                            FFUploadedFile uploadedFile = FFUploadedFile(bytes: uint8List,name: fileName);
                            var response = await UploaddocCall.call(
                              archivos: uploadedFile,
                              codigoapp: Sincronizacion.codigo_app,
                              tag: Sincronizacion.codigo_tag,
                            );
                            // Verificar el código de estado de la respuesta para determinar si la llamada fue exitosa
                            if (response.statusCode == 200) {
                              await SQLiteManager.instance.actualizarFichaArchivosUpload(
                                idFicha: arc.idFicha,
                                rutalocal: arc.rutalocal,
                                ruta: UploaddocCall.url(response?.jsonBody),
                                extension: UploaddocCall.extension(response?.jsonBody),
                                nombreArchivo: UploaddocCall.nombrearchivo(response?.jsonBody),
                                peso: double.parse(UploaddocCall.tamano(response?.jsonBody)!),
                                uploadDocumento: 1,
                              );
                            } else {
                              print('La llamada falló con el código de estado: ${response.statusCode}');
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    ConstAlerts.error_carga_archivo,
                                    style: TextStyle(
                                      color:
                                      FlutterFlowTheme.of(context).secondaryBackground,
                                    ),
                                  ),
                                  duration: const Duration(milliseconds: 4000),
                                  backgroundColor: FlutterFlowTheme.of(context).primary,
                                ),
                              );
                              return null;
                            }
                          } catch (e) {
                            // Manejar excepciones si la llamada falla
                            log('Se produjo un error al realizar la llamada: $e');
                          }
                        } else {
                          log('El archivo no existe en la ruta especificada.');
                        }
                      }
                    }

                    var preguntarchsinupload = await SQLiteManager.instance.listarFichasPreguntaArchivos1();
                    if(preguntarchsinupload != null){
                      for(var pre in preguntarchsinupload){
                        File file = File(pre.rutalocal!);
                        if (await file.exists()) {
                          try {
                            List<int> bytes = await file.readAsBytes();
                            String fileName = path.basename(file.path);
                            Uint8List uint8List = Uint8List.fromList(bytes);
                            FFUploadedFile uploadedFile = FFUploadedFile(bytes: uint8List,name: fileName);
                            var response = await UploaddocCall.call(
                              archivos: uploadedFile,
                              codigoapp: Sincronizacion.codigo_app,
                              tag: Sincronizacion.codigo_tag,
                            );
                            // Verificar el código de estado de la respuesta para determinar si la llamada fue exitosa
                            if (response.statusCode == 200) {
                              await SQLiteManager.instance.actualizarFichaPreguntaArchivosUpload(
                                idFicha: pre.idFicha,
                                rutalocal: pre.rutalocal,
                                ruta: UploaddocCall.url(response?.jsonBody),
                                extension: UploaddocCall.extension(response?.jsonBody),
                                nombreArchivo: UploaddocCall.nombrearchivo(response?.jsonBody),
                                peso: double.parse(UploaddocCall.tamano(response?.jsonBody)!),
                                uploadDocumento: 1,
                              );
                            } else {
                              log('La llamada falló con el código de estado: ${response.statusCode}');
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    ConstAlerts.error_carga_archivo,
                                    style: TextStyle(
                                      color:
                                      FlutterFlowTheme.of(context).secondaryBackground,
                                    ),
                                  ),
                                  duration: const Duration(milliseconds: 4000),
                                  backgroundColor: FlutterFlowTheme.of(context).primary,
                                ),
                              );
                              return null;
                            }
                          } catch (e) {
                            // Manejar excepciones si la llamada falla
                            log('Se produjo un error al realizar la llamada: $e');
                          }
                        } else {
                          log('El archivo no existe en la ruta especificada.');
                        }
                      }
                    }

                    await SQLiteManager.instance.cargarSincronizacion(
                        Fecha: DateTime.now().toString(),
                        Estado: 1,
                        IP: InternetAddressType.IPv4.toString(),
                        Latitud: position.latitude.toString(),
                        Longitud: position.longitude.toString(),
                        Usuario: FFAppState().username,
                        //Usuario: "45006478",
                        Cum: FFAppState().cummovil
                    );

                    int? idsincro = 0;
                    var ultimoRegistroSincronizacion = await SQLiteManager.instance.listarSincronizacionUltimo();
                    if (ultimoRegistroSincronizacion != null && ultimoRegistroSincronizacion.isNotEmpty) {
                      idsincro = ultimoRegistroSincronizacion[0].idSincro;
                      print(idsincro);
                      // Realiza otras operaciones con idsincro si es necesario
                    } else {
                      idsincro = 0;
                    }
                    String? fechaMod = '';
                    var valorfechaMod= await SQLiteManager.instance.UltimaFecha(
                        idSincro: idsincro
                    );
                    if (valorfechaMod.length >0){
                      fechaMod = valorfechaMod[0].fecha;
                    } else {
                      fechaMod = '';
                    }
                    for (var sincroniza in ultimoRegistroSincronizacion){
                      sincronz = {
                        "idSincroMovil": sincroniza.idSincro,
                        "idSincroServer": null,
                        "ip": sincroniza.ip,
                        "latitud": sincroniza.latitud,
                        "longitud": sincroniza.longitud,
                        "cum": sincroniza.cum,
                        "usuario": sincroniza.usuario,
                        "fechaSincronizacionAnterior":fechaMod
                      };
                    }

                    var fichaArchivos = await SQLiteManager.instance.listarFichasArchivosModificas(
                        dniInspector: FFAppState().username
                    );
                    if(fichaArchivos != null){
                      for (var archi in fichaArchivos){
                        SQLiteManager.instance.cargarColaSincronizacion(
                          TipoDato: "fichaarchivo",
                          Estado: 1,
                          IdDatoLocal: archi.idFichaArchivoMovil,
                          IdDatoServer: archi.idFichaArchivoMovil,
                          IdSincro:idsincro,
                          UsuarioCreacionAuditoria: FFAppState().username,
                          FechaCreacionAuditoria: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                          EquipoCreacionAuditoria: FFAppState().cummovil,
                          ProgramaCreacionAuditoria: FFAppState().programacreacion,
                        );
                        Map<String, dynamic> archivosjson = {
                          "idFichaArchivo": archi.idFichaArchivo,
                          "idFichaArchivoMovil": archi.idFichaArchivoMovil,
                          "idFicha": archi.idFicha,
                          "nombre": archi.nombre,
                          "extension": archi.extension,
                          "ruta": archi.ruta,
                          "peso": archi.peso.toString(),
                          "titulo": archi.titulo,
                          "comentario": archi.comentario,
                          "estadoAuditoria": archi.estadoAuditoria,
                          "usuarioCreacionAuditoria": archi.usuarioCreacionAuditoria == "null" ? null : archi.usuarioCreacionAuditoria,
                          "usuarioModificacionAuditoria": archi.usuarioModificacionAuditoria == "null" ? null : archi.usuarioModificacionAuditoria,
                          "fechaCreacionAuditoria": archi.fechaCreacionAuditoria == "null" ? null : archi.fechaCreacionAuditoria,
                          "fechaModificacionAuditoria": archi.fechaModificacionAuditoria == "null" ? null : archi.fechaModificacionAuditoria,
                          "equipoCreacionAuditoria": archi.equipoCreacionAuditoria == "null" ? null : archi.equipoCreacionAuditoria,
                          "equipoModificacionAuditoria": archi.equipoModificacionAuditoria == "null" ? null : archi.equipoModificacionAuditoria,
                          "programaCreacionAuditoria": archi.programaCreacionAuditoria == "null" ? null : archi.programaCreacionAuditoria,
                          "programaModificacionAuditoria": archi.programaModificacionAuditoria == "null" ? null : archi.programaModificacionAuditoria
                        };
                        fichasArchivosObj.add(archivosjson);
                      }
                    }
                    var fichaFirmas = await SQLiteManager.instance.listarFichasFirmaModificas(
                        dniInspector: FFAppState().username
                    );
                    if( fichaFirmas != null) {
                      for (var ficha in fichaFirmas) {
                        SQLiteManager.instance.cargarColaSincronizacion(
                          TipoDato: "fichafirma",
                          Estado: 1,
                          IdDatoLocal: ficha.idFichaFirmaMovil,
                          IdDatoServer: ficha.idFichaFirma,
                          IdSincro:idsincro,
                          UsuarioCreacionAuditoria: FFAppState().username,
                          FechaCreacionAuditoria: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                          EquipoCreacionAuditoria: FFAppState().cummovil,
                          ProgramaCreacionAuditoria: FFAppState().programacreacion,
                        );
                        Map<String, dynamic> fichafirmajson = {
                          "idFichaFirma": ficha.idFichaFirma,
                          "idFichaFirmaMovil": ficha.idFichaFirmaMovil,
                          "idFicha": ficha.idFicha,
                          "nombres": ficha.nombres,
                          "apellidoPaterno": ficha.apellidoPaterno,
                          "apellidoMaterno": ficha.apellidoMaterno,
                          "nombreArchivo": ficha.nombreArchivo,
                          "extension": ficha.extension,
                          "ruta": ficha.ruta,
                          "peso": ficha.peso,
                          "tipoArchivo": ficha.tipoArchivo,
                          "numDocumento": ficha.numDocumento,
                          "idTipoDocumento": ficha.idTipoDocumento,
                          "idTipoPersona": ficha.idTipoPersona,
                          "estadoAuditoria": ficha.estadoAuditoria,
                          "usuarioCreacionAuditoria": ficha.usuarioCreacionAuditoria == "null" ? null : ficha.usuarioCreacionAuditoria,
                          "usuarioModificacionAuditoria": ficha.usuarioModificacionAuditoria == "null" ? null : ficha.usuarioModificacionAuditoria,
                          "fechaCreacionAuditoria": ficha.fechaCreacionAuditoria == "null" ? null : ficha.fechaCreacionAuditoria,
                          "fechaModificacionAuditoria": ficha.fechaModificacionAuditoria == "null" ? null : ficha.fechaModificacionAuditoria,
                          "equipoCreacionAuditoria": ficha.equipoCreacionAuditoria == "null" ? null : ficha.equipoCreacionAuditoria,
                          "equipoModificacionAuditoria": ficha.equipoModificacionAuditoria == "null" ? null : ficha.equipoModificacionAuditoria,
                          "programaCreacionAuditoria": ficha.programaCreacionAuditoria == "null" ? null : ficha.programaCreacionAuditoria,
                          "programaModificacionAuditoria": ficha.programaModificacionAuditoria == "null" ? null : ficha.programaModificacionAuditoria
                        };
                        fichasFichasObj.add(fichafirmajson);
                      }
                    }

                    var fichasmodificar = await SQLiteManager.instance.listarFichasModificas(
                        dniInspector: FFAppState().username
                    );
                    if (fichasmodificar != null) {
                      for (var ficha in fichasmodificar) {
                        SQLiteManager.instance.cargarColaSincronizacion(
                          TipoDato: "ficha",
                          Estado: 1,
                          IdDatoLocal: ficha.idFichaLocal,
                          IdDatoServer: ficha.idFicha,
                          IdSincro:idsincro,
                          UsuarioCreacionAuditoria: FFAppState().username,
                          FechaCreacionAuditoria: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                          EquipoCreacionAuditoria: FFAppState().cummovil,
                          ProgramaCreacionAuditoria: FFAppState().programacreacion,
                        );
                        Map<String, dynamic> fichajson = {
                          "idFicha": ficha.idFicha,
                          "idPlantilla": ficha.idPlantilla,
                          "codigoLocalColegio": ficha.codigoLocalColegio == "null" ? null : ficha.codigoLocalColegio,
                          "nombreLocalColegio": ficha.nombreLocalColegio == "null" ? null : ficha.nombreLocalColegio,
                          "departamentoColegio": ficha.departamentoColegio == "null" ? null : ficha.departamentoColegio,
                          "provinciaColegio": ficha.provinciaColegio == "null" ? null : ficha.provinciaColegio,
                          "distritoColegio": ficha.distritoColegio == "null" ? null : ficha.distritoColegio,
                          "centroPobladoColegio": ficha.centroPobladoColegio == "null" ? null : ficha.centroPobladoColegio,
                          "direccionColegio": ficha.direccionColegio == "null" ? null : ficha.direccionColegio,
                          "zonaColegio": ficha.zonaColegio == "null" ? null : ficha.zonaColegio,
                          "latitud": ficha.latitud,
                          "longitud": ficha.longitud,
                          "totalPabellon":ficha.totalPabellon,
                          "totalAulas": ficha.totalAulas,
                          "totalSSHH": ficha.totalSSHH,
                          "idEstado": 3, //*
                          "estado": ficha.estadoAuditoria, //*
                          "dniInspector": ficha.dniInspector == "null" ? null : ficha.dniInspector,
                          "nombreInspector": ficha.nombreInspector == "null" ? null : ficha.nombreInspector,
                          "correoInspector": ficha.correoInspector == "null" ? null : ficha.correoInspector,
                          "telefonoInspector": ficha.telefonoInspector == "null" ? null : ficha.telefonoInspector,
                          "fechaInspeccion": ficha.fechaInspeccion == "null" ? null : ficha.fechaInspeccion,
                          "horaInspeccion": ficha.horaInspeccion == "null" ? null : ficha.horaInspeccion,
                          "tipoInspeccion": ficha.tipoInspeccion == "null" ? null : ficha.tipoInspeccion,
                          "dniDirector": ficha.dniDirector == "null" ? null : ficha.dniDirector,
                          "nombreDirector": ficha.nombreDirector == "null" ? null : ficha.nombreDirector,
                          "primerApellidoDirector": "",
                          "segundoApellidoDirector": "",
                          "correoDirector": ficha.correoDirector == "null" ? null : ficha.correoDirector,
                          "telefonoDirector": ficha.telefonoDirector == "null" ? null : ficha.telefonoDirector,
                          "dniAlterno": ficha.dniAlterno == "null" ? null : ficha.dniAlterno,
                          "nombreAlterno": ficha.nombreAlterno == "null" ? null : ficha.nombreAlterno,
                          "primerApellidoAlterno": "*", //*
                          "segundoApellidoAlterno": "*", //*
                          "correoAlterno": ficha.correoAlterno == "null" ? null : ficha.correoAlterno,
                          "telefonoAlterno": ficha.telefonoAlterno == "null" ? null : ficha.telefonoAlterno,
                          "estadoAuditoria": ficha.estadoAuditoria == "null" ? null : ficha.estadoAuditoria,
                          "usuarioCreacionAuditoria": ficha.usuarioCreacionAuditoria == "null" ? null : ficha.usuarioCreacionAuditoria,
                          "usuarioModificacionAuditoria": ficha.usuarioModificacionAuditoria == "null" ? null : ficha.usuarioModificacionAuditoria,
                          "fechaCreacionAuditoria": ficha.fechaCreacionAuditoria == "null" ? null : ficha.fechaCreacionAuditoria,
                          "fechaModificacionAuditoria": ficha.fechaModificacionAuditoria == "null" ? null : ficha.fechaModificacionAuditoria,
                          "equipoCreacionAuditoria": ficha.equipoCreacionAuditoria == "null" ? null : ficha.equipoCreacionAuditoria,
                          "equipoModificacionAuditoria": ficha.equipoModificacionAuditoria == "null" ? null : ficha.equipoModificacionAuditoria,
                          "programaCreacionAuditoria": ficha.programaCreacionAuditoria == "null" ? null : ficha.programaCreacionAuditoria,
                          "programaModificacionAuditoria": ficha.programaModificacionAuditoria == "null" ? null : ficha.programaModificacionAuditoria
                        };
                        fichasObj.add(fichajson);
                      }
                    }

                    var comentarios = await SQLiteManager.instance.listarComentariosModificas(
                        dniInspector: FFAppState().username
                    );
                    if (comentarios != null){
                      for (var coment in comentarios){
                        SQLiteManager.instance.cargarColaSincronizacion(
                          TipoDato: "fichapreguntacomentario",
                          Estado: 1,
                          IdDatoLocal: coment.idFichaPreguntaComentarioLocal,
                          IdDatoServer: coment.idFichaPreguntaComentario,
                          IdSincro:idsincro,
                          UsuarioCreacionAuditoria: FFAppState().username,
                          FechaCreacionAuditoria: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                          EquipoCreacionAuditoria: FFAppState().cummovil,
                          ProgramaCreacionAuditoria: FFAppState().programacreacion,
                        );
                        Map<String, dynamic> comentariojson ={
                          "idFichaPreguntaComentario": coment.idFichaPreguntaComentario,
                          "idFichaPreguntaComentarioMovil": coment.idFichaPreguntaComentarioLocal,
                          "idFicha": coment.idFicha,
                          "idPregunta": coment.idPregunta,
                          "idPlantillaSeccion": coment.idPlantillaSeccion,
                          "observacion": coment.observacion,
                          "numeroRepeticion": coment.numeroRepeticion,
                          "estadoAuditoria": coment.estadoAuditoria,
                          "usuarioCreacionAuditoria": coment.usuarioCreacionAuditoria == "null" ? null : coment.usuarioCreacionAuditoria,
                          "usuarioModificacionAuditoria": coment.usuarioModificacionAuditoria == "null" ? null : coment.usuarioModificacionAuditoria,
                          "fechaCreacionAuditoria": coment.fechaCreacionAuditoria == "null" ? null : coment.fechaCreacionAuditoria,
                          "fechaModificacionAuditoria": coment.fechaModificacionAuditoria == "null" ? null : coment.fechaModificacionAuditoria,
                          "equipoCreacionAuditoria": coment.equipoCreacionAuditoria == "null" ? null : coment.equipoCreacionAuditoria,
                          "equipoModificacionAuditoria": coment.equipoModificacionAuditoria == "null" ? null : coment.equipoModificacionAuditoria,
                          "programaCreacionAuditoria": coment.programaCreacionAuditoria == "null" ? null : coment.programaCreacionAuditoria,
                          "programaModificacionAuditoria": coment.programaModificacionAuditoria == "null" ? null : coment.programaModificacionAuditoria
                        };
                        fichacomentarioObj.add(comentariojson);
                      }
                    }

                    var fichaPreguntaArchivos = await SQLiteManager.instance.listarFichaArchivModificas(
                        dniInspector: FFAppState().username
                    );
                    if (fichaPreguntaArchivos != null){
                      for (var archivo in fichaPreguntaArchivos){
                        SQLiteManager.instance.cargarColaSincronizacion(
                          TipoDato: "fichapreguntaarchivo",
                          Estado: 1,
                          IdDatoLocal: archivo.idFichaPreguntaArchivoLocal,
                          IdDatoServer: archivo.idFichaPreguntaArchivo,
                          IdSincro:idsincro,
                          UsuarioCreacionAuditoria: FFAppState().username,
                          FechaCreacionAuditoria: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                          EquipoCreacionAuditoria: FFAppState().cummovil,
                          ProgramaCreacionAuditoria: FFAppState().programacreacion,
                        );
                        Map<String, dynamic> prearchivosjson = {
                          "idFichaPreguntaArchivo": archivo.idFichaPreguntaArchivo,
                          "idFichaPreguntaArchivoMovil": archivo.idFichaPreguntaArchivoLocal,
                          "idFicha": archivo.idFicha,
                          "idPregunta": archivo.idPregunta,
                          "idPlantillaSeccion": archivo.idPlantillaSeccion,
                          "numeroRepeticion": archivo.numeroRepeticion,
                          "nombre": archivo.nombre,
                          "extension": archivo.extension,
                          "ruta": archivo.ruta,
                          "peso": archivo.peso,
                          "estadoAuditoria": archivo.estadoAuditoria,
                          "usuarioCreacionAuditoria": archivo.usuarioCreacionAuditoria == "null" ? null : archivo.usuarioCreacionAuditoria,
                          "usuarioModificacionAuditoria": archivo.usuarioModificacionAuditoria == "null" ? null : archivo.usuarioModificacionAuditoria,
                          "fechaCreacionAuditoria": archivo.fechaCreacionAuditoria == "null" ? null : archivo.fechaCreacionAuditoria,
                          "fechaModificacionAuditoria": archivo.fechaModificacionAuditoria == "null" ? null : archivo.fechaModificacionAuditoria,
                          "equipoCreacionAuditoria": archivo.equipoCreacionAuditoria == "null" ? null : archivo.equipoCreacionAuditoria,
                          "equipoModificacionAuditoria": archivo.equipoModificacionAuditoria == "null" ? null : archivo.equipoModificacionAuditoria,
                          "programaCreacionAuditoria": archivo.programaCreacionAuditoria == "null" ? null : archivo.programaCreacionAuditoria,
                          "programaModificacionAuditoria": archivo.programaModificacionAuditoria == "null" ? null : archivo.programaModificacionAuditoria
                        };
                        fichaarchivosObj.add(prearchivosjson);
                      }
                    }

                    var fichamodularmodificacion = await SQLiteManager.instance.listarFichasModularesPorModificad(
                        dniInspector: FFAppState().username
                    );
                    if (fichamodularmodificacion != null) {
                      for (var fichamodu in fichamodularmodificacion) {
                        SQLiteManager.instance.cargarColaSincronizacion(
                          TipoDato: "fichamodular",
                          Estado: 1,
                          IdDatoLocal: fichamodu.idFichaModularlocal,
                          IdDatoServer: fichamodu.idFichaModular,
                          IdSincro:idsincro,
                          UsuarioCreacionAuditoria: FFAppState().username,
                          FechaCreacionAuditoria: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                          EquipoCreacionAuditoria: FFAppState().cummovil,
                          ProgramaCreacionAuditoria: FFAppState().programacreacion,
                        );
                        Map<String, dynamic> fichaModularjson = {
                          "idFichaModular": fichamodu.idFichaModular,
                          "idFicha": fichamodu.idFicha,
                          "codigoModular": fichamodu.codigoModular,
                          "codigoLocal": fichamodu.codigoLocal,
                          "codigoNivel": fichamodu.codigoNivel,
                          "nivel": fichamodu.nivel,
                          "codigoTipoDocente": fichamodu.codigoTipoDocente,
                          "tipoDocente": fichamodu.tipoDocente,
                          "codigoTipoSexo": fichamodu.tipoSexo,
                          "tipoSexo": fichamodu.tipoSexo,
                          "codigoTurno": fichamodu.codigoTurno,
                          "turno": fichamodu.turno,
                          "numeroHombres": fichamodu.numeroHombres,
                          "numeroMujeres": fichamodu.numeroMujeres,
                          "numeroAlumnos": fichamodu.numeroAlumnos,
                          "numeroDocente": fichamodu.numeroDocente,
                          "numeroSeccion": fichamodu.numeroSeccion,
                          "estadoAuditoria": fichamodu.estadoauditoria,
                          "usuarioCreacionAuditoria": fichamodu.usuariocreacion == "null" ? null : fichamodu.usuariocreacion,
                          "usuarioModificacionAuditoria": fichamodu.usuariomodificacion == "null" ? null : fichamodu.usuariomodificacion,
                          "fechaCreacionAuditoria": fichamodu.fechacreacion == "null" ? null : fichamodu.fechacreacion,
                          "fechaModificacionAuditoria": fichamodu.fechamodificacion == "null" ? null : fichamodu.fechamodificacion,
                          "equipoCreacionAuditoria": fichamodu.equipocreacion == "null" ? null : fichamodu.equipocreacion,
                          "equipoModificacionAuditoria": fichamodu.equipomodificacion == "null" ? null : fichamodu.equipomodificacion,
                          "programaCreacionAuditoria": fichamodu.programacreacion == "null" ? null : fichamodu.programacreacion,
                          "programaModificacionAuditoria": fichamodu.programamodificacion == "null" ? null : fichamodu.programamodificacion
                        };
                        fichasModularesObj.add(fichaModularjson);
                      }
                    }

                    var fichapreguntarespuesta = await SQLiteManager.instance.listarRespuestasModificas(
                        dniInspector: FFAppState().username
                    );
                    if (fichapreguntarespuesta != null){
                      for (var fichapregun in fichapreguntarespuesta) {
                        SQLiteManager.instance.cargarColaSincronizacion(
                          TipoDato: "fichapreguntarespuesta",
                          Estado: 1,
                          IdDatoLocal: fichapregun.idFichaPreguntaRespuestaLocal,
                          IdDatoServer: fichapregun.idFichaPreguntaRespuesta,
                          IdSincro: idsincro,
                          UsuarioCreacionAuditoria: FFAppState().username,
                          FechaCreacionAuditoria: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                          EquipoCreacionAuditoria: FFAppState().cummovil,
                          ProgramaCreacionAuditoria: FFAppState().programacreacion,
                        );
                        Map<String, dynamic> ficharespuestajson = {
                          "idFichaPreguntaRespuestaMovil": fichapregun.idFichaPreguntaRespuestaLocal,
                          "idFichaPreguntaRespuesta": fichapregun.idFichaPreguntaRespuesta,
                          "idFicha": fichapregun.idFicha,
                          "idPlantillaOpcion": fichapregun.idPlantillaOpcion,
                          "idPregunta": fichapregun.idPregunta,
                          "idPlantillaSeccion": fichapregun.idPlantillaSeccion,
                          "numeroRepeticion": fichapregun.numeroRepeticion,
                          "respuesta": fichapregun.respuesta,
                          "descripcionOpcion": null,
                          "descripcionPregunta": null,
                          "estadoAuditoria": fichapregun.estadoAuditoria,
                          "usuarioCreacionAuditoria": fichapregun.usuarioCreacionAuditoria == "null" ? null : fichapregun.usuarioCreacionAuditoria,
                          "usuarioModificacionAuditoria": fichapregun.usuarioModificacionAuditoria == "null" ? null : fichapregun.usuarioModificacionAuditoria,
                          "fechaCreacionAuditoria": fichapregun.fechaCreacionAuditoria == "null" ? null : fichapregun.fechaCreacionAuditoria,
                          "fechaModificacionAuditoria": fichapregun.fechaModificacionAuditoria == "null" ? null : fichapregun.fechaModificacionAuditoria,
                          "equipoCreacionAuditoria": fichapregun.equipoCreacionAuditoria == "null" ? null : fichapregun.equipoCreacionAuditoria,
                          "equipoModificacionAuditoria": fichapregun.equipoModificacionAuditoria == "null" ? null : fichapregun.equipoModificacionAuditoria,
                          "programaCreacionAuditoria": fichapregun.programaCreacionAuditoria == "null" ? null : fichapregun.programaCreacionAuditoria,
                          "programaModificacionAuditoria": fichapregun.programaModificacionAuditoria == "null" ? null : fichapregun.programaModificacionAuditoria
                        };
                        respuestasColaObj.add(ficharespuestajson);
                      }
                    }

                    var inspeccionesMod1= await SQLiteManager.instance.listarInspeccionesMod1(
                        dniInspector: FFAppState().username
                    );
                    if (inspeccionesMod1 != null){
                      for (var ins in inspeccionesMod1){
                        Map<String, dynamic> inspeccionesJson = {
                          "idInspeccion": ins.idInspeccion,
                          "idFicha": ins.idFicha,
                          "idEstado": ins.idEstado,
                          "modificadoMovil": ins.modificadoMovil,
                          "usuarioCreacionAuditoria": ins.usuarioCreacionAuditoria == "null" ? null : ins.usuarioCreacionAuditoria,
                          "usuarioModificacionAuditoria": ins.usuarioModificacionAuditoria == "null" ? null : ins.usuarioModificacionAuditoria,
                          "fechaCreacionAuditoria": ins.fechaCreacionAuditoria == "null" ? null : ins.fechaCreacionAuditoria,
                          "fechaModificacionAuditoria": ins.fechaModificacionAuditoria == "null" ? null : ins.fechaModificacionAuditoria,
                          "equipoCreacionAuditoria": ins.equipoCreacionAuditoria == "null" ? null : ins.equipoCreacionAuditoria,
                          "equipoModificacionAuditoria": ins.equipoModificacionAuditoria == "null" ? null : ins.equipoModificacionAuditoria,
                          "programaCreacionAuditoria": ins.programaCreacionAuditoria == "null" ? null : ins.programaCreacionAuditoria,
                          "programaModificacionAuditoria": ins.programaModificacionAuditoria == "null" ? null : ins.programaModificacionAuditoria
                        };
                        inspeccionesObj.add(inspeccionesJson);
                      }
                    }

                    var colasincro = await SQLiteManager.instance.ListarColaSincronizacion();
                    if( colasincro != null){
                      for ( var sinc in colasincro){
                        Map<String, dynamic> sincroColajson = {
                          "tipo": sinc.tipoDato,
                          "idColaMovil":sinc.idCola,
                          "idColaServer":sinc.idColaServer,
                          "idEstado":sinc.estadoSincronizacion ,/*Pendiente*/
                          "idMovil":sinc.idDatoLocal,
                          "idServer":sinc.idDatoServer,
                          "idSincroMovil":sinc.idSincro,
                          "observacion": null,
                          "usuarioCreacionAuditoria":sinc.UsuarioCreacionAuditoria == "null" ? null : sinc.UsuarioCreacionAuditoria,
                          "fechaCreacionAuditoria":sinc.FechaCreacionAuditoria == "null" ? null : sinc.FechaCreacionAuditoria,
                          "equipoCreacionAuditoria":sinc.EquipoCreacionAuditoria == "null" ? null : sinc.EquipoCreacionAuditoria,
                          "programaCreacionAuditoria":sinc.ProgramaCreacionAuditoria == "null" ? null : sinc.ProgramaCreacionAuditoria
                        };
                        sincroColaObj.add(sincroColajson);
                      }
                    }

                    ///ARMANDO JSON
                    Map<String, dynamic> json = {
                      "sincro": sincronz,
                      "sincroCola": sincroColaObj,
                      "inspecciones": inspeccionesObj,
                      "fichas": fichasObj,
                      "fichasModulares": fichasModularesObj,
                      "fichasPreguntasRespuestas" : respuestasColaObj,
                      "fichasFirmas": fichasFichasObj,
                      "fichasArchivos": fichasArchivosObj,
                      "fichasPreguntasArchivos": fichaarchivosObj,
                      "fichasPreguntasComentarios": fichacomentarioObj
                    };
                    var jsonString = jsonEncode(json);
                    var jsonn = jsonDecode(jsonString);

                    ///CAMBIANDO ESTADO 2
                    for ( var c in colasincro) {
                      SQLiteManager.instance.actualizarestaFichaCola(
                          idCola: c.idCola
                      );
                    }


                    _model.apiResponseDatos = await ApiProniedCall.call(
                      corcheJson: jsonn,
                      token: FFAppState().tokenFinal
                    );
                    //var jsonstring2 = jsonEncode(_model.apiResponseDatos);
                    if(_model.apiResponseDatos?.statusCode == 401)
                    {
                      context.pushNamed(
                          'Login');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            ApiProniedCall.mensajeApiCall(_model.apiResponseDatos?.jsonBody)!,
                            style: TextStyle(
                              color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                            ),
                          ),
                          duration: const Duration(milliseconds: 4000),
                          backgroundColor: FlutterFlowTheme.of(context).primary,
                        ),
                      );
                      return null;
                    }
                    ///EL STATUSCODE != 401
                    else {
                      if ((_model.apiResponseDatos?.succeeded ?? true && ApiProniedCall.idEstadoSincronizacion(_model.apiResponseDatos?.jsonBody) == Sincronizacion.estado_cola_completo)) {

                        var fichas = ApiProniedCall.fichas(_model.apiResponseDatos?.jsonBody);
                        if(fichas != null){
                          for (var i=0; i < fichas.length; i++){
                            var existe = await SQLiteManager.instance.VerificarSiExisteFicha(
                              IdColaSinc: ApiProniedCall.idFicha(_model.apiResponseDatos?.jsonBody, i),
                            );
                            if (existe.length > 0){
                              await SQLiteManager.instance.actualizarFichaAPI(
                                idPlantilla: ApiProniedCall.idPlantilla(_model.apiResponseDatos?.jsonBody, i),
                                codigoLocalColegio: ApiProniedCall.fichaCodigoLocal(_model.apiResponseDatos?.jsonBody, i),
                                nombreLocalColegio: ApiProniedCall.fichaNombreLocal(_model.apiResponseDatos?.jsonBody, i),
                                departamentloColegio: ApiProniedCall.fichaDepartamento(_model.apiResponseDatos?.jsonBody, i),
                                provinciaColegio: ApiProniedCall.fichaProvincia(_model.apiResponseDatos?.jsonBody, i),
                                distritoColegio: ApiProniedCall.fichaDistrito(_model.apiResponseDatos?.jsonBody, i),
                                centroPobladoColegio: ApiProniedCall.fichaCentroPoblado(_model.apiResponseDatos?.jsonBody, i),
                                direccionColegio: ApiProniedCall.fichaDireccion(_model.apiResponseDatos?.jsonBody, i),
                                zonaColegio: ApiProniedCall.fichaZona(_model.apiResponseDatos?.jsonBody, i),
                                latitud: ApiProniedCall.fichaLatitud(_model.apiResponseDatos?.jsonBody, i),
                                longitud: ApiProniedCall.fichaLongitud(_model.apiResponseDatos?.jsonBody, i),
                                totalPabellon: ApiProniedCall.fichaPabellon(_model.apiResponseDatos?.jsonBody, i),
                                totalAulas: ApiProniedCall.fichaAulas(_model.apiResponseDatos?.jsonBody, i),
                                totalSSHH: ApiProniedCall.fichaSSHH(_model.apiResponseDatos?.jsonBody, i),
                                dniInspector: ApiProniedCall.fichaDniInspector(_model.apiResponseDatos?.jsonBody, i),
                                nombreInspector: ApiProniedCall.fichaNombreInspector(_model.apiResponseDatos?.jsonBody, i),
                                correoInspector: ApiProniedCall.fichaCorreoInspector(_model.apiResponseDatos?.jsonBody, i),
                                telefonoInspector: ApiProniedCall.fichaTelefonoIns(_model.apiResponseDatos?.jsonBody, i),
                                fechaInspeccion: ApiProniedCall.fichaFechaInspeccion(_model.apiResponseDatos?.jsonBody, i),
                                horaInspeccion: ApiProniedCall.fichaHoraInspeccion(_model.apiResponseDatos?.jsonBody, i),
                                tipoInspeccion: ApiProniedCall.fichaTipoInspeccion(_model.apiResponseDatos?.jsonBody, i),
                                dniDirector: ApiProniedCall.fichaDniDirector(_model.apiResponseDatos?.jsonBody, i),
                                nombreDirector: ApiProniedCall.fichaNombreDirector(_model.apiResponseDatos?.jsonBody, i),
                                correoDirector: ApiProniedCall.fichaCorreoDirector(_model.apiResponseDatos?.jsonBody, i),
                                dniAlterno: ApiProniedCall.fichaDniAlterno(_model.apiResponseDatos?.jsonBody, i),
                                nombreAlterno: ApiProniedCall.fichaNombreAlterno(_model.apiResponseDatos?.jsonBody, i),
                                correoAlterno: ApiProniedCall.fichaCorreoAlterno(_model.apiResponseDatos?.jsonBody, i),
                                telefonoAlterno: ApiProniedCall.fichaTelefonoAlterno(_model.apiResponseDatos?.jsonBody, i),
                                usuarioCreacionAudi: ApiProniedCall.fichausuariocreacion(_model.apiResponseDatos?.jsonBody, i),
                                usuarioModificacionAudi: ApiProniedCall.fichausuariomodificacion(_model.apiResponseDatos?.jsonBody, i),
                                fechaCreacionAuditoria: ApiProniedCall.fichaFecha(_model.apiResponseDatos?.jsonBody, i),
                                fechaModificacionAuditoria: ApiProniedCall.fichaFechaModificacion(_model.apiResponseDatos?.jsonBody, i),
                                equipoCreacionAuditoria: ApiProniedCall.fichaEquipoCreacion(_model.apiResponseDatos?.jsonBody, i),
                                equipoModificacionAuditoria: ApiProniedCall.fichaEquipoModificacionAuditoria(_model.apiResponseDatos?.jsonBody, i),
                                programaCreacionAuditoria: ApiProniedCall.fichaprogramaCreacionAuditoria(_model.apiResponseDatos?.jsonBody, i),
                                programaModificacionAuditoria: ApiProniedCall.fichaprogramaModificacionAuditoria(_model.apiResponseDatos?.jsonBody, i),
                                telefonoDirector: ApiProniedCall.fichaTelefonoDirector(_model.apiResponseDatos?.jsonBody, i),
                                idFicha: ApiProniedCall.idFicha(_model.apiResponseDatos?.jsonBody, i),
                              );
                            } else {
                              await SQLiteManager.instance.cargarFicha(
                                  idFicha: ApiProniedCall.idFicha(_model.apiResponseDatos?.jsonBody, i),
                                  idPlantilla: ApiProniedCall.idPlantilla(_model.apiResponseDatos?.jsonBody, i),
                                  codigoLocalColegio: ApiProniedCall.fichaCodigoLocal(_model.apiResponseDatos?.jsonBody, i),
                                  nombreLocalColegio: ApiProniedCall.fichaNombreLocal(_model.apiResponseDatos?.jsonBody, i),
                                  departamentoColegio: ApiProniedCall.fichaDepartamento(_model.apiResponseDatos?.jsonBody, i),
                                  provinciaColegio: ApiProniedCall.fichaProvincia(_model.apiResponseDatos?.jsonBody, i),
                                  distritoColegio: ApiProniedCall.fichaDistrito(_model.apiResponseDatos?.jsonBody, i),
                                  centroPobladoColegio: ApiProniedCall.fichaCentroPoblado(_model.apiResponseDatos?.jsonBody, i),
                                  direccionColegio: ApiProniedCall.fichaDireccion(_model.apiResponseDatos?.jsonBody, i),
                                  zonaColegio: ApiProniedCall.fichaZona(_model.apiResponseDatos?.jsonBody, i),
                                  totalPabellon : ApiProniedCall.fichaPabellon(_model.apiResponseDatos?.jsonBody, i),
                                  totalAulas: ApiProniedCall.fichaAulas(_model.apiResponseDatos?.jsonBody, i),
                                  totalSSHH: ApiProniedCall.fichaSSHH(_model.apiResponseDatos?.jsonBody, i),
                                  dniInspector: ApiProniedCall.fichaDniInspector(_model.apiResponseDatos?.jsonBody, i),
                                  nombreInspector: ApiProniedCall.fichaNombreInspector(_model.apiResponseDatos?.jsonBody, i),
                                  correoInspector: ApiProniedCall.fichaCorreoInspector(_model.apiResponseDatos?.jsonBody, i),
                                  telefonoInspector: ApiProniedCall.fichaTelefonoIns(_model.apiResponseDatos?.jsonBody, i),
                                  fechaInspeccion: ApiProniedCall.fichaFechaInspeccion(_model.apiResponseDatos?.jsonBody, i),
                                  horaInspeccion: ApiProniedCall.fichaHoraInspeccion(_model.apiResponseDatos?.jsonBody, i),
                                  tipoInspeccion: ApiProniedCall.fichaTipoInspeccion(_model.apiResponseDatos?.jsonBody, i),
                                  dniDirector: ApiProniedCall.fichaDniDirector(_model.apiResponseDatos?.jsonBody, i),
                                  nombreDirector: ApiProniedCall.fichaNombreDirector(_model.apiResponseDatos?.jsonBody, i),
                                  correoDirector: ApiProniedCall.fichaCorreoDirector(_model.apiResponseDatos?.jsonBody, i),
                                  telefonoDirector: ApiProniedCall.fichaTelefonoDirector(_model.apiResponseDatos?.jsonBody, i),
                                  dniAlterno: ApiProniedCall.fichaDniAlterno(_model.apiResponseDatos?.jsonBody, i),
                                  nombreAlterno: ApiProniedCall.fichaNombreAlterno(_model.apiResponseDatos?.jsonBody, i),
                                  correoAlterno: ApiProniedCall.fichaCorreoAlterno(_model.apiResponseDatos?.jsonBody, i),
                                  telefonoAlterno: ApiProniedCall.fichaTelefonoAlterno(_model.apiResponseDatos?.jsonBody, i),
                                  usuarioCreacion: ApiProniedCall.fichausuariocreacion(_model.apiResponseDatos?.jsonBody, i),
                                  usuarioModificacion: ApiProniedCall.fichausuariomodificacion(_model.apiResponseDatos?.jsonBody, i),
                                  fechaCreacion: ApiProniedCall.fichaFecha(_model.apiResponseDatos?.jsonBody, i),
                                  fechaModificacion: ApiProniedCall.fichaFechaModificacion(_model.apiResponseDatos?.jsonBody, i),
                                  equipoCreacion: ApiProniedCall.fichaEquipoCreacion(_model.apiResponseDatos?.jsonBody, i),
                                  equipoModificacion: ApiProniedCall.fichaEquipoModificacionAuditoria(_model.apiResponseDatos?.jsonBody, i),
                                  programaCreacion: ApiProniedCall.fichaprogramaCreacionAuditoria(_model.apiResponseDatos?.jsonBody, i),
                                  programaModificacion: ApiProniedCall.fichaEquipoModificacionAuditoria(_model.apiResponseDatos?.jsonBody, i),
                                  latitud: ApiProniedCall.fichaLatitud(_model.apiResponseDatos?.jsonBody, i),
                                  longitud: ApiProniedCall.fichaLongitud(_model.apiResponseDatos?.jsonBody, i)
                              );
                            }
                          }
                        }

                        /// ACTUALIZANDO O INSERTANDO FICHAMODULAR
                        var fichasModulares = ApiProniedCall.fichaModular(_model.apiResponseDatos?.jsonBody);
                        if(fichasModulares != null){
                          for (var i=0; i < fichasModulares.length; i++){
                            var exist = await SQLiteManager.instance.VerificarSiExisteFichaModulares(
                                idFichaModular: ApiProniedCall.idFichaModular(_model.apiResponseDatos?.jsonBody, i)
                            );
                            if (exist.length > 0 ) {
                              // Función para manejar valores nulos y el string 'null'
                              int validarValor(dynamic valor) {
                                if (valor == null || valor == 'null') {
                                  return 0;
                                }
                                return valor as int; // Asegúrate de que el valor es del tipo correcto.
                              }
                              int? numeroHombre = ApiProniedCall.numeroHombreMod(_model.apiResponseDatos?.jsonBody, i);
                              int? numeroMujere =  ApiProniedCall.numeroMujeresMod(_model.apiResponseDatos?.jsonBody, i);
                              int? numeroAlumno =  ApiProniedCall.numeroAlumnoMod(_model.apiResponseDatos?.jsonBody, i);
                              int? numeroDocent =  ApiProniedCall.numeroDocenteMod(_model.apiResponseDatos?.jsonBody, i);
                              int? numeroSeccio =   ApiProniedCall.numeroSeccinMod(_model.apiResponseDatos?.jsonBody, i);
                              numeroHombre = validarValor(numeroHombre);
                              numeroMujere = validarValor(numeroMujere);
                              numeroAlumno = validarValor(numeroAlumno);
                              numeroDocent = validarValor(numeroDocent);
                              numeroSeccio = validarValor(numeroSeccio);
                              await SQLiteManager.instance.actualizarFichaModAPI(
                                idFichaModular:  ApiProniedCall.idFichaModular(_model.apiResponseDatos?.jsonBody, i),
                                idFicha:  ApiProniedCall.idFichaModularFicha(_model.apiResponseDatos?.jsonBody, i),
                                codigoModular:  ApiProniedCall.codigoModular(_model.apiResponseDatos?.jsonBody, i),
                                codigoLocal:  ApiProniedCall.codigoLocalModular(_model.apiResponseDatos?.jsonBody, i),
                                codigoNivel:  ApiProniedCall.codigoNivelModular(_model.apiResponseDatos?.jsonBody, i),
                                nivel:  ApiProniedCall.nivelModular(_model.apiResponseDatos?.jsonBody, i),
                                codigoTipoDocente:  ApiProniedCall.codigoTipoDocenteMod(_model.apiResponseDatos?.jsonBody, i),
                                tipoDocente:  ApiProniedCall.tipoDocenteMod(_model.apiResponseDatos?.jsonBody, i),
                                codigoTipoSexo:  ApiProniedCall.tipoSexcionMod(_model.apiResponseDatos?.jsonBody, i),
                                tipoSexo:  ApiProniedCall.tipoSexoMod(_model.apiResponseDatos?.jsonBody, i),
                                codigoTurno:  ApiProniedCall.codigoTurnoMod(_model.apiResponseDatos?.jsonBody, i),
                                turno:   ApiProniedCall.turnoMod(_model.apiResponseDatos?.jsonBody, i),
                                numeroHombres:  numeroHombre,
                                numeroMujeres:  numeroMujere,
                                numeroAlumnos:  numeroAlumno,
                                numeroDocente:  numeroDocent,
                                numeroSeccion:  numeroSeccio,
                                estadoAuditoria:  ApiProniedCall.estadoAuditoriaModular(_model.apiResponseDatos?.jsonBody, i),
                                usuacrioCreacionAudi:  ApiProniedCall.usuarioCreacionAuditoriaModular(_model.apiResponseDatos?.jsonBody, i),
                                usuarioModificacionAudi:  ApiProniedCall.usuarioModificacionAuditoriaModular(_model.apiResponseDatos?.jsonBody, i),
                                fechaCrecionAuditoria:  ApiProniedCall.fichaFechaModular(_model.apiResponseDatos?.jsonBody, i),
                                fechaModificacionAuditoria:  ApiProniedCall.fichaFechaModificacionModular(_model.apiResponseDatos?.jsonBody, i),
                                equipoCreacionAuditoria:  ApiProniedCall.equipoCreacionAuditoriaModular(_model.apiResponseDatos?.jsonBody, i),
                                equipoModificacionAuditoria:  ApiProniedCall.equipoModificacionAuditoriaModular(_model.apiResponseDatos?.jsonBody, i),
                                programaCreacionAuditoria:  ApiProniedCall.programaCreacionAuditoriaModular(_model.apiResponseDatos?.jsonBody, i),
                                programaModificacionAuditoria:  ApiProniedCall.programaModificacionAuditoriaModular(_model.apiResponseDatos?.jsonBody, i),

                              );
                            } else {
                              int validarValor(dynamic valor) {
                                if (valor == null || valor == 'null') {
                                  return 0;
                                }
                                return valor as int; // Asegúrate de que el valor es del tipo correcto.
                              }
                              int? numeroHombre = ApiProniedCall.numeroHombreMod(_model.apiResponseDatos?.jsonBody, i);
                              int? numeroMujere =  ApiProniedCall.numeroMujeresMod(_model.apiResponseDatos?.jsonBody, i);
                              int? numeroAlumno =  ApiProniedCall.numeroAlumnoMod(_model.apiResponseDatos?.jsonBody, i);
                              int? numeroDocent =  ApiProniedCall.numeroDocenteMod(_model.apiResponseDatos?.jsonBody, i);
                              int? numeroSeccio =   ApiProniedCall.numeroSeccinMod(_model.apiResponseDatos?.jsonBody, i);
                              numeroHombre = validarValor(numeroHombre);
                              numeroMujere = validarValor(numeroMujere);
                              numeroAlumno = validarValor(numeroAlumno);
                              numeroDocent = validarValor(numeroDocent);
                              numeroSeccio = validarValor(numeroSeccio);
                              await SQLiteManager.instance.cargarFichaModular(
                                idFichaModular: ApiProniedCall.idFichaModular(_model.apiResponseDatos?.jsonBody, i),
                                idFicha: ApiProniedCall.idFichaModularFicha(_model.apiResponseDatos?.jsonBody, i),
                                codigoModular: ApiProniedCall.codigoModular(_model.apiResponseDatos?.jsonBody, i),
                                codigoLocal: ApiProniedCall.codigoLocalModular(_model.apiResponseDatos?.jsonBody, i),
                                codigoNivel: ApiProniedCall.codigoNivelModular(_model.apiResponseDatos?.jsonBody, i),
                                nivel: ApiProniedCall.nivelModular(_model.apiResponseDatos?.jsonBody, i),
                                codigoTipoDocente: ApiProniedCall.tipoDocenteMod(_model.apiResponseDatos?.jsonBody, i),
                                tipoDocente: ApiProniedCall.tipoDocenteMod(_model.apiResponseDatos?.jsonBody, i),
                                codigoTipoSexo: ApiProniedCall.tipoSexcionMod(_model.apiResponseDatos?.jsonBody, i),
                                tipoSexo: ApiProniedCall.tipoSexoMod(_model.apiResponseDatos?.jsonBody, i),
                                codigoTurno: ApiProniedCall.codigoTurnoMod(_model.apiResponseDatos?.jsonBody, i),
                                turno: ApiProniedCall.turnoMod(_model.apiResponseDatos?.jsonBody, i),
                                numeroHombres:  numeroHombre,
                                numeroMujeres:  numeroMujere,
                                numeroAlumnos:  numeroAlumno,
                                numeroDocente:  numeroDocent,
                                numeroSeccion:  numeroSeccio,
                                estadoAuditoria: ApiProniedCall.estadoAuditoriaModular(_model.apiResponseDatos?.jsonBody, i),
                                usuarioCreacionAuditoria: ApiProniedCall.usuarioCreacionAuditoriaModular(_model.apiResponseDatos?.jsonBody, i),
                                usuarioModificacionAuditoria: ApiProniedCall.usuarioCreacionAuditoriaModular(_model.apiResponseDatos?.jsonBody, i),
                                fechaCreacionAuditoria: ApiProniedCall.fichaFechaModular(_model.apiResponseDatos?.jsonBody, i),
                                fechaModificacionAuditoria:  ApiProniedCall.fichaFechaModificacionModular(_model.apiResponseDatos?.jsonBody, i),
                                equipoCreacionAuditoria: ApiProniedCall.equipoCreacionAuditoriaModular(_model.apiResponseDatos?.jsonBody, i),
                                equipoModificacionAuditoria: ApiProniedCall.equipoModificacionAuditoriaModular(_model.apiResponseDatos?.jsonBody, i),
                                programaCreacionAuditoria: ApiProniedCall.programaCreacionAuditoriaModular(_model.apiResponseDatos?.jsonBody, i),
                                programaModificacionAuditoria: ApiProniedCall.programaModificacionAuditoriaModular(_model.apiResponseDatos?.jsonBody, i),
                              );
                            }
                          }
                        }

                        var plantillas = ApiProniedCall.plantillas(_model.apiResponseDatos?.jsonBody);
                        if (plantillas != null) {
                          for (var i=0; i < plantillas.length; i++){
                            var plan = await SQLiteManager.instance.VerificarSiExistePlantillas(
                                IdPlantilla: ApiProniedCall.idPlantillas(_model.apiResponseDatos?.jsonBody, i)
                            );
                            if (plan.length > 0) {
                              await SQLiteManager.instance.actualizarPlantillaAPI(
                                idPlantilla: ApiProniedCall.idPlantillas(_model.apiResponseDatos?.jsonBody, i),
                                nombreFicha: ApiProniedCall.nombreFichaPla(_model.apiResponseDatos?.jsonBody, i),
                                idUnidadTrabajo : ApiProniedCall.idUnidadTrabajoPla(_model.apiResponseDatos?.jsonBody, i),
                                nombreUnidadTrabajo: ApiProniedCall.nomUnidadTrabajoPla(_model.apiResponseDatos?.jsonBody, i),
                              );
                            } else {
                              await SQLiteManager.instance.cargarPlantilla(
                                idPlantilla: ApiProniedCall.idPlantillas(_model.apiResponseDatos?.jsonBody, i),
                                nombreFicha: ApiProniedCall.nombreFichaPla(_model.apiResponseDatos?.jsonBody, i),
                                idUnidadTrabajo : ApiProniedCall.idUnidadTrabajoPla(_model.apiResponseDatos?.jsonBody, i),
                                nombreUnidadTrabajo: ApiProniedCall.nomUnidadTrabajoPla(_model.apiResponseDatos?.jsonBody, i),
                              );
                            }
                          }
                        }

                        var secciones = ApiProniedCall.secciones(_model.apiResponseDatos?.jsonBody);
                        if (secciones != null){
                          for (var i=0; i < secciones.length; i++){
                            var sec = await SQLiteManager.instance.VerificarSiExisteSeccion(
                                idPlantillaSeccion: ApiProniedCall.idPLantillaSecc(_model.apiResponseDatos?.jsonBody, i)
                            );
                            if(sec.length > 0){
                              await SQLiteManager.instance.actualizarSeccionAPI(
                                idPlantillaSeccion: ApiProniedCall.idPLantillaSecc(_model.apiResponseDatos?.jsonBody, i),
                                idPlantillaSeccionPadre: ApiProniedCall.idPlantillaSeccPa(_model.apiResponseDatos?.jsonBody, i),
                                idPlantilla: ApiProniedCall.idePlantillaSec(_model.apiResponseDatos?.jsonBody, i),
                                descripcion: ApiProniedCall.descripcionSec(_model.apiResponseDatos?.jsonBody, i),
                                modoRepeticion: ApiProniedCall.modoRepeticionSec(_model.apiResponseDatos?.jsonBody, i),
                              );
                            } else {
                              await SQLiteManager.instance.cargarPlantillaSecciones(
                                idPlantillaSeccion: ApiProniedCall.idPLantillaSecc(_model.apiResponseDatos?.jsonBody, i),
                                idPlantillaSeccionPadre: ApiProniedCall.idPlantillaSeccPa(_model.apiResponseDatos?.jsonBody, i),
                                idPlantilla: ApiProniedCall.idePlantillaSec(_model.apiResponseDatos?.jsonBody, i),
                                descripcion: ApiProniedCall.descripcionSec(_model.apiResponseDatos?.jsonBody, i),
                                modoRepeticion: ApiProniedCall.modoRepeticionSec(_model.apiResponseDatos?.jsonBody, i),
                              );
                            }
                          }
                        }

                        var opciones = ApiProniedCall.opciones(_model.apiResponseDatos?.jsonBody);
                        if (opciones != null) {
                          for (var i=0; i< opciones.length; i++){
                            var op = await SQLiteManager.instance.VerificarSiExisteOpccion(
                              idPlantillaOpcion: ApiProniedCall.idPlantillaOpciones(_model.apiResponseDatos?.jsonBody, i),
                            );
                            if(op.length > 0){
                              await SQLiteManager.instance.actualizarOpcionAPI(
                                idPlantillaOpcion: ApiProniedCall.idPlantillaOpciones(_model.apiResponseDatos?.jsonBody, i),
                                idPlantillaSeccion: ApiProniedCall.idPlantillaSeccOP(_model.apiResponseDatos?.jsonBody, i),
                                idPlantilla: ApiProniedCall.idPlantillaOP(_model.apiResponseDatos?.jsonBody, i),
                                idPregunta: ApiProniedCall.idPreguntaOP(_model.apiResponseDatos?.jsonBody, i),
                                descripcion: ApiProniedCall.descriopcionOP(_model.apiResponseDatos?.jsonBody, i),
                                clasificacionOpcion: ApiProniedCall.clasificacionOP(_model.apiResponseDatos?.jsonBody, i),
                                idTipoOpcion: ApiProniedCall.idTipoOpcion(_model.apiResponseDatos?.jsonBody, i),
                                tipoOpcion: ApiProniedCall.tipoOpcionOP(_model.apiResponseDatos?.jsonBody, i),
                                matIcon: ApiProniedCall.matIconOP(_model.apiResponseDatos?.jsonBody, i),
                              );
                            } else {
                              await SQLiteManager.instance.cargarPlantillaOpciones(
                                idPlantillaOpcion: ApiProniedCall.idPlantillaOpciones(_model.apiResponseDatos?.jsonBody, i),
                                idPlantillaSeccion: ApiProniedCall.idPlantillaSeccOP(_model.apiResponseDatos?.jsonBody, i),
                                idPlantilla: ApiProniedCall.idPlantillaOP(_model.apiResponseDatos?.jsonBody, i),
                                idPregunta: ApiProniedCall.idPreguntaOP(_model.apiResponseDatos?.jsonBody, i),
                                descripcion: ApiProniedCall.descriopcionOP(_model.apiResponseDatos?.jsonBody, i),
                                clasificacionOpcion: ApiProniedCall.clasificacionOP(_model.apiResponseDatos?.jsonBody, i),
                                idTipoOpcion: ApiProniedCall.idTipoOpcion(_model.apiResponseDatos?.jsonBody, i),
                                tipoOpcion: ApiProniedCall.tipoOpcionOP(_model.apiResponseDatos?.jsonBody, i),
                                matIcon: ApiProniedCall.matIconOP(_model.apiResponseDatos?.jsonBody, i),
                              );
                            }
                          }
                        }

                        var preguntas = ApiProniedCall.preguntasPre(_model.apiResponseDatos?.jsonBody);
                        if (preguntas != null){
                          for (var i=0; i< preguntas.length; i++){
                            var preg = await SQLiteManager.instance.VerificarSiExistePregunta(
                                idPlantillaPregunta: ApiProniedCall.idPlantillaPregunta(_model.apiResponseDatos?.jsonBody, i)
                            );
                            if (preg.length > 0){
                              await SQLiteManager.instance.actualizarPreguntaAPI(
                                idPlantillaPregunta: ApiProniedCall.idPlantillaPregunta(_model.apiResponseDatos?.jsonBody, i),
                                idPlantillaSeccion: ApiProniedCall.idPlantillaSecPres(_model.apiResponseDatos?.jsonBody, i),
                                idPregunta: ApiProniedCall.idPreguntaPres(_model.apiResponseDatos?.jsonBody, i),
                                descripcionPregunta: ApiProniedCall.descripciondePres(_model.apiResponseDatos?.jsonBody, i),
                                flagMandatorio: ApiProniedCall.flagMandatorioPres(_model.apiResponseDatos?.jsonBody, i),
                                idPlantilla: ApiProniedCall.idPlantillaPres(_model.apiResponseDatos?.jsonBody, i),
                              );
                            } else {
                              await SQLiteManager.instance.cargarPlantillaPregunta(
                                idPlantillaPregunta: ApiProniedCall.idPlantillaPregunta(_model.apiResponseDatos?.jsonBody, i),
                                idPlantillaSeccion: ApiProniedCall.idPlantillaSecPres(_model.apiResponseDatos?.jsonBody, i),
                                idPregunta: ApiProniedCall.idPreguntaPres(_model.apiResponseDatos?.jsonBody, i),
                                descripcionPregunta: ApiProniedCall.descripciondePres(_model.apiResponseDatos?.jsonBody, i),
                                flagMandatorio: ApiProniedCall.flagMandatorioPres(_model.apiResponseDatos?.jsonBody, i),
                                idPlantilla: ApiProniedCall.idPlantillaPres(_model.apiResponseDatos?.jsonBody, i),
                              );
                            }
                          }
                        }

                        var respuestas = ApiProniedCall.fichasPreguntasRespuestas(_model.apiResponseDatos?.jsonBody);
                        if (respuestas != null) {
                          for (var i=0; i < respuestas.length; i++){
                            var rpta = await SQLiteManager.instance.VerificarSiExisteRespuesta(
                              idFicha: ApiProniedCall.idFichaRpta(_model.apiResponseDatos?.jsonBody, i),
                              numeroRepeticion: ApiProniedCall.numeroRepeticionRpta(_model.apiResponseDatos?.jsonBody, i),
                              idPlantillaOpcion: ApiProniedCall.idPlantillaOpcionRpta(_model.apiResponseDatos?.jsonBody, i),
                              idPregunta: ApiProniedCall.idPreguntaRpta(_model.apiResponseDatos?.jsonBody, i),
                              idPlantillaSeccion: ApiProniedCall.idPlantillaSeccionRpta(_model.apiResponseDatos?.jsonBody, i),
                            );
                            if (rpta.length > 0){
                              await SQLiteManager.instance.actualizarRespuestaAPI(
                                idFichaPreguntaRespuesta: ApiProniedCall.idFichaPreguntaRespuestaRpta(_model.apiResponseDatos?.jsonBody, i),
                                idFicha: ApiProniedCall.idFichaRpta(_model.apiResponseDatos?.jsonBody, i),
                                idPlantillaOpcion: ApiProniedCall.idPlantillaOpcionRpta(_model.apiResponseDatos?.jsonBody, i),
                                idPregunta: ApiProniedCall.idPreguntaRpta(_model.apiResponseDatos?.jsonBody, i),
                                idPlantillaSeccion: ApiProniedCall.idPlantillaSeccionRpta(_model.apiResponseDatos?.jsonBody, i),
                                numeroRepeticion: ApiProniedCall.numeroRepeticionRpta(_model.apiResponseDatos?.jsonBody, i),
                                respuesta: ApiProniedCall.respuestaRpta(_model.apiResponseDatos?.jsonBody, i),
                                estadoAuditoria:  ApiProniedCall.estadoAuditoriaRpta(_model.apiResponseDatos?.jsonBody, i),
                                usuarioCreacionAuditoria:  ApiProniedCall.usuarioCreacionAuditoriaRpta(_model.apiResponseDatos?.jsonBody, i),
                                usuarioModificacionAuditoria: ApiProniedCall.usuarioModificacionAuditoriaRpta(_model.apiResponseDatos?.jsonBody, i),
                                fechaCreacionAuditoria: ApiProniedCall.fechaCreacionAuditoriaRpta(_model.apiResponseDatos?.jsonBody, i),
                                fechaModificacionAuditoria: ApiProniedCall.fechaModificacionAuditoriaRpta(_model.apiResponseDatos?.jsonBody, i),
                                equipoCreacionAuditoria: ApiProniedCall.equipoCreacionAuditoriaRpta(_model.apiResponseDatos?.jsonBody, i),
                                equipoModificacionAuditoria: ApiProniedCall.equipoModificacionAuditoriaRpta(_model.apiResponseDatos?.jsonBody, i),
                                programaCreacionAuditoria: ApiProniedCall.programaCreacionAuditoriaRpta(_model.apiResponseDatos?.jsonBody, i),
                                programaModificacionAuditoria: ApiProniedCall.programaModificacionAuditoriaRpta(_model.apiResponseDatos?.jsonBody, i),
                              );
                            } else {
                              await SQLiteManager.instance.cargarFichaRespuesta(
                                  idFichaPreguntaRespuesta: ApiProniedCall.idFichaPreguntaRespuestaRpta(_model.apiResponseDatos?.jsonBody, i),
                                  idFicha: ApiProniedCall.idFichaRpta(_model.apiResponseDatos?.jsonBody, i),
                                  idPlantillaOpcion: ApiProniedCall.idPlantillaOpcionRpta(_model.apiResponseDatos?.jsonBody, i),
                                  idPregunta: ApiProniedCall.idPreguntaRpta(_model.apiResponseDatos?.jsonBody, i),
                                  idPlantillaSeccion: ApiProniedCall.idPlantillaSeccionRpta(_model.apiResponseDatos?.jsonBody, i),
                                  numeroRepeticion: ApiProniedCall.numeroRepeticionRpta(_model.apiResponseDatos?.jsonBody, i),
                                  respuesta: ApiProniedCall.respuestaRpta(_model.apiResponseDatos?.jsonBody, i),
                                  estadoAuditoria:  ApiProniedCall.estadoAuditoriaRpta(_model.apiResponseDatos?.jsonBody, i),
                                  usuarioCreacionAuditoria:  ApiProniedCall.usuarioCreacionAuditoriaRpta(_model.apiResponseDatos?.jsonBody, i),
                                  usuarioModificacionAuditoria: ApiProniedCall.usuarioModificacionAuditoriaRpta(_model.apiResponseDatos?.jsonBody, i),
                                  fechaCreacionAuditoria: ApiProniedCall.fechaCreacionAuditoriaRpta(_model.apiResponseDatos?.jsonBody, i),
                                  fechaModificacionAuditoria: ApiProniedCall.fechaModificacionAuditoriaRpta(_model.apiResponseDatos?.jsonBody, i),
                                  equipoCreacionAuditoria: ApiProniedCall.equipoCreacionAuditoriaRpta(_model.apiResponseDatos?.jsonBody, i),
                                  equipoModificacionAuditoria: ApiProniedCall.equipoModificacionAuditoriaRpta(_model.apiResponseDatos?.jsonBody, i),
                                  programaCreacionAuditoria: ApiProniedCall.programaCreacionAuditoriaRpta(_model.apiResponseDatos?.jsonBody, i),
                                  programaModificacionAuditoria: ApiProniedCall.programaModificacionAuditoriaRpta(_model.apiResponseDatos?.jsonBody, i)
                              );
                            }
                          }
                        }

                        var firmas = ApiProniedCall.fichasFirmas(_model.apiResponseDatos?.jsonBody);
                        if (firmas != null){
                          for (var i = 0; i<firmas.length; i++){
                            var rpta = await SQLiteManager.instance.VerificarSiExisteFirmaNotNUll(
                              idFicha: ApiProniedCall.idFichaFirmasfir(_model.apiResponseDatos?.jsonBody, i),
                              idFichaFirma: ApiProniedCall.idFichaFirma(_model.apiResponseDatos?.jsonBody, i),
                              idFichaFirmaMovil: ApiProniedCall.idFichaFirmaMovil(_model.apiResponseDatos?.jsonBody, i),
                            );
                            if (rpta.length > 0){
                              await SQLiteManager.instance.actualizarFichaFirmasAPI(
                                idFichaFirmaMovil : ApiProniedCall.idFichaFirmaMovil(_model.apiResponseDatos?.jsonBody, i),
                                idFicha: ApiProniedCall.idFichaFirmasfir(_model.apiResponseDatos?.jsonBody, i),
                                idFichaFirma: ApiProniedCall.idFichaFirma(_model.apiResponseDatos?.jsonBody, i),
                                nombres: ApiProniedCall.nombresfir(_model.apiResponseDatos?.jsonBody, i),
                                apellidoPaterno: ApiProniedCall.apellidoPaternofir(_model.apiResponseDatos?.jsonBody, i),
                                apellidoMaterno: ApiProniedCall.apellidoMaternofir(_model.apiResponseDatos?.jsonBody, i),
                                nombreArchivo: ApiProniedCall.nombreArchivofir(_model.apiResponseDatos?.jsonBody, i),
                                extension: ApiProniedCall.extensionfir(_model.apiResponseDatos?.jsonBody, i),
                                peso: ApiProniedCall.pesofir(_model.apiResponseDatos?.jsonBody, i),
                                tipoArchivo: ApiProniedCall.tipoArchivofir(_model.apiResponseDatos?.jsonBody, i),
                                numDocumento: ApiProniedCall.numDocumentofir(_model.apiResponseDatos?.jsonBody, i),
                                idTipoDocumento: ApiProniedCall.idTipoDocumentofir(_model.apiResponseDatos?.jsonBody, i),
                                idTipoPersona: ApiProniedCall.idTipoPersonafir(_model.apiResponseDatos?.jsonBody, i),
                                estadoAuditoria: ApiProniedCall.estadoAuditoriafir(_model.apiResponseDatos?.jsonBody, i),
                                usuarioCreacionAuditoria: ApiProniedCall.usuarioCreacionAuditoriafir(_model.apiResponseDatos?.jsonBody, i),
                                usuarioModificacionAuditoria: ApiProniedCall.usuarioModificacionAuditoriafir(_model.apiResponseDatos?.jsonBody, i),
                                fechaCreacionAuditoria: ApiProniedCall.fechaCreacionAuditoriafir(_model.apiResponseDatos?.jsonBody, i),
                                fechaModificacionAuditoria: ApiProniedCall.fechaModificacionAuditoriafir(_model.apiResponseDatos?.jsonBody, i),
                                equipoCreacionAuditoria: ApiProniedCall.equipoCreacionAuditoriafir(_model.apiResponseDatos?.jsonBody, i),
                                equipoModificacionAuditoria: ApiProniedCall.equipoModificacionAuditoriafir(_model.apiResponseDatos?.jsonBody, i),
                                programaCreacionAuditoria: ApiProniedCall.programaCreacionAuditoriafir(_model.apiResponseDatos?.jsonBody, i),
                                programaModificacionAuditoria: ApiProniedCall.programaModificacionAuditoriafir(_model.apiResponseDatos?.jsonBody, i),
                                ruta: ApiProniedCall.rutafir(_model.apiResponseDatos?.jsonBody, i),
                                modificacionMovil: 0,
                              );
                            } else {
                              var imageUrl = ApiProniedCall.rutafir(_model.apiResponseDatos?.jsonBody, i);
                              var filePath = '';
                              try {
                                // Obtener el directorio de almacenamiento local
                                final appDir = await getApplicationDocumentsDirectory();
                                // Extraer el nombre del archivo de la URL
                                final fileName = imageUrl!.split('/').last;
                                // Construir la ruta completa del archivo
                                filePath = '${appDir.path}/$fileName';
                                // Realizar la solicitud HTTP para descargar la imagen
                                final response = await http.get(Uri.parse(imageUrl!));
                                if (response.statusCode == 200) {
                                  // Convertir los bytes de la respuesta a Uint8List
                                  Uint8List bytes = response.bodyBytes;
                                  // Guardar los bytes de la imagen en el archivo
                                  await File(filePath).writeAsBytes(bytes);
                                  print('Imagen Ficha firmas guardada en: $filePath');
                                } else {
                                  print('Error al descargar la imagen. Código de estado: ${response.statusCode}');
                                }
                              } catch (e) {
                                print('Error al guardar la imagen: $e');
                              }

                              await SQLiteManager.instance.crearFichaFirma(
                                  idFichaFirmaMovil : ApiProniedCall.idFichaFirmaMovil(_model.apiResponseDatos?.jsonBody, i),
                                  idFicha: ApiProniedCall.idFichaFirmasfir(_model.apiResponseDatos?.jsonBody, i),
                                  idFichaFirma: ApiProniedCall.idFichaFirma(_model.apiResponseDatos?.jsonBody, i),
                                  nombres: ApiProniedCall.nombresfir(_model.apiResponseDatos?.jsonBody, i),
                                  apellidoPaterno: ApiProniedCall.apellidoPaternofir(_model.apiResponseDatos?.jsonBody, i),
                                  apellidoMaterno: ApiProniedCall.apellidoMaternofir(_model.apiResponseDatos?.jsonBody, i),
                                  nombreArchivo: ApiProniedCall.nombreArchivofir(_model.apiResponseDatos?.jsonBody, i),
                                  extension: ApiProniedCall.extensionfir(_model.apiResponseDatos?.jsonBody, i),
                                  peso: ApiProniedCall.pesofir(_model.apiResponseDatos?.jsonBody, i),
                                  tipoArchivo: ApiProniedCall.tipoArchivofir(_model.apiResponseDatos?.jsonBody, i),
                                  numDocumento: ApiProniedCall.numDocumentofir(_model.apiResponseDatos?.jsonBody, i),
                                  idTipoDocumento: ApiProniedCall.idTipoDocumentofir(_model.apiResponseDatos?.jsonBody, i),
                                  idTipoPersona: ApiProniedCall.idTipoPersonafir(_model.apiResponseDatos?.jsonBody, i),
                                  estadoAuditoria: ApiProniedCall.estadoAuditoriafir(_model.apiResponseDatos?.jsonBody, i),
                                  usuarioCreacionAuditoria: ApiProniedCall.usuarioCreacionAuditoriafir(_model.apiResponseDatos?.jsonBody, i),
                                  usuarioModificacionAuditoria: ApiProniedCall.usuarioModificacionAuditoriafir(_model.apiResponseDatos?.jsonBody, i),
                                  fechaCreacionAuditoria: ApiProniedCall.fechaCreacionAuditoriafir(_model.apiResponseDatos?.jsonBody, i),
                                  fechaModificacionAuditoria: ApiProniedCall.fechaModificacionAuditoriafir(_model.apiResponseDatos?.jsonBody, i),
                                  equipoCreacionAuditoria: ApiProniedCall.equipoCreacionAuditoriafir(_model.apiResponseDatos?.jsonBody, i),
                                  equipoModificacionAuditoria: ApiProniedCall.equipoModificacionAuditoriafir(_model.apiResponseDatos?.jsonBody, i),
                                  programaCreacionAuditoria: ApiProniedCall.programaCreacionAuditoriafir(_model.apiResponseDatos?.jsonBody, i),
                                  programaModificacionAuditoria: ApiProniedCall.programaModificacionAuditoriafir(_model.apiResponseDatos?.jsonBody, i),
                                  uploadDocumento: 1,
                                  ruta: ApiProniedCall.rutafir(_model.apiResponseDatos?.jsonBody, i),
                                  modificacionMovil: 0,
                                  rutalocal: filePath
                              );
                            }
                          }
                        }

                        var fichaArchivos = ApiProniedCall.fichaArchivos(_model.apiResponseDatos?.jsonBody);
                        if (fichaArchivos != null){
                          for (var i = 0; i<fichaArchivos.length; i++){
                            var rpta = await SQLiteManager.instance.VerificarSiExisteArchivoNotNUll(
                              idFicha: ApiProniedCall.idFichaArc(_model.apiResponseDatos?.jsonBody, i),
                              idFichaArchivo: ApiProniedCall.idFichaArchivoArc(_model.apiResponseDatos?.jsonBody, i),
                              idFichaArchivoMovil: ApiProniedCall.idFichaArchivoMovilArc(_model.apiResponseDatos?.jsonBody, i),
                            );
                            if( rpta.length > 0){
                              await SQLiteManager.instance.actualizarFichaArchivosAPI(
                                idFicha: ApiProniedCall.idFichaArc(_model.apiResponseDatos?.jsonBody, i),
                                idFichaArchivo: ApiProniedCall.idFichaArchivoArc(_model.apiResponseDatos?.jsonBody, i),
                                idFichaArchivoMovil: ApiProniedCall.idFichaArchivoMovilArc(_model.apiResponseDatos?.jsonBody, i),
                                nombre: ApiProniedCall.nombreArc(_model.apiResponseDatos?.jsonBody, i),
                                ruta: ApiProniedCall.rutaarc(_model.apiResponseDatos?.jsonBody, i),
                                peso: ApiProniedCall.pesoarc(_model.apiResponseDatos?.jsonBody, i),
                                extension: ApiProniedCall.extensionarc(_model.apiResponseDatos?.jsonBody, i),
                                estadoAuditoria: ApiProniedCall.estadoAuditoriaarc(_model.apiResponseDatos?.jsonBody, i),
                                usuarioCreacionAuditoria: ApiProniedCall.usuarioCreacionAuditoriaarc(_model.apiResponseDatos?.jsonBody, i),
                                usuarioModificacionAuditoria: ApiProniedCall.usuarioModificacionAuditoriaarc(_model.apiResponseDatos?.jsonBody, i),
                                fechaCreacionAuditoria: ApiProniedCall.fechaCreacionAuditoriaarc(_model.apiResponseDatos?.jsonBody, i),
                                fechaModificacionAuditoria: ApiProniedCall.fechaModificacionAuditoriaarc(_model.apiResponseDatos?.jsonBody, i),
                                equipoCreacionAuditoria: ApiProniedCall.equipoCreacionAuditoriaarc(_model.apiResponseDatos?.jsonBody, i),
                                equipoModificacionAuditoria: ApiProniedCall.equipoModificacionAuditoriaarc(_model.apiResponseDatos?.jsonBody, i),
                                programaCreacionAuditoria: ApiProniedCall.programaCreacionAuditoriaarc(_model.apiResponseDatos?.jsonBody, i),
                                programaModificacionAuditoria: ApiProniedCall.programaModificacionAuditoriaarc(_model.apiResponseDatos?.jsonBody, i),
                                modificadoMovil: 0,
                              );
                            } else {
                              var imageUrl = ApiProniedCall.rutaarc(_model.apiResponseDatos?.jsonBody, i);
                              var filePath = '';
                              try {
                                // Obtener el directorio de almacenamiento local
                                final appDir = await getApplicationDocumentsDirectory();
                                // Extraer el nombre del archivo de la URL
                                final fileName = imageUrl!.split('/').last;
                                // Construir la ruta completa del archivo
                                filePath = '${appDir.path}/$fileName';
                                // Realizar la solicitud HTTP para descargar la imagen
                                final response = await http.get(Uri.parse(imageUrl!));
                                if (response.statusCode == 200) {
                                  // Convertir los bytes de la respuesta a Uint8List
                                  Uint8List bytes = response.bodyBytes;
                                  // Guardar los bytes de la imagen en el archivo
                                  await File(filePath).writeAsBytes(bytes);
                                  print('Imagen FichaArchivos guardada en: $filePath');
                                } else {
                                  print('Error al descargar la imagen. Código de estado: ${response.statusCode}');
                                }
                              } catch (e) {
                                print('Error al guardar la imagen: $e');
                              }

                              await SQLiteManager.instance.crearFichaArchivo(
                                idFichaArchivoMovil: ApiProniedCall.idFichaArchivoMovilArc(_model.apiResponseDatos?.jsonBody, i),
                                idFicha: ApiProniedCall.idFichaArc(_model.apiResponseDatos?.jsonBody, i),
                                idFichaArchivo: ApiProniedCall.idFichaArchivoArc(_model.apiResponseDatos?.jsonBody, i),
                                nombre: ApiProniedCall.nombreArc(_model.apiResponseDatos?.jsonBody, i),
                                ruta: ApiProniedCall.rutaarc(_model.apiResponseDatos?.jsonBody, i),
                                peso: double.parse(ApiProniedCall.pesoarc(_model.apiResponseDatos?.jsonBody, i)!),
                                extension: ApiProniedCall.extensionarc(_model.apiResponseDatos?.jsonBody, i),
                                estadoAuditoria: ApiProniedCall.estadoAuditoriaarc(_model.apiResponseDatos?.jsonBody, i),
                                usuarioCreacionAuditoria: ApiProniedCall.usuarioCreacionAuditoriaarc(_model.apiResponseDatos?.jsonBody, i),
                                usuarioModificacionAuditoria: ApiProniedCall.usuarioModificacionAuditoriaarc(_model.apiResponseDatos?.jsonBody, i),
                                fechaCreacionAuditoria: ApiProniedCall.fechaCreacionAuditoriaarc(_model.apiResponseDatos?.jsonBody, i),
                                fechaModificacionAuditoria: ApiProniedCall.fechaModificacionAuditoriaarc(_model.apiResponseDatos?.jsonBody, i),
                                equipoCreacionAuditoria: ApiProniedCall.equipoCreacionAuditoriaarc(_model.apiResponseDatos?.jsonBody, i),
                                equipoModificacionAuditoria: ApiProniedCall.equipoModificacionAuditoriaarc(_model.apiResponseDatos?.jsonBody, i),
                                programaCreacionAuditoria: ApiProniedCall.programaCreacionAuditoriaarc(_model.apiResponseDatos?.jsonBody, i),
                                programaModificacionAuditoria: ApiProniedCall.programaModificacionAuditoriaarc(_model.apiResponseDatos?.jsonBody, i),
                                modificadoMovil: 0,
                                rutalocal: filePath,
                                uploadDocumento: 1,
                                comentario: ApiProniedCall.comentarioarc(_model.apiResponseDatos?.jsonBody, i),
                                titulo: ApiProniedCall.tituloarc(_model.apiResponseDatos?.jsonBody, i),
                              );

                            }
                          }
                        }

                        var fichaComentarios = ApiProniedCall.fichasPreguntasComentarios(_model.apiResponseDatos?.jsonBody);
                        if (fichaComentarios != null){
                          for (var i = 0; i<fichaComentarios.length; i++){
                            var rpta = await SQLiteManager.instance.VerificarSiExistePreguntaComentarioNotNUll(
                              idFicha: ApiProniedCall.idFichacomen(_model.apiResponseDatos?.jsonBody, i),
                              idPlantillaSeccion: ApiProniedCall.idPlantillaSeccioncomen(_model.apiResponseDatos?.jsonBody, i),
                              numeroRepeticion: ApiProniedCall.numeroRepeticioncomen(_model.apiResponseDatos?.jsonBody, i),
                              idPregunta: ApiProniedCall.idPreguntacomen(_model.apiResponseDatos?.jsonBody, i),
                            );
                            if(rpta.length > 0){
                              await SQLiteManager.instance.actualizarComentarioAPI(
                                  idFichaPreguntaComentarioLocal: ApiProniedCall.idFichaPreguntaComentarioMovilcomen(_model.apiResponseDatos?.jsonBody, i),
                                  idFichaPreguntaComentario: ApiProniedCall.idFichaPreguntaComentariocomen(_model.apiResponseDatos?.jsonBody, i),
                                  idFicha: ApiProniedCall.idFichacomen(_model.apiResponseDatos?.jsonBody, i),
                                  idPregunta: ApiProniedCall.idPreguntacomen(_model.apiResponseDatos?.jsonBody, i),
                                  idPlantillaSeccion: ApiProniedCall.idPlantillaSeccioncomen(_model.apiResponseDatos?.jsonBody, i),
                                  observacion: ApiProniedCall.observacioncomen(_model.apiResponseDatos?.jsonBody, i),
                                  numeroRepeticion: ApiProniedCall.numeroRepeticioncomen(_model.apiResponseDatos?.jsonBody, i),
                                  estadoAuditoria: ApiProniedCall.estadoAuditoriacomen(_model.apiResponseDatos?.jsonBody, i),
                                  usuarioCreacionAuditoria: ApiProniedCall.usuarioCreacionAuditoriacomen(_model.apiResponseDatos?.jsonBody, i),
                                  fechaCreacionAuditoria: ApiProniedCall.fechaCreacionAuditoriacomen(_model.apiResponseDatos?.jsonBody, i),
                                  equipoCreacionAuditoria: ApiProniedCall.equipoCreacionAuditoriacomen(_model.apiResponseDatos?.jsonBody, i),
                                  programaCreacionAuditoria: ApiProniedCall.programaCreacionAuditoriacomen(_model.apiResponseDatos?.jsonBody, i),
                                  usuarioModificacionAuditoria: ApiProniedCall.usuarioModificacionAuditoriacomen(_model.apiResponseDatos?.jsonBody, i),
                                  fechaModificacionAuditoria: ApiProniedCall.fechaModificacionAuditoriacomen(_model.apiResponseDatos?.jsonBody, i),
                                  equipoModificacionAuditoria: ApiProniedCall.equipoModificacionAuditoriacomen(_model.apiResponseDatos?.jsonBody, i),
                                  programaModificacionAuditoria: ApiProniedCall.programaModificacionAuditoriacomen(_model.apiResponseDatos?.jsonBody, i),
                                  modificadoMovil: 0
                              );
                            } else{
                              await SQLiteManager.instance.crearComentario(
                                  idFichaPreguntaComentario: ApiProniedCall.idFichaPreguntaComentariocomen(_model.apiResponseDatos?.jsonBody, i),
                                  idFicha: ApiProniedCall.idFichacomen(_model.apiResponseDatos?.jsonBody, i),
                                  idPregunta: ApiProniedCall.idPreguntacomen(_model.apiResponseDatos?.jsonBody, i),
                                  idPlantillaSeccion: ApiProniedCall.idPlantillaSeccioncomen(_model.apiResponseDatos?.jsonBody, i),
                                  observacion: ApiProniedCall.observacioncomen(_model.apiResponseDatos?.jsonBody, i),
                                  numeroRepeticion: ApiProniedCall.numeroRepeticioncomen(_model.apiResponseDatos?.jsonBody, i),
                                  estadoAuditoria: ApiProniedCall.estadoAuditoriacomen(_model.apiResponseDatos?.jsonBody, i),
                                  usuarioCreacionAuditoria: ApiProniedCall.usuarioCreacionAuditoriacomen(_model.apiResponseDatos?.jsonBody, i),
                                  fechaCreacionAuditoria: ApiProniedCall.fechaCreacionAuditoriacomen(_model.apiResponseDatos?.jsonBody, i),
                                  equipoCreacionAuditoria: ApiProniedCall.equipoCreacionAuditoriacomen(_model.apiResponseDatos?.jsonBody, i),
                                  programaCreacionAuditoria: ApiProniedCall.programaCreacionAuditoriacomen(_model.apiResponseDatos?.jsonBody, i),
                                  usuarioModificacionAuditoria: ApiProniedCall.usuarioModificacionAuditoriacomen(_model.apiResponseDatos?.jsonBody, i),
                                  fechaModificacionAuditoria: ApiProniedCall.fechaModificacionAuditoriacomen(_model.apiResponseDatos?.jsonBody, i),
                                  equipoModificacionAuditoria: ApiProniedCall.equipoModificacionAuditoriacomen(_model.apiResponseDatos?.jsonBody, i),
                                  programaModificacionAuditoria: ApiProniedCall.programaModificacionAuditoriacomen(_model.apiResponseDatos?.jsonBody, i),
                                  modificadoMovil: 0
                              );
                            }
                          }
                        }

                        var fichapreguntaAr = ApiProniedCall.fichasPreguntasArchivos(_model.apiResponseDatos?.jsonBody);
                        if (fichapreguntaAr != null){
                          for (var i= 0; i<fichapreguntaAr.length; i++){
                            var rpta = await SQLiteManager.instance.VerificarSiExistePreguntaArchivoNotNUll(
                              idFicha: ApiProniedCall.idFichaprear(_model.apiResponseDatos?.jsonBody, i),
                              IdFichaPreguntaArchivo: ApiProniedCall.idFichaPreguntaArchivo(_model.apiResponseDatos?.jsonBody, i),
                              IdFichaPreguntaArchivoLocal: ApiProniedCall.idFichaPreguntaArchivoMovil(_model.apiResponseDatos?.jsonBody, i),
                            );
                            if(rpta.length > 0){
                              await SQLiteManager.instance.actualizarPreguntaarchivoAPI(
                                  idFichaPreguntaArchivo: ApiProniedCall.idFichaPreguntaArchivo(_model.apiResponseDatos?.jsonBody, i),
                                  idFichaPreguntaArchivoLocal: ApiProniedCall.idFichaPreguntaArchivoMovil(_model.apiResponseDatos?.jsonBody, i),
                                  idFicha: ApiProniedCall.idFichaprear(_model.apiResponseDatos?.jsonBody, i),
                                  idPregunta: ApiProniedCall.idPreguntaprear(_model.apiResponseDatos?.jsonBody, i),
                                  idPlantillaSeccion: ApiProniedCall.idPlantillaSeccionprear(_model.apiResponseDatos?.jsonBody, i),
                                  nombre: ApiProniedCall.nombreprear(_model.apiResponseDatos?.jsonBody, i),
                                  ruta: ApiProniedCall.rutaprear(_model.apiResponseDatos?.jsonBody, i),
                                  peso: ApiProniedCall.pesoprear(_model.apiResponseDatos?.jsonBody, i),
                                  extension: ApiProniedCall.extensionprear(_model.apiResponseDatos?.jsonBody, i),
                                  estadoAuditoria: ApiProniedCall.estadoAuditoriaprear(_model.apiResponseDatos?.jsonBody, i),
                                  usuarioCreacionAuditoria: ApiProniedCall.usuarioCreacionAuditoriaprear(_model.apiResponseDatos?.jsonBody, i),
                                  fechaCreacionAuditoria: ApiProniedCall.fechaCreacionAuditoriaprear(_model.apiResponseDatos?.jsonBody, i),
                                  equipoCreacionAuditoria: ApiProniedCall.equipoCreacionAuditoriaprear(_model.apiResponseDatos?.jsonBody, i),
                                  programaCreacionAuditoria: ApiProniedCall.programaCreacionAuditoriaprear(_model.apiResponseDatos?.jsonBody, i),
                                  usuarioModificacionAuditoria: ApiProniedCall.usuarioModificacionAuditoriaprear(_model.apiResponseDatos?.jsonBody, i),
                                  fechaModificacionAuditoria: ApiProniedCall.fechaModificacionAuditoriaprear(_model.apiResponseDatos?.jsonBody, i),
                                  equipoModificacionAuditoria: ApiProniedCall.equipoModificacionAuditoriaprear(_model.apiResponseDatos?.jsonBody, i),
                                  programaModificacionAuditoria: ApiProniedCall.programaModificacionAuditoriaprear(_model.apiResponseDatos?.jsonBody, i),
                                  modificadoMovil: 0,
                                  numeroRepeticion: ApiProniedCall.numeroRepeticionprear(_model.apiResponseDatos?.jsonBody, i),
                                  uploadDocumento: 1
                              );
                            } else {
                              var imageUrl = ApiProniedCall.rutaprear(_model.apiResponseDatos?.jsonBody, i);
                              var filePath = '';
                              try {
                                // Obtener el directorio de almacenamiento local
                                final appDir = await getApplicationDocumentsDirectory();
                                // Extraer el nombre del archivo de la URL
                                final fileName = imageUrl!.split('/').last;
                                // Construir la ruta completa del archivo
                                filePath = '${appDir.path}/$fileName';
                                // Realizar la solicitud HTTP para descargar la imagen
                                final response = await http.get(Uri.parse(imageUrl!));
                                if (response.statusCode == 200) {
                                  // Convertir los bytes de la respuesta a Uint8List
                                  Uint8List bytes = response.bodyBytes;
                                  // Guardar los bytes de la imagen en el archivo
                                  await File(filePath).writeAsBytes(bytes);
                                  print('Imagen FichaPreguntaArchivo guardada en: $filePath');
                                } else {
                                  print('Error al descargar la imagen. Código de estado: ${response.statusCode}');
                                }
                              } catch (e) {
                                print('Error al guardar la imagen: $e');
                              }
                              await SQLiteManager.instance.CrearPreguntaArchivoAPI(
                                idFichaPreguntaArchivo: ApiProniedCall.idFichaPreguntaArchivoMovil(_model.apiResponseDatos?.jsonBody, i),
                                idFicha: ApiProniedCall.idFichaprear(_model.apiResponseDatos?.jsonBody, i),
                                idPregunta: ApiProniedCall.idPreguntaprear(_model.apiResponseDatos?.jsonBody, i),
                                idPlantillaSeccion: ApiProniedCall.idPlantillaSeccionprear(_model.apiResponseDatos?.jsonBody, i),
                                nombre: ApiProniedCall.nombreprear(_model.apiResponseDatos?.jsonBody, i),
                                ruta: ApiProniedCall.rutaprear(_model.apiResponseDatos?.jsonBody, i),
                                peso: ApiProniedCall.pesoprear(_model.apiResponseDatos?.jsonBody, i),
                                extension: ApiProniedCall.extensionprear(_model.apiResponseDatos?.jsonBody, i),
                                estadoAuditoria: ApiProniedCall.estadoAuditoriaprear(_model.apiResponseDatos?.jsonBody, i),
                                usuarioCreacionAuditoria: ApiProniedCall.usuarioCreacionAuditoriaprear(_model.apiResponseDatos?.jsonBody, i),
                                usuarioModificacionAuditoria: ApiProniedCall.usuarioModificacionAuditoriaprear(_model.apiResponseDatos?.jsonBody, i),
                                fechaCreacionAuditoria: ApiProniedCall.fechaCreacionAuditoriaprear(_model.apiResponseDatos?.jsonBody, i),
                                fechaModificacionAuditoria: ApiProniedCall.fechaModificacionAuditoriaprear(_model.apiResponseDatos?.jsonBody, i),
                                equipoCreacionAuditoria: ApiProniedCall.equipoCreacionAuditoriaprear(_model.apiResponseDatos?.jsonBody, i),
                                equipoModificacionAuditoria: ApiProniedCall.equipoModificacionAuditoriaprear(_model.apiResponseDatos?.jsonBody, i),
                                programaCreacionAuditoria: ApiProniedCall.programaCreacionAuditoriaprear(_model.apiResponseDatos?.jsonBody, i),
                                programaModificacionAuditoria: ApiProniedCall.programaModificacionAuditoriaprear(_model.apiResponseDatos?.jsonBody, i),
                                modificadoMovil: 0,
                                rutaLocal: filePath,
                                uploadDocumento: 1,
                                numeroRepeticion: ApiProniedCall.numeroRepeticionprear(_model.apiResponseDatos?.jsonBody, i),
                              );
                            }
                          }
                        }

                        var inspecciones = ApiProniedCall.listName(_model.apiResponseDatos?.jsonBody);
                        if (inspecciones != null) {
                          for (var i = 0; i < inspecciones.length; i++) {
                            var existe = await SQLiteManager.instance.VerificarSiExisteInspeccion(
                              idInspeccion: ApiProniedCall.idInspeccion(_model.apiResponseDatos?.jsonBody, i),
                            );
                            if (existe.length > 0) {
                              await SQLiteManager.instance.actualizarInspeccionesApi(
                                dniInspector: ApiProniedCall.dniInspeccion(_model.apiResponseDatos?.jsonBody, i),
                                idInspeccion: ApiProniedCall.idInspeccion(_model.apiResponseDatos?.jsonBody, i),
                                nombreEvento: ApiProniedCall.nombreInspeccion(_model.apiResponseDatos?.jsonBody, i),
                                idFicha: ApiProniedCall.idFichaIns(_model.apiResponseDatos?.jsonBody, i),
                                idPlantilla: ApiProniedCall.idPlantillaId(_model.apiResponseDatos?.jsonBody, i),
                                codigoLocalColegio: ApiProniedCall.codigoLocalIns(_model.apiResponseDatos?.jsonBody, i),
                                nombreLocalColegio: ApiProniedCall.nombreLocalIns(_model.apiResponseDatos?.jsonBody, i),
                                departamentoColegio: ApiProniedCall.departamentoInst(_model.apiResponseDatos?.jsonBody, i),
                                provinciaColegio: ApiProniedCall.provinciaIns(_model.apiResponseDatos?.jsonBody, i),
                                distritoColegio: ApiProniedCall.destritoIns(_model.apiResponseDatos?.jsonBody, i),
                                idEstado: ApiProniedCall.idEstadoIns(_model.apiResponseDatos?.jsonBody, i),
                                estado: ApiProniedCall.estadoIns(_model.apiResponseDatos?.jsonBody, i),
                                usuarioCreacionAuditoria: ApiProniedCall.usuarioCreacionAuditoriains(_model.apiResponseDatos?.jsonBody, i),
                                usuarioModificacionAuditoria: ApiProniedCall.usuarioModificacionAuditoriains(_model.apiResponseDatos?.jsonBody, i),
                                fechaCreacionAuditoria: ApiProniedCall.fechaCreacionAuditoriains(_model.apiResponseDatos?.jsonBody, i),
                                fechaModificacionAuditoria: ApiProniedCall.fechaModificacionAuditoriains(_model.apiResponseDatos?.jsonBody, i),
                                equipoCreacionAuditoria: ApiProniedCall.equipoCreacionAuditoriains(_model.apiResponseDatos?.jsonBody, i),
                                equipoModificacionAuditoria: ApiProniedCall.equipoModificacionAuditoriains(_model.apiResponseDatos?.jsonBody, i),
                                programaModificacionAuditoria: ApiProniedCall.programaModificacionAuditoriains(_model.apiResponseDatos?.jsonBody, i),
                                programaCreacionAuditoria: ApiProniedCall.programaCreacionAuditoriains(_model.apiResponseDatos?.jsonBody, i),

                              );
                              await SQLiteManager.instance.inspeccion0(
                                  idFicha: ApiProniedCall.idFichaIns(_model.apiResponseDatos?.jsonBody, i)
                              );
                            } else {
                              await SQLiteManager.instance.cargarData(
                                idInspeccion: ApiProniedCall.idInspeccion(_model.apiResponseDatos?.jsonBody, i),
                                dniIns: ApiProniedCall.dniInspeccion(_model.apiResponseDatos?.jsonBody, i),
                                nombreIns: ApiProniedCall.nombreInspeccion(_model.apiResponseDatos?.jsonBody, i),
                                idFichaIns: ApiProniedCall.idFichaIns(_model.apiResponseDatos?.jsonBody, i),
                                idPlantillaIns: ApiProniedCall.idPlantillaId(_model.apiResponseDatos?.jsonBody, i),
                                codigolocalIns: ApiProniedCall.codigoLocalIns(_model.apiResponseDatos?.jsonBody, i),
                                nombreLocalIns: ApiProniedCall.nombreLocalIns(_model.apiResponseDatos?.jsonBody, i),
                                departamentoIns: ApiProniedCall.departamentoInst(_model.apiResponseDatos?.jsonBody, i),
                                provinciaIns: ApiProniedCall.provinciaIns(_model.apiResponseDatos?.jsonBody, i),
                                distritoIns: ApiProniedCall.destritoIns(_model.apiResponseDatos?.jsonBody, i),
                                idEstadoIns: ApiProniedCall.idEstadoIns(_model.apiResponseDatos?.jsonBody, i),
                                estadoIns: ApiProniedCall.estadoIns(_model.apiResponseDatos?.jsonBody, i),
                                usuarioCreacionAuditoria: ApiProniedCall.usuarioCreacionAuditoriains(_model.apiResponseDatos?.jsonBody, i),
                                usuarioModificacionAuditoria: ApiProniedCall.usuarioModificacionAuditoriains(_model.apiResponseDatos?.jsonBody, i),
                                fechaCreacionAuditoria: ApiProniedCall.fechaCreacionAuditoriains(_model.apiResponseDatos?.jsonBody, i),
                                fechaModificacionAuditoria: ApiProniedCall.fechaModificacionAuditoriains(_model.apiResponseDatos?.jsonBody, i),
                                equipoCreacionAuditoria: ApiProniedCall.equipoCreacionAuditoriains(_model.apiResponseDatos?.jsonBody, i),
                                equipoModificacionAuditoria: ApiProniedCall.equipoModificacionAuditoriains(_model.apiResponseDatos?.jsonBody, i),
                                programaCreacionAuditoria: ApiProniedCall.programaCreacionAuditoriains(_model.apiResponseDatos?.jsonBody, i),
                                programaModificacionAuditoria: ApiProniedCall.programaModificacionAuditoriains(_model.apiResponseDatos?.jsonBody, i),
                              );
                            }
                          }
                        }
                        ///CAMBIANDO ESTADO 3

                        List<dynamic> resultado = [];
                        for ( var c in colasincro) {
                          await SQLiteManager.instance.actualizarestaFichaCola3(
                              idCola: c.idCola
                          );
                          resultado.add(c);
                        }
                        //print(resultado);

                        for(var r in resultado){
                          if(r.tipoDato == "ficha"){
                            await SQLiteManager.instance.ActualizarFichaModificacion0(
                                idFicha: r.idDatoServer
                            );
                          } if (r.tipoDato == "fichamodular") {
                            await SQLiteManager.instance.ActualizarFichaModularModificacion0(
                                idFichaModular: r.idDatoServer
                            );
                          } else {
                            await SQLiteManager.instance.ActualizarFichaRespuestaModificacion0(
                                idFichaPreguntaRespuesta: r.idDatoServer
                            );
                          }
                        }

                        ///Actualizando ColaSinc
                        var sincros = ApiProniedCall.sincro(_model.apiResponseDatos?.jsonBody);
                        if (sincros != null){
                          await SQLiteManager.instance.actualizarSincAPI(
                            idSincroServer: ApiProniedCall.idSincroServer(_model.apiResponseDatos?.jsonBody),
                            idEstadoSincronizacion: ApiProniedCall.idEstadoSincronizacion(_model.apiResponseDatos?.jsonBody),
                            inspeccionesCargadasServer: ApiProniedCall.inspeccionesCargadasServer(_model.apiResponseDatos?.jsonBody),
                            inspeccionesDescargadasServer: ApiProniedCall.inspeccionesDescargadasServer(_model.apiResponseDatos?.jsonBody),
                            idSincroMovil: ApiProniedCall.idSincroMovil(_model.apiResponseDatos?.jsonBody),
                          );
                        }

                        log(ConstansTetx.sinconizacion_finalizado);


                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              ConstAlerts.sincronizacion_exitosa,
                              style: TextStyle(
                                color:
                                FlutterFlowTheme.of(context).secondaryBackground,
                              ),
                            ),
                            duration: const Duration(milliseconds: 4000),
                            backgroundColor: FlutterFlowTheme.of(context).primary,
                          ),
                        );
                      }
                      else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              ConstAlerts.error_sincronizar,
                              style: TextStyle(
                                color:
                                FlutterFlowTheme.of(context).secondaryBackground,
                              ),
                            ),
                            duration: const Duration(milliseconds: 4000),
                            backgroundColor: FlutterFlowTheme.of(context).primary,
                          ),
                        );
                      }
                    }
                  }
                  else{
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          ConstAlerts.no_internet,
                          style: TextStyle(
                            color:
                            FlutterFlowTheme.of(context).secondaryBackground,
                          ),
                        ),
                        duration: const Duration(milliseconds: 4000),
                        backgroundColor: FlutterFlowTheme.of(context).primary,
                      ),
                    );
                  }

                  Navigator.pop(context);
                  context.pushNamed(
                  'ListaInspecciones');
                  setState(() {});
                },
                text: ConstansTetx.aceptar,
                options: FFButtonOptions(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                  EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).error,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Outfit',
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
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
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
              child: FFButtonWidget(
                onPressed: () async {
                  Navigator.pop(context);
                },
                text: ConstansTetx.cancelar,
                options: FFButtonOptions(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                  EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Outfit',
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontWeight: FontWeight.bold,
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
          ],
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
