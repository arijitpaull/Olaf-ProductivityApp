import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'workspace_widget.dart' show WorkspaceWidget;
import 'package:flutter/material.dart';

class WorkspaceModel extends FlutterFlowModel<WorkspaceWidget> {
  ///  Local state fields for this page.

  bool paused = true;

  int activeSubTaskIndex = 0;

  int currentTimerValue = 360000;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Timer widget.
  final timerInitialTimeMs = 0;
  int timerMilliseconds = 0;
  String timerValue = StopWatchTimer.getDisplayTime(0, milliSecond: false);
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countUp));

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    timerController.dispose();
  }
}
