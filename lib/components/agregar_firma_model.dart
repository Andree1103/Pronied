import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'agregar_firma_widget.dart' show AgregarFirmaWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:signature/signature.dart';

class AgregarFirmaModel extends FlutterFlowModel<AgregarFirmaWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for Dat1 widget.
  FocusNode? dat1FocusNode1;
  TextEditingController? dat1Controller1;
  String? Function(BuildContext, String?)? dat1Controller1Validator;
  // State field(s) for Dat1 widget.
  FocusNode? dat1FocusNode2;
  TextEditingController? dat1Controller2;
  String? Function(BuildContext, String?)? dat1Controller2Validator;
  // State field(s) for Dat1 widget.
  FocusNode? dat1FocusNode3;
  TextEditingController? dat1Controller3;
  String? Function(BuildContext, String?)? dat1Controller3Validator;
  // State field(s) for Dat1 widget.
  FocusNode? dat1FocusNode4;
  TextEditingController? dat1Controller4;
  String? Function(BuildContext, String?)? dat1Controller4Validator;
  // State field(s) for Signature widget.
  SignatureController? signatureController;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
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
