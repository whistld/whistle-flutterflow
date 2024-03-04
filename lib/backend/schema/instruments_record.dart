import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InstrumentsRecord extends FirestoreRecord {
  InstrumentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Instruments_name" field.
  String? _instrumentsName;
  String get instrumentsName => _instrumentsName ?? '';
  bool hasInstrumentsName() => _instrumentsName != null;

  void _initializeFields() {
    _instrumentsName = snapshotData['Instruments_name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Instruments');

  static Stream<InstrumentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InstrumentsRecord.fromSnapshot(s));

  static Future<InstrumentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InstrumentsRecord.fromSnapshot(s));

  static InstrumentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InstrumentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InstrumentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InstrumentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InstrumentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InstrumentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInstrumentsRecordData({
  String? instrumentsName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Instruments_name': instrumentsName,
    }.withoutNulls,
  );

  return firestoreData;
}

class InstrumentsRecordDocumentEquality implements Equality<InstrumentsRecord> {
  const InstrumentsRecordDocumentEquality();

  @override
  bool equals(InstrumentsRecord? e1, InstrumentsRecord? e2) {
    return e1?.instrumentsName == e2?.instrumentsName;
  }

  @override
  int hash(InstrumentsRecord? e) =>
      const ListEquality().hash([e?.instrumentsName]);

  @override
  bool isValidKey(Object? o) => o is InstrumentsRecord;
}
