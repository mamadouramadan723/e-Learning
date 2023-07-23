// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/custom_code/widgets/index.dart';
import '/flutter_flow/custom_functions.dart';
import 'package:webviewx/webviewx.dart';

class MyHtmlView extends StatelessWidget {
  const MyHtmlView({Key? key, this.width, this.height}) : super(key: key);

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return WebViewX(
        width: width!,
        height: height!,
        initialContent: FFAppState().content ?? '',
        initialSourceType: SourceType.HTML);
  }
}
