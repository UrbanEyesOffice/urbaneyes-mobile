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

  // "unused_codes" field.
  List<String>? _unusedCodes;
  List<String> get unusedCodes => _unusedCodes ?? const [];
  bool hasUnusedCodes() => _unusedCodes != null;

  // "has_codes" field.
  bool? _hasCodes;
  bool get hasCodes => _hasCodes ?? false;
  bool hasHasCodes() => _hasCodes != null;

  // "used_by" field.
  List<DocumentReference>? _usedBy;
  List<DocumentReference> get usedBy => _usedBy ?? const [];
  bool hasUsedBy() => _usedBy != null;

  void _initializeFields() {
    _rewardName = snapshotData['reward_name'] as String?;
    _rewardDescription = snapshotData['reward_description'] as String?;
    _pointsNeeded = castToType<int>(snapshotData['points_needed']);
    _rewardNameEn = snapshotData['reward_name_en'] as String?;
    _rewardNameKg = snapshotData['reward_name_kg'] as String?;
    _rewardDescriptionEn = snapshotData['reward_description_en'] as String?;
    _rewardDescriptionKg = snapshotData['reward_description_kg'] as String?;
    _unusedCodes = getDataList(snapshotData['unused_codes']);
    _hasCodes = snapshotData['has_codes'] as bool?;
    _usedBy = getDataList(snapshotData['used_by']);
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
  String? rewardNameEn,
  String? rewardNameKg,
  String? rewardDescriptionEn,
  String? rewardDescriptionKg,
  bool? hasCodes,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'reward_name': rewardName,
      'reward_description': rewardDescription,
      'points_needed': pointsNeeded,
      'reward_name_en': rewardNameEn,
      'reward_name_kg': rewardNameKg,
      'reward_description_en': rewardDescriptionEn,
      'reward_description_kg': rewardDescriptionKg,
      'has_codes': hasCodes,
    }.withoutNulls,
  );

  return firestoreData;
}

class RewardsRecordDocumentEquality implements Equality<RewardsRecord> {
  const RewardsRecordDocumentEquality();

  @override
  bool equals(RewardsRecord? e1, RewardsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.rewardName == e2?.rewardName &&
        e1?.rewardDescription == e2?.rewardDescription &&
        e1?.pointsNeeded == e2?.pointsNeeded &&
        e1?.rewardNameEn == e2?.rewardNameEn &&
        e1?.rewardNameKg == e2?.rewardNameKg &&
        e1?.rewardDescriptionEn == e2?.rewardDescriptionEn &&
        e1?.rewardDescriptionKg == e2?.rewardDescriptionKg &&
        listEquality.equals(e1?.unusedCodes, e2?.unusedCodes) &&
        e1?.hasCodes == e2?.hasCodes &&
        listEquality.equals(e1?.usedBy, e2?.usedBy);
  }

  @override
  int hash(RewardsRecord? e) => const ListEquality().hash([
        e?.rewardName,
        e?.rewardDescription,
        e?.pointsNeeded,
        e?.rewardNameEn,
        e?.rewardNameKg,
        e?.rewardDescriptionEn,
        e?.rewardDescriptionKg,
        e?.unusedCodes,
        e?.hasCodes,
        e?.usedBy
      ]);

  @override
  bool isValidKey(Object? o) => o is RewardsRecord;
}
