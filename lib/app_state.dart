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
        '{\"id\":\"museum\",\"title_ru\":\"Музей\",\"title_kg\":\"Музей\",\"title_en\":\"Museum\",\"type\":\"public\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"apartments\",\"title_ru\":\"Квартиры\",\"title_kg\":\"Квартиралар\",\"title_en\":\"Apartments\",\"type\":\"living\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"university\",\"title_ru\":\"Университет\",\"title_kg\":\"Университет\",\"title_en\":\"University\",\"type\":\"public\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"mosque\",\"title_ru\":\"Мечеть\",\"title_kg\":\"Мечит\",\"title_en\":\"Mosque\",\"type\":\"public\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"detached\",\"title_ru\":\"Отдельный дом\",\"title_kg\":\"Жеке турак жай\",\"title_en\":\"Detached\",\"type\":\"living\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"grandstand\",\"title_ru\":\"Трибуна\",\"title_kg\":\"Трибуна\",\"title_en\":\"Grandstand\",\"type\":\"public\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"civic\",\"title_ru\":\"Гражданский центр\",\"title_kg\":\"Жарандык борбору\",\"title_en\":\"Civic\",\"type\":\"public\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"theatre\",\"title_ru\":\"Театр\",\"title_kg\":\"Театр\",\"title_en\":\"Theatre\",\"type\":\"public\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"stadium\",\"title_ru\":\"Стадион\",\"title_kg\":\"Стадион\",\"title_en\":\"Stadium\",\"type\":\"public\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"transportation\",\"title_ru\":\"Транспорт\",\"title_kg\":\"Transportation\",\"title_en\":\"Транспорт\",\"type\":\"public\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"semidetached_house\",\"title_ru\":\"Блокированный дом\",\"title_kg\":\"Semi-detached house\",\"title_en\":\"Жарым-жартылай кошулган үй\",\"type\":\"living\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"abandoned\",\"title_ru\":\"Заброшенный\",\"title_kg\":\"Ташталган\",\"title_en\":\"Abandoned\",\"type\":\"public\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"gatehouse\",\"title_ru\":\"Караульный дом\",\"title_kg\":\"Караул үйү\",\"title_en\":\"Gatehouse\",\"type\":\"living\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"hotel\",\"title_ru\":\"Отель\",\"title_kg\":\"Отель\",\"title_en\":\"Hotel\",\"type\":\"public\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"train_station\",\"title_ru\":\"Железнодорожная станция\",\"title_kg\":\"Темир жол станциясы\",\"title_en\":\"Train Station\",\"type\":\"public\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"barn\",\"title_ru\":\"Амбар\",\"title_kg\":\"Амбар\",\"title_en\":\"Barn\",\"type\":\"living\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"ger\",\"title_ru\":\"Юрта\",\"title_kg\":\"Боз үй\",\"title_en\":\"Ger\",\"type\":\"living\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"public\",\"title_ru\":\"Общественное здание\",\"title_kg\":\"Коомдук имарат\",\"title_en\":\"Public\",\"type\":\"public\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"hospital\",\"title_ru\":\"Больница\",\"title_kg\":\"Ооруканa\",\"title_en\":\"Hospital\",\"type\":\"public\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"school\",\"title_ru\":\"Школа\",\"title_kg\":\"Мектеп\",\"title_en\":\"School\",\"type\":\"public\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"college\",\"title_ru\":\"Колледж\",\"title_kg\":\"Коллеж\",\"title_en\":\"College\",\"type\":\"public\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"shed\",\"title_ru\":\"Сарай\",\"title_kg\":\"Кампa\",\"title_en\":\"Shed\",\"type\":\"living\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"construction\",\"title_ru\":\"Стройка\",\"title_kg\":\"Курулуш\",\"title_en\":\"Construction\",\"type\":\"public\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"terrace\",\"title_ru\":\"Терраса\",\"title_kg\":\"Терраса\",\"title_en\":\"Terrace\",\"type\":\"public\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"church\",\"title_ru\":\"Церковь\",\"title_kg\":\"Чиркөө\",\"title_en\":\"Church\",\"type\":\"public\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"garage\",\"title_ru\":\"Гараж\",\"title_kg\":\"Гараж\",\"title_en\":\"Garage\",\"type\":\"living\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"commercial\",\"title_ru\":\"Коммерческое здание\",\"title_kg\":\"Hello World\",\"title_en\":\"Hello World\",\"type\":\"public\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"pavilion\",\"title_ru\":\"Павильон\",\"title_kg\":\"Hello World\",\"title_en\":\"Hello World\",\"type\":\"public\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"sports_centre\",\"title_ru\":\"Спортивный центр\",\"title_kg\":\"Hello World\",\"title_en\":\"Hello World\",\"type\":\"public\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"industrial\",\"title_ru\":\"Промышленное здание\",\"title_kg\":\"Hello World\",\"title_en\":\"Hello World\",\"type\":\"public\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"office\",\"title_ru\":\"Офис\",\"title_kg\":\"Hello World\",\"title_en\":\"Hello World\",\"type\":\"public\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"government\",\"title_ru\":\"Правительственное здание\",\"title_kg\":\"Hello World\",\"title_en\":\"Hello World\",\"type\":\"public\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"house\",\"title_ru\":\"Дом\",\"title_kg\":\"Hello World\",\"title_en\":\"Hello World\",\"type\":\"living\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"shop\",\"title_ru\":\"Магазин\",\"title_kg\":\"Hello World\",\"title_en\":\"Hello World\",\"type\":\"public\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"supermarket\",\"title_ru\":\"Супермаркет\",\"title_kg\":\"Hello World\",\"title_en\":\"Hello World\",\"type\":\"public\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"manufacture\",\"title_ru\":\"Производство\",\"title_kg\":\"Hello World\",\"title_en\":\"Hello World\",\"type\":\"public\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"residential\",\"title_ru\":\"Жилой дом\",\"title_kg\":\"Hello World\",\"title_en\":\"Hello World\",\"type\":\"living\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"dormitory\",\"title_ru\":\"Общежитие\",\"title_kg\":\"Hello World\",\"title_en\":\"Hello World\",\"type\":\"living\"}'))
  ];
  List<BuildingTypeStruct> get BuildingTypes => _BuildingTypes;
  set BuildingTypes(List<BuildingTypeStruct> value) {
    _BuildingTypes = value;
  }

  void addToBuildingTypes(BuildingTypeStruct value) {
    BuildingTypes.add(value);
  }

  void removeFromBuildingTypes(BuildingTypeStruct value) {
    BuildingTypes.remove(value);
  }

  void removeAtIndexFromBuildingTypes(int index) {
    BuildingTypes.removeAt(index);
  }

  void updateBuildingTypesAtIndex(
    int index,
    BuildingTypeStruct Function(BuildingTypeStruct) updateFn,
  ) {
    BuildingTypes[index] = updateFn(_BuildingTypes[index]);
  }

  void insertAtIndexInBuildingTypes(int index, BuildingTypeStruct value) {
    BuildingTypes.insert(index, value);
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
