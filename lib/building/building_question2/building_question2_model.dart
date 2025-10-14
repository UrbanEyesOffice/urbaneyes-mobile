import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/enums/enums.dart';
import '/components/building_selector/building_selector_widget.dart';
import '/components/negative_double_variant_widget.dart';
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
  // Model for positiveRamp.
  late BuildingSelectorModel positiveRampModel;
  // Model for positiveDoorway.
  late BuildingSelectorModel positiveDoorwayModel;
  // Model for positiveLift.
  late BuildingSelectorModel positiveLiftModel;
  // Model for positiveSidewalk.
  late BuildingSelectorModel positiveSidewalkModel;
  // Model for positiveRestroom.
  late BuildingSelectorModel positiveRestroomModel;
  // Model for positiveHelp.
  late BuildingSelectorModel positiveHelpModel;
  // Model for positiveAll.
  late BuildingSelectorModel positiveAllModel;
  // Model for ramp.
  late NegativeDoubleVariantModel rampModel;
  // Model for doorway.
  late NegativeDoubleVariantModel doorwayModel;
  // Model for lift.
  late NegativeDoubleVariantModel liftModel;
  // Model for sidewalks.
  late NegativeDoubleVariantModel sidewalksModel;
  // Model for toilets.
  late NegativeDoubleVariantModel toiletsModel;
  // Model for help.
  late NegativeDoubleVariantModel helpModel;
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
    positiveRampModel = createModel(context, () => BuildingSelectorModel());
    positiveDoorwayModel = createModel(context, () => BuildingSelectorModel());
    positiveLiftModel = createModel(context, () => BuildingSelectorModel());
    positiveSidewalkModel = createModel(context, () => BuildingSelectorModel());
    positiveRestroomModel = createModel(context, () => BuildingSelectorModel());
    positiveHelpModel = createModel(context, () => BuildingSelectorModel());
    positiveAllModel = createModel(context, () => BuildingSelectorModel());
    rampModel = createModel(context, () => NegativeDoubleVariantModel());
    doorwayModel = createModel(context, () => NegativeDoubleVariantModel());
    liftModel = createModel(context, () => NegativeDoubleVariantModel());
    sidewalksModel = createModel(context, () => NegativeDoubleVariantModel());
    toiletsModel = createModel(context, () => NegativeDoubleVariantModel());
    helpModel = createModel(context, () => NegativeDoubleVariantModel());
  }

  @override
  void dispose() {
    veryBadModel.dispose();
    badModel.dispose();
    neutralModel.dispose();
    goodModel.dispose();
    veryGoodModel.dispose();
    positiveRampModel.dispose();
    positiveDoorwayModel.dispose();
    positiveLiftModel.dispose();
    positiveSidewalkModel.dispose();
    positiveRestroomModel.dispose();
    positiveHelpModel.dispose();
    positiveAllModel.dispose();
    rampModel.dispose();
    doorwayModel.dispose();
    liftModel.dispose();
    sidewalksModel.dispose();
    toiletsModel.dispose();
    helpModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
