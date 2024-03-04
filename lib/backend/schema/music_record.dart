import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MusicRecord extends FirestoreRecord {
  MusicRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "songTitle" field.
  String? _songTitle;
  String get songTitle => _songTitle ?? '';
  bool hasSongTitle() => _songTitle != null;

  // "songCover" field.
  String? _songCover;
  String get songCover => _songCover ?? '';
  bool hasSongCover() => _songCover != null;

  // "filePath" field.
  String? _filePath;
  String get filePath => _filePath ?? '';
  bool hasFilePath() => _filePath != null;

  // "download_stream_options" field.
  String? _downloadStreamOptions;
  String get downloadStreamOptions => _downloadStreamOptions ?? '';
  bool hasDownloadStreamOptions() => _downloadStreamOptions != null;

  // "video_url" field.
  String? _videoUrl;
  String get videoUrl => _videoUrl ?? '';
  bool hasVideoUrl() => _videoUrl != null;

  // "ListenBy" field.
  List<DocumentReference>? _listenBy;
  List<DocumentReference> get listenBy => _listenBy ?? const [];
  bool hasListenBy() => _listenBy != null;

  // "songID" field.
  DocumentReference? _songID;
  DocumentReference? get songID => _songID;
  bool hasSongID() => _songID != null;

  // "Album" field.
  DocumentReference? _album;
  DocumentReference? get album => _album;
  bool hasAlbum() => _album != null;

  // "favoritesof" field.
  DocumentReference? _favoritesof;
  DocumentReference? get favoritesof => _favoritesof;
  bool hasFavoritesof() => _favoritesof != null;

  // "ID" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  void _initializeFields() {
    _songTitle = snapshotData['songTitle'] as String?;
    _songCover = snapshotData['songCover'] as String?;
    _filePath = snapshotData['filePath'] as String?;
    _downloadStreamOptions = snapshotData['download_stream_options'] as String?;
    _videoUrl = snapshotData['video_url'] as String?;
    _listenBy = getDataList(snapshotData['ListenBy']);
    _songID = snapshotData['songID'] as DocumentReference?;
    _album = snapshotData['Album'] as DocumentReference?;
    _favoritesof = snapshotData['favoritesof'] as DocumentReference?;
    _id = snapshotData['ID'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Music');

  static Stream<MusicRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MusicRecord.fromSnapshot(s));

  static Future<MusicRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MusicRecord.fromSnapshot(s));

  static MusicRecord fromSnapshot(DocumentSnapshot snapshot) => MusicRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MusicRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MusicRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MusicRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MusicRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMusicRecordData({
  String? songTitle,
  String? songCover,
  String? filePath,
  String? downloadStreamOptions,
  String? videoUrl,
  DocumentReference? songID,
  DocumentReference? album,
  DocumentReference? favoritesof,
  String? id,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'songTitle': songTitle,
      'songCover': songCover,
      'filePath': filePath,
      'download_stream_options': downloadStreamOptions,
      'video_url': videoUrl,
      'songID': songID,
      'Album': album,
      'favoritesof': favoritesof,
      'ID': id,
    }.withoutNulls,
  );

  return firestoreData;
}

class MusicRecordDocumentEquality implements Equality<MusicRecord> {
  const MusicRecordDocumentEquality();

  @override
  bool equals(MusicRecord? e1, MusicRecord? e2) {
    const listEquality = ListEquality();
    return e1?.songTitle == e2?.songTitle &&
        e1?.songCover == e2?.songCover &&
        e1?.filePath == e2?.filePath &&
        e1?.downloadStreamOptions == e2?.downloadStreamOptions &&
        e1?.videoUrl == e2?.videoUrl &&
        listEquality.equals(e1?.listenBy, e2?.listenBy) &&
        e1?.songID == e2?.songID &&
        e1?.album == e2?.album &&
        e1?.favoritesof == e2?.favoritesof &&
        e1?.id == e2?.id;
  }

  @override
  int hash(MusicRecord? e) => const ListEquality().hash([
        e?.songTitle,
        e?.songCover,
        e?.filePath,
        e?.downloadStreamOptions,
        e?.videoUrl,
        e?.listenBy,
        e?.songID,
        e?.album,
        e?.favoritesof,
        e?.id
      ]);

  @override
  bool isValidKey(Object? o) => o is MusicRecord;
}
