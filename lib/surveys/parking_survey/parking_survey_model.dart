import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/empty_photos/empty_photos_widget.dart';
import '/components/osm/osm_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/permissions_util.dart';
import 'parking_survey_widget.dart' show ParkingSurveyWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class ParkingSurveyModel extends FlutterFlowModel<ParkingSurveyWidget> {
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

  bool allowFeedback = true;

  bool isLoading = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - getAddressFromLatLngGoogleMaps] action in ParkingSurvey widget.
  String? locationTitleOnLoad;
  // State field(s) for Carousel widget.
  CarouselController? carouselController;

  int carouselCurrentIndex = 1;

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading2 = false;
  List<FFUploadedFile> uploadedLocalFiles2 = [];

  // Stores action output result for [Custom Action - mergeUploadedFileLists] action in Button widget.
  List<FFUploadedFile>? newLocalImages;
  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading4 = false;
  List<FFUploadedFile> uploadedLocalFiles4 = [];

  // Stores action output result for [Custom Action - mergeUploadedFileLists] action in Button widget.
  List<FFUploadedFile>? newLocalImages2;
  // State field(s) for comment widget.
  FocusNode? commentFocusNode;
  TextEditingController? commentTextController;
  String? Function(BuildContext, String?)? commentTextControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // State field(s) for contact widget.
  FocusNode? contactFocusNode;
  TextEditingController? contactTextController;
  String? Function(BuildContext, String?)? contactTextControllerValidator;
  bool isDataUploading5 = false;
  List<FFUploadedFile> uploadedLocalFiles5 = [];
  List<String> uploadedFileUrls5 = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    commentFocusNode?.dispose();
    commentTextController?.dispose();

    contactFocusNode?.dispose();
    contactTextController?.dispose();
  }
}
