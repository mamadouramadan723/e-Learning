import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _classe = prefs.getString('ff_classe') ?? _classe;
    });
    _safeInit(() {
      _cours = prefs.getString('ff_cours') ?? _cours;
    });
    _safeInit(() {
      _chapitre = prefs.getString('ff_chapitre') ?? _chapitre;
    });
    _safeInit(() {
      _lesson = prefs.getString('ff_lesson') ?? _lesson;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _classe = 'TSE';
  String get classe => _classe;
  set classe(String _value) {
    _classe = _value;
    prefs.setString('ff_classe', _value);
  }

  String _cours = 'Maths';
  String get cours => _cours;
  set cours(String _value) {
    _cours = _value;
    prefs.setString('ff_cours', _value);
  }

  String _chapitre = 'TSEMathsAlgebre';
  String get chapitre => _chapitre;
  set chapitre(String _value) {
    _chapitre = _value;
    prefs.setString('ff_chapitre', _value);
  }

  String _lesson = 'dummy';
  String get lesson => _lesson;
  set lesson(String _value) {
    _lesson = _value;
    prefs.setString('ff_lesson', _value);
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
