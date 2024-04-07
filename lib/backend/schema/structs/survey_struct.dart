// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SurveyStruct extends FFFirebaseStruct {
  SurveyStruct({
    DateTime? createdTime,
    String? name,
    String? nameEn,
    String? nameKg,
    String? description,
    String? descriptionEn,
    String? descriptionKg,
    DocumentReference? createdBy,
    bool? enabled,
    DocumentReference? surveyReference,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _createdTime = createdTime,
        _name = name,
        _nameEn = nameEn,
        _nameKg = nameKg,
        _description = description,
        _descriptionEn = descriptionEn,
        _descriptionKg = descriptionKg,
        _createdBy = createdBy,
        _enabled = enabled,
        _surveyReference = surveyReference,
        super(firestoreUtilData);

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  set createdTime(DateTime? val) => _createdTime = val;
  bool hasCreatedTime() => _createdTime != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "name_en" field.
  String? _nameEn;
  String get nameEn => _nameEn ?? '';
  set nameEn(String? val) => _nameEn = val;
  bool hasNameEn() => _nameEn != null;

  // "name_kg" field.
  String? _nameKg;
  String get nameKg => _nameKg ?? '';
  set nameKg(String? val) => _nameKg = val;
  bool hasNameKg() => _nameKg != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;
  bool hasDescription() => _description != null;

  // "description_en" field.
  String? _descriptionEn;
  String get descriptionEn => _descriptionEn ?? '';
  set descriptionEn(String? val) => _descriptionEn = val;
  bool hasDescriptionEn() => _descriptionEn != null;

  // "description_kg" field.
  String? _descriptionKg;
  String get descriptionKg => _descriptionKg ?? '';
  set descriptionKg(String? val) => _descriptionKg = val;
  bool hasDescriptionKg() => _descriptionKg != null;

  // "created_by" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  set createdBy(DocumentReference? val) => _createdBy = val;
  bool hasCreatedBy() => _createdBy != null;

  // "enabled" field.
  bool? _enabled;
  bool get enabled => _enabled ?? false;
  set enabled(bool? val) => _enabled = val;
  bool hasEnabled() => _enabled != null;

  // "survey_reference" field.
  DocumentReference? _surveyReference;
  DocumentReference? get surveyReference => _surveyReference;
  set surveyReference(DocumentReference? val) => _surveyReference = val;
  bool hasSurveyReference() => _surveyReference != null;

  static SurveyStruct fromMap(Map<String, dynamic> data) => SurveyStruct(
        createdTime: data['created_time'] as DateTime?,
        name: data['name'] as String?,
        nameEn: data['name_en'] as String?,
        nameKg: data['name_kg'] as String?,
        description: data['description'] as String?,
        descriptionEn: data['description_en'] as String?,
        descriptionKg: data['description_kg'] as String?,
        createdBy: data['created_by'] as DocumentReference?,
        enabled: data['enabled'] as bool?,
        surveyReference: data['survey_reference'] as DocumentReference?,
      );

  static SurveyStruct? maybeFromMap(dynamic data) =>
      data is Map ? SurveyStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'created_time': _createdTime,
        'name': _name,
        'name_en': _nameEn,
        'name_kg': _nameKg,
        'description': _description,
        'description_en': _descriptionEn,
        'description_kg': _descriptionKg,
        'created_by': _createdBy,
        'enabled': _enabled,
        'survey_reference': _surveyReference,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'created_time': serializeParam(
          _createdTime,
          ParamType.DateTime,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'name_en': serializeParam(
          _nameEn,
          ParamType.String,
        ),
        'name_kg': serializeParam(
          _nameKg,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'description_en': serializeParam(
          _descriptionEn,
          ParamType.String,
        ),
        'description_kg': serializeParam(
          _descriptionKg,
          ParamType.String,
        ),
        'created_by': serializeParam(
          _createdBy,
          ParamType.DocumentReference,
        ),
        'enabled': serializeParam(
          _enabled,
          ParamType.bool,
        ),
        'survey_reference': serializeParam(
          _surveyReference,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static SurveyStruct fromSerializableMap(Map<String, dynamic> data) =>
      SurveyStruct(
        createdTime: deserializeParam(
          data['created_time'],
          ParamType.DateTime,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        nameEn: deserializeParam(
          data['name_en'],
          ParamType.String,
          false,
        ),
        nameKg: deserializeParam(
          data['name_kg'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        descriptionEn: deserializeParam(
          data['description_en'],
          ParamType.String,
          false,
        ),
        descriptionKg: deserializeParam(
          data['description_kg'],
          ParamType.String,
          false,
        ),
        createdBy: deserializeParam(
          data['created_by'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        enabled: deserializeParam(
          data['enabled'],
          ParamType.bool,
          false,
        ),
        surveyReference: deserializeParam(
          data['survey_reference'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['surveys'],
        ),
      );

  @override
  String toString() => 'SurveyStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SurveyStruct &&
        createdTime == other.createdTime &&
        name == other.name &&
        nameEn == other.nameEn &&
        nameKg == other.nameKg &&
        description == other.description &&
        descriptionEn == other.descriptionEn &&
        descriptionKg == other.descriptionKg &&
        createdBy == other.createdBy &&
        enabled == other.enabled &&
        surveyReference == other.surveyReference;
  }

  @override
  int get hashCode => const ListEquality().hash([
        createdTime,
        name,
        nameEn,
        nameKg,
        description,
        descriptionEn,
        descriptionKg,
        createdBy,
        enabled,
        surveyReference
      ]);
}

SurveyStruct createSurveyStruct({
  DateTime? createdTime,
  String? name,
  String? nameEn,
  String? nameKg,
  String? description,
  String? descriptionEn,
  String? descriptionKg,
  DocumentReference? createdBy,
  bool? enabled,
  DocumentReference? surveyReference,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SurveyStruct(
      createdTime: createdTime,
      name: name,
      nameEn: nameEn,
      nameKg: nameKg,
      description: description,
      descriptionEn: descriptionEn,
      descriptionKg: descriptionKg,
      createdBy: createdBy,
      enabled: enabled,
      surveyReference: surveyReference,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SurveyStruct? updateSurveyStruct(
  SurveyStruct? survey, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    survey
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSurveyStructData(
  Map<String, dynamic> firestoreData,
  SurveyStruct? survey,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (survey == null) {
    return;
  }
  if (survey.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && survey.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final surveyData = getSurveyFirestoreData(survey, forFieldValue);
  final nestedData = surveyData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = survey.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSurveyFirestoreData(
  SurveyStruct? survey, [
  bool forFieldValue = false,
]) {
  if (survey == null) {
    return {};
  }
  final firestoreData = mapToFirestore(survey.toMap());

  // Add any Firestore field values
  survey.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSurveyListFirestoreData(
  List<SurveyStruct>? surveys,
) =>
    surveys?.map((e) => getSurveyFirestoreData(e, true)).toList() ?? [];
