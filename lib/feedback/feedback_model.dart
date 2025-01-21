import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'feedback_widget.dart' show FeedbackWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FeedbackModel extends FlutterFlowModel<FeedbackWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for nickname-Create widget.
  FocusNode? nicknameCreateFocusNode1;
  TextEditingController? nicknameCreateTextController1;
  String? Function(BuildContext, String?)?
      nicknameCreateTextController1Validator;
  // State field(s) for nickname-Create widget.
  FocusNode? nicknameCreateFocusNode2;
  TextEditingController? nicknameCreateTextController2;
  String? Function(BuildContext, String?)?
      nicknameCreateTextController2Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nicknameCreateFocusNode1?.dispose();
    nicknameCreateTextController1?.dispose();

    nicknameCreateFocusNode2?.dispose();
    nicknameCreateTextController2?.dispose();
  }
}
