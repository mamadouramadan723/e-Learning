import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LessonRecord extends FirestoreRecord {
  LessonRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "creationDate" field.
  DateTime? _creationDate;
  DateTime? get creationDate => _creationDate;
  bool hasCreationDate() => _creationDate != null;

  // "createdBy" field.
  String? _createdBy;
  String get createdBy => _createdBy ?? '';
  bool hasCreatedBy() => _createdBy != null;

  // "modificationDate" field.
  List<DateTime>? _modificationDate;
  List<DateTime> get modificationDate => _modificationDate ?? const [];
  bool hasModificationDate() => _modificationDate != null;

  // "coursId" field.
  DocumentReference? _coursId;
  DocumentReference? get coursId => _coursId;
  bool hasCoursId() => _coursId != null;

  // "chapterId" field.
  DocumentReference? _chapterId;
  DocumentReference? get chapterId => _chapterId;
  bool hasChapterId() => _chapterId != null;

  // "classId" field.
  DocumentReference? _classId;
  DocumentReference? get classId => _classId;
  bool hasClassId() => _classId != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _content = snapshotData['content'] as String?;
    _creationDate = snapshotData['creationDate'] as DateTime?;
    _createdBy = snapshotData['createdBy'] as String?;
    _modificationDate = getDataList(snapshotData['modificationDate']);
    _coursId = snapshotData['coursId'] as DocumentReference?;
    _chapterId = snapshotData['chapterId'] as DocumentReference?;
    _classId = snapshotData['classId'] as DocumentReference?;
    _title = snapshotData['title'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('lesson');

  static Stream<LessonRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LessonRecord.fromSnapshot(s));

  static Future<LessonRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LessonRecord.fromSnapshot(s));

  static LessonRecord fromSnapshot(DocumentSnapshot snapshot) => LessonRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LessonRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LessonRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LessonRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LessonRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLessonRecordData({
  String? id,
  String? content,
  DateTime? creationDate,
  String? createdBy,
  DocumentReference? coursId,
  DocumentReference? chapterId,
  DocumentReference? classId,
  String? title,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'content': content,
      'creationDate': creationDate,
      'createdBy': createdBy,
      'coursId': coursId,
      'chapterId': chapterId,
      'classId': classId,
      'title': title,
    }.withoutNulls,
  );

  return firestoreData;
}

class LessonRecordDocumentEquality implements Equality<LessonRecord> {
  const LessonRecordDocumentEquality();

  @override
  bool equals(LessonRecord? e1, LessonRecord? e2) {
    const listEquality = ListEquality();
    return e1?.id == e2?.id &&
        e1?.content == e2?.content &&
        e1?.creationDate == e2?.creationDate &&
        e1?.createdBy == e2?.createdBy &&
        listEquality.equals(e1?.modificationDate, e2?.modificationDate) &&
        e1?.coursId == e2?.coursId &&
        e1?.chapterId == e2?.chapterId &&
        e1?.classId == e2?.classId &&
        e1?.title == e2?.title;
  }

  @override
  int hash(LessonRecord? e) => const ListEquality().hash([
        e?.id,
        e?.content,
        e?.creationDate,
        e?.createdBy,
        e?.modificationDate,
        e?.coursId,
        e?.chapterId,
        e?.classId,
        e?.title
      ]);

  @override
  bool isValidKey(Object? o) => o is LessonRecord;
}
