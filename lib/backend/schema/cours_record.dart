import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CoursRecord extends FirestoreRecord {
  CoursRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "imageUrl" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "classesforthissubject" field.
  List<int>? _classesforthissubject;
  List<int> get classesforthissubject => _classesforthissubject ?? const [];
  bool hasClassesforthissubject() => _classesforthissubject != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _imageUrl = snapshotData['imageUrl'] as String?;
    _id = snapshotData['id'] as String?;
    _classesforthissubject = getDataList(snapshotData['classesforthissubject']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cours');

  static Stream<CoursRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CoursRecord.fromSnapshot(s));

  static Future<CoursRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CoursRecord.fromSnapshot(s));

  static CoursRecord fromSnapshot(DocumentSnapshot snapshot) => CoursRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CoursRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CoursRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CoursRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CoursRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCoursRecordData({
  String? name,
  String? description,
  String? imageUrl,
  String? id,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'id': id,
    }.withoutNulls,
  );

  return firestoreData;
}

class CoursRecordDocumentEquality implements Equality<CoursRecord> {
  const CoursRecordDocumentEquality();

  @override
  bool equals(CoursRecord? e1, CoursRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.imageUrl == e2?.imageUrl &&
        e1?.id == e2?.id &&
        listEquality.equals(
            e1?.classesforthissubject, e2?.classesforthissubject);
  }

  @override
  int hash(CoursRecord? e) => const ListEquality().hash(
      [e?.name, e?.description, e?.imageUrl, e?.id, e?.classesforthissubject]);

  @override
  bool isValidKey(Object? o) => o is CoursRecord;
}
