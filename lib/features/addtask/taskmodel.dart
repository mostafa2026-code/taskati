import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 0)
class Taskmodel extends HiveObject {
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final dynamic date;
  @HiveField(4)
  final TimeOfDay start;
  @HiveField(5)
  final TimeOfDay end;

  Taskmodel({
    required this.title,
    required this.description,
    required this.date,
    required this.start,
    required this.end,
  });
}

class TimeOfDayAdapter extends TypeAdapter<TimeOfDay> {
  @override
  final int typeId = 1; // رقم مختلف عن TaskModel

  @override
  TimeOfDay read(BinaryReader reader) {
    final hour = reader.readInt();
    final minute = reader.readInt();
    return TimeOfDay(hour: hour, minute: minute);
  }

  @override
  void write(BinaryWriter writer, TimeOfDay obj) {
    writer.writeInt(obj.hour);
    writer.writeInt(obj.minute);
  }
}

class TaskTypeAdaptor extends TypeAdapter<Taskmodel> {
  @override
  Taskmodel read(BinaryReader reader) {
    return Taskmodel(
      title: reader.readString(),
      description: reader.readString(),
      date: reader.read() as DateTime,
      start: reader.read() as TimeOfDay,
      end: reader.read() as TimeOfDay,
    );
  }

  @override
  void write(BinaryWriter writer, Taskmodel obj) {
    writer.writeString(obj.title);
    
  
    writer.writeString(obj.description);
  
    writer.write(obj.date);
    
    writer.write(obj.start);
    
    writer.write(obj.end);
  }

  @override
  // TODO: implement typeId
  int get typeId => 0;
}
