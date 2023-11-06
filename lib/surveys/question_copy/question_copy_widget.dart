import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'question_copy_model.dart';
export 'question_copy_model.dart';

class QuestionCopyWidget extends StatefulWidget {
  const QuestionCopyWidget({
    Key? key,
    required this.survey,
    this.questionRef,
    this.question,
    int? ord,
    this.location,
    this.answers,
    this.address,
  })  : this.ord = ord ?? 1,
        super(key: key);

  final DocumentReference? survey;
  final DocumentReference? questionRef;
  final String? question;
  final int ord;
  final LatLng? location;
  final DocumentReference? answers;
  final String? address;

  @override
  _QuestionCopyWidgetState createState() => _QuestionCopyWidgetState();
}

class _QuestionCopyWidgetState extends State<QuestionCopyWidget> {
  late QuestionCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuestionCopyModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
      await Future.delayed(const Duration(milliseconds: 300));
      if (widget.location != null) {
        if (widget.location != null) {
          await actions.getAddressFromLatLngGoogleMaps(
            widget.location,
          );
        } else if (!functions.isLatLongEqualNull(currentUserLocationValue)!) {
          await actions.getAddressFromLatLngGoogleMaps(
            currentUserLocationValue,
          );
        } else {
          _model.locationName = await actions.getAddressFromLatLngGoogleMaps(
            widget.location,
          );
        }
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return StreamBuilder<List<QuestionRecord>>(
      stream: queryQuestionRecord(
        queryBuilder: (questionRecord) => questionRecord
            .where(
              'survey_id',
              isEqualTo: widget.survey,
            )
            .where(
              'question_order',
              isEqualTo: widget.ord,
            ),
        singleRecord: true,
      )..listen((snapshot) async {
          List<QuestionRecord> questionCopyQuestionRecordList = snapshot;
          final questionCopyQuestionRecord =
              questionCopyQuestionRecordList.isNotEmpty
                  ? questionCopyQuestionRecordList.first
                  : null;
          if (_model.questionCopyPreviousSnapshot != null &&
              !const ListEquality(QuestionRecordDocumentEquality()).equals(
                  questionCopyQuestionRecordList,
                  _model.questionCopyPreviousSnapshot)) {
            setState(() {});

            setState(() {});
          }
          _model.questionCopyPreviousSnapshot = snapshot;
        }),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<QuestionRecord> questionCopyQuestionRecordList = snapshot.data!;
        final questionCopyQuestionRecord =
            questionCopyQuestionRecordList.isNotEmpty
                ? questionCopyQuestionRecordList.first
                : null;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.white,
            body: SafeArea(
              top: true,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30.0, 50.0, 30.0, 30.0),
                child: FutureBuilder<int>(
                  future: queryQuestionRecordCount(
                    queryBuilder: (questionRecord) => questionRecord.where(
                      'survey_id',
                      isEqualTo: widget.survey,
                    ),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    int columnCount = snapshot.data!;
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        StreamBuilder<SurveysRecord>(
                          stream: SurveysRecord.getDocument(widget.survey!),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            final rowSurveysRecord = snapshot.data!;
                            return Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.safePop();
                                  },
                                  child: Icon(
                                    Icons.chevron_left,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 30.0,
                                  ),
                                ),
                                Text(
                                  FFLocalizations.of(context).getVariableText(
                                    ruText: rowSurveysRecord.name,
                                    enText: rowSurveysRecord.nameEn,
                                    kyText: rowSurveysRecord.nameKg,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'Golos',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ],
                            );
                          },
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.00, 0.00),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 30.0, 0.0, 20.0),
                            child: Text(
                              FFLocalizations.of(context).getVariableText(
                                ruText: questionCopyQuestionRecord?.question,
                                enText: questionCopyQuestionRecord?.questionEn,
                                kyText: questionCopyQuestionRecord?.questionKg,
                              ),
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: 'Gerbera',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 28.0,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Builder(
                              builder: (context) {
                                final option = questionCopyQuestionRecord
                                        ?.options
                                        ?.toList() ??
                                    [];
                                return SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(option.length,
                                        (optionIndex) {
                                      final optionItem = option[optionIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 16.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            currentUserLocationValue =
                                                await getCurrentUserLocation(
                                                    defaultLocation:
                                                        LatLng(0.0, 0.0));
                                            if (functions.isLatLongEqualNull(
                                                    currentUserLocationValue)! &&
                                                (widget.location == null)) {
                                              context.pushNamed(
                                                'SelectLocation',
                                                queryParameters: {
                                                  'survey': serializeParam(
                                                    widget.survey,
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            } else {
                                              await AnswerRecord.collection
                                                  .doc()
                                                  .set(createAnswerRecordData(
                                                    surveyId: widget.survey,
                                                    questionId:
                                                        questionCopyQuestionRecord
                                                            ?.reference,
                                                    userId:
                                                        currentUserReference,
                                                    answer: updateOptionStruct(
                                                      optionItem,
                                                      clearUnsetFields: false,
                                                      create: true,
                                                    ),
                                                    time: dateTimeFromSecondsSinceEpoch(
                                                        getCurrentTimestamp
                                                            .secondsSinceEpoch),
                                                    location: () {
                                                      if (widget.location !=
                                                          null) {
                                                        return widget.location;
                                                      } else if (!functions
                                                          .isLatLongEqualNull(
                                                              currentUserLocationValue)!) {
                                                        return currentUserLocationValue;
                                                      } else {
                                                        return currentUserLocationValue;
                                                      }
                                                    }(),
                                                  ));
                                              if (widget.ord < columnCount
                                                  ? true
                                                  : false) {
                                                context.pushNamed(
                                                  'questionCopy',
                                                  queryParameters: {
                                                    'survey': serializeParam(
                                                      widget.survey,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                    'questionRef':
                                                        serializeParam(
                                                      questionCopyQuestionRecord
                                                          ?.reference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                    'question': serializeParam(
                                                      questionCopyQuestionRecord
                                                          ?.question,
                                                      ParamType.String,
                                                    ),
                                                    'ord': serializeParam(
                                                      widget.ord + 1,
                                                      ParamType.int,
                                                    ),
                                                    'location': serializeParam(
                                                      widget.location != null
                                                          ? widget.location
                                                          : currentUserLocationValue,
                                                      ParamType.LatLng,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              } else {
                                                context.goNamed('complete');
                                              }
                                            }
                                          },
                                          text: FFLocalizations.of(context)
                                              .getVariableText(
                                            ruText: optionItem.titleRu,
                                            enText: optionItem.titleEn,
                                            kyText: optionItem.titleKg,
                                          ),
                                          options: FFButtonOptions(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: 48.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Color(0xFFCEEFCD),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Golos',
                                                      color: Color(0xFF0A8D09),
                                                      useGoogleFonts: false,
                                                    ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(0.00, 1.00),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                if ((widget.address != null &&
                                        widget.address != '') ||
                                    (_model.locationName != null &&
                                        _model.locationName != ''))
                                  Align(
                                    alignment: AlignmentDirectional(0.00, 1.00),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 12.0),
                                      child: Container(
                                        width: 100.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF1F3F3),
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.00, 0.00),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    40.0, 10.0, 40.0, 10.0),
                                            child: Text(
                                              () {
                                                if (widget.address != null &&
                                                    widget.address != '') {
                                                  return widget.address!;
                                                } else if (_model
                                                            .locationName !=
                                                        null &&
                                                    _model.locationName != '') {
                                                  return _model.locationName!;
                                                } else {
                                                  return widget.location!
                                                      .toString();
                                                }
                                              }(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Golos',
                                                        fontSize: 16.0,
                                                        useGoogleFonts: false,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                if (!FFAppState().showMAp)
                                  Align(
                                    alignment: AlignmentDirectional(0.00, 1.00),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        context.pushNamed(
                                          'SelectLocation',
                                          queryParameters: {
                                            'survey': serializeParam(
                                              widget.survey,
                                              ParamType.DocumentReference,
                                            ),
                                            'ord': serializeParam(
                                              widget.ord,
                                              ParamType.int,
                                            ),
                                            'location': serializeParam(
                                              widget.location,
                                              ParamType.LatLng,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        '1m0n74wq' /* Выбрать точку на карте */,
                                      ),
                                      options: FFButtonOptions(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 48.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Color(0xFF53B153),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Golos',
                                              color: Colors.white,
                                              useGoogleFonts: false,
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
