import 'package:flutter/material.dart';
import 'package:rent_a_car/core/product_network_manager.dart';
import 'package:rent_a_car/features/admin/view/pages/payments/view/payments_page_view.dart';
import 'package:rent_a_car/product/initialize/service/models/payment/create_payment_request.dart';
import 'package:rent_a_car/product/initialize/service/models/payment/payment.dart';
import 'package:rent_a_car/product/initialize/service/rent_a_car_service.dart';

mixin PaymentsPageViewMixin on State<PaymentsPageView> {
  late final RentACarService _rentACarService;
  List<Payment>? payments;
  @override
  void initState() {
    super.initState();

    _rentACarService = RentACarService(
      networkManager: ProductNetworkManager(),
    );

    fetchPayments();
  }

//TODO: CREATE PAYMENT REQUEST DOĞRU MU KONTROL ET
  Future<void> saveOnPressed(PaymentCreateRequest car, int id) async {
    await _rentACarService.updatePayment(car, id);
  }

  Future<void> deleteOnPressed(int id) async {
    await _rentACarService.deletePayment(id);
  }

  Future<void> fetchPayments() async {
    final response = await _rentACarService.getAllPayments();
    setState(() {
      payments = response;
    });
  }
}
