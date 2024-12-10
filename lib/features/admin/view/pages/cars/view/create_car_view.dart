import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rent_a_car/core/product_network_manager.dart';
import 'package:rent_a_car/product/initialize/router/route_tree.dart';
import 'package:rent_a_car/product/initialize/service/models/car/create_car_request.dart';
import 'package:rent_a_car/product/initialize/service/models/dealership/dealership.dart';
import 'package:rent_a_car/product/initialize/service/rent_a_car_service.dart';

class CreateCarView extends StatefulWidget {
  const CreateCarView({super.key});

  @override
  _CreateCarViewState createState() => _CreateCarViewState();
}

class _CreateCarViewState extends State<CreateCarView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _vinController = TextEditingController();
  final TextEditingController _brandController = TextEditingController();
  final TextEditingController _modelController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _pricePerDayController = TextEditingController();
  final TextEditingController _minAgeController = TextEditingController();
  final TextEditingController _kilometerController = TextEditingController();
  final TextEditingController _seatCountController = TextEditingController();

  String? _fuelType;
  String? _gearType;
  bool _availabilityStatus = true;
  int? _dealershipId;
  late final RentACarService _rentAService;

  List<DealerShip>? _dealerships = [];

  @override
  void initState() {
    super.initState();
    _rentAService = RentACarService(networkManager: ProductNetworkManager());
    _fetchDealerships();
  }

  Future<void> _fetchDealerships() async {
    final response = await _rentAService.getAllDealership();
    setState(() {
      _dealerships = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Araç Oluştur'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // VIN Numarası
                TextFormField(
                  controller: _vinController,
                  decoration: const InputDecoration(labelText: 'VIN Numarası'),
                  maxLength: 17,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length != 17) {
                      return 'Geçerli bir VIN numarası giriniz';
                    }
                    return null;
                  },
                ),
                // Marka
                TextFormField(
                  controller: _brandController,
                  decoration: const InputDecoration(labelText: 'Marka'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen marka giriniz';
                    }
                    return null;
                  },
                ),
                // Model
                TextFormField(
                  controller: _modelController,
                  decoration: const InputDecoration(labelText: 'Model'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen model giriniz';
                    }
                    return null;
                  },
                ),
                // Yıl
                TextFormField(
                  controller: _yearController,
                  decoration: const InputDecoration(labelText: 'Yıl'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen yıl giriniz';
                    }
                    return null;
                  },
                ),
                // Yakıt Tipi Dropdown
                DropdownButtonFormField<String>(
                  value: _fuelType,
                  decoration: const InputDecoration(labelText: 'Yakıt Tipi'),
                  items: const [
                    DropdownMenuItem(value: 'petrol', child: Text('Benzin')),
                    DropdownMenuItem(value: 'diesel', child: Text('Dizel')),
                    DropdownMenuItem(
                      value: 'electric',
                      child: Text('Elektrik'),
                    ),
                    // Daha fazla yakıt tipi ekleyebilirsiniz
                  ],
                  onChanged: (value) {
                    setState(() {
                      _fuelType = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Lütfen bir yakıt tipi seçiniz';
                    }
                    return null;
                  },
                ),
                // Vites Tipi Dropdown
                DropdownButtonFormField<String>(
                  value: _gearType,
                  decoration: const InputDecoration(labelText: 'Vites Tipi'),
                  items: const [
                    DropdownMenuItem(value: 'manual', child: Text('Manuel')),
                    DropdownMenuItem(
                      value: 'automatic',
                      child: Text('Otomatik'),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _gearType = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Lütfen bir vites tipi seçiniz';
                    }
                    return null;
                  },
                ),
                // Uygunluk Durumu Checkbox
                Row(
                  children: [
                    Checkbox(
                      value: _availabilityStatus,
                      onChanged: (value) {
                        setState(() {
                          _availabilityStatus = value!;
                        });
                      },
                    ),
                    const Text('Uygun'),
                  ],
                ),
                // Satıcı Dropdown
                if (_dealerships == null)
                  const CircularProgressIndicator()
                else if (_dealerships!.isEmpty)
                  const CircularProgressIndicator()
                else
                  DropdownButtonFormField<int>(
                    value: _dealershipId,
                    decoration: const InputDecoration(labelText: 'Satıcı'),
                    items: _dealerships!.map((dealership) {
                      return DropdownMenuItem<int>(
                        value: dealership.id,
                        child: Text(dealership.name ?? ''),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _dealershipId = value;
                      });
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Lütfen bir satıcı seçiniz';
                      }
                      return null;
                    },
                  ),
                // Günlük Fiyat
                TextFormField(
                  controller: _pricePerDayController,
                  decoration: const InputDecoration(labelText: 'Günlük Fiyat'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen günlük fiyat giriniz';
                    }
                    return null;
                  },
                ),
                // Min Yaş
                TextFormField(
                  controller: _minAgeController,
                  decoration: const InputDecoration(labelText: 'Minimum Yaş'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen minimum yaş giriniz';
                    }
                    return null;
                  },
                ),
                // Kilometre
                TextFormField(
                  controller: _kilometerController,
                  decoration: const InputDecoration(labelText: 'Kilometre'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen kilometre giriniz';
                    }
                    return null;
                  },
                ),
                // Koltuk Sayısı
                TextFormField(
                  controller: _seatCountController,
                  decoration: const InputDecoration(labelText: 'Koltuk Sayısı'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen koltuk sayısını giriniz';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Geçerli bir sayı giriniz';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState?.validate() ?? false) {
                      final carRequest = CreateCarRequest(
                        vinNumber: _vinController.text,
                        brand: _brandController.text,
                        model: _modelController.text,
                        year: int.tryParse(_yearController.text),
                        fuelType: _fuelType == 'petrol'
                            ? 1
                            : _fuelType == 'diesel'
                                ? 2
                                : 3, // Örnek: benzin için 1
                        gearType: _gearType == 'manual'
                            ? 1
                            : 2, // Örnek: manuel için 1
                        licensePlate:
                            'Plaka', // Gerekirse plaka alanını ekleyebilirsiniz
                        seatCount:
                            4, // Örnek koltuk sayısı, ihtiyaçlarınıza göre ayar yapabilirsiniz
                        pricePerDay: int.tryParse(_pricePerDayController.text),
                        availabilityStatus: _availabilityStatus,
                        minAge: int.tryParse(_minAgeController.text),
                        kilometer: int.tryParse(_kilometerController.text),
                        dealershipId: _dealershipId,
                      );
                      await _rentAService.createCar(carRequest);
                      const AdminDashboardViewRoute().go(context);
                    }
                  },
                  child: const Text('Araç Oluştur'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
