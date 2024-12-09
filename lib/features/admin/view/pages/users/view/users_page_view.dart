import 'package:flutter/material.dart';
import 'package:rent_a_car/features/admin/view/pages/users/view/mixin/users_page_view_mixin.dart';
import 'package:rent_a_car/features/admin/view/pages/users/widgets/user_card.dart';

class UsersPageView extends StatefulWidget {
  const UsersPageView({super.key});

  @override
  State<UsersPageView> createState() => _UsersPageViewState();
}

class _UsersPageViewState extends State<UsersPageView> with UsersPageViewMixin {
  @override
  Widget build(BuildContext context) {
    if (users == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (users!.isEmpty) {
      return const Center(
        child: Text('No users available.'),
      );
    }

    return ListView.builder(
      itemCount: users!.length,
      itemBuilder: (BuildContext context, int index) {
        final user = users![index];
        return UserCard(user: user);
      },
    );
  }
}
