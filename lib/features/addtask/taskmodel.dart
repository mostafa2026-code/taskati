import 'package:hive/hive.dart';
part 'taskmodel.g.dart';

@HiveType(typeId: 0)
class TsskModel {
 @HiveField(0)
final String id;

@HiveField(1)
final String title;

@HiveField(2)
final String description;

@HiveField(3)
final String taskdate;

@HiveField(4)
final String start;

@HiveField(5)
final String end;

@HiveField(6)
final bool completed;

@HiveField(7)
final int colorindex;

  TsskModel( {
    required this.id,
    required this.title,
    required this.description,
    required this.taskdate,
    required this.start,
    required this.end,
    required this.completed,
    required this.colorindex
  });
}
