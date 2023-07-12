import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'subject_details_page2_model.dart';
export 'subject_details_page2_model.dart';

class SubjectDetailsPage2Widget extends StatefulWidget {
  const SubjectDetailsPage2Widget({
    Key? key,
    required this.subjectName,
    required this.subjectId,
  }) : super(key: key);

  final String? subjectName;
  final String? subjectId;

  @override
  _SubjectDetailsPage2WidgetState createState() =>
      _SubjectDetailsPage2WidgetState();
}

class _SubjectDetailsPage2WidgetState extends State<SubjectDetailsPage2Widget> {
  late SubjectDetailsPage2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SubjectDetailsPage2Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            widget.subjectName!,
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                    child: StreamBuilder<List<DetailscoursRecord>>(
                      stream: queryDetailscoursRecord(
                        singleRecord: true,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                color: FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          );
                        }
                        List<DetailscoursRecord>
                            htmlViewDetailscoursRecordList = snapshot.data!;
                        // Return an empty Container when the item does not exist.
                        if (snapshot.data!.isEmpty) {
                          return Container();
                        }
                        final htmlViewDetailscoursRecord =
                            htmlViewDetailscoursRecordList.isNotEmpty
                                ? htmlViewDetailscoursRecordList.first
                                : null;
                        return Html(
                          data: htmlViewDetailscoursRecord!.content,
                          onLinkTap: (url, context, attributes, element) =>
                              launchURL(url!),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
