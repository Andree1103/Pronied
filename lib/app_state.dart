import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import '/backend/sqlite/sqlite_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_formularioState')) {
        try {
          final serializedData = prefs.getString('ff_formularioState') ?? '{}';
          _formularioState =
              FormularioStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _foto = prefs.getString('ff_foto') ?? _foto;
    });
    _safeInit(() {
      _IdFirma = prefs.getInt('ff_IdFirma') ?? _IdFirma;
    });
    _safeInit(() {
      _IdFoto = prefs.getInt('ff_IdFoto') ?? _IdFoto;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  FormularioStruct _formularioState = FormularioStruct();
  FormularioStruct get formularioState => _formularioState;
  set formularioState(FormularioStruct _value) {
    _formularioState = _value;
    prefs.setString('ff_formularioState', _value.serialize());
  }

  void updateFormularioStateStruct(Function(FormularioStruct) updateFn) {
    updateFn(_formularioState);
    prefs.setString('ff_formularioState', _formularioState.serialize());
  }

  String _foto = '';
  String get foto => _foto;
  set foto(String _value) {
    _foto = _value;
    prefs.setString('ff_foto', _value);
  }

  int _IdFirma = 0;
  int get IdFirma => _IdFirma;
  set IdFirma(int _value) {
    _IdFirma = _value;
    prefs.setInt('ff_IdFirma', _value);
  }

  int _IdFoto = 0;
  int get IdFoto => _IdFoto;
  set IdFoto(int _value) {
    _IdFoto = _value;
    prefs.setInt('ff_IdFoto', _value);
  }

  int _IdFicha = 0;
  int get IdFicha => _IdFicha;
  set IdFicha(int _value) {
    _IdFicha = _value;
  }

  int _IdSincro = 0;
  int get IdSincro => _IdSincro;
  set IdSincro(int _value) {
    _IdSincro = _value;
  }

  int _IdSecUtil = 0;
  int get IdSecUtil => _IdSecUtil;
  set IdSecUtil(int _value) {
    _IdSecUtil = _value;
  }

  int _CantA = 0;
  int get CantA => _CantA;
  set CantA(int _value) {
    _CantA = _value;
  }
  int _CantP = 0;
  int get CantP => _CantP;
  set CantP(int _value) {
    _CantP = _value;
  }
  int _CantS = 0;
  int get CantS => _CantS;
  set CantS(int _value) {
    _CantS = _value;
  }

  int _idPlantillaSeccionPadre = 0;
  int get idPlantillaSeccionPadre => _idPlantillaSeccionPadre;
  set idPlantillaSeccionPadre(int _value) {
    _idPlantillaSeccionPadre = _value;
  }

  int _idpregunta = 0;
  int get idpregunta => _idpregunta;
  set idpregunta(int _value) {
    _idpregunta = _value;
  }

  int _IdPlantilla = 0;
  int get IdPlantilla => _IdPlantilla;
  set IdPlantilla(int _value) {
    _IdPlantilla = _value;
  }

  int _idPlantillaSeccion = 0;
  int get idPlantillaSeccion => _idPlantillaSeccion;
  set idPlantillaSeccion(int _value) {
    _idPlantillaSeccion = _value;
  }

  String _nrmRepeticion = '';
  String get nrmRepeticion => _nrmRepeticion;
  set nrmRepeticion(String _value) {
    _nrmRepeticion = _value;
  }

  String _nomSeccion= '';
  String get nomSeccion => _nomSeccion;
  set nomSeccion(String _value) {
    _nomSeccion = _value;
  }

  String _nombresubSeccion= '';
  String get nombresubSeccion => _nombresubSeccion;
  set nombresubSeccion(String _value) {
    _nombresubSeccion = _value;
  }

  String _username= '';
  String get username => _username;
  set username(String _value) {
    _username = _value;
  }
  String _cummovil= '';
  String get cummovil => _cummovil;
  set cummovil(String _value) {
    _cummovil = _value;
  }

  String _programacreacion= '';
  String get programacreacion => _programacreacion;
  set programacreacion(String _value) {
    _programacreacion = _value;
  }

  String _rol= '';
  String get rol => _rol;
  set rol(String _value) {
    _rol = _value;
  }

  String _nombrecompletouser= '';
  String get nombrecompletouser => _nombrecompletouser;
  set nombrecompletouser(String _value) {
    _nombrecompletouser = _value;
  }

  String _ubicacionuser= '';
  String get ubicacionuse => _ubicacionuser;
  set ubicacionuse(String _value) {
    _ubicacionuser = _value;
  }

  String _estadoInspeccion= '';
  String get estadoInspeccion => _estadoInspeccion;
  set estadoInspeccion(String _value) {
    _estadoInspeccion = _value;
  }

  String _tokenFinal= '';
  String get tokenFinal => _tokenFinal;
  set tokenFinal(String _value) {
    _tokenFinal = _value;
  }

  String _descPregunta= '';
  String get descPregunta => _descPregunta;
  set descPregunta(String _value) {
    _descPregunta = _value;
  }

  int _idestadoInspeccion = 0;
  int get idestadoInspeccion => _idestadoInspeccion;
  set idestadoInspeccion(int _value) {
    _idestadoInspeccion = _value;
  }

  int _idInspeccion = 0;
  int get idInspeccion => _idInspeccion;
  set idInspeccion(int _value) {
    _idInspeccion = _value;
  }

  int _idPregunta = 0;
  int get idPregunta => _idPregunta;
  set idPregunta(int _value) {
    _idPregunta = _value;
  }

  int _countArchivo = 0;
  int get countArchivo => _countArchivo;
  set countArchivo(int _value) {
    _countArchivo = _value;
  }

  double _Latitud = 0;
  double get latitud => _Latitud;
  set latitud(double _value) {
    _Latitud = _value;
  }

  double _Longitud = 0;
  double get longitud => _Longitud;
  set longitud(double _value) {
    _Longitud = _value;
  }

}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
