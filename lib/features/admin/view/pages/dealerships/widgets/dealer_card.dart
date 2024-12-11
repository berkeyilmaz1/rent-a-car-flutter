import 'package:flutter/material.dart';
import 'package:rent_a_car/core/product_network_manager.dart';
import 'package:rent_a_car/product/initialize/service/models/dealership/create_dealership_request.dart';
import 'package:rent_a_car/product/initialize/service/models/dealership/dealership.dart';
import 'package:rent_a_car/product/initialize/service/rent_a_car_service.dart';
import 'package:rent_a_car/product/widgets/page/page_padding.dart';
import 'package:rent_a_car/product/widgets/widget_sizes.dart';

final class DealerCard extends StatefulWidget {
  const DealerCard({
    required this.dealer,
    required this.onUpdate,
    super.key,
  });

  final DealerShip dealer;

  final VoidCallback onUpdate;

  @override
  State<DealerCard> createState() => _DealerCardState();
}

class _DealerCardState extends State<DealerCard> {
  late final TextEditingController _nameController;
  late final TextEditingController _addressController;
  late final TextEditingController _phoneController;

  late final RentACarService _rentACarService;

  Future<void> saveOnPressed(
    CreateDealerShipRequest car,
    int id,
  ) async {
    await _rentACarService.updateDealerShip(car, id);
    widget.onUpdate();
  }

  Future<void> deleteOnPressed(int id) async {
    await _rentACarService.deleteDealerShip(id);
    widget.onUpdate();
  }

  @override
  initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.dealer.name);
    _addressController = TextEditingController(text: widget.dealer.address);
    _phoneController = TextEditingController(text: widget.dealer.phone);
    _rentACarService = RentACarService(networkManager: ProductNetworkManager());
  }

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
      child: ExpansionTile(
        title: Padding(
          padding: const PagePadding.allLow(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.location_city_rounded),
                  const SizedBox(width: WidgetSizes.spacingXs),
                  Text(
                    widget.dealer.name ?? 'Bayi Adı Yok',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                  ),
                ],
              ),
              const Divider(),
              _buildDetailRow(
                'Adres',
                widget.dealer.address ?? 'Adres Yok',
              ),
              _buildDetailRow(
                'Telefon',
                widget.dealer.phone ?? 'Telefon Yok',
              ),
             
            ],
          ),
        ),
        children: [
          Padding(
            padding: const PagePadding.allLow(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextField('Bayi İsmi', _nameController),
                _buildTextField('Adres', _addressController),
                _buildTextField('Telefon', _phoneController),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.blue),
                      onPressed: () => saveOnPressed(
                        CreateDealerShipRequest(
                          name: _nameController.text,
                          address: _addressController.text,
                          phone: _phoneController.text,
                        ),
                        widget.dealer.id ?? 0,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => deleteOnPressed(
                        widget.dealer.id ?? 0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController? controller,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: WidgetSizes.spacingXs),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              value,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(),
            ),
          ),
        ],
      ),
    );
  }
}
