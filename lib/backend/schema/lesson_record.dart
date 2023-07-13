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

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "classeId" field.
  String? _classeId;
  String get classeId => _classeId ?? '';
  bool hasClasseId() => _classeId != null;

  // "coursId" field.
  String? _coursId;
  String get coursId => _coursId ?? '';
  bool hasCoursId() => _coursId != null;

  // "chapitreId" field.
  String? _chapitreId;
  String get chapitreId => _chapitreId ?? '';
  bool hasChapitreId() => _chapitreId != null;

  // "orderOfTheLesson" field.
  int? _orderOfTheLesson;
  int get orderOfTheLesson => _orderOfTheLesson ?? 0;
  bool hasOrderOfTheLesson() => _orderOfTheLesson != null;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _content = snapshotData['content'] as String?;
    _creationDate = snapshotData['creationDate'] as DateTime?;
    _createdBy = snapshotData['createdBy'] as String?;
    _modificationDate = getDataList(snapshotData['modificationDate']);
    _title = snapshotData['title'] as String?;
    _classeId = snapshotData['classeId'] as String?;
    _coursId = snapshotData['coursId'] as String?;
    _chapitreId = snapshotData['chapitreId'] as String?;
    _orderOfTheLesson = castToType<int>(snapshotData['orderOfTheLesson']);
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
  String? title,
  String? classeId,
  String? coursId,
  String? chapitreId,
  int? orderOfTheLesson,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'content': content,
      'creationDate': creationDate,
      'createdBy': createdBy,
      'title': title,
      'classeId': classeId,
      'coursId': coursId,
      'chapitreId': chapitreId,
      'orderOfTheLesson': orderOfTheLesson,
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
        e1?.title == e2?.title &&
        e1?.classeId == e2?.classeId &&
        e1?.coursId == e2?.coursId &&
        e1?.chapitreId == e2?.chapitreId &&
        e1?.orderOfTheLesson == e2?.orderOfTheLesson;
  }

  @override
  int hash(LessonRecord? e) => const ListEquality().hash([
        e?.id,
        e?.content,
        e?.creationDate,
        e?.createdBy,
        e?.modificationDate,
        e?.title,
        e?.classeId,
        e?.coursId,
        e?.chapitreId,
        e?.orderOfTheLesson
      ]);

  @override
  bool isValidKey(Object? o) => o is LessonRecord;
}
