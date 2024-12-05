// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_tree.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $authViewRoute,
      $homeViewRoute,
      $reservationViewRoute,
      $selectionViewRoute,
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
  static HomeViewRoute _fromState(GoRouterState state) => HomeViewRoute(
        state.extra as int,
      );

  String get location => GoRouteData.$location(
        '/home',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

RouteBase get $reservationViewRoute => GoRouteData.$route(
      path: '/reservation',
      factory: $ReservationViewRouteExtension._fromState,
    );

extension $ReservationViewRouteExtension on ReservationViewRoute {
  static ReservationViewRoute _fromState(GoRouterState state) =>
      const ReservationViewRoute();

  String get location => GoRouteData.$location(
        '/reservation',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $selectionViewRoute => GoRouteData.$route(
      path: '/selection',
      factory: $SelectionViewRouteExtension._fromState,
    );

extension $SelectionViewRouteExtension on SelectionViewRoute {
  static SelectionViewRoute _fromState(GoRouterState state) =>
      const SelectionViewRoute();

  String get location => GoRouteData.$location(
        '/selection',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
