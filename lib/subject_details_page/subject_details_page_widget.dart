import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'subject_details_page_model.dart';
export 'subject_details_page_model.dart';

class SubjectDetailsPageWidget extends StatefulWidget {
  const SubjectDetailsPageWidget({
    Key? key,
    required this.subjectName,
    int? orderOfThelesson,
    int? orderOfTheChapter,
  })  : this.orderOfThelesson = orderOfThelesson ?? 1,
        this.orderOfTheChapter = orderOfTheChapter ?? 1,
        super(key: key);

  final String? subjectName;
  final int orderOfThelesson;
  final int orderOfTheChapter;

  @override
  _SubjectDetailsPageWidgetState createState() =>
      _SubjectDetailsPageWidgetState();
}

class _SubjectDetailsPageWidgetState extends State<SubjectDetailsPageWidget> {
  late SubjectDetailsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SubjectDetailsPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().chapter = 1;
        FFAppState().lesson = 1;
      });
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<LessonRecord>>(
      stream: queryLessonRecord(
        queryBuilder: (lessonRecord) => lessonRecord
            .where('classeId', isEqualTo: FFAppState().classe)
            .where('coursId', isEqualTo: FFAppState().cours)
            .where('orderOfTheChapter', isEqualTo: FFAppState().chapter)
            .where('orderOfTheLesson', isEqualTo: FFAppState().lesson),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<LessonRecord> subjectDetailsPageLessonRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final subjectDetailsPageLessonRecord =
            subjectDetailsPageLessonRecordList.isNotEmpty
                ? subjectDetailsPageLessonRecordList.first
                : null;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            drawer: Container(
              width: MediaQuery.sizeOf(context).width * 0.6,
              child: Drawer(
                elevation: 16.0,
                child: Visibility(
                  visible: responsiveVisibility(
                    context: context,
                    tablet: false,
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                    child: Container(
                      width: 270.0,
                      height: 900.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFF1F4F8),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 48.0, 8.0, 16.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${FFAppState().classe} - ${FFAppState().cours}',
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                                Divider(
                                  height: 12.0,
                                  thickness: 2.0,
                                  color: Color(0xFFE0E3E7),
                                ),
                                Text(
                                  'Chapitres',
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: StreamBuilder<List<ChapitreRecord>>(
                                    stream: queryChapitreRecord(
                                      queryBuilder: (chapitreRecord) =>
                                          chapitreRecord
                                              .where('classeId',
                                                  isEqualTo:
                                                      FFAppState().classe)
                                              .where('coursId',
                                                  isEqualTo: FFAppState().cours)
                                              .orderBy('order'),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<ChapitreRecord>
                                          listChapitresChapitreRecordList =
                                          snapshot.data!;
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            listChapitresChapitreRecordList
                                                .length,
                                        itemBuilder:
                                            (context, listChapitresIndex) {
                                          final listChapitresChapitreRecord =
                                              listChapitresChapitreRecordList[
                                                  listChapitresIndex];
                                          return Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: Container(
                                                width: double.infinity,
                                                color: Colors.white,
                                                child: ExpandableNotifier(
                                                  initialExpanded: true,
                                                  child: ExpandablePanel(
                                                    header: Text(
                                                      listChapitresChapitreRecord
                                                          .name,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .displaySmall
                                                          .override(
                                                            fontFamily:
                                                                'Outfit',
                                                            color: Colors.black,
                                                            fontSize: 16.0,
                                                          ),
                                                    ),
                                                    collapsed: Container(),
                                                    expanded: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child:
                                                          SingleChildScrollView(
                                                        primary: false,
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: StreamBuilder<
                                                                  List<
                                                                      LessonRecord>>(
                                                                stream:
                                                                    queryLessonRecord(
                                                                  queryBuilder: (lessonRecord) => lessonRecord
                                                                      .where(
                                                                          'classeId',
                                                                          isEqualTo: FFAppState()
                                                                              .classe)
                                                                      .where(
                                                                          'coursId',
                                                                          isEqualTo: FFAppState()
                                                                              .cours)
                                                                      .where(
                                                                          'orderOfTheChapter',
                                                                          isEqualTo: listChapitresChapitreRecord
                                                                              .order)
                                                                      .orderBy(
                                                                          'orderOfTheLesson'),
                                                                ),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        child:
                                                                            CircularProgressIndicator(
                                                                          valueColor:
                                                                              AlwaysStoppedAnimation<Color>(
                                                                            FlutterFlowTheme.of(context).primary,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<LessonRecord>
                                                                      listCoursParChapitreLessonRecordList =
                                                                      snapshot
                                                                          .data!;
                                                                  return ListView
                                                                      .builder(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    primary:
                                                                        false,
                                                                    shrinkWrap:
                                                                        true,
                                                                    scrollDirection:
                                                                        Axis.vertical,
                                                                    itemCount:
                                                                        listCoursParChapitreLessonRecordList
                                                                            .length,
                                                                    itemBuilder:
                                                                        (context,
                                                                            listCoursParChapitreIndex) {
                                                                      final listCoursParChapitreLessonRecord =
                                                                          listCoursParChapitreLessonRecordList[
                                                                              listCoursParChapitreIndex];
                                                                      return InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          setState(
                                                                              () {
                                                                            FFAppState().chapter =
                                                                                listCoursParChapitreLessonRecord.orderOfTheChapter;
                                                                            FFAppState().lesson =
                                                                                listCoursParChapitreLessonRecord.orderOfTheLesson;
                                                                          });
                                                                          ScaffoldMessenger.of(context)
                                                                              .showSnackBar(
                                                                            SnackBar(
                                                                              content: Text(
                                                                                'chapitre ${listCoursParChapitreLessonRecord.orderOfTheChapter.toString()} cours ${listCoursParChapitreLessonRecord.orderOfTheLesson.toString()}',
                                                                                style: TextStyle(
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                ),
                                                                              ),
                                                                              duration: Duration(milliseconds: 4000),
                                                                              backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                            ),
                                                                          );

                                                                          context
                                                                              .pushNamed(
                                                                            'SubjectDetailsPage',
                                                                            queryParameters:
                                                                                {
                                                                              'subjectName': serializeParam(
                                                                                '',
                                                                                ParamType.String,
                                                                              ),
                                                                            }.withoutNulls,
                                                                          );
                                                                        },
                                                                        child:
                                                                            ListTile(
                                                                          title:
                                                                              Text(
                                                                            listCoursParChapitreLessonRecord.title,
                                                                            style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                  fontFamily: 'Outfit',
                                                                                  fontSize: 16.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          ),
                                                                          trailing:
                                                                              Icon(
                                                                            Icons.arrow_forward_ios,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                20.0,
                                                                          ),
                                                                          tileColor:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          dense:
                                                                              false,
                                                                        ),
                                                                      );
                                                                    },
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    theme: ExpandableThemeData(
                                                      tapHeaderToExpand: true,
                                                      tapBodyToExpand: false,
                                                      tapBodyToCollapse: false,
                                                      headerAlignment:
                                                          ExpandablePanelHeaderAlignment
                                                              .center,
                                                      hasIcon: true,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                                Divider(
                                  height: 12.0,
                                  thickness: 2.0,
                                  color: Color(0xFFE0E3E7),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: FlutterFlowTheme.of(context).primary,
                borderRadius: 20.0,
                borderWidth: 1.0,
                buttonSize: 40.0,
                fillColor: FlutterFlowTheme.of(context).accent1,
                icon: Icon(
                  Icons.dehaze,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                onPressed: () async {
                  scaffoldKey.currentState!.openDrawer();
                },
              ),
              title: AutoSizeText(
                subjectDetailsPageLessonRecord!.title,
                textAlign: TextAlign.justify,
                style: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Readex Pro',
                      fontSize: 12.0,
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
                        padding:
                            EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                        child: StreamBuilder<List<LessonRecord>>(
                          stream: queryLessonRecord(
                            queryBuilder: (lessonRecord) => lessonRecord
                                .where('classeId',
                                    isEqualTo: FFAppState().classe)
                                .where('coursId', isEqualTo: FFAppState().cours)
                                .where('orderOfTheChapter',
                                    isEqualTo: widget.orderOfTheChapter)
                                .where('orderOfTheLesson',
                                    isEqualTo: widget.orderOfThelesson),
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
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<LessonRecord> htmlViewLessonLessonRecordList =
                                snapshot.data!;
                            // Return an empty Container when the item does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final htmlViewLessonLessonRecord =
                                htmlViewLessonLessonRecordList.isNotEmpty
                                    ? htmlViewLessonLessonRecordList.first
                                    : null;
                            return Html(
                              data: htmlViewLessonLessonRecord!.content,
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
      },
    );
  }
}
