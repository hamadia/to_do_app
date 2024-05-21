import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CustomSlidable extends StatelessWidget {
  const CustomSlidable(
      {super.key,
      required this.child,
      required this.onPressedDelete,
      required this.onPressedEdit});

  final Widget child;
  final Function(BuildContext)? onPressedDelete;
  final Function(BuildContext)? onPressedEdit;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        extentRatio: .6,
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            borderRadius: BorderRadius.circular(80),
            onPressed: onPressedDelete,
            backgroundColor: Colors.red,
            icon: Icons.delete,
            label: 'Delete',
          ),
          SlidableAction(
            borderRadius: BorderRadius.circular(80),
            onPressed: onPressedEdit,
            backgroundColor: Colors.green,
            icon: Icons.edit,
            label: 'Edit',
          ),
        ],
      ),
      child: child,
    );
  }
}
