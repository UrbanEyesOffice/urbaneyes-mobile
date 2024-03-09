import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/google_maps/google_maps_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'question_model.dart';
export 'question_model.dart';

class QuestionWidget extends StatefulWidget {
  const QuestionWidget({
    super.key,
    required this.survey,
  });

  final SurveysRecord? survey;

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  late QuestionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuestionModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'question'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('QUESTION_PAGE_question_ON_INIT_STATE');
      logFirebaseEvent('question_bottom_sheet');
      await showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
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

      logFirebaseEvent('question_firestore_query');
      _model.questionsList = await queryQuestionRecordOnce(
        queryBuilder: (questionRecord) => questionRecord
            .where(
              'survey_id',
              isEqualTo: widget.survey?.reference,
            )
            .where(
              'enabled',
              isEqualTo: true,
            )
            .orderBy('question_order'),
      );
      logFirebaseEvent('question_update_page_state');
      setState(() {
        _model.questions =
            _model.questionsList!.toList().cast<QuestionRecord>();
        _model.currentQuestion =
            _model.questionsList?[_model.currentQuestionNumber];
      });
    });

    _model.commentController ??= TextEditingController();
    _model.commentFocusNode ??= FocusNode();

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
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
                ruText: widget.survey?.name,
                enText: widget.survey?.nameEn,
                kyText: widget.survey?.nameKg,
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    useGoogleFonts: false,
                  ),
            ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 30.0, 0.0),
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
                    FFLocalizations.of(context).getVariableText(
                      ruText: _model.currentQuestion?.question,
                      enText: _model.currentQuestion?.questionEn,
                      kyText: _model.currentQuestion?.questionKg,
                    ),
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Gerbera',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
                Text(
                  _model.selectedLocationTitle!,
                  style: FlutterFlowTheme.of(context).bodyMedium,
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
                        children: List.generate(questionOptionsVisible.length,
                            (questionOptionsVisibleIndex) {
                          final questionOptionsVisibleItem =
                              questionOptionsVisible[
                                  questionOptionsVisibleIndex];
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 16.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'QUESTION_PAGE_BUTTON_BTN_ON_TAP');
                                logFirebaseEvent('Button_update_page_state');
                                setState(() {
                                  _model.selectedOption =
                                      questionOptionsVisibleItem;
                                });
                              },
                              text: FFLocalizations.of(context).getVariableText(
                                ruText: questionOptionsVisibleItem.titleRu,
                                enText: questionOptionsVisibleItem.titleEn,
                                kyText: questionOptionsVisibleItem.titleKg,
                              ),
                              options: FFButtonOptions(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 48.0,
                                padding: EdgeInsets.all(0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: valueOrDefault<bool>(
                                  questionOptionsVisibleItem.id ==
                                      _model.selectedOption?.id,
                                  false,
                                )
                                    ? Color(0xFF53B153)
                                    : Color(0x0053B153),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Golos',
                                      color: valueOrDefault<bool>(
                                        questionOptionsVisibleItem.id ==
                                            _model.selectedOption?.id,
                                        false,
                                      )
                                          ? FlutterFlowTheme.of(context)
                                              .primaryBackground
                                          : Color(0xFF0A8D09),
                                      useGoogleFonts: false,
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: Color(0xFF53B153),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          );
                        }),
                      );
                    },
                  ),
                ),
                TextFormField(
                  controller: _model.commentController,
                  focusNode: _model.commentFocusNode,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: FFLocalizations.of(context).getText(
                      'bwsaww2r' /* Поле для комментария */,
                    ),
                    labelStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Golos',
                              fontSize: 16.0,
                              useGoogleFonts: false,
                            ),
                    hintStyle: FlutterFlowTheme.of(context).labelMedium,
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
                        useGoogleFonts: false,
                      ),
                  maxLines: 10,
                  minLines: 1,
                  validator:
                      _model.commentControllerValidator.asValidator(context),
                ),
                FFButtonWidget(
                  onPressed: (_model.selectedOption == null)
                      ? null
                      : () async {
                          logFirebaseEvent('QUESTION_PAGE_ДАЛЕЕ_BTN_ON_TAP');
                          logFirebaseEvent('Button_update_page_state');
                          setState(() {
                            _model.currentQuestionNumber =
                                _model.currentQuestionNumber + 1;
                          });
                          logFirebaseEvent('Button_update_page_state');
                          setState(() {
                            _model.currentQuestion =
                                _model.questions[_model.currentQuestionNumber];
                          });
                        },
                  text: FFLocalizations.of(context).getText(
                    'pt8y2gzq' /* Далее */,
                  ),
                  options: FFButtonOptions(
                    width: 330.0,
                    height: 48.0,
                    padding: EdgeInsets.all(0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Color(0xFF53B153),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Golos',
                          color: Colors.white,
                          useGoogleFonts: false,
                        ),
                    elevation: 3.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                    disabledColor: FlutterFlowTheme.of(context).secondaryText,
                    disabledTextColor: FlutterFlowTheme.of(context).alternate,
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('QUESTION_ИЗМЕНИТЬ_ЛОКАЦИЮ_BTN_ON_TAP');
                    logFirebaseEvent('Button_bottom_sheet');
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
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
                              height: MediaQuery.sizeOf(context).height * 0.7,
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
                    '8rxnnklj' /* Изменить локацию */,
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
        ),
      ),
    );
  }
}
