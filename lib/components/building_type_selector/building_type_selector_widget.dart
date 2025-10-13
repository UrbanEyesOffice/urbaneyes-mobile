import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'building_type_selector_model.dart';
export 'building_type_selector_model.dart';

class BuildingTypeSelectorWidget extends StatefulWidget {
  const BuildingTypeSelectorWidget({
    super.key,
    required this.selectedTypesIn,
    required this.onSelectedTypes,
    required this.availableTypes,
  });

  final List<BuildingTypeStruct>? selectedTypesIn;
  final Future Function(List<BuildingTypeStruct> types)? onSelectedTypes;
  final List<BuildingTypeStruct>? availableTypes;

  @override
  State<BuildingTypeSelectorWidget> createState() =>
      _BuildingTypeSelectorWidgetState();
}

class _BuildingTypeSelectorWidgetState
    extends State<BuildingTypeSelectorWidget> {
  late BuildingTypeSelectorModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BuildingTypeSelectorModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('BUILDING_TYPE_SELECTOR_BuildingTypeSelec');
      logFirebaseEvent('BuildingTypeSelector_update_component_st');
      _model.selectedTypes =
          widget!.selectedTypesIn!.toList().cast<BuildingTypeStruct>();
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Builder(
              builder: (context) {
                final buildingTypesArray = widget!.availableTypes!
                    .sortedList(
                        keyOf: (e) => () {
                              if (FFLocalizations.of(context).languageCode ==
                                  'ru') {
                                return e.titleRu;
                              } else if (FFLocalizations.of(context)
                                      .languageCode ==
                                  'en') {
                                return e.titleEn;
                              } else {
                                return e.titleKg;
                              }
                            }(),
                        desc: false)
                    .toList();

                return ListView.builder(
                  padding: EdgeInsets.fromLTRB(
                    0,
                    0,
                    0,
                    80.0,
                  ),
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: buildingTypesArray.length,
                  itemBuilder: (context, buildingTypesArrayIndex) {
                    final buildingTypesArrayItem =
                        buildingTypesArray[buildingTypesArrayIndex];
                    return Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'BUILDING_TYPE_SELECTOR_Container_gj3ayoh');
                          if (_model.selectedTypes
                              .contains(buildingTypesArrayItem)) {
                            // Remove from seleted types
                            logFirebaseEvent(
                                'Container_Removefromseletedtypes');
                            _model.removeFromSelectedTypes(
                                buildingTypesArrayItem);
                            safeSetState(() {});
                          } else {
                            // Add to selected types
                            logFirebaseEvent('Container_Addtoselectedtypes');
                            _model.addToSelectedTypes(buildingTypesArrayItem);
                            safeSetState(() {});
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: _model.selectedTypes
                                    .contains(buildingTypesArrayItem)
                                ? Color(0xFFE0F4E8)
                                : Color(0x00000000),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 8.0, 16.0, 8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getVariableText(
                                    ruText: buildingTypesArrayItem.titleRu,
                                    enText: buildingTypesArrayItem.titleEn,
                                    kyText: buildingTypesArrayItem.titleKg,
                                  ),
                                  maxLines: 1,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                if (_model.selectedTypes
                                    .contains(buildingTypesArrayItem))
                                  Icon(
                                    Icons.check,
                                    color:
                                        FlutterFlowTheme.of(context).mainGreen,
                                    size: 24.0,
                                  ),
                              ].divide(SizedBox(width: 16.0)),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, 1.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
              child: FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('BUILDING_TYPE_SELECTOR_COMP__BTN_ON_TAP');
                  logFirebaseEvent('Button_execute_callback');
                  await widget.onSelectedTypes?.call(
                    _model.selectedTypes,
                  );
                  logFirebaseEvent('Button_close_dialog_drawer_etc');
                  Navigator.pop(context);
                },
                text: FFLocalizations.of(context).getText(
                  '45bew4no' /* Выбрать */,
                ),
                options: FFButtonOptions(
                  width: MediaQuery.sizeOf(context).width * 0.87,
                  height: 48.0,
                  padding: EdgeInsets.all(0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: Color(0xFF53B153),
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
