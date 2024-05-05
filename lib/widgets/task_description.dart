import "package:flutter/material.dart";
import "package:todo/model/task.dart";

class TaskDescription extends StatefulWidget {
  const TaskDescription(
      {super.key, required this.task, required this.onCompleteTask});

  final Task task;
  final Function(Task task)? onCompleteTask;

  @override
  State<TaskDescription> createState() {
    return _TaskDescriptionState();
  }
}

class _TaskDescriptionState extends State<TaskDescription> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const IconButton(
          onPressed: null,
          icon: Icon(
            Icons.edit,
          ),
        ),
        Expanded(
          // child: Card(
          child: Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      onChanged: (value) {
                        widget.onCompleteTask!(widget.task);
                        setState(() {
                          widget.task.status = !widget.task.status;
                        });
                        print(widget.task.status);
                      },
                      value: widget.task.status,
                    ),
                    Text(
                      widget.task.task,
                      style: const TextStyle(fontSize: 18),
                    ),
                    const Spacer(),
                    Text(widget.task.getFormattedDate()),
                  ],
                ),
                Text(
                  widget.task.note,
                ),
              ],
            ),
          ),
          // ),
        ),
      ],
    );
  }
}
