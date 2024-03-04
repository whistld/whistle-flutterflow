import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "music_genre" field.
  List<DocumentReference>? _musicGenre;
  List<DocumentReference> get musicGenre => _musicGenre ?? const [];
  bool hasMusicGenre() => _musicGenre != null;

  // "band" field.
  BandsStruct? _band;
  BandsStruct get band => _band ?? BandsStruct();
  bool hasBand() => _band != null;

  // "instruments_played" field.
  List<DocumentReference>? _instrumentsPlayed;
  List<DocumentReference> get instrumentsPlayed =>
      _instrumentsPlayed ?? const [];
  bool hasInstrumentsPlayed() => _instrumentsPlayed != null;

  // "date_of_birth" field.
  String? _dateOfBirth;
  String get dateOfBirth => _dateOfBirth ?? '';
  bool hasDateOfBirth() => _dateOfBirth != null;

  // "device_info" field.
  LatLng? _deviceInfo;
  LatLng? get deviceInfo => _deviceInfo;
  bool hasDeviceInfo() => _deviceInfo != null;

  // "About_artist" field.
  String? _aboutArtist;
  String get aboutArtist => _aboutArtist ?? '';
  bool hasAboutArtist() => _aboutArtist != null;

  // "skills_reward" field.
  SkillsandRewardStruct? _skillsReward;
  SkillsandRewardStruct get skillsReward =>
      _skillsReward ?? SkillsandRewardStruct();
  bool hasSkillsReward() => _skillsReward != null;

  // "Albums" field.
  DocumentReference? _albums;
  DocumentReference? get albums => _albums;
  bool hasAlbums() => _albums != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "SongListen" field.
  List<DocumentReference>? _songListen;
  List<DocumentReference> get songListen => _songListen ?? const [];
  bool hasSongListen() => _songListen != null;

  // "Favorites" field.
  List<DocumentReference>? _favorites;
  List<DocumentReference> get favorites => _favorites ?? const [];
  bool hasFavorites() => _favorites != null;

  // "favorit" field.
  List<String>? _favorit;
  List<String> get favorit => _favorit ?? const [];
  bool hasFavorit() => _favorit != null;

  // "AppliedGig" field.
  List<EventsStruct>? _appliedGig;
  List<EventsStruct> get appliedGig => _appliedGig ?? const [];
  bool hasAppliedGig() => _appliedGig != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _musicGenre = getDataList(snapshotData['music_genre']);
    _band = BandsStruct.maybeFromMap(snapshotData['band']);
    _instrumentsPlayed = getDataList(snapshotData['instruments_played']);
    _dateOfBirth = snapshotData['date_of_birth'] as String?;
    _deviceInfo = snapshotData['device_info'] as LatLng?;
    _aboutArtist = snapshotData['About_artist'] as String?;
    _skillsReward =
        SkillsandRewardStruct.maybeFromMap(snapshotData['skills_reward']);
    _albums = snapshotData['Albums'] as DocumentReference?;
    _role = snapshotData['role'] as String?;
    _songListen = getDataList(snapshotData['SongListen']);
    _favorites = getDataList(snapshotData['Favorites']);
    _favorit = getDataList(snapshotData['favorit']);
    _appliedGig = getStructList(
      snapshotData['AppliedGig'],
      EventsStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  BandsStruct? band,
  String? dateOfBirth,
  LatLng? deviceInfo,
  String? aboutArtist,
  SkillsandRewardStruct? skillsReward,
  DocumentReference? albums,
  String? role,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'band': BandsStruct().toMap(),
      'date_of_birth': dateOfBirth,
      'device_info': deviceInfo,
      'About_artist': aboutArtist,
      'skills_reward': SkillsandRewardStruct().toMap(),
      'Albums': albums,
      'role': role,
    }.withoutNulls,
  );

  // Handle nested data for "band" field.
  addBandsStructData(firestoreData, band, 'band');

  // Handle nested data for "skills_reward" field.
  addSkillsandRewardStructData(firestoreData, skillsReward, 'skills_reward');

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        listEquality.equals(e1?.musicGenre, e2?.musicGenre) &&
        e1?.band == e2?.band &&
        listEquality.equals(e1?.instrumentsPlayed, e2?.instrumentsPlayed) &&
        e1?.dateOfBirth == e2?.dateOfBirth &&
        e1?.deviceInfo == e2?.deviceInfo &&
        e1?.aboutArtist == e2?.aboutArtist &&
        e1?.skillsReward == e2?.skillsReward &&
        e1?.albums == e2?.albums &&
        e1?.role == e2?.role &&
        listEquality.equals(e1?.songListen, e2?.songListen) &&
        listEquality.equals(e1?.favorites, e2?.favorites) &&
        listEquality.equals(e1?.favorit, e2?.favorit) &&
        listEquality.equals(e1?.appliedGig, e2?.appliedGig);
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.musicGenre,
        e?.band,
        e?.instrumentsPlayed,
        e?.dateOfBirth,
        e?.deviceInfo,
        e?.aboutArtist,
        e?.skillsReward,
        e?.albums,
        e?.role,
        e?.songListen,
        e?.favorites,
        e?.favorit,
        e?.appliedGig
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
