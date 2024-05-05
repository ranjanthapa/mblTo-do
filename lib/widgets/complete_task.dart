import 'package:flutter/material.dart';
import "package:todo/model/task.dart";
import "package:todo/widgets/task_description.dart";

class CompleteTaskList extends StatelessWidget {
  const CompleteTaskList(
      {super.key,
      required this.completeTasks,
      required this.onCompleteTask,
      required this.onRemoveTask});
  final List<Task> completeTasks;

  final Function(Task task) onCompleteTask;
  final Function(Task task) onRemoveTask;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: completeTasks.length,
        itemBuilder: (ctx, index) => Dismissible(
              key: ValueKey(completeTasks[index]),
              onDismissed: (direction) {
                onRemoveTask(completeTasks[index]);
              },
              child: TaskDescription(
                task: completeTasks[index],
                onCompleteTask: onCompleteTask,
              ),
            ));
  }
}
