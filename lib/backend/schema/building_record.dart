import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BuildingRecord extends FirestoreRecord {
  BuildingRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_by" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  bool hasImages() => _images != null;

  // "location_title" field.
  String? _locationTitle;
  String get locationTitle => _locationTitle ?? '';
  bool hasLocationTitle() => _locationTitle != null;

  // "availability" field.
  BuildingAvailability? _availability;
  BuildingAvailability? get availability => _availability;
  bool hasAvailability() => _availability != null;

  // "liked" field.
  List<BuildingAnswers>? _liked;
  List<BuildingAnswers> get liked => _liked ?? const [];
  bool hasLiked() => _liked != null;

  // "disliked" field.
  List<BuildingAnswers>? _disliked;
  List<BuildingAnswers> get disliked => _disliked ?? const [];
  bool hasDisliked() => _disliked != null;

  void _initializeFields() {
    _createdBy = snapshotData['created_by'] as DocumentReference?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _location = snapshotData['location'] as LatLng?;
    _comment = snapshotData['comment'] as String?;
    _images = getDataList(snapshotData['images']);
    _locationTitle = snapshotData['location_title'] as String?;
    _availability = snapshotData['availability'] is BuildingAvailability
        ? snapshotData['availability']
        : deserializeEnum<BuildingAvailability>(snapshotData['availability']);
    _liked = getEnumList<BuildingAnswers>(snapshotData['liked']);
    _disliked = getEnumList<BuildingAnswers>(snapshotData['disliked']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('building');

  static Stream<BuildingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BuildingRecord.fromSnapshot(s));

  static Future<BuildingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BuildingRecord.fromSnapshot(s));

  static BuildingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BuildingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BuildingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BuildingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BuildingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BuildingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBuildingRecordData({
  DocumentReference? createdBy,
  DateTime? createdTime,
  LatLng? location,
  String? comment,
  String? locationTitle,
  BuildingAvailability? availability,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_by': createdBy,
      'created_time': createdTime,
      'location': location,
      'comment': comment,
      'location_title': locationTitle,
      'availability': availability,
    }.withoutNulls,
  );

  return firestoreData;
}

class BuildingRecordDocumentEquality implements Equality<BuildingRecord> {
  const BuildingRecordDocumentEquality();

  @override
  bool equals(BuildingRecord? e1, BuildingRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdBy == e2?.createdBy &&
        e1?.createdTime == e2?.createdTime &&
        e1?.location == e2?.location &&
        e1?.comment == e2?.comment &&
        listEquality.equals(e1?.images, e2?.images) &&
        e1?.locationTitle == e2?.locationTitle &&
        e1?.availability == e2?.availability &&
        listEquality.equals(e1?.liked, e2?.liked) &&
        listEquality.equals(e1?.disliked, e2?.disliked);
  }

  @override
  int hash(BuildingRecord? e) => const ListEquality().hash([
        e?.createdBy,
        e?.createdTime,
        e?.location,
        e?.comment,
        e?.images,
        e?.locationTitle,
        e?.availability,
        e?.liked,
        e?.disliked
      ]);

  @override
  bool isValidKey(Object? o) => o is BuildingRecord;
}
