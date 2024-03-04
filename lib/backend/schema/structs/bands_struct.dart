// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BandsStruct extends FFFirebaseStruct {
  BandsStruct({
    String? bandName,
    String? coverImage,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _bandName = bandName,
        _coverImage = coverImage,
        super(firestoreUtilData);

  // "band_name" field.
  String? _bandName;
  String get bandName => _bandName ?? '';
  set bandName(String? val) => _bandName = val;
  bool hasBandName() => _bandName != null;

  // "cover_image" field.
  String? _coverImage;
  String get coverImage => _coverImage ?? '';
  set coverImage(String? val) => _coverImage = val;
  bool hasCoverImage() => _coverImage != null;

  static BandsStruct fromMap(Map<String, dynamic> data) => BandsStruct(
        bandName: data['band_name'] as String?,
        coverImage: data['cover_image'] as String?,
      );

  static BandsStruct? maybeFromMap(dynamic data) =>
      data is Map ? BandsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'band_name': _bandName,
        'cover_image': _coverImage,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => toMap();
  static BandsStruct fromSerializableMap(Map<String, dynamic> data) =>
      fromMap(data);

  @override
  String toString() => 'BandsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BandsStruct &&
        bandName == other.bandName &&
        coverImage == other.coverImage;
  }

  @override
  int get hashCode => const ListEquality().hash([bandName, coverImage]);
}

BandsStruct createBandsStruct({
  String? bandName,
  String? coverImage,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BandsStruct(
      bandName: bandName,
      coverImage: coverImage,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BandsStruct? updateBandsStruct(
  BandsStruct? bands, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    bands
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBandsStructData(
  Map<String, dynamic> firestoreData,
  BandsStruct? bands,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (bands == null) {
    return;
  }
  if (bands.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && bands.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final bandsData = getBandsFirestoreData(bands, forFieldValue);
  final nestedData = bandsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = bands.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBandsFirestoreData(
  BandsStruct? bands, [
  bool forFieldValue = false,
]) {
  if (bands == null) {
    return {};
  }
  final firestoreData = mapToFirestore(bands.toMap());

  // Add any Firestore field values
  bands.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBandsListFirestoreData(
  List<BandsStruct>? bandss,
) =>
    bandss?.map((e) => getBandsFirestoreData(e, true)).toList() ?? [];
