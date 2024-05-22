import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/Features/account/presentation/manager/register_and_login_provider.dart';
import 'package:to_do_app/Features/home/data/task_dao.dart';
import 'package:to_do_app/Features/home/presentation/views/edit_task_view.dart';
import 'package:to_do_app/Features/home/presentation/views/widgets/custom_delete_design.dart';
import 'package:to_do_app/Features/home/presentation/views/widgets/custom_is_done.dart';
import 'package:to_do_app/Features/home/presentation/views/widgets/custom_line_side.dart';
import 'package:to_do_app/Features/home/presentation/views/widgets/custom_slidable.dart';
import 'package:to_do_app/Features/home/presentation/views/widgets/custom_title_description_show.dart';
import 'package:to_do_app/core/utils/Functions/dialog_utils.dart';

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
    return CustomSlidable(
      onPressedDelete: (context) {
        deleteTask(widget.task.id!);
      },
      onPressedEdit: (context) {
        Navigator.pushNamed(context, EditTaskView.routeName,
            arguments: widget.task);
      },
      child: CustomContainerTaskDesign(
        child: Row(
          children: [
            CustomLineSide(
              isDone: widget.task.isDone,
            ),
            const SizedBox(
              width: 12,
            ),
            CustomTitleDescriptionShow(
              isDone: widget.task.isDone,
              title: widget.task.title ?? '',
              description: widget.task.description ?? '',
            ),
            CustomIsDone(
              isDone: widget.task.isDone,
              onTap: () {
                var authProvider =
                    Provider.of<MyAuthProvider>(context, listen: false);
                widget.task.isDone = !widget.task.isDone;
                TaskDao.updateTask(authProvider.databaseUser!.id!, widget.task);
              },
            ),
          ],
        ),
      ),
    );
  }

  void deleteTask(String taskId) async {
    var authProvider = Provider.of<MyAuthProvider>(context, listen: false);
    await TaskDao.deleteTask(authProvider.databaseUser!.id!, taskId);
    DialogUtils.showMessage(context, 'Task deleted successfully',
        posActionTitle: 'ok');
  }
}
