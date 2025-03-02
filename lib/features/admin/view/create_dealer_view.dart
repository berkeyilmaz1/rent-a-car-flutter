import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rent_a_car/core/product_network_manager.dart';
import 'package:rent_a_car/features/auth/widgets/auth_button.dart';
import 'package:rent_a_car/product/initialize/localization/locale_keys.g.dart';
import 'package:rent_a_car/product/initialize/router/route_tree.dart';
import 'package:rent_a_car/product/initialize/service/models/dealership/create_dealership_request.dart';
import 'package:rent_a_car/product/initialize/service/rent_a_car_service.dart';
import 'package:rent_a_car/product/widgets/page/page_padding.dart';
import 'package:rent_a_car/product/widgets/widget_sizes.dart';

part 'widgets/create_button.dart';
part 'widgets/dealer_address_field.dart';
part 'widgets/dealer_name_field.dart';
part 'widgets/dealer_phone_field.dart';

class CreateDealerView extends StatefulWidget {
  const CreateDealerView({super.key});

  @override
  State<CreateDealerView> createState() => _CreateDealerViewState();
}

class _CreateDealerViewState extends State<CreateDealerView> {
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
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DealerNameField(),
                SizedBox(height: WidgetSizes.spacingM),
                DealerAddressField(),
                SizedBox(height: WidgetSizes.spacingM),
                DealerPhoneField(),
                SizedBox(height: WidgetSizes.spacingM),
                CreateButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
