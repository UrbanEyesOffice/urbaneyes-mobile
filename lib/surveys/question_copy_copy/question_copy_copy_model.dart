import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/google_maps/google_maps_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'question_copy_copy_widget.dart' show QuestionCopyCopyWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QuestionCopyCopyModel extends FlutterFlowModel<QuestionCopyCopyWidget> {
  ///  Local state fields for this page.

  String? locationAddress = '';

  OptionStruct? selectedOption;
  void updateSelectedOptionStruct(Function(OptionStruct) updateFn) =>
      updateFn(selectedOption ??= OptionStruct());

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
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
