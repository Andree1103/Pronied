// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FormularioStruct extends BaseStruct {
  FormularioStruct({
    String? dni,
    String? nombre,
    String? email,
    int? celular,
    String? dreugel,
  })  : _dni = dni,
        _nombre = nombre,
        _email = email,
        _celular = celular,
        _dreugel = dreugel;

  // "dni" field.
  String? _dni;
  String get dni => _dni ?? '';
  set dni(String? val) => _dni = val;
  bool hasDni() => _dni != null;

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  set nombre(String? val) => _nombre = val;
  bool hasNombre() => _nombre != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;
  bool hasEmail() => _email != null;

  // "celular" field.
  int? _celular;
  int get celular => _celular ?? 0;
  set celular(int? val) => _celular = val;
  void incrementCelular(int amount) => _celular = celular + amount;
  bool hasCelular() => _celular != null;

  // "dreugel" field.
  String? _dreugel;
  String get dreugel => _dreugel ?? '';
  set dreugel(String? val) => _dreugel = val;
  bool hasDreugel() => _dreugel != null;

  static FormularioStruct fromMap(Map<String, dynamic> data) =>
      FormularioStruct(
        dni: data['dni'] as String?,
        nombre: data['nombre'] as String?,
        email: data['email'] as String?,
        celular: castToType<int>(data['celular']),
        dreugel: data['dreugel'] as String?,
      );

  static FormularioStruct? maybeFromMap(dynamic data) => data is Map
      ? FormularioStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'dni': _dni,
        'nombre': _nombre,
        'email': _email,
        'celular': _celular,
        'dreugel': _dreugel,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'dni': serializeParam(
          _dni,
          ParamType.String,
        ),
        'nombre': serializeParam(
          _nombre,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'celular': serializeParam(
          _celular,
          ParamType.int,
        ),
        'dreugel': serializeParam(
          _dreugel,
          ParamType.String,
        ),
      }.withoutNulls;

  static FormularioStruct fromSerializableMap(Map<String, dynamic> data) =>
      FormularioStruct(
        dni: deserializeParam(
          data['dni'],
          ParamType.String,
          false,
        ),
        nombre: deserializeParam(
          data['nombre'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        celular: deserializeParam(
          data['celular'],
          ParamType.int,
          false,
        ),
        dreugel: deserializeParam(
          data['dreugel'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'FormularioStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FormularioStruct &&
        dni == other.dni &&
        nombre == other.nombre &&
        email == other.email &&
        celular == other.celular &&
        dreugel == other.dreugel;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([dni, nombre, email, celular, dreugel]);
}

FormularioStruct createFormularioStruct({
  String? dni,
  String? nombre,
  String? email,
  int? celular,
  String? dreugel,
}) =>
    FormularioStruct(
      dni: dni,
      nombre: nombre,
      email: email,
      celular: celular,
      dreugel: dreugel,
    );
