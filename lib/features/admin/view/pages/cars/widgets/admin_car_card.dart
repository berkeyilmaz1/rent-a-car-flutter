import 'package:flutter/material.dart';
import 'package:rent_a_car/product/initialize/service/models/car/car.dart';

class AdminCarCard extends StatefulWidget {
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
  late bool _isExpanded;
  late TextEditingController _brandController;
  late TextEditingController _modelController;
  late TextEditingController _licensePlateController;
  late TextEditingController _yearController;
  late TextEditingController _kilometerController;

  @override
  void initState() {
    super.initState();
    _isExpanded = false;
    _brandController = TextEditingController(text: widget.car.brand);
    _modelController = TextEditingController(text: widget.car.model);
    _licensePlateController =
        TextEditingController(text: widget.car.licensePlate);
    _yearController = TextEditingController(text: widget.car.year?.toString());
    _kilometerController =
        TextEditingController(text: widget.car.kilometer?.toString());
  }

  @override
  void dispose() {
    _brandController.dispose();
    _modelController.dispose();
    _licensePlateController.dispose();
    _yearController.dispose();
    _kilometerController.dispose();
    super.dispose();
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
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
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
                const SizedBox(width: 16),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _isExpanded = !_isExpanded;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                      ),
                      child: Text(
                        _isExpanded ? 'Kapat' : 'Düzenle',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            if (_isExpanded)
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UpdateTextField(
                        label: 'Marka', controller: _brandController),
                    UpdateTextField(
                        label: 'Model', controller: _modelController),
                    UpdateTextField(
                        label: 'Plaka', controller: _licensePlateController),
                    UpdateTextField(label: 'Yıl', controller: _yearController),
                    UpdateTextField(
                        label: 'Kilometre', controller: _kilometerController),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'Kaydet',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.error,
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
      ),
    );
  }
}

final class UpdateTextField extends StatelessWidget {
  const UpdateTextField({
    required this.label,
    required this.controller,
    super.key,
  });
  final String label;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: TextField(
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
}
