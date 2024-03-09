import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SurveysRecord extends FirestoreRecord {
  SurveysRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "created_by" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "name_en" field.
  String? _nameEn;
  String get nameEn => _nameEn ?? '';
  bool hasNameEn() => _nameEn != null;

  // "name_kg" field.
  String? _nameKg;
  String get nameKg => _nameKg ?? '';
  bool hasNameKg() => _nameKg != null;

  // "description_en" field.
  String? _descriptionEn;
  String get descriptionEn => _descriptionEn ?? '';
  bool hasDescriptionEn() => _descriptionEn != null;

  // "description_kg" field.
  String? _descriptionKg;
  String get descriptionKg => _descriptionKg ?? '';
  bool hasDescriptionKg() => _descriptionKg != null;

  // "enabled" field.
  bool? _enabled;
  bool get enabled => _enabled ?? false;
  bool hasEnabled() => _enabled != null;

  void _initializeFields() {
    _createdTime = snapshotData['created_time'] as DateTime?;
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _createdBy = snapshotData['created_by'] as DocumentReference?;
    _nameEn = snapshotData['name_en'] as String?;
    _nameKg = snapshotData['name_kg'] as String?;
    _descriptionEn = snapshotData['description_en'] as String?;
    _descriptionKg = snapshotData['description_kg'] as String?;
    _enabled = snapshotData['enabled'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('surveys');

  static Stream<SurveysRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SurveysRecord.fromSnapshot(s));

  static Future<SurveysRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SurveysRecord.fromSnapshot(s));

  static SurveysRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SurveysRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SurveysRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SurveysRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SurveysRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SurveysRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSurveysRecordData({
  DateTime? createdTime,
  String? name,
  String? description,
  DocumentReference? createdBy,
  String? nameEn,
  String? nameKg,
  String? descriptionEn,
  String? descriptionKg,
  bool? enabled,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_time': createdTime,
      'name': name,
      'description': description,
      'created_by': createdBy,
      'name_en': nameEn,
      'name_kg': nameKg,
      'description_en': descriptionEn,
      'description_kg': descriptionKg,
      'enabled': enabled,
    }.withoutNulls,
  );

  return firestoreData;
}

class SurveysRecordDocumentEquality implements Equality<SurveysRecord> {
  const SurveysRecordDocumentEquality();

  @override
  bool equals(SurveysRecord? e1, SurveysRecord? e2) {
    return e1?.createdTime == e2?.createdTime &&
        e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.createdBy == e2?.createdBy &&
        e1?.nameEn == e2?.nameEn &&
        e1?.nameKg == e2?.nameKg &&
        e1?.descriptionEn == e2?.descriptionEn &&
        e1?.descriptionKg == e2?.descriptionKg &&
        e1?.enabled == e2?.enabled;
  }

  @override
  int hash(SurveysRecord? e) => const ListEquality().hash([
        e?.createdTime,
        e?.name,
        e?.description,
        e?.createdBy,
        e?.nameEn,
        e?.nameKg,
        e?.descriptionEn,
        e?.descriptionKg,
        e?.enabled
      ]);

  @override
  bool isValidKey(Object? o) => o is SurveysRecord;
}
