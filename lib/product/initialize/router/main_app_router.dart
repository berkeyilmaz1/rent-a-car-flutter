import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rent_a_car/product/initialize/router/constants/route_paths.dart';
import 'package:rent_a_car/product/initialize/router/route_tree.dart';

final class MainAppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();
  static final GoRouter _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: RoutePaths.auth,
    routes: $appRoutes,
  );

  static GlobalKey<NavigatorState> get rootNavigatorKey => _shellNavigatorKey;
  static GlobalKey<NavigatorState> get shellNavigatorKey => _shellNavigatorKey;
  static GoRouter get router => _router;
}
