import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'question_model.dart';
export 'question_model.dart';

class QuestionWidget extends StatefulWidget {
  const QuestionWidget({
    Key? key,
    required this.survey,
    this.questionRef,
    this.question,
    int? ord,
  })  : this.ord = ord ?? 0,
        super(key: key);

  final DocumentReference? survey;
  final DocumentReference? questionRef;
  final String? question;
  final int ord;

  @override
  _QuestionWidgetState createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  late QuestionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuestionModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<QuestionRecord>>(
      stream: queryQuestionRecord(
        queryBuilder: (questionRecord) => questionRecord
            .where('survey_id', isEqualTo: widget.survey)
            .where('question', isNotEqualTo: widget.question),
        singleRecord: true,
      ),
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
        List<QuestionRecord> questionQuestionRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final questionQuestionRecord = questionQuestionRecordList.isNotEmpty
            ? questionQuestionRecordList.first
            : null;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(color: Color(0xFF191919)),
              automaticallyImplyLeading: true,
              title: Text(
                'Пройдите опрос',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Outfit',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 22.0,
                    ),
              ),
              actions: [],
              centerTitle: false,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: FutureBuilder<int>(
                future: queryQuestionRecordCount(
                  queryBuilder: (questionRecord) => questionRecord
                      .where('survey_id', isEqualTo: widget.survey),
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
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.00, 0.00),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 30.0, 20.0, 20.0),
                          child: Text(
                            questionQuestionRecord!.question,
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Builder(
                            builder: (context) {
                              final option =
                                  questionQuestionRecord?.option?.toList() ??
                                      [];
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children:
                                    List.generate(option.length, (optionIndex) {
                                  final optionItem = option[optionIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 20.0, 10.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        currentUserLocationValue =
                                            await getCurrentUserLocation(
                                                defaultLocation:
                                                    LatLng(0.0, 0.0));
                                        if (functions.isLatLongEqualNull(
                                                currentUserLocationValue)! &&
                                            functions.isMapNotMoved(
                                                _model.googleMapsCenter)!) {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                content: Text(
                                                    'Поменяйте точку на карте на текущее местоположение'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('👍🏻'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        } else {
                                          await AnswerRecord.collection
                                              .doc()
                                              .set(createAnswerRecordData(
                                                surveyId: widget.survey,
                                                questionId:
                                                    questionQuestionRecord
                                                        ?.reference,
                                                userId: currentUserReference,
                                                answer: optionItem,
                                                time:
                                                    dateTimeFromSecondsSinceEpoch(
                                                        getCurrentTimestamp
                                                            .secondsSinceEpoch),
                                                location: functions
                                                        .isLatLongEqualNull(
                                                            currentUserLocationValue)!
                                                    ? _model.googleMapsCenter
                                                    : currentUserLocationValue,
                                              ));
                                          if (widget.ord < columnCount
                                              ? true
                                              : false) {
                                            context.pushNamed(
                                              'question',
                                              queryParameters: {
                                                'survey': serializeParam(
                                                  widget.survey,
                                                  ParamType.DocumentReference,
                                                ),
                                                'questionRef': serializeParam(
                                                  questionQuestionRecord
                                                      ?.reference,
                                                  ParamType.DocumentReference,
                                                ),
                                                'question': serializeParam(
                                                  questionQuestionRecord
                                                      ?.question,
                                                  ParamType.String,
                                                ),
                                                'ord': serializeParam(
                                                  widget.ord + 1,
                                                  ParamType.int,
                                                ),
                                              }.withoutNulls,
                                            );
                                          } else {
                                            context.pushNamed('HomePage');
                                          }
                                        }
                                      },
                                      text: optionItem,
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 50.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Color(0xFFF2F2F2),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                    ),
                                  );
                                }),
                              );
                            },
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 400.0,
                            decoration: BoxDecoration(),
                            child: FlutterFlowGoogleMap(
                              controller: _model.googleMapsController,
                              onCameraIdle: (latLng) =>
                                  _model.googleMapsCenter = latLng,
                              initialLocation: _model.googleMapsCenter ??=
                                  LatLng(42.8610324, 74.5772478),
                              markerColor: GoogleMarkerColor.violet,
                              mapType: MapType.normal,
                              style: GoogleMapStyle.standard,
                              initialZoom: 12.0,
                              allowInteraction: true,
                              allowZoom: true,
                              showZoomControls: true,
                              showLocation: true,
                              showCompass: false,
                              showMapToolbar: false,
                              showTraffic: false,
                              centerMapOnMarkerTap: true,
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 400.0,
                            decoration: BoxDecoration(),
                            child: Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: FlutterFlowIconButton(
                                borderRadius: 20.0,
                                borderWidth: 1.0,
                                buttonSize: 40.0,
                                fillColor: Color(0x28262D34),
                                icon: Icon(
                                  Icons.emoji_people,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
