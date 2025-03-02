import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rent_a_car/features/admin/view/mixin/admin_dashboard_mixin.dart';
import 'package:rent_a_car/features/admin/widgets/admin_dashboard_drawer.dart';
import 'package:rent_a_car/product/initialize/localization/locale_keys.g.dart';
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
        title: const Text(LocaleKeys.admin_adminDashboard).tr(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          const CreateAdminRoute().go(context);
        },
      ),
      drawer: AdminDashboardDrawer(onItemSelected: onItemSelected),
      body: pages[selectedIndex],
    );
  }
}
