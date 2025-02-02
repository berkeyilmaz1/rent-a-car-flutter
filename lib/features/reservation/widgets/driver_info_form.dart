import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:rent_a_car/product/initialize/providers/user_provider.dart';
import 'package:rent_a_car/product/initialize/service/models/user/user.dart';
import 'package:rent_a_car/product/utils/border_radius_general.dart';
import 'package:rent_a_car/product/widgets/page/page_padding.dart';
import 'package:rent_a_car/product/widgets/widget_sizes.dart';

final class DriverInfoForm extends StatefulWidget {
  const DriverInfoForm({
    super.key,
  });

  @override
  State<DriverInfoForm> createState() => _DriverInfoFormState();
}

class _DriverInfoFormState extends State<DriverInfoForm> {
  late final TextEditingController _nameController;
  late final TextEditingController _lastnameController;
  late final TextEditingController _birthDateController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneNumberController;
  late final TextEditingController _licenseNumberController;
  late final TextEditingController _addressController;

  @override
  void initState() {
    super.initState();
  }

  void _initializeControllers({User? user}) {
    _nameController = TextEditingController(text: user?.name ?? '');
    _lastnameController = TextEditingController(text: user?.lastname ?? '');
    _birthDateController = TextEditingController(
      text: DateFormat('dd MMM', 'tr_TR')
          .format(user?.birthDate ?? DateTime.now()),
    );
    _emailController = TextEditingController(text: user?.email ?? '');
    _phoneNumberController =
        TextEditingController(text: user?.phoneNumber ?? '');
    _licenseNumberController =
        TextEditingController(text: user?.licenseNumber ?? '');
    _addressController = TextEditingController(text: user?.address ?? '');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final user = Provider.of<UserProvider>(context, listen: false).user;
    _initializeControllers(user: user);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _lastnameController.dispose();
    _birthDateController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _licenseNumberController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: WidgetSizes.spacingXs,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadiusGeneral.cardLow(),
      ),
      child: Padding(
        padding: const PagePadding.all(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [Icon(Icons.person), Text('Kişisel Bilgiler')],
            ),
            const SizedBox(height: WidgetSizes.spacingM),

            // Ad ve Soyad
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    readOnly: true,
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Ad',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: WidgetSizes.spacingXs),
                Expanded(
                  child: TextFormField(
                    readOnly: true,
                    controller: _lastnameController,
                    decoration: const InputDecoration(
                      labelText: 'Soyad',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: WidgetSizes.spacingM),

            // Doğum Tarihi
            TextFormField(
              readOnly: true,
              controller: _birthDateController,
              decoration: const InputDecoration(
                labelText: 'Doğum Tarihi (GG/AA/YYYY)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: WidgetSizes.spacingM),

            // E-posta
            TextFormField(
              readOnly: true,
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'E-posta adresi',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: WidgetSizes.spacingM),

            // Telefon
            TextFormField(
              readOnly: true,
              controller: _phoneNumberController,
              decoration: const InputDecoration(
                labelText: 'Cep Telefonu',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: WidgetSizes.spacingM),

            // Sürücü Belgesi Numarası
            TextFormField(
              readOnly: true,
              controller: _licenseNumberController,
              decoration: const InputDecoration(
                labelText: 'Sürücü Belgesi Numarası',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: WidgetSizes.spacingM),

            // Adres
            TextFormField(
              readOnly: true,
              controller: _addressController,
              decoration: const InputDecoration(
                labelText: 'Adres',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
