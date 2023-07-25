// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:webviewx/webviewx.dart';

class WebViewXWidget extends StatefulWidget {
  const WebViewXWidget({Key? key, this.width, this.height}) : super(key: key);

  final double? width;
  final double? height;

  @override
  _WebViewXWidgetState createState() => _WebViewXWidgetState();
}

class _WebViewXWidgetState extends State<WebViewXWidget> {
  final ValueNotifier<String> _contentNotifier =
      ValueNotifier(FFAppState().content);

  @override
  void initState() {
    super.initState();
    _contentNotifier.addListener(_updateContent);
  }

  @override
  void dispose() {
    _contentNotifier.removeListener(_updateContent);
    super.dispose();
  }

  void _updateContent() {
    _contentNotifier.value = FFAppState().content;
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
