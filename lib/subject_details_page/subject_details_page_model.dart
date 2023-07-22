import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class SubjectDetailsPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in SubjectDetailsPage widget.
  LessonRecord? myLesson;
  // State field(s) for ListChapitres widget.

  PagingController<DocumentSnapshot?, ChapitreRecord>?
      listChapitresPagingController;
  Query? listChapitresPagingQuery;
  List<StreamSubscription?> listChapitresStreamSubscriptions = [];

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    listChapitresStreamSubscriptions.forEach((s) => s?.cancel());
    listChapitresPagingController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  PagingController<DocumentSnapshot?, ChapitreRecord>
      setListChapitresController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listChapitresPagingController ??=
        _createListChapitresController(query, parent);
    if (listChapitresPagingQuery != query) {
      listChapitresPagingQuery = query;
      listChapitresPagingController?.refresh();
    }
    return listChapitresPagingController!;
  }

  PagingController<DocumentSnapshot?, ChapitreRecord>
      _createListChapitresController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, ChapitreRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryChapitreRecordPage(
          queryBuilder: (_) => listChapitresPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listChapitresStreamSubscriptions,
          controller: controller,
          pageSize: 7,
          isStream: true,
        ),
      );
  }
}
