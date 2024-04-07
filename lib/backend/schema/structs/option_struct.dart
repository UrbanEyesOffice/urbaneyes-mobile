// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OptionStruct extends FFFirebaseStruct {
  OptionStruct({
    int? id,
    String? titleRu,
    String? titleEn,
    String? titleKg,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _titleRu = titleRu,
        _titleEn = titleEn,
        _titleKg = titleKg,
        super(firestoreUtilData);

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;
  void incrementId(int amount) => _id = id + amount;
  bool hasId() => _id != null;

  // "title_ru" field.
  String? _titleRu;
  String get titleRu => _titleRu ?? '';
  set titleRu(String? val) => _titleRu = val;
  bool hasTitleRu() => _titleRu != null;

  // "title_en" field.
  String? _titleEn;
  String get titleEn => _titleEn ?? '';
  set titleEn(String? val) => _titleEn = val;
  bool hasTitleEn() => _titleEn != null;

  // "title_kg" field.
  String? _titleKg;
  String get titleKg => _titleKg ?? '';
  set titleKg(String? val) => _titleKg = val;
  bool hasTitleKg() => _titleKg != null;

  static OptionStruct fromMap(Map<String, dynamic> data) => OptionStruct(
        id: castToType<int>(data['id']),
        titleRu: data['title_ru'] as String?,
        titleEn: data['title_en'] as String?,
        titleKg: data['title_kg'] as String?,
      );

  static OptionStruct? maybeFromMap(dynamic data) =>
      data is Map ? OptionStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'title_ru': _titleRu,
        'title_en': _titleEn,
        'title_kg': _titleKg,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'title_ru': serializeParam(
          _titleRu,
          ParamType.String,
        ),
        'title_en': serializeParam(
          _titleEn,
          ParamType.String,
        ),
        'title_kg': serializeParam(
          _titleKg,
          ParamType.String,
        ),
      }.withoutNulls;

  static OptionStruct fromSerializableMap(Map<String, dynamic> data) =>
      OptionStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        titleRu: deserializeParam(
          data['title_ru'],
          ParamType.String,
          false,
        ),
        titleEn: deserializeParam(
          data['title_en'],
          ParamType.String,
          false,
        ),
        titleKg: deserializeParam(
          data['title_kg'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'OptionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is OptionStruct &&
        id == other.id &&
        titleRu == other.titleRu &&
        titleEn == other.titleEn &&
        titleKg == other.titleKg;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, titleRu, titleEn, titleKg]);
}

OptionStruct createOptionStruct({
  int? id,
  String? titleRu,
  String? titleEn,
  String? titleKg,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    OptionStruct(
      id: id,
      titleRu: titleRu,
      titleEn: titleEn,
      titleKg: titleKg,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

OptionStruct? updateOptionStruct(
  OptionStruct? option, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    option
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addOptionStructData(
  Map<String, dynamic> firestoreData,
  OptionStruct? option,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (option == null) {
    return;
  }
  if (option.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && option.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final optionData = getOptionFirestoreData(option, forFieldValue);
  final nestedData = optionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = option.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getOptionFirestoreData(
  OptionStruct? option, [
  bool forFieldValue = false,
]) {
  if (option == null) {
    return {};
  }
  final firestoreData = mapToFirestore(option.toMap());

  // Add any Firestore field values
  option.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getOptionListFirestoreData(
  List<OptionStruct>? options,
) =>
    options?.map((e) => getOptionFirestoreData(e, true)).toList() ?? [];
