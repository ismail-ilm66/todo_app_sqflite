import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String id;
  final String title;
  final String note;
  final String time;
  final String date;
  final bool isCompleted;
  //final TaskCategory taskCategory;
  Task({
    required this.id,
    required this.title,
    required this.note,
    required this.time,
    required this.date,
    required this.isCompleted,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id, title, note, time, date, isCompleted];
}
