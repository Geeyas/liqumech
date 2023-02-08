import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ThingNameWidget extends StatefulWidget {
  const ThingNameWidget({Key? key}) : super(key: key);

  @override
  _ThingNameWidgetState createState() => _ThingNameWidgetState();
}

class _ThingNameWidgetState extends State<ThingNameWidget> {
  Completer<ApiCallResponse>? _apiRequestCompleter;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.chevron_left,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () async {
            context.pushNamed('myThings');
          },
        ),
        title: Text(
          FFAppState().MyThingName,
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: FutureBuilder<ApiCallResponse>(
            future: (_apiRequestCompleter ??= Completer<ApiCallResponse>()
                  ..complete(ArduinoIoTCloudGroup.showThingCall.call(
                    authToken: FFAppState().MyUserToken,
                    thingId: FFAppState().MyThingID,
                  )))
                .future,
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                    child: SizedBox(
                      width: 40,
                      height: 40,
                      child: CircularProgressIndicator(
                        color: FlutterFlowTheme.of(context).primaryColor,
                      ),
                    ),
                  ),
                );
              }
              final listViewShowThingResponse = snapshot.data!;
              return Builder(
                builder: (context) {
                  final propertiesList = getJsonField(
                    listViewShowThingResponse.jsonBody,
                    r'''$''',
                  ).toList();
                  if (propertiesList.isEmpty) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        'assets/images/hide_the_pain_harold.jpg',
                      ),
                    );
                  }
                  return RefreshIndicator(
                    onRefresh: () async {
                      setState(() => _apiRequestCompleter = null);
                      await waitForApiRequestCompleter();
                    },
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: propertiesList.length,
                      itemBuilder: (context, propertiesListIndex) {
                        final propertiesListItem =
                            propertiesList[propertiesListIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
                          child: Container(
                            width: double.infinity,
                            height: 70,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 5,
                                  color: Color(0x33000000),
                                  offset: Offset(0, 2),
                                )
                              ],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Stack(
                                  children: [
                                    if ((getJsonField(
                                              propertiesListItem,
                                              r'''$.type''',
                                            ) ==
                                            'status') ||
                                        (getJsonField(
                                              propertiesListItem,
                                              r'''$.type''',
                                            ) ==
                                            'STATUS'))
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 4, 8, 8),
                                        child: Icon(
                                          Icons.edit_attributes_outlined,
                                          color: Colors.black,
                                          size: 60,
                                        ),
                                      ),
                                    if (!((getJsonField(
                                              propertiesListItem,
                                              r'''$.type''',
                                            ) ==
                                            'status') ||
                                        (getJsonField(
                                              propertiesListItem,
                                              r'''$.type''',
                                            ) ==
                                            'STATUS')))
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 4, 8, 8),
                                        child: Icon(
                                          Icons.edit_outlined,
                                          color: Colors.black,
                                          size: 60,
                                        ),
                                      ),
                                  ],
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 8, 0, 8),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          getJsonField(
                                            propertiesListItem,
                                            r'''$.name''',
                                          ).toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .title3
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontSize: 15,
                                              ),
                                        ),
                                        Text(
                                          getJsonField(
                                            propertiesListItem,
                                            r'''$.last_value''',
                                          ).toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    FFAppState().update(() {
                                      FFAppState().MyWidgetName = getJsonField(
                                        propertiesListItem,
                                        r'''$.name''',
                                      ).toString();
                                      FFAppState().MyWidgetID = getJsonField(
                                        propertiesListItem,
                                        r'''$.id''',
                                      ).toString();
                                      FFAppState().MyWidgetType = getJsonField(
                                        propertiesListItem,
                                        r'''$.type''',
                                      ).toString();
                                      FFAppState().MyWidgetOldValue =
                                          getJsonField(
                                        propertiesListItem,
                                        r'''$.last_value''',
                                      ).toString();
                                    });
                                    if (FFAppState().MyWidgetType == 'STATUS') {
                                      context.pushNamed('IsStatus');

                                      if (FFAppState().MyWidgetOldValue ==
                                          'true') {
                                        FFAppState().update(() {
                                          FFAppState().MyWidgetStatus = true;
                                        });
                                      } else {
                                        FFAppState().update(() {
                                          FFAppState().MyWidgetStatus = false;
                                        });
                                      }
                                    } else {
                                      context.pushNamed('NonStatus');
                                    }
                                  },
                                  child: Icon(
                                    Icons.chevron_right,
                                    color: Colors.black,
                                    size: 40,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Future waitForApiRequestCompleter({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = _apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
