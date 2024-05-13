import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

typedef OnTap = void Function();

class SelectTime extends StatefulWidget {
  const SelectTime({super.key, required this.onTap});

  final OnTap onTap;
  static bool showDateError = false;
  static DateTime? finalSelectedDate;

  @override
  State<SelectTime> createState() => _SelectTimeState();
}

class _SelectTimeState extends State<SelectTime> {
  @override
  void dispose() {
    SelectTime.finalSelectedDate = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InkWell(
          onTap: widget.onTap,
          child: Text(
            SelectTime.finalSelectedDate == null
                ? 'Select Time'
                : '${SelectTime.finalSelectedDate?.day}/ ${SelectTime.finalSelectedDate?.month}/${SelectTime.finalSelectedDate?.year}',
            style: Styles.time,
          ),
        ),
        Visibility(
          visible: SelectTime.showDateError,
          child: Text(
            'Please select time',
            style: Styles.validTime,
          ),
        ),
      ],
    );
  }
}
