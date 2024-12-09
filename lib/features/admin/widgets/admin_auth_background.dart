part of '../view/admin_sign_in_view.dart';
final class Admin extends StatelessWidget {
  const Admin({
    required this.child,
    super.key,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: WidgetSizes.spacingXxlL14 + WidgetSizes.spacingXxl12,
      height: WidgetSizes.spacingXxlL14 + WidgetSizes.spacingXxl12,
      padding: const PagePadding.all(),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadiusGeneral.cardLow(),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: child,
    );
  }
}
