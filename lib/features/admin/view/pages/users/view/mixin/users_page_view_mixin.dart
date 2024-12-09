import 'package:flutter/material.dart';
import 'package:rent_a_car/core/product_network_manager.dart';
import 'package:rent_a_car/features/admin/view/pages/users/view/users_page_view.dart';
import 'package:rent_a_car/product/initialize/service/models/user/user.dart';
import 'package:rent_a_car/product/initialize/service/rent_a_car_service.dart';

mixin UsersPageViewMixin on State<UsersPageView> {
  late final RentACarService _rentACarService;
  List<User>? users;
  @override
  void initState() {
    super.initState();

    _rentACarService = RentACarService(
      networkManager: ProductNetworkManager(),
    );

    fetchUsers();
  }

//TODO: CREATE user REQUEST DOĞRU MU KONTROL ET
  Future<void> saveOnPressed(User user, String id) async {
    await _rentACarService.updateUser(user, id);
  }

  Future<void> deleteOnPressed(String id) async {
    await _rentACarService.deleteUser(id);
  }

  Future<void> fetchUsers() async {
    final response = await _rentACarService.getAllUsers();
    setState(() {
      users = response;
    });
  }
}
