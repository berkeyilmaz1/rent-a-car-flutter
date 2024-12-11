import 'package:flutter/material.dart';
import 'package:rent_a_car/features/admin/view/pages/reservations/view/mixin/reservations_page_view_mixin.dart';
import 'package:rent_a_car/product/utils/border_radius_general.dart';
import 'package:rent_a_car/product/widgets/page/page_padding.dart';
import 'package:rent_a_car/product/widgets/widget_sizes.dart';

class ReservationsPageView extends StatefulWidget {
  const ReservationsPageView({super.key});

  @override
  State<ReservationsPageView> createState() => _ReservationsPageViewState();
}

class _ReservationsPageViewState extends State<ReservationsPageView>
    with ReservationsPageViewMixin {
  @override
  Widget build(BuildContext context) {
    return reservations == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            padding: const PagePadding.all(),
            itemCount: reservations!.length,
            itemBuilder: (BuildContext context, int index) {
              final reservation = reservations![index];
              return Card(
                margin: const PagePadding.verticalLowSymmetric(),
                elevation: WidgetSizes.spacingXSs,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeneral.allLow(),
                ),
                child: Padding(
                  padding: const PagePadding.all(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.book_online_rounded),
                          const SizedBox(width: WidgetSizes.spacingXs),
                          Text(
                            'Reservation #${reservation.id}',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueAccent,
                                ),
                          ),
                        ],
                      ),
                      const Divider(),
                      const SizedBox(height: WidgetSizes.spacingXs),
                      Row(
                        children: [
                          Expanded(
                            child: _buildDetailRow(
                              context,
                              'User ID:',
                              reservation.userId.toString(),
                            ),
                          ),
                          Expanded(
                            child: _buildDetailRow(
                              context,
                              'Car ID:',
                              reservation.carId.toString(),
                            ),
                          ),
                          const Spacer(),
                          Expanded(
                            child: _buildDetailRow(
                              context,
                              'Start Date:',
                              reservation.startDate.toString(),
                            ),
                          ),
                          Expanded(
                            child: _buildDetailRow(
                              context,
                              'End Date:',
                              reservation.endDate.toString(),
                            ),
                          ),
                        ],
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: WidgetSizes.spacingXs,
                        ),
                        child: Text(
                          'Car Details',
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                      _buildDetailRow(
                        context,
                        'Model:',
                        '${reservation.car?.brand} ${reservation.car?.model}',
                      ),
                      _buildDetailRow(
                        context,
                        'License Plate:',
                        reservation.car?.licensePlate ?? '-',
                      ),
                      _buildDetailRow(
                        context,
                        'VIN:',
                        reservation.car?.vinNumber ?? '-',
                      ),
                    ],
                  ),
                ),
              );
            },
          );
  }

  Widget _buildDetailRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: WidgetSizes.spacingXs),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              value,
              style: Theme.of(context).textTheme.bodyMedium,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
