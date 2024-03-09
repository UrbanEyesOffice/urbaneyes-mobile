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

Future addAnswers(
  List<AnswerStruct> answers,
  LatLng location,
) async {
  // Add your function code here!
  final db = FirebaseFirestore.instance;
  final batch = db.batch();
  for (var answer in answers) {
    var docRef = db.collection("answers").doc();
    batch.set(docRef, {
      "survey_id": answer.surveyId,
      "question_id": answer.questionId,
      "user_id": answer.userId,
      "time": answer.time,
      "location": answer.location,
      "answer": answer.answer,
      "comment": answer.comment
    });
  }
  batch.commit();
}
