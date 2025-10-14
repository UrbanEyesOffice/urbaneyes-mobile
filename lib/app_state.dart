import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/api_requests/api_manager.dart';
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
    _safeInit(() {
      _BuildingTypes = prefs
              .getStringList('ff_BuildingTypes')
              ?.map((x) {
                try {
                  return BuildingTypeStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _BuildingTypes;
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

  List<BuildingTypeStruct> _BuildingTypes = [
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"apartments\",\"title_ru\":\"Многоквартирный дом\",\"title_kg\":\"Көп батирлүү үй\",\"title_en\":\"Apartment building\",\"emoji\":\"🏢\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"church\",\"title_ru\":\"Церковь\",\"title_kg\":\"Чиркөө\",\"title_en\":\"Church\",\"emoji\":\"⛪\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"government\",\"title_ru\":\"Госучреждение\",\"title_kg\":\"Өкмөттүк имарат\",\"title_en\":\"Government building\",\"emoji\":\"🏢\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"hospital\",\"title_ru\":\"Больница\",\"title_kg\":\"Оорукана\",\"title_en\":\"Hospital\",\"emoji\":\"🏥\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"hotel\",\"title_ru\":\"Гостиница\",\"title_kg\":\"Мейманкана\",\"title_en\":\"Hotel\",\"emoji\":\"🏨\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"kindergarten\",\"title_ru\":\"Детский сад\",\"title_kg\":\"Бала бакча\",\"title_en\":\"Kindergarten\",\"emoji\":\"🧸\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"mosque\",\"title_ru\":\"Мечеть\",\"title_kg\":\"Мечит\",\"title_en\":\"Mosque\",\"emoji\":\"🕌\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"museum\",\"title_ru\":\"Музей\",\"title_kg\":\"Музей\",\"title_en\":\"Museum\",\"emoji\":\"🏛️\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"office\",\"title_ru\":\"Бизнес центр\",\"title_kg\":\"Бизнес борбору\",\"title_en\":\"Business center\",\"emoji\":\"🧑‍💼\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"retail\",\"title_ru\":\"Торговый центр\",\"title_kg\":\"Соода борбору\",\"title_en\":\"Shopping mall\",\"emoji\":\"🛍️\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"school\",\"title_ru\":\"Школа\",\"title_kg\":\"Мектеп\",\"title_en\":\"School\",\"emoji\":\"🏫\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"shop\",\"title_ru\":\"Магазин\",\"title_kg\":\"Дүкөн\",\"title_en\":\"Shop\",\"emoji\":\"🏪\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"sports_centre\",\"title_ru\":\"Спортивный центр\",\"title_kg\":\"Спорт борбору\",\"title_en\":\"Sports centre\",\"emoji\":\"🏋️\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"supermarket\",\"title_ru\":\"Супермаркет\",\"title_kg\":\"Супермаркет\",\"title_en\":\"Supermarket\",\"emoji\":\"🛒\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"theatre\",\"title_ru\":\"Театр\",\"title_kg\":\"Театр\",\"title_en\":\"Theatre\",\"emoji\":\"🎭\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"university\",\"title_ru\":\"Университет\",\"title_kg\":\"Университет\",\"title_en\":\"University\",\"emoji\":\"🎓\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"bank\",\"title_ru\":\"Банк\",\"title_kg\":\"Банк\",\"title_en\":\"Bank\",\"emoji\":\"🏦\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"cafe\",\"title_ru\":\"Кафе/Ресторан\",\"title_kg\":\"Кафе/Ресторан\",\"title_en\":\"Cafe/Restaurant\",\"emoji\":\"🍽️ \"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"cinema\",\"title_ru\":\"Кинотеатр\",\"title_kg\":\"Кинотеатр\",\"title_en\":\"Cinema\",\"emoji\":\"🍿\"}'))
  ];
  List<BuildingTypeStruct> get BuildingTypes => _BuildingTypes;
  set BuildingTypes(List<BuildingTypeStruct> value) {
    _BuildingTypes = value;
    prefs.setStringList(
        'ff_BuildingTypes', value.map((x) => x.serialize()).toList());
  }

  void addToBuildingTypes(BuildingTypeStruct value) {
    BuildingTypes.add(value);
    prefs.setStringList(
        'ff_BuildingTypes', _BuildingTypes.map((x) => x.serialize()).toList());
  }

  void removeFromBuildingTypes(BuildingTypeStruct value) {
    BuildingTypes.remove(value);
    prefs.setStringList(
        'ff_BuildingTypes', _BuildingTypes.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromBuildingTypes(int index) {
    BuildingTypes.removeAt(index);
    prefs.setStringList(
        'ff_BuildingTypes', _BuildingTypes.map((x) => x.serialize()).toList());
  }

  void updateBuildingTypesAtIndex(
    int index,
    BuildingTypeStruct Function(BuildingTypeStruct) updateFn,
  ) {
    BuildingTypes[index] = updateFn(_BuildingTypes[index]);
    prefs.setStringList(
        'ff_BuildingTypes', _BuildingTypes.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInBuildingTypes(int index, BuildingTypeStruct value) {
    BuildingTypes.insert(index, value);
    prefs.setStringList(
        'ff_BuildingTypes', _BuildingTypes.map((x) => x.serialize()).toList());
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
