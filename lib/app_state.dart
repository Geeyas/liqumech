import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    _MyUserToken =
        await secureStorage.getString('ff_MyUserToken') ?? _MyUserToken;
    _MyThingName =
        await secureStorage.getString('ff_MyThingName') ?? _MyThingName;
    _MyThingID = await secureStorage.getString('ff_MyThingID') ?? _MyThingID;
    _MyWidgetName =
        await secureStorage.getString('ff_MyWidgetName') ?? _MyWidgetName;
    _MyWidgetID = await secureStorage.getString('ff_MyWidgetID') ?? _MyWidgetID;
    _MyWidgetOldValue = await secureStorage.getString('ff_MyWidgetOldValue') ??
        _MyWidgetOldValue;
    _MyWidgetType =
        await secureStorage.getString('ff_MyWidgetType') ?? _MyWidgetType;
    _MyWidgetStatus =
        await secureStorage.getBool('ff_MyWidgetStatus') ?? _MyWidgetStatus;
    _MyWidgetNewValue =
        await secureStorage.getInt('ff_MyWidgetNewValue') ?? _MyWidgetNewValue;
    _MyClientID = await secureStorage.getString('ff_MyClientID') ?? _MyClientID;
    _MyClientSecret =
        await secureStorage.getString('ff_MyClientSecret') ?? _MyClientSecret;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _MyUserToken = '';
  String get MyUserToken => _MyUserToken;
  set MyUserToken(String _value) {
    _MyUserToken = _value;
    secureStorage.setString('ff_MyUserToken', _value);
  }

  void deleteMyUserToken() {
    secureStorage.delete(key: 'ff_MyUserToken');
  }

  String _MyThingName = '';
  String get MyThingName => _MyThingName;
  set MyThingName(String _value) {
    _MyThingName = _value;
    secureStorage.setString('ff_MyThingName', _value);
  }

  void deleteMyThingName() {
    secureStorage.delete(key: 'ff_MyThingName');
  }

  String _MyThingID = '';
  String get MyThingID => _MyThingID;
  set MyThingID(String _value) {
    _MyThingID = _value;
    secureStorage.setString('ff_MyThingID', _value);
  }

  void deleteMyThingID() {
    secureStorage.delete(key: 'ff_MyThingID');
  }

  String _MyWidgetName = '';
  String get MyWidgetName => _MyWidgetName;
  set MyWidgetName(String _value) {
    _MyWidgetName = _value;
    secureStorage.setString('ff_MyWidgetName', _value);
  }

  void deleteMyWidgetName() {
    secureStorage.delete(key: 'ff_MyWidgetName');
  }

  String _MyWidgetID = '';
  String get MyWidgetID => _MyWidgetID;
  set MyWidgetID(String _value) {
    _MyWidgetID = _value;
    secureStorage.setString('ff_MyWidgetID', _value);
  }

  void deleteMyWidgetID() {
    secureStorage.delete(key: 'ff_MyWidgetID');
  }

  String _MyWidgetOldValue = '';
  String get MyWidgetOldValue => _MyWidgetOldValue;
  set MyWidgetOldValue(String _value) {
    _MyWidgetOldValue = _value;
    secureStorage.setString('ff_MyWidgetOldValue', _value);
  }

  void deleteMyWidgetOldValue() {
    secureStorage.delete(key: 'ff_MyWidgetOldValue');
  }

  String _MyWidgetType = '';
  String get MyWidgetType => _MyWidgetType;
  set MyWidgetType(String _value) {
    _MyWidgetType = _value;
    secureStorage.setString('ff_MyWidgetType', _value);
  }

  void deleteMyWidgetType() {
    secureStorage.delete(key: 'ff_MyWidgetType');
  }

  bool _MyWidgetStatus = false;
  bool get MyWidgetStatus => _MyWidgetStatus;
  set MyWidgetStatus(bool _value) {
    _MyWidgetStatus = _value;
    secureStorage.setBool('ff_MyWidgetStatus', _value);
  }

  void deleteMyWidgetStatus() {
    secureStorage.delete(key: 'ff_MyWidgetStatus');
  }

  int _MyWidgetNewValue = 0;
  int get MyWidgetNewValue => _MyWidgetNewValue;
  set MyWidgetNewValue(int _value) {
    _MyWidgetNewValue = _value;
    secureStorage.setInt('ff_MyWidgetNewValue', _value);
  }

  void deleteMyWidgetNewValue() {
    secureStorage.delete(key: 'ff_MyWidgetNewValue');
  }

  String _MyClientID = '';
  String get MyClientID => _MyClientID;
  set MyClientID(String _value) {
    _MyClientID = _value;
    secureStorage.setString('ff_MyClientID', _value);
  }

  void deleteMyClientID() {
    secureStorage.delete(key: 'ff_MyClientID');
  }

  String _MyClientSecret = '';
  String get MyClientSecret => _MyClientSecret;
  set MyClientSecret(String _value) {
    _MyClientSecret = _value;
    secureStorage.setString('ff_MyClientSecret', _value);
  }

  void deleteMyClientSecret() {
    secureStorage.delete(key: 'ff_MyClientSecret');
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await write(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await write(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await write(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await write(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await write(key: key, value: ListToCsvConverter().convert([value]));
}
