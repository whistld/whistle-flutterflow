import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VenuesRecord extends FirestoreRecord {
  VenuesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "address" field.
  AddressStruct? _address;
  AddressStruct get address => _address ?? AddressStruct();
  bool hasAddress() => _address != null;

  // "events" field.
  List<EventsStruct>? _events;
  List<EventsStruct> get events => _events ?? const [];
  bool hasEvents() => _events != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "EventReff" field.
  List<DocumentReference>? _eventReff;
  List<DocumentReference> get eventReff => _eventReff ?? const [];
  bool hasEventReff() => _eventReff != null;

  void _initializeFields() {
    _name = snapshotData['Name'] as String?;
    _address = AddressStruct.maybeFromMap(snapshotData['address']);
    _events = getStructList(
      snapshotData['events'],
      EventsStruct.fromMap,
    );
    _city = snapshotData['city'] as String?;
    _eventReff = getDataList(snapshotData['EventReff']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Venues');

  static Stream<VenuesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VenuesRecord.fromSnapshot(s));

  static Future<VenuesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VenuesRecord.fromSnapshot(s));

  static VenuesRecord fromSnapshot(DocumentSnapshot snapshot) => VenuesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VenuesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VenuesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VenuesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VenuesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVenuesRecordData({
  String? name,
  AddressStruct? address,
  String? city,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Name': name,
      'address': AddressStruct().toMap(),
      'city': city,
    }.withoutNulls,
  );

  // Handle nested data for "address" field.
  addAddressStructData(firestoreData, address, 'address');

  return firestoreData;
}

class VenuesRecordDocumentEquality implements Equality<VenuesRecord> {
  const VenuesRecordDocumentEquality();

  @override
  bool equals(VenuesRecord? e1, VenuesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.address == e2?.address &&
        listEquality.equals(e1?.events, e2?.events) &&
        e1?.city == e2?.city &&
        listEquality.equals(e1?.eventReff, e2?.eventReff);
  }

  @override
  int hash(VenuesRecord? e) => const ListEquality()
      .hash([e?.name, e?.address, e?.events, e?.city, e?.eventReff]);

  @override
  bool isValidKey(Object? o) => o is VenuesRecord;
}
