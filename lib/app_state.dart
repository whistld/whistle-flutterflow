import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _ListofCountryCodes =
          prefs.getStringList('ff_ListofCountryCodes') ?? _ListofCountryCodes;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<String> _listofsp = [
    'https://firebasestorage.googleapis.com/v0/b/whistl-d-app.appspot.com/o/cms_uploads%2FMusic%2F1681615411825000%2Fdownload.mp3?alt=media&token=a6694cbe-e38f-4c3a-b5aa-14b466c00645',
    'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
    'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3',
    'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-4.mp3'
  ];
  List<String> get listofsp => _listofsp;
  set listofsp(List<String> _value) {
    _listofsp = _value;
  }

  void addToListofsp(String _value) {
    _listofsp.add(_value);
  }

  void removeFromListofsp(String _value) {
    _listofsp.remove(_value);
  }

  void removeAtIndexFromListofsp(int _index) {
    _listofsp.removeAt(_index);
  }

  void updateListofspAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _listofsp[_index] = updateFn(_listofsp[_index]);
  }

  void insertAtIndexInListofsp(int _index, String _value) {
    _listofsp.insert(_index, _value);
  }

  int _mplayindex = 0;
  int get mplayindex => _mplayindex;
  set mplayindex(int _value) {
    _mplayindex = _value;
  }

  List<String> _title = ['Hello World', 'sd', 'sdff'];
  List<String> get title => _title;
  set title(List<String> _value) {
    _title = _value;
  }

  void addToTitle(String _value) {
    _title.add(_value);
  }

  void removeFromTitle(String _value) {
    _title.remove(_value);
  }

  void removeAtIndexFromTitle(int _index) {
    _title.removeAt(_index);
  }

  void updateTitleAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _title[_index] = updateFn(_title[_index]);
  }

  void insertAtIndexInTitle(int _index, String _value) {
    _title.insert(_index, _value);
  }

  List<String> _sdf = [
    'https://picsum.photos/seed/281/600',
    'https://picsum.photos/seed/25/600',
    'https://picsum.photos/seed/521/600'
  ];
  List<String> get sdf => _sdf;
  set sdf(List<String> _value) {
    _sdf = _value;
  }

  void addToSdf(String _value) {
    _sdf.add(_value);
  }

  void removeFromSdf(String _value) {
    _sdf.remove(_value);
  }

  void removeAtIndexFromSdf(int _index) {
    _sdf.removeAt(_index);
  }

  void updateSdfAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _sdf[_index] = updateFn(_sdf[_index]);
  }

  void insertAtIndexInSdf(int _index, String _value) {
    _sdf.insert(_index, _value);
  }

  String _ttTelephoneNumber = '';
  String get ttTelephoneNumber => _ttTelephoneNumber;
  set ttTelephoneNumber(String _value) {
    _ttTelephoneNumber = _value;
  }

  List<String> _ListofCountryCodes = ['91', '92'];
  List<String> get ListofCountryCodes => _ListofCountryCodes;
  set ListofCountryCodes(List<String> _value) {
    _ListofCountryCodes = _value;
    prefs.setStringList('ff_ListofCountryCodes', _value);
  }

  void addToListofCountryCodes(String _value) {
    _ListofCountryCodes.add(_value);
    prefs.setStringList('ff_ListofCountryCodes', _ListofCountryCodes);
  }

  void removeFromListofCountryCodes(String _value) {
    _ListofCountryCodes.remove(_value);
    prefs.setStringList('ff_ListofCountryCodes', _ListofCountryCodes);
  }

  void removeAtIndexFromListofCountryCodes(int _index) {
    _ListofCountryCodes.removeAt(_index);
    prefs.setStringList('ff_ListofCountryCodes', _ListofCountryCodes);
  }

  void updateListofCountryCodesAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _ListofCountryCodes[_index] = updateFn(_ListofCountryCodes[_index]);
    prefs.setStringList('ff_ListofCountryCodes', _ListofCountryCodes);
  }

  void insertAtIndexInListofCountryCodes(int _index, String _value) {
    _ListofCountryCodes.insert(_index, _value);
    prefs.setStringList('ff_ListofCountryCodes', _ListofCountryCodes);
  }

  bool _isfaavorit = true;
  bool get isfaavorit => _isfaavorit;
  set isfaavorit(bool _value) {
    _isfaavorit = _value;
  }

  final _ddManager = StreamRequestManager<List<MusicRecord>>();
  Stream<List<MusicRecord>> dd({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<MusicRecord>> Function() requestFn,
  }) =>
      _ddManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearDdCache() => _ddManager.clear();
  void clearDdCacheKey(String? uniqueKey) => _ddManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
