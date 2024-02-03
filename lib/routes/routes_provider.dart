import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_sqflite/routes/routes.dart';
import 'package:todo_app_sqflite/routes/routes_path.dart';

final routesProvider = Provider(
  (ref) {
    return GoRouter(
      routes: appRoutes,
      navigatorKey: navigationKey,
      initialLocation: RoutesPath.home,
    );
  },
);
