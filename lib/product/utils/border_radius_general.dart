import 'package:flutter/material.dart';
import 'package:rent_a_car/product/widgets/widget_sizes.dart';

final class BorderRadiusGeneral extends BorderRadius {
  /// Radius is 30 [Radius.circular]
  const BorderRadiusGeneral.all30()
      : super.all(const Radius.circular(WidgetSizes.spacingXxl1));

  /// Radius is 24 [Radius.circular]
  const BorderRadiusGeneral.all()
      : super.all(const Radius.circular(WidgetSizes.spacingXl));

  /// Radius is 20 [Radius.circular]
  const BorderRadiusGeneral.allNormal()
      : super.all(const Radius.circular(WidgetSizes.spacingL));

  /// Radius is 12 [Radius.circular]
  const BorderRadiusGeneral.allLow()
      : super.all(const Radius.circular(WidgetSizes.spacingS));

  /// Radius is 8 [Radius.circular]
  const BorderRadiusGeneral.cardLow()
      : super.all(const Radius.circular(WidgetSizes.spacingXs));
}
