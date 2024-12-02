import 'package:flutter/material.dart';
import 'package:rent_a_car/features/auth/view/auth_view.dart';
import 'package:rent_a_car/features/auth/view/sign_in_view.dart';
import 'package:rent_a_car/features/auth/view/sign_up_view.dart';

mixin AuthViewMixin on State<AuthView> {
  final _authPages = [const SignInView(), const SignUpView()];
  List<StatefulWidget> get authPages => _authPages;
}
