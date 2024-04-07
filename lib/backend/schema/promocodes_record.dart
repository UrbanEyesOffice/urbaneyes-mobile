import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PromocodesRecord extends FirestoreRecord {
  PromocodesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "code" field.
  String? _code;
  String get code => _code ?? '';
  bool hasCode() => _code != null;

  // "used_by" field.
  DocumentReference? _usedBy;
  DocumentReference? get usedBy => _usedBy;
  bool hasUsedBy() => _usedBy != null;

  // "used_date" field.
  DateTime? _usedDate;
  DateTime? get usedDate => _usedDate;
  bool hasUsedDate() => _usedDate != null;

  // "reward" field.
  DocumentReference? _reward;
  DocumentReference? get reward => _reward;
  bool hasReward() => _reward != null;

  // "is_activated" field.
  bool? _isActivated;
  bool get isActivated => _isActivated ?? false;
  bool hasIsActivated() => _isActivated != null;

  // "is_expired" field.
  bool? _isExpired;
  bool get isExpired => _isExpired ?? false;
  bool hasIsExpired() => _isExpired != null;

  void _initializeFields() {
    _code = snapshotData['code'] as String?;
    _usedBy = snapshotData['used_by'] as DocumentReference?;
    _usedDate = snapshotData['used_date'] as DateTime?;
    _reward = snapshotData['reward'] as DocumentReference?;
    _isActivated = snapshotData['is_activated'] as bool?;
    _isExpired = snapshotData['is_expired'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('promocodes');

  static Stream<PromocodesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PromocodesRecord.fromSnapshot(s));

  static Future<PromocodesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PromocodesRecord.fromSnapshot(s));

  static PromocodesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PromocodesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PromocodesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PromocodesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PromocodesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PromocodesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPromocodesRecordData({
  String? code,
  DocumentReference? usedBy,
  DateTime? usedDate,
  DocumentReference? reward,
  bool? isActivated,
  bool? isExpired,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'code': code,
      'used_by': usedBy,
      'used_date': usedDate,
      'reward': reward,
      'is_activated': isActivated,
      'is_expired': isExpired,
    }.withoutNulls,
  );

  return firestoreData;
}

class PromocodesRecordDocumentEquality implements Equality<PromocodesRecord> {
  const PromocodesRecordDocumentEquality();

  @override
  bool equals(PromocodesRecord? e1, PromocodesRecord? e2) {
    return e1?.code == e2?.code &&
        e1?.usedBy == e2?.usedBy &&
        e1?.usedDate == e2?.usedDate &&
        e1?.reward == e2?.reward &&
        e1?.isActivated == e2?.isActivated &&
        e1?.isExpired == e2?.isExpired;
  }

  @override
  int hash(PromocodesRecord? e) => const ListEquality().hash([
        e?.code,
        e?.usedBy,
        e?.usedDate,
        e?.reward,
        e?.isActivated,
        e?.isExpired
      ]);

  @override
  bool isValidKey(Object? o) => o is PromocodesRecord;
}
