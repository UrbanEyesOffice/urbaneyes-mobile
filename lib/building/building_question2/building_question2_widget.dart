import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/enums/enums.dart';
import '/components/building_selector/building_selector_widget.dart';
import '/components/osm/osm_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/index.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'building_question2_model.dart';
export 'building_question2_model.dart';

class BuildingQuestion2Widget extends StatefulWidget {
  const BuildingQuestion2Widget({
    super.key,
    required this.selectedLocation,
    required this.selectedLocationTitle,
    required this.buildingTypes,
  });

  final LatLng? selectedLocation;
  final String? selectedLocationTitle;
  final List<String>? buildingTypes;

  static String routeName = 'BuildingQuestion2';
  static String routePath = '/buildingQuestion2';

  @override
  State<BuildingQuestion2Widget> createState() =>
      _BuildingQuestion2WidgetState();
}

class _BuildingQuestion2WidgetState extends State<BuildingQuestion2Widget> {
  late BuildingQuestion2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BuildingQuestion2Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'BuildingQuestion2'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('BUILDING_QUESTION2_BuildingQuestion2_ON_');
      logFirebaseEvent('BuildingQuestion2_update_page_state');
      _model.selectedLocation = widget!.selectedLocation;
      _model.selectedLocationTitle = widget!.selectedLocationTitle!;
      safeSetState(() {});
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          iconTheme: IconThemeData(color: Colors.black),
          automaticallyImplyLeading: true,
          title: Text(
            FFLocalizations.of(context).getText(
              '50g0bp9e' /* Доступность зданий */,
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('BUILDING_QUESTION2_PAGE___BTN_ON_TAP');
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
                                height: MediaQuery.sizeOf(context).height * 0.7,
                                child: OsmWidget(
                                  initialLocation: _model.selectedLocation!,
                                  initialLocationTitle:
                                      _model.selectedLocationTitle,
                                  onSelectLocation: (location, locationTitle,
                                      buildingInfo) async {
                                    logFirebaseEvent('_update_page_state');
                                    _model.selectedLocation = location;
                                    _model.selectedLocationTitle =
                                        locationTitle!;
                                    safeSetState(() {});
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
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Color(0xFFEBEBEB),
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Golos',
                                color: Color(0xFF57636B),
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'v89opp3q' /* Как вы оцениваете доступность ... */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              color: Color(0xFF374151),
                              fontSize: 22.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            flex: 1,
                            child: wrapWithModel(
                              model: _model.veryBadModel,
                              updateCallback: () => safeSetState(() {}),
                              child: BuildingSelectorWidget(
                                isSelected: _model.availability ==
                                    BuildingAvailability.veryBad,
                                emoji: '😡',
                                title: 'Очень плохо',
                                onTapAction: () async {
                                  logFirebaseEvent(
                                      'BUILDING_QUESTION2_PAGE_veryBad_CALLBACK');
                                  logFirebaseEvent('veryBad_update_page_state');
                                  _model.availability =
                                      BuildingAvailability.veryBad;
                                  _model.likedAnswers = [];
                                  _model.dislikedAnswers = [];
                                  safeSetState(() {});
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: wrapWithModel(
                              model: _model.badModel,
                              updateCallback: () => safeSetState(() {}),
                              child: BuildingSelectorWidget(
                                isSelected: _model.availability ==
                                    BuildingAvailability.bad,
                                emoji: '😔',
                                title: 'Плохо',
                                onTapAction: () async {
                                  logFirebaseEvent(
                                      'BUILDING_QUESTION2_PAGE_bad_CALLBACK');
                                  logFirebaseEvent('bad_update_page_state');
                                  _model.availability =
                                      BuildingAvailability.bad;
                                  _model.likedAnswers = [];
                                  _model.dislikedAnswers = [];
                                  safeSetState(() {});
                                },
                              ),
                            ),
                          ),
                        ].divide(SizedBox(width: 24.0)),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            flex: 1,
                            child: wrapWithModel(
                              model: _model.neutralModel,
                              updateCallback: () => safeSetState(() {}),
                              child: BuildingSelectorWidget(
                                isSelected: _model.availability ==
                                    BuildingAvailability.neutral,
                                emoji: '🙄',
                                title: 'Нейтрально',
                                onTapAction: () async {
                                  logFirebaseEvent(
                                      'BUILDING_QUESTION2_PAGE_neutral_CALLBACK');
                                  logFirebaseEvent('neutral_update_page_state');
                                  _model.availability =
                                      BuildingAvailability.neutral;
                                  _model.likedAnswers = [];
                                  _model.dislikedAnswers = [];
                                  safeSetState(() {});
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: wrapWithModel(
                              model: _model.goodModel,
                              updateCallback: () => safeSetState(() {}),
                              child: BuildingSelectorWidget(
                                isSelected: _model.availability ==
                                    BuildingAvailability.good,
                                emoji: '😌',
                                title: 'Хорошо',
                                onTapAction: () async {
                                  logFirebaseEvent(
                                      'BUILDING_QUESTION2_PAGE_good_CALLBACK');
                                  logFirebaseEvent('good_update_page_state');
                                  _model.availability =
                                      BuildingAvailability.good;
                                  _model.likedAnswers = [];
                                  _model.dislikedAnswers = [];
                                  safeSetState(() {});
                                },
                              ),
                            ),
                          ),
                        ].divide(SizedBox(width: 24.0)),
                      ),
                      wrapWithModel(
                        model: _model.veryGoodModel,
                        updateCallback: () => safeSetState(() {}),
                        child: BuildingSelectorWidget(
                          isSelected: _model.availability ==
                              BuildingAvailability.veryGood,
                          emoji: '😍',
                          title: 'Очень хорошо',
                          onTapAction: () async {
                            logFirebaseEvent(
                                'BUILDING_QUESTION2_veryGood_CALLBACK');
                            logFirebaseEvent('veryGood_update_page_state');
                            _model.availability = BuildingAvailability.veryGood;
                            _model.likedAnswers = [];
                            _model.dislikedAnswers = [];
                            safeSetState(() {});
                          },
                        ),
                      ),
                    ].divide(SizedBox(height: 16.0)),
                  ),
                ),
                if ((_model.availability == BuildingAvailability.veryGood) ||
                    (_model.availability == BuildingAvailability.good))
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'bgni3wvx' /* Что понравилось больше всего? */,
                          ),
                          textAlign: TextAlign.start,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    color: Color(0xFF374151),
                                    fontSize: 22.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: wrapWithModel(
                                model: _model.buildingSelectorModel1,
                                updateCallback: () => safeSetState(() {}),
                                child: BuildingSelectorWidget(
                                  isSelected: _model.likedAnswers
                                      .contains(BuildingAnswers.ramp),
                                  title: 'Наличие пандусов',
                                  onTapAction: () async {
                                    logFirebaseEvent(
                                        'BUILDING_QUESTION2_Container_7tqjtbpb_CA');
                                    if (_model.likedAnswers
                                        .contains(BuildingAnswers.ramp)) {
                                      logFirebaseEvent(
                                          'BuildingSelector_update_page_state');
                                      _model.removeFromLikedAnswers(
                                          BuildingAnswers.ramp);
                                      safeSetState(() {});
                                    } else {
                                      logFirebaseEvent(
                                          'BuildingSelector_update_page_state');
                                      _model.addToLikedAnswers(
                                          BuildingAnswers.ramp);
                                      safeSetState(() {});
                                    }
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: wrapWithModel(
                                model: _model.buildingSelectorModel2,
                                updateCallback: () => safeSetState(() {}),
                                child: BuildingSelectorWidget(
                                  isSelected: _model.likedAnswers
                                      .contains(BuildingAnswers.doorWayWidth),
                                  title: 'Ширина дверных проемов',
                                  onTapAction: () async {
                                    logFirebaseEvent(
                                        'BUILDING_QUESTION2_Container_of1jcyuw_CA');
                                    if (_model.likedAnswers.contains(
                                        BuildingAnswers.doorWayWidth)) {
                                      logFirebaseEvent(
                                          'BuildingSelector_update_page_state');
                                      _model.removeFromLikedAnswers(
                                          BuildingAnswers.doorWayWidth);
                                      safeSetState(() {});
                                    } else {
                                      logFirebaseEvent(
                                          'BuildingSelector_update_page_state');
                                      _model.addToLikedAnswers(
                                          BuildingAnswers.doorWayWidth);
                                      safeSetState(() {});
                                    }
                                  },
                                ),
                              ),
                            ),
                          ].divide(SizedBox(width: 24.0)),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: wrapWithModel(
                                model: _model.buildingSelectorModel3,
                                updateCallback: () => safeSetState(() {}),
                                child: BuildingSelectorWidget(
                                  isSelected: _model.likedAnswers
                                      .contains(BuildingAnswers.lift),
                                  title: 'Доступность лифта или подъемника',
                                  onTapAction: () async {
                                    logFirebaseEvent(
                                        'BUILDING_QUESTION2_Container_3qaf7d3x_CA');
                                    if (_model.likedAnswers
                                        .contains(BuildingAnswers.lift)) {
                                      logFirebaseEvent(
                                          'BuildingSelector_update_page_state');
                                      _model.removeFromLikedAnswers(
                                          BuildingAnswers.lift);
                                      safeSetState(() {});
                                    } else {
                                      logFirebaseEvent(
                                          'BuildingSelector_update_page_state');
                                      _model.addToLikedAnswers(
                                          BuildingAnswers.lift);
                                      safeSetState(() {});
                                    }
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: wrapWithModel(
                                model: _model.buildingSelectorModel4,
                                updateCallback: () => safeSetState(() {}),
                                child: BuildingSelectorWidget(
                                  isSelected: _model.likedAnswers
                                      .contains(BuildingAnswers.sidewalk),
                                  title: 'Состояние тротуаров и дорожек рядом',
                                  onTapAction: () async {
                                    logFirebaseEvent(
                                        'BUILDING_QUESTION2_Container_cqzmi1gw_CA');
                                    if (_model.likedAnswers
                                        .contains(BuildingAnswers.sidewalk)) {
                                      logFirebaseEvent(
                                          'BuildingSelector_update_page_state');
                                      _model.removeFromLikedAnswers(
                                          BuildingAnswers.sidewalk);
                                      safeSetState(() {});
                                    } else {
                                      logFirebaseEvent(
                                          'BuildingSelector_update_page_state');
                                      _model.addToLikedAnswers(
                                          BuildingAnswers.sidewalk);
                                      safeSetState(() {});
                                    }
                                  },
                                ),
                              ),
                            ),
                          ].divide(SizedBox(width: 24.0)),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: wrapWithModel(
                                model: _model.buildingSelectorModel5,
                                updateCallback: () => safeSetState(() {}),
                                child: BuildingSelectorWidget(
                                  isSelected: _model.likedAnswers
                                      .contains(BuildingAnswers.restroom),
                                  title: 'Доступность туалетов',
                                  onTapAction: () async {
                                    logFirebaseEvent(
                                        'BUILDING_QUESTION2_Container_rlhru9xz_CA');
                                    if (_model.likedAnswers
                                        .contains(BuildingAnswers.restroom)) {
                                      logFirebaseEvent(
                                          'BuildingSelector_update_page_state');
                                      _model.removeFromLikedAnswers(
                                          BuildingAnswers.restroom);
                                      safeSetState(() {});
                                    } else {
                                      logFirebaseEvent(
                                          'BuildingSelector_update_page_state');
                                      _model.addToLikedAnswers(
                                          BuildingAnswers.restroom);
                                      safeSetState(() {});
                                    }
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: wrapWithModel(
                                model: _model.buildingSelectorModel6,
                                updateCallback: () => safeSetState(() {}),
                                child: BuildingSelectorWidget(
                                  isSelected: _model.likedAnswers
                                      .contains(BuildingAnswers.helpButton),
                                  title: 'Кнопка вызова сотрудника',
                                  onTapAction: () async {
                                    logFirebaseEvent(
                                        'BUILDING_QUESTION2_Container_ooylacc8_CA');
                                    if (_model.likedAnswers
                                        .contains(BuildingAnswers.helpButton)) {
                                      logFirebaseEvent(
                                          'BuildingSelector_update_page_state');
                                      _model.removeFromLikedAnswers(
                                          BuildingAnswers.helpButton);
                                      safeSetState(() {});
                                    } else {
                                      logFirebaseEvent(
                                          'BuildingSelector_update_page_state');
                                      _model.addToLikedAnswers(
                                          BuildingAnswers.helpButton);
                                      safeSetState(() {});
                                    }
                                  },
                                ),
                              ),
                            ),
                          ].divide(SizedBox(width: 24.0)),
                        ),
                        wrapWithModel(
                          model: _model.buildingSelectorModel7,
                          updateCallback: () => safeSetState(() {}),
                          child: BuildingSelectorWidget(
                            isSelected: _model.likedAnswers
                                .contains(BuildingAnswers.all),
                            title: 'Всё вышеперечисленное',
                            onTapAction: () async {
                              logFirebaseEvent(
                                  'BUILDING_QUESTION2_Container_glajnaau_CA');
                              if (_model.likedAnswers
                                  .contains(BuildingAnswers.all)) {
                                logFirebaseEvent(
                                    'BuildingSelector_update_page_state');
                                _model.likedAnswers = [];
                                safeSetState(() {});
                              } else {
                                logFirebaseEvent(
                                    'BuildingSelector_update_page_state');
                                _model.likedAnswers = [];
                                safeSetState(() {});
                                logFirebaseEvent(
                                    'BuildingSelector_update_page_state');
                                _model.addToLikedAnswers(BuildingAnswers.all);
                                safeSetState(() {});
                              }
                            },
                          ),
                        ),
                      ].divide(SizedBox(height: 16.0)),
                    ),
                  ),
                if ((_model.availability == BuildingAvailability.veryBad) ||
                    (_model.availability == BuildingAvailability.bad) ||
                    (_model.availability == BuildingAvailability.neutral))
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'tbd6zk52' /* С чем возникли сложности? */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    color: Color(0xFF374151),
                                    fontSize: 22.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                '71jtrfc0' /* Есть ли удобные пандусы? */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: wrapWithModel(
                                    model: _model.buildingSelectorModel8,
                                    updateCallback: () => safeSetState(() {}),
                                    child: BuildingSelectorWidget(
                                      isSelected: _model.dislikedAnswers
                                          .contains(BuildingAnswers.noRamp1),
                                      title: 'Нет',
                                      onTapAction: () async {
                                        logFirebaseEvent(
                                            'BUILDING_QUESTION2_Container_898hxevq_CA');
                                        logFirebaseEvent(
                                            'BuildingSelector_update_page_state');
                                        _model.removeFromDislikedAnswers(
                                            BuildingAnswers.noRamp2);
                                        safeSetState(() {});
                                        if (_model.dislikedAnswers.contains(
                                            BuildingAnswers.noRamp1)) {
                                          logFirebaseEvent(
                                              'BuildingSelector_update_page_state');
                                          _model.removeFromDislikedAnswers(
                                              BuildingAnswers.noRamp1);
                                          safeSetState(() {});
                                        } else {
                                          logFirebaseEvent(
                                              'BuildingSelector_update_page_state');
                                          _model.addToDislikedAnswers(
                                              BuildingAnswers.noRamp1);
                                          safeSetState(() {});
                                        }
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: wrapWithModel(
                                    model: _model.buildingSelectorModel9,
                                    updateCallback: () => safeSetState(() {}),
                                    child: BuildingSelectorWidget(
                                      isSelected: _model.dislikedAnswers
                                          .contains(BuildingAnswers.noRamp2),
                                      title: 'Да, но есть трудности',
                                      onTapAction: () async {
                                        logFirebaseEvent(
                                            'BUILDING_QUESTION2_Container_58b6yoz1_CA');
                                        logFirebaseEvent(
                                            'BuildingSelector_update_page_state');
                                        _model.removeFromDislikedAnswers(
                                            BuildingAnswers.noRamp1);
                                        safeSetState(() {});
                                        if (_model.dislikedAnswers.contains(
                                            BuildingAnswers.noRamp2)) {
                                          logFirebaseEvent(
                                              'BuildingSelector_update_page_state');
                                          _model.removeFromDislikedAnswers(
                                              BuildingAnswers.noRamp2);
                                          safeSetState(() {});
                                        } else {
                                          logFirebaseEvent(
                                              'BuildingSelector_update_page_state');
                                          _model.addToDislikedAnswers(
                                              BuildingAnswers.noRamp2);
                                          safeSetState(() {});
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 24.0)),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'kq4sq87v' /* Достаточна ли ширина дверных п... */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: wrapWithModel(
                                    model: _model.buildingSelectorModel10,
                                    updateCallback: () => safeSetState(() {}),
                                    child: BuildingSelectorWidget(
                                      isSelected: _model.dislikedAnswers
                                          .contains(
                                              BuildingAnswers.noDoorWayWidth1),
                                      title: 'Недостаточная ширина',
                                      onTapAction: () async {
                                        logFirebaseEvent(
                                            'BUILDING_QUESTION2_Container_jr9sbx4h_CA');
                                        logFirebaseEvent(
                                            'BuildingSelector_update_page_state');
                                        _model.removeFromDislikedAnswers(
                                            BuildingAnswers.noDoorWayWidth2);
                                        safeSetState(() {});
                                        if (_model.dislikedAnswers.contains(
                                            BuildingAnswers.noDoorWayWidth1)) {
                                          logFirebaseEvent(
                                              'BuildingSelector_update_page_state');
                                          _model.removeFromDislikedAnswers(
                                              BuildingAnswers.noDoorWayWidth1);
                                          safeSetState(() {});
                                        } else {
                                          logFirebaseEvent(
                                              'BuildingSelector_update_page_state');
                                          _model.addToDislikedAnswers(
                                              BuildingAnswers.noDoorWayWidth1);
                                          safeSetState(() {});
                                        }
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: wrapWithModel(
                                    model: _model.buildingSelectorModel11,
                                    updateCallback: () => safeSetState(() {}),
                                    child: BuildingSelectorWidget(
                                      isSelected: _model.dislikedAnswers
                                          .contains(
                                              BuildingAnswers.noDoorWayWidth2),
                                      title: 'Достаточная, но затруднён проезд',
                                      onTapAction: () async {
                                        logFirebaseEvent(
                                            'BUILDING_QUESTION2_Container_choch6ky_CA');
                                        logFirebaseEvent(
                                            'BuildingSelector_update_page_state');
                                        _model.removeFromDislikedAnswers(
                                            BuildingAnswers.noDoorWayWidth1);
                                        safeSetState(() {});
                                        if (_model.dislikedAnswers.contains(
                                            BuildingAnswers.noDoorWayWidth2)) {
                                          logFirebaseEvent(
                                              'BuildingSelector_update_page_state');
                                          _model.removeFromDislikedAnswers(
                                              BuildingAnswers.noDoorWayWidth2);
                                          safeSetState(() {});
                                        } else {
                                          logFirebaseEvent(
                                              'BuildingSelector_update_page_state');
                                          _model.addToDislikedAnswers(
                                              BuildingAnswers.noDoorWayWidth2);
                                          safeSetState(() {});
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 24.0)),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'p6sx8toa' /* Доступен ли лифт или подъемник... */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: wrapWithModel(
                                    model: _model.buildingSelectorModel12,
                                    updateCallback: () => safeSetState(() {}),
                                    child: BuildingSelectorWidget(
                                      isSelected: _model.dislikedAnswers
                                          .contains(BuildingAnswers.noLift1),
                                      title: 'Лифт или подъёмник отсутствует',
                                      onTapAction: () async {
                                        logFirebaseEvent(
                                            'BUILDING_QUESTION2_Container_2udhmiww_CA');
                                        logFirebaseEvent(
                                            'BuildingSelector_update_page_state');
                                        _model.removeFromDislikedAnswers(
                                            BuildingAnswers.noLift2);
                                        safeSetState(() {});
                                        if (_model.dislikedAnswers.contains(
                                            BuildingAnswers.noLift1)) {
                                          logFirebaseEvent(
                                              'BuildingSelector_update_page_state');
                                          _model.removeFromDislikedAnswers(
                                              BuildingAnswers.noLift1);
                                          safeSetState(() {});
                                        } else {
                                          logFirebaseEvent(
                                              'BuildingSelector_update_page_state');
                                          _model.addToDislikedAnswers(
                                              BuildingAnswers.noLift1);
                                          safeSetState(() {});
                                        }
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: wrapWithModel(
                                    model: _model.buildingSelectorModel13,
                                    updateCallback: () => safeSetState(() {}),
                                    child: BuildingSelectorWidget(
                                      isSelected: _model.dislikedAnswers
                                          .contains(BuildingAnswers.noLift2),
                                      title: 'Есть, но сложно воспользоваться',
                                      onTapAction: () async {
                                        logFirebaseEvent(
                                            'BUILDING_QUESTION2_Container_6p6vgdsq_CA');
                                        logFirebaseEvent(
                                            'BuildingSelector_update_page_state');
                                        _model.removeFromDislikedAnswers(
                                            BuildingAnswers.noLift1);
                                        safeSetState(() {});
                                        if (_model.dislikedAnswers.contains(
                                            BuildingAnswers.noLift2)) {
                                          logFirebaseEvent(
                                              'BuildingSelector_update_page_state');
                                          _model.removeFromDislikedAnswers(
                                              BuildingAnswers.noLift2);
                                          safeSetState(() {});
                                        } else {
                                          logFirebaseEvent(
                                              'BuildingSelector_update_page_state');
                                          _model.addToDislikedAnswers(
                                              BuildingAnswers.noLift2);
                                          safeSetState(() {});
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 24.0)),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                's0pan1xu' /* Состояние тротуаров */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: wrapWithModel(
                                    model: _model.buildingSelectorModel14,
                                    updateCallback: () => safeSetState(() {}),
                                    child: BuildingSelectorWidget(
                                      isSelected: _model.dislikedAnswers
                                          .contains(
                                              BuildingAnswers.noSidewalk1),
                                      title: 'В плохом состоянии',
                                      onTapAction: () async {
                                        logFirebaseEvent(
                                            'BUILDING_QUESTION2_Container_vxd8by2z_CA');
                                        logFirebaseEvent(
                                            'BuildingSelector_update_page_state');
                                        _model.removeFromDislikedAnswers(
                                            BuildingAnswers.noSidewalk2);
                                        safeSetState(() {});
                                        if (_model.dislikedAnswers.contains(
                                            BuildingAnswers.noSidewalk1)) {
                                          logFirebaseEvent(
                                              'BuildingSelector_update_page_state');
                                          _model.removeFromDislikedAnswers(
                                              BuildingAnswers.noSidewalk1);
                                          safeSetState(() {});
                                        } else {
                                          logFirebaseEvent(
                                              'BuildingSelector_update_page_state');
                                          _model.addToDislikedAnswers(
                                              BuildingAnswers.noSidewalk1);
                                          safeSetState(() {});
                                        }
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: wrapWithModel(
                                    model: _model.buildingSelectorModel15,
                                    updateCallback: () => safeSetState(() {}),
                                    child: BuildingSelectorWidget(
                                      isSelected: _model.dislikedAnswers
                                          .contains(
                                              BuildingAnswers.noSidewalk2),
                                      title:
                                          'В целом нормально, но есть препятствия',
                                      onTapAction: () async {
                                        logFirebaseEvent(
                                            'BUILDING_QUESTION2_Container_li0vkpqh_CA');
                                        logFirebaseEvent(
                                            'BuildingSelector_update_page_state');
                                        _model.removeFromDislikedAnswers(
                                            BuildingAnswers.noSidewalk1);
                                        safeSetState(() {});
                                        if (_model.dislikedAnswers.contains(
                                            BuildingAnswers.noSidewalk2)) {
                                          logFirebaseEvent(
                                              'BuildingSelector_update_page_state');
                                          _model.removeFromDislikedAnswers(
                                              BuildingAnswers.noSidewalk2);
                                          safeSetState(() {});
                                        } else {
                                          logFirebaseEvent(
                                              'BuildingSelector_update_page_state');
                                          _model.addToDislikedAnswers(
                                              BuildingAnswers.noSidewalk2);
                                          safeSetState(() {});
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 24.0)),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'fv9cruxr' /* Доступность туалетов */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: wrapWithModel(
                                    model: _model.buildingSelectorModel16,
                                    updateCallback: () => safeSetState(() {}),
                                    child: BuildingSelectorWidget(
                                      isSelected: _model.dislikedAnswers
                                          .contains(
                                              BuildingAnswers.noRestroom1),
                                      title: 'Туалет недоступен',
                                      onTapAction: () async {
                                        logFirebaseEvent(
                                            'BUILDING_QUESTION2_Container_53ex524o_CA');
                                        logFirebaseEvent(
                                            'BuildingSelector_update_page_state');
                                        _model.removeFromDislikedAnswers(
                                            BuildingAnswers.noRestroom2);
                                        safeSetState(() {});
                                        if (_model.dislikedAnswers.contains(
                                            BuildingAnswers.noRestroom1)) {
                                          logFirebaseEvent(
                                              'BuildingSelector_update_page_state');
                                          _model.removeFromDislikedAnswers(
                                              BuildingAnswers.noRestroom1);
                                          safeSetState(() {});
                                        } else {
                                          logFirebaseEvent(
                                              'BuildingSelector_update_page_state');
                                          _model.addToDislikedAnswers(
                                              BuildingAnswers.noRestroom1);
                                          safeSetState(() {});
                                        }
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: wrapWithModel(
                                    model: _model.buildingSelectorModel17,
                                    updateCallback: () => safeSetState(() {}),
                                    child: BuildingSelectorWidget(
                                      isSelected: _model.dislikedAnswers
                                          .contains(
                                              BuildingAnswers.noRestroom2),
                                      title: 'Доступен, но есть трудности',
                                      onTapAction: () async {
                                        logFirebaseEvent(
                                            'BUILDING_QUESTION2_Container_hb36z75o_CA');
                                        logFirebaseEvent(
                                            'BuildingSelector_update_page_state');
                                        _model.removeFromDislikedAnswers(
                                            BuildingAnswers.noRestroom1);
                                        safeSetState(() {});
                                        if (_model.dislikedAnswers.contains(
                                            BuildingAnswers.noRestroom2)) {
                                          logFirebaseEvent(
                                              'BuildingSelector_update_page_state');
                                          _model.removeFromDislikedAnswers(
                                              BuildingAnswers.noRestroom2);
                                          safeSetState(() {});
                                        } else {
                                          logFirebaseEvent(
                                              'BuildingSelector_update_page_state');
                                          _model.addToDislikedAnswers(
                                              BuildingAnswers.noRestroom2);
                                          safeSetState(() {});
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 24.0)),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'bsr0rqew' /* Кнопка вызова сотрудника */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: wrapWithModel(
                                    model: _model.buildingSelectorModel18,
                                    updateCallback: () => safeSetState(() {}),
                                    child: BuildingSelectorWidget(
                                      isSelected: _model.dislikedAnswers
                                          .contains(
                                              BuildingAnswers.noHelpButton1),
                                      title: 'Отсутствует',
                                      onTapAction: () async {
                                        logFirebaseEvent(
                                            'BUILDING_QUESTION2_Container_tmu27wbw_CA');
                                        logFirebaseEvent(
                                            'BuildingSelector_update_page_state');
                                        _model.removeFromDislikedAnswers(
                                            BuildingAnswers.noHelpButton2);
                                        safeSetState(() {});
                                        if (_model.dislikedAnswers.contains(
                                            BuildingAnswers.noHelpButton1)) {
                                          logFirebaseEvent(
                                              'BuildingSelector_update_page_state');
                                          _model.removeFromDislikedAnswers(
                                              BuildingAnswers.noHelpButton1);
                                          safeSetState(() {});
                                        } else {
                                          logFirebaseEvent(
                                              'BuildingSelector_update_page_state');
                                          _model.addToDislikedAnswers(
                                              BuildingAnswers.noHelpButton1);
                                          safeSetState(() {});
                                        }
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: wrapWithModel(
                                    model: _model.buildingSelectorModel19,
                                    updateCallback: () => safeSetState(() {}),
                                    child: BuildingSelectorWidget(
                                      isSelected: _model.dislikedAnswers
                                          .contains(
                                              BuildingAnswers.noHelpButton2),
                                      title: 'Есть, но сложно использовать',
                                      onTapAction: () async {
                                        logFirebaseEvent(
                                            'BUILDING_QUESTION2_Container_xw868h6u_CA');
                                        logFirebaseEvent(
                                            'BuildingSelector_update_page_state');
                                        _model.removeFromDislikedAnswers(
                                            BuildingAnswers.noHelpButton1);
                                        safeSetState(() {});
                                        if (_model.dislikedAnswers.contains(
                                            BuildingAnswers.noHelpButton2)) {
                                          logFirebaseEvent(
                                              'BuildingSelector_update_page_state');
                                          _model.removeFromDislikedAnswers(
                                              BuildingAnswers.noHelpButton2);
                                          safeSetState(() {});
                                        } else {
                                          logFirebaseEvent(
                                              'BuildingSelector_update_page_state');
                                          _model.addToDislikedAnswers(
                                              BuildingAnswers.noHelpButton2);
                                          safeSetState(() {});
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 24.0)),
                            ),
                          ],
                        ),
                      ].divide(SizedBox(height: 24.0)),
                    ),
                  ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'dw0nhknb' /* Опишите свой опыт */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              color: Color(0xFF8F8F8F),
                              letterSpacing: 0.0,
                            ),
                      ),
                      Container(
                        width: 200.0,
                        child: TextFormField(
                          controller: _model.textController,
                          focusNode: _model.textFieldFocusNode,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.textController',
                            Duration(milliseconds: 2000),
                            () async {
                              logFirebaseEvent(
                                  'BUILDING_QUESTION2_TextField_husmeugn_ON');
                              logFirebaseEvent('TextField_update_page_state');
                              _model.comment = _model.textController.text;
                              safeSetState(() {});
                            },
                          ),
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFA7A7A7),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
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
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                          cursorColor: FlutterFlowTheme.of(context).primaryText,
                          validator: _model.textControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (_model.localImages.length > 0)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            border: Border.all(
                              color: Color(0xFF5D73EF),
                            ),
                          ),
                          child: Builder(
                            builder: (context) {
                              final carouselmages = _model.localImages.toList();

                              return Container(
                                width: double.infinity,
                                height: 200.0,
                                child: CarouselSlider.builder(
                                  itemCount: carouselmages.length,
                                  itemBuilder:
                                      (context, carouselmagesIndex, _) {
                                    final carouselmagesItem =
                                        carouselmages[carouselmagesIndex];
                                    return Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.memory(
                                            carouselmagesItem.bytes ??
                                                Uint8List.fromList([]),
                                            width: 200.0,
                                            height: 200.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.0, -1.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'BUILDING_QUESTION2_PAGE__BTN_ON_TAP');
                                              logFirebaseEvent(
                                                  'Button_update_page_state');
                                              _model.removeFromLocalImages(
                                                  carouselmagesItem);
                                              safeSetState(() {});
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              '2ny5i1sg' /*  */,
                                            ),
                                            icon: Icon(
                                              Icons.close,
                                              size: 30.0,
                                            ),
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Color(0x00EF3939),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color: Colors.white,
                                                        fontSize: 0.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            showLoadingIndicator: false,
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                  carouselController:
                                      _model.carouselController ??=
                                          CarouselSliderController(),
                                  options: CarouselOptions(
                                    initialPage: max(
                                        0, min(1, carouselmages.length - 1)),
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
                        ),
                      ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'BUILDING_QUESTION2_Container_g4cgarbo_ON');
                          logFirebaseEvent('Container_store_media_for_upload');
                          final selectedMedia =
                              await selectMediaWithSourceBottomSheet(
                            context: context,
                            maxWidth: 1000.00,
                            maxHeight: 1000.00,
                            imageQuality: 100,
                            allowPhoto: true,
                            includeBlurHash: true,
                          );
                          if (selectedMedia != null &&
                              selectedMedia.every((m) =>
                                  validateFileFormat(m.storagePath, context))) {
                            safeSetState(() => _model
                                    .isDataUploading_localBuildingUploadedImage =
                                true);
                            var selectedUploadedFiles = <FFUploadedFile>[];

                            try {
                              showUploadMessage(
                                context,
                                'Uploading file...',
                                showLoading: true,
                              );
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
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                              _model.isDataUploading_localBuildingUploadedImage =
                                  false;
                            }
                            if (selectedUploadedFiles.length ==
                                selectedMedia.length) {
                              safeSetState(() {
                                _model.uploadedLocalFile_localBuildingUploadedImage =
                                    selectedUploadedFiles.first;
                              });
                              showUploadMessage(context, 'Success!');
                            } else {
                              safeSetState(() {});
                              showUploadMessage(
                                  context, 'Failed to upload data');
                              return;
                            }
                          }

                          if (_model.uploadedLocalFile_localBuildingUploadedImage !=
                                  null &&
                              (_model.uploadedLocalFile_localBuildingUploadedImage
                                      .bytes?.isNotEmpty ??
                                  false)) {
                            logFirebaseEvent('Container_update_page_state');
                            _model.addToLocalImages(_model
                                .uploadedLocalFile_localBuildingUploadedImage);
                            safeSetState(() {});
                          }
                        },
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: Color(0xFF5D73EF),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (_model.localImages.length <= 0)
                                  Icon(
                                    Icons.camera_alt_outlined,
                                    color: Color(0xFF5D73EF),
                                    size: 24.0,
                                  ),
                                if (_model.localImages.length <= 0)
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'hae2tz3v' /* Прикрепить фото */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: Color(0xFF5D73EF),
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                if (_model.localImages.length > 0)
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      '4zomp87c' /* + добавить еще фото */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: Color(0xFF5D73EF),
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ].divide(SizedBox(height: 24.0)),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: (_model.availability == null)
                        ? null
                        : () async {
                            logFirebaseEvent(
                                'BUILDING_QUESTION2_PAGE__BTN_ON_TAP');
                            logFirebaseEvent('Button_upload_media_to_firebase');
                            {
                              safeSetState(() => _model
                                      .isDataUploading_buildingUploadedImages =
                                  true);
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
                                    (m) async => await uploadData(
                                        m.storagePath, m.bytes),
                                  ),
                                ))
                                    .where((u) => u != null)
                                    .map((u) => u!)
                                    .toList();
                              } finally {
                                _model.isDataUploading_buildingUploadedImages =
                                    false;
                              }
                              if (selectedUploadedFiles.length ==
                                      selectedMedia.length &&
                                  downloadUrls.length == selectedMedia.length) {
                                safeSetState(() {
                                  _model.uploadedLocalFiles_buildingUploadedImages =
                                      selectedUploadedFiles;
                                  _model.uploadedFileUrls_buildingUploadedImages =
                                      downloadUrls;
                                });
                              } else {
                                safeSetState(() {});
                                return;
                              }
                            }

                            logFirebaseEvent('Button_backend_call');

                            await BuildingRecord.collection.doc().set({
                              ...createBuildingRecordData(
                                createdBy: currentUserReference,
                                location: _model.selectedLocation,
                                comment: _model.textController.text,
                                locationTitle: _model.selectedLocationTitle,
                                availability: _model.availability,
                              ),
                              ...mapToFirestore(
                                {
                                  'created_time': FieldValue.serverTimestamp(),
                                  'images': _model
                                      .uploadedFileUrls_buildingUploadedImages,
                                  'liked': _model.likedAnswers
                                      ?.map((e) => e.serialize())
                                      .toList(),
                                  'disliked': _model.dislikedAnswers
                                      ?.map((e) => e.serialize())
                                      .toList(),
                                  'building_types': widget!.buildingTypes,
                                },
                              ),
                            });
                            logFirebaseEvent('Button_navigate_to');

                            context.goNamed(CompleteWidget.routeName);
                          },
                    text: FFLocalizations.of(context).getText(
                      '87tul4rh' /* Завершить */,
                    ),
                    options: FFButtonOptions(
                      width: 330.0,
                      height: 48.0,
                      padding: EdgeInsets.all(0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Color(0xFF53B153),
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
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
                      disabledColor: Color(0xFF54626D),
                    ),
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
