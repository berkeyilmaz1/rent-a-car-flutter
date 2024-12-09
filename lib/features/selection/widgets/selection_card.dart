part of '../view/selection_view.dart';

final class SelectionCard extends StatelessWidget {
  const SelectionCard({
    required this.onPressed,
    required this.formattedStartDate,
    required this.formattedEndDate,
    required this.dayCount,
    required this.startDateWithTime,
    required this.endDateWithTime,
    super.key,
  });

  final VoidCallback onPressed;
  final String formattedStartDate;
  final String formattedEndDate;
  final int dayCount;
  final DateTime startDateWithTime;
  final DateTime endDateWithTime;
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
         
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: DealerShipDropdown(
                fetchDealerShips:
                    RentACarService(networkManager: ProductNetworkManager())
                        .getAllDealership,
                onSelected: (selectedDealerShip) {
                  if (selectedDealerShip != null) {
                    print('Selected DealerShip: ${selectedDealerShip.name}');
                  }
                },
              ),
            ),
            const SizedBox(height: WidgetSizes.spacingXSs),
            Expanded(
              child: TextButton(
                onPressed: onPressed,
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(WidgetSizes.spacingXSs),
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
                onPressed: () {
                  HomeViewRoute(
                    $extra: {
                      'startDate': formattedStartDate,
                      'endDate': formattedEndDate,
                      'dayCount': dayCount,
                      'startDateWithTime': startDateWithTime,
                      'endDateWithTime': endDateWithTime,
                    },
                  ).go(context);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(WidgetSizes.spacingXSs),
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
