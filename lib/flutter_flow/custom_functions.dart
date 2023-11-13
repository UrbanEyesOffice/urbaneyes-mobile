import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

bool? isLatLongEqualNull(LatLng? get) {
  if (get == LatLng(0, 0)) {
    return true;
  } else
    return false;
}

bool? isMapNotMoved(LatLng? get) {
  if (get == LatLng(42.8610324, 74.5772478)) {
    return true;
  } else
    return false;
}

int? isTheSamePosition(
  LatLng? latLng1,
  LatLng? latLng2,
) {
  // get distance in meters between two latLng variables
  double lat1 = latLng1!.latitude;
  double lon1 = latLng1.longitude;
  double lat2 = latLng2!.latitude;
  double lon2 = latLng2.longitude;

  const p = 0.017453292519943295;
  const c = math.cos;

  final a = 0.5 -
      c((lat2 - lat1) * p) / 2 +
      c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;

  return (12742 * math.asin(math.sqrt(a)) * 1000).round();
}

bool? less5minutes(
  DateTime time1,
  DateTime time2,
) {
  int answer;
  // Count difference between two timestamps in minutes
  final difference = time2.difference(time1);
  if (difference.inMinutes < 0) {
    answer = difference.inMinutes * -1;
  } else
    answer = difference.inMinutes;

  if (answer >= 0 && answer <= 5)
    return true;
  else
    return false;
}

String returnDate(DateTime dateTime) {
  // Get dateTime var and return date without time string
  final DateFormat formatter = DateFormat('dd-MM-yyyy');
  final String formatted = formatter.format(dateTime);
  return formatted;
}

String? showGenderValue(int gender) {
  final locale = Intl.getCurrentLocale();
  if (locale.contains('ru')) {
    if (gender == 1)
      return "Мужской";
    else if (gender == 2)
      return "Женский";
    else
      return "Другой";
  } else if (locale.contains('en')) {
    if (gender == 1)
      return "Male";
    else if (gender == 2)
      return "Female";
    else
      return "Other";
  } else {
    if (gender == 1)
      return "Эркек";
    else if (gender == 2)
      return "Аял";
    else
      return "Башка";
  }
}

String? getAddress(LatLng position) {
  return null;
}

OptionStruct? returnOption(
  int? id,
  String? titleRu,
  String? titleEn,
  String? titleKg,
) {
  // Create Option object and return it
  return createOptionStruct(
    id: id,
    titleRu: titleRu,
    titleEn: titleEn,
    titleKg: titleKg,
  );
}
