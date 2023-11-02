import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AnswerRecord extends FirestoreRecord {
  AnswerRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "survey_id" field.
  DocumentReference? _surveyId;
  DocumentReference? get surveyId => _surveyId;
  bool hasSurveyId() => _surveyId != null;

  // "question_id" field.
  DocumentReference? _questionId;
  DocumentReference? get questionId => _questionId;
  bool hasQuestionId() => _questionId != null;

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "answer" field.
  OptionStruct? _answer;
  OptionStruct get answer => _answer ?? OptionStruct();
  bool hasAnswer() => _answer != null;

  void _initializeFields() {
    _surveyId = snapshotData['survey_id'] as DocumentReference?;
    _questionId = snapshotData['question_id'] as DocumentReference?;
    _userId = snapshotData['user_id'] as DocumentReference?;
    _time = snapshotData['time'] as DateTime?;
    _location = snapshotData['location'] as LatLng?;
    _answer = OptionStruct.maybeFromMap(snapshotData['answer']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('answer');

  static Stream<AnswerRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AnswerRecord.fromSnapshot(s));

  static Future<AnswerRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AnswerRecord.fromSnapshot(s));

  static AnswerRecord fromSnapshot(DocumentSnapshot snapshot) => AnswerRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AnswerRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AnswerRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AnswerRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AnswerRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAnswerRecordData({
  DocumentReference? surveyId,
  DocumentReference? questionId,
  DocumentReference? userId,
  DateTime? time,
  LatLng? location,
  OptionStruct? answer,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'survey_id': surveyId,
      'question_id': questionId,
      'user_id': userId,
      'time': time,
      'location': location,
      'answer': OptionStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "answer" field.
  addOptionStructData(firestoreData, answer, 'answer');

  return firestoreData;
}

class AnswerRecordDocumentEquality implements Equality<AnswerRecord> {
  const AnswerRecordDocumentEquality();

  @override
  bool equals(AnswerRecord? e1, AnswerRecord? e2) {
    return e1?.surveyId == e2?.surveyId &&
        e1?.questionId == e2?.questionId &&
        e1?.userId == e2?.userId &&
        e1?.time == e2?.time &&
        e1?.location == e2?.location &&
        e1?.answer == e2?.answer;
  }

  @override
  int hash(AnswerRecord? e) => const ListEquality().hash(
      [e?.surveyId, e?.questionId, e?.userId, e?.time, e?.location, e?.answer]);

  @override
  bool isValidKey(Object? o) => o is AnswerRecord;
}
