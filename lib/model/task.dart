import 'package:uuid/uuid.dart';

import 'package:intl/intl.dart';

const _uuid = Uuid();
final formatter = DateFormat.yMMMd();

class Task {
  Task({
    required this.note,
    required this.task,
    required this.date,
  })  : id = _uuid.v4(),
        status = false;
  final String id;
  final String task;
  final String note;
  final DateTime date;
  bool status;

  String getFormattedDate() {
    return formatter.format(date);
  }
}
