import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_a_car/product/initialize/providers/user_provider.dart';
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
    final user = Provider.of<UserProvider>(context).user;
    _nameController = TextEditingController(text: user?.name ?? '');
    _lastnameController = TextEditingController(text: user?.lastname ?? '');
    _birthDateController =
        TextEditingController(text: user?.birthDate.toString() ?? '');
    _emailController = TextEditingController(text: user?.email ?? '');
    _phoneNumberController =
        TextEditingController(text: user?.phoneNumber ?? '');
    _licenseNumberController =
        TextEditingController(text: user?.licenseNumber ?? '');
    _addressController = TextEditingController(text: user?.address ?? '');
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
              controller: _birthDateController,
              decoration: const InputDecoration(
                labelText: 'Doğum Tarihi (GG/AA/YYYY)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: WidgetSizes.spacingM),

            // E-posta
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'E-posta adresi',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: WidgetSizes.spacingM),

            // Telefon
            TextFormField(
              controller: _phoneNumberController,
              decoration: const InputDecoration(
                labelText: 'Cep Telefonu',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: WidgetSizes.spacingM),

            // Sürücü Belgesi Numarası
            TextFormField(
              controller: _licenseNumberController,
              decoration: const InputDecoration(
                labelText: 'Sürücü Belgesi Numarası',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: WidgetSizes.spacingM),

            // Adres
            TextFormField(
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
