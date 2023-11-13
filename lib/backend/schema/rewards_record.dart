import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RewardsRecord extends FirestoreRecord {
  RewardsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "reward_name" field.
  String? _rewardName;
  String get rewardName => _rewardName ?? '';
  bool hasRewardName() => _rewardName != null;

  // "reward_description" field.
  String? _rewardDescription;
  String get rewardDescription => _rewardDescription ?? '';
  bool hasRewardDescription() => _rewardDescription != null;

  // "points_needed" field.
  int? _pointsNeeded;
  int get pointsNeeded => _pointsNeeded ?? 0;
  bool hasPointsNeeded() => _pointsNeeded != null;

  // "used" field.
  bool? _used;
  bool get used => _used ?? false;
  bool hasUsed() => _used != null;

  // "code" field.
  String? _code;
  String get code => _code ?? '';
  bool hasCode() => _code != null;

  // "reward_name_en" field.
  String? _rewardNameEn;
  String get rewardNameEn => _rewardNameEn ?? '';
  bool hasRewardNameEn() => _rewardNameEn != null;

  // "reward_name_kg" field.
  String? _rewardNameKg;
  String get rewardNameKg => _rewardNameKg ?? '';
  bool hasRewardNameKg() => _rewardNameKg != null;

  // "reward_description_en" field.
  String? _rewardDescriptionEn;
  String get rewardDescriptionEn => _rewardDescriptionEn ?? '';
  bool hasRewardDescriptionEn() => _rewardDescriptionEn != null;

  // "reward_description_kg" field.
  String? _rewardDescriptionKg;
  String get rewardDescriptionKg => _rewardDescriptionKg ?? '';
  bool hasRewardDescriptionKg() => _rewardDescriptionKg != null;

  // "used_date" field.
  DateTime? _usedDate;
  DateTime? get usedDate => _usedDate;
  bool hasUsedDate() => _usedDate != null;

  // "used_by" field.
  DocumentReference? _usedBy;
  DocumentReference? get usedBy => _usedBy;
  bool hasUsedBy() => _usedBy != null;

  void _initializeFields() {
    _rewardName = snapshotData['reward_name'] as String?;
    _rewardDescription = snapshotData['reward_description'] as String?;
    _pointsNeeded = castToType<int>(snapshotData['points_needed']);
    _used = snapshotData['used'] as bool?;
    _code = snapshotData['code'] as String?;
    _rewardNameEn = snapshotData['reward_name_en'] as String?;
    _rewardNameKg = snapshotData['reward_name_kg'] as String?;
    _rewardDescriptionEn = snapshotData['reward_description_en'] as String?;
    _rewardDescriptionKg = snapshotData['reward_description_kg'] as String?;
    _usedDate = snapshotData['used_date'] as DateTime?;
    _usedBy = snapshotData['used_by'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('rewards');

  static Stream<RewardsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RewardsRecord.fromSnapshot(s));

  static Future<RewardsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RewardsRecord.fromSnapshot(s));

  static RewardsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RewardsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RewardsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RewardsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RewardsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RewardsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRewardsRecordData({
  String? rewardName,
  String? rewardDescription,
  int? pointsNeeded,
  bool? used,
  String? code,
  String? rewardNameEn,
  String? rewardNameKg,
  String? rewardDescriptionEn,
  String? rewardDescriptionKg,
  DateTime? usedDate,
  DocumentReference? usedBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'reward_name': rewardName,
      'reward_description': rewardDescription,
      'points_needed': pointsNeeded,
      'used': used,
      'code': code,
      'reward_name_en': rewardNameEn,
      'reward_name_kg': rewardNameKg,
      'reward_description_en': rewardDescriptionEn,
      'reward_description_kg': rewardDescriptionKg,
      'used_date': usedDate,
      'used_by': usedBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class RewardsRecordDocumentEquality implements Equality<RewardsRecord> {
  const RewardsRecordDocumentEquality();

  @override
  bool equals(RewardsRecord? e1, RewardsRecord? e2) {
    return e1?.rewardName == e2?.rewardName &&
        e1?.rewardDescription == e2?.rewardDescription &&
        e1?.pointsNeeded == e2?.pointsNeeded &&
        e1?.used == e2?.used &&
        e1?.code == e2?.code &&
        e1?.rewardNameEn == e2?.rewardNameEn &&
        e1?.rewardNameKg == e2?.rewardNameKg &&
        e1?.rewardDescriptionEn == e2?.rewardDescriptionEn &&
        e1?.rewardDescriptionKg == e2?.rewardDescriptionKg &&
        e1?.usedDate == e2?.usedDate &&
        e1?.usedBy == e2?.usedBy;
  }

  @override
  int hash(RewardsRecord? e) => const ListEquality().hash([
        e?.rewardName,
        e?.rewardDescription,
        e?.pointsNeeded,
        e?.used,
        e?.code,
        e?.rewardNameEn,
        e?.rewardNameKg,
        e?.rewardDescriptionEn,
        e?.rewardDescriptionKg,
        e?.usedDate,
        e?.usedBy
      ]);

  @override
  bool isValidKey(Object? o) => o is RewardsRecord;
}
