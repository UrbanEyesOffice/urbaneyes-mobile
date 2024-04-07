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

Future<List<SurveyStruct>> mapSurveysRecordToSurveyStruct(
    List<SurveysRecord>? surveys) async {
  if (surveys == null || surveys.isEmpty) {
    return [];
  }
  return surveys
      .map((e) => SurveyStruct(
          createdBy: e.createdBy,
          name: e.name,
          nameEn: e.nameEn,
          nameKg: e.nameKg,
          description: e.description,
          descriptionEn: e.descriptionEn,
          descriptionKg: e.descriptionKg,
          createdTime: e.createdTime,
          enabled: e.enabled))
      .toList();
}
