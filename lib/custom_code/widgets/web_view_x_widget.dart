// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:webviewx_plus/webviewx_plus.dart';

class MyHtmlView extends StatelessWidget {
  const MyHtmlView({Key? key, this.width, this.height, this.html})
      : super(key: key);

  final double? width;
  final double? height;
  final String? html;

  @override
  Widget build(BuildContext context) {
    return WebViewX(
        width: width!,
        height: height!,
        initialContent: html ?? FFAppState().content,
        initialSourceType: SourceType.html);
  }
}
