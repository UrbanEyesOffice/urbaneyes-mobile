import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/enums/enums.dart';
import '/components/building_selector/building_selector_widget.dart';
import '/components/osm/osm_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/index.dart';
import 'building_question2_widget.dart' show BuildingQuestion2Widget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BuildingQuestion2Model extends FlutterFlowModel<BuildingQuestion2Widget> {
  ///  Local state fields for this page.

  LatLng? selectedLocation;

  String selectedLocationTitle = '-';

  List<FFUploadedFile> localImages = [];
  void addToLocalImages(FFUploadedFile item) => localImages.add(item);
  void removeFromLocalImages(FFUploadedFile item) => localImages.remove(item);
  void removeAtIndexFromLocalImages(int index) => localImages.removeAt(index);
  void insertAtIndexInLocalImages(int index, FFUploadedFile item) =>
      localImages.insert(index, item);
  void updateLocalImagesAtIndex(int index, Function(FFUploadedFile) updateFn) =>
      localImages[index] = updateFn(localImages[index]);

  BuildingAvailability? availability;

  List<BuildingAnswers> likedAnswers = [];
  void addToLikedAnswers(BuildingAnswers item) => likedAnswers.add(item);
  void removeFromLikedAnswers(BuildingAnswers item) =>
      likedAnswers.remove(item);
  void removeAtIndexFromLikedAnswers(int index) => likedAnswers.removeAt(index);
  void insertAtIndexInLikedAnswers(int index, BuildingAnswers item) =>
      likedAnswers.insert(index, item);
  void updateLikedAnswersAtIndex(
          int index, Function(BuildingAnswers) updateFn) =>
      likedAnswers[index] = updateFn(likedAnswers[index]);

  List<BuildingAnswers> dislikedAnswers = [];
  void addToDislikedAnswers(BuildingAnswers item) => dislikedAnswers.add(item);
  void removeFromDislikedAnswers(BuildingAnswers item) =>
      dislikedAnswers.remove(item);
  void removeAtIndexFromDislikedAnswers(int index) =>
      dislikedAnswers.removeAt(index);
  void insertAtIndexInDislikedAnswers(int index, BuildingAnswers item) =>
      dislikedAnswers.insert(index, item);
  void updateDislikedAnswersAtIndex(
          int index, Function(BuildingAnswers) updateFn) =>
      dislikedAnswers[index] = updateFn(dislikedAnswers[index]);

  List<FFUploadedFile> localBuildingImages = [];
  void addToLocalBuildingImages(FFUploadedFile item) =>
      localBuildingImages.add(item);
  void removeFromLocalBuildingImages(FFUploadedFile item) =>
      localBuildingImages.remove(item);
  void removeAtIndexFromLocalBuildingImages(int index) =>
      localBuildingImages.removeAt(index);
  void insertAtIndexInLocalBuildingImages(int index, FFUploadedFile item) =>
      localBuildingImages.insert(index, item);
  void updateLocalBuildingImagesAtIndex(
          int index, Function(FFUploadedFile) updateFn) =>
      localBuildingImages[index] = updateFn(localBuildingImages[index]);

  String? comment;

  int uploadingIndex = 0;

  ///  State fields for stateful widgets in this page.

  // Model for veryBad.
  late BuildingSelectorModel veryBadModel;
  // Model for bad.
  late BuildingSelectorModel badModel;
  // Model for neutral.
  late BuildingSelectorModel neutralModel;
  // Model for good.
  late BuildingSelectorModel goodModel;
  // Model for veryGood.
  late BuildingSelectorModel veryGoodModel;
  // Model for BuildingSelector component.
  late BuildingSelectorModel buildingSelectorModel1;
  // Model for BuildingSelector component.
  late BuildingSelectorModel buildingSelectorModel2;
  // Model for BuildingSelector component.
  late BuildingSelectorModel buildingSelectorModel3;
  // Model for BuildingSelector component.
  late BuildingSelectorModel buildingSelectorModel4;
  // Model for BuildingSelector component.
  late BuildingSelectorModel buildingSelectorModel5;
  // Model for BuildingSelector component.
  late BuildingSelectorModel buildingSelectorModel6;
  // Model for BuildingSelector component.
  late BuildingSelectorModel buildingSelectorModel7;
  // Model for BuildingSelector component.
  late BuildingSelectorModel buildingSelectorModel8;
  // Model for BuildingSelector component.
  late BuildingSelectorModel buildingSelectorModel9;
  // Model for BuildingSelector component.
  late BuildingSelectorModel buildingSelectorModel10;
  // Model for BuildingSelector component.
  late BuildingSelectorModel buildingSelectorModel11;
  // Model for BuildingSelector component.
  late BuildingSelectorModel buildingSelectorModel12;
  // Model for BuildingSelector component.
  late BuildingSelectorModel buildingSelectorModel13;
  // Model for BuildingSelector component.
  late BuildingSelectorModel buildingSelectorModel14;
  // Model for BuildingSelector component.
  late BuildingSelectorModel buildingSelectorModel15;
  // Model for BuildingSelector component.
  late BuildingSelectorModel buildingSelectorModel16;
  // Model for BuildingSelector component.
  late BuildingSelectorModel buildingSelectorModel17;
  // Model for BuildingSelector component.
  late BuildingSelectorModel buildingSelectorModel18;
  // Model for BuildingSelector component.
  late BuildingSelectorModel buildingSelectorModel19;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  bool isDataUploading_localBuildingUploadedImage = false;
  FFUploadedFile uploadedLocalFile_localBuildingUploadedImage =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_buildingUploadedImages = false;
  List<FFUploadedFile> uploadedLocalFiles_buildingUploadedImages = [];
  List<String> uploadedFileUrls_buildingUploadedImages = [];

  @override
  void initState(BuildContext context) {
    veryBadModel = createModel(context, () => BuildingSelectorModel());
    badModel = createModel(context, () => BuildingSelectorModel());
    neutralModel = createModel(context, () => BuildingSelectorModel());
    goodModel = createModel(context, () => BuildingSelectorModel());
    veryGoodModel = createModel(context, () => BuildingSelectorModel());
    buildingSelectorModel1 =
        createModel(context, () => BuildingSelectorModel());
    buildingSelectorModel2 =
        createModel(context, () => BuildingSelectorModel());
    buildingSelectorModel3 =
        createModel(context, () => BuildingSelectorModel());
    buildingSelectorModel4 =
        createModel(context, () => BuildingSelectorModel());
    buildingSelectorModel5 =
        createModel(context, () => BuildingSelectorModel());
    buildingSelectorModel6 =
        createModel(context, () => BuildingSelectorModel());
    buildingSelectorModel7 =
        createModel(context, () => BuildingSelectorModel());
    buildingSelectorModel8 =
        createModel(context, () => BuildingSelectorModel());
    buildingSelectorModel9 =
        createModel(context, () => BuildingSelectorModel());
    buildingSelectorModel10 =
        createModel(context, () => BuildingSelectorModel());
    buildingSelectorModel11 =
        createModel(context, () => BuildingSelectorModel());
    buildingSelectorModel12 =
        createModel(context, () => BuildingSelectorModel());
    buildingSelectorModel13 =
        createModel(context, () => BuildingSelectorModel());
    buildingSelectorModel14 =
        createModel(context, () => BuildingSelectorModel());
    buildingSelectorModel15 =
        createModel(context, () => BuildingSelectorModel());
    buildingSelectorModel16 =
        createModel(context, () => BuildingSelectorModel());
    buildingSelectorModel17 =
        createModel(context, () => BuildingSelectorModel());
    buildingSelectorModel18 =
        createModel(context, () => BuildingSelectorModel());
    buildingSelectorModel19 =
        createModel(context, () => BuildingSelectorModel());
  }

  @override
  void dispose() {
    veryBadModel.dispose();
    badModel.dispose();
    neutralModel.dispose();
    goodModel.dispose();
    veryGoodModel.dispose();
    buildingSelectorModel1.dispose();
    buildingSelectorModel2.dispose();
    buildingSelectorModel3.dispose();
    buildingSelectorModel4.dispose();
    buildingSelectorModel5.dispose();
    buildingSelectorModel6.dispose();
    buildingSelectorModel7.dispose();
    buildingSelectorModel8.dispose();
    buildingSelectorModel9.dispose();
    buildingSelectorModel10.dispose();
    buildingSelectorModel11.dispose();
    buildingSelectorModel12.dispose();
    buildingSelectorModel13.dispose();
    buildingSelectorModel14.dispose();
    buildingSelectorModel15.dispose();
    buildingSelectorModel16.dispose();
    buildingSelectorModel17.dispose();
    buildingSelectorModel18.dispose();
    buildingSelectorModel19.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
