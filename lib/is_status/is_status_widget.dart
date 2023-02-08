import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class IsStatusWidget extends StatefulWidget {
  const IsStatusWidget({Key? key}) : super(key: key);

  @override
  _IsStatusWidgetState createState() => _IsStatusWidgetState();
}

class _IsStatusWidgetState extends State<IsStatusWidget> {
  ApiCallResponse? apiResult3vt;
  ApiCallResponse? apiResultarh;
  bool? switchValue;
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
            context.pushNamed('ThingName');
          },
        ),
        title: Text(
          FFAppState().MyWidgetName,
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Switch.adaptive(
                      value: switchValue ??= FFAppState().MyWidgetStatus,
                      onChanged: (newValue) async {
                        setState(() => switchValue = newValue!);
                        if (newValue!) {
                          apiResultarh =
                              await ArduinoIoTCloudGroup.turnOnCall.call(
                            authToken: FFAppState().MyUserToken,
                            propertyId: FFAppState().MyWidgetID,
                            thingId: FFAppState().MyThingID,
                          );
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                content: Text(
                                    'Changes may take upto a minute to propagate'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Ok'),
                                  ),
                                ],
                              );
                            },
                          );

                          setState(() {});
                        } else {
                          apiResult3vt =
                              await ArduinoIoTCloudGroup.turnOffCall.call(
                            thingId: FFAppState().MyThingID,
                            propertyId: FFAppState().MyWidgetID,
                            authToken: FFAppState().MyUserToken,
                          );
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                content: Text(
                                    'Changes may take upto a minute to propagate'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Ok'),
                                  ),
                                ],
                              );
                            },
                          );

                          setState(() {});
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
