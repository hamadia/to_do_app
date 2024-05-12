import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/styles.dart';

import '../../../data/model/task.dart';

class TaskItemList extends StatelessWidget {
  const TaskItemList({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  task.title ?? '',
                  style: Styles.taskItem,
                ),
                Text(
                  task.description ?? '',
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
    );
  }
}
