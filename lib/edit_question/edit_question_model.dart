import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/option_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditQuestionModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for question-Edit widget.
  TextEditingController? questionEditController;
  String? Function(BuildContext, String?)? questionEditControllerValidator;
  // Models for option dynamic component.
  late FlutterFlowDynamicModels<OptionModel> optionModels;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    optionModels = FlutterFlowDynamicModels(() => OptionModel());
  }

  void dispose() {
    unfocusNode.dispose();
    questionEditController?.dispose();
    optionModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
