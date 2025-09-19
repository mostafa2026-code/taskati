import 'package:hive/hive.dart';
part 'taskmodel.g.dart';
@HiveType(typeId: 0)
class Taskmodel {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final String date;
  @HiveField(3)
  final String starttime;
  @HiveField(4)
  final String endtime;
  @HiveField(5)
  final String id;
  @HiveField(6)
  bool? isCompleted = false;
  @HiveField(7)
  final int colorindex;

  Taskmodel({
    required this.title,
    required this.description,
    required this.date,
    required this.starttime,
    required this.endtime,

    required this.id,
    this.isCompleted,
    required this.colorindex,
  });

  Taskmodel copywith({
    String? title,
    String? description,
    String? date,
    String? starttime,
    String? endtime,
    String? id,
    bool? isCompleted,
    int? colorindex,
  }) {
    return Taskmodel(
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      starttime: starttime ?? this.starttime,
      endtime: endtime ?? this.endtime,
      id: id ?? this.id,
      isCompleted: isCompleted ?? this.isCompleted,
      colorindex: colorindex ?? this.colorindex,
    );
  }
}
