import 'package:flutter/material.dart';
import 'package:to_do_app/Features/home/presentation/views/widgets/edit_task_view_body.dart';

class EditTaskView extends StatelessWidget {
  const EditTaskView({super.key});

  static const String routeName = 'editScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit the task'),
      ),
      body: const EditTaskViewBody(),
    );
  }
}
