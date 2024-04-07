// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AnswerStruct extends FFFirebaseStruct {
  AnswerStruct({
    DocumentReference? surveyId,
    DocumentReference? questionId,
    DocumentReference? userId,
    DateTime? time,
    LatLng? location,
    OptionStruct? answer,
    String? comment,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _surveyId = surveyId,
        _questionId = questionId,
        _userId = userId,
        _time = time,
        _location = location,
        _answer = answer,
        _comment = comment,
        super(firestoreUtilData);

  // "survey_id" field.
  DocumentReference? _surveyId;
  DocumentReference? get surveyId => _surveyId;
  set surveyId(DocumentReference? val) => _surveyId = val;
  bool hasSurveyId() => _surveyId != null;

  // "question_id" field.
  DocumentReference? _questionId;
  DocumentReference? get questionId => _questionId;
  set questionId(DocumentReference? val) => _questionId = val;
  bool hasQuestionId() => _questionId != null;

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  set userId(DocumentReference? val) => _userId = val;
  bool hasUserId() => _userId != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  set time(DateTime? val) => _time = val;
  bool hasTime() => _time != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  set location(LatLng? val) => _location = val;
  bool hasLocation() => _location != null;

  // "answer" field.
  OptionStruct? _answer;
  OptionStruct get answer => _answer ?? OptionStruct();
  set answer(OptionStruct? val) => _answer = val;
  void updateAnswer(Function(OptionStruct) updateFn) =>
      updateFn(_answer ??= OptionStruct());
  bool hasAnswer() => _answer != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  set comment(String? val) => _comment = val;
  bool hasComment() => _comment != null;

  static AnswerStruct fromMap(Map<String, dynamic> data) => AnswerStruct(
        surveyId: data['survey_id'] as DocumentReference?,
        questionId: data['question_id'] as DocumentReference?,
        userId: data['user_id'] as DocumentReference?,
        time: data['time'] as DateTime?,
        location: data['location'] as LatLng?,
        answer: OptionStruct.maybeFromMap(data['answer']),
        comment: data['comment'] as String?,
      );

  static AnswerStruct? maybeFromMap(dynamic data) =>
      data is Map ? AnswerStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'survey_id': _surveyId,
        'question_id': _questionId,
        'user_id': _userId,
        'time': _time,
        'location': _location,
        'answer': _answer?.toMap(),
        'comment': _comment,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'survey_id': serializeParam(
          _surveyId,
          ParamType.DocumentReference,
        ),
        'question_id': serializeParam(
          _questionId,
          ParamType.DocumentReference,
        ),
        'user_id': serializeParam(
          _userId,
          ParamType.DocumentReference,
        ),
        'time': serializeParam(
          _time,
          ParamType.DateTime,
        ),
        'location': serializeParam(
          _location,
          ParamType.LatLng,
        ),
        'answer': serializeParam(
          _answer,
          ParamType.DataStruct,
        ),
        'comment': serializeParam(
          _comment,
          ParamType.String,
        ),
      }.withoutNulls;

  static AnswerStruct fromSerializableMap(Map<String, dynamic> data) =>
      AnswerStruct(
        surveyId: deserializeParam(
          data['survey_id'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['surveys'],
        ),
        questionId: deserializeParam(
          data['question_id'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['question'],
        ),
        userId: deserializeParam(
          data['user_id'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        time: deserializeParam(
          data['time'],
          ParamType.DateTime,
          false,
        ),
        location: deserializeParam(
          data['location'],
          ParamType.LatLng,
          false,
        ),
        answer: deserializeStructParam(
          data['answer'],
          ParamType.DataStruct,
          false,
          structBuilder: OptionStruct.fromSerializableMap,
        ),
        comment: deserializeParam(
          data['comment'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AnswerStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AnswerStruct &&
        surveyId == other.surveyId &&
        questionId == other.questionId &&
        userId == other.userId &&
        time == other.time &&
        location == other.location &&
        answer == other.answer &&
        comment == other.comment;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([surveyId, questionId, userId, time, location, answer, comment]);
}

AnswerStruct createAnswerStruct({
  DocumentReference? surveyId,
  DocumentReference? questionId,
  DocumentReference? userId,
  DateTime? time,
  LatLng? location,
  OptionStruct? answer,
  String? comment,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AnswerStruct(
      surveyId: surveyId,
      questionId: questionId,
      userId: userId,
      time: time,
      location: location,
      answer: answer ?? (clearUnsetFields ? OptionStruct() : null),
      comment: comment,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AnswerStruct? updateAnswerStruct(
  AnswerStruct? answerStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    answerStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAnswerStructData(
  Map<String, dynamic> firestoreData,
  AnswerStruct? answerStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (answerStruct == null) {
    return;
  }
  if (answerStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && answerStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final answerStructData = getAnswerFirestoreData(answerStruct, forFieldValue);
  final nestedData =
      answerStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = answerStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAnswerFirestoreData(
  AnswerStruct? answerStruct, [
  bool forFieldValue = false,
]) {
  if (answerStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(answerStruct.toMap());

  // Handle nested data for "answer" field.
  addOptionStructData(
    firestoreData,
    answerStruct.hasAnswer() ? answerStruct.answer : null,
    'answer',
    forFieldValue,
  );

  // Add any Firestore field values
  answerStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAnswerListFirestoreData(
  List<AnswerStruct>? answerStructs,
) =>
    answerStructs?.map((e) => getAnswerFirestoreData(e, true)).toList() ?? [];
