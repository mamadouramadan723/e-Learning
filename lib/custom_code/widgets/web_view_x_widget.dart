// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';

import 'package:webviewx/webviewx.dart';

class WebViewXWidget extends StatefulWidget {
  const WebViewXWidget({
    Key? key,
    this.width,
    this.height,
    this.content,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? content;

  @override
  _WebViewXWidgetState createState() => _WebViewXWidgetState();
}

class _WebViewXWidgetState extends State<WebViewXWidget> {
  late String _newContentValue;

  @override
  Widget build(BuildContext context) {
    return WebViewX(
        width: widget.width!,
        height: widget.height!,
        initialContent: _newContentValue ?? '',
        initialSourceType: SourceType.html);
  }

  @override
  void initState() {
    super.initState();
    _newContentValue = FFAppState().content;

    //
    // Subscribe to content changes and update the _newContentValue accordingly
    _contentSubscription = FFAppState().contentStream.listen((content) {
      setState(() {
        _newContentValue = content;
      });
    });
  }

  @override
  void dispose() {
    _contentSubscription
        ?.cancel(); // Cancel the subscription to avoid memory leaks
    super.dispose();
  }
}
