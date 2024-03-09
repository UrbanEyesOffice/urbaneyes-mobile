import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'feedback_widget.dart' show FeedbackWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FeedbackModel extends FlutterFlowModel<FeedbackWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for nickname-Create widget.
  FocusNode? nicknameCreateFocusNode1;
  TextEditingController? nicknameCreateController1;
  String? Function(BuildContext, String?)? nicknameCreateController1Validator;
  // State field(s) for nickname-Create widget.
  FocusNode? nicknameCreateFocusNode2;
  TextEditingController? nicknameCreateController2;
  String? Function(BuildContext, String?)? nicknameCreateController2Validator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    nicknameCreateFocusNode1?.dispose();
    nicknameCreateController1?.dispose();

    nicknameCreateFocusNode2?.dispose();
    nicknameCreateController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
