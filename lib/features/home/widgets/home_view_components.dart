part of '../view/home_view.dart';

final class PriceRange extends StatelessWidget {
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
          width: WidgetSizes.spacingXxl12,
          child: TextFormField(
            controller: minPriceController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Min',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {},
          ),
        ),
        const SizedBox(width: WidgetSizes.spacingXsMid),
        // Max Price
        SizedBox(
          width: WidgetSizes.spacingXxl12,
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

final class SearchBar extends StatelessWidget {
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

final class HomeViewTitle extends StatelessWidget {
  const HomeViewTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Rent A Car',
      style: TextStyle(
        color: Colors.lightBlue,
        fontSize: WidgetSizes.spacingXxl7,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
