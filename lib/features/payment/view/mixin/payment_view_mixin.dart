import 'package:flutter/material.dart';
import 'package:rent_a_car/features/auth/widgets/auth_button.dart';
import 'package:rent_a_car/features/payment/view/payment_view.dart';
import 'package:rent_a_car/product/initialize/router/route_tree.dart';
import 'package:rent_a_car/product/widgets/widget_sizes.dart';

mixin PaymentViewMixin on State<PaymentView> {
  late final TextEditingController cardNumberController;
  late final TextEditingController monthController;
  late final TextEditingController yearController;
  late final TextEditingController cvvController;
  @override
  void initState() {
    super.initState();
    cardNumberController = TextEditingController();
    monthController = TextEditingController();
    yearController = TextEditingController();
    cvvController = TextEditingController();
  }

  bool validatePaymentDetails() {
    return cardNumberController.text.length == 16 &&
        monthController.text.length == 2 &&
        yearController.text.length == 2 &&
        cvvController.text.length == 3;
  }

  void processPayment() {
    if (validatePaymentDetails()) {
      _showSuccessDialog();
    } else {
      _showErrorDialog();
    }
  }

  void _showSuccessDialog() {
    showDialog<AlertDialog>(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 80),
            const SizedBox(height: 16),
            const Text(
              'Ödeme Başarılı',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: WidgetSizes.spacingM),
            AuthButton(
              onPressed: () {
                Navigator.of(context).pop();
                const SelectionViewRoute().go(context);
              },
              buttonName: 'Kapat',
            ),
          ],
        ),
      ),
    );
  }

  void _showErrorDialog() {
    showDialog<AlertDialog>(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error, color: Colors.red, size: 80),
            const SizedBox(height: 16),
            const Text(
              'Ödeme Başarısız',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: WidgetSizes.spacingM),
            AuthButton(
              onPressed: () => Navigator.of(context).pop(),
              buttonName: 'Tekrar Dene',
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    cardNumberController.dispose();
    monthController.dispose();
    yearController.dispose();
    cvvController.dispose();
    super.dispose();
  }
}
