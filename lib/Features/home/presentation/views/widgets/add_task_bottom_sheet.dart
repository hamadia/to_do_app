import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/Features/account/presentation/manager/register_and_login_provider.dart';
import 'package:to_do_app/Features/home/data/model/task.dart';
import 'package:to_do_app/Features/home/data/task_dao.dart';
import 'package:to_do_app/Features/home/presentation/views/widgets/custom-add_button.dart';
import 'package:to_do_app/Features/home/presentation/views/widgets/custom_select_time.dart';
import 'package:to_do_app/Features/home/presentation/views/widgets/custom_task_description.dart';
import 'package:to_do_app/core/utils/Functions/dialog_utils.dart';

import '../../../../../core/utils/styles.dart';
import 'custom_task_title.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  final formKey = GlobalKey<FormState>();
  late String taskTitle;
  late String taskDescription;

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
            TaskTitleTextField(
              onTitleEntered: (enteredTitle) {
                taskTitle = enteredTitle;
              },
            ),
            TaskDescriptionTextField(
              onDescriptionEntered: (enteredDescription) {
                taskDescription = enteredDescription;
              },
            ),
            SelectTime(
              onTap: () {
                showTaskDatePicker();
              },
            ),
            const SizedBox(
              height: 8,
            ),
            CustomButton(
              onPressed: () {
                addTask();
              },
              title: 'Add Task',
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

  void addTask() async {
    var authProvider = Provider.of<MyAuthProvider>(context, listen: false);
    if (!isValidForm()) {
      return;
    }
    Task task = Task(
      title: taskTitle,
      description: taskDescription,
      dateTime: Timestamp.fromDate(SelectTime.finalSelectedDate!),
    );
    DialogUtils.showLoadingDialog(context, 'Creating Task');
    await TaskDao.addTask(task, authProvider.databaseUser!.id!);
    DialogUtils.hideDialog(context);
    DialogUtils.showMessage(context, 'Task Created Successfully');
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
