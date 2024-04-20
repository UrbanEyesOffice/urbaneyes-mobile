// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<DateTime?> yearIntoDate(String? year) async {
  // convert string year into datetime
  if (year == null) {
    return null;
  }

  try {
    int yearInt = int.parse(year);
    DateTime date = DateTime(yearInt, 1, 1);
    return date;
  } catch (e) {
    return null;
  }
}
