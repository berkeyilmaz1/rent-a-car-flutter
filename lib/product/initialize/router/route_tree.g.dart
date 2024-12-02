// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_tree.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $authViewRoute,
      $homeViewRoute,
    ];

RouteBase get $authViewRoute => GoRouteData.$route(
      path: '/auth',
      factory: $AuthViewRouteExtension._fromState,
    );

extension $AuthViewRouteExtension on AuthViewRoute {
  static AuthViewRoute _fromState(GoRouterState state) => const AuthViewRoute();

  String get location => GoRouteData.$location(
        '/auth',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $homeViewRoute => GoRouteData.$route(
      path: '/home',
      factory: $HomeViewRouteExtension._fromState,
    );

extension $HomeViewRouteExtension on HomeViewRoute {
  static HomeViewRoute _fromState(GoRouterState state) => const HomeViewRoute();

  String get location => GoRouteData.$location(
        '/home',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
