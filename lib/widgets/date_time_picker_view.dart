import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_app_sqflite/widgets/common_text_field.dart';
import 'package:todo_app_sqflite/widgets/simple_heading.dart';

class DateTimeViewer extends StatelessWidget {
  const DateTimeViewer({super.key});

  @override
  Widget build(BuildContext context) {
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
                hintText: 'Feb 04',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.date_range),
                  onPressed: () {
                    _selectDate(context);
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
                hintText: '10:40',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.punch_clock_outlined),
                  onPressed: () {
                    _selectTime(context);
                  },
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  void _selectTime(BuildContext context) async {
    TimeOfDay? time =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    print(time);
  }

  void _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
        context: context, firstDate: DateTime(2024), lastDate: DateTime(2050));
    print(pickedDate);
  }
}
