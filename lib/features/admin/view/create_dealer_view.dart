import 'package:flutter/material.dart';
import 'package:rent_a_car/core/product_network_manager.dart';
import 'package:rent_a_car/features/auth/widgets/auth_button.dart';
import 'package:rent_a_car/product/initialize/router/route_tree.dart';
import 'package:rent_a_car/product/initialize/service/models/dealership/create_dealership_request.dart';
import 'package:rent_a_car/product/initialize/service/rent_a_car_service.dart';
import 'package:rent_a_car/product/widgets/page/page_padding.dart';
import 'package:rent_a_car/product/widgets/widget_sizes.dart';

class CreateDealerView extends StatefulWidget {
  const CreateDealerView({super.key});

  @override
  State<CreateDealerView> createState() => _CreateDealerViewState();
}

class _CreateDealerViewState extends State<CreateDealerView> {
  // TextEditingController'lar
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  late final RentACarService _rentACarService;

  @override
  initState() {
    super.initState();
    _rentACarService = RentACarService(networkManager: ProductNetworkManager());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const PagePadding.all(),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Name
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'İsim',
                    hintText: 'Bayi İsmi',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen bayi ismi giriniz.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: WidgetSizes.spacingM),

                // Address
                TextFormField(
                  controller: addressController,
                  decoration: const InputDecoration(
                    labelText: 'Adres',
                    hintText: 'Adres giriniz.',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen adres giriniz.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: WidgetSizes.spacingM),

                // Phone
                TextFormField(
                  controller: phoneController,
                  decoration: const InputDecoration(
                    labelText: 'Telefon',
                    hintText: 'Telefon numarasını giriniz.',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen telefon numarasını giriniz.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: WidgetSizes.spacingM),

                // Create button
                AuthButton(
                  onPressed: () async {
                    if (_formKey.currentState?.validate() ?? false) {
                      await _rentACarService
                          .createDealerShip(CreateDealerShipRequest(
                        name: nameController.text,
                        address: addressController.text,
                        phone: phoneController.text,
                      ));
                      const AdminDashboardViewRoute().go(context);
                    }
                  },
                  buttonName: 'Create Dealer',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
