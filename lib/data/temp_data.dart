import 'package:flutter/material.dart';
import 'package:todo_app_sqflite/models/task.dart';
import 'package:todo_app_sqflite/utilities/task_categories.dart';

List<Task> tempData = [
  Task(
    TaskCategories.work,
    id: '123',
    title: "Dermatologist",
    note: 'Important Appointment',
    time: '4:00 PM',
    date: '2nd Feb , 2024',
    isCompleted: false,
  ),
  Task(
    TaskCategories.education,
    id: '123',
    title: "Revising",
    note: 'To Revise OS',
    time: '4:00 PM',
    date: '2nd Feb , 2024',
    isCompleted: true,
  ),
  Task(
    TaskCategories.personal,
    id: '123',
    title: "FNCS Finals",
    note: 'Important Appointment',
    time: '11:00 PM',
    date: '2nd Feb , 2024',
    isCompleted: false,
  )
];
