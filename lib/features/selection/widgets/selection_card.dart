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
            Expanded(
              flex: 3,
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(WidgetSizes.spacingXSs),
                  ),
                ),
              ),
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
                onPressed: () {
                  // HomeViewRoute(dayCount ?? 1).go(context);
                },
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
