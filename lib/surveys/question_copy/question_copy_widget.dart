import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
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

  final SurveysRecord? survey;
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
      if (widget.location != null) {
        _model.addressOnLoad = await actions.getAddressFromLatLngGoogleMaps(
          widget.location,
        );
        setState(() {
          _model.locationAddress = _model.addressOnLoad;
        });
      } else {
        if (!functions.isLatLongEqualNull(FFAppState().lastMapPoint)!) {
          _model.lastMapPointAddress =
              await actions.getAddressFromLatLngGoogleMaps(
            FFAppState().lastMapPoint,
          );
          setState(() {
            _model.locationAddress = _model.lastMapPointAddress;
          });
        }
      }
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
              isEqualTo: widget.survey?.reference,
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
                child: FutureBuilder<int>(
                  future: queryQuestionRecordCount(
                    queryBuilder: (questionRecord) => questionRecord.where(
                      'survey_id',
                      isEqualTo: widget.survey?.reference,
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
                    int listViewCount = snapshot.data!;
                    return ListView(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
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
                                            if (widget.location == null) {
                                              context.pushNamed(
                                                'SelectLocation',
                                                queryParameters: {
                                                  'survey': serializeParam(
                                                    widget.survey,
                                                    ParamType.Document,
                                                  ),
                                                  'questionRef': serializeParam(
                                                    widget.questionRef,
                                                    ParamType.DocumentReference,
                                                  ),
                                                  'ord': serializeParam(
                                                    widget.ord,
                                                    ParamType.int,
                                                  ),
                                                  'optionId': serializeParam(
                                                    optionIndex,
                                                    ParamType.int,
                                                  ),
                                                  'titleRu': serializeParam(
                                                    optionItem.titleRu,
                                                    ParamType.String,
                                                  ),
                                                  'titleKg': serializeParam(
                                                    optionItem.titleKg,
                                                    ParamType.String,
                                                  ),
                                                  'titleEn': serializeParam(
                                                    optionItem.titleEn,
                                                    ParamType.String,
                                                  ),
                                                  'comment': serializeParam(
                                                    _model
                                                        .commentController.text,
                                                    ParamType.String,
                                                  ),
                                                  'questionCount':
                                                      serializeParam(
                                                    listViewCount,
                                                    ParamType.int,
                                                  ),
                                                  'question': serializeParam(
                                                    questionCopyQuestionRecord
                                                        ?.question,
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  'survey': widget.survey,
                                                },
                                              );
                                            } else {
                                              await AnswerRecord.collection
                                                  .doc()
                                                  .set(createAnswerRecordData(
                                                    surveyId: widget
                                                        .survey?.reference,
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
                                                    comment: _model
                                                        .commentController.text,
                                                  ));
                                              if (widget.ord < listViewCount
                                                  ? true
                                                  : false) {
                                                context.pushNamed(
                                                  'questionCopy',
                                                  queryParameters: {
                                                    'survey': serializeParam(
                                                      widget.survey,
                                                      ParamType.Document,
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
                                                  extra: <String, dynamic>{
                                                    'survey': widget.survey,
                                                  },
                                                );
                                              } else {
                                                FFAppState().lastMapPoint =
                                                    null;

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
                                            padding: EdgeInsets.all(0.0),
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
                        Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 12.0),
                                child: TextFormField(
                                  controller: _model.commentController,
                                  focusNode: _model.commentFocusNode,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText:
                                        FFLocalizations.of(context).getText(
                                      'p20zab1a' /* Поле для комментария */,
                                    ),
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Golos',
                                          fontSize: 16.0,
                                          useGoogleFonts: false,
                                        ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
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
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
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
                                        useGoogleFonts: false,
                                      ),
                                  maxLines: 10,
                                  minLines: 1,
                                  validator: _model.commentControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              if ((widget.address != null &&
                                      widget.address != '') ||
                                  (_model.locationAddress != null &&
                                      _model.locationAddress != ''))
                                Align(
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 12.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF1F3F3),
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
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
                                                          .locationAddress !=
                                                      null &&
                                                  _model.locationAddress !=
                                                      '') {
                                                return _model.locationAddress!;
                                              } else {
                                                return widget.location!
                                                    .toString();
                                              }
                                            }(),
                                            style: FlutterFlowTheme.of(context)
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
                            ],
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
