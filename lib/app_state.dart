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

  String _username= '';
  String get username => _username;
  set username(String _value) {
    _username = _value;
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
