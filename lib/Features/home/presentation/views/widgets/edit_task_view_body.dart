import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/Features/home/data/model/task.dart';
import 'package:to_do_app/Features/home/data/task_dao.dart';
import 'package:to_do_app/Features/home/presentation/views/widgets/custom-add_button.dart';
import 'package:to_do_app/core/utils/common_widget/custom_text_form_field.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../account/presentation/manager/register_and_login_provider.dart';

class EditTaskViewBody extends StatefulWidget {
  const EditTaskViewBody({super.key});

  static DateTime? finalSelectedDate;

  @override
  State<EditTaskViewBody> createState() => _EditTaskViewBodyState();
}

class _EditTaskViewBodyState extends State<EditTaskViewBody> {
  @override
  Widget build(BuildContext context) {
    var task = ModalRoute.of(context)!.settings.arguments as Task;
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      margin: const EdgeInsets.all(25),
      child: Column(
        children: [
          const Spacer(),
          const Text('Edit Task'),
          const Spacer(),
          CustomTextFormField(
            labelText: 'Task title',
            initialValue: task.title,
            onChange: (value) {
              task.title = value;
              return null;
            },
          ),
          const Spacer(),
          CustomTextFormField(
            labelText: 'Task description',
            initialValue: task.description,
            onChange: (value) {
              task.description = value;
              return null;
            },
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              selectDate(task);
            },
            child: Text(
              EditTaskViewBody.finalSelectedDate == null
                  ? '${task.dateTime?.toDate().day}/${task.dateTime?.toDate().month}/${task.dateTime?.toDate().year}'
                  : '${EditTaskViewBody.finalSelectedDate?.day}/${EditTaskViewBody.finalSelectedDate?.month}/${EditTaskViewBody.finalSelectedDate?.year}',
              style: Styles.time,
            ),
          ),
          const Spacer(),
          CustomButton(
              onPressed: () async {
                var authProvider =
                    Provider.of<MyAuthProvider>(context, listen: false);
                await TaskDao.updateTask(authProvider.databaseUser!.id!, task);
                Navigator.pop(context);
              },
              title: 'Save Change'),
          const Spacer(
            flex: 3,
          ),
        ],
      ),
    );
  }

  void selectDate(Task task) async {
    var selectedDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      initialDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    setState(() {
      EditTaskViewBody.finalSelectedDate = selectedDate;
      task.dateTime = Timestamp.fromDate(EditTaskViewBody.finalSelectedDate!);
    });
  }
}
