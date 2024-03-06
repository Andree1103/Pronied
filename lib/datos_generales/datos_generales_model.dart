import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'datos_generales_widget.dart' show DatosGeneralesWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DatosGeneralesModel extends FlutterFlowModel<DatosGeneralesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for Dat1 widget.
  FocusNode? dat1FocusNode1;
  TextEditingController? dat1Controller1;
  String? Function(BuildContext, String?)? dat1Controller1Validator;
  // State field(s) for Dat1 widget.
  FocusNode? dat1FocusNode2;
  TextEditingController? dat1Controller2;
  String? Function(BuildContext, String?)? dat1Controller2Validator;
  // State field(s) for Dat1 widget.
  String? dat1Value;
  FormFieldController<String>? dat1ValueController;
  // State field(s) for Dat1 widget.
  FocusNode? dat1FocusNode3;
  TextEditingController? dat1Controller3;
  String? Function(BuildContext, String?)? dat1Controller3Validator;
  // State field(s) for Dat1 widget.
  FocusNode? dat1FocusNode4;
  TextEditingController? dat1Controller4;
  String? Function(BuildContext, String?)? dat1Controller4Validator;
  // State field(s) for Dat1 widget.
  FocusNode? dat1FocusNode5;
  TextEditingController? dat1Controller5;
  String? Function(BuildContext, String?)? dat1Controller5Validator;
  // State field(s) for Dat1 widget.
  FocusNode? dat1FocusNode6;
  TextEditingController? dat1Controller6;
  String? Function(BuildContext, String?)? dat1Controller6Validator;
  // State field(s) for Dat1 widget.
  FocusNode? dat1FocusNode7;
  TextEditingController? dat1Controller7;
  String? Function(BuildContext, String?)? dat1Controller7Validator;
  // State field(s) for Dat1 widget.
  FocusNode? dat1FocusNode8;
  TextEditingController? dat1Controller8;
  String? Function(BuildContext, String?)? dat1Controller8Validator;
  // State field(s) for Dat1 widget.
  FocusNode? dat1FocusNode9;
  TextEditingController? dat1Controller9;
  String? Function(BuildContext, String?)? dat1Controller9Validator;
  // State field(s) for Dat1 widget.
  FocusNode? dat1FocusNode10;
  TextEditingController? dat1Controller10;
  String? Function(BuildContext, String?)? dat1Controller10Validator;
  // State field(s) for Dat1 widget.
  FocusNode? dat1FocusNode11;
  TextEditingController? dat1Controller11;
  String? Function(BuildContext, String?)? dat1Controller11Validator;
  // State field(s) for Dat1 widget.
  FocusNode? dat1FocusNode12;
  TextEditingController? dat1Controller12;
  String? Function(BuildContext, String?)? dat1Controller12Validator;
  // State field(s) for Dat1 widget.
  FocusNode? dat1FocusNode13;
  TextEditingController? dat1Controller13;
  String? Function(BuildContext, String?)? dat1Controller13Validator;
  // State field(s) for Dat1 widget.
  FocusNode? dat1FocusNode14;
  TextEditingController? dat1Controller14;
  String? Function(BuildContext, String?)? dat1Controller14Validator;
  // State field(s) for Dat1 widget.
  FocusNode? dat1FocusNode15;
  TextEditingController? dat1Controller15;
  String? Function(BuildContext, String?)? dat1Controller15Validator;
  // State field(s) for Dat1 widget.
  FocusNode? dat1FocusNode16;
  TextEditingController? dat1Controller16;
  String? Function(BuildContext, String?)? dat1Controller16Validator;
  String? _dat1Controller16Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Email no valido';
    }
    return null;
  }

  // State field(s) for Dat1 widget.
  FocusNode? dat1FocusNode17;
  TextEditingController? dat1Controller17;
  String? Function(BuildContext, String?)? dat1Controller17Validator;
  // State field(s) for Dat1 widget.
  FocusNode? dat1FocusNode18;
  TextEditingController? dat1Controller18;
  String? Function(BuildContext, String?)? dat1Controller18Validator;
  // State field(s) for Dat1 widget.
  FocusNode? dat1FocusNode19;
  TextEditingController? dat1Controller19;
  String? Function(BuildContext, String?)? dat1Controller19Validator;
  // State field(s) for Dat1 widget.
  FocusNode? dat1FocusNode20;
  TextEditingController? dat1Controller20;
  String? Function(BuildContext, String?)? dat1Controller20Validator;
  String? _dat1Controller20Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Eamil no valido';
    }
    return null;
  }

  // State field(s) for Dat1 widget.
  FocusNode? dat1FocusNode21;
  TextEditingController? dat1Controller21;
  String? Function(BuildContext, String?)? dat1Controller21Validator;
  // State field(s) for Dat1 widget.
  FocusNode? dat1FocusNode22;
  TextEditingController? dat1Controller22;
  String? Function(BuildContext, String?)? dat1Controller22Validator;
  // State field(s) for Dat1 widget.
  FocusNode? dat1FocusNode23;
  TextEditingController? dat1Controller23;
  String? Function(BuildContext, String?)? dat1Controller23Validator;
  // State field(s) for Dat1 widget.
  FocusNode? dat1FocusNode24;
  TextEditingController? dat1Controller24;
  String? Function(BuildContext, String?)? dat1Controller24Validator;
  // State field(s) for Dat1 widget.
  FocusNode? dat1FocusNode25;
  TextEditingController? dat1Controller25;
  String? Function(BuildContext, String?)? dat1Controller25Validator;
  // State field(s) for Dat1 widget.
  FocusNode? dat1FocusNode26;
  TextEditingController? dat1Controller26;
  String? Function(BuildContext, String?)? dat1Controller26Validator;
  // State field(s) for Dat1 widget.
  FocusNode? dat1FocusNode27;
  TextEditingController? dat1Controller27;
  String? Function(BuildContext, String?)? dat1Controller27Validator;
  // State field(s) for Dat1 widget.
  FocusNode? dat1FocusNode28;
  TextEditingController? dat1Controller28;
  String? Function(BuildContext, String?)? dat1Controller28Validator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    dat1Controller16Validator = _dat1Controller16Validator;
    dat1Controller20Validator = _dat1Controller20Validator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    dat1FocusNode1?.dispose();
    dat1Controller1?.dispose();

    dat1FocusNode2?.dispose();
    dat1Controller2?.dispose();

    dat1FocusNode3?.dispose();
    dat1Controller3?.dispose();

    dat1FocusNode4?.dispose();
    dat1Controller4?.dispose();

    dat1FocusNode5?.dispose();
    dat1Controller5?.dispose();

    dat1FocusNode6?.dispose();
    dat1Controller6?.dispose();

    dat1FocusNode7?.dispose();
    dat1Controller7?.dispose();

    dat1FocusNode8?.dispose();
    dat1Controller8?.dispose();

    dat1FocusNode9?.dispose();
    dat1Controller9?.dispose();

    dat1FocusNode10?.dispose();
    dat1Controller10?.dispose();

    dat1FocusNode11?.dispose();
    dat1Controller11?.dispose();

    dat1FocusNode12?.dispose();
    dat1Controller12?.dispose();

    dat1FocusNode13?.dispose();
    dat1Controller13?.dispose();

    dat1FocusNode14?.dispose();
    dat1Controller14?.dispose();

    dat1FocusNode15?.dispose();
    dat1Controller15?.dispose();

    dat1FocusNode16?.dispose();
    dat1Controller16?.dispose();

    dat1FocusNode17?.dispose();
    dat1Controller17?.dispose();

    dat1FocusNode18?.dispose();
    dat1Controller18?.dispose();

    dat1FocusNode19?.dispose();
    dat1Controller19?.dispose();

    dat1FocusNode20?.dispose();
    dat1Controller20?.dispose();

    dat1FocusNode21?.dispose();
    dat1Controller21?.dispose();

    dat1FocusNode22?.dispose();
    dat1Controller22?.dispose();

    dat1FocusNode23?.dispose();
    dat1Controller23?.dispose();

    dat1FocusNode24?.dispose();
    dat1Controller24?.dispose();

    dat1FocusNode25?.dispose();
    dat1Controller25?.dispose();

    dat1FocusNode26?.dispose();
    dat1Controller26?.dispose();

    dat1FocusNode27?.dispose();
    dat1Controller27?.dispose();

    dat1FocusNode28?.dispose();
    dat1Controller28?.dispose();
  }

/// Action blocks are added here.

/// Additional helper methods are added here.
}
