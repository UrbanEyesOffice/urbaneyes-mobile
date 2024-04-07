import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ParkingRecord extends FirestoreRecord {
  ParkingRecord._(
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

  // "contact_info" field.
  String? _contactInfo;
  String get contactInfo => _contactInfo ?? '';
  bool hasContactInfo() => _contactInfo != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  bool hasImages() => _images != null;

  void _initializeFields() {
    _createdBy = snapshotData['created_by'] as DocumentReference?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _location = snapshotData['location'] as LatLng?;
    _comment = snapshotData['comment'] as String?;
    _contactInfo = snapshotData['contact_info'] as String?;
    _images = getDataList(snapshotData['images']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('parking');

  static Stream<ParkingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ParkingRecord.fromSnapshot(s));

  static Future<ParkingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ParkingRecord.fromSnapshot(s));

  static ParkingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ParkingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ParkingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ParkingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ParkingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ParkingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createParkingRecordData({
  DocumentReference? createdBy,
  DateTime? createdTime,
  LatLng? location,
  String? comment,
  String? contactInfo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_by': createdBy,
      'created_time': createdTime,
      'location': location,
      'comment': comment,
      'contact_info': contactInfo,
    }.withoutNulls,
  );

  return firestoreData;
}

class ParkingRecordDocumentEquality implements Equality<ParkingRecord> {
  const ParkingRecordDocumentEquality();

  @override
  bool equals(ParkingRecord? e1, ParkingRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdBy == e2?.createdBy &&
        e1?.createdTime == e2?.createdTime &&
        e1?.location == e2?.location &&
        e1?.comment == e2?.comment &&
        e1?.contactInfo == e2?.contactInfo &&
        listEquality.equals(e1?.images, e2?.images);
  }

  @override
  int hash(ParkingRecord? e) => const ListEquality().hash([
        e?.createdBy,
        e?.createdTime,
        e?.location,
        e?.comment,
        e?.contactInfo,
        e?.images
      ]);

  @override
  bool isValidKey(Object? o) => o is ParkingRecord;
}
