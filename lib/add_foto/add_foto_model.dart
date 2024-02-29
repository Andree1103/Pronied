import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import 'add_foto_widget.dart' show AddFotoWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class AddFotoModel extends FlutterFlowModel<AddFotoWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for Dat1 widget.
  FocusNode? dat1FocusNode1;
  TextEditingController? dat1Controller1;
  String? Function(BuildContext, String?)? dat1Controller1Validator;
  String? _dat1Controller1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo Requerido';
    }

    if (val.length > 100) {
      return 'Máximo 100 caracteres';
    }

    return null;
  }

  // State field(s) for Dat1 widget.
  FocusNode? dat1FocusNode2;
  TextEditingController? dat1Controller2;
  String? Function(BuildContext, String?)? dat1Controller2Validator;
  String? _dat1Controller2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo Requerido';
    }

    if (val.length > 100) {
      return 'Máximo 100 caracteres';
    }

    return null;
  }

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Custom Action - guardarFoto] action in IconButton widget.
  String? imagensubida;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    dat1Controller1Validator = _dat1Controller1Validator;
    dat1Controller2Validator = _dat1Controller2Validator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    dat1FocusNode1?.dispose();
    dat1Controller1?.dispose();

    dat1FocusNode2?.dispose();
    dat1Controller2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
