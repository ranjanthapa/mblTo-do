import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:todo/widgets/to_do_screen.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});
  @override
  State<AddTask> createState() {
    return _AddTaskState();
  }
}

class _AddTaskState extends State<AddTask> {
  final TextEditingController _taskController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  final _todayDate = DateTime.now();
  String dateFormat = DateFormat.MONTH_DAY;

  String? _selectedDate;

  @override
  void dispose() {
    _taskController.dispose();
    _noteController.dispose();
    super.dispose();
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
            controller: _taskController,
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
                    setState(
                      () => _selectedDate = formatter.format(_todayDate),
                    );
                  },
                  style: ButtonStyle(backgroundColor: BackgroundColor(context)),
                  icon: const Icon(Icons.calendar_today),
                  label: const Text("Today")),
              OutlinedButton.icon(
                  onPressed: () {
                    print("button pressed");
                  },
                  icon: const Icon(Icons.calendar_month_outlined),
                  label: const Text("Tommorrow")),
              OutlinedButton.icon(
                  onPressed: () {
                    print("button pressed");
                  },
                  icon: const Icon(Icons.calendar_month_sharp),
                  label: const Text("Date")),
            ],
          ),
          const SizedBox(
            height: 14,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                print("button pressed");
              },
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

class BackgroundColor implements MaterialStateProperty<Color> {
  BackgroundColor(this.context);
  final BuildContext context;

  @override
  Color resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.selected)) {
      return Colors.blue.shade400;
    } else {
      return Colors.white;
    }
  }
}
