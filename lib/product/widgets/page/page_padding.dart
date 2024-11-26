import 'package:flutter/material.dart';
import 'package:rent_a_car/product/widgets/widget_sizes.dart';

class PagePadding extends EdgeInsets {
  /// Padding is 20
  const PagePadding.horizontalSymmetric()
      : super.symmetric(horizontal: WidgetSizes.spacingL);

  /// Padding is 18
  const PagePadding.horizontal18Symmetric()
      : super.symmetric(
          horizontal: WidgetSizes.spacingM + WidgetSizes.spacingXSS,
        );

  /// Padding is 16
  const PagePadding.horizontal16Symmetric()
      : super.symmetric(horizontal: WidgetSizes.spacingM);

  /// Padding is 14
  const PagePadding.horizontalNormal14Symmetric()
      : super.symmetric(horizontal: WidgetSizes.spacingSs);

  /// Padding is 12
  const PagePadding.horizontalNormalSymmetric()
      : super.symmetric(horizontal: WidgetSizes.spacingS);

  /// Padding is 24
  const PagePadding.horizontalMediumSymmetric()
      : super.symmetric(horizontal: WidgetSizes.spacingXl);

  /// Padding is 40
  const PagePadding.horizontalHighSymmetric()
      : super.symmetric(horizontal: WidgetSizes.spacingXxl4);

  /// Padding is 10
  const PagePadding.horizontalLowSymmetric()
      : super.symmetric(horizontal: WidgetSizes.spacingXsMid);

  /// Padding is 4
  const PagePadding.horizontalVeryLowSymmetric()
      : super.symmetric(horizontal: WidgetSizes.spacingXxs);

  /// Padding is 6
  const PagePadding.horizontalLowXss()
      : super.symmetric(
          horizontal: WidgetSizes.spacingXxs + WidgetSizes.spacingXSS,
        );

  /// MARK: Padding vertical size lower to higher

  /// Padding is 4
  const PagePadding.verticalVeryLowSymmetric()
      : super.symmetric(vertical: WidgetSizes.spacingXxs);

  /// Padding is 10
  const PagePadding.verticalLowSymmetric()
      : super.symmetric(vertical: WidgetSizes.spacingXsMid);

  /// Padding is 12
  const PagePadding.verticalLow12Symmetric()
      : super.symmetric(vertical: WidgetSizes.spacingS);

  /// Padding is 12
  const PagePadding.verticalLow14Symmetric()
      : super.symmetric(vertical: WidgetSizes.spacingSs);

  /// Padding is 16
  const PagePadding.verticalMediumSymmetric()
      : super.symmetric(vertical: WidgetSizes.spacingM);

  /// Padding is 18
  const PagePadding.vertical18Symmetric()
      : super.symmetric(vertical: WidgetSizes.spacingMx);

  /// Padding is 20
  const PagePadding.verticalSymmetric()
      : super.symmetric(vertical: WidgetSizes.spacingL);

  /// Padding is 24
  const PagePadding.verticalNormalSymmetric()
      : super.symmetric(vertical: WidgetSizes.spacingXl);

  const PagePadding.verticalNormal28Symmetric()
      : super.symmetric(vertical: WidgetSizes.spacingXxl);

  /// Padding is 30
  const PagePadding.vertical30Symmetric()
      : super.symmetric(
          vertical: WidgetSizes.spacingXxl + WidgetSizes.spacingXSS,
        );

  /// Padding is 32
  const PagePadding.verticalMediumHighSymmetric()
      : super.symmetric(vertical: WidgetSizes.spacingXxl2);

  /// Padding is 36
  const PagePadding.verticalHighSymmetric()
      : super.symmetric(vertical: WidgetSizes.spacingXxl3);

  /// Padding is 40
  const PagePadding.verticalHigh()
      : super.symmetric(vertical: WidgetSizes.spacingXxl4);

  /// Padding is 20
  const PagePadding.general()
      : super.only(
          right: WidgetSizes.spacingL,
          left: WidgetSizes.spacingL,
          top: WidgetSizes.spacingL,
        );

  // MARK: Padding all

  /// Padding is 2
  const PagePadding.generalIconLowAll() : super.all(WidgetSizes.spacingXSS);

  /// Padding is 4
  const PagePadding.generalIconAll() : super.all(WidgetSizes.spacingXxs);

  /// Padding is 8
  const PagePadding.allVeryLow() : super.all(WidgetSizes.spacingXs);

  /// Padding is 10
  const PagePadding.allLow() : super.all(WidgetSizes.spacingXsMid);

  /// Padding is 12
  const PagePadding.generalCardAll() : super.all(WidgetSizes.spacingS);

  /// Padding is 16
  const PagePadding.generalAllNormal() : super.all(WidgetSizes.spacingM);

  /// Padding is 20
  const PagePadding.all() : super.all(WidgetSizes.spacingL);

  /// Padding is 24
  const PagePadding.allNormal() : super.all(WidgetSizes.spacingXl);

//MARK: Padding left

  /// Padding is 4
  const PagePadding.onlyLeftVeryLowX()
      : super.only(left: WidgetSizes.spacingXxs);

  /// Padding is 8
  const PagePadding.onlyLeftVeryLow() : super.only(left: WidgetSizes.spacingXs);

  /// Padding is 12
  const PagePadding.onlyLeftLow() : super.only(left: WidgetSizes.spacingS);

  /// Padding is 16
  const PagePadding.onlyLeft() : super.only(left: WidgetSizes.spacingM);

  /// Padding is 24
  const PagePadding.onlyLeftNormal() : super.only(left: WidgetSizes.spacingXl);

  /// Padding is 32
  const PagePadding.onlyLeftHigh() : super.only(left: WidgetSizes.spacingXxl2);

  /// Padding is 40
  const PagePadding.onlyLeftVeryHigh()
      : super.only(left: WidgetSizes.spacingXxl4);

//MARK: Padding bottom
  /// value is 4
  const PagePadding.onlyBottomVeryLow()
      : super.only(bottom: WidgetSizes.spacingXxs);

  /// value is 8
  const PagePadding.onlyBottomLowX()
      : super.only(bottom: WidgetSizes.spacingXs);

  /// value is 10
  const PagePadding.onlyBottomLow()
      : super.only(bottom: WidgetSizes.spacingXsMid);

  /// value is 12
  const PagePadding.onlyBottomMedium()
      : super.only(bottom: WidgetSizes.spacingS);

  /// value is 16
  const PagePadding.onlyBottom() : super.only(bottom: WidgetSizes.spacingM);

  /// value is 24
  const PagePadding.onlyBottomNormal()
      : super.only(bottom: WidgetSizes.spacingXl);

  /// value is 32
  const PagePadding.onlyBottomHight()
      : super.only(bottom: WidgetSizes.spacingXxl2);

  /// Padding Top
  /// value is 4
  const PagePadding.onlyTopVeryLow()
      : super.only(bottom: WidgetSizes.spacingXxs);

  /// value is 8
  const PagePadding.onlyTopLow() : super.only(top: WidgetSizes.spacingXs);

  /// value is 10
  const PagePadding.onlyTop() : super.only(top: WidgetSizes.spacingXsMid);

  /// value is 12
  const PagePadding.onlyTopMedium() : super.only(top: WidgetSizes.spacingS);

  /// value is 16
  const PagePadding.onlyTopNormalMedium()
      : super.only(top: WidgetSizes.spacingM);

  /// value is 18
  const PagePadding.onlyTopVeryLowNormal()
      : super.only(top: WidgetSizes.spacingMx);

  /// value is 24
  const PagePadding.onlyTopNormal() : super.only(top: WidgetSizes.spacingXl);

  /// value is 24
  const PagePadding.onlyTopNormalLarge()
      : super.only(
          top: WidgetSizes.spacingXxl,
        );

  /// value is 30
  const PagePadding.onlyTopNormalX()
      : super.only(top: WidgetSizes.spacingXxl2 - WidgetSizes.spacingXSS);

  /// value is 36
  const PagePadding.onlyTopHigh() : super.only(top: WidgetSizes.spacingXxl3);

  ///MARK: Page padding vertical size lower to higher

  /// Padding is 6
  const PagePadding.onlyRightVeryLow()
      : super.only(right: WidgetSizes.spacingXSs);

  /// Padding is 10
  const PagePadding.onlyRightLow()
      : super.only(right: WidgetSizes.spacingXsMid);

  /// Padding is 12
  const PagePadding.onlyRight12() : super.only(right: WidgetSizes.spacingS);

  /// Padding is 16
  const PagePadding.onlyRight() : super.only(right: WidgetSizes.spacingM);

  /// Padding is 20
  const PagePadding.onlyRightMedium() : super.only(right: WidgetSizes.spacingL);

  /// Padding is 24
  const PagePadding.onlyRightNormal()
      : super.only(right: WidgetSizes.spacingXl);

  /// Padding is 40
  const PagePadding.onlyRightVeryHight()
      : super.only(right: WidgetSizes.spacingXxl4);
}

extension PagePaddingExtension on PagePadding {
  SliverPadding toSliver(Widget sliver) {
    return SliverPadding(padding: this, sliver: sliver);
  }
}
