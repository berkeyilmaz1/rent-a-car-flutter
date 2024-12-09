import 'package:flutter/material.dart';
import 'package:rent_a_car/features/admin/view/admin_sign_in_view.dart';

mixin AdminSignInMixin on State<AdminSignInView> {
  bool obscureText = true;

  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }
}
