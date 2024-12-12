import 'package:flutter/material.dart';
import 'package:rent_a_car/features/admin/view/mixin/admin_dashboard_mixin.dart';
import 'package:rent_a_car/features/admin/widgets/admin_dashboard_drawer.dart';
import 'package:rent_a_car/features/auth/widgets/auth_button.dart';
import 'package:rent_a_car/product/initialize/router/route_tree.dart';

final class AdminDashboardView extends StatefulWidget {
  const AdminDashboardView({super.key});

  @override
  _AdminDashboardViewState createState() => _AdminDashboardViewState();
}

class _AdminDashboardViewState extends State<AdminDashboardView>
    with AdminDashboardMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rent a Car Admin Dashboard'),
        actions: [AuthButton(buttonName: 'Admin Oluştur', onPressed: (){
          const CreateAdminViewRoute().go(context);
        })],
      ),
      
      drawer: AdminDashboardDrawer(onItemSelected: onItemSelected),
      body: pages[selectedIndex],
    );
  }
}
