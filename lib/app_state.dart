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

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  DocumentReference? _classe = FirebaseFirestore.instance.doc('/classe/TSE');
  DocumentReference? get classe => _classe;
  set classe(DocumentReference? _value) {
    _classe = _value;
  }

  DocumentReference? _cours = FirebaseFirestore.instance.doc('/cours/Anglais');
  DocumentReference? get cours => _cours;
  set cours(DocumentReference? _value) {
    _cours = _value;
  }

  DocumentReference? _chapitre = FirebaseFirestore.instance.doc('/chapitre/1');
  DocumentReference? get chapitre => _chapitre;
  set chapitre(DocumentReference? _value) {
    _chapitre = _value;
  }

  DocumentReference? _lesson = FirebaseFirestore.instance.doc('/lesson/1');
  DocumentReference? get lesson => _lesson;
  set lesson(DocumentReference? _value) {
    _lesson = _value;
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
