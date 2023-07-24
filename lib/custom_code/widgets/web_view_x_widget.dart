// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:webviewx_plus/webviewx_plus.dart';

class WebViewXWidget extends StatelessWidget {
  const WebViewXWidget({Key? key, this.width, this.height}) : super(key: key);

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: FFAppState().contentStream, // Listen to content changes
      initialData:
          FFAppState().content, // Set initial data to FFAppState().content
      builder: (context, snapshot) {
        final String content = snapshot.data ?? ''; // Get the latest content

        return WebViewX(
          width: width!,
          height: height!,
          initialContent: content, // Use the latest content
          initialSourceType: SourceType.html,
        );
      },
    );
  }
}
