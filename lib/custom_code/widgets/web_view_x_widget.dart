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
  // Create a stream controller to listen to changes in FFAppState().content
  final StreamController<String> _contentStreamController =
      StreamController<String>();

  @override
  void initState() {
    super.initState();
    // Listen to changes in FFAppState().content and add them to the stream
    FFAppState().addListener(_onContentChanged);
  }

  @override
  void dispose() {
    // Don't forget to dispose of the stream controller and remove the listener
    _contentStreamController.close();
    FFAppState().removeListener(_onContentChanged);
    super.dispose();
  }

  void _onContentChanged() {
    // When content changes, add the new value to the stream
    _contentStreamController.add(FFAppState().content);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: _contentStreamController.stream,
      initialData: FFAppState().content, // Set initial data
      builder: (context, snapshot) {
        // Use snapshot.data, which contains the latest value from the stream
        return WebViewX(
          width: widget.width!,
          height: widget.height!,
          initialContent: snapshot.data!,
          initialSourceType: SourceType.html,
        );
      },
    );
  }
}
