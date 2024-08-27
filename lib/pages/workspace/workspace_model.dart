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

  // State field(s) for WorkTimer widget.
  final workTimerInitialTimeMs = 0;
  int workTimerMilliseconds = 0;
  String workTimerValue = StopWatchTimer.getDisplayTime(0, milliSecond: false);
  FlutterFlowTimerController workTimerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countUp));

  // State field(s) for BreakTimer widget.
  final breakTimerInitialTimeMs = 0;
  int breakTimerMilliseconds = 0;
  String breakTimerValue = StopWatchTimer.getDisplayTime(0, milliSecond: false);
  FlutterFlowTimerController breakTimerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countUp));

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    workTimerController.dispose();
    breakTimerController.dispose();
  }
}
