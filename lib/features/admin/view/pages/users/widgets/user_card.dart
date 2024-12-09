import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rent_a_car/features/admin/view/pages/payments/widgets/payment_button.dart';
import 'package:rent_a_car/features/admin/view/pages/payments/widgets/payment_card.dart';
import 'package:rent_a_car/product/initialize/service/models/user/user.dart';
import 'package:rent_a_car/product/widgets/page/page_padding.dart';
import 'package:rent_a_car/product/widgets/widget_sizes.dart';

final class UserCard extends StatelessWidget {
  const UserCard({
    required this.user,
    super.key,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: WidgetSizes.spacingXs,
        horizontal: WidgetSizes.spacingM,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 6,
      shadowColor: Colors.black.withOpacity(0.1),
      child: Padding(
        padding: const PagePadding.allLow(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardRow(
              label: 'Kullanıcı ID:',
              value: user.id.toString(),
            ),
            CardRow(
              label: 'İsim - Soyisim:',
              value: '${user.name} ${user.lastname}',
            ),
            CardRow(
              label: 'E-posta:',
              value: user.email ?? '',
            ),
            CardRow(
              label: 'Telefon:',
              value: user.phoneNumber ?? '',
            ),
            CardRow(
              label: 'Doğum Tarihi:',
              value: DateFormat('dd MMM', 'tr_TR')
                  .format(user.birthDate ?? DateTime.now()),
            ),
            CardRow(
              label: 'Sürücü Seri Numarası:',
              value: user.licenseNumber ?? '',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AdminButton(
                  color: Colors.blue,
                  label: 'Güncelle',
                  onPressed: () {},
                ),
                const SizedBox(width: WidgetSizes.spacingM),
                AdminButton(
                  color: Colors.red,
                  label: 'Sil',
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
