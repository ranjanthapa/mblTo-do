import 'package:flutter/material.dart';

class TaskDescription extends StatefulWidget {
  const TaskDescription({super.key});

  @override
  State<TaskDescription> createState() {
    return _TaskDescriptionState();
  }
}

class _TaskDescriptionState extends State<TaskDescription> {
  bool taskStatus = false;

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
          child: Card(
            child: Container(
              // width: double.infinity,
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: taskStatus,
                        onChanged: (bool? value) {
                          setState(() {
                            taskStatus = value ?? false;
                          });
                        },
                      ),
                      const Text(
                        "Complete the task",
                        style: TextStyle(fontSize: 18),
                      ),
                      const Spacer(),
                      const Text("Apr 12"),
                    ],
                  ),
                  const Text("Description"),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
