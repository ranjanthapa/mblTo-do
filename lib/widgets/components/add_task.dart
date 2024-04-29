import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import "package:todo/model/task.dart";

class AddTask extends StatefulWidget {
  const AddTask({super.key, required this.onAddTask});
  final Function(Task task) onAddTask;

  @override
  State<AddTask> createState() {
    return _AddTaskState();
  }
}

class _AddTaskState extends State<AddTask> {
  final _taskTitleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  final _todayDate = DateTime.now();

  DateTime? _selectedDate;
  var _selectedDateType = 'today';

  @override
  void dispose() {
    _taskTitleController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  void _datePicker() async {
    final now = DateTime.now();
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: DateTime(2100),
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _onSubmit() {
    if (_taskTitleController.text.trim().isEmpty || _selectedDate == null) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                content: const Text(
                    "Make sure the task has title and date selected"),
                title: const Text("Invalid Input"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                      },
                      child: const Text("Okay"))
                ],
              ));
      return;
    }

    widget.onAddTask(Task(
      date: _selectedDate!,
      note: _noteController.text,
      task: _taskTitleController.text,
    ));

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "What task do we get today?",
              style:
                  GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 28),
            ),
          ),
          const Center(
            child: Text(
              "Add a dash of productive task to your day",
              style: TextStyle(fontSize: 18),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: _taskTitleController,
            maxLength: 50,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: "Task"),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 80,
                child: OutlinedButton(
                  onPressed: null,
                  style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                  child: const Text(
                    "😎",
                    style: TextStyle(fontSize: 20, inherit: false),
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: TextField(
                  minLines: 2,
                  maxLines: 2,
                  controller: _noteController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Note"),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 14,
          ),
          Text(
            "Schedule Tasks",
            style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton.icon(
                onPressed: () {
                  setState(() {
                    _selectedDate = _todayDate;
                    _selectedDateType = 'today';
                  });
                },
                style: OutlinedButton.styleFrom(
                    backgroundColor: _selectedDateType == 'today'
                        ? Colors.blue.shade400
                        : const Color.fromARGB(255, 247, 240, 240)),
                icon: const Icon(Icons.calendar_today),
                label: const Text("Today"),
              ),
              OutlinedButton.icon(
                onPressed: () {
                  setState(() {
                    _selectedDate = _todayDate.add(const Duration(days: 1));
                    _selectedDateType = 'tomorrow';
                  });
                },
                icon: const Icon(Icons.calendar_month_outlined),
                label: const Text("Tommorrow"),
                style: OutlinedButton.styleFrom(
                    backgroundColor: _selectedDateType == 'tomorrow'
                        ? Colors.blue.shade400
                        : const Color.fromARGB(255, 247, 240, 240)),
              ),
              OutlinedButton.icon(
                onPressed: () {
                  _datePicker();
                  print(_selectedDate);
                  setState(() {
                    _selectedDateType = 'other';
                  });
                },
                icon: const Icon(Icons.calendar_month_sharp),
                label: const Text("Date"),
                style: OutlinedButton.styleFrom(
                    backgroundColor: _selectedDateType == 'other'
                        ? Colors.blue.shade400
                        : const Color.fromARGB(255, 247, 240, 240)),
              ),
            ],
          ),
          const SizedBox(
            height: 14,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _onSubmit,
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade300,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
              child: const Text(
                "Add Task",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
