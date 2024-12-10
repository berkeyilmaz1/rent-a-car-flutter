import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rent_a_car/features/admin/view/admin_dashboard_view.dart';
import 'package:rent_a_car/features/admin/view/admin_sign_in_view.dart';
import 'package:rent_a_car/features/admin/view/pages/cars/view/create_car_view.dart';
import 'package:rent_a_car/features/auth/view/auth_view.dart';
import 'package:rent_a_car/features/home/view/home_view.dart';
import 'package:rent_a_car/features/payment/view/payment_view.dart';
import 'package:rent_a_car/features/reservation/view/reservation_view.dart';
import 'package:rent_a_car/features/selection/view/selection_view.dart';
import 'package:rent_a_car/product/initialize/router/constants/route_paths.dart';

part 'route_tree.g.dart';

@TypedGoRoute<AuthViewRoute>(path: RoutePaths.auth)
final class AuthViewRoute extends GoRouteData {
  const AuthViewRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AuthView();
  }
}

@TypedGoRoute<HomeViewRoute>(path: RoutePaths.home)
final class HomeViewRoute extends GoRouteData {
  const HomeViewRoute({
    required this.$extra,
  });

  final Map<String, dynamic> $extra;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return HomeView(
      parameters: $extra,
    );
  }
}

@TypedGoRoute<ReservationViewRoute>(path: RoutePaths.reservation)
final class ReservationViewRoute extends GoRouteData {
  const ReservationViewRoute({
    required this.$extra,
  });

  final Map<dynamic, dynamic> $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ReservationView(
      parameters: $extra,
    );
  }
}

@TypedGoRoute<SelectionViewRoute>(path: RoutePaths.selection)
final class SelectionViewRoute extends GoRouteData {
  const SelectionViewRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SelectionView();
  }
}

@TypedGoRoute<AdminDashboardViewRoute>(path: RoutePaths.adminDashboard)
final class AdminDashboardViewRoute extends GoRouteData {
  const AdminDashboardViewRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AdminDashboardView();
  }
}

@TypedGoRoute<AdminSignInViewRoute>(path: RoutePaths.adminAuth)
final class AdminSignInViewRoute extends GoRouteData {
  const AdminSignInViewRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AdminSignInView();
  }
}

@TypedGoRoute<PaymentViewRoute>(path: RoutePaths.payment)
final class PaymentViewRoute extends GoRouteData {
  const PaymentViewRoute(this.$extra);
  final Map<dynamic, dynamic> $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return PaymentView(
      parameters: $extra,
    );
  }
}

@TypedGoRoute<CreateCarViewRoute>(path: RoutePaths.createCar)
final class CreateCarViewRoute extends GoRouteData {
  const CreateCarViewRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CreateCarView();
  }
}
