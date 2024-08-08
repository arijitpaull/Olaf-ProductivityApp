import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'rough_model.dart';
export 'rough_model.dart';

class RoughWidget extends StatefulWidget {
  const RoughWidget({super.key});

  @override
  State<RoughWidget> createState() => _RoughWidgetState();
}

class _RoughWidgetState extends State<RoughWidget> {
  late RoughModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RoughModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(10.0, 50.0, 10.0, 0.0),
                  child: Text(
                    '\n\n1. Sub tasks handling with each step in WORKSPACE page\n\n2. Task handling with page load in TASKS page\n\n3. Subject/tasks editing feature\n\n4. Delete bottom sheet',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter Tight',
                          fontSize: 15.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: FlutterFlowIconButton(
                      borderColor: FlutterFlowTheme.of(context).info,
                      borderRadius: 100.0,
                      borderWidth: 2.0,
                      buttonSize: 40.0,
                      fillColor: FlutterFlowTheme.of(context).primaryBackground,
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: FlutterFlowTheme.of(context).info,
                        size: 24.0,
                      ),
                      onPressed: () {
                        print('timerDown pressed ...');
                      },
                    ),
                  ),
                  Expanded(
                    child: FlutterFlowIconButton(
                      borderColor: FlutterFlowTheme.of(context).info,
                      borderRadius: 100.0,
                      borderWidth: 2.0,
                      buttonSize: 40.0,
                      fillColor: FlutterFlowTheme.of(context).primaryBackground,
                      icon: Icon(
                        Icons.arrow_drop_up,
                        color: FlutterFlowTheme.of(context).info,
                        size: 24.0,
                      ),
                      onPressed: () {
                        print('timerUp pressed ...');
                      },
                    ),
                  ),
                ].divide(const SizedBox(width: 5.0)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
