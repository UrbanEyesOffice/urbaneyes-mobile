import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'home_page_copy_widget.dart' show HomePageCopyWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

  List<SurveysRecord> featuredSurveys = [];
  void addToFeaturedSurveys(SurveysRecord item) => featuredSurveys.add(item);
  void removeFromFeaturedSurveys(SurveysRecord item) =>
      featuredSurveys.remove(item);
  void removeAtIndexFromFeaturedSurveys(int index) =>
      featuredSurveys.removeAt(index);
  void insertAtIndexInFeaturedSurveys(int index, SurveysRecord item) =>
      featuredSurveys.insert(index, item);
  void updateFeaturedSurveysAtIndex(
          int index, Function(SurveysRecord) updateFn) =>
      featuredSurveys[index] = updateFn(featuredSurveys[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in HomePageCopy widget.
  List<SurveysRecord>? testersLoadedSurveys;
  // Stores action output result for [Custom Action - shuffleSurveys] action in HomePageCopy widget.
  List<SurveysRecord>? testersTempSurveys;
  // Stores action output result for [Firestore Query - Query a collection] action in HomePageCopy widget.
  List<SurveysRecord>? loadedSurveys;
  // Stores action output result for [Custom Action - shuffleSurveys] action in HomePageCopy widget.
  List<SurveysRecord>? tempSurveys;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<QuestionRecord>? questionsList3;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<QuestionRecord>? questionsList2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
