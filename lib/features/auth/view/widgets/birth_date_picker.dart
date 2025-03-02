part of '../sign_up_view.dart';

class BirthDatePicker extends StatelessWidget {
  const BirthDatePicker({
    required this.selectedBirthDate,
    required this.onDatePicked,
    super.key,
  });
  final DateTime? selectedBirthDate;
  final ValueChanged<DateTime?> onDatePicked;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            selectedBirthDate == null
                ? LocaleKeys.auth_hints_selectBirthDate.tr()
                : '${selectedBirthDate!.day}/${selectedBirthDate!.month}/${selectedBirthDate!.year}',
            style: const TextStyle(fontSize: 16),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.calendar_today),
          onPressed: () async {
            final pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );
            onDatePicked(pickedDate);
          },
        ),
      ],
    );
  }
}
