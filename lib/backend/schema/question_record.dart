import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuestionRecord extends FirestoreRecord {
  QuestionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  bool hasQuestion() => _question != null;

  // "survey_id" field.
  DocumentReference? _surveyId;
  DocumentReference? get surveyId => _surveyId;
  bool hasSurveyId() => _surveyId != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "creator_id" field.
  DocumentReference? _creatorId;
  DocumentReference? get creatorId => _creatorId;
  bool hasCreatorId() => _creatorId != null;

  // "question_en" field.
  String? _questionEn;
  String get questionEn => _questionEn ?? '';
  bool hasQuestionEn() => _questionEn != null;

  // "question_kg" field.
  String? _questionKg;
  String get questionKg => _questionKg ?? '';
  bool hasQuestionKg() => _questionKg != null;

  // "question_order" field.
  int? _questionOrder;
  int get questionOrder => _questionOrder ?? 0;
  bool hasQuestionOrder() => _questionOrder != null;

  // "options" field.
  List<OptionStruct>? _options;
  List<OptionStruct> get options => _options ?? const [];
  bool hasOptions() => _options != null;

  // "enabled" field.
  bool? _enabled;
  bool get enabled => _enabled ?? false;
  bool hasEnabled() => _enabled != null;

  void _initializeFields() {
    _question = snapshotData['question'] as String?;
    _surveyId = snapshotData['survey_id'] as DocumentReference?;
    _status = snapshotData['status'] as String?;
    _creatorId = snapshotData['creator_id'] as DocumentReference?;
    _questionEn = snapshotData['question_en'] as String?;
    _questionKg = snapshotData['question_kg'] as String?;
    _questionOrder = castToType<int>(snapshotData['question_order']);
    _options = getStructList(
      snapshotData['options'],
      OptionStruct.fromMap,
    );
    _enabled = snapshotData['enabled'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('question');

  static Stream<QuestionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuestionRecord.fromSnapshot(s));

  static Future<QuestionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuestionRecord.fromSnapshot(s));

  static QuestionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuestionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuestionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuestionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuestionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuestionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuestionRecordData({
  String? question,
  DocumentReference? surveyId,
  String? status,
  DocumentReference? creatorId,
  String? questionEn,
  String? questionKg,
  int? questionOrder,
  bool? enabled,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'question': question,
      'survey_id': surveyId,
      'status': status,
      'creator_id': creatorId,
      'question_en': questionEn,
      'question_kg': questionKg,
      'question_order': questionOrder,
      'enabled': enabled,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuestionRecordDocumentEquality implements Equality<QuestionRecord> {
  const QuestionRecordDocumentEquality();

  @override
  bool equals(QuestionRecord? e1, QuestionRecord? e2) {
    const listEquality = ListEquality();
    return e1?.question == e2?.question &&
        e1?.surveyId == e2?.surveyId &&
        e1?.status == e2?.status &&
        e1?.creatorId == e2?.creatorId &&
        e1?.questionEn == e2?.questionEn &&
        e1?.questionKg == e2?.questionKg &&
        e1?.questionOrder == e2?.questionOrder &&
        listEquality.equals(e1?.options, e2?.options) &&
        e1?.enabled == e2?.enabled;
  }

  @override
  int hash(QuestionRecord? e) => const ListEquality().hash([
        e?.question,
        e?.surveyId,
        e?.status,
        e?.creatorId,
        e?.questionEn,
        e?.questionKg,
        e?.questionOrder,
        e?.options,
        e?.enabled
      ]);

  @override
  bool isValidKey(Object? o) => o is QuestionRecord;
}
