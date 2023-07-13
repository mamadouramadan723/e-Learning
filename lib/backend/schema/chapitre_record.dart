import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChapitreRecord extends FirestoreRecord {
  ChapitreRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "order" field.
  int? _order;
  int get order => _order ?? 0;
  bool hasOrder() => _order != null;

  // "coursId" field.
  String? _coursId;
  String get coursId => _coursId ?? '';
  bool hasCoursId() => _coursId != null;

  // "classeId" field.
  String? _classeId;
  String get classeId => _classeId ?? '';
  bool hasClasseId() => _classeId != null;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _name = snapshotData['name'] as String?;
    _order = castToType<int>(snapshotData['order']);
    _coursId = snapshotData['coursId'] as String?;
    _classeId = snapshotData['classeId'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chapitre');

  static Stream<ChapitreRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChapitreRecord.fromSnapshot(s));

  static Future<ChapitreRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChapitreRecord.fromSnapshot(s));

  static ChapitreRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChapitreRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChapitreRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChapitreRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChapitreRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChapitreRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChapitreRecordData({
  String? id,
  String? name,
  int? order,
  String? coursId,
  String? classeId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'name': name,
      'order': order,
      'coursId': coursId,
      'classeId': classeId,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChapitreRecordDocumentEquality implements Equality<ChapitreRecord> {
  const ChapitreRecordDocumentEquality();

  @override
  bool equals(ChapitreRecord? e1, ChapitreRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.name == e2?.name &&
        e1?.order == e2?.order &&
        e1?.coursId == e2?.coursId &&
        e1?.classeId == e2?.classeId;
  }

  @override
  int hash(ChapitreRecord? e) => const ListEquality()
      .hash([e?.id, e?.name, e?.order, e?.coursId, e?.classeId]);

  @override
  bool isValidKey(Object? o) => o is ChapitreRecord;
}
