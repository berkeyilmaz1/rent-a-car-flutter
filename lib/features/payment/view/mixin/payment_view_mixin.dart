import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_a_car/core/product_network_manager.dart';
import 'package:rent_a_car/features/auth/widgets/auth_button.dart';
import 'package:rent_a_car/features/payment/view/payment_view.dart';
import 'package:rent_a_car/product/initialize/providers/user_provider.dart';
import 'package:rent_a_car/product/initialize/router/route_tree.dart';
import 'package:rent_a_car/product/initialize/service/models/car/car.dart';
import 'package:rent_a_car/product/initialize/service/models/payment/create_payment_request.dart';
import 'package:rent_a_car/product/initialize/service/rent_a_car_service.dart';
import 'package:rent_a_car/product/widgets/widget_sizes.dart';

mixin PaymentViewMixin on State<PaymentView> {
  late final TextEditingController cardNumberController;
  late final TextEditingController monthController;
  late final TextEditingController yearController;
  late final TextEditingController cvvController;
  late final Car car;
  late final int dayCount;
  late final RentACarService _rentACarService;
  

  @override
  void initState() {
    super.initState();
    car = widget.parameters['car'] as Car;
    dayCount = widget.parameters['dayCount'] as int;
    cardNumberController = TextEditingController();
    monthController = TextEditingController();
    yearController = TextEditingController();
    cvvController = TextEditingController();
    _rentACarService = RentACarService(networkManager: ProductNetworkManager());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  bool validatePaymentDetails() {
    return cardNumberController.text.length == 16 &&
        monthController.text.length == 2 &&
        yearController.text.length == 2 &&
        cvvController.text.length == 3;
  }

  Future<int?> fetchReservationIdByCarAndUser(
    String carId,
    String userId,
  ) async {
    final response = await _rentACarService.getAllReservations();

    if (response == null) throw Exception('Rezervasyonlar getirilemedi');

    final reservation = response.firstWhere(
      (reservation) =>
          reservation.carId == carId && reservation.userId == userId,
    );
    if (reservation.id == null) throw Exception('Rezervasyon bulunamadı');
    print("reservation id ${reservation.id}");
    return reservation.id;
  }

  Future<void> _sendPaymentRequest(int id) async {
    print("requestpayment:");
    print(PaymentCreateRequest(
      amount: car.pricePerDay! * dayCount,
      paymentDate: DateTime.now(),
      paymentMethod: 1,
      paymentStatus: 1,
      reservationId: id,
    ));
    // send payment request
    await _rentACarService.createPayment(
      PaymentCreateRequest(
        amount: car.pricePerDay! * dayCount,
        paymentDate: DateTime.now(),
        paymentMethod: 1,
        paymentStatus: 1,
        reservationId: id,
      ),
    );
  }

  Future<void> processPayment() async {
    if (validatePaymentDetails()) {
      final user = Provider.of<UserProvider>(context, listen: false).user;
      final id = await fetchReservationIdByCarAndUser(
          car.vinNumber ?? '0', user!.id ?? '0');
      if (id == null) return;
      await _sendPaymentRequest(id);
      _showSuccessDialog();
      Navigator.of(context).pop();
      const SelectionViewRoute().go(context);
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
