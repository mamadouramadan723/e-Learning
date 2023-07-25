import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'subject_details_page_model.dart';
export 'subject_details_page_model.dart';

class SubjectDetailsPageWidget extends StatefulWidget {
  const SubjectDetailsPageWidget({
    Key? key,
    this.title,
  }) : super(key: key);

  final String? title;

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
        FFAppState().title = 'Pas de Leçon pour ce Cours de cette Classe';
        FFAppState().content = ' ';
      });
      _model.myNewLesson = await queryLessonRecordOnce(
        queryBuilder: (lessonRecord) => lessonRecord
            .where('classeId', isEqualTo: FFAppState().classe)
            .where('coursId', isEqualTo: FFAppState().cours)
            .where('orderOfTheChapter', isEqualTo: FFAppState().chapter)
            .where('orderOfTheLesson', isEqualTo: FFAppState().lesson),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      setState(() {
        FFAppState().title = valueOrDefault<String>(
          _model.myNewLesson?.title,
          'Pas de Leçon pour ce Cours de cette Classe',
        );
        FFAppState().content = _model.myNewLesson!.content;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'content : ${FFAppState().content}',
            style: TextStyle(
              color: FlutterFlowTheme.of(context).primaryText,
            ),
          ),
          duration: Duration(milliseconds: 4000),
          backgroundColor: FlutterFlowTheme.of(context).secondary,
        ),
      );
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 48.0, 8.0, 16.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: Text(
                                '${FFAppState().classe} - ${FFAppState().cours}',
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                            Divider(
                              height: 12.0,
                              thickness: 2.0,
                              color: Color(0xFFE0E3E7),
                            ),
                            Text(
                              'Chapitres',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: PagedListView<DocumentSnapshot<Object?>?,
                                  ChapitreRecord>(
                                pagingController:
                                    _model.setListChapitresController(
                                  ChapitreRecord.collection
                                      .where('classeId',
                                          isEqualTo: FFAppState().classe != ''
                                              ? FFAppState().classe
                                              : null)
                                      .where('coursId',
                                          isEqualTo: FFAppState().cours != ''
                                              ? FFAppState().cours
                                              : null)
                                      .orderBy('order'),
                                ),
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                reverse: false,
                                scrollDirection: Axis.vertical,
                                builderDelegate:
                                    PagedChildBuilderDelegate<ChapitreRecord>(
                                  // Customize what your widget looks like when it's loading the first page.
                                  firstPageProgressIndicatorBuilder: (_) =>
                                      Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Customize what your widget looks like when it's loading another page.
                                  newPageProgressIndicatorBuilder: (_) =>
                                      Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  ),

                                  itemBuilder:
                                      (context, _, listChapitresIndex) {
                                    final listChapitresChapitreRecord = _model
                                        .listChapitresPagingController!
                                        .itemList![listChapitresIndex];
                                    return Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
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
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .displaySmall
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: Colors.black,
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                              collapsed: Container(),
                                              expanded: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: SingleChildScrollView(
                                                  primary: false,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: FutureBuilder<
                                                            List<LessonRecord>>(
                                                          future:
                                                              queryLessonRecordOnce(
                                                            queryBuilder: (lessonRecord) => lessonRecord
                                                                .where(
                                                                    'classeId',
                                                                    isEqualTo: FFAppState().classe !=
                                                                            ''
                                                                        ? FFAppState()
                                                                            .classe
                                                                        : null)
                                                                .where(
                                                                    'coursId',
                                                                    isEqualTo: FFAppState().cours !=
                                                                            ''
                                                                        ? FFAppState()
                                                                            .cours
                                                                        : null)
                                                                .where(
                                                                    'orderOfTheChapter',
                                                                    isEqualTo:
                                                                        listChapitresChapitreRecord
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
                                                                child: SizedBox(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    valueColor:
                                                                        AlwaysStoppedAnimation<
                                                                            Color>(
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<LessonRecord>
                                                                listCoursParChapitreLessonRecordList =
                                                                snapshot.data!;
                                                            return ListView
                                                                .builder(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              primary: false,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  listCoursParChapitreLessonRecordList
                                                                      .length,
                                                              itemBuilder: (context,
                                                                  listCoursParChapitreIndex) {
                                                                final listCoursParChapitreLessonRecord =
                                                                    listCoursParChapitreLessonRecordList[
                                                                        listCoursParChapitreIndex];
                                                                return InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    setState(
                                                                        () {
                                                                      FFAppState()
                                                                              .chapter =
                                                                          listCoursParChapitreLessonRecord
                                                                              .orderOfTheChapter;
                                                                      FFAppState()
                                                                              .lesson =
                                                                          listCoursParChapitreLessonRecord
                                                                              .orderOfTheLesson;
                                                                    });
                                                                    _model.mySelectedLesson =
                                                                        await queryLessonRecordOnce(
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
                                                                              isEqualTo: FFAppState()
                                                                                  .chapter)
                                                                          .where(
                                                                              'orderOfTheLesson',
                                                                              isEqualTo: FFAppState().lesson),
                                                                      singleRecord:
                                                                          true,
                                                                    ).then((s) =>
                                                                            s.firstOrNull);
                                                                    setState(
                                                                        () {
                                                                      FFAppState()
                                                                              .title =
                                                                          valueOrDefault<
                                                                              String>(
                                                                        _model
                                                                            .mySelectedLesson
                                                                            ?.title,
                                                                        'Aucune Leçon pour ce Cours de cette Classe',
                                                                      );
                                                                      FFAppState()
                                                                              .content =
                                                                          _model
                                                                              .mySelectedLesson!
                                                                              .content;
                                                                    });
                                                                    Navigator.pop(
                                                                        context);

                                                                    setState(
                                                                        () {});
                                                                  },
                                                                  child:
                                                                      ListTile(
                                                                    title: Text(
                                                                      listCoursParChapitreLessonRecord
                                                                          .title,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                'Outfit',
                                                                            fontSize:
                                                                                12.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                    trailing:
                                                                        Icon(
                                                                      Icons
                                                                          .arrow_forward_ios,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size:
                                                                          20.0,
                                                                    ),
                                                                    tileColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
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
                                ),
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
            FFAppState().title,
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
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  child: custom_widgets.WebViewXWidget(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 1.0,
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
