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

import 'package:location_geocoder/location_geocoder.dart';
import 'dart:async';

Future<String?> getAddressFromLatLngGoogleMaps(LatLng? position) async {
  var completer = new Completer<String?>();

  if (position == null) {
    completer.complete(null);
    return completer.future;
  }

  final LocatitonGeocoder geocoder =
      LocatitonGeocoder('AIzaSyC_dBFkadV44P88crfLTN4ymc4mHRzVzfY');
  await geocoder
      .findAddressesFromCoordinates(
          Coordinates(position.latitude, position.longitude))
      .then((addresses) {
    if (addresses.isEmpty) {
      completer.complete(null);
    } else {
      Address place = addresses.first;
      completer.complete('${place.addressLine}');
    }
  }).catchError((e) {
    completer.complete(null);
  });
  return completer.future;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
