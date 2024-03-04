import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventsRecord extends FirestoreRecord {
  EventsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "event_name" field.
  String? _eventName;
  String get eventName => _eventName ?? '';
  bool hasEventName() => _eventName != null;

  // "start_date" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  bool hasStartDate() => _startDate != null;

  // "end_date" field.
  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  bool hasEndDate() => _endDate != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "age_limit" field.
  List<String>? _ageLimit;
  List<String> get ageLimit => _ageLimit ?? const [];
  bool hasAgeLimit() => _ageLimit != null;

  // "purchase_link" field.
  String? _purchaseLink;
  String get purchaseLink => _purchaseLink ?? '';
  bool hasPurchaseLink() => _purchaseLink != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  bool hasPrice() => _price != null;

  // "eventCover" field.
  String? _eventCover;
  String get eventCover => _eventCover ?? '';
  bool hasEventCover() => _eventCover != null;

  // "phone" field.
  int? _phone;
  int get phone => _phone ?? 0;
  bool hasPhone() => _phone != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "selfreff" field.
  DocumentReference? _selfreff;
  DocumentReference? get selfreff => _selfreff;
  bool hasSelfreff() => _selfreff != null;

  // "userReff" field.
  List<DocumentReference>? _userReff;
  List<DocumentReference> get userReff => _userReff ?? const [];
  bool hasUserReff() => _userReff != null;

  // "Venue" field.
  DocumentReference? _venue;
  DocumentReference? get venue => _venue;
  bool hasVenue() => _venue != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  void _initializeFields() {
    _eventName = snapshotData['event_name'] as String?;
    _startDate = snapshotData['start_date'] as DateTime?;
    _endDate = snapshotData['end_date'] as DateTime?;
    _type = snapshotData['type'] as String?;
    _description = snapshotData['description'] as String?;
    _ageLimit = getDataList(snapshotData['age_limit']);
    _purchaseLink = snapshotData['purchase_link'] as String?;
    _price = castToType<int>(snapshotData['price']);
    _eventCover = snapshotData['eventCover'] as String?;
    _phone = castToType<int>(snapshotData['phone']);
    _email = snapshotData['email'] as String?;
    _selfreff = snapshotData['selfreff'] as DocumentReference?;
    _userReff = getDataList(snapshotData['userReff']);
    _venue = snapshotData['Venue'] as DocumentReference?;
    _city = snapshotData['city'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('events');

  static Stream<EventsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventsRecord.fromSnapshot(s));

  static Future<EventsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventsRecord.fromSnapshot(s));

  static EventsRecord fromSnapshot(DocumentSnapshot snapshot) => EventsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventsRecordData({
  String? eventName,
  DateTime? startDate,
  DateTime? endDate,
  String? type,
  String? description,
  String? purchaseLink,
  int? price,
  String? eventCover,
  int? phone,
  String? email,
  DocumentReference? selfreff,
  DocumentReference? venue,
  String? city,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'event_name': eventName,
      'start_date': startDate,
      'end_date': endDate,
      'type': type,
      'description': description,
      'purchase_link': purchaseLink,
      'price': price,
      'eventCover': eventCover,
      'phone': phone,
      'email': email,
      'selfreff': selfreff,
      'Venue': venue,
      'city': city,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventsRecordDocumentEquality implements Equality<EventsRecord> {
  const EventsRecordDocumentEquality();

  @override
  bool equals(EventsRecord? e1, EventsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.eventName == e2?.eventName &&
        e1?.startDate == e2?.startDate &&
        e1?.endDate == e2?.endDate &&
        e1?.type == e2?.type &&
        e1?.description == e2?.description &&
        listEquality.equals(e1?.ageLimit, e2?.ageLimit) &&
        e1?.purchaseLink == e2?.purchaseLink &&
        e1?.price == e2?.price &&
        e1?.eventCover == e2?.eventCover &&
        e1?.phone == e2?.phone &&
        e1?.email == e2?.email &&
        e1?.selfreff == e2?.selfreff &&
        listEquality.equals(e1?.userReff, e2?.userReff) &&
        e1?.venue == e2?.venue &&
        e1?.city == e2?.city;
  }

  @override
  int hash(EventsRecord? e) => const ListEquality().hash([
        e?.eventName,
        e?.startDate,
        e?.endDate,
        e?.type,
        e?.description,
        e?.ageLimit,
        e?.purchaseLink,
        e?.price,
        e?.eventCover,
        e?.phone,
        e?.email,
        e?.selfreff,
        e?.userReff,
        e?.venue,
        e?.city
      ]);

  @override
  bool isValidKey(Object? o) => o is EventsRecord;
}
