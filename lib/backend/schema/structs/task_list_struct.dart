// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TaskListStruct extends BaseStruct {
  TaskListStruct({
    String? taskName,
    String? taskDescription,
    List<SubTaskListStruct>? subTaskList,
    bool? status,
    int? timeOfCompletion,
  })  : _taskName = taskName,
        _taskDescription = taskDescription,
        _subTaskList = subTaskList,
        _status = status,
        _timeOfCompletion = timeOfCompletion;

  // "taskName" field.
  String? _taskName;
  String get taskName => _taskName ?? '';
  set taskName(String? val) => _taskName = val;

  bool hasTaskName() => _taskName != null;

  // "taskDescription" field.
  String? _taskDescription;
  String get taskDescription => _taskDescription ?? '';
  set taskDescription(String? val) => _taskDescription = val;

  bool hasTaskDescription() => _taskDescription != null;

  // "subTaskList" field.
  List<SubTaskListStruct>? _subTaskList;
  List<SubTaskListStruct> get subTaskList => _subTaskList ?? const [];
  set subTaskList(List<SubTaskListStruct>? val) => _subTaskList = val;

  void updateSubTaskList(Function(List<SubTaskListStruct>) updateFn) {
    updateFn(_subTaskList ??= []);
  }

  bool hasSubTaskList() => _subTaskList != null;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  set status(bool? val) => _status = val;

  bool hasStatus() => _status != null;

  // "timeOfCompletion" field.
  int? _timeOfCompletion;
  int get timeOfCompletion => _timeOfCompletion ?? 0;
  set timeOfCompletion(int? val) => _timeOfCompletion = val;

  void incrementTimeOfCompletion(int amount) =>
      timeOfCompletion = timeOfCompletion + amount;

  bool hasTimeOfCompletion() => _timeOfCompletion != null;

  static TaskListStruct fromMap(Map<String, dynamic> data) => TaskListStruct(
        taskName: data['taskName'] as String?,
        taskDescription: data['taskDescription'] as String?,
        subTaskList: getStructList(
          data['subTaskList'],
          SubTaskListStruct.fromMap,
        ),
        status: data['status'] as bool?,
        timeOfCompletion: castToType<int>(data['timeOfCompletion']),
      );

  static TaskListStruct? maybeFromMap(dynamic data) =>
      data is Map ? TaskListStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'taskName': _taskName,
        'taskDescription': _taskDescription,
        'subTaskList': _subTaskList?.map((e) => e.toMap()).toList(),
        'status': _status,
        'timeOfCompletion': _timeOfCompletion,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'taskName': serializeParam(
          _taskName,
          ParamType.String,
        ),
        'taskDescription': serializeParam(
          _taskDescription,
          ParamType.String,
        ),
        'subTaskList': serializeParam(
          _subTaskList,
          ParamType.DataStruct,
          isList: true,
        ),
        'status': serializeParam(
          _status,
          ParamType.bool,
        ),
        'timeOfCompletion': serializeParam(
          _timeOfCompletion,
          ParamType.int,
        ),
      }.withoutNulls;

  static TaskListStruct fromSerializableMap(Map<String, dynamic> data) =>
      TaskListStruct(
        taskName: deserializeParam(
          data['taskName'],
          ParamType.String,
          false,
        ),
        taskDescription: deserializeParam(
          data['taskDescription'],
          ParamType.String,
          false,
        ),
        subTaskList: deserializeStructParam<SubTaskListStruct>(
          data['subTaskList'],
          ParamType.DataStruct,
          true,
          structBuilder: SubTaskListStruct.fromSerializableMap,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.bool,
          false,
        ),
        timeOfCompletion: deserializeParam(
          data['timeOfCompletion'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'TaskListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is TaskListStruct &&
        taskName == other.taskName &&
        taskDescription == other.taskDescription &&
        listEquality.equals(subTaskList, other.subTaskList) &&
        status == other.status &&
        timeOfCompletion == other.timeOfCompletion;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([taskName, taskDescription, subTaskList, status, timeOfCompletion]);
}

TaskListStruct createTaskListStruct({
  String? taskName,
  String? taskDescription,
  bool? status,
  int? timeOfCompletion,
}) =>
    TaskListStruct(
      taskName: taskName,
      taskDescription: taskDescription,
      status: status,
      timeOfCompletion: timeOfCompletion,
    );
