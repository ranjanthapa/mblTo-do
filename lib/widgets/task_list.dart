import 'package:flutter/material.dart';
import 'package:todo/model/task.dart';
import 'package:todo/widgets/components/task_description.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key, required this.tasks});
  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    Widget emptyContent = const Center(
      child: Text("Add on your list to be more productive"),
    );

    return tasks.isNotEmpty
        ? ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (ctx, index) => TaskDescription(task: tasks[index]))
        : emptyContent;
  }
}
