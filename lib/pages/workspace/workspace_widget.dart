import '/components/emptylist_widget.dart';
import '/components/stop_timer_sheet_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'workspace_model.dart';
export 'workspace_model.dart';

class WorkspaceWidget extends StatefulWidget {
  const WorkspaceWidget({super.key});

  @override
  State<WorkspaceWidget> createState() => _WorkspaceWidgetState();
}

class _WorkspaceWidgetState extends State<WorkspaceWidget> {
  late WorkspaceModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WorkspaceModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if ((FFAppState().activeTaskIndex == null) ||
          (FFAppState().activeTaskIndex < 0)) {
        FFAppState().activeTaskIndex = 0;
        setState(() {});
      } else {
        if (FFAppState().activeTaskIndex > FFAppState().tasks.length) {
          FFAppState().activeTaskIndex = FFAppState().tasks.length - 1;
          setState(() {});
        }
      }

      if (FFAppState().subtasks.isNotEmpty) {
        _model.activeSubTaskIndex = FFAppState().subtasks.length;
        setState(() {});
      } else {
        _model.activeSubTaskIndex = 0;
        setState(() {});
      }

      while (_model.activeSubTaskIndex <
          FFAppState().tasks[FFAppState().activeTaskIndex].subTaskList.length) {
        FFAppState().addToSubtasks(FFAppState()
            .tasks[FFAppState().activeTaskIndex]
            .subTaskList[_model.activeSubTaskIndex]);
        FFAppState().update(() {});
        _model.activeSubTaskIndex = _model.activeSubTaskIndex + 1;
        setState(() {});
      }
      _model.activeSubTaskIndex = 0;
      setState(() {});
      while (_model.activeSubTaskIndex < FFAppState().subtasks.length) {
        if (FFAppState().subtasks[_model.activeSubTaskIndex].status == true) {
          _model.activeSubTaskIndex = _model.activeSubTaskIndex + 1;
          setState(() {});
        } else {
          return;
        }
      }
      if (_model.activeSubTaskIndex >= FFAppState().subtasks.length) {
        _model.activeSubTaskIndex = -1;
        setState(() {});
      }
      if (_model.activeSubTaskIndex == -1) {
        FFAppState().updateTasksAtIndex(
          FFAppState().activeTaskIndex,
          (e) => e..status = true,
        );
        setState(() {});
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
      onTap: () => FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(0.0),
              child: Image.asset(
                'assets/images/Olaf_Logo_1.png',
                width: 300.0,
                height: 200.0,
                fit: BoxFit.contain,
              ),
            ),
            title: Text(
              'workspace',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Inter',
                    color: const Color(0x80F0F0F0),
                    fontSize: 20.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            actions: const [],
            centerTitle: true,
            elevation: 0.0,
          ),
          body: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
            child: Stack(
              children: [
                if (FFAppState().tasks.isNotEmpty)
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 3.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    height: 150.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: FlutterFlowTimer(
                                              initialTime:
                                                  _model.timerInitialTimeMs,
                                              getDisplayTime: (value) =>
                                                  StopWatchTimer.getDisplayTime(
                                                      value,
                                                      milliSecond: false),
                                              controller:
                                                  _model.timerController,
                                              updateStateInterval:
                                                  const Duration(milliseconds: 1000),
                                              onChanged: (value, displayTime,
                                                  shouldUpdate) {
                                                _model.timerMilliseconds =
                                                    value;
                                                _model.timerValue = displayTime;
                                                if (shouldUpdate) {
                                                  setState(() {});
                                                }
                                              },
                                              onEnded: () async {
                                                _model.paused = true;
                                                setState(() {});
                                              },
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .headlineSmall
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .info,
                                                    fontSize: 25.0,
                                                    letterSpacing: 2.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: FFButtonWidget(
                                      onPressed: ((_model.timerMilliseconds ==
                                                  0) &&
                                              (_model.paused == true))
                                          ? null
                                          : () async {
                                              _model.timerController
                                                  .onStopTimer();
                                              _model.paused = true;
                                              setState(() {});
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                context: context,
                                                builder: (context) {
                                                  return GestureDetector(
                                                    onTap: () =>
                                                        FocusScope.of(context)
                                                            .unfocus(),
                                                    child: Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child: SizedBox(
                                                        height: 250.0,
                                                        child:
                                                            StopTimerSheetWidget(
                                                          activeSubTaskIndex: _model
                                                              .activeSubTaskIndex,
                                                          timerLastValue: _model
                                                              .timerMilliseconds,
                                                          timerReset: () async {
                                                            _model
                                                                .timerController
                                                                .onResetTimer();
                                                          },
                                                          timerStop: () async {
                                                            _model
                                                                .timerController
                                                                .onResetTimer();
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then((value) =>
                                                  safeSetState(() {}));
                                            },
                                      text: 'stop',
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: FFButtonWidget(
                                      onPressed:
                                          (_model.activeSubTaskIndex == -1)
                                              ? null
                                              : () async {
                                                  HapticFeedback.mediumImpact();
                                                  if (_model.paused == true) {
                                                    _model.paused = false;
                                                    setState(() {});
                                                    _model.timerController
                                                        .onStartTimer();
                                                  } else {
                                                    _model.paused = true;
                                                    setState(() {});
                                                    _model.timerController
                                                        .onStopTimer();
                                                  }
                                                },
                                      text: valueOrDefault<String>(
                                        _model.paused ? 'start' : 'pause',
                                        'start',
                                      ),
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent2,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 3.0,
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                          width: 0.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        disabledColor:
                                            FlutterFlowTheme.of(context).info,
                                        disabledTextColor:
                                            FlutterFlowTheme.of(context).info,
                                      ),
                                    ),
                                  ),
                                ].divide(const SizedBox(width: 20.0)),
                              ),
                            ].divide(const SizedBox(height: 10.0)),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: Material(
                                      color: Colors.transparent,
                                      elevation: 3.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            width: 2.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 10.0, 10.0, 10.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                valueOrDefault<String>(
                                                  '• ${valueOrDefault<String>(
                                                    FFAppState()
                                                        .tasks[FFAppState()
                                                            .activeTaskIndex]
                                                        .taskName,
                                                    'task name',
                                                  )}',
                                                  '• subject name',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .accent4,
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                              Text(
                                                valueOrDefault<String>(
                                                  '• ${valueOrDefault<String>(
                                                    FFAppState()
                                                        .tasks[FFAppState()
                                                            .activeTaskIndex]
                                                        .taskDescription,
                                                    'task desc',
                                                  )}',
                                                  '• subject desc',
                                                ).maybeHandleOverflow(
                                                  maxChars: 20,
                                                  replacement: '…',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          fontSize: 13.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                              ),
                                            ]
                                                .divide(const SizedBox(height: 10.0))
                                                .around(const SizedBox(height: 10.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      FFButtonWidget(
                                        onPressed: ((FFAppState()
                                                        .activeTaskIndex ==
                                                    0) ||
                                                (_model.timerMilliseconds > 0))
                                            ? null
                                            : () async {
                                                if (FFAppState()
                                                        .activeTaskIndex >
                                                    0) {
                                                  FFAppState().activeTaskIndex =
                                                      FFAppState()
                                                              .activeTaskIndex +
                                                          -1;
                                                  FFAppState().update(() {});
                                                  FFAppState().subtasks = [];
                                                  setState(() {});
                                                  _model.activeSubTaskIndex = 0;
                                                  setState(() {});
                                                  while (_model
                                                          .activeSubTaskIndex <
                                                      FFAppState()
                                                          .tasks[FFAppState()
                                                              .activeTaskIndex]
                                                          .subTaskList
                                                          .length) {
                                                    FFAppState().addToSubtasks(FFAppState()
                                                            .tasks[FFAppState()
                                                                .activeTaskIndex]
                                                            .subTaskList[
                                                        _model
                                                            .activeSubTaskIndex]);
                                                    FFAppState().update(() {});
                                                    _model.activeSubTaskIndex =
                                                        _model.activeSubTaskIndex +
                                                            1;
                                                    setState(() {});
                                                  }
                                                  _model.activeSubTaskIndex = 0;
                                                  setState(() {});
                                                  while (_model
                                                          .activeSubTaskIndex <
                                                      FFAppState()
                                                          .subtasks
                                                          .length) {
                                                    if (FFAppState()
                                                            .subtasks[_model
                                                                .activeSubTaskIndex]
                                                            .status ==
                                                        true) {
                                                      _model.activeSubTaskIndex =
                                                          _model.activeSubTaskIndex +
                                                              1;
                                                      setState(() {});
                                                    } else {
                                                      return;
                                                    }
                                                  }
                                                  if (_model
                                                          .activeSubTaskIndex >=
                                                      FFAppState()
                                                          .subtasks
                                                          .length) {
                                                    _model.activeSubTaskIndex =
                                                        -1;
                                                    setState(() {});
                                                  }
                                                  if (_model
                                                          .activeSubTaskIndex ==
                                                      -1) {
                                                    FFAppState()
                                                        .updateTasksAtIndex(
                                                      FFAppState()
                                                          .activeTaskIndex,
                                                      (e) => e..status = true,
                                                    );
                                                    setState(() {});
                                                  }
                                                }
                                              },
                                        text: 'prev sub',
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Inter Tight',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                              ),
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                      FFButtonWidget(
                                        onPressed: ((FFAppState()
                                                        .activeTaskIndex ==
                                                    (FFAppState().tasks.length -
                                                        1)) ||
                                                (_model.timerMilliseconds > 0))
                                            ? null
                                            : () async {
                                                if (FFAppState()
                                                        .activeTaskIndex <
                                                    (FFAppState().tasks.length -
                                                        1)) {
                                                  FFAppState().activeTaskIndex =
                                                      FFAppState()
                                                              .activeTaskIndex +
                                                          1;
                                                  FFAppState().update(() {});
                                                  FFAppState().subtasks = [];
                                                  setState(() {});
                                                  _model.activeSubTaskIndex = 0;
                                                  setState(() {});
                                                  while (_model
                                                          .activeSubTaskIndex <
                                                      FFAppState()
                                                          .tasks[FFAppState()
                                                              .activeTaskIndex]
                                                          .subTaskList
                                                          .length) {
                                                    FFAppState().addToSubtasks(FFAppState()
                                                            .tasks[FFAppState()
                                                                .activeTaskIndex]
                                                            .subTaskList[
                                                        _model
                                                            .activeSubTaskIndex]);
                                                    FFAppState().update(() {});
                                                    _model.activeSubTaskIndex =
                                                        _model.activeSubTaskIndex +
                                                            1;
                                                    setState(() {});
                                                  }
                                                  _model.activeSubTaskIndex = 0;
                                                  setState(() {});
                                                  while (_model
                                                          .activeSubTaskIndex <
                                                      FFAppState()
                                                          .subtasks
                                                          .length) {
                                                    if (FFAppState()
                                                            .subtasks[_model
                                                                .activeSubTaskIndex]
                                                            .status ==
                                                        true) {
                                                      _model.activeSubTaskIndex =
                                                          _model.activeSubTaskIndex +
                                                              1;
                                                      setState(() {});
                                                    } else {
                                                      return;
                                                    }
                                                  }
                                                  if (_model
                                                          .activeSubTaskIndex >=
                                                      FFAppState()
                                                          .subtasks
                                                          .length) {
                                                    _model.activeSubTaskIndex =
                                                        -1;
                                                    setState(() {});
                                                  }
                                                  if (_model
                                                          .activeSubTaskIndex ==
                                                      -1) {
                                                    FFAppState()
                                                        .updateTasksAtIndex(
                                                      FFAppState()
                                                          .activeTaskIndex,
                                                      (e) => e..status = true,
                                                    );
                                                    setState(() {});
                                                  }
                                                }
                                              },
                                        text: 'next sub',
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Inter Tight',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent2,
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                              ),
                                          elevation: 3.0,
                                          borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 0.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          disabledColor:
                                              FlutterFlowTheme.of(context).info,
                                          disabledTextColor:
                                              FlutterFlowTheme.of(context).info,
                                        ),
                                      ),
                                    ].divide(const SizedBox(width: 5.0)),
                                  ),
                                ].divide(const SizedBox(height: 10.0)),
                              ),
                              Expanded(
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 3.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Container(
                                    width: 150.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          5.0, 5.0, 5.0, 5.0),
                                      child: Builder(
                                        builder: (context) {
                                          final subTasksItems =
                                              FFAppState().subtasks.toList();
                                          if (subTasksItems.isEmpty) {
                                            return const EmptylistWidget();
                                          }

                                          return ListView.separated(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5.0),
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: subTasksItems.length,
                                            separatorBuilder: (_, __) =>
                                                const SizedBox(height: 5.0),
                                            itemBuilder:
                                                (context, subTasksItemsIndex) {
                                              final subTasksItemsItem =
                                                  subTasksItems[
                                                      subTasksItemsIndex];
                                              return Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Material(
                                                    color: Colors.transparent,
                                                    elevation: 3.0,
                                                    shape: const CircleBorder(),
                                                    child: Container(
                                                      width: 20.0,
                                                      height: 20.0,
                                                      decoration: BoxDecoration(
                                                        color: subTasksItemsItem
                                                                    .status ==
                                                                false
                                                            ? const Color(0x80FF0003)
                                                            : const Color(0x8000FF50),
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                          color: subTasksItemsItem
                                                                      .status ==
                                                                  false
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .error
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .success,
                                                          width: 2.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        subTasksItemsItem
                                                            .subTaskName,
                                                        'task name',
                                                      ).maybeHandleOverflow(
                                                        maxChars: 12,
                                                        replacement: '…',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Inter Tight',
                                                            color: (subTasksItemsIndex ==
                                                                        _model
                                                                            .activeSubTaskIndex) &&
                                                                    (_model.activeSubTaskIndex !=
                                                                        -1)
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                            fontSize: 13.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ]
                                                    .divide(
                                                        const SizedBox(width: 5.0))
                                                    .around(
                                                        const SizedBox(width: 5.0)),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ].divide(const SizedBox(width: 5.0)),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Material(
                                color: Colors.transparent,
                                elevation: 3.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Container(
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: () {
                                        if (_model.activeSubTaskIndex == -1) {
                                          return FlutterFlowTheme.of(context)
                                              .success;
                                        } else if ((_model.timerMilliseconds >
                                                0) ||
                                            (FFAppState()
                                                    .tasks[FFAppState()
                                                        .activeTaskIndex]
                                                    .subTaskList
                                                    .first
                                                    .status ==
                                                true)) {
                                          return FlutterFlowTheme.of(context)
                                              .warning;
                                        } else {
                                          return FlutterFlowTheme.of(context)
                                              .error;
                                        }
                                      }(),
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 0.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          () {
                                            if (_model.activeSubTaskIndex ==
                                                -1) {
                                              return 'completed';
                                            } else if ((_model
                                                        .timerMilliseconds >
                                                    0) ||
                                                (FFAppState()
                                                        .tasks[FFAppState()
                                                            .activeTaskIndex]
                                                        .subTaskList
                                                        .first
                                                        .status ==
                                                    true)) {
                                              return 'ongoing';
                                            } else {
                                              return 'pending';
                                            }
                                          }(),
                                          'status',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color: () {
                                                if (_model.activeSubTaskIndex ==
                                                    -1) {
                                                  return const Color(0x7F00FF50);
                                                } else if ((_model
                                                            .timerMilliseconds >
                                                        0) ||
                                                    (FFAppState()
                                                            .tasks[FFAppState()
                                                                .activeTaskIndex]
                                                            .subTaskList
                                                            .first
                                                            .status ==
                                                        true)) {
                                                  return const Color(0x7FFFF000);
                                                } else {
                                                  return const Color(0x80FF0003);
                                                }
                                              }(),
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              if (_model.activeSubTaskIndex != -1)
                                Expanded(
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 3.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: AnimatedContainer(
                                      duration: const Duration(milliseconds: 200),
                                      curve: Curves.easeInOut,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: Border.all(
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          width: 2.0,
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 10.0, 10.0, 10.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              FFAppState()
                                                  .subtasks[
                                                      _model.activeSubTaskIndex]
                                                  .subTaskDescription,
                                              'no task description',
                                            ),
                                            maxLines: 5,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            ].divide(const SizedBox(width: 5.0)),
                          ),
                        ]
                            .divide(const SizedBox(height: 10.0))
                            .addToEnd(const SizedBox(height: 60.0)),
                      ),
                    ),
                  ),
                if (FFAppState().subtasks.isEmpty)
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 100.0),
                          child: Text(
                            'add a task.',
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context).accent4,
                                  fontSize: 31.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
