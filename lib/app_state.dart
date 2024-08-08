import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _tasks = prefs
              .getStringList('ff_tasks')
              ?.map((x) {
                try {
                  return TaskListStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _tasks;
    });
    _safeInit(() {
      _activeTaskIndex = prefs.getInt('ff_activeTaskIndex') ?? _activeTaskIndex;
    });
    _safeInit(() {
      _subtasks = prefs
              .getStringList('ff_subtasks')
              ?.map((x) {
                try {
                  return SubTaskListStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _subtasks;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<TaskListStruct> _tasks = [];
  List<TaskListStruct> get tasks => _tasks;
  set tasks(List<TaskListStruct> value) {
    _tasks = value;
    prefs.setStringList('ff_tasks', value.map((x) => x.serialize()).toList());
  }

  void addToTasks(TaskListStruct value) {
    tasks.add(value);
    prefs.setStringList('ff_tasks', _tasks.map((x) => x.serialize()).toList());
  }

  void removeFromTasks(TaskListStruct value) {
    tasks.remove(value);
    prefs.setStringList('ff_tasks', _tasks.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromTasks(int index) {
    tasks.removeAt(index);
    prefs.setStringList('ff_tasks', _tasks.map((x) => x.serialize()).toList());
  }

  void updateTasksAtIndex(
    int index,
    TaskListStruct Function(TaskListStruct) updateFn,
  ) {
    tasks[index] = updateFn(_tasks[index]);
    prefs.setStringList('ff_tasks', _tasks.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInTasks(int index, TaskListStruct value) {
    tasks.insert(index, value);
    prefs.setStringList('ff_tasks', _tasks.map((x) => x.serialize()).toList());
  }

  int _activeTaskIndex = 0;
  int get activeTaskIndex => _activeTaskIndex;
  set activeTaskIndex(int value) {
    _activeTaskIndex = value;
    prefs.setInt('ff_activeTaskIndex', value);
  }

  List<SubTaskListStruct> _subtasks = [];
  List<SubTaskListStruct> get subtasks => _subtasks;
  set subtasks(List<SubTaskListStruct> value) {
    _subtasks = value;
    prefs.setStringList(
        'ff_subtasks', value.map((x) => x.serialize()).toList());
  }

  void addToSubtasks(SubTaskListStruct value) {
    subtasks.add(value);
    prefs.setStringList(
        'ff_subtasks', _subtasks.map((x) => x.serialize()).toList());
  }

  void removeFromSubtasks(SubTaskListStruct value) {
    subtasks.remove(value);
    prefs.setStringList(
        'ff_subtasks', _subtasks.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromSubtasks(int index) {
    subtasks.removeAt(index);
    prefs.setStringList(
        'ff_subtasks', _subtasks.map((x) => x.serialize()).toList());
  }

  void updateSubtasksAtIndex(
    int index,
    SubTaskListStruct Function(SubTaskListStruct) updateFn,
  ) {
    subtasks[index] = updateFn(_subtasks[index]);
    prefs.setStringList(
        'ff_subtasks', _subtasks.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInSubtasks(int index, SubTaskListStruct value) {
    subtasks.insert(index, value);
    prefs.setStringList(
        'ff_subtasks', _subtasks.map((x) => x.serialize()).toList());
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
