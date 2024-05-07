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
import 'parking_survey_model.dart';
export 'parking_survey_model.dart';

class ParkingSurveyWidget extends StatefulWidget {
  const ParkingSurveyWidget({
    super.key,
    required this.survey,
  });

  final SurveysRecord? survey;

  @override
  State<ParkingSurveyWidget> createState() => _ParkingSurveyWidgetState();
}

class _ParkingSurveyWidgetState extends State<ParkingSurveyWidget> {
  late ParkingSurveyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ParkingSurveyModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ParkingSurvey'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('PARKING_SURVEY_ParkingSurvey_ON_INIT_STA');
      logFirebaseEvent('ParkingSurvey_custom_action');
      _model.hasLocationPermission = await actions.handleLocationPermission();
      logFirebaseEvent('ParkingSurvey_custom_action');
      _model.currentPosition = await actions.getCurrentPosition(
        _model.hasLocationPermission!,
      );
      logFirebaseEvent('ParkingSurvey_update_page_state');
      setState(() {
        _model.selectedLocation = _model.currentPosition;
        _model.isLoading = true;
      });
      logFirebaseEvent('ParkingSurvey_custom_action');
      _model.locationTitleOnLoad = await actions.getAddressFromLatLngGoogleMaps(
        _model.selectedLocation,
        FFLocalizations.of(context).languageCode,
      );
      logFirebaseEvent('ParkingSurvey_update_page_state');
      setState(() {
        _model.selectedLocationTitle = _model.locationTitleOnLoad!;
        _model.isLoading = false;
      });
      logFirebaseEvent('ParkingSurvey_bottom_sheet');
      await showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        enableDrag: false,
        context: context,
        builder: (context) {
          return GestureDetector(
            onTap: () => _model.unfocusNode.canRequestFocus
                ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                : FocusScope.of(context).unfocus(),
            child: Padding(
              padding: MediaQuery.viewInsetsOf(context),
              child: Container(
                height: MediaQuery.sizeOf(context).height * 0.7,
                child: OsmWidget(
                  initialLocation: _model.selectedLocation!,
                  initialLocationTitle: _model.selectedLocationTitle,
                  onSelectLocation: (location, locationTitle) async {
                    logFirebaseEvent('_update_page_state');
                    setState(() {
                      _model.selectedLocation = location;
                      _model.selectedLocationTitle = locationTitle!;
                    });
                  },
                ),
              ),
            ),
          );
        },
      ).then((value) => safeSetState(() {}));
    });

    _model.commentTextController ??= TextEditingController();
    _model.commentFocusNode ??= FocusNode();

    _model.contactTextController ??= TextEditingController();
    _model.contactFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          iconTheme: IconThemeData(color: Colors.black),
          automaticallyImplyLeading: true,
          title: Text(
            FFLocalizations.of(context).getVariableText(
              ruText: widget.survey?.name,
              enText: widget.survey?.nameEn,
              kyText: widget.survey?.nameKg,
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                  useGoogleFonts: false,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              if (!_model.isLoading)
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            32.0, 0.0, 32.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'PARKING_SURVEY_ИЗМЕНИТЬ_ЛОКАЦИЮ_BTN_ON_T');
                            logFirebaseEvent('Button_bottom_sheet');
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return GestureDetector(
                                  onTap: () =>
                                      _model.unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: Container(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.7,
                                      child: OsmWidget(
                                        initialLocation:
                                            _model.selectedLocation!,
                                        initialLocationTitle:
                                            _model.selectedLocationTitle,
                                        onSelectLocation:
                                            (location, locationTitle) async {
                                          logFirebaseEvent(
                                              '_update_page_state');
                                          setState(() {
                                            _model.selectedLocation = location;
                                            _model.selectedLocationTitle =
                                                locationTitle!;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          },
                          text: _model.selectedLocationTitle,
                          icon: Icon(
                            Icons.edit,
                            size: 15.0,
                          ),
                          options: FFButtonOptions(
                            height: 36.0,
                            padding: EdgeInsets.all(0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Color(0xFFEBEBEB),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Golos',
                                  color: Color(0xFF57636B),
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: false,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      if (_model.localImages.isNotEmpty)
                        Builder(
                          builder: (context) {
                            final carouselImages = _model.localImages.toList();
                            if (carouselImages.isEmpty) {
                              return EmptyPhotosWidget();
                            }
                            return Container(
                              width: double.infinity,
                              height: 200.0,
                              child: CarouselSlider.builder(
                                itemCount: carouselImages.length,
                                itemBuilder: (context, carouselImagesIndex, _) {
                                  final carouselImagesItem =
                                      carouselImages[carouselImagesIndex];
                                  return Stack(
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'PARKING_SURVEY_Image_8jm1fhg2_ON_TAP');
                                          logFirebaseEvent(
                                              'Image_expand_image');
                                          await Navigator.push(
                                            context,
                                            PageTransition(
                                              type: PageTransitionType.fade,
                                              child:
                                                  FlutterFlowExpandedImageView(
                                                image: Image.memory(
                                                  carouselImagesItem.bytes ??
                                                      Uint8List.fromList([]),
                                                  fit: BoxFit.contain,
                                                ),
                                                allowRotation: false,
                                                tag: 'imageTag1',
                                                useHeroAnimation: true,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Hero(
                                          tag: 'imageTag1',
                                          transitionOnUserGestures: true,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.memory(
                                              carouselImagesItem.bytes ??
                                                  Uint8List.fromList([]),
                                              width: 300.0,
                                              height: 200.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(1.0, -1.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'PARKING_SURVEY_Container_c7rt3a4s_ON_TAP');
                                            logFirebaseEvent(
                                                'Container_alert_dialog');
                                            var confirmDialogResponse =
                                                await showDialog<bool>(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getVariableText(
                                                            ruText:
                                                                'Удалить фото?',
                                                            enText:
                                                                'Delete photo?',
                                                            kyText:
                                                                'Сүрөт жок кылынсынбы?',
                                                          )),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      false),
                                                              child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getVariableText(
                                                                ruText:
                                                                    'Отмена',
                                                                enText:
                                                                    'Cancel',
                                                                kyText: 'Жок',
                                                              )),
                                                            ),
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      true),
                                                              child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getVariableText(
                                                                ruText:
                                                                    'Удалить',
                                                                enText:
                                                                    'Delete',
                                                                kyText:
                                                                    'Жок кылуу',
                                                              )),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ) ??
                                                    false;
                                            if (confirmDialogResponse) {
                                              logFirebaseEvent(
                                                  'Container_update_page_state');
                                              setState(() {
                                                _model
                                                    .removeAtIndexFromLocalImages(
                                                        carouselImagesIndex);
                                              });
                                            }
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(),
                                            child: Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: SvgPicture.asset(
                                                  'assets/images/Delete.svg',
                                                  width: 24.0,
                                                  height: 24.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                                carouselController:
                                    _model.carouselController ??=
                                        CarouselController(),
                                options: CarouselOptions(
                                  initialPage:
                                      min(1, carouselImages.length - 1),
                                  viewportFraction: 0.5,
                                  disableCenter: true,
                                  enlargeCenterPage: true,
                                  enlargeFactor: 0.25,
                                  enableInfiniteScroll: false,
                                  scrollDirection: Axis.horizontal,
                                  autoPlay: false,
                                  onPageChanged: (index, _) =>
                                      _model.carouselCurrentIndex = index,
                                ),
                              ),
                            );
                          },
                        ),
                      if (!(_model.localImages.isNotEmpty))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              32.0, 0.0, 32.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'PARKING_SURVEY_СФОТОГРАФИРОВАТЬ_BTN_ON_T');
                                  logFirebaseEvent(
                                      'Button_store_media_for_upload');
                                  final selectedMedia = await selectMedia(
                                    maxWidth: 1024.00,
                                    maxHeight: 1024.00,
                                    imageQuality: 100,
                                    multiImage: false,
                                  );
                                  if (selectedMedia != null &&
                                      selectedMedia.every((m) =>
                                          validateFileFormat(
                                              m.storagePath, context))) {
                                    setState(
                                        () => _model.isDataUploading1 = true);
                                    var selectedUploadedFiles =
                                        <FFUploadedFile>[];

                                    try {
                                      selectedUploadedFiles = selectedMedia
                                          .map((m) => FFUploadedFile(
                                                name: m.storagePath
                                                    .split('/')
                                                    .last,
                                                bytes: m.bytes,
                                                height: m.dimensions?.height,
                                                width: m.dimensions?.width,
                                                blurHash: m.blurHash,
                                              ))
                                          .toList();
                                    } finally {
                                      _model.isDataUploading1 = false;
                                    }
                                    if (selectedUploadedFiles.length ==
                                        selectedMedia.length) {
                                      setState(() {
                                        _model.uploadedLocalFile1 =
                                            selectedUploadedFiles.first;
                                      });
                                    } else {
                                      setState(() {});
                                      return;
                                    }
                                  }

                                  if (_model.uploadedLocalFile1 != null &&
                                      (_model.uploadedLocalFile1.bytes
                                              ?.isNotEmpty ??
                                          false)) {
                                    logFirebaseEvent(
                                        'Button_update_page_state');
                                    setState(() {
                                      _model.addToLocalImages(
                                          _model.uploadedLocalFile1);
                                    });
                                  }
                                },
                                text: FFLocalizations.of(context).getText(
                                  'k2wz1pqr' /* Сфотографировать */,
                                ),
                                icon: FaIcon(
                                  FontAwesomeIcons.camera,
                                ),
                                options: FFButtonOptions(
                                  width: 330.0,
                                  height: 48.0,
                                  padding: EdgeInsets.all(0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0xFFCEEFCD),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Golos',
                                        color: Color(0xFF0A8D09),
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'PARKING_SURVEY_ДОБАВИТЬ_ИЗ_ГАЛЛЕРЕИ_BTN_');
                                  logFirebaseEvent(
                                      'Button_store_media_for_upload');
                                  final selectedMedia = await selectMedia(
                                    maxWidth: 1024.00,
                                    maxHeight: 1024.00,
                                    imageQuality: 100,
                                    mediaSource: MediaSource.photoGallery,
                                    multiImage: true,
                                  );
                                  if (selectedMedia != null &&
                                      selectedMedia.every((m) =>
                                          validateFileFormat(
                                              m.storagePath, context))) {
                                    setState(
                                        () => _model.isDataUploading2 = true);
                                    var selectedUploadedFiles =
                                        <FFUploadedFile>[];

                                    try {
                                      selectedUploadedFiles = selectedMedia
                                          .map((m) => FFUploadedFile(
                                                name: m.storagePath
                                                    .split('/')
                                                    .last,
                                                bytes: m.bytes,
                                                height: m.dimensions?.height,
                                                width: m.dimensions?.width,
                                                blurHash: m.blurHash,
                                              ))
                                          .toList();
                                    } finally {
                                      _model.isDataUploading2 = false;
                                    }
                                    if (selectedUploadedFiles.length ==
                                        selectedMedia.length) {
                                      setState(() {
                                        _model.uploadedLocalFiles2 =
                                            selectedUploadedFiles;
                                      });
                                    } else {
                                      setState(() {});
                                      return;
                                    }
                                  }

                                  if (_model.uploadedLocalFiles2.isNotEmpty) {
                                    logFirebaseEvent('Button_custom_action');
                                    _model.newLocalImages =
                                        await actions.mergeUploadedFileLists(
                                      _model.localImages.toList(),
                                      _model.uploadedLocalFiles2.toList(),
                                    );
                                    logFirebaseEvent(
                                        'Button_update_page_state');
                                    setState(() {
                                      _model.localImages = _model
                                          .newLocalImages!
                                          .toList()
                                          .cast<FFUploadedFile>();
                                    });
                                  }

                                  setState(() {});
                                },
                                text: FFLocalizations.of(context).getText(
                                  'kzr8fd76' /* Добавить из галлереи */,
                                ),
                                icon: FaIcon(
                                  FontAwesomeIcons.images,
                                ),
                                options: FFButtonOptions(
                                  width: 330.0,
                                  height: 48.0,
                                  padding: EdgeInsets.all(0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0xFFCEEFCD),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Golos',
                                        color: Color(0xFF0A8D09),
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ].divide(SizedBox(height: 16.0)),
                          ),
                        ),
                      if (_model.localImages.isNotEmpty)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              32.0, 0.0, 32.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'PARKING_SURVEY_PAGE__BTN_ON_TAP');
                                    logFirebaseEvent(
                                        'Button_store_media_for_upload');
                                    final selectedMedia = await selectMedia(
                                      maxWidth: 1024.00,
                                      maxHeight: 1024.00,
                                      imageQuality: 100,
                                      multiImage: false,
                                    );
                                    if (selectedMedia != null &&
                                        selectedMedia.every((m) =>
                                            validateFileFormat(
                                                m.storagePath, context))) {
                                      setState(
                                          () => _model.isDataUploading3 = true);
                                      var selectedUploadedFiles =
                                          <FFUploadedFile>[];

                                      try {
                                        selectedUploadedFiles = selectedMedia
                                            .map((m) => FFUploadedFile(
                                                  name: m.storagePath
                                                      .split('/')
                                                      .last,
                                                  bytes: m.bytes,
                                                  height: m.dimensions?.height,
                                                  width: m.dimensions?.width,
                                                  blurHash: m.blurHash,
                                                ))
                                            .toList();
                                      } finally {
                                        _model.isDataUploading3 = false;
                                      }
                                      if (selectedUploadedFiles.length ==
                                          selectedMedia.length) {
                                        setState(() {
                                          _model.uploadedLocalFile3 =
                                              selectedUploadedFiles.first;
                                        });
                                      } else {
                                        setState(() {});
                                        return;
                                      }
                                    }

                                    if (_model.uploadedLocalFile3 != null &&
                                        (_model.uploadedLocalFile3.bytes
                                                ?.isNotEmpty ??
                                            false)) {
                                      logFirebaseEvent(
                                          'Button_update_page_state');
                                      setState(() {
                                        _model.addToLocalImages(
                                            _model.uploadedLocalFile3);
                                      });
                                    }
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'tj6hu4a7' /*  */,
                                  ),
                                  icon: FaIcon(
                                    FontAwesomeIcons.camera,
                                  ),
                                  options: FFButtonOptions(
                                    height: 48.0,
                                    padding: EdgeInsets.all(0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: Color(0xFFCEEFCD),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Golos',
                                          color: Color(0xFF0A8D09),
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                        ),
                                    elevation: 0.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'PARKING_SURVEY_PAGE__BTN_ON_TAP');
                                    logFirebaseEvent(
                                        'Button_store_media_for_upload');
                                    final selectedMedia = await selectMedia(
                                      maxWidth: 1024.00,
                                      maxHeight: 1024.00,
                                      imageQuality: 100,
                                      mediaSource: MediaSource.photoGallery,
                                      multiImage: true,
                                    );
                                    if (selectedMedia != null &&
                                        selectedMedia.every((m) =>
                                            validateFileFormat(
                                                m.storagePath, context))) {
                                      setState(
                                          () => _model.isDataUploading4 = true);
                                      var selectedUploadedFiles =
                                          <FFUploadedFile>[];

                                      try {
                                        selectedUploadedFiles = selectedMedia
                                            .map((m) => FFUploadedFile(
                                                  name: m.storagePath
                                                      .split('/')
                                                      .last,
                                                  bytes: m.bytes,
                                                  height: m.dimensions?.height,
                                                  width: m.dimensions?.width,
                                                  blurHash: m.blurHash,
                                                ))
                                            .toList();
                                      } finally {
                                        _model.isDataUploading4 = false;
                                      }
                                      if (selectedUploadedFiles.length ==
                                          selectedMedia.length) {
                                        setState(() {
                                          _model.uploadedLocalFiles4 =
                                              selectedUploadedFiles;
                                        });
                                      } else {
                                        setState(() {});
                                        return;
                                      }
                                    }

                                    if (_model.uploadedLocalFiles4.isNotEmpty) {
                                      logFirebaseEvent('Button_custom_action');
                                      _model.newLocalImages2 =
                                          await actions.mergeUploadedFileLists(
                                        _model.localImages.toList(),
                                        _model.uploadedLocalFiles4.toList(),
                                      );
                                      logFirebaseEvent(
                                          'Button_update_page_state');
                                      setState(() {
                                        _model.localImages = _model
                                            .newLocalImages2!
                                            .toList()
                                            .cast<FFUploadedFile>();
                                      });
                                    }

                                    setState(() {});
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'b8zcm7at' /*  */,
                                  ),
                                  icon: FaIcon(
                                    FontAwesomeIcons.images,
                                  ),
                                  options: FFButtonOptions(
                                    height: 48.0,
                                    padding: EdgeInsets.all(0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: Color(0xFFCEEFCD),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Golos',
                                          color: Color(0xFF0A8D09),
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                        ),
                                    elevation: 0.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(width: 16.0)),
                          ),
                        ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            32.0, 0.0, 32.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextFormField(
                              controller: _model.commentTextController,
                              focusNode: _model.commentFocusNode,
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Golos',
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                    ),
                                hintText: FFLocalizations.of(context).getText(
                                  '5zxtnbzm' /* Комментарий */,
                                ),
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFA9ABAF),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFA9ABAF),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Golos',
                                    color: Color(0xFF06112E),
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                              maxLines: 2,
                              minLines: 1,
                              validator: _model.commentTextControllerValidator
                                  .asValidator(context),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Theme(
                                  data: ThemeData(
                                    checkboxTheme: CheckboxThemeData(
                                      visualDensity: VisualDensity.compact,
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                    ),
                                    unselectedWidgetColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
                                  ),
                                  child: Checkbox(
                                    value: _model.checkboxValue ??= true,
                                    onChanged: (newValue) async {
                                      setState(() =>
                                          _model.checkboxValue = newValue!);
                                    },
                                    side: BorderSide(
                                      width: 2,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                                    activeColor:
                                        FlutterFlowTheme.of(context).mainGreen,
                                    checkColor:
                                        FlutterFlowTheme.of(context).info,
                                  ),
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'ao976zzq' /* Держите в курсе/готов обсудить */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ],
                            ),
                            if (_model.checkboxValue ?? true)
                              TextFormField(
                                controller: _model.contactTextController,
                                focusNode: _model.contactFocusNode,
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText:
                                      FFLocalizations.of(context).getText(
                                    'cw3iych7' /* Телеграмм/Whatsapp/Телефон */,
                                  ),
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Golos',
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                      ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFA9ABAF),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFA9ABAF),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Golos',
                                      color: Color(0xFF06112E),
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                    ),
                                maxLines: 2,
                                minLines: 1,
                                validator: _model.contactTextControllerValidator
                                    .asValidator(context),
                              ),
                            FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'PARKING_SURVEY_PAGE_save_ON_TAP');
                                logFirebaseEvent(
                                    'save_upload_media_to_firebase');
                                {
                                  setState(
                                      () => _model.isDataUploading5 = true);
                                  var selectedUploadedFiles =
                                      <FFUploadedFile>[];
                                  var selectedMedia = <SelectedFile>[];
                                  var downloadUrls = <String>[];
                                  try {
                                    selectedUploadedFiles = _model.localImages;
                                    selectedMedia =
                                        selectedFilesFromUploadedFiles(
                                      selectedUploadedFiles,
                                      isMultiData: true,
                                    );
                                    downloadUrls = (await Future.wait(
                                      selectedMedia.map(
                                        (m) async => await uploadData(
                                            m.storagePath, m.bytes),
                                      ),
                                    ))
                                        .where((u) => u != null)
                                        .map((u) => u!)
                                        .toList();
                                  } finally {
                                    _model.isDataUploading5 = false;
                                  }
                                  if (selectedUploadedFiles.length ==
                                          selectedMedia.length &&
                                      downloadUrls.length ==
                                          selectedMedia.length) {
                                    setState(() {
                                      _model.uploadedLocalFiles5 =
                                          selectedUploadedFiles;
                                      _model.uploadedFileUrls5 = downloadUrls;
                                    });
                                  } else {
                                    setState(() {});
                                    return;
                                  }
                                }

                                logFirebaseEvent('save_backend_call');

                                await ParkingRecord.collection.doc().set({
                                  ...createParkingRecordData(
                                    createdBy: currentUserReference,
                                    createdTime: getCurrentTimestamp,
                                    location: _model.selectedLocation,
                                    comment: _model.commentTextController.text,
                                    contactInfo:
                                        _model.contactTextController.text,
                                    locationTitle: _model.selectedLocationTitle,
                                    allowFeedback: _model.checkboxValue,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'images': _model.uploadedFileUrls5,
                                    },
                                  ),
                                });
                                logFirebaseEvent('save_navigate_to');

                                context.goNamed(
                                  'complete',
                                  queryParameters: {
                                    'survey': serializeParam(
                                      widget.survey,
                                      ParamType.Document,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'survey': widget.survey,
                                  },
                                );
                              },
                              text: FFLocalizations.of(context).getText(
                                'ck0vn711' /* Отправить */,
                              ),
                              options: FFButtonOptions(
                                width: 330.0,
                                height: 48.0,
                                padding: EdgeInsets.all(0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color:
                                    FlutterFlowTheme.of(context).featuredBlue,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Golos',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ].divide(SizedBox(height: 16.0)),
                        ),
                      ),
                    ]
                        .divide(SizedBox(height: 16.0))
                        .around(SizedBox(height: 16.0)),
                  ),
                ),
              if (_model.isLoading)
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Lottie.asset(
                    'assets/lottie_animations/Animation_-_1714670498687.json',
                    width: 150.0,
                    height: 130.0,
                    fit: BoxFit.cover,
                    animate: true,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
