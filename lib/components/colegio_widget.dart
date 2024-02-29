import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'colegio_model.dart';
export 'colegio_model.dart';

class ColegioWidget extends StatefulWidget {
  const ColegioWidget({super.key});

  @override
  State<ColegioWidget> createState() => _ColegioWidgetState();
}

class _ColegioWidgetState extends State<ColegioWidget> {
  late ColegioModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ColegioModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container();
  }
}
