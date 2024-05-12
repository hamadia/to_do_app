import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/Features/account/presentation/manager/register_and_login_provider.dart';
import 'package:to_do_app/Features/home/data/task_dao.dart';
import 'package:to_do_app/Features/home/presentation/views/widgets/custom_date_time_line.dart';
import 'package:to_do_app/Features/home/presentation/views/widgets/custom_error_state.dart';
import 'package:to_do_app/Features/home/presentation/views/widgets/task_item.dart';

class TasksViewBody extends StatefulWidget {
  const TasksViewBody({super.key});

  @override
  State<TasksViewBody> createState() => _TasksViewBodyState();
}

class _TasksViewBodyState extends State<TasksViewBody> {
  var selectedDate;
  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<MyAuthProvider>(context);

    return Column(
      children: [
        CustomDateTimeLine(
          onDateChange: (newDate) {
            selectedDate = newDate;
            setState(() {});
          },
        ),
        Expanded(
          child: StreamBuilder(
              stream: TaskDao.listenForTasks(
                  authProvider.databaseUser!.id!, selectedDate),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  return const ErrorState();
                }
                var taskList = snapshot.data;
                if (taskList == null) {
                  return const ErrorState(); // Handle null case.
                }
                return ListView.builder(
                  itemBuilder: (context, index) =>
                      TaskItemList(task: taskList[index]),
                  itemCount: taskList.length,
                );
              }),
        ),
      ],
    );
  }
}
