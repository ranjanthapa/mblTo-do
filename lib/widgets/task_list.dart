import 'package:flutter/material.dart';
import 'package:todo/model/task.dart';
import 'package:todo/widgets/task_description.dart';

class TaskList extends StatelessWidget {
  const TaskList(
      {super.key,
      required this.tasks,
      required this.onCompleteTask,
      required this.onRemoveTask});
  final List<Task> tasks;
  final Function(Task task) onCompleteTask;

  final Function(Task task) onRemoveTask;

  @override
  Widget build(BuildContext context) {
    Widget emptyContent = const Center(
      child: Text("Add on your list to be more productive"),
    );

    return tasks.isNotEmpty
        ? ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (ctx, index) => Dismissible(
                  key: ValueKey(tasks[index]),
                  onDismissed: (direction) {
                    onRemoveTask(tasks[index]);
                  },
                  child: TaskDescription(
                    task: tasks[index],
                    onCompleteTask: onCompleteTask,
                  ),
                ))
        : emptyContent;
  }
}
