import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'my_devices_model.dart';
export 'my_devices_model.dart';

class MyDevicesWidget extends StatefulWidget {
  const MyDevicesWidget({Key? key}) : super(key: key);

  @override
  _MyDevicesWidgetState createState() => _MyDevicesWidgetState();
}

class _MyDevicesWidgetState extends State<MyDevicesWidget> {
  late MyDevicesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyDevicesModel());
  }

  @override
  void dispose() {
    _model.dispose();

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
            context.pushNamed('HomePage');
          },
        ),
        title: Text(
          'My Devices',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'DIN pro',
                color: Colors.white,
                fontSize: 22,
                useGoogleFonts: false,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Stack(
            children: [
              Image.asset(
                'assets/images/liquimech_arrow_blue.png',
                width: 100000,
                height: 100000,
                fit: BoxFit.fill,
              ),
              FutureBuilder<ApiCallResponse>(
                future:
                    (_model.apiRequestCompleter ??= Completer<ApiCallResponse>()
                          ..complete(ArduinoIoTCloudGroup.callDevicesCall.call(
                            authToken: FFAppState().MyUserToken,
                          )))
                        .future,
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(
                          color: Color(0xFFD62E32),
                        ),
                      ),
                    );
                  }
                  final gridViewCallDevicesResponse = snapshot.data!;
                  return Builder(
                    builder: (context) {
                      final devicesGrid = getJsonField(
                        gridViewCallDevicesResponse.jsonBody,
                        r'''$[:].thing.properties[:]''',
                      ).toList();
                      return RefreshIndicator(
                        onRefresh: () async {
                          setState(() => _model.apiRequestCompleter = null);
                          await _model.waitForApiRequestCompleter();
                        },
                        child: GridView.builder(
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 1,
                          ),
                          scrollDirection: Axis.vertical,
                          itemCount: devicesGrid.length,
                          itemBuilder: (context, devicesGridIndex) {
                            final devicesGridItem =
                                devicesGrid[devicesGridIndex];
                            return Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                              child: InkWell(
                                onTap: () async {
                                  FFAppState().update(() {
                                    FFAppState().MyWidgetName = getJsonField(
                                      devicesGridItem,
                                      r'''$.name''',
                                    ).toString();
                                    FFAppState().MyWidgetID = getJsonField(
                                      devicesGridItem,
                                      r'''$.id''',
                                    ).toString();
                                    FFAppState().MyWidgetType = getJsonField(
                                      devicesGridItem,
                                      r'''$.type''',
                                    ).toString();
                                    FFAppState().MyWidgetOldValue =
                                        getJsonField(
                                      devicesGridItem,
                                      r'''$.last_value''',
                                    ).toString();
                                  });
                                  if (FFAppState().MyWidgetType == 'STATUS') {
                                    context.pushNamed('IsStatusDevice');

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
                                    context.pushNamed('NonStatusDevice');
                                  }
                                },
                                child: Container(
                                  width: 100,
                                  height: 100,
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
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Stack(
                                        children: [
                                          if ((getJsonField(
                                                    devicesGridItem,
                                                    r'''$.type''',
                                                  ) ==
                                                  'status') ||
                                              (getJsonField(
                                                    devicesGridItem,
                                                    r'''$.type''',
                                                  ) ==
                                                  'STATUS'))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(16, 16, 16, 16),
                                              child: FaIcon(
                                                FontAwesomeIcons.toggleOff,
                                                color: Colors.black,
                                                size: 70,
                                              ),
                                            ),
                                          if (!((getJsonField(
                                                    devicesGridItem,
                                                    r'''$.type''',
                                                  ) ==
                                                  'status') ||
                                              (getJsonField(
                                                    devicesGridItem,
                                                    r'''$.type''',
                                                  ) ==
                                                  'STATUS')))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(16, 16, 16, 16),
                                              child: Icon(
                                                Icons.edit_outlined,
                                                color: Colors.black,
                                                size: 70,
                                              ),
                                            ),
                                        ],
                                      ),
                                      AuthUserStreamWidget(
                                        builder: (context) => Text(
                                          (currentUserDocument?.clientProperties
                                                      ?.toList() ??
                                                  [])
                                              .contains(getJsonField(
                                                devicesGridItem,
                                                r'''$.id''',
                                              ))
                                              .toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        ),
                                      ),
                                    ],
                                  ),
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
            ],
          ),
        ),
      ),
    );
  }
}
