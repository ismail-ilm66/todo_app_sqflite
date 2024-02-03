import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_sqflite/configurations/theme/theme.dart';
import 'package:todo_app_sqflite/routes/routes_provider.dart';

void main() {
  runApp(const ProviderScope(child: TodoApp()));
}

class TodoApp extends ConsumerWidget {
  const TodoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routerConfig = ref.watch(routesProvider);
    return MaterialApp.router(
      title: 'Todo App',
      theme: TodoAppTheme.lightTheme,
      routerConfig: routerConfig,
    );
  }
}
