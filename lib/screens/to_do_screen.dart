import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/widgets/complete_task.dart';
import 'package:todo/widgets/add_task.dart';
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
  final List<Task> _completeTaskList = [];

  void _openAddTaskOverLay() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => AddTask(onAddTask: _addTask));
  }

  void _addTask(Task task) {
    setState(() {
      _registerTasks.add(task);
    });
  }

  void _completeBucket(Task task) {
    setState(() {
      if (task.status == false && !_completeTaskList.contains(task)) {
        _completeTaskList.add(task);
        _registerTasks.remove(task);
        print("complete task $_completeTaskList");
        print(_registerTasks);
      } else {
        if (task.status == true && !_registerTasks.contains(task)) {
          _completeTaskList.remove(task);
          _registerTasks.add(task);
          print("complete task $_completeTaskList");
          print(_registerTasks);
        }
      }
    });
  }

  void _removeTask(Task task) {
    setState(() {
      if (_registerTasks.contains(task)) {
        _registerTasks.remove(task);
        print(_registerTasks);
      } else {
        _completeTaskList.remove(task);
        print(_completeTaskList);
      }
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
            Text(
                "${_registerTasks.where((task) => task.status == false).length} Incomplete, ${_completeTaskList.length}complete",
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
                  color: const Color.fromRGBO(101, 101, 110, 0.671)),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: TaskList(
                tasks: _registerTasks,
                onCompleteTask: _completeBucket,
                onRemoveTask: _removeTask,
              ),
            ),
            _completeTaskList.isNotEmpty
                ? Text(
                    "Complete",
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: const Color.fromARGB(171, 101, 101, 110)),
                  )
                : const SizedBox(
                    height: 0,
                  ),
            _completeTaskList.isNotEmpty
                ? Expanded(
                    child: CompleteTaskList(
                      completeTasks: _completeTaskList,
                      onCompleteTask: _completeBucket,
                      onRemoveTask: _removeTask,
                    ),
                  )
                : const SizedBox(
                    height: 0,
                  )
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
