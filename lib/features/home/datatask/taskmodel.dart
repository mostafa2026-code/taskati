import 'package:hive_flutter/hive_flutter.dart';


part 'taskmodel.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final DateTime date;
  @HiveField(4)
  final DateTime start;
  @HiveField(5)
  final DateTime end;

  TaskModel({
    required this.title,
    required this.description,
    required this.date,
    required this.start,
    required this.end,
  });
}
