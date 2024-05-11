import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

typedef OnTap = void Function();

class SelectTime extends StatelessWidget {
  const SelectTime({
    super.key,
    required this.onTap,
  });

  final OnTap onTap;
  static bool showDateError = false;
  static DateTime? finalSelectedDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InkWell(
          onTap: onTap,
          child: Text(
            finalSelectedDate == null
                ? 'Select Time'
                : '${finalSelectedDate?.day}/ ${finalSelectedDate?.month}/${finalSelectedDate?.year}',
            style: Styles.time,
          ),
        ),
        Visibility(
          visible: showDateError,
          child: Text(
            'Please select time',
            style: Styles.validTime,
          ),
        ),
      ],
    );
  }
}
