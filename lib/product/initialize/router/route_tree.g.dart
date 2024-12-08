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
      $adminDashboardViewRoute,
      $paymentViewRoute,
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
        startDate: state.uri.queryParameters['start-date']!,
        endDate: state.uri.queryParameters['end-date']!,
        $extra: state.extra as int,
      );

  String get location => GoRouteData.$location(
        '/home',
        queryParams: {
          'start-date': startDate,
          'end-date': endDate,
        },
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
      ReservationViewRoute(
        startDate: state.uri.queryParameters['start-date']!,
        endDate: state.uri.queryParameters['end-date']!,
        state.extra as Car,
      );

  String get location => GoRouteData.$location(
        '/reservation',
        queryParams: {
          'start-date': startDate,
          'end-date': endDate,
        },
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
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

RouteBase get $adminDashboardViewRoute => GoRouteData.$route(
      path: '/admin',
      factory: $AdminDashboardViewRouteExtension._fromState,
    );

extension $AdminDashboardViewRouteExtension on AdminDashboardViewRoute {
  static AdminDashboardViewRoute _fromState(GoRouterState state) =>
      const AdminDashboardViewRoute();

  String get location => GoRouteData.$location(
        '/admin',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $paymentViewRoute => GoRouteData.$route(
      path: '/payment',
      factory: $PaymentViewRouteExtension._fromState,
    );

extension $PaymentViewRouteExtension on PaymentViewRoute {
  static PaymentViewRoute _fromState(GoRouterState state) =>
      const PaymentViewRoute();

  String get location => GoRouteData.$location(
        '/payment',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
