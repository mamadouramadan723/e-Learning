import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ClasseRecord extends FirestoreRecord {
  ClasseRecord._(
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

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "order" field.
  int? _order;
  int get order => _order ?? 0;
  bool hasOrder() => _order != null;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _order = castToType<int>(snapshotData['order']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('classe');

  static Stream<ClasseRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ClasseRecord.fromSnapshot(s));

  static Future<ClasseRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ClasseRecord.fromSnapshot(s));

  static ClasseRecord fromSnapshot(DocumentSnapshot snapshot) => ClasseRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ClasseRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ClasseRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ClasseRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ClasseRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createClasseRecordData({
  String? id,
  String? name,
  String? description,
  int? order,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'order': order,
    }.withoutNulls,
  );

  return firestoreData;
}

class ClasseRecordDocumentEquality implements Equality<ClasseRecord> {
  const ClasseRecordDocumentEquality();

  @override
  bool equals(ClasseRecord? e1, ClasseRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.order == e2?.order;
  }

  @override
  int hash(ClasseRecord? e) =>
      const ListEquality().hash([e?.id, e?.name, e?.description, e?.order]);

  @override
  bool isValidKey(Object? o) => o is ClasseRecord;
}
