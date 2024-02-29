import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import 'agregar_foto_widget.dart' show AgregarFotoWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class AgregarFotoModel extends FlutterFlowModel<AgregarFotoWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Dat1 widget.
  FocusNode? dat1FocusNode1;
  TextEditingController? dat1Controller1;
  String? Function(BuildContext, String?)? dat1Controller1Validator;
  // State field(s) for Dat1 widget.
  FocusNode? dat1FocusNode2;
  TextEditingController? dat1Controller2;
  String? Function(BuildContext, String?)? dat1Controller2Validator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Custom Action - guardarFoto] action in IconButton widget.
  String? imagensubida;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    dat1FocusNode1?.dispose();
    dat1Controller1?.dispose();

    dat1FocusNode2?.dispose();
    dat1Controller2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
