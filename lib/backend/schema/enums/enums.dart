import 'package:collection/collection.dart';

enum MainBuildingType {
  public,
  living,
}

enum BuildingAvailability {
  veryBad,
  bad,
  neutral,
  good,
  veryGood,
}

enum BuildingAnswers {
  ramp,
  noRamp1,
  noRamp2,
  doorWayWidth,
  noDoorWayWidth1,
  noDoorWayWidth2,
  lift,
  noLift1,
  noLift2,
  sidewalk,
  noSidewalk1,
  noSidewalk2,
  restroom,
  noRestroom1,
  noRestroom2,
  helpButton,
  noHelpButton1,
  noHelpButton2,
  all,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (MainBuildingType):
      return MainBuildingType.values.deserialize(value) as T?;
    case (BuildingAvailability):
      return BuildingAvailability.values.deserialize(value) as T?;
    case (BuildingAnswers):
      return BuildingAnswers.values.deserialize(value) as T?;
    default:
      return null;
  }
}
