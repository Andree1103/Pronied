// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

Future<String?> guardarFoto(FFUploadedFile? foto) async {
  String? imagePath;

  if (foto != null && foto.bytes != null) {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final path = directory.path;
      final imageFolder = Directory('$path/ImagenPronied');

      // Verificar si la carpeta existe, si no, crearla
      if (!await imageFolder.exists()) {
        await imageFolder.create(recursive: true);
      }

      String formattedDate =
          DateFormat('yyyyMMdd_HHmmss').format(DateTime.now());
      final fileName = '$formattedDate.png';

      final File localImage = File('${imageFolder.path}/$fileName')
        ..writeAsBytesSync(foto.bytes!);

      imagePath = localImage.path;
    } catch (e) {
      print('Error al guardar la imagen: $e');
      // Maneja el error según tus necesidades
    }
  }

  return imagePath;
}
