import 'package:flutter/material.dart';
import 'package:to_do_app/Features/home/presentation/views/widgets/custom-add_button.dart';
import 'package:to_do_app/Features/home/presentation/views/widgets/custom_select_time.dart';
import 'package:to_do_app/Features/home/presentation/views/widgets/custom_task_description.dart';

import '../../../../../core/utils/styles.dart';
import 'custom_task_title.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add New Task',
              style: Styles.title,
            ),
            const SizedBox(
              height: 8,
            ),
            const TaskTitleTextField(),
            const TaskDescriptionTextField(),
            SelectTime(
              onTap: () {
                showTaskDatePicker();
              },
            ),
            const SizedBox(
              height: 8,
            ),
            CustomAddButton(
              onPressed: () {
                addTask();
              },
            ),
          ],
        ),
      ),
    );
  }

  void showTaskDatePicker() async {
    var selectedData = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      initialDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    SelectTime.finalSelectedDate = selectedData;
    setState(() {});
  }

  void addTask() {
    if (!isValidForm()) {
      return;
    }
  }

  bool isValidForm() {
    bool isValid = true;
    if (formKey.currentState?.validate() == false) {
      isValid = false;
    }
    if (SelectTime.finalSelectedDate == null) {
      SelectTime.showDateError = true;
      isValid = false;
      setState(() {});
    }
    return isValid;
  }
}
