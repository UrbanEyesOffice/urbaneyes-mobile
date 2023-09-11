import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuestionOptionRecord extends FirestoreRecord {
  QuestionOptionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "question_id" field.
  DocumentReference? _questionId;
  DocumentReference? get questionId => _questionId;
  bool hasQuestionId() => _questionId != null;

  // "opiton" field.
  String? _opiton;
  String get opiton => _opiton ?? '';
  bool hasOpiton() => _opiton != null;

  // "order" field.
  int? _order;
  int get order => _order ?? 0;
  bool hasOrder() => _order != null;

  void _initializeFields() {
    _questionId = snapshotData['question_id'] as DocumentReference?;
    _opiton = snapshotData['opiton'] as String?;
    _order = castToType<int>(snapshotData['order']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('question_option');

  static Stream<QuestionOptionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuestionOptionRecord.fromSnapshot(s));

  static Future<QuestionOptionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuestionOptionRecord.fromSnapshot(s));

  static QuestionOptionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuestionOptionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuestionOptionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuestionOptionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuestionOptionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuestionOptionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuestionOptionRecordData({
  DocumentReference? questionId,
  String? opiton,
  int? order,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'question_id': questionId,
      'opiton': opiton,
      'order': order,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuestionOptionRecordDocumentEquality
    implements Equality<QuestionOptionRecord> {
  const QuestionOptionRecordDocumentEquality();

  @override
  bool equals(QuestionOptionRecord? e1, QuestionOptionRecord? e2) {
    return e1?.questionId == e2?.questionId &&
        e1?.opiton == e2?.opiton &&
        e1?.order == e2?.order;
  }

  @override
  int hash(QuestionOptionRecord? e) =>
      const ListEquality().hash([e?.questionId, e?.opiton, e?.order]);

  @override
  bool isValidKey(Object? o) => o is QuestionOptionRecord;
}
