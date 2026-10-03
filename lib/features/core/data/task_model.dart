import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 1)
class TaskModel {
  @HiveField(0)
  String title;

  @HiveField(1)
  String subtitle;

  @HiveField(2)
  String status;

  @HiveField(3)
  int color;
  @HiveField(4)
  String date;

  @HiveField(5)
  String time;

  TaskModel({
    required this.title,
    required this.subtitle,
    required this.status,
    required this.color,
    required this.date,
    required this.time,
  });
}
