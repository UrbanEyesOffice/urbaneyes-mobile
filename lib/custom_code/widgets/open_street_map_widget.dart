// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
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
import 'package:flutter_debouncer/flutter_debouncer.dart';
import 'package:flutter_map_geojson/flutter_map_geojson.dart';

class OpenStreetMapWidget extends StatefulWidget {
  const OpenStreetMapWidget({
    super.key,
    this.width,
    this.height,
    this.onMapMoved,
    this.polygonPoints,
    required this.initialLocation,
  });

  final double? width;
  final double? height;
  final Future Function(LatLng mapCenter)? onMapMoved;
  final LatLng initialLocation;
  final dynamic? polygonPoints;

  @override
  State<OpenStreetMapWidget> createState() => _OpenStreetMapWidgetState();
}

class _OpenStreetMapWidgetState extends State<OpenStreetMapWidget> {
  final mapController = MapController();
  final Debouncer _debouncer = Debouncer();
  GeoJsonParser geoJsonParser = GeoJsonParser(
      defaultPolygonFillColor: Colors.green.withAlpha(127),
      defaultPolygonBorderColor: Colors.green.shade700);

  @override
  void didUpdateWidget(covariant OpenStreetMapWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    geoJsonParser.polygons.clear();
    geoJsonParser.polylines.clear();
    geoJsonParser.markers.clear();
    if (widget.polygonPoints != null) {
      if (widget.polygonPoints["geometry"] != null) {
        Map<String, dynamic> rootMap = {};
        List<dynamic> features = [];
        Map<String, dynamic> feature =
            widget.polygonPoints as Map<String, dynamic>;
        if (feature["properties"] == null) {
          feature["properties"] = {"fill": "#90EE90", "stroke": "#006400"};
        }
        features.add(feature);
        rootMap["features"] = features;
        geoJsonParser.parseGeoJson(rootMap);
      }
    }
  }

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
                const duration = Duration(milliseconds: 700);
                _debouncer.debounce(
                  duration: duration,
                  onDebounce: () {
                    widget.onMapMoved!(LatLng(evt.camera.center.latitude,
                        evt.camera.center.longitude));
                  },
                );
              }
            });
            // And any other `MapController` dependent non-movement methods
          },
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: "kg.urbaneyes.urbaneyes",
          ),
          PolygonLayer(polygons: geoJsonParser.polygons),
          PolylineLayer(polylines: geoJsonParser.polylines),
          MarkerLayer(markers: geoJsonParser.markers),
        ]);
  }
}
