import 'package:flutter/material.dart';
import 'package:rent_a_car/features/home/view/mixin/home_view_mixin.dart';
import 'package:rent_a_car/features/home/widgets/car_card.dart';
import 'package:rent_a_car/features/home/widgets/filter_button.dart';
import 'package:rent_a_car/product/initialize/router/route_tree.dart';
import 'package:rent_a_car/product/widgets/widget_sizes.dart';

final class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with HomeViewMixin {
  String selectedSort = 'Varsayılan'; // Default sort option

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(WidgetSizes.spacingM),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Rent A Car',
                    style: TextStyle(
                      color: Colors.lightBlue,
                      fontSize: WidgetSizes.spacingXxl7,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(),
                  const Text('Ara'),
                  const SearchBar(),
                  const SizedBox(height: WidgetSizes.spacingM),

                  // Price range (Min and Max)
                  const Text('Fiyat Aralığı'),
                  PriceRange(
                    minPriceController: minPriceController,
                    maxPriceController: maxPriceController,
                  ),
                  const SizedBox(height: WidgetSizes.spacingM),

                  // Fuel Type Dropdown
                  const Text('Yakıt Tipi'),
                  DropdownButtonFormField<String>(
                    value: selectedFuelType,
                    onChanged: (value) {
                      setState(() {
                        selectedFuelType = value ?? 'Hepsi';
                      });
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    items: [
                      'Hepsi',
                      'Benzin',
                      'Dizel',
                      'Elektrik',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: WidgetSizes.spacingM),

                  // Sorting Dropdown
                  const Text('Sıralama'),
                  DropdownButtonFormField<String>(
                    value: selectedSort,
                    onChanged: (value) {
                      setState(() {
                        selectedSort = value ?? 'Varsayılan';
                      });
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    items: [
                      'Varsayılan',
                      'Fiyat (Artan)',
                      'Fiyat (Azalan)',
                      'İsim (A-Z)',
                      'İsim (Z-A)',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: WidgetSizes.spacingM),

                  const Spacer(),
                  // Filter button
                  const _FilterButton(),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: ListView.builder(
              itemCount: cars?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                if (cars == null) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return CarCard(
                  onPressed: () {
                    ReservationViewRoute(cars![index]).go(context);
                    print(cars![index]);
                  },
                  car: cars![index],
                  imageUrl: 'assets/images/fiat-egea.png',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterButton extends StatelessWidget {
  const _FilterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FilterButton(
            buttonName: 'Filtrele',
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}

class PriceRange extends StatelessWidget {
  const PriceRange({
    required this.minPriceController,
    required this.maxPriceController,
    super.key,
  });

  final TextEditingController minPriceController;
  final TextEditingController maxPriceController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: TextFormField(
            controller: minPriceController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Min',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              // Backend price filtering logic (not implemented here)
            },
          ),
        ),
        const SizedBox(width: 10),
        // Max Price
        SizedBox(
          width: 100,
          child: TextFormField(
            controller: maxPriceController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Max',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              // Backend price filtering logic (not implemented here)
            },
          ),
        ),
      ],
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(),
      ),
      onChanged: (value) {
        // Backend search logic (not implemented here)
      },
    );
  }
}
