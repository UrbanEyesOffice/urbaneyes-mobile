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

  // "approximate_time_1" field.
  int? _approximateTime1;
  int get approximateTime1 => _approximateTime1 ?? 0;
  bool hasApproximateTime1() => _approximateTime1 != null;

  // "approximate_time_2" field.
  int? _approximateTime2;
  int get approximateTime2 => _approximateTime2 ?? 0;
  bool hasApproximateTime2() => _approximateTime2 != null;

  void _initializeFields() {
    _createdTime = snapshotData['created_time'] as DateTime?;
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _createdBy = snapshotData['created_by'] as DocumentReference?;
    _approximateTime1 = castToType<int>(snapshotData['approximate_time_1']);
    _approximateTime2 = castToType<int>(snapshotData['approximate_time_2']);
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
  int? approximateTime1,
  int? approximateTime2,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_time': createdTime,
      'name': name,
      'description': description,
      'created_by': createdBy,
      'approximate_time_1': approximateTime1,
      'approximate_time_2': approximateTime2,
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
        e1?.approximateTime1 == e2?.approximateTime1 &&
        e1?.approximateTime2 == e2?.approximateTime2;
  }

  @override
  int hash(SurveysRecord? e) => const ListEquality().hash([
        e?.createdTime,
        e?.name,
        e?.description,
        e?.createdBy,
        e?.approximateTime1,
        e?.approximateTime2
      ]);

  @override
  bool isValidKey(Object? o) => o is SurveysRecord;
}
