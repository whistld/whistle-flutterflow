import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AlbumsRecord extends FirestoreRecord {
  AlbumsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "cover" field.
  String? _cover;
  String get cover => _cover ?? '';
  bool hasCover() => _cover != null;

  // "songs" field.
  List<DocumentReference>? _songs;
  List<DocumentReference> get songs => _songs ?? const [];
  bool hasSongs() => _songs != null;

  // "date_of_creation" field.
  DateTime? _dateOfCreation;
  DateTime? get dateOfCreation => _dateOfCreation;
  bool hasDateOfCreation() => _dateOfCreation != null;

  // "UserID" field.
  DocumentReference? _userID;
  DocumentReference? get userID => _userID;
  bool hasUserID() => _userID != null;

  // "releaseDate" field.
  DateTime? _releaseDate;
  DateTime? get releaseDate => _releaseDate;
  bool hasReleaseDate() => _releaseDate != null;

  // "Description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _cover = snapshotData['cover'] as String?;
    _songs = getDataList(snapshotData['songs']);
    _dateOfCreation = snapshotData['date_of_creation'] as DateTime?;
    _userID = snapshotData['UserID'] as DocumentReference?;
    _releaseDate = snapshotData['releaseDate'] as DateTime?;
    _description = snapshotData['Description'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Albums');

  static Stream<AlbumsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AlbumsRecord.fromSnapshot(s));

  static Future<AlbumsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AlbumsRecord.fromSnapshot(s));

  static AlbumsRecord fromSnapshot(DocumentSnapshot snapshot) => AlbumsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AlbumsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AlbumsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AlbumsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AlbumsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAlbumsRecordData({
  String? name,
  String? cover,
  DateTime? dateOfCreation,
  DocumentReference? userID,
  DateTime? releaseDate,
  String? description,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'cover': cover,
      'date_of_creation': dateOfCreation,
      'UserID': userID,
      'releaseDate': releaseDate,
      'Description': description,
    }.withoutNulls,
  );

  return firestoreData;
}

class AlbumsRecordDocumentEquality implements Equality<AlbumsRecord> {
  const AlbumsRecordDocumentEquality();

  @override
  bool equals(AlbumsRecord? e1, AlbumsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.cover == e2?.cover &&
        listEquality.equals(e1?.songs, e2?.songs) &&
        e1?.dateOfCreation == e2?.dateOfCreation &&
        e1?.userID == e2?.userID &&
        e1?.releaseDate == e2?.releaseDate &&
        e1?.description == e2?.description;
  }

  @override
  int hash(AlbumsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.cover,
        e?.songs,
        e?.dateOfCreation,
        e?.userID,
        e?.releaseDate,
        e?.description
      ]);

  @override
  bool isValidKey(Object? o) => o is AlbumsRecord;
}
