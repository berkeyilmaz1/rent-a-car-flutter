import 'package:flutter/material.dart';
import 'package:rent_a_car/features/admin/view/pages/users/view/mixin/users_page_view_mixin.dart';

class UsersPageView extends StatefulWidget {
  const UsersPageView({super.key});

  @override
  State<UsersPageView> createState() => _UsersPageViewState();
}

class _UsersPageViewState extends State<UsersPageView> with UsersPageViewMixin {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Users Management'));
  }
}
