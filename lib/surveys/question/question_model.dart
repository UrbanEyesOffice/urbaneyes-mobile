import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/google_maps/google_maps_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'question_widget.dart' show QuestionWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QuestionModel extends FlutterFlowModel<QuestionWidget> {
  ///  Local state fields for this page.

  LatLng? selectedLocation;

  String? selectedLocationTitle;

  List<QuestionRecord> questions = [];
  void addToQuestions(QuestionRecord item) => questions.add(item);
  void removeFromQuestions(QuestionRecord item) => questions.remove(item);
  void removeAtIndexFromQuestions(int index) => questions.removeAt(index);
  void insertAtIndexInQuestions(int index, QuestionRecord item) =>
      questions.insert(index, item);
  void updateQuestionsAtIndex(int index, Function(QuestionRecord) updateFn) =>
      questions[index] = updateFn(questions[index]);

  int currentQuestionNumber = 0;

  QuestionRecord? currentQuestion;

  OptionStruct? selectedOption;
  void updateSelectedOptionStruct(Function(OptionStruct) updateFn) =>
      updateFn(selectedOption ??= OptionStruct());

  List<AnswerStruct> answers = [];
  void addToAnswers(AnswerStruct item) => answers.add(item);
  void removeFromAnswers(AnswerStruct item) => answers.remove(item);
  void removeAtIndexFromAnswers(int index) => answers.removeAt(index);
  void insertAtIndexInAnswers(int index, AnswerStruct item) =>
      answers.insert(index, item);
  void updateAnswersAtIndex(int index, Function(AnswerStruct) updateFn) =>
      answers[index] = updateFn(answers[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in question widget.
  List<QuestionRecord>? questionsList;
  // State field(s) for comment widget.
  FocusNode? commentFocusNode;
  TextEditingController? commentController;
  String? Function(BuildContext, String?)? commentControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    commentFocusNode?.dispose();
    commentController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
