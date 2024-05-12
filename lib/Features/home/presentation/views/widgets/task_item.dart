import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/Features/account/presentation/manager/register_and_login_provider.dart';
import 'package:to_do_app/Features/home/data/task_dao.dart';
import 'package:to_do_app/core/utils/Functions/dialog_utils.dart';
import 'package:to_do_app/core/utils/styles.dart';

import '../../../data/model/task.dart';

class TaskItemList extends StatefulWidget {
  const TaskItemList({super.key, required this.task});

  final Task task;

  @override
  State<TaskItemList> createState() => _TaskItemListState();
}

class _TaskItemListState extends State<TaskItemList> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        extentRatio: .3,
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            borderRadius: BorderRadius.circular(30),
            onPressed: (context) {
              deleteTask(widget.task.id!);
            },
            backgroundColor: Colors.red,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Container(
              width: 4,
              height: 80,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(22),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    widget.task.title ?? '',
                    style: Styles.taskItem,
                  ),
                  Text(
                    widget.task.description ?? '',
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(18)),
              child: const Icon(
                Icons.done,
                color: Colors.white,
                weight: 30,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void deleteTask(String taskId) async {
    var authProvider = Provider.of<MyAuthProvider>(context, listen: false);
    // DialogUtils.showLoadingDialog(context, 'Deleting Task');
    await TaskDao.deleteTask(authProvider.databaseUser!.id!, taskId);
    DialogUtils.showMessage(context, 'Task deleted successfully',
        posActionTitle: 'ok');
  }
}
