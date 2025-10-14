// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BuildingTypeStruct extends FFFirebaseStruct {
  BuildingTypeStruct({
    String? id,
    String? titleRu,
    String? titleKg,
    String? titleEn,
    String? emoji,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _titleRu = titleRu,
        _titleKg = titleKg,
        _titleEn = titleEn,
        _emoji = emoji,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "title_ru" field.
  String? _titleRu;
  String get titleRu => _titleRu ?? '';
  set titleRu(String? val) => _titleRu = val;

  bool hasTitleRu() => _titleRu != null;

  // "title_kg" field.
  String? _titleKg;
  String get titleKg => _titleKg ?? '';
  set titleKg(String? val) => _titleKg = val;

  bool hasTitleKg() => _titleKg != null;

  // "title_en" field.
  String? _titleEn;
  String get titleEn => _titleEn ?? '';
  set titleEn(String? val) => _titleEn = val;

  bool hasTitleEn() => _titleEn != null;

  // "emoji" field.
  String? _emoji;
  String get emoji => _emoji ?? '';
  set emoji(String? val) => _emoji = val;

  bool hasEmoji() => _emoji != null;

  static BuildingTypeStruct fromMap(Map<String, dynamic> data) =>
      BuildingTypeStruct(
        id: data['id'] as String?,
        titleRu: data['title_ru'] as String?,
        titleKg: data['title_kg'] as String?,
        titleEn: data['title_en'] as String?,
        emoji: data['emoji'] as String?,
      );

  static BuildingTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? BuildingTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'title_ru': _titleRu,
        'title_kg': _titleKg,
        'title_en': _titleEn,
        'emoji': _emoji,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'title_ru': serializeParam(
          _titleRu,
          ParamType.String,
        ),
        'title_kg': serializeParam(
          _titleKg,
          ParamType.String,
        ),
        'title_en': serializeParam(
          _titleEn,
          ParamType.String,
        ),
        'emoji': serializeParam(
          _emoji,
          ParamType.String,
        ),
      }.withoutNulls;

  static BuildingTypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      BuildingTypeStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        titleRu: deserializeParam(
          data['title_ru'],
          ParamType.String,
          false,
        ),
        titleKg: deserializeParam(
          data['title_kg'],
          ParamType.String,
          false,
        ),
        titleEn: deserializeParam(
          data['title_en'],
          ParamType.String,
          false,
        ),
        emoji: deserializeParam(
          data['emoji'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'BuildingTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BuildingTypeStruct &&
        id == other.id &&
        titleRu == other.titleRu &&
        titleKg == other.titleKg &&
        titleEn == other.titleEn &&
        emoji == other.emoji;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, titleRu, titleKg, titleEn, emoji]);
}

BuildingTypeStruct createBuildingTypeStruct({
  String? id,
  String? titleRu,
  String? titleKg,
  String? titleEn,
  String? emoji,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BuildingTypeStruct(
      id: id,
      titleRu: titleRu,
      titleKg: titleKg,
      titleEn: titleEn,
      emoji: emoji,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BuildingTypeStruct? updateBuildingTypeStruct(
  BuildingTypeStruct? buildingType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    buildingType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBuildingTypeStructData(
  Map<String, dynamic> firestoreData,
  BuildingTypeStruct? buildingType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (buildingType == null) {
    return;
  }
  if (buildingType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && buildingType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final buildingTypeData =
      getBuildingTypeFirestoreData(buildingType, forFieldValue);
  final nestedData =
      buildingTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = buildingType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBuildingTypeFirestoreData(
  BuildingTypeStruct? buildingType, [
  bool forFieldValue = false,
]) {
  if (buildingType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(buildingType.toMap());

  // Add any Firestore field values
  buildingType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBuildingTypeListFirestoreData(
  List<BuildingTypeStruct>? buildingTypes,
) =>
    buildingTypes?.map((e) => getBuildingTypeFirestoreData(e, true)).toList() ??
    [];
