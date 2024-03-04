// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SkillsandRewardStruct extends FFFirebaseStruct {
  SkillsandRewardStruct({
    String? readyForColab,
    bool? newsletter,
    String? pricePerShow,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _readyForColab = readyForColab,
        _newsletter = newsletter,
        _pricePerShow = pricePerShow,
        super(firestoreUtilData);

  // "ready_for_colab" field.
  String? _readyForColab;
  String get readyForColab => _readyForColab ?? '';
  set readyForColab(String? val) => _readyForColab = val;
  bool hasReadyForColab() => _readyForColab != null;

  // "newsletter" field.
  bool? _newsletter;
  bool get newsletter => _newsletter ?? false;
  set newsletter(bool? val) => _newsletter = val;
  bool hasNewsletter() => _newsletter != null;

  // "price_per_show" field.
  String? _pricePerShow;
  String get pricePerShow => _pricePerShow ?? '';
  set pricePerShow(String? val) => _pricePerShow = val;
  bool hasPricePerShow() => _pricePerShow != null;

  static SkillsandRewardStruct fromMap(Map<String, dynamic> data) =>
      SkillsandRewardStruct(
        readyForColab: data['ready_for_colab'] as String?,
        newsletter: data['newsletter'] as bool?,
        pricePerShow: data['price_per_show'] as String?,
      );

  static SkillsandRewardStruct? maybeFromMap(dynamic data) => data is Map
      ? SkillsandRewardStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'ready_for_colab': _readyForColab,
        'newsletter': _newsletter,
        'price_per_show': _pricePerShow,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => toMap();
  static SkillsandRewardStruct fromSerializableMap(Map<String, dynamic> data) =>
      fromMap(data);

  @override
  String toString() => 'SkillsandRewardStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SkillsandRewardStruct &&
        readyForColab == other.readyForColab &&
        newsletter == other.newsletter &&
        pricePerShow == other.pricePerShow;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([readyForColab, newsletter, pricePerShow]);
}

SkillsandRewardStruct createSkillsandRewardStruct({
  String? readyForColab,
  bool? newsletter,
  String? pricePerShow,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SkillsandRewardStruct(
      readyForColab: readyForColab,
      newsletter: newsletter,
      pricePerShow: pricePerShow,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SkillsandRewardStruct? updateSkillsandRewardStruct(
  SkillsandRewardStruct? skillsandReward, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    skillsandReward
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSkillsandRewardStructData(
  Map<String, dynamic> firestoreData,
  SkillsandRewardStruct? skillsandReward,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (skillsandReward == null) {
    return;
  }
  if (skillsandReward.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && skillsandReward.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final skillsandRewardData =
      getSkillsandRewardFirestoreData(skillsandReward, forFieldValue);
  final nestedData =
      skillsandRewardData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = skillsandReward.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSkillsandRewardFirestoreData(
  SkillsandRewardStruct? skillsandReward, [
  bool forFieldValue = false,
]) {
  if (skillsandReward == null) {
    return {};
  }
  final firestoreData = mapToFirestore(skillsandReward.toMap());

  // Add any Firestore field values
  skillsandReward.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSkillsandRewardListFirestoreData(
  List<SkillsandRewardStruct>? skillsandRewards,
) =>
    skillsandRewards
        ?.map((e) => getSkillsandRewardFirestoreData(e, true))
        .toList() ??
    [];
