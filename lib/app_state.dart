import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  bool _showMAp = false;
  bool get showMAp => _showMAp;
  set showMAp(bool _value) {
    _showMAp = _value;
  }

  LatLng? _locationBishkek = LatLng(42.8610324, 74.5772478);
  LatLng? get locationBishkek => _locationBishkek;
  set locationBishkek(LatLng? _value) {
    _locationBishkek = _value;
  }

  DocumentReference? _reward;
  DocumentReference? get reward => _reward;
  set reward(DocumentReference? _value) {
    _reward = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
