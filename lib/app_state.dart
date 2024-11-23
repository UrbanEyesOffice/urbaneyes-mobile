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

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _lastTimeFeedbackShown = prefs.containsKey('ff_lastTimeFeedbackShown')
          ? DateTime.fromMillisecondsSinceEpoch(
              prefs.getInt('ff_lastTimeFeedbackShown')!)
          : _lastTimeFeedbackShown;
    });
    _safeInit(() {
      _surveysCompleted =
          prefs.getString('ff_surveysCompleted') ?? _surveysCompleted;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _showMAp = false;
  bool get showMAp => _showMAp;
  set showMAp(bool value) {
    _showMAp = value;
  }

  LatLng? _locationBishkek = LatLng(42.8610324, 74.5772478);
  LatLng? get locationBishkek => _locationBishkek;
  set locationBishkek(LatLng? value) {
    _locationBishkek = value;
  }

  LatLng? _lastMapPoint;
  LatLng? get lastMapPoint => _lastMapPoint;
  set lastMapPoint(LatLng? value) {
    _lastMapPoint = value;
  }

  DateTime? _lastTimeFeedbackShown;
  DateTime? get lastTimeFeedbackShown => _lastTimeFeedbackShown;
  set lastTimeFeedbackShown(DateTime? value) {
    _lastTimeFeedbackShown = value;
    value != null
        ? prefs.setInt('ff_lastTimeFeedbackShown', value.millisecondsSinceEpoch)
        : prefs.remove('ff_lastTimeFeedbackShown');
  }

  String _surveysCompleted = '';
  String get surveysCompleted => _surveysCompleted;
  set surveysCompleted(String value) {
    _surveysCompleted = value;
    prefs.setString('ff_surveysCompleted', value);
  }
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
