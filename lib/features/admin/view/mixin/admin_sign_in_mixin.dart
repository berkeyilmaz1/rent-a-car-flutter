import 'package:flutter/material.dart';
import 'package:rent_a_car/core/product_network_manager.dart';
import 'package:rent_a_car/features/admin/view/admin_sign_in_view.dart';
import 'package:rent_a_car/product/initialize/service/models/admin/admin.dart';
import 'package:rent_a_car/product/initialize/service/rent_a_car_service.dart';

mixin AdminSignInMixin on State<AdminSignInView> {
  bool obscureText = true;
  bool isLoading = false;

  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final RentACarService _rentACarService;
  List<Admin>? admins;
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    _rentACarService = RentACarService(networkManager: ProductNetworkManager());
  }

  Future<Admin> fetchAndFindAdmin(String adminEmail) async {
    await fetchAdmins();
    final admin = findAdmin(adminEmail);
    if (admin == null) {
      setState(() {
         isLoading =false;
      });
      throw Exception('Admin not found');
    }
    if (!mounted){
      setState(() {
         isLoading =false;
      });
      throw Exception('State is not mounted');
    }
    return admin;
  }

  Future<void> fetchAdmins() async {
    final response = await _rentACarService.getAllAdmins();
    setState(() {
      admins = response;
    });
  }

  Admin? findAdmin(String adminEmail) {
    print('4');
    print(' admins listesi $admins');

    final admin = admins?.firstWhere(
      (element) =>
          element.email?.trim().toLowerCase() ==
          adminEmail.trim().toLowerCase(),
      orElse: () => throw Exception('Admin Bulunamadı'),
    );

    print("5 ${admin?.name ?? 'boş'}");
    return admin;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
