import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:todo_app_sqflite/providers/date_providerd.dart';
import 'package:todo_app_sqflite/providers/time_provider.dart';
import 'package:todo_app_sqflite/utilities/Helpers.dart';
import 'package:todo_app_sqflite/widgets/common_text_field.dart';
import 'package:todo_app_sqflite/widgets/simple_heading.dart';

class DateTimeViewer extends ConsumerWidget {
  const DateTimeViewer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(dateProvider);
    final time = ref.watch(timeProvider);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SimpleHeading(title: 'Date'),
              CommonTextField(
                hintText: DateFormat.yMMMd().format(date),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.date_range),
                  onPressed: () {
                    _selectDate(context, ref);
                  },
                ),
              ),
            ],
          ),
        ),
        const Gap(10),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SimpleHeading(title: 'Time'),
              CommonTextField(
                hintText: Helper.timeToString(time),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.punch_clock_outlined),
                  onPressed: () {
                    _selectTime(context, ref);
                  },
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  void _selectTime(BuildContext context, WidgetRef ref) async {
    TimeOfDay initialTime = ref.read(timeProvider);
    TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );
    if (time != null) {
      ref.read(timeProvider.notifier).state = time;
    }
  }

  void _selectDate(BuildContext context, WidgetRef ref) async {
    DateTime initialDate = ref.read(dateProvider);
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2024),
      lastDate: DateTime(2050),
    );
    if (pickedDate != null) {
      ref.read(dateProvider.notifier).state = pickedDate;
    }
  }
}
