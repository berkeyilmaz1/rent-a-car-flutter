import 'package:flutter/material.dart';
import 'package:rent_a_car/core/product_network_manager.dart';
import 'package:rent_a_car/product/initialize/service/models/car/car.dart';
import 'package:rent_a_car/product/initialize/service/models/car/update_car_request.dart';
import 'package:rent_a_car/product/initialize/service/rent_a_car_service.dart';
import 'package:rent_a_car/product/utils/formatters/formatters.dart';

final class AdminCarCard extends StatefulWidget {
  const AdminCarCard({
    required this.imageUrl,
    required this.car,
    required this.onUpdate,
    super.key,
  });

  final String imageUrl;
  final Car car;
  final VoidCallback onUpdate;

  @override
  // ignore: library_private_types_in_public_api
  _AdminCarCardState createState() => _AdminCarCardState();
}

class _AdminCarCardState extends State<AdminCarCard> {
  late String? _fuelType;
  late String? _gearType;
  late bool? availabilityStatus;
  late final RentACarService _rentACarService;

  late TextEditingController _brandController;
  late TextEditingController _modelController;
  late TextEditingController _licensePlateController;
  late TextEditingController _yearController;

  late TextEditingController _kilometerController;
  late TextEditingController _dailyPriceController;

  @override
  void initState() {
    super.initState();
    _rentACarService = RentACarService(networkManager: ProductNetworkManager());
    _fuelType = CarFormatter.fuelTypeFormat(widget.car.fuelType ?? 0);
    _gearType = CarFormatter.gearTypeFormat(widget.car.gearType ?? 0);
    initControllers();
  }

  void initControllers() {
    availabilityStatus = widget.car.availabilityStatus;
    _brandController = TextEditingController(text: widget.car.brand);
    _modelController = TextEditingController(text: widget.car.model);
    _licensePlateController =
        TextEditingController(text: widget.car.licensePlate);

    _yearController = TextEditingController(text: widget.car.year?.toString());
    _kilometerController =
        TextEditingController(text: widget.car.kilometer?.toString());
    _dailyPriceController =
        TextEditingController(text: widget.car.pricePerDay?.toString());
  }

  Future<void> saveOnPressed(UpdateCarRequest car, String vinNumber) async {
    await _rentACarService.updateCar(car, vinNumber);
    widget.onUpdate();
  }

  Future<void> deleteOnPressed(String vinNumber) async {
    await _rentACarService.deleteCar(vinNumber);
    widget.onUpdate();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.surface,
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      shadowColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
      child: ExpansionTile(
        title: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                widget.imageUrl,
                width: 120,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.car.brand} ${widget.car.model}',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Plaka: ${widget.car.licensePlate} | VIN: ${widget.car.vinNumber}',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 14,
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.7),
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _buildTextField(
                        'Marka',
                        _brandController,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildTextField(
                        'Model',
                        _modelController,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: _buildTextField(
                        'Plaka',
                        _licensePlateController,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildTextField(
                        'Yıl',
                        _yearController,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildTextField(
                        'Kilometre',
                        _kilometerController,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildTextField(
                        'Günlük Fiyat',
                        _dailyPriceController,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildDropdownField(
                        'Müsaitlik Durumu',
                        // ignore: use_if_null_to_convert_nulls_to_bools
                        availabilityStatus == true ? 'Müsait' : 'Kirada',
                        ['Müsait', 'Kirada'],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: _buildDropdownField(
                        'Yakıt Tipi',
                        _fuelType,
                        ['Benzin', 'Dizel', 'Elektrik'],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildDropdownField(
                        'Vites Tipi',
                        _gearType,
                        ['Manuel', 'Otomatik'],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        saveOnPressed(
                          UpdateCarRequest(
                            availabilityStatus: availabilityStatus,
                            brand: _brandController.text,
                            model: _modelController.text,
                            licensePlate: _licensePlateController.text,
                            year: int.tryParse(_yearController.text),
                            kilometer: int.tryParse(_kilometerController.text),
                            pricePerDay:
                                int.tryParse(_dailyPriceController.text),
                            fuelType: CarFormatter.fuelTypeFromString(
                              _fuelType ?? '',
                            ),
                            gearType: CarFormatter.gearTypeFromString(
                              _gearType ?? '',
                            ),
                            seatCount: widget.car.seatCount,
                            minAge: widget.car.minAge,
                            dealershipId: widget.car.dealershipId,
                          ),
                          widget.car.vinNumber ?? '',
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Güncelle',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () =>
                          deleteOnPressed(widget.car.vinNumber ?? ''),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.error,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Sil',
                        style: TextStyle(color: Colors.white),
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

  Widget _buildDropdownField(
    String label,
    String? value,
    List<String> options,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: DropdownButtonFormField<String>(
        value: value,
        onChanged: (newValue) {
          setState(() {
            if (label == 'Yakıt Tipi') {
              _fuelType = newValue;
            } else if (label == 'Vites Tipi') {
              _gearType = newValue;
            }
          });
        },
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        items: options.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
