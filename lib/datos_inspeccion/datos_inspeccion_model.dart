import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'datos_inspeccion_widget.dart' show DatosInspeccionWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DatosInspeccionModel extends FlutterFlowModel<DatosInspeccionWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Dat1 widget.
  FocusNode? dat1FocusNode;
  TextEditingController? dat1Controller;
  String? Function(BuildContext, String?)? dat1ControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    dat1FocusNode?.dispose();
    dat1Controller?.dispose();
  }

/// Action blocks are added here.

/// Additional helper methods are added here.
}
