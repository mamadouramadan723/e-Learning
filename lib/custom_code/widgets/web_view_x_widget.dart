// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:webviewx/webviewx.dart';

// Create a custom ValueNotifier
class ContentNotifier extends ValueNotifier<String> {
  ContentNotifier(String value) : super(value);

  void updateContent() {
    value = FFAppState().content;
  }
}

class WebViewXWidget extends StatefulWidget {
  const WebViewXWidget({Key? key, this.width, this.height}) : super(key: key);

  final double? width;
  final double? height;

  @override
  _WebViewXWidgetState createState() => _WebViewXWidgetState();
}

class _WebViewXWidgetState extends State<WebViewXWidget> {
  late ContentNotifier _contentNotifier;

  @override
  void initState() {
    super.initState();
    _contentNotifier = ContentNotifier(FFAppState().content);
    _contentNotifier.addListener(_contentNotifier.updateContent);
  }

  @override
  void dispose() {
    _contentNotifier.removeListener(_contentNotifier.updateContent);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: _contentNotifier,
      builder: (context, content, _) {
        return WebViewX(
          width: widget.width!,
          height: widget.height!,
          initialContent: content,
          initialSourceType: SourceType.html,
        );
      },
    );
  }
}
