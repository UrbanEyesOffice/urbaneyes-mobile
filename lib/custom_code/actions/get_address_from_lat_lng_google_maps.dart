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

Future<String?> getAddressFromLatLngGoogleMaps(
    LatLng? position, String? lang) async {
  var completer = new Completer<String?>();

  if (position == null) {
    completer.complete(null);
    return completer.future;
  }

  final LocatitonGeocoder geocoder =
      LocatitonGeocoder('AIzaSyC_dBFkadV44P88crfLTN4ymc4mHRzVzfY', lang: lang);
  await geocoder
      .findAddressesFromCoordinates(
          Coordinates(position.latitude, position.longitude))
      .then((addresses) {
    if (addresses.isEmpty) {
      completer.complete(null);
    } else {
      String? postalCode;
      String? thoroughfare;
      String? subThoroughfare;
      String? locality;
      String? adminArea;
      String? countryName;
      String? countryCode;

      String completeAddress = "";

      for (var address in addresses) {
        if ((address.postalCode != null) && (postalCode == null)) {
          postalCode = address.postalCode;
        }
        if ((address.thoroughfare != null) && (thoroughfare == null)) {
          thoroughfare = address.thoroughfare;
        }
        if ((address.subThoroughfare != null) && (subThoroughfare == null)) {
          subThoroughfare = address.subThoroughfare;
        }
        if ((address.locality != null) && (locality == null)) {
          locality = address.locality;
        }
        if ((address.adminArea != null) && (adminArea == null)) {
          adminArea = address.adminArea;
        }
        if ((address.countryName != null) && (countryName == null)) {
          countryName = address.countryName;
        }
        if ((address.countryCode != null) && (countryCode == null)) {
          countryCode = address.countryCode;
        }
      }

      if (postalCode != null) {
        completeAddress += postalCode;
      }

      if (thoroughfare != null) {
        if (!completeAddress.isEmpty) {
          completeAddress += ', ';
        }
        completeAddress += thoroughfare;
      }

      if (subThoroughfare != null) {
        if (!completeAddress.isEmpty) {
          completeAddress += ', ';
        }
        completeAddress += subThoroughfare;
      }

      if (locality != null) {
        if (!completeAddress.isEmpty) {
          completeAddress += ', ';
        }
        completeAddress += locality;
      }

      if (adminArea != null) {
        if (!completeAddress.isEmpty) {
          completeAddress += ', ';
        }
        completeAddress += adminArea;
      }

      if (countryName != null) {
        if (!completeAddress.isEmpty) {
          completeAddress += ', ';
        }
        completeAddress += countryName;
      }

      if (countryCode != null) {
        if (!completeAddress.isEmpty) {
          completeAddress += ', ';
        }
        completeAddress += countryCode;
      }

      if (completeAddress.isEmpty) {
        completer.complete('${addresses.first.addressLine}');
      } else {
        completer.complete(completeAddress);
      }
    }
  }).catchError((e) {
    completer.complete(null);
  });
  FFAppState().update(() {});
  return completer.future;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
