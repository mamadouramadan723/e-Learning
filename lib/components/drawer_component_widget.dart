import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'drawer_component_model.dart';
export 'drawer_component_model.dart';

class DrawerComponentWidget extends StatefulWidget {
  const DrawerComponentWidget({Key? key}) : super(key: key);

  @override
  _DrawerComponentWidgetState createState() => _DrawerComponentWidgetState();
}

class _DrawerComponentWidgetState extends State<DrawerComponentWidget> {
  late DrawerComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DrawerComponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, -1.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(2.0, 24.0, 2.0, 8.0),
        child: SingleChildScrollView(
          primary: false,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'e-Learning',
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'Outfit',
                                color: Color(0xFF101213),
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 12.0,
                thickness: 2.0,
                color: Color(0xFFE0E3E7),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                child: Text(
                  'My Dashboard',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Outfit',
                        color: Color(0xFF101213),
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 40.0,
                decoration: BoxDecoration(
                  color: Color(0xFFF1F4F8),
                  borderRadius: BorderRadius.circular(12.0),
                  shape: BoxShape.rectangle,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.inbox_rounded,
                            color: Color(0xFF4B39EF),
                            size: 20.0,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Mes Cours',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF4B39EF),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 40.0,
                decoration: BoxDecoration(
                  color: Color(0xFFF1F4F8),
                  borderRadius: BorderRadius.circular(12.0),
                  shape: BoxShape.rectangle,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.date_range_rounded,
                            color: Color(0xFF57636C),
                            size: 20.0,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Emploi de Temps',
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF57636C),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 40.0,
                decoration: BoxDecoration(
                  color: Color(0xFFF1F4F8),
                  borderRadius: BorderRadius.circular(12.0),
                  shape: BoxShape.rectangle,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                        child: Icon(
                          Icons.check_box,
                          color: Color(0xFF57636C),
                          size: 16.0,
                        ),
                      ),
                      Text(
                        'Completed Tasks',
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              fontFamily: 'Outfit',
                              color: Color(0xFF57636C),
                              fontSize: 14.0,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed('ProfilePage');
                },
                child: Container(
                  width: double.infinity,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFF1F4F8),
                    borderRadius: BorderRadius.circular(12.0),
                    shape: BoxShape.rectangle,
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 8.0, 0.0),
                          child: Icon(
                            Icons.person,
                            color: Color(0xFF57636C),
                            size: 16.0,
                          ),
                        ),
                        Text(
                          'Profile',
                          style:
                              FlutterFlowTheme.of(context).bodySmall.override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF57636C),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Divider(
                height: 12.0,
                thickness: 2.0,
                color: Color(0xFFE0E3E7),
              ),
              Text(
                'Classes',
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: SingleChildScrollView(
                  primary: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: FutureBuilder<List<ClasseRecord>>(
                          future: queryClasseRecordOnce(
                            queryBuilder: (classeRecord) =>
                                classeRecord.orderBy('order'),
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
                            List<ClasseRecord> listViewClasseRecordList =
                                snapshot.data!;
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: listViewClasseRecordList.length,
                              itemBuilder: (context, listViewIndex) {
                                final listViewClasseRecord =
                                    listViewClasseRecordList[listViewIndex];
                                return Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      FFAppState().classe =
                                          listViewClasseRecord.id;

                                      context.pushNamed(
                                        'SubjectPage',
                                        queryParameters: {
                                          'name': serializeParam(
                                            listViewClasseRecord.name,
                                            ParamType.String,
                                          ),
                                          'classOrder': serializeParam(
                                            listViewClasseRecord.order,
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: ListTile(
                                      title: Text(
                                        listViewClasseRecord.name,
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily: 'Outfit',
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                      trailing: Icon(
                                        Icons.arrow_forward_ios,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 20.0,
                                      ),
                                      tileColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      dense: false,
                                    ),
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
              Divider(
                height: 12.0,
                thickness: 2.0,
                color: Color(0xFFE0E3E7),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
