import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/structs/index.dart';
import '/components/image_picker/image_picker_widget.dart';
import '/components/osm/osm_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import 'question_widget.dart' show QuestionWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
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
  void updateSelectedOptionStruct(Function(OptionStruct) updateFn) {
    updateFn(selectedOption ??= OptionStruct());
  }

  List<AnswerStruct> answers = [];
  void addToAnswers(AnswerStruct item) => answers.add(item);
  void removeFromAnswers(AnswerStruct item) => answers.remove(item);
  void removeAtIndexFromAnswers(int index) => answers.removeAt(index);
  void insertAtIndexInAnswers(int index, AnswerStruct item) =>
      answers.insert(index, item);
  void updateAnswersAtIndex(int index, Function(AnswerStruct) updateFn) =>
      answers[index] = updateFn(answers[index]);

  bool isLoading = true;

  List<OptionStruct> selectedOptions = [];
  void addToSelectedOptions(OptionStruct item) => selectedOptions.add(item);
  void removeFromSelectedOptions(OptionStruct item) =>
      selectedOptions.remove(item);
  void removeAtIndexFromSelectedOptions(int index) =>
      selectedOptions.removeAt(index);
  void insertAtIndexInSelectedOptions(int index, OptionStruct item) =>
      selectedOptions.insert(index, item);
  void updateSelectedOptionsAtIndex(
          int index, Function(OptionStruct) updateFn) =>
      selectedOptions[index] = updateFn(selectedOptions[index]);

  List<FFUploadedFile> loadedImages = [];
  void addToLoadedImages(FFUploadedFile item) => loadedImages.add(item);
  void removeFromLoadedImages(FFUploadedFile item) => loadedImages.remove(item);
  void removeAtIndexFromLoadedImages(int index) => loadedImages.removeAt(index);
  void insertAtIndexInLoadedImages(int index, FFUploadedFile item) =>
      loadedImages.insert(index, item);
  void updateLoadedImagesAtIndex(
          int index, Function(FFUploadedFile) updateFn) =>
      loadedImages[index] = updateFn(loadedImages[index]);

  List<int> loadedImagesIndexes = [];
  void addToLoadedImagesIndexes(int item) => loadedImagesIndexes.add(item);
  void removeFromLoadedImagesIndexes(int item) =>
      loadedImagesIndexes.remove(item);
  void removeAtIndexFromLoadedImagesIndexes(int index) =>
      loadedImagesIndexes.removeAt(index);
  void insertAtIndexInLoadedImagesIndexes(int index, int item) =>
      loadedImagesIndexes.insert(index, item);
  void updateLoadedImagesIndexesAtIndex(int index, Function(int) updateFn) =>
      loadedImagesIndexes[index] = updateFn(loadedImagesIndexes[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in question widget.
  List<QuestionRecord>? questionsList;
  // Stores action output result for [Custom Action - getAddressFromLatLngGoogleMaps] action in question widget.
  String? locationTitleOnLoad;
  // Model for ImagePicker component.
  late ImagePickerModel imagePickerModel;
  // State field(s) for comment widget.
  FocusNode? commentFocusNode;
  TextEditingController? commentTextController;
  String? Function(BuildContext, String?)? commentTextControllerValidator;
  bool isDataUploading1 = false;
  List<FFUploadedFile> uploadedLocalFiles1 = [];
  List<String> uploadedFileUrls1 = [];

  bool isDataUploading2 = false;
  List<FFUploadedFile> uploadedLocalFiles2 = [];
  List<String> uploadedFileUrls2 = [];

  @override
  void initState(BuildContext context) {
    imagePickerModel = createModel(context, () => ImagePickerModel());
  }

  @override
  void dispose() {
    imagePickerModel.dispose();
    commentFocusNode?.dispose();
    commentTextController?.dispose();
  }
}
