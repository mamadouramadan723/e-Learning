import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MyCoursesRecord extends FirestoreRecord {
  MyCoursesRecord._(
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

  // "courseId" field.
  DocumentReference? _courseId;
  DocumentReference? get courseId => _courseId;
  bool hasCourseId() => _courseId != null;

  void _initializeFields() {
    _userId = snapshotData['userId'] as String?;
    _subscriptionDate = snapshotData['subscriptionDate'] as DateTime?;
    _percentageAchievement =
        castToType<double>(snapshotData['percentageAchievement']);
    _courseId = snapshotData['courseId'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('myCourses');

  static Stream<MyCoursesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MyCoursesRecord.fromSnapshot(s));

  static Future<MyCoursesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MyCoursesRecord.fromSnapshot(s));

  static MyCoursesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MyCoursesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MyCoursesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MyCoursesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MyCoursesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MyCoursesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMyCoursesRecordData({
  String? userId,
  DateTime? subscriptionDate,
  double? percentageAchievement,
  DocumentReference? courseId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userId': userId,
      'subscriptionDate': subscriptionDate,
      'percentageAchievement': percentageAchievement,
      'courseId': courseId,
    }.withoutNulls,
  );

  return firestoreData;
}

class MyCoursesRecordDocumentEquality implements Equality<MyCoursesRecord> {
  const MyCoursesRecordDocumentEquality();

  @override
  bool equals(MyCoursesRecord? e1, MyCoursesRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.subscriptionDate == e2?.subscriptionDate &&
        e1?.percentageAchievement == e2?.percentageAchievement &&
        e1?.courseId == e2?.courseId;
  }

  @override
  int hash(MyCoursesRecord? e) => const ListEquality().hash(
      [e?.userId, e?.subscriptionDate, e?.percentageAchievement, e?.courseId]);

  @override
  bool isValidKey(Object? o) => o is MyCoursesRecord;
}
