import 'package:flutter/material.dart';
import 'package:inspecciones_p_r_o_n_i_e_d/Utils/ConstansColors.dart';

class AlertsPanel extends StatelessWidget {
  final List<String> messages;
  const AlertsPanel({Key? key, required this.messages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9), // Semi-transparente para el fondo del contenido
        borderRadius: BorderRadius.circular(15), // Bordes redondeados
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // Sombra ligera para dar profundidad
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // Cambios de posición de la sombra
          ),
        ],
      ),
      padding: EdgeInsetsDirectional.fromSTEB(10, 25, 0, 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text("Pendiente de registrar una respuesta en las siguientes secciones:",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w700
              )),
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    messages[index],
                    style: TextStyle(
                      fontSize: 13, // Tamaño de fuente
                      color: Colors.black, // Color de texto
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20), // Espacio antes del botón
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(), // Cierra el panel
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(ConstansColors.cyan), // Color del botón
              padding: MaterialStateProperty.all<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 30, vertical: 10) // Padding del botón
              ),
              textStyle: MaterialStateProperty.all<TextStyle>(
                  TextStyle(fontSize: 18, color: Colors.white) // Tamaño de texto del botón
              ),
            ),
            child: Text('Cerrar',
            style: TextStyle(
              color: Colors.white
            )),
          )
        ],
      ),
    );
  }
}
