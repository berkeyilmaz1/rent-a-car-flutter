import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rent_a_car/features/selection/view/selection_view.dart';

/// This mixin is used to manage the state of the [SelectionView].
mixin SelectionViewMixin on State<SelectionView> {
  late DateTimeRange selectedDates;
  late String formattedStartDate;
  late String formattedEndDate;
  late DateTime startDateWithTime;
  late DateTime endDateWithTime;
  int? _dayCount;
  int get dayCount => _dayCount ?? 1;
  @override
  void initState() {
    super.initState();
    selectedDates = DateTimeRange(
      start: DateTime.now(),
      end: DateTime.now().add(const Duration(days: 1)),
    );
    formattedStartDate = formatDate(selectedDates.start);
    formattedEndDate = formatDate(selectedDates.end);
  }

  String formatDate(DateTime dateTime) {
    return DateFormat('dd MMM', 'tr_TR').format(dateTime);
  }

  Future<void> selectDate() async {
    final dateTimeRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(3000),
    );

    if (dateTimeRange != null) {
      setState(() {
        formattedStartDate = formatDate(dateTimeRange.start);
        formattedEndDate = formatDate(dateTimeRange.end);
        startDateWithTime = dateTimeRange.start;
        endDateWithTime = dateTimeRange.end;
        _dayCount = dateTimeRange.duration.inDays;
      });
    }
  }
}
