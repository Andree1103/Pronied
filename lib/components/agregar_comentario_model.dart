import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'agregar_comentario_widget.dart' show AgregarComentarioWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AgregarComentarioModel extends FlutterFlowModel<AgregarComentarioWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Dat1 widget.
  FocusNode? dat1FocusNode;
  TextEditingController? dat1Controller;
  String? Function(BuildContext, String?)? dat1ControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    dat1FocusNode?.dispose();
    dat1Controller?.dispose();
  }
}
