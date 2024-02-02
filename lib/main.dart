import 'package:flutter/material.dart';
import 'package:todo_app_sqflite/configurations/theme/theme.dart';

import 'screens/home_scree.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: TodoAppTheme.lightTheme,
      home: HomeScreen(),
    );
  }
}
