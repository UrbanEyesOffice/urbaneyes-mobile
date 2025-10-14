import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/building_selector/building_selector_widget.dart';
import '/components/osm/osm_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'building_question1_model.dart';
export 'building_question1_model.dart';

class BuildingQuestion1Widget extends StatefulWidget {
  const BuildingQuestion1Widget({super.key});

  static String routeName = 'BuildingQuestion1';
  static String routePath = '/buildingQuestion1';

  @override
  State<BuildingQuestion1Widget> createState() =>
      _BuildingQuestion1WidgetState();
}

class _BuildingQuestion1WidgetState extends State<BuildingQuestion1Widget> {
  late BuildingQuestion1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BuildingQuestion1Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'BuildingQuestion1'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('BUILDING_QUESTION1_BuildingQuestion1_ON_');
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
      logFirebaseEvent('BuildingQuestion1_request_permissions');
      await requestPermission(locationPermission);
      if (await getPermissionStatus(locationPermission)) {
        logFirebaseEvent('BuildingQuestion1_update_page_state');
        _model.selectedLocation = currentUserLocationValue;
        safeSetState(() {});
      } else {
        logFirebaseEvent('BuildingQuestion1_update_page_state');
        _model.selectedLocation = FFAppState().locationBishkek;
        safeSetState(() {});
      }

      logFirebaseEvent('BuildingQuestion1_custom_action');
      _model.locationTitleOnLoad = await actions.getAddressFromLatLngGoogleMaps(
        _model.selectedLocation,
        FFLocalizations.of(context).languageCode,
      );
      logFirebaseEvent('BuildingQuestion1_update_page_state');
      _model.selectedLocationTitle = _model.locationTitleOnLoad!;
      _model.isLoading = false;
      safeSetState(() {});
      logFirebaseEvent('BuildingQuestion1_bottom_sheet');
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
                    _model.selectedLocationTitle = locationTitle!;
                    safeSetState(() {});
                    logFirebaseEvent('_backend_call');
                    _model.buildingtypes =
                        await CityDashboardGroup.findBuildingCall.call(
                      lat: functions.latFormPosition(_model.selectedLocation!),
                      lon: functions.lngFormPosition(_model.selectedLocation!),
                    );

                    if ((_model.buildingtypes?.succeeded ?? true)) {
                      logFirebaseEvent('_custom_action');
                      _model.receivedBuildingTypes =
                          await actions.buildingTypesFromApi(
                        (getJsonField(
                          (_model.buildingtypes?.jsonBody ?? ''),
                          r'''$.building_types''',
                          true,
                        ) as List?)!
                            .map<String>((e) => e.toString())
                            .toList()
                            .cast<String>(),
                        FFAppState().BuildingTypes.toList(),
                      );
                      if ((_model.receivedBuildingTypes != null &&
                              (_model.receivedBuildingTypes)!.isNotEmpty) ==
                          true) {
                        logFirebaseEvent('_update_page_state');
                        _model.selectedTypes = _model.receivedBuildingTypes!
                            .toList()
                            .cast<BuildingTypeStruct>();
                        safeSetState(() {});
                      }
                    }
                  },
                ),
              ),
            ),
          );
        },
      ).then((value) => safeSetState(() {}));
    });

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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          iconTheme: IconThemeData(color: Colors.black),
          automaticallyImplyLeading: true,
          title: Text(
            FFLocalizations.of(context).getText(
              '6z8t9ky7' /* Доступность зданий */,
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
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (!_model.isLoading)
                  FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent(
                          'BUILDING_QUESTION1_ChooseLocation_ON_TAP');
                      logFirebaseEvent('ChooseLocation_bottom_sheet');
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
                      width: MediaQuery.sizeOf(context).width * 1.0,
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
                if (!_model.isLoading)
                  Text(
                    FFLocalizations.of(context).getText(
                      '81dluyxt' /* Выберите тип здания */,
                    ),
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          color: Color(0xFF828282),
                          fontSize: 13.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                if (!_model.isLoading)
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        Builder(
                          builder: (context) {
                            final buildingTypes = FFAppState()
                                .BuildingTypes
                                .sortedList(
                                    keyOf: (e) => FFLocalizations.of(context)
                                            .getVariableText(
                                          ruText: e.titleRu,
                                          enText: e.titleEn,
                                          kyText: e.titleKg,
                                        ),
                                    desc: false)
                                .toList();

                            return Wrap(
                              spacing: 16.0,
                              runSpacing: 16.0,
                              alignment: WrapAlignment.center,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              direction: Axis.horizontal,
                              runAlignment: WrapAlignment.start,
                              verticalDirection: VerticalDirection.down,
                              clipBehavior: Clip.none,
                              children: List.generate(buildingTypes.length,
                                  (buildingTypesIndex) {
                                final buildingTypesItem =
                                    buildingTypes[buildingTypesIndex];
                                return BuildingSelectorWidget(
                                  key: Key(
                                      'Keyxiw_${buildingTypesIndex}_of_${buildingTypes.length}'),
                                  isSelected: _model.selectedTypes
                                      .contains(buildingTypesItem),
                                  emoji: buildingTypesItem.emoji,
                                  title: FFLocalizations.of(context)
                                      .getVariableText(
                                    ruText: buildingTypesItem.titleRu,
                                    enText: buildingTypesItem.titleEn,
                                    kyText: buildingTypesItem.titleKg,
                                  ),
                                  onTapAction: () async {
                                    logFirebaseEvent(
                                        'BUILDING_QUESTION1_Container_xiwibsnw_CA');
                                    logFirebaseEvent(
                                        'BuildingSelector_update_page_state');
                                    _model.selectedTypes = [];
                                    safeSetState(() {});
                                    logFirebaseEvent(
                                        'BuildingSelector_update_page_state');
                                    _model
                                        .addToSelectedTypes(buildingTypesItem);
                                    safeSetState(() {});
                                  },
                                );
                              }),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                if (!_model.isLoading)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                    child: FFButtonWidget(
                      onPressed: (_model.selectedTypes.length <= 0)
                          ? null
                          : () async {
                              logFirebaseEvent(
                                  'BUILDING_QUESTION1_PAGE_Next_ON_TAP');
                              logFirebaseEvent('Next_navigate_to');

                              context.pushNamed(
                                BuildingQuestion2Widget.routeName,
                                queryParameters: {
                                  'selectedLocation': serializeParam(
                                    _model.selectedLocation,
                                    ParamType.LatLng,
                                  ),
                                  'selectedLocationTitle': serializeParam(
                                    _model.selectedLocationTitle,
                                    ParamType.String,
                                  ),
                                  'buildingTypes': serializeParam(
                                    _model.selectedTypes
                                        .map((e) => e.id)
                                        .toList(),
                                    ParamType.String,
                                    isList: true,
                                  ),
                                }.withoutNulls,
                              );
                            },
                      text: FFLocalizations.of(context).getText(
                        'h2xtww2y' /* Далее */,
                      ),
                      options: FFButtonOptions(
                        width: MediaQuery.sizeOf(context).width * 1.0,
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
                if (_model.isLoading)
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Lottie.asset(
                          'assets/jsons/UE_logo_animation.json',
                          width: 200.0,
                          height: 200.0,
                          fit: BoxFit.contain,
                          animate: true,
                        ),
                      ),
                    ),
                  ),
              ].divide(SizedBox(height: 8.0)),
            ),
          ),
        ),
      ),
    );
  }
}
