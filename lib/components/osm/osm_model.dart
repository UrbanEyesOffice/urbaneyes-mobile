import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/permissions_util.dart';
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

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - handleLocationPermission] action in OSM widget.
  bool? hasLocationPermission;
  // Stores action output result for [Custom Action - getAddressFromLatLngGoogleMaps] action in OpenStreetMapWidget widget.
  String? osmAddress;
  // Stores action output result for [Custom Action - handleLocationPermission] action in Button widget.
  bool? hasLocationPermission2;
  // Stores action output result for [Custom Action - getCurrentPosition] action in Button widget.
  LatLng? currentPosition;
  // Stores action output result for [Custom Action - getAddressFromLatLngGoogleMaps] action in Button widget.
  String? currentAddress;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
