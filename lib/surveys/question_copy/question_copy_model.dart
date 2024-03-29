import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'question_copy_widget.dart' show QuestionCopyWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QuestionCopyModel extends FlutterFlowModel<QuestionCopyWidget> {
  ///  Local state fields for this page.

  String? locationAddress = '';

  OptionStruct? selectedOption;
  void updateSelectedOptionStruct(Function(OptionStruct) updateFn) =>
      updateFn(selectedOption ??= OptionStruct());

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  List<QuestionRecord>? questionCopyPreviousSnapshot;
  // Stores action output result for [Custom Action - getAddressFromLatLngGoogleMaps] action in questionCopy widget.
  String? addressOnLoad;
  // Stores action output result for [Custom Action - getAddressFromLatLngGoogleMaps] action in questionCopy widget.
  String? lastMapPointAddress;
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
