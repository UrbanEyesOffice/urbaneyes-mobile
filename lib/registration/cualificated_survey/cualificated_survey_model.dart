import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'cualificated_survey_widget.dart' show CualificatedSurveyWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class CualificatedSurveyModel
    extends FlutterFlowModel<CualificatedSurveyWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for name-Create widget.
  FocusNode? nameCreateFocusNode;
  TextEditingController? nameCreateTextController;
  String? Function(BuildContext, String?)? nameCreateTextControllerValidator;
  // State field(s) for DropDown widget.
  int? dropDownValue;
  FormFieldController<int>? dropDownValueController;
  // State field(s) for birthYear widget.
  FocusNode? birthYearFocusNode;
  TextEditingController? birthYearTextController;
  final birthYearMask = MaskTextInputFormatter(mask: '####');
  String? Function(BuildContext, String?)? birthYearTextControllerValidator;
  // Stores action output result for [Custom Action - yearIntoDate] action in Button widget.
  DateTime? birthDateTime;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameCreateFocusNode?.dispose();
    nameCreateTextController?.dispose();

    birthYearFocusNode?.dispose();
    birthYearTextController?.dispose();
  }
}
