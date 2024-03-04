// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserAnalyticsStruct extends FFFirebaseStruct {
  UserAnalyticsStruct({
    DateTime? time,
    DocumentReference? music,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _time = time,
        _music = music,
        super(firestoreUtilData);

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  set time(DateTime? val) => _time = val;
  bool hasTime() => _time != null;

  // "music" field.
  DocumentReference? _music;
  DocumentReference? get music => _music;
  set music(DocumentReference? val) => _music = val;
  bool hasMusic() => _music != null;

  static UserAnalyticsStruct fromMap(Map<String, dynamic> data) =>
      UserAnalyticsStruct(
        time: data['time'] as DateTime?,
        music: data['music'] as DocumentReference?,
      );

  static UserAnalyticsStruct? maybeFromMap(dynamic data) => data is Map
      ? UserAnalyticsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'time': _time,
        'music': _music,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => toMap();
  static UserAnalyticsStruct fromSerializableMap(Map<String, dynamic> data) =>
      fromMap(data);

  @override
  String toString() => 'UserAnalyticsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserAnalyticsStruct &&
        time == other.time &&
        music == other.music;
  }

  @override
  int get hashCode => const ListEquality().hash([time, music]);
}

UserAnalyticsStruct createUserAnalyticsStruct({
  DateTime? time,
  DocumentReference? music,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserAnalyticsStruct(
      time: time,
      music: music,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserAnalyticsStruct? updateUserAnalyticsStruct(
  UserAnalyticsStruct? userAnalytics, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userAnalytics
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserAnalyticsStructData(
  Map<String, dynamic> firestoreData,
  UserAnalyticsStruct? userAnalytics,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userAnalytics == null) {
    return;
  }
  if (userAnalytics.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userAnalytics.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userAnalyticsData =
      getUserAnalyticsFirestoreData(userAnalytics, forFieldValue);
  final nestedData =
      userAnalyticsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userAnalytics.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserAnalyticsFirestoreData(
  UserAnalyticsStruct? userAnalytics, [
  bool forFieldValue = false,
]) {
  if (userAnalytics == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userAnalytics.toMap());

  // Add any Firestore field values
  userAnalytics.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserAnalyticsListFirestoreData(
  List<UserAnalyticsStruct>? userAnalyticss,
) =>
    userAnalyticss
        ?.map((e) => getUserAnalyticsFirestoreData(e, true))
        .toList() ??
    [];
