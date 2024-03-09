import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'home_page_copy_widget.dart' show HomePageCopyWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageCopyModel extends FlutterFlowModel<HomePageCopyWidget> {
  ///  Local state fields for this page.

  List<SurveysRecord> shuffledSurveys = [];
  void addToShuffledSurveys(SurveysRecord item) => shuffledSurveys.add(item);
  void removeFromShuffledSurveys(SurveysRecord item) =>
      shuffledSurveys.remove(item);
  void removeAtIndexFromShuffledSurveys(int index) =>
      shuffledSurveys.removeAt(index);
  void insertAtIndexInShuffledSurveys(int index, SurveysRecord item) =>
      shuffledSurveys.insert(index, item);
  void updateShuffledSurveysAtIndex(
          int index, Function(SurveysRecord) updateFn) =>
      shuffledSurveys[index] = updateFn(shuffledSurveys[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in HomePageCopy widget.
  List<SurveysRecord>? loadedSurveys;
  // Stores action output result for [Custom Action - shuffleSurveys] action in HomePageCopy widget.
  List<SurveysRecord>? tempSurveys;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
