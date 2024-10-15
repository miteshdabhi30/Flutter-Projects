import 'package:flutter/material.dart';

import '../resources/resource.dart';

class CustomSelectDate extends StatelessWidget {
  final DateTime initialDate;
  final String title;
  final ValueChanged<DateTime> onDateSelected;

  const CustomSelectDate(
      {super.key,
      required this.initialDate,
      required this.title,
      required this.onDateSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final DateTime? picked = await showDatePicker(
            context: context,
            initialDate: initialDate,
            firstDate: DateTime.now(),
            lastDate: DateTime(2100));
        if (picked != null) {
          onDateSelected(picked);
        }
      },
      child: Container(
        color: Colors.indigo.shade500,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          child: Text(
            title,
            style: TextStyle(color: Resource.whiteColor),
          ),
        ),
      ),
    );
  }
}
