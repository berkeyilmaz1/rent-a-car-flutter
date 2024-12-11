import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_a_car/features/auth/widgets/auth_button.dart';
import 'package:rent_a_car/features/home/view/mixin/home_view_mixin.dart';
import 'package:rent_a_car/features/home/widgets/car_card.dart';
import 'package:rent_a_car/features/home/widgets/filter_button.dart';
import 'package:rent_a_car/product/initialize/providers/user_provider.dart';
import 'package:rent_a_car/product/initialize/router/route_tree.dart';
import 'package:rent_a_car/product/widgets/widget_sizes.dart';

part '../widgets/home_view_components.dart';

final class HomeView extends StatefulWidget {
  const HomeView({
    required this.parameters,
    super.key,
  });
  final Map<String, dynamic> parameters;
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
                  const HomeViewTitle(),
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

                  FilterButton(
                    buttonName: 'Filtrele',
                    onPressed: () {},
                  ),
                  Spacer(),
                  const Divider(),
                  AuthButton(
                    buttonName: 'Çıkış Yap',
                    onPressed: () {
                      Provider.of<UserProvider>(context, listen: false)
                          .clearUser();
                      const AuthViewRoute().go(context);
                    },
                  )
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
                  dayCount: dayCount,
                  onPressed: () {
                    ReservationViewRoute(
                      $extra: {
                        'car': cars![index],
                        'startDate': startDate,
                        'endDate': endDate,
                        'dayCount': dayCount,
                        'startDateWithTime': startDateWithTime,
                        'endDateWithTime': endDateWithTime,
                      },
                    ).go(context);
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
