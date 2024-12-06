import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
  const HomeViewRoute(this.$extra);
  final int $extra;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return HomeView(
      dayCount: $extra,
    );
  }
}

@TypedGoRoute<ReservationViewRoute>(path: RoutePaths.reservation)
final class ReservationViewRoute extends GoRouteData {
  // const ReservationViewRoute(this.$extra);
  const ReservationViewRoute();
  // final Car $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ReservationView();
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

@TypedGoRoute<PaymentViewRoute>(path: RoutePaths.payment)
final class PaymentViewRoute extends GoRouteData {
  const PaymentViewRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const PaymentView();
  }
}
