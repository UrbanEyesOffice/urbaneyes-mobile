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
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'question_model.dart';
export 'question_model.dart';

class QuestionWidget extends StatefulWidget {
  const QuestionWidget({
    super.key,
    required this.survey,
  });

  final SurveysRecord? survey;

  static String routeName = 'question';
  static String routePath = '/question';

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  late QuestionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuestionModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'question'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('QUESTION_PAGE_question_ON_INIT_STATE');
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
      logFirebaseEvent('question_update_page_state');
      _model.isLoading = true;
      safeSetState(() {});
      if (isWeb) {
        logFirebaseEvent('question_update_page_state');
        _model.selectedLocation = FFAppState().locationBishkek;
        safeSetState(() {});
      } else {
        logFirebaseEvent('question_request_permissions');
        await requestPermission(locationPermission);
        if (await getPermissionStatus(locationPermission)) {
          logFirebaseEvent('question_update_page_state');
          _model.selectedLocation = currentUserLocationValue;
          safeSetState(() {});
        } else {
          logFirebaseEvent('question_update_page_state');
          _model.selectedLocation = FFAppState().locationBishkek;
          safeSetState(() {});
        }
      }

      logFirebaseEvent('question_firestore_query');
      _model.questionsList = await queryQuestionRecordOnce(
        queryBuilder: (questionRecord) => questionRecord
            .where(
              'survey_id',
              isEqualTo: widget!.survey?.reference,
            )
            .where(
              'enabled',
              isEqualTo: true,
            )
            .orderBy('question_order'),
      );
      logFirebaseEvent('question_update_page_state');
      _model.questions = _model.questionsList!.toList().cast<QuestionRecord>();
      _model.currentQuestion =
          _model.questionsList?.elementAtOrNull(_model.currentQuestionNumber);
      safeSetState(() {});
      if (isWeb) {
        logFirebaseEvent('question_update_page_state');
        _model.selectedLocationTitle = 'test location';
        _model.isLoading = false;
        safeSetState(() {});
      } else {
        logFirebaseEvent('question_custom_action');
        _model.locationTitleOnLoad =
            await actions.getAddressFromLatLngGoogleMaps(
          _model.selectedLocation,
          FFLocalizations.of(context).languageCode,
        );
        logFirebaseEvent('question_update_page_state');
        _model.selectedLocationTitle = _model.locationTitleOnLoad;
        _model.isLoading = false;
        safeSetState(() {});
      }

      logFirebaseEvent('question_bottom_sheet');
      await showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        enableDrag: false,
        context: context,
        builder: (context) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Padding(
              padding: MediaQuery.viewInsetsOf(context),
              child: Container(
                height: MediaQuery.sizeOf(context).height * 0.7,
                child: OsmWidget(
                  initialLocation: _model.selectedLocation!,
                  initialLocationTitle: _model.selectedLocationTitle,
                  onSelectLocation:
                      (location, locationTitle, buildingInfo) async {
                    logFirebaseEvent('_update_page_state');
                    _model.selectedLocation = location;
                    _model.selectedLocationTitle = locationTitle;
                    safeSetState(() {});
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

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          iconTheme:
              IconThemeData(color: FlutterFlowTheme.of(context).mainGreen),
          automaticallyImplyLeading: true,
          leading: FlutterFlowIconButton(
            borderRadius: 20.0,
            borderWidth: 1.0,
            buttonSize: 40.0,
            icon: Icon(
              Icons.chevron_left,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 40.0,
            ),
            onPressed: () async {
              logFirebaseEvent('QUESTION_PAGE_chevron_left_ICN_ON_TAP');
              logFirebaseEvent('IconButton_navigate_back');
              context.safePop();
            },
          ),
          title: Align(
            alignment: AlignmentDirectional(-1.0, 0.0),
            child: Text(
              FFLocalizations.of(context).getVariableText(
                ruText: widget!.survey?.name,
                enText: widget!.survey?.nameEn,
                kyText: widget!.survey?.nameKg,
              ),
              maxLines: 2,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    fontSize: 18.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                  ),
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 0.0),
                  child: ListView(
                    padding: EdgeInsets.fromLTRB(
                      0,
                      32.0,
                      0,
                      32.0,
                    ),
                    scrollDirection: Axis.vertical,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            FFLocalizations.of(context).getVariableText(
                              ruText: _model.currentQuestion?.question,
                              enText: _model.currentQuestion?.questionEn,
                              kyText: _model.currentQuestion?.questionKg,
                            ),
                            '-',
                          ),
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'Gerbera',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 28.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                      Text(
                        valueOrDefault<String>(
                          _model.selectedLocationTitle,
                          '-',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                            ),
                      ),
                      Text(
                        _model.currentQuestion!.multiselect
                            ? FFLocalizations.of(context).getVariableText(
                                ruText: 'Выберите все подходящие варианты',
                                enText: 'Select all that apply',
                                kyText: 'Тиешелүүлөрдүн баарын тандаңыз',
                              )
                            : FFLocalizations.of(context).getVariableText(
                                ruText: 'Выберите наиболее подходящий вариант',
                                enText: 'Choose the most suitable option',
                                kyText: 'Эң ылайыктуу вариантты тандаңыз',
                              ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                            ),
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 1.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Builder(
                          builder: (context) {
                            final questionOptionsVisible =
                                _model.currentQuestion?.options?.toList() ?? [];

                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children:
                                  List.generate(questionOptionsVisible.length,
                                      (questionOptionsVisibleIndex) {
                                final questionOptionsVisibleItem =
                                    questionOptionsVisible[
                                        questionOptionsVisibleIndex];
                                return Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 16.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'QUESTION_PAGE_BUTTON_BTN_ON_TAP');
                                            if (_model
                                                .currentQuestion!.multiselect) {
                                              if (_model.selectedOptions.contains(
                                                  questionOptionsVisibleItem)) {
                                                logFirebaseEvent(
                                                    'Button_update_page_state');
                                                _model.removeFromSelectedOptions(
                                                    questionOptionsVisibleItem);
                                                safeSetState(() {});
                                              } else {
                                                logFirebaseEvent(
                                                    'Button_update_page_state');
                                                _model.addToSelectedOptions(
                                                    questionOptionsVisibleItem);
                                                safeSetState(() {});
                                              }
                                            } else {
                                              logFirebaseEvent(
                                                  'Button_update_page_state');
                                              _model.selectedOption =
                                                  questionOptionsVisibleItem;
                                              safeSetState(() {});
                                            }
                                          },
                                          text: FFLocalizations.of(context)
                                              .getVariableText(
                                            ruText: questionOptionsVisibleItem
                                                .titleRu,
                                            enText: questionOptionsVisibleItem
                                                .titleEn,
                                            kyText: questionOptionsVisibleItem
                                                .titleKg,
                                          ),
                                          options: FFButtonOptions(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: 48.0,
                                            padding: EdgeInsets.all(0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: () {
                                              if (valueOrDefault<bool>(
                                                questionOptionsVisibleItem.id ==
                                                    _model.selectedOption?.id,
                                                false,
                                              )) {
                                                return Color(0xFF53B153);
                                              } else if (_model.selectedOptions
                                                  .contains(
                                                      questionOptionsVisibleItem)) {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .mainGreen;
                                              } else {
                                                return Color(0x0053B153);
                                              }
                                            }(),
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  fontFamily: 'Golos',
                                                  color: () {
                                                    if (valueOrDefault<bool>(
                                                      questionOptionsVisibleItem
                                                              .id ==
                                                          _model.selectedOption
                                                              ?.id,
                                                      false,
                                                    )) {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground;
                                                    } else if (_model
                                                        .selectedOptions
                                                        .contains(
                                                            questionOptionsVisibleItem)) {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground;
                                                    } else {
                                                      return Color(0xFF0A8D09);
                                                    }
                                                  }(),
                                                  letterSpacing: 0.0,
                                                ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color: Color(0xFF53B153),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                            );
                          },
                        ),
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 1.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                      ),
                      if (valueOrDefault<bool>(
                        _model.currentQuestion?.canUploadImage,
                        false,
                      ))
                        Container(
                          child: wrapWithModel(
                            model: _model.imagePickerModel,
                            updateCallback: () => safeSetState(() {}),
                            child: ImagePickerWidget(
                              maxAllowed: 1,
                            ),
                          ),
                        ),
                      if (_model.currentQuestion?.canUploadImage ?? true)
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 1.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                        ),
                      TextFormField(
                        controller: _model.commentTextController,
                        focusNode: _model.commentFocusNode,
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: FFLocalizations.of(context).getText(
                            'bwsaww2r' /* Поле для комментария */,
                          ),
                          labelStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Golos',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                          hintStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
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
                            ),
                        maxLines: 10,
                        minLines: 1,
                        validator: _model.commentTextControllerValidator
                            .asValidator(context),
                      ),
                      if (!functions.isLastQuestion(
                          _model.currentQuestionNumber,
                          _model.questions.toList()))
                        FFButtonWidget(
                          onPressed: ((_model.selectedOption == null) &&
                                  (_model.selectedOptions.length <= 0))
                              ? null
                              : () async {
                                  logFirebaseEvent('QUESTION_PAGE__BTN_ON_TAP');
                                  logFirebaseEvent(
                                      'Button_upload_file_to_firebase');
                                  {
                                    safeSetState(() => _model
                                            .isDataUploading_uploadImagesNext =
                                        true);
                                    var selectedUploadedFiles =
                                        <FFUploadedFile>[];
                                    var selectedFiles = <SelectedFile>[];
                                    var downloadUrls = <String>[];
                                    try {
                                      showUploadMessage(
                                        context,
                                        'Uploading file...',
                                        showLoading: true,
                                      );
                                      selectedUploadedFiles =
                                          _model.imagePickerModel.localImages;
                                      selectedFiles =
                                          selectedFilesFromUploadedFiles(
                                        selectedUploadedFiles,
                                        isMultiData: true,
                                      );
                                      downloadUrls = (await Future.wait(
                                        selectedFiles.map(
                                          (f) async => await uploadData(
                                              f.storagePath, f.bytes),
                                        ),
                                      ))
                                          .where((u) => u != null)
                                          .map((u) => u!)
                                          .toList();
                                    } finally {
                                      ScaffoldMessenger.of(context)
                                          .hideCurrentSnackBar();
                                      _model.isDataUploading_uploadImagesNext =
                                          false;
                                    }
                                    if (selectedUploadedFiles.length ==
                                            selectedFiles.length &&
                                        downloadUrls.length ==
                                            selectedFiles.length) {
                                      safeSetState(() {
                                        _model.uploadedLocalFiles_uploadImagesNext =
                                            selectedUploadedFiles;
                                        _model.uploadedFileUrls_uploadImagesNext =
                                            downloadUrls;
                                      });
                                      showUploadMessage(
                                        context,
                                        'Success!',
                                      );
                                    } else {
                                      safeSetState(() {});
                                      showUploadMessage(
                                        context,
                                        'Failed to upload file',
                                      );
                                      return;
                                    }
                                  }

                                  logFirebaseEvent('Button_update_page_state');
                                  _model.currentQuestionNumber =
                                      _model.currentQuestionNumber + 1;
                                  _model.addToAnswers(AnswerStruct(
                                    surveyId: widget!.survey?.reference,
                                    questionId:
                                        _model.currentQuestion?.reference,
                                    userId: currentUserReference,
                                    time: getCurrentTimestamp,
                                    location: _model.selectedLocation,
                                    comment: _model.commentTextController.text,
                                    answer: _model.selectedOption,
                                    answers: _model.selectedOptions,
                                    images: _model
                                        .uploadedFileUrls_uploadImagesNext,
                                  ));
                                  safeSetState(() {});
                                  logFirebaseEvent('Button_update_page_state');
                                  _model.currentQuestion = _model.questions
                                      .elementAtOrNull(
                                          _model.currentQuestionNumber);
                                  _model.selectedOption = null;
                                  _model.selectedOptions = [];
                                  safeSetState(() {});
                                },
                          text: FFLocalizations.of(context).getText(
                            'pt8y2gzq' /* Далее */,
                          ),
                          options: FFButtonOptions(
                            width: 330.0,
                            height: 48.0,
                            padding: EdgeInsets.all(0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Color(0xFF53B153),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Golos',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                            disabledColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            disabledTextColor:
                                FlutterFlowTheme.of(context).alternate,
                          ),
                        ),
                      if (functions.isLastQuestion(_model.currentQuestionNumber,
                          _model.questions.toList()))
                        FFButtonWidget(
                          onPressed: ((_model.selectedOption == null) &&
                                  (_model.selectedOptions.length <= 0))
                              ? null
                              : () async {
                                  logFirebaseEvent('QUESTION_PAGE__BTN_ON_TAP');
                                  logFirebaseEvent(
                                      'Button_upload_file_to_firebase');
                                  {
                                    safeSetState(() => _model
                                            .isDataUploading_uploadImagesComplete =
                                        true);
                                    var selectedUploadedFiles =
                                        <FFUploadedFile>[];
                                    var selectedFiles = <SelectedFile>[];
                                    var downloadUrls = <String>[];
                                    try {
                                      selectedUploadedFiles =
                                          _model.imagePickerModel.localImages;
                                      selectedFiles =
                                          selectedFilesFromUploadedFiles(
                                        selectedUploadedFiles,
                                        isMultiData: true,
                                      );
                                      downloadUrls = (await Future.wait(
                                        selectedFiles.map(
                                          (f) async => await uploadData(
                                              f.storagePath, f.bytes),
                                        ),
                                      ))
                                          .where((u) => u != null)
                                          .map((u) => u!)
                                          .toList();
                                    } finally {
                                      _model.isDataUploading_uploadImagesComplete =
                                          false;
                                    }
                                    if (selectedUploadedFiles.length ==
                                            selectedFiles.length &&
                                        downloadUrls.length ==
                                            selectedFiles.length) {
                                      safeSetState(() {
                                        _model.uploadedLocalFiles_uploadImagesComplete =
                                            selectedUploadedFiles;
                                        _model.uploadedFileUrls_uploadImagesComplete =
                                            downloadUrls;
                                      });
                                    } else {
                                      safeSetState(() {});
                                      return;
                                    }
                                  }

                                  logFirebaseEvent('Button_update_page_state');
                                  _model.addToAnswers(AnswerStruct(
                                    surveyId: widget!.survey?.reference,
                                    questionId:
                                        _model.currentQuestion?.reference,
                                    userId: currentUserReference,
                                    time: getCurrentTimestamp,
                                    location: _model.selectedLocation,
                                    answer: _model.selectedOption,
                                    comment: _model.commentTextController.text,
                                    answers: _model.selectedOptions,
                                    images: _model
                                        .uploadedFileUrls_uploadImagesComplete,
                                  ));
                                  safeSetState(() {});
                                  while (_model.currentQuestionNumber >= 0) {
                                    logFirebaseEvent('Button_backend_call');

                                    await AnswerRecord.collection.doc().set({
                                      ...createAnswerRecordData(
                                        surveyId: widget!.survey?.reference,
                                        questionId: _model.answers
                                            .elementAtOrNull(
                                                _model.currentQuestionNumber)
                                            ?.questionId,
                                        userId: currentUserReference,
                                        time: getCurrentTimestamp,
                                        location: _model.selectedLocation,
                                        answer: updateOptionStruct(
                                          _model.answers
                                              .elementAtOrNull(
                                                  _model.currentQuestionNumber)
                                              ?.answer,
                                          clearUnsetFields: false,
                                          create: true,
                                        ),
                                        comment: _model.answers
                                            .elementAtOrNull(
                                                _model.currentQuestionNumber)
                                            ?.comment,
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'answers': getOptionListFirestoreData(
                                            _model.answers
                                                .elementAtOrNull(_model
                                                    .currentQuestionNumber)
                                                ?.answers,
                                          ),
                                          'images': _model.answers
                                              .elementAtOrNull(
                                                  _model.currentQuestionNumber)
                                              ?.images,
                                        },
                                      ),
                                    });
                                    logFirebaseEvent(
                                        'Button_update_page_state');
                                    _model.currentQuestionNumber =
                                        _model.currentQuestionNumber + -1;
                                    safeSetState(() {});
                                  }
                                  logFirebaseEvent('Button_navigate_to');

                                  context.goNamed(CompleteWidget.routeName);
                                },
                          text: FFLocalizations.of(context).getText(
                            'y2oxtgw9' /* Завершить */,
                          ),
                          options: FFButtonOptions(
                            width: 330.0,
                            height: 48.0,
                            padding: EdgeInsets.all(0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Color(0xFF53B153),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Golos',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                            disabledColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            disabledTextColor:
                                FlutterFlowTheme.of(context).alternate,
                          ),
                        ),
                      FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent('QUESTION_PAGE___BTN_ON_TAP');
                          logFirebaseEvent('Button_bottom_sheet');
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return GestureDetector(
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                  FocusManager.instance.primaryFocus?.unfocus();
                                },
                                child: Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: Container(
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.7,
                                    child: OsmWidget(
                                      initialLocation: _model.selectedLocation!,
                                      initialLocationTitle:
                                          _model.selectedLocationTitle,
                                      onSelectLocation: (location,
                                          locationTitle, buildingInfo) async {
                                        logFirebaseEvent('_update_page_state');
                                        _model.selectedLocation = location;
                                        _model.selectedLocationTitle =
                                            locationTitle;
                                        safeSetState(() {});
                                      },
                                    ),
                                  ),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        },
                        text: FFLocalizations.of(context).getText(
                          '8rxnnklj' /* Изменить локацию */,
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
              if (_model.isLoading)
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Lottie.asset(
                    'assets/jsons/Animation_-_1714670498687.json',
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
