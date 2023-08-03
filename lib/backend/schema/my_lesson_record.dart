import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MyLessonRecord extends FirestoreRecord {
  MyLessonRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "subscriptionDate" field.
  DateTime? _subscriptionDate;
  DateTime? get subscriptionDate => _subscriptionDate;
  bool hasSubscriptionDate() => _subscriptionDate != null;

  // "percentageAchievement" field.
  double? _percentageAchievement;
  double get percentageAchievement => _percentageAchievement ?? 0.0;
  bool hasPercentageAchievement() => _percentageAchievement != null;

  // "lessonId" field.
  DocumentReference? _lessonId;
  DocumentReference? get lessonId => _lessonId;
  bool hasLessonId() => _lessonId != null;

  void _initializeFields() {
    _userId = snapshotData['userId'] as String?;
    _subscriptionDate = snapshotData['subscriptionDate'] as DateTime?;
    _percentageAchievement =
        castToType<double>(snapshotData['percentageAchievement']);
    _lessonId = snapshotData['lessonId'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('myLesson');

  static Stream<MyLessonRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MyLessonRecord.fromSnapshot(s));

  static Future<MyLessonRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MyLessonRecord.fromSnapshot(s));

  static MyLessonRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MyLessonRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MyLessonRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MyLessonRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MyLessonRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MyLessonRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMyLessonRecordData({
  String? userId,
  DateTime? subscriptionDate,
  double? percentageAchievement,
  DocumentReference? lessonId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userId': userId,
      'subscriptionDate': subscriptionDate,
      'percentageAchievement': percentageAchievement,
      'lessonId': lessonId,
    }.withoutNulls,
  );

  return firestoreData;
}

class MyLessonRecordDocumentEquality implements Equality<MyLessonRecord> {
  const MyLessonRecordDocumentEquality();

  @override
  bool equals(MyLessonRecord? e1, MyLessonRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.subscriptionDate == e2?.subscriptionDate &&
        e1?.percentageAchievement == e2?.percentageAchievement &&
        e1?.lessonId == e2?.lessonId;
  }

  @override
  int hash(MyLessonRecord? e) => const ListEquality().hash(
      [e?.userId, e?.subscriptionDate, e?.percentageAchievement, e?.lessonId]);

  @override
  bool isValidKey(Object? o) => o is MyLessonRecord;
}
