import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DetailscoursRecord extends FirestoreRecord {
  DetailscoursRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "coursId" field.
  DocumentReference? _coursId;
  DocumentReference? get coursId => _coursId;
  bool hasCoursId() => _coursId != null;

  // "creationDate" field.
  DateTime? _creationDate;
  DateTime? get creationDate => _creationDate;
  bool hasCreationDate() => _creationDate != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  void _initializeFields() {
    _coursId = snapshotData['coursId'] as DocumentReference?;
    _creationDate = snapshotData['creationDate'] as DateTime?;
    _id = snapshotData['id'] as String?;
    _content = snapshotData['content'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('detailscours');

  static Stream<DetailscoursRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DetailscoursRecord.fromSnapshot(s));

  static Future<DetailscoursRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DetailscoursRecord.fromSnapshot(s));

  static DetailscoursRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DetailscoursRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DetailscoursRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DetailscoursRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DetailscoursRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DetailscoursRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDetailscoursRecordData({
  DocumentReference? coursId,
  DateTime? creationDate,
  String? id,
  String? content,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'coursId': coursId,
      'creationDate': creationDate,
      'id': id,
      'content': content,
    }.withoutNulls,
  );

  return firestoreData;
}

class DetailscoursRecordDocumentEquality
    implements Equality<DetailscoursRecord> {
  const DetailscoursRecordDocumentEquality();

  @override
  bool equals(DetailscoursRecord? e1, DetailscoursRecord? e2) {
    return e1?.coursId == e2?.coursId &&
        e1?.creationDate == e2?.creationDate &&
        e1?.id == e2?.id &&
        e1?.content == e2?.content;
  }

  @override
  int hash(DetailscoursRecord? e) => const ListEquality()
      .hash([e?.coursId, e?.creationDate, e?.id, e?.content]);

  @override
  bool isValidKey(Object? o) => o is DetailscoursRecord;
}
