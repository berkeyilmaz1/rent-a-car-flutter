import 'package:flutter/material.dart';
import 'package:rent_a_car/product/initialize/service/models/car.dart';
import 'package:rent_a_car/product/utils/border_radius_general.dart';
import 'package:rent_a_car/product/widgets/page/page_padding.dart';
import 'package:rent_a_car/product/widgets/widget_sizes.dart';

final class CarInfo extends StatelessWidget {
  const CarInfo({
    required this.imageUrl,
    required this.car,
    super.key,
  });

  final String imageUrl;
  final Car car;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.onPrimary,
      elevation: WidgetSizes.spacingXSs,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadiusGeneral.allLow(),
      ),
      child: Padding(
        padding: const PagePadding.all(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Row(
              children: [
                Icon(Icons.person),
                Text('Araç Bilgileri'),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _CarImage(imageUrl: imageUrl),
                _CarInfo(car: car),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

final class _CarInfo extends StatelessWidget {
  const _CarInfo({
    required this.car,
    super.key,
  });

  final Car car;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${car.brand} ${car.model}',
          style: const TextStyle(
            fontSize: WidgetSizes.spacingXxl3,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: WidgetSizes.spacingXSs),
        const _CarDetailRow(
          icon: Icons.local_gas_station,
          label: 'car.fuelType',
        ),
        const _CarDetailRow(
          icon: Icons.settings,
          label: 'car.gearType',
        ),
        _CarDetailRow(
          icon: Icons.person,
          label: '${car.minAge}+ yaş',
        ),
        _CarDetailRow(
          icon: Icons.speed,
          label: '${car.kilometer} km',
        ),
      ],
    );
  }
}

final class _CarDetailRow extends StatelessWidget {
  const _CarDetailRow({
    required this.icon,
    required this.label,
    super.key,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: WidgetSizes.spacingM),
        const SizedBox(width: WidgetSizes.spacingXSs),
        Text(
          label,
          style: const TextStyle(
            fontSize: WidgetSizes.spacingM,
          ),
        ),
      ],
    );
  }
}

final class _CarImage extends StatelessWidget {
  const _CarImage({
    required this.imageUrl,
    super.key,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadiusGeneral.cardLow(),
      child: Image.asset(
        imageUrl,
        width: 240,
        height: 160,
        fit: BoxFit.cover,
      ),
    );
  }
}

final class _RentButton extends StatelessWidget {
  const _RentButton({
    required this.onPressed,
    super.key,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        'Kirala',
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimary,
          fontWeight: FontWeight.w500,
          letterSpacing: WidgetSizes.spacingXSSs,
        ),
      ),
    );
  }
}
