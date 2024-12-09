import 'package:flutter/material.dart';
import 'package:rent_a_car/product/initialize/router/route_tree.dart';
import 'package:rent_a_car/product/widgets/page/page_padding.dart';

final class AdminDashboardDrawer extends StatelessWidget {
  const AdminDashboardDrawer({required this.onItemSelected, super.key});
  final Function(int) onItemSelected;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Drawer Menu Items
          _buildDrawerItem(
            icon: Icons.directions_car,
            text: 'Araçlar',
            index: 0,
          ),
          _buildDrawerItem(
            icon: Icons.people,
            text: 'Kullanıcılar',
            index: 1,
          ),
          _buildDrawerItem(
            icon: Icons.book_online,
            text: 'Reservasyonlar',
            index: 2,
          ),
          _buildDrawerItem(
            icon: Icons.payment,
            text: 'Ödemeler',
            index: 3,
          ),

          const Spacer(),
          const Divider(),

          _buildDrawerItem(
            onTap: () => const AuthViewRoute().go(context),
            icon: Icons.logout,
            text: 'Çıkış Yap',
            index: 5,
          ),
        ],
      ),
    );
  }

  // Helper method to build drawer list items
  Padding _buildDrawerItem({
    required IconData icon,
    required String text,
    required int index,
    VoidCallback? onTap,
  }) {
    return Padding(
      padding: const PagePadding.verticalLow12Symmetric(),
      child: ListTile(
        leading: Icon(icon),
        title: Text(text),
        onTap: onTap ??
            () {
              // Ensure index is valid before calling onItemSelected
              if (index >= 0) {
                onItemSelected(index);
              }
            },
      ),
    );
  }
}
