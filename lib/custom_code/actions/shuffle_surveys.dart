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

Future<List<SurveysRecord>> shuffleSurveys(List<SurveysRecord>? surveys) async {
  // return empty list of SurveyRecord if surveys is null or empty
  if (surveys == null || surveys.isEmpty) {
    return [];
  }
  surveys.shuffle();
  return surveys;
}
