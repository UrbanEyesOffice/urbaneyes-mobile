import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

Future changeLanguage(BuildContext context) async {
  if (FFLocalizations.of(context).languageCode == 'ru') {
    setAppLanguage(context, 'en');
  } else if (FFLocalizations.of(context).languageCode == 'en') {
    setAppLanguage(context, 'ky');
  } else {
    setAppLanguage(context, 'ru');
  }
}
