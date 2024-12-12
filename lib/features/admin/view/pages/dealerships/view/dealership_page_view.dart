import 'package:flutter/material.dart';
import 'package:rent_a_car/features/admin/view/pages/dealerships/view/mixin/dealership_page_mixin.dart';
import 'package:rent_a_car/features/admin/view/pages/dealerships/widgets/dealer_card.dart';
import 'package:rent_a_car/features/auth/widgets/auth_button.dart';

class DealerShipPageView extends StatefulWidget {
  const DealerShipPageView({super.key});

  @override
  State<DealerShipPageView> createState() => _DealerShipPageViewState();
}

class _DealerShipPageViewState extends State<DealerShipPageView>
    with DealershipPageMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: navigateToCreateDealer,
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            'Bayi Oluştur',
            style: TextStyle(color: Colors.white),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: dealers?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              if (dealers == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return DealerCard(
                dealer: dealers![index],
                onUpdate: fetchDealers,
              );
            },
          ),
        ),
      ],
    );
  }
}
