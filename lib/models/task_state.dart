// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:todo_app_sqflite/models/task.dart';

class TaskState extends Equatable {
  final List<Task> tasks;
  const TaskState({
    required this.tasks,
  });
  const TaskState.initial({
    this.tasks = const [],
  });
  @override
  // TODO: implement props
  List<Object?> get props => [tasks];

  TaskState copyWith({
    List<Task>? tasks,
  }) {
    return TaskState(
      tasks: tasks ?? this.tasks,
    );
  }
}
