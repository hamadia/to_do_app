import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/Features/account/presentation/manager/register_and_login_provider.dart';
import 'package:to_do_app/Features/home/data/task_dao.dart';
import 'package:to_do_app/Features/home/presentation/views/widgets/task_item.dart';

class TasksViewBody extends StatefulWidget {
  const TasksViewBody({super.key});

  @override
  State<TasksViewBody> createState() => _TasksViewBodyState();
}

class _TasksViewBodyState extends State<TasksViewBody> {
  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<MyAuthProvider>(context);
    return Container(
      child: Column(
        children: [
          Expanded(
            child: StreamBuilder(
                stream: TaskDao.listenForTasks(authProvider.databaseUser!.id!),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Column(
                        children: [
                          const Text('Something went wrong'),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('Try again'),
                          ),
                        ],
                      ),
                    );
                  }
                  var taskList = snapshot.data;
                  return ListView.builder(
                    itemBuilder: (context, index) =>
                        TaskItemList(task: taskList[index]),
                    itemCount: taskList!.length,
                  );
                }),
          ),
        ],
      ),
    );
  }
}
