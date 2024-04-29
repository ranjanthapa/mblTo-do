import 'package:flutter/material.dart';
import "package:todo/model/task.dart";

class TaskDescription extends StatefulWidget {
  const TaskDescription({super.key, required this.task});

  final Task task;

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
                      value: widget.task.status,
                      onChanged: (bool? value) {
                        setState(() {
                          widget.task.status = value ?? false;
                        });
                      },
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
