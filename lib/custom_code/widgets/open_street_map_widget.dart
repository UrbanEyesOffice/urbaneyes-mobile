// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latlong2;

class OpenStreetMapWidget extends StatefulWidget {
  const OpenStreetMapWidget({
    super.key,
    this.width,
    this.height,
    this.onMapMoved,
    required this.initialLocation,
  });

  final double? width;
  final double? height;
  final Future Function(LatLng mapCenter)? onMapMoved;
  final LatLng initialLocation;

  @override
  State<OpenStreetMapWidget> createState() => _OpenStreetMapWidgetState();
}

class _OpenStreetMapWidgetState extends State<OpenStreetMapWidget> {
  final mapController = MapController();

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
        mapController: mapController,
        options: MapOptions(
          initialCenter: latlong2.LatLng(widget.initialLocation.latitude,
              widget.initialLocation.longitude),
          interactionOptions: InteractionOptions(
            flags: InteractiveFlag.drag | InteractiveFlag.pinchZoom,
          ),
          initialZoom: 16.0,
          onMapReady: () {
            mapController.mapEventStream.listen((evt) {
              if (evt is MapEventMoveEnd) {
                widget.onMapMoved!(LatLng(
                    evt.camera.center.latitude, evt.camera.center.longitude));
              }
            });
            // And any other `MapController` dependent non-movement methods
          },
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: "kg.urbaneyes.urbaneyes",
          )
        ]);
  }
}
