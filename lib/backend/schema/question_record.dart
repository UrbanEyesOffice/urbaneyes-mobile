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

  // "question_type" field.
  int? _questionType;
  int get questionType => _questionType ?? 0;
  bool hasQuestionType() => _questionType != null;

  // "survey_id" field.
  DocumentReference? _surveyId;
  DocumentReference? get surveyId => _surveyId;
  bool hasSurveyId() => _surveyId != null;

  // "option" field.
  List<String>? _option;
  List<String> get option => _option ?? const [];
  bool hasOption() => _option != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "creator_id" field.
  DocumentReference? _creatorId;
  DocumentReference? get creatorId => _creatorId;
  bool hasCreatorId() => _creatorId != null;

  void _initializeFields() {
    _question = snapshotData['question'] as String?;
    _questionType = castToType<int>(snapshotData['question_type']);
    _surveyId = snapshotData['survey_id'] as DocumentReference?;
    _option = getDataList(snapshotData['option']);
    _status = snapshotData['status'] as String?;
    _creatorId = snapshotData['creator_id'] as DocumentReference?;
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
  int? questionType,
  DocumentReference? surveyId,
  String? status,
  DocumentReference? creatorId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'question': question,
      'question_type': questionType,
      'survey_id': surveyId,
      'status': status,
      'creator_id': creatorId,
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
        e1?.questionType == e2?.questionType &&
        e1?.surveyId == e2?.surveyId &&
        listEquality.equals(e1?.option, e2?.option) &&
        e1?.status == e2?.status &&
        e1?.creatorId == e2?.creatorId;
  }

  @override
  int hash(QuestionRecord? e) => const ListEquality().hash([
        e?.question,
        e?.questionType,
        e?.surveyId,
        e?.option,
        e?.status,
        e?.creatorId
      ]);

  @override
  bool isValidKey(Object? o) => o is QuestionRecord;
}
