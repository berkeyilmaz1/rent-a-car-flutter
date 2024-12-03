import 'package:go_router/go_router.dart';
import 'package:rent_a_car/product/initialize/router/constants/route_paths.dart';
import 'package:rent_a_car/product/initialize/router/route_tree.dart';

final class MainAppRouter {
  static final GoRouter _router = GoRouter(
    initialLocation: RoutePaths.auth,
    routes: $appRoutes,
  );

  static GoRouter get router => _router;
}
