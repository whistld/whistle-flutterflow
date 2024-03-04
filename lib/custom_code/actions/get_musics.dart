// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<MusicRecord>> getMusics(List<DocumentReference> music) async {
  List<MusicRecord> docs = [];

  // Iterate through the list of document references
  for (var music in music) {
    // Get the document from the specified collection
    MusicRecord docToAdd = await MusicRecord.getDocumentOnce(music);

    // Add the document to the list
    docs.add(docToAdd);

    // Add Doc to Local State
    // FFAppState().update(() {
    // FFAppState().brandNames.add(docToAdd.brand ?? '');
    // });
  }

  return docs;
}
