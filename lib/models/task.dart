// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:todo_app_sqflite/utilities/application_keys.dart';
import 'package:todo_app_sqflite/utilities/task_categories.dart';

class Task extends Equatable {
  final String id;
  final String title;
  final String note;
  final String time;
  final String date;
  final bool isCompleted;
  final TaskCategories taskCategory;
  Task({
    required this.taskCategory,
    required this.id,
    required this.title,
    required this.note,
    required this.time,
    required this.date,
    required this.isCompleted,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id, title, note, time, date, isCompleted];

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      AppKeys.id: id,
      AppKeys.title: title,
      AppKeys.note: note,
      AppKeys.time: time,
      AppKeys.date: date,
      AppKeys.isCompleted: isCompleted,
      AppKeys.taskCategory: taskCategory.name,
    };
  }

  factory Task.fromJson(Map<String, dynamic> map) {
    return Task(
      id: map[AppKeys.id] as String,
      title: map[AppKeys.title],
      note: map[AppKeys.note],
      time: map[AppKeys.time],
      date: map[AppKeys.date],
      isCompleted: map[AppKeys.isCompleted],
      taskCategory: TaskCategories.stringToTaskCategory(
        map[AppKeys.taskCategory],
      ),
    );
  }

  Task copyWith({
    String? id,
    String? title,
    String? note,
    String? time,
    String? date,
    bool? isCompleted,
    TaskCategories? taskCategory,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      note: note ?? this.note,
      time: time ?? this.time,
      date: date ?? this.date,
      isCompleted: isCompleted ?? this.isCompleted,
      taskCategory: taskCategory ?? this.taskCategory,
    );
  }
}
