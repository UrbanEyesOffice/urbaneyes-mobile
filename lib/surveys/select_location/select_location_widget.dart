import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:provider/provider.dart';
import 'select_location_model.dart';
export 'select_location_model.dart';

class SelectLocationWidget extends StatefulWidget {
  const SelectLocationWidget({
    Key? key,
    required this.survey,
    this.questionRef,
    this.ord,
    this.location,
    this.optionId,
    this.titleRu,
    required this.titleKg,
    required this.titleEn,
    this.comment,
    required this.questionCount,
    required this.question,
  }) : super(key: key);

  final DocumentReference? survey;
  final DocumentReference? questionRef;
  final int? ord;
  final LatLng? location;
  final int? optionId;
  final String? titleRu;
  final String? titleKg;
  final String? titleEn;
  final String? comment;
  final int? questionCount;
  final String? question;

  @override
  _SelectLocationWidgetState createState() => _SelectLocationWidgetState();
}

class _SelectLocationWidgetState extends State<SelectLocationWidget> {
  late SelectLocationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectLocationModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
      _model.locationName = await actions.getAddressFromLatLngGoogleMaps(
        _model.googleMapsCenter,
      );
    });

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
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
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
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

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Flexible(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  30.0, 0.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.safePop();
                                },
                                child: Icon(
                                  Icons.chevron_left,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 30.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.00, 0.00),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                30.0, 12.0, 30.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'hb8ugwsz' /* Отметьте свою геолокацию для т... */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Gerbera',
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.00, 1.00),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 36.0, 0.0, 0.0),
                    child: Stack(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.00, 1.00),
                          child: Container(
                            width: double.infinity,
                            height: MediaQuery.sizeOf(context).height * 0.6,
                            decoration: BoxDecoration(),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.00, 0.00),
                                  child: FlutterFlowGoogleMap(
                                    controller: _model.googleMapsController,
                                    onCameraIdle: (latLng) => setState(
                                        () => _model.googleMapsCenter = latLng),
                                    initialLocation: _model.googleMapsCenter ??=
                                        () {
                                      if (functions.isLatLongEqualNull(
                                              currentUserLocationValue) ==
                                          false) {
                                        return currentUserLocationValue!;
                                      } else if (widget.location != null) {
                                        return widget.location!;
                                      } else {
                                        return FFAppState().locationBishkek!;
                                      }
                                    }(),
                                    markerColor: GoogleMarkerColor.violet,
                                    mapType: MapType.normal,
                                    style: GoogleMapStyle.standard,
                                    initialZoom: 16.0,
                                    allowInteraction: true,
                                    allowZoom: true,
                                    showZoomControls: false,
                                    showLocation: true,
                                    showCompass: false,
                                    showMapToolbar: false,
                                    showTraffic: false,
                                    centerMapOnMarkerTap: false,
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.00, 0.00),
                                  child: PointerInterceptor(
                                    intercepting: isWeb,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 5.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/Geo.png',
                                          width: 24.0,
                                          height: 32.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (_model.locationName != null &&
                            _model.locationName != '')
                          Align(
                            alignment: AlignmentDirectional(0.00, 1.00),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  30.0, 0.0, 30.0, 90.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF1F3F3),
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.00, 0.00),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          40.0, 10.0, 40.0, 10.0),
                                      child: Text(
                                        _model.locationName!,
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
                          ),
                        Align(
                          alignment: AlignmentDirectional(0.00, 1.00),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                30.0, 0.0, 30.0, 30.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                currentUserLocationValue =
                                    await getCurrentUserLocation(
                                        defaultLocation: LatLng(0.0, 0.0));

                                await AnswerRecord.collection
                                    .doc()
                                    .set(createAnswerRecordData(
                                      surveyId: widget.survey,
                                      questionId: widget.questionRef,
                                      userId: currentUserReference,
                                      answer: createOptionStruct(
                                        id: widget.optionId,
                                        titleRu: widget.titleRu,
                                        titleEn: widget.titleEn,
                                        titleKg: widget.titleKg,
                                        clearUnsetFields: false,
                                        create: true,
                                      ),
                                      time: dateTimeFromSecondsSinceEpoch(
                                          getCurrentTimestamp
                                              .secondsSinceEpoch),
                                      location: _model.googleMapsCenter,
                                      comment: widget.comment,
                                    ));
                                if (widget.ord! < widget.questionCount!
                                    ? true
                                    : false) {
                                  context.pushNamed(
                                    'questionCopy',
                                    queryParameters: {
                                      'survey': serializeParam(
                                        widget.survey,
                                        ParamType.DocumentReference,
                                      ),
                                      'questionRef': serializeParam(
                                        widget.questionRef,
                                        ParamType.DocumentReference,
                                      ),
                                      'question': serializeParam(
                                        widget.questionRef?.id,
                                        ParamType.String,
                                      ),
                                      'ord': serializeParam(
                                        widget.ord! + 1,
                                        ParamType.int,
                                      ),
                                      'location': serializeParam(
                                        widget.location != null
                                            ? widget.location
                                            : _model.googleMapsCenter,
                                        ParamType.LatLng,
                                      ),
                                    }.withoutNulls,
                                  );
                                } else {
                                  context.goNamed(
                                    'complete',
                                    queryParameters: {
                                      'survey': serializeParam(
                                        widget.survey,
                                        ParamType.DocumentReference,
                                      ),
                                    }.withoutNulls,
                                  );
                                }
                              },
                              text: widget.ord! < widget.questionCount!
                                  ? FFLocalizations.of(context).getVariableText(
                                      ruText: 'Перейти к следующему вопросу',
                                      enText: 'Move on to the next question',
                                      kyText: 'Кийинки суроого өтүңүз',
                                    )
                                  : FFLocalizations.of(context).getVariableText(
                                      ruText: 'Завершить опрос',
                                      enText: 'Complete the survey',
                                      kyText: 'Толук сурамжылоо',
                                    ),
                              options: FFButtonOptions(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 48.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
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
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
