// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubTaskListStruct extends BaseStruct {
  SubTaskListStruct({
    String? subTaskName,
    String? subTaskDescription,
    bool? status,
    int? timeOfCompletion,
  })  : _subTaskName = subTaskName,
        _subTaskDescription = subTaskDescription,
        _status = status,
        _timeOfCompletion = timeOfCompletion;

  // "subTaskName" field.
  String? _subTaskName;
  String get subTaskName => _subTaskName ?? '';
  set subTaskName(String? val) => _subTaskName = val;

  bool hasSubTaskName() => _subTaskName != null;

  // "subTaskDescription" field.
  String? _subTaskDescription;
  String get subTaskDescription => _subTaskDescription ?? '';
  set subTaskDescription(String? val) => _subTaskDescription = val;

  bool hasSubTaskDescription() => _subTaskDescription != null;

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

  static SubTaskListStruct fromMap(Map<String, dynamic> data) =>
      SubTaskListStruct(
        subTaskName: data['subTaskName'] as String?,
        subTaskDescription: data['subTaskDescription'] as String?,
        status: data['status'] as bool?,
        timeOfCompletion: castToType<int>(data['timeOfCompletion']),
      );

  static SubTaskListStruct? maybeFromMap(dynamic data) => data is Map
      ? SubTaskListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'subTaskName': _subTaskName,
        'subTaskDescription': _subTaskDescription,
        'status': _status,
        'timeOfCompletion': _timeOfCompletion,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'subTaskName': serializeParam(
          _subTaskName,
          ParamType.String,
        ),
        'subTaskDescription': serializeParam(
          _subTaskDescription,
          ParamType.String,
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

  static SubTaskListStruct fromSerializableMap(Map<String, dynamic> data) =>
      SubTaskListStruct(
        subTaskName: deserializeParam(
          data['subTaskName'],
          ParamType.String,
          false,
        ),
        subTaskDescription: deserializeParam(
          data['subTaskDescription'],
          ParamType.String,
          false,
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
  String toString() => 'SubTaskListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SubTaskListStruct &&
        subTaskName == other.subTaskName &&
        subTaskDescription == other.subTaskDescription &&
        status == other.status &&
        timeOfCompletion == other.timeOfCompletion;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([subTaskName, subTaskDescription, status, timeOfCompletion]);
}

SubTaskListStruct createSubTaskListStruct({
  String? subTaskName,
  String? subTaskDescription,
  bool? status,
  int? timeOfCompletion,
}) =>
    SubTaskListStruct(
      subTaskName: subTaskName,
      subTaskDescription: subTaskDescription,
      status: status,
      timeOfCompletion: timeOfCompletion,
    );
