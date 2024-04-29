import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/widgets/components/add_task.dart';
import "package:todo/model/task.dart";
import 'package:todo/widgets/task_list.dart';

class ToDo extends StatefulWidget {
  const ToDo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ToDoState();
  }
}

class _ToDoState extends State<ToDo> {
  final List<Task> _registerTasks = [];

  void _openAddTaskOverLay() {
    showModalBottomSheet(
        // isScrollControlled: true,
        context: context,
        builder: (ctx) => AddTask(onAddTask: _addTask));
  }

  void _addTask(Task task) {
    setState(() {
      _registerTasks.add(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    final dateToday = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              formatter.format(dateToday),
              style: GoogleFonts.inter(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            Text("1 Incomplete, 0 complete",
                style: GoogleFonts.inter(
                    color: const Color.fromARGB(76, 24, 18, 18),
                    fontWeight: FontWeight.bold,
                    fontSize: 14))
          ],
        ),
        actions: const [
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.more_vert_outlined,
              size: 24,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Incomplete",
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: const Color.fromARGB(171, 101, 101, 110)),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(child: TaskList(tasks: _registerTasks))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade700,
        onPressed: _openAddTaskOverLay,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
