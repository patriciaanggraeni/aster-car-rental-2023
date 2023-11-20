import 'package:flutter/material.dart';

import 'section_title_widget.dart';

class DatePickerWidget extends StatelessWidget {
  const DatePickerWidget({
    super.key,
    required this.onPressed,
    required this.date,
  });

  final VoidCallback onPressed;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitleWidget(title: 'Pick a Date'),
        const SizedBox(height: 6),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(const Color(0XFF222525)),
            padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 9)),
            shape: MaterialStateProperty.all(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
            elevation: MaterialStateProperty.all(0),
          ),
          onPressed: onPressed,
          child: SizedBox(
            height: 37,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  date == '' ? 'Starting Date' : date,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
                const Icon(
                  Icons.edit_calendar,
                  size: 24,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
