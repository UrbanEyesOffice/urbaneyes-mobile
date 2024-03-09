import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:provider/provider.dart';
import 'google_maps_model.dart';
export 'google_maps_model.dart';

class GoogleMapsWidget extends StatefulWidget {
  const GoogleMapsWidget({
    super.key,
    required this.selectedLocationCallback,
    this.locationInput,
    this.locationInputTitle,
  });

  final Future Function(LatLng? location, String locationTitle)?
      selectedLocationCallback;
  final LatLng? locationInput;
  final String? locationInputTitle;

  @override
  State<GoogleMapsWidget> createState() => _GoogleMapsWidgetState();
}

class _GoogleMapsWidgetState extends State<GoogleMapsWidget> {
  late GoogleMapsModel _model;

  LatLng? currentUserLocationValue;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GoogleMapsModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('GOOGLE_MAPS_GoogleMaps_ON_INIT_STATE');
      logFirebaseEvent('GoogleMaps_show_snack_bar');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'test test',
            style: TextStyle(
              color: FlutterFlowTheme.of(context).primaryText,
            ),
          ),
          duration: Duration(milliseconds: 4000),
          backgroundColor: FlutterFlowTheme.of(context).secondary,
        ),
      );
    });

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: 50.0,
          constraints: BoxConstraints(
            maxWidth: MediaQuery.sizeOf(context).width * 1.0,
            maxHeight: 50.0,
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Text(
              FFLocalizations.of(context).getText(
                '85bbwmvo' /* Выберите локацию */,
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    useGoogleFonts: false,
                  ),
            ),
          ),
        ),
        Expanded(
          child: Stack(
            children: [
              FlutterFlowGoogleMap(
                controller: _model.googleMapsController,
                onCameraIdle: (latLng) =>
                    setState(() => _model.googleMapsCenter = latLng),
                initialLocation: _model.googleMapsCenter ??=
                    widget.locationInput != null
                        ? widget.locationInput!
                        : currentUserLocationValue!,
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
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: PointerInterceptor(
                  intercepting: isWeb,
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
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
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: PointerInterceptor(
                  intercepting: isWeb,
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 48.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'GOOGLE_MAPS_ВЫБРАТЬ_ЭТУ_ЛОКАЦИЮ_BTN_ON_T');
                            logFirebaseEvent('Button_custom_action');
                            _model.selectedLocationOutput =
                                await actions.getAddressFromLatLngGoogleMaps(
                              _model.googleMapsCenter,
                              FFLocalizations.of(context).languageCode,
                            );
                            logFirebaseEvent('Button_update_component_state');
                            setState(() {
                              _model.selectedLocationTitle =
                                  _model.selectedLocationOutput;
                              _model.selectedLocation = _model.googleMapsCenter;
                            });

                            setState(() {});
                          },
                          text: (_model.selectedLocation == null) ||
                                  (widget.locationInput == null)
                              ? FFLocalizations.of(context).getVariableText(
                                  ruText: 'Выбрать эту локацию',
                                  enText: 'Select this location',
                                  kyText: 'Ушул жерди тандаңыз',
                                )
                              : FFLocalizations.of(context).getVariableText(
                                  ruText: 'Изменить локацию',
                                  enText: 'Change location',
                                  kyText: 'Жайгашкан жерди өзгөртүү',
                                ),
                          options: FFButtonOptions(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 48.0,
                            padding: EdgeInsets.all(0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Color(0xFFCEEFCD),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
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
                        if ((_model.selectedLocationTitle != null &&
                                _model.selectedLocationTitle != '') ||
                            (widget.locationInputTitle != null &&
                                widget.locationInputTitle != ''))
                          FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'GOOGLE_MAPS_COMP_ПРОДОЛЖИТЬ_BTN_ON_TAP');
                              logFirebaseEvent('Button_execute_callback');
                              await widget.selectedLocationCallback?.call(
                                _model.selectedLocation,
                                valueOrDefault<String>(
                                  _model.selectedLocationTitle,
                                  '-',
                                ),
                              );
                              logFirebaseEvent(
                                  'Button_close_dialog,_drawer,_etc');
                              Navigator.pop(context);
                            },
                            text: FFLocalizations.of(context).getText(
                              'c9ejc1w0' /* Продолжить */,
                            ),
                            options: FFButtonOptions(
                              width: MediaQuery.sizeOf(context).width * 1.0,
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
                      ].divide(SizedBox(height: 8.0)),
                    ),
                  ),
                ),
              ),
              if ((_model.selectedLocationTitle != null &&
                      _model.selectedLocationTitle != '') ||
                  (widget.locationInputTitle != null &&
                      widget.locationInputTitle != ''))
                Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: PointerInterceptor(
                    intercepting: isWeb,
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
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
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                _model.selectedLocationTitle != null &&
                                        _model.selectedLocationTitle != ''
                                    ? _model.selectedLocationTitle!
                                    : widget.locationInputTitle!,
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Inter',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 14.0,
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
                ),
            ],
          ),
        ),
      ],
    );
  }
}
