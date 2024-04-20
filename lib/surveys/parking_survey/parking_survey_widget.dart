import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/empty_photos/empty_photos_widget.dart';
import '/components/google_maps/google_maps_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
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
      logFirebaseEvent('ParkingSurvey_bottom_sheet');
      await showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        isDismissible: false,
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
                child: GoogleMapsWidget(
                  locationInput: _model.selectedLocation,
                  locationInputTitle: _model.selectedLocationTitle,
                  selectedLocationCallback: (location, locationTitle) async {
                    logFirebaseEvent('_update_page_state');
                    setState(() {
                      _model.selectedLocation = location;
                      _model.selectedLocationTitle = locationTitle;
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
          iconTheme:
              IconThemeData(color: FlutterFlowTheme.of(context).mainGreen),
          automaticallyImplyLeading: true,
          title: Text(
            FFLocalizations.of(context).getText(
              'i7dw9ydq' /* Парковка */,
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
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
                                  logFirebaseEvent('Image_expand_image');
                                  await Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      child: FlutterFlowExpandedImageView(
                                        image: Image.memory(
                                          carouselImagesItem.bytes ??
                                              Uint8List.fromList([]),
                                          fit: BoxFit.contain,
                                        ),
                                        allowRotation: false,
                                        tag: 'imageTag',
                                        useHeroAnimation: true,
                                      ),
                                    ),
                                  );
                                },
                                child: Hero(
                                  tag: 'imageTag',
                                  transitionOnUserGestures: true,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
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
                                alignment: AlignmentDirectional(1.0, -1.0),
                                child: FlutterFlowIconButton(
                                  borderColor:
                                      FlutterFlowTheme.of(context).noColor,
                                  borderRadius: 20.0,
                                  buttonSize: 40.0,
                                  fillColor:
                                      FlutterFlowTheme.of(context).noColor,
                                  icon: Icon(
                                    Icons.remove_circle,
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'PARKING_SURVEY_remove_circle_ICN_ON_TAP');
                                    logFirebaseEvent('IconButton_alert_dialog');
                                    var confirmDialogResponse =
                                        await showDialog<bool>(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getVariableText(
                                                    ruText: 'Удалить фото?',
                                                    enText: 'Delete photo?',
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
                                                        ruText: 'Отмена',
                                                        enText: 'Cancel',
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
                                                        ruText: 'Удалить',
                                                        enText: 'Delete',
                                                        kyText: 'Жок кылуу',
                                                      )),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ) ??
                                            false;
                                    if (confirmDialogResponse) {
                                      logFirebaseEvent(
                                          'IconButton_update_page_state');
                                      setState(() {
                                        _model.removeAtIndexFromLocalImages(
                                            carouselImagesIndex);
                                      });
                                    }
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                        carouselController: _model.carouselController ??=
                            CarouselController(),
                        options: CarouselOptions(
                          initialPage: min(1, carouselImages.length - 1),
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'PARKING_SURVEY_PAGE_upload_media_ON_TAP');
                          logFirebaseEvent(
                              'upload_media_store_media_for_upload');
                          final selectedMedia =
                              await selectMediaWithSourceBottomSheet(
                            context: context,
                            maxWidth: 500.00,
                            maxHeight: 500.00,
                            imageQuality: 100,
                            allowPhoto: true,
                          );
                          if (selectedMedia != null &&
                              selectedMedia.every((m) =>
                                  validateFileFormat(m.storagePath, context))) {
                            setState(() => _model.isDataUploading1 = true);
                            var selectedUploadedFiles = <FFUploadedFile>[];

                            try {
                              selectedUploadedFiles = selectedMedia
                                  .map((m) => FFUploadedFile(
                                        name: m.storagePath.split('/').last,
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

                          logFirebaseEvent('upload_media_update_page_state');
                          setState(() {
                            _model.addToLocalImages(_model.uploadedLocalFile1);
                          });
                        },
                        text: FFLocalizations.of(context).getText(
                          '9n9xjxb4' /* Загрузить фото */,
                        ),
                        options: FFButtonOptions(
                          width: 330.0,
                          height: 48.0,
                          padding: EdgeInsets.all(0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0xFF53B153),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Golos',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      TextFormField(
                        controller: _model.commentTextController,
                        focusNode: _model.commentFocusNode,
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: FFLocalizations.of(context).getText(
                            '5buym29x' /* Поле для комментария */,
                          ),
                          labelStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Golos',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                          hintStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
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
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                      TextFormField(
                        controller: _model.contactTextController,
                        focusNode: _model.contactFocusNode,
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: FFLocalizations.of(context).getText(
                            'cw3iych7' /* Как с вами связаться? */,
                          ),
                          labelStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Golos',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                          hintStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
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
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                      Text(
                        valueOrDefault<String>(
                          _model.selectedLocationTitle,
                          '-',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                              useGoogleFonts: false,
                            ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'PARKING_SURVEY_ИЗМЕНИТЬ_ЛОКАЦИЮ_BTN_ON_T');
                          logFirebaseEvent('Button_bottom_sheet');
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return GestureDetector(
                                onTap: () => _model.unfocusNode.canRequestFocus
                                    ? FocusScope.of(context)
                                        .requestFocus(_model.unfocusNode)
                                    : FocusScope.of(context).unfocus(),
                                child: Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: Container(
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.7,
                                    child: GoogleMapsWidget(
                                      locationInput: _model.selectedLocation,
                                      locationInputTitle:
                                          _model.selectedLocationTitle,
                                      selectedLocationCallback:
                                          (location, locationTitle) async {
                                        logFirebaseEvent('_update_page_state');
                                        setState(() {
                                          _model.selectedLocation = location;
                                          _model.selectedLocationTitle =
                                              locationTitle;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        },
                        text: FFLocalizations.of(context).getText(
                          'yr24wxv9' /* Изменить локацию */,
                        ),
                        options: FFButtonOptions(
                          width: 330.0,
                          height: 48.0,
                          padding: EdgeInsets.all(0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0xFFCEEFCD),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Golos',
                                    color: Color(0xFF0A8D09),
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent('PARKING_SURVEY_PAGE_save_ON_TAP');
                          logFirebaseEvent('save_upload_media_to_firebase');
                          {
                            setState(() => _model.isDataUploading2 = true);
                            var selectedUploadedFiles = <FFUploadedFile>[];
                            var selectedMedia = <SelectedFile>[];
                            var downloadUrls = <String>[];
                            try {
                              selectedUploadedFiles = _model.localImages;
                              selectedMedia = selectedFilesFromUploadedFiles(
                                selectedUploadedFiles,
                                isMultiData: true,
                              );
                              downloadUrls = (await Future.wait(
                                selectedMedia.map(
                                  (m) async =>
                                      await uploadData(m.storagePath, m.bytes),
                                ),
                              ))
                                  .where((u) => u != null)
                                  .map((u) => u!)
                                  .toList();
                            } finally {
                              _model.isDataUploading2 = false;
                            }
                            if (selectedUploadedFiles.length ==
                                    selectedMedia.length &&
                                downloadUrls.length == selectedMedia.length) {
                              setState(() {
                                _model.uploadedLocalFiles2 =
                                    selectedUploadedFiles;
                                _model.uploadedFileUrls2 = downloadUrls;
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
                              contactInfo: _model.contactTextController.text,
                              locationTitle: _model.selectedLocationTitle,
                            ),
                            ...mapToFirestore(
                              {
                                'images': _model.uploadedFileUrls2,
                              },
                            ),
                          });
                          logFirebaseEvent('save_navigate_to');

                          context.pushNamed(
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
                          'ck0vn711' /* Сохранить */,
                        ),
                        options: FFButtonOptions(
                          width: 330.0,
                          height: 48.0,
                          padding: EdgeInsets.all(0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0xFF53B153),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Golos',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ].divide(SizedBox(height: 16.0)),
                  ),
                ),
              ].divide(SizedBox(height: 16.0)).around(SizedBox(height: 16.0)),
            ),
          ),
        ),
      ),
    );
  }
}
