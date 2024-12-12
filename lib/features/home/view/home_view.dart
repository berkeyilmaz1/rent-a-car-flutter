import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_a_car/features/auth/widgets/auth_button.dart';
import 'package:rent_a_car/features/home/view/mixin/home_view_mixin.dart';
import 'package:rent_a_car/features/home/widgets/car_card.dart';
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
                  Text('Sıralama'),
                  SizedBox(height: 5),
                  buildSortDropdown(),
                  SizedBox(height: 20),
                  Text('Fiyat Aralığı'),
                  buildPriceRangeSlider(),
                  SizedBox(height: 20),
                  buildFuelTypeDropdown(),
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
              itemCount: filteredCars.length,
              itemBuilder: (BuildContext context, int index) {
                if (cars == null) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (filteredCars[index].availabilityStatus == false) {
                  return const SizedBox.shrink();
                }
                return CarCard(
                  dayCount: dayCount,
                  onPressed: () {
                    ReservationViewRoute(
                      $extra: {
                        'car': filteredCars[index],
                        'startDate': startDate,
                        'endDate': endDate,
                        'dayCount': dayCount,
                        'startDateWithTime': startDateWithTime,
                        'endDateWithTime': endDateWithTime,
                      },
                    ).go(context);
                  },
                  car: filteredCars[index],
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
