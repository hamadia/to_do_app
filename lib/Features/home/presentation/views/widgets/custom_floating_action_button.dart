import 'package:flutter/material.dart';
import 'package:to_do_app/Features/home/presentation/views/widgets/add_task_bottom_sheet.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showAddTaskBottomSheet(context);
      },
      shape: const StadiumBorder(
        side: BorderSide(
          width: 4,
          color: Colors.white,
        ),
      ),
      child: const Icon(Icons.add),
    );
  }

  showAddTaskBottomSheet(context) {
    showModalBottomSheet(
        context: context, builder: (context) => AddTaskBottomSheet());
  }
}
