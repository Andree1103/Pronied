// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<String?> grabarInspecciones(List<dynamic>? inspecciones) async {
  final database = await openDatabase(
    join(await getDatabasesPath(), 'inspecciones_database.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE IF NOT EXISTS Inspecciones(id INTEGER PRIMARY KEY, nombreEvento TEXT, idFicha INTEGER, idPlantilla INTEGER, codigoLocalColegio TEXT, nombreLocalColegio TEXT, departamentoColegio TEXT, provinciaColegio TEXT, distritoColegio TEXT, idEstado INTEGER, estado TEXT)',
      );
    },
    version: 1,
  );

  for (var inspeccion in inspecciones!) {
    await database.insert(
      'inspecciones',
      inspeccion as Map<String, dynamic>, // Necesitas castearlo a Map
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  await database.close();

  return 'Inspecciones guardadas en la base de datos';
}
