import 'package:flutter/material.dart';
import 'package:rent_a_car/product/initialize/service/models/car/car.dart';

final class AdminCarCard extends StatefulWidget {
  const AdminCarCard({
    required this.imageUrl,
    required this.car,
    super.key,
  });

  final String imageUrl;
  final Car car;

  @override
  _AdminCarCardState createState() => _AdminCarCardState();
}

class _AdminCarCardState extends State<AdminCarCard> {
  late String? _fuelType;
  late String? _gearType;

  @override
  void initState() {
    super.initState();
    _fuelType = widget.car.fuelType == 1
        ? 'Benzin'
        : widget.car.fuelType == 2
            ? 'Dizel'
            : 'Elektrik';
    _gearType = widget.car.gearType == 1
        ? 'Manuel'
        : widget.car.gearType == 2
            ? 'Otomatik'
            : null;
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
                      child: _buildTextField('Marka', widget.car.brand),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildTextField('Model', widget.car.model),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: _buildTextField('Plaka', widget.car.licensePlate),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child:
                          _buildTextField('Yıl', widget.car.year?.toString()),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildTextField(
                        'Kilometre',
                        widget.car.kilometer?.toString(),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildTextField(
                        'Günlük Fiyat',
                        widget.car.kilometer?.toString(),
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
                        ['Benzin', 'Dizel'],
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
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Kaydet',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {},
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

  Widget _buildTextField(String label, String? initialValue) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: TextFormField(
        initialValue: initialValue,
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
