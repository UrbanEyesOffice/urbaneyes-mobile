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
        '{\"id\":\"abandoned\",\"title_ru\":\"Заброшенное здание\",\"title_kg\":\"Ташталган имарат\",\"title_en\":\"Abandoned building\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"apartments\",\"title_ru\":\"Многоквартирный дом\",\"title_kg\":\"Көп батирлүү үй\",\"title_en\":\"Apartment building\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"barn\",\"title_ru\":\"Амбар / сарай\",\"title_kg\":\"Амбар / сарай\",\"title_en\":\"Barn\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"basin\",\"title_ru\":\"Водоём / резервуар\",\"title_kg\":\"Суу сактагыч / көлмө\",\"title_en\":\"Basin / Reservoir\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"cabin\",\"title_ru\":\"Хижина / домик\",\"title_kg\":\"Үйчөк / чакан үй\",\"title_en\":\"Cabin / Hut\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"carport\",\"title_ru\":\"Навес для машин\",\"title_kg\":\"Унаа үчүн навес\",\"title_en\":\"Carport\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"church\",\"title_ru\":\"Церковь\",\"title_kg\":\"Чиркөө\",\"title_en\":\"Church\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"civic\",\"title_ru\":\"Гражданское здание (мэрия и т.п.)\",\"title_kg\":\"Жарандык имарат (мэрия ж.б.)\",\"title_en\":\"Civic building\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"collapsed\",\"title_ru\":\"Обрушенное здание\",\"title_kg\":\"Урагып түшкөн имарат\",\"title_en\":\"Collapsed building\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"college\",\"title_ru\":\"Колледж\",\"title_kg\":\"Колледж\",\"title_en\":\"College\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"commercial\",\"title_ru\":\"Коммерческое здание\",\"title_kg\":\"Коммерциялык имарат\",\"title_en\":\"Commercial building\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"construction\",\"title_ru\":\"Строящееся здание\",\"title_kg\":\"Курулуп жаткан имарат\",\"title_en\":\"Building under construction\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"detached\",\"title_ru\":\"Отдельный жилой дом\",\"title_kg\":\"Жеке турак үй\",\"title_en\":\"Detached house\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"dormitory\",\"title_ru\":\"Общежитие\",\"title_kg\":\"Жатакана\",\"title_en\":\"Dormitory\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"fuel\",\"title_ru\":\"АЗС / заправка\",\"title_kg\":\"Жанармай куюучу станция\",\"title_en\":\"Fuel station\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"garage\",\"title_ru\":\"Гараж\",\"title_kg\":\"Гараж\",\"title_en\":\"Garage\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"garages\",\"title_ru\":\"Ряд гаражей\",\"title_kg\":\"Гараждар\",\"title_en\":\"Garages (block)\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"gatehouse\",\"title_ru\":\"Пропускной пункт / проходная\",\"title_kg\":\"Күзөтчү жайы\",\"title_en\":\"Gatehouse\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"ger\",\"title_ru\":\"Юрта\",\"title_kg\":\"Боз үй\",\"title_en\":\"Ger (Yurt)\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"government\",\"title_ru\":\"Госучреждение\",\"title_kg\":\"Өкмөттүк имарат\",\"title_en\":\"Government building\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"grandstand\",\"title_ru\":\"Трибуна\",\"title_kg\":\"Трибуна\",\"title_en\":\"Grandstand\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"greenhouse\",\"title_ru\":\"Теплица\",\"title_kg\":\"Жылыжай\",\"title_en\":\"Greenhouse\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"hospital\",\"title_ru\":\"Больница / госпиталь\",\"title_kg\":\"Оорукана\",\"title_en\":\"Hospital\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"hotel\",\"title_ru\":\"Гостиница / отель\",\"title_kg\":\"Мейманкана\",\"title_en\":\"Hotel\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"house\",\"title_ru\":\"Жилой дом\",\"title_kg\":\"Жеке үй\",\"title_en\":\"House\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"industrial\",\"title_ru\":\"Промышленное здание\",\"title_kg\":\"Өндүрүш имараты\",\"title_en\":\"Industrial building\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"kindergarten\",\"title_ru\":\"Детский сад\",\"title_kg\":\"Бала бакча\",\"title_en\":\"Kindergarten\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"kiosk\",\"title_ru\":\"Киоск\",\"title_kg\":\"Киоск\",\"title_en\":\"Kiosk\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"manufacture\",\"title_ru\":\"Производственное здание\",\"title_kg\":\"Иштетүүчү / өндүрүш жайы\",\"title_en\":\"Manufacturing building\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"mosque\",\"title_ru\":\"Мечеть\",\"title_kg\":\"Мечит\",\"title_en\":\"Mosque\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"museum\",\"title_ru\":\"Музей\",\"title_kg\":\"Музей\",\"title_en\":\"Museum\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"office\",\"title_ru\":\"Офисное здание\",\"title_kg\":\"Кеңсе имараты\",\"title_en\":\"Office building\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"pavilion\",\"title_ru\":\"Павильон\",\"title_kg\":\"Павильон\",\"title_en\":\"Pavilion\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"public\",\"title_ru\":\"Общественное здание\",\"title_kg\":\"Коомдук имарат\",\"title_en\":\"Public building\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"residential\",\"title_ru\":\"Жилое здание\",\"title_kg\":\"Турак жай\",\"title_en\":\"Residential building\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"retail\",\"title_ru\":\"Торговое здание\",\"title_kg\":\"Соода имараты\",\"title_en\":\"Retail building\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"roof\",\"title_ru\":\"Крыша / навес\",\"title_kg\":\"Чатыр / навес\",\"title_en\":\"Roof structure\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"ruins\",\"title_ru\":\"Руины / развалины\",\"title_kg\":\"Урандылар\",\"title_en\":\"Ruins\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"school\",\"title_ru\":\"Школа\",\"title_kg\":\"Мектеп\",\"title_en\":\"School\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"semidetached_house\",\"title_ru\":\"Блокированный дом (на 2 семьи)\",\"title_kg\":\"Эгиз үй (эки үй бириккен)\",\"title_en\":\"Semi-detached house\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"service\",\"title_ru\":\"Служебное здание\",\"title_kg\":\"Кызматтык имарат\",\"title_en\":\"Service building\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"shed\",\"title_ru\":\"Сарай / навес\",\"title_kg\":\"Сарай / кампачы\",\"title_en\":\"Shed\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"shop\",\"title_ru\":\"Магазин\",\"title_kg\":\"Дүкөн\",\"title_en\":\"Shop\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"small_hut\",\"title_ru\":\"Маленькая хижина\",\"title_kg\":\"Чакан үйчөк\",\"title_en\":\"Small hut\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"sports_centre\",\"title_ru\":\"Спортивный центр\",\"title_kg\":\"Спорт борбору\",\"title_en\":\"Sports centre\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"stadium\",\"title_ru\":\"Стадион\",\"title_kg\":\"Стадион\",\"title_en\":\"Stadium\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"storage_tank\",\"title_ru\":\"Резервуар / цистерна\",\"title_kg\":\"Сактагыч / цистерна\",\"title_en\":\"Storage tank\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"supermarket\",\"title_ru\":\"Супермаркет\",\"title_kg\":\"Супермаркет\",\"title_en\":\"Supermarket\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"terrace\",\"title_ru\":\"Террасные дома (ряд)\",\"title_kg\":\"Терраса тибиндеги үйлөр\",\"title_en\":\"Terrace houses\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"theatre\",\"title_ru\":\"Театр\",\"title_kg\":\"Театр\",\"title_en\":\"Theatre\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"train_station\",\"title_ru\":\"Железнодорожный вокзал\",\"title_kg\":\"Темир жол вокзалы\",\"title_en\":\"Train station\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"transportation\",\"title_ru\":\"Транспортное здание\",\"title_kg\":\"Транспорт имараты\",\"title_en\":\"Transportation\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"university\",\"title_ru\":\"Университет\",\"title_kg\":\"Университет\",\"title_en\":\"University\"}')),
    BuildingTypeStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"warehouse\",\"title_ru\":\"Склад\",\"title_kg\":\"Кампа\",\"title_en\":\"Warehouse\"}'))
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
