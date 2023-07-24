// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/foundation.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class WebViewXWidget extends StatefulWidget {
  const WebViewXWidget({Key? key, this.width, this.height, this.content})
      : super(key: key);

  final double? width;
  final double? height;
  final String? content;

  @override
  _WebViewXWidgetState createState() => _WebViewXWidgetState();
}

class _WebViewXWidgetState extends State<WebViewXWidget> {
  String? _currentContent;

  @override
  void initState() {
    super.initState();
    _currentContent = widget.content;
  }

  @override
  void didUpdateWidget(WebViewXWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.content != _currentContent) {
      setState(() {
        _currentContent = widget.content;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WebViewX(
      width: widget.width!,
      height: widget.height!,
      initialContent: _currentContent,
      initialSourceType: SourceType.html,
    );
  }
}
