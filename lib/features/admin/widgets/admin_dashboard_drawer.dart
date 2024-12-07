import 'package:flutter/material.dart';
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
            text: 'Cars',
            index: 0,
          ),
          _buildDrawerItem(
            icon: Icons.people,
            text: 'Users',
            index: 1,
          ),
          _buildDrawerItem(
            icon: Icons.book_online,
            text: 'Reservations',
            index: 2,
          ),
          _buildDrawerItem(
            icon: Icons.payment,
            text: 'Payments',
            index: 3,
          ),

          const Spacer(),
          const Divider(),

          _buildDrawerItem(
            icon: Icons.logout,
            text: 'Logout',
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
  }) {
    return Padding(
      padding: const PagePadding.verticalLow12Symmetric(),
      child: ListTile(
        leading: Icon(icon),
        title: Text(text),
        onTap: () {
          // Close the drawer
          // You might want to use Navigator.pop(context) if this is in a BuildContext
          onItemSelected(index);
        },
      ),
    );
  }
}
