// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventsStruct extends FFFirebaseStruct {
  EventsStruct({
    String? eventName,
    DateTime? startDate,
    DateTime? endDate,
    String? type,
    String? description,
    List<String>? ageLimit,
    String? purchaseLink,
    int? price,
    String? eventCover,
    int? phone,
    String? email,
    EventsStruct? reff,
    List<DocumentReference>? users,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _eventName = eventName,
        _startDate = startDate,
        _endDate = endDate,
        _type = type,
        _description = description,
        _ageLimit = ageLimit,
        _purchaseLink = purchaseLink,
        _price = price,
        _eventCover = eventCover,
        _phone = phone,
        _email = email,
        _reff = reff,
        _users = users,
        super(firestoreUtilData);

  // "event_name" field.
  String? _eventName;
  String get eventName => _eventName ?? '';
  set eventName(String? val) => _eventName = val;
  bool hasEventName() => _eventName != null;

  // "start_date" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  set startDate(DateTime? val) => _startDate = val;
  bool hasStartDate() => _startDate != null;

  // "end_date" field.
  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  set endDate(DateTime? val) => _endDate = val;
  bool hasEndDate() => _endDate != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;
  bool hasType() => _type != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;
  bool hasDescription() => _description != null;

  // "age_limit" field.
  List<String>? _ageLimit;
  List<String> get ageLimit => _ageLimit ?? const [];
  set ageLimit(List<String>? val) => _ageLimit = val;
  void updateAgeLimit(Function(List<String>) updateFn) =>
      updateFn(_ageLimit ??= []);
  bool hasAgeLimit() => _ageLimit != null;

  // "purchase_link" field.
  String? _purchaseLink;
  String get purchaseLink => _purchaseLink ?? '';
  set purchaseLink(String? val) => _purchaseLink = val;
  bool hasPurchaseLink() => _purchaseLink != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  set price(int? val) => _price = val;
  void incrementPrice(int amount) => _price = price + amount;
  bool hasPrice() => _price != null;

  // "eventCover" field.
  String? _eventCover;
  String get eventCover => _eventCover ?? '';
  set eventCover(String? val) => _eventCover = val;
  bool hasEventCover() => _eventCover != null;

  // "phone" field.
  int? _phone;
  int get phone => _phone ?? 0;
  set phone(int? val) => _phone = val;
  void incrementPhone(int amount) => _phone = phone + amount;
  bool hasPhone() => _phone != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;
  bool hasEmail() => _email != null;

  // "reff" field.
  EventsStruct? _reff;
  EventsStruct get reff => _reff ?? EventsStruct();
  set reff(EventsStruct? val) => _reff = val;
  void updateReff(Function(EventsStruct) updateFn) =>
      updateFn(_reff ??= EventsStruct());
  bool hasReff() => _reff != null;

  // "users" field.
  List<DocumentReference>? _users;
  List<DocumentReference> get users => _users ?? const [];
  set users(List<DocumentReference>? val) => _users = val;
  void updateUsers(Function(List<DocumentReference>) updateFn) =>
      updateFn(_users ??= []);
  bool hasUsers() => _users != null;

  static EventsStruct fromMap(Map<String, dynamic> data) => EventsStruct(
        eventName: data['event_name'] as String?,
        startDate: data['start_date'] as DateTime?,
        endDate: data['end_date'] as DateTime?,
        type: data['type'] as String?,
        description: data['description'] as String?,
        ageLimit: getDataList(data['age_limit']),
        purchaseLink: data['purchase_link'] as String?,
        price: castToType<int>(data['price']),
        eventCover: data['eventCover'] as String?,
        phone: castToType<int>(data['phone']),
        email: data['email'] as String?,
        reff: EventsStruct.maybeFromMap(data['reff']),
        users: getDataList(data['users']),
      );

  static EventsStruct? maybeFromMap(dynamic data) =>
      data is Map ? EventsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'event_name': _eventName,
        'start_date': _startDate,
        'end_date': _endDate,
        'type': _type,
        'description': _description,
        'age_limit': _ageLimit,
        'purchase_link': _purchaseLink,
        'price': _price,
        'eventCover': _eventCover,
        'phone': _phone,
        'email': _email,
        'reff': _reff?.toMap(),
        'users': _users,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => toMap();
  static EventsStruct fromSerializableMap(Map<String, dynamic> data) =>
      fromMap(data);

  @override
  String toString() => 'EventsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is EventsStruct &&
        eventName == other.eventName &&
        startDate == other.startDate &&
        endDate == other.endDate &&
        type == other.type &&
        description == other.description &&
        listEquality.equals(ageLimit, other.ageLimit) &&
        purchaseLink == other.purchaseLink &&
        price == other.price &&
        eventCover == other.eventCover &&
        phone == other.phone &&
        email == other.email &&
        reff == other.reff &&
        listEquality.equals(users, other.users);
  }

  @override
  int get hashCode => const ListEquality().hash([
        eventName,
        startDate,
        endDate,
        type,
        description,
        ageLimit,
        purchaseLink,
        price,
        eventCover,
        phone,
        email,
        reff,
        users
      ]);
}

EventsStruct createEventsStruct({
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
  EventsStruct? reff,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    EventsStruct(
      eventName: eventName,
      startDate: startDate,
      endDate: endDate,
      type: type,
      description: description,
      purchaseLink: purchaseLink,
      price: price,
      eventCover: eventCover,
      phone: phone,
      email: email,
      reff: reff ?? (clearUnsetFields ? EventsStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

EventsStruct? updateEventsStruct(
  EventsStruct? events, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    events
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addEventsStructData(
  Map<String, dynamic> firestoreData,
  EventsStruct? events,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (events == null) {
    return;
  }
  if (events.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && events.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final eventsData = getEventsFirestoreData(events, forFieldValue);
  final nestedData = eventsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = events.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getEventsFirestoreData(
  EventsStruct? events, [
  bool forFieldValue = false,
]) {
  if (events == null) {
    return {};
  }
  final firestoreData = mapToFirestore(events.toMap());

  // Handle nested data for "reff" field.
  addEventsStructData(
    firestoreData,
    events.hasReff() ? events.reff : null,
    'reff',
    forFieldValue,
  );

  // Add any Firestore field values
  events.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getEventsListFirestoreData(
  List<EventsStruct>? eventss,
) =>
    eventss?.map((e) => getEventsFirestoreData(e, true)).toList() ?? [];
