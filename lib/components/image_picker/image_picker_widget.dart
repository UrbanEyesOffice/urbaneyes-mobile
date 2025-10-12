import '/components/empty_photos/empty_photos_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'image_picker_model.dart';
export 'image_picker_model.dart';

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({
    super.key,
    int? maxAllowed,
  }) : this.maxAllowed = maxAllowed ?? 1;

  final int maxAllowed;

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  late ImagePickerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ImagePickerModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
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
                                'IMAGE_PICKER_COMP_Image_joqnnbj3_ON_TAP');
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
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'IMAGE_PICKER_Container_pewv5in9_ON_TAP');
                              logFirebaseEvent('Container_alert_dialog');
                              var confirmDialogResponse =
                                  await showDialog<bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text(
                                                FFLocalizations.of(context)
                                                    .getVariableText(
                                              ruText: 'Удалить фото?',
                                              enText: 'Delete photo?',
                                              kyText: 'Сүрөт жок кылынсынбы?',
                                            )),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, false),
                                                child: Text(
                                                    FFLocalizations.of(context)
                                                        .getVariableText(
                                                  ruText: 'Отмена',
                                                  enText: 'Cancel',
                                                  kyText: 'Жок',
                                                )),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, true),
                                                child: Text(
                                                    FFLocalizations.of(context)
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
                                    'Container_update_component_state');
                                _model
                                    .removeFromLocalImages(carouselImagesItem);
                                safeSetState(() {});
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
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
                  carouselController: _model.carouselController ??=
                      CarouselSliderController(),
                  options: CarouselOptions(
                    initialPage: max(0, min(1, carouselImages.length - 1)),
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
        if ((_model.localImages.isNotEmpty) && (widget!.maxAllowed > 1))
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('IMAGE_PICKER_COMP__BTN_ON_TAP');
                    logFirebaseEvent('Button_store_media_for_upload');
                    final selectedMedia = await selectMedia(
                      maxWidth: 1024.00,
                      maxHeight: 1024.00,
                      imageQuality: 100,
                      multiImage: false,
                    );
                    if (selectedMedia != null &&
                        selectedMedia.every((m) =>
                            validateFileFormat(m.storagePath, context))) {
                      safeSetState(() => _model
                          .isDataUploading_imagePickerCameraComponent = true);
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
                        _model.isDataUploading_imagePickerCameraComponent =
                            false;
                      }
                      if (selectedUploadedFiles.length ==
                          selectedMedia.length) {
                        safeSetState(() {
                          _model.uploadedLocalFile_imagePickerCameraComponent =
                              selectedUploadedFiles.first;
                        });
                      } else {
                        safeSetState(() {});
                        return;
                      }
                    }

                    if (_model.uploadedLocalFile_imagePickerCameraComponent !=
                            null &&
                        (_model.uploadedLocalFile_imagePickerCameraComponent
                                .bytes?.isNotEmpty ??
                            false)) {
                      logFirebaseEvent('Button_update_component_state');
                      _model.addToLocalImages(
                          _model.uploadedLocalFile_imagePickerCameraComponent);
                      safeSetState(() {});
                    }
                  },
                  text: FFLocalizations.of(context).getText(
                    'xrg54649' /*  */,
                  ),
                  icon: FaIcon(
                    FontAwesomeIcons.camera,
                    size: 15.0,
                  ),
                  options: FFButtonOptions(
                    height: 48.0,
                    padding: EdgeInsets.all(0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Color(0xFFCEEFCD),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Golos',
                          color: Color(0xFF0A8D09),
                          letterSpacing: 0.0,
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
                    logFirebaseEvent('IMAGE_PICKER_COMP__BTN_ON_TAP');
                    logFirebaseEvent('Button_store_media_for_upload');
                    final selectedMedia = await selectMedia(
                      maxWidth: 1024.00,
                      maxHeight: 1024.00,
                      imageQuality: 100,
                      mediaSource: MediaSource.photoGallery,
                      multiImage: true,
                    );
                    if (selectedMedia != null &&
                        selectedMedia.every((m) =>
                            validateFileFormat(m.storagePath, context))) {
                      safeSetState(() => _model
                          .isDataUploading_imagePickerGalleryComponent = true);
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
                        _model.isDataUploading_imagePickerGalleryComponent =
                            false;
                      }
                      if (selectedUploadedFiles.length ==
                          selectedMedia.length) {
                        safeSetState(() {
                          _model.uploadedLocalFiles_imagePickerGalleryComponent =
                              selectedUploadedFiles;
                        });
                      } else {
                        safeSetState(() {});
                        return;
                      }
                    }

                    if (_model.uploadedLocalFiles_imagePickerGalleryComponent
                        .isNotEmpty) {
                      logFirebaseEvent('Button_custom_action');
                      _model.newLocalImages2 =
                          await actions.mergeUploadedFileLists(
                        _model.localImages.toList(),
                        _model.uploadedLocalFiles_imagePickerGalleryComponent
                            .toList(),
                      );
                      logFirebaseEvent('Button_update_component_state');
                      _model.localImages = _model.newLocalImages2!
                          .toList()
                          .cast<FFUploadedFile>();
                      safeSetState(() {});
                    }

                    safeSetState(() {});
                  },
                  text: FFLocalizations.of(context).getText(
                    'iyhsqlbw' /*  */,
                  ),
                  icon: FaIcon(
                    FontAwesomeIcons.images,
                    size: 15.0,
                  ),
                  options: FFButtonOptions(
                    height: 48.0,
                    padding: EdgeInsets.all(0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Color(0xFFCEEFCD),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Golos',
                          color: Color(0xFF0A8D09),
                          letterSpacing: 0.0,
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
        if (!(_model.localImages.isNotEmpty))
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('IMAGE_PICKER_COMP__BTN_ON_TAP');
                  logFirebaseEvent('Button_store_media_for_upload');
                  final selectedMedia = await selectMedia(
                    maxWidth: 1024.00,
                    maxHeight: 1024.00,
                    imageQuality: 100,
                    multiImage: false,
                  );
                  if (selectedMedia != null &&
                      selectedMedia.every(
                          (m) => validateFileFormat(m.storagePath, context))) {
                    safeSetState(() => _model
                        .isDataUploading_imagePickerCameraComponent2 = true);
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
                      _model.isDataUploading_imagePickerCameraComponent2 =
                          false;
                    }
                    if (selectedUploadedFiles.length == selectedMedia.length) {
                      safeSetState(() {
                        _model.uploadedLocalFile_imagePickerCameraComponent2 =
                            selectedUploadedFiles.first;
                      });
                    } else {
                      safeSetState(() {});
                      return;
                    }
                  }

                  if (_model.uploadedLocalFile_imagePickerCameraComponent2 !=
                          null &&
                      (_model.uploadedLocalFile_imagePickerCameraComponent2
                              .bytes?.isNotEmpty ??
                          false)) {
                    logFirebaseEvent('Button_update_component_state');
                    _model.addToLocalImages(
                        _model.uploadedLocalFile_imagePickerCameraComponent2);
                    safeSetState(() {});
                  }
                },
                text: FFLocalizations.of(context).getText(
                  'ud60c1p3' /* Сфотографировать */,
                ),
                icon: FaIcon(
                  FontAwesomeIcons.camera,
                  size: 15.0,
                ),
                options: FFButtonOptions(
                  width: 330.0,
                  height: 48.0,
                  padding: EdgeInsets.all(0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: Color(0xFFCEEFCD),
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Golos',
                        color: Color(0xFF0A8D09),
                        letterSpacing: 0.0,
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
                  logFirebaseEvent('IMAGE_PICKER_COMP____BTN_ON_TAP');
                  logFirebaseEvent('Button_store_media_for_upload');
                  final selectedMedia = await selectMedia(
                    maxWidth: 1024.00,
                    maxHeight: 1024.00,
                    imageQuality: 100,
                    mediaSource: MediaSource.photoGallery,
                    multiImage: true,
                  );
                  if (selectedMedia != null &&
                      selectedMedia.every(
                          (m) => validateFileFormat(m.storagePath, context))) {
                    safeSetState(() => _model
                        .isDataUploading_imagePickerGalleryCpmponent2 = true);
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
                      _model.isDataUploading_imagePickerGalleryCpmponent2 =
                          false;
                    }
                    if (selectedUploadedFiles.length == selectedMedia.length) {
                      safeSetState(() {
                        _model.uploadedLocalFiles_imagePickerGalleryCpmponent2 =
                            selectedUploadedFiles;
                      });
                    } else {
                      safeSetState(() {});
                      return;
                    }
                  }

                  if (_model.uploadedLocalFiles_imagePickerGalleryCpmponent2
                      .isNotEmpty) {
                    logFirebaseEvent('Button_custom_action');
                    _model.newLocalImages =
                        await actions.mergeUploadedFileLists(
                      _model.localImages.toList(),
                      _model.uploadedLocalFiles_imagePickerGalleryCpmponent2
                          .toList(),
                    );
                    logFirebaseEvent('Button_update_component_state');
                    _model.localImages =
                        _model.newLocalImages!.toList().cast<FFUploadedFile>();
                    safeSetState(() {});
                  }

                  safeSetState(() {});
                },
                text: FFLocalizations.of(context).getText(
                  '5xwymmgo' /* Добавить из галлереи */,
                ),
                icon: FaIcon(
                  FontAwesomeIcons.images,
                  size: 15.0,
                ),
                options: FFButtonOptions(
                  width: 330.0,
                  height: 48.0,
                  padding: EdgeInsets.all(0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: Color(0xFFCEEFCD),
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Golos',
                        color: Color(0xFF0A8D09),
                        letterSpacing: 0.0,
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
      ].divide(SizedBox(height: 16.0)),
    );
  }
}
