import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'osm_widget.dart' show OsmWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OsmModel extends FlutterFlowModel<OsmWidget> {
  ///  Local state fields for this component.

  LatLng? localLocation;

  String? localLocationTitle;

  bool localHasLocationPermission = false;

  dynamic polygonPoints;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - handleLocationPermission] action in OSM widget.
  bool? hasLocationPermission;
  // Stores action output result for [Custom Action - getAddressFromLatLngGoogleMaps] action in OpenStreetMapWidget widget.
  String? osmAddress;
  // Stores action output result for [Backend Call - API (FindBuilding)] action in OpenStreetMapWidget widget.
  ApiCallResponse? responseBuildingInfo;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
