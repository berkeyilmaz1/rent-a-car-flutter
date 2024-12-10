import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rent_a_car/features/auth/widgets/auth_button.dart';
import 'package:rent_a_car/features/payment/view/mixin/payment_view_mixin.dart';
import 'package:rent_a_car/product/utils/border_radius_general.dart';
import 'package:rent_a_car/product/widgets/page/page_padding.dart';
import 'package:rent_a_car/product/widgets/widget_sizes.dart';

final class PaymentView extends StatefulWidget {
  const PaymentView({required this.parameters, super.key});
  final Map<dynamic, dynamic> parameters;
  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> with PaymentViewMixin {
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: cardNumberController,
              decoration: const InputDecoration(
                labelText: 'Kart Numarası',
                prefixIcon: Icon(Icons.credit_card),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(16),
              ],
            ),
            const SizedBox(height: WidgetSizes.spacingM),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: monthController,
                    decoration: const InputDecoration(
                      labelText: 'Ay',
                      hintText: 'AA',
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(2),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text('/'),
                ),
                Expanded(
                  child: TextFormField(
                    controller: yearController,
                    decoration: const InputDecoration(
                      labelText: 'Yıl',
                      hintText: 'YY',
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(2),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: WidgetSizes.spacingM),
            TextFormField(
              controller: cvvController,
              decoration: const InputDecoration(
                labelText: 'CVV',
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(3),
              ],
              obscureText: true,
            ),
            const SizedBox(height: WidgetSizes.spacingM),
            AuthButton(
              onPressed: processPayment,
              buttonName: 'Ödemeyi Tamamla',
            ),
          ],
        ),
      ),
    );
  }
}
