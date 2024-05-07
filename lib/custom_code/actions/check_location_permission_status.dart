// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:permission_handler/permission_handler.dart';

Future<LatLng?> checkLocationPermissionStatus() async {
  var status = await Permission.location.status;
  if (status.isDenied) {
    return null;
  } else if (status.isGranted) {
  } else if (status.isLimited) {
  } else if (status.isPermanentlyDenied) {
  } else if (status.isProvisional) {
  } else if (status.isRestricted) {
  } else {
    return null;
  }
}
