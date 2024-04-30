import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'add_firma_widget.dart' show AddFirmaWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:signature/signature.dart';

class AddFirmaModel extends FlutterFlowModel<AddFirmaWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for DropDown widget.
  int? dropDownValue1;
  FormFieldController<int>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for Dat1 widget.
  FocusNode? dat1FocusNode1;
  TextEditingController? dat1Controller1;
  String? Function(BuildContext, String?)? dat1Controller1Validator;
  String? _dat1Controller1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo Obligatorio';
    }

    if (val.length < 8) {
      return 'Mínimo 8 caracteres';
    }
    if (val.length > 20) {
      return 'Máximo 20 caracteres';
    }

    return null;
  }

  // State field(s) for Dat1 widget.
  FocusNode? dat1FocusNode2;
  TextEditingController? dat1Controller2;
  String? Function(BuildContext, String?)? dat1Controller2Validator;
  String? _dat1Controller2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo Obligatorio';
    }

    if (val.length > 100) {
      return 'Máximo 100 caracteres';
    }

    return null;
  }

  // State field(s) for Dat1 widget.
  FocusNode? dat1FocusNode3;
  TextEditingController? dat1Controller3;
  String? Function(BuildContext, String?)? dat1Controller3Validator;
  String? _dat1Controller3Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo Obligatorio';
    }

    if (val.length > 100) {
      return 'Máximo 100 caracteres';
    }

    return null;
  }

  // State field(s) for Dat1 widget.
  FocusNode? dat1FocusNode4;
  TextEditingController? dat1Controller4;
  String? Function(BuildContext, String?)? dat1Controller4Validator;
  String? _dat1Controller4Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo Obligatorio';
    }

    if (val.length > 100) {
      return 'Máximo 100 caracteres';
    }

    return null;
  }

  // State field(s) for Signature widget.
  SignatureController? signatureController;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    dat1Controller1Validator = _dat1Controller1Validator;
    dat1Controller2Validator = _dat1Controller2Validator;
    dat1Controller3Validator = _dat1Controller3Validator;
    dat1Controller4Validator = _dat1Controller4Validator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    dat1FocusNode1?.dispose();
    dat1Controller1?.dispose();

    dat1FocusNode2?.dispose();
    dat1Controller2?.dispose();

    dat1FocusNode3?.dispose();
    dat1Controller3?.dispose();

    dat1FocusNode4?.dispose();
    dat1Controller4?.dispose();

    signatureController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
