part of '../view/selection_view.dart';

final class SelectionCard extends StatelessWidget {
  const SelectionCard({
    required this.onPressed,
    required this.formattedStartDate,
    required this.formattedEndDate,
    super.key,
  });
  final VoidCallback onPressed;
  final String formattedStartDate;
  final String formattedEndDate;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: WidgetSizes.spacingXSs,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(WidgetSizes.spacingXSs),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              flex: 3,
              child: DealerShipDropdown(),
            ),
            const SizedBox(width: WidgetSizes.spacingXSs),
            Expanded(
              child: TextButton(
                onPressed: onPressed,
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(WidgetSizes.spacingXSs),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(formattedStartDate),
                    const Text(' - '),
                    Text(formattedEndDate),
                  ],
                ),
              ),
            ),
            const SizedBox(width: WidgetSizes.spacingXSs),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(WidgetSizes.spacingXSs),
                  ),
                ),
                child: const Text('Teklifleri Göster'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DealerShipDropdown extends StatefulWidget {
  const DealerShipDropdown({super.key});

  @override
  State<DealerShipDropdown> createState() => _DealerShipDropdownState();
}

class _DealerShipDropdownState extends State<DealerShipDropdown> {
  late List<String?> dealerShips = [];
  late final RentACarService _rentACarService;
  String? selectedDealerShip;
  @override
  void initState() {
    super.initState();
    _rentACarService = RentACarService(networkManager: ProductNetworkManager());
    fetchDealerships();
  }

  Future<void> fetchDealerships() async {
    // Fetch dealerships
    final response = await _rentACarService.getAllDealership();
    if (response == null) return;
    setState(() {
      dealerShips = response.map((e) => e.name).whereType<String>().toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      items: dealerShips.map(
        (dealer) {
          return DropdownMenuItem<String>(
            value: dealer,
            child: Text(dealer ?? ''),
          );
        },
      ).toList(),
      value: selectedDealerShip,
      hint: const Text('Select Dealership'),
      onChanged: (value) {
        setState(() {
          selectedDealerShip = value;
        });
      },
    );
  }
}
