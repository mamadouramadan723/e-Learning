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
      _chapter = prefs.getInt('ff_chapter') ?? _chapter;
    });
    _safeInit(() {
      _lesson = prefs.getInt('ff_lesson') ?? _lesson;
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

  int _chapter = 1;
  int get chapter => _chapter;
  set chapter(int _value) {
    _chapter = _value;
    prefs.setInt('ff_chapter', _value);
  }

  int _lesson = 1;
  int get lesson => _lesson;
  set lesson(int _value) {
    _lesson = _value;
    prefs.setInt('ff_lesson', _value);
  }

  String _title = 'cours 1';
  String get title => _title;
  set title(String _value) {
    _title = _value;
  }

  String _content =
      '<p>test me<p><br><math xmlns=\"http://www.w3.org/1998/Math/MathML\"><mroot><mrow><msup><mi>x</mi><mn>2</mn></msup><mo>+</mo><mn>2</mn><mi>x</mi><mo>+</mo><mn>1</mn></mrow><mn>2</mn></mroot><mo>*</mo><mi>sin</mi><mfenced><mrow><msup><mn>30</mn><mo>&#x2218;</mo></msup></mrow></mfenced></math>';
  String get content => _content;
  set content(String _value) {
    _content = _value;
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
