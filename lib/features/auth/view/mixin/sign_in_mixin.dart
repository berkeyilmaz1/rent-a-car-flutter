import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_a_car/core/product_network_manager.dart';
import 'package:rent_a_car/features/auth/view/sign_in_view.dart';
import 'package:rent_a_car/product/initialize/providers/user_provider.dart';
import 'package:rent_a_car/product/initialize/service/models/user/user.dart';
import 'package:rent_a_car/product/initialize/service/rent_a_car_service.dart';

mixin SignInMixin on State<SignInView> {
  // ignore: prefer_final_fields
  bool obscureText = true;

  late final RentACarService _rentACarService;
  late final TextEditingController _emailController;
  TextEditingController get emailController => _emailController;
  late final TextEditingController _passwordController;
  TextEditingController get passwordController => _passwordController;
  List<User>? users;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _rentACarService = RentACarService(networkManager: ProductNetworkManager());
  }

  Future<User> fetchAndFindUser(String userEmail) async {
    await fetchUsers();
    final user = findUser(userEmail);
    if (user == null) throw Exception('User not found');
    if (!mounted) throw Exception('State is not mounted');
    Provider.of<UserProvider>(context, listen: false).setUser(user);
    return user;
  }

  Future<void> fetchUsers() async {
    final response = await _rentACarService.getAllUsers();
    setState(() {
      users = response;
    });
  }

  User? findUser(String userEmail) {
    final user = users?.firstWhere((element) => element.email == userEmail);

    return user;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
