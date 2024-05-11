import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inspecciones_p_r_o_n_i_e_d/flutter_flow/flutter_flow_theme.dart';

class AlertOverlayManager {
  static void showOverlay(BuildContext context, String message, int index) {
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: 80.0 + 60 * index, // Ajustar la posición para que no se solapen completamente
        left: 2,
        right: 2,
        child: Material(
          elevation: 10.0,
          borderRadius: BorderRadius.circular(5),
          child: Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primary,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              message,
              style: TextStyle(color: Colors.white, fontSize: 10),

            ),
          ),
        ),
      ),
    );

    Overlay.of(context)?.insert(overlayEntry);

    // Eliminar la alerta después de un tiempo
    Future.delayed(Duration(seconds: 15), () {
      overlayEntry.remove();
    });
  }
}
