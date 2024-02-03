import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_sqflite/routes/routes_path.dart';
import 'package:todo_app_sqflite/screens/add_new_task_screen.dart';
import 'package:todo_app_sqflite/screens/home_scree.dart';

final navigationKey = GlobalKey<NavigatorState>();
final appRoutes = [
  GoRoute(
      path: RoutesPath.home,
      parentNavigatorKey: navigationKey,
      builder: const HomeScreen().builder),
  GoRoute(
      path: RoutesPath.createTask,
      parentNavigatorKey: navigationKey,
      builder: const AddNewTask().builder),
];
