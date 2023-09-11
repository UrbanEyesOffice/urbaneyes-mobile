// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> updateOptionInList(
    DocumentReference documentId, String newOption, int numInList) async {
  try {
    DocumentReference optionDocRef =
        documentId.collection('$documentId').doc('option');

    // Update the option document
    await optionDocRef.update({
      '$numInList': newOption,
    });

    print('Question updated successfully');
  } catch (e) {
    print('Error updating question: $e');
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
