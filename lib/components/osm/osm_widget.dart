import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'osm_model.dart';
export 'osm_model.dart';

class OsmWidget extends StatefulWidget {
  const OsmWidget({
    super.key,
    required this.initialLocation,
    this.initialLocationTitle,
    required this.onSelectLocation,
  });

  final LatLng? initialLocation;
  final String? initialLocationTitle;
  final Future Function(LatLng? location, String? locationTitle)?
      onSelectLocation;

  @override
  State<OsmWidget> createState() => _OsmWidgetState();
}

class _OsmWidgetState extends State<OsmWidget> {
  late OsmModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OsmModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('OSM_COMP_OSM_ON_INIT_STATE');
      logFirebaseEvent('OSM_update_component_state');
      setState(() {
        _model.localLocationTitle = widget.initialLocationTitle;
        _model.localLocation = widget.initialLocation;
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            child: custom_widgets.OpenStreetMapWidget(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 1.0,
              initialLocation: widget.initialLocation!,
              onMapMoved: (mapCenter) async {
                logFirebaseEvent('OSM_COMP_Container_f6m7mksd_CALLBACK');
                logFirebaseEvent('OpenStreetMapWidget_custom_action');
                _model.osmAddress =
                    await actions.getAddressFromLatLngGoogleMaps(
                  mapCenter,
                  FFLocalizations.of(context).languageCode,
                );
                logFirebaseEvent('OpenStreetMapWidget_update_component_sta');
                setState(() {
                  _model.localLocationTitle = _model.osmAddress;
                  _model.localLocation = mapCenter;
                });

                setState(() {});
              },
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/Geo.png',
                height: 32.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, -1.0),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: 50.0,
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.sizeOf(context).width * 1.0,
                  maxHeight: 50.0,
                ),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'zsfs86g0' /* Выберите локацию */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          fontSize: 18.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, -1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Material(
                  color: Colors.transparent,
                  elevation: 3.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    constraints: BoxConstraints(
                      minWidth: MediaQuery.sizeOf(context).width * 0.5,
                      minHeight: 24.0,
                      maxWidth: MediaQuery.sizeOf(context).width * 1.0,
                      maxHeight: 48.0,
                    ),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          valueOrDefault<String>(
                            _model.localLocationTitle,
                            '-',
                          ),
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Inter',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                                useGoogleFonts: false,
                              ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('OSM_COMP_ПРОДОЛЖИТЬ_BTN_ON_TAP');
                      logFirebaseEvent('Button_execute_callback');
                      await widget.onSelectLocation?.call(
                        _model.localLocation,
                        _model.localLocationTitle,
                      );
                      logFirebaseEvent('Button_close_dialog,_drawer,_etc');
                      Navigator.pop(context);
                    },
                    text: FFLocalizations.of(context).getText(
                      '91278s2u' /* Продолжить */,
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
                ),
              ),
            ),
          ].divide(SizedBox(height: 16.0)).addToEnd(SizedBox(height: 16.0)),
        ),
      ],
    );
  }
}
