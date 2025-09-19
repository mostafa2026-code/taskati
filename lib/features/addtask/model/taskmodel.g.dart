// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'taskmodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskmodelAdapter extends TypeAdapter<Taskmodel> {
  @override
  final int typeId = 0;

  @override
  Taskmodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Taskmodel(
      title: fields[0] as String,
      description: fields[1] as String,
      date: fields[2] as String,
      starttime: fields[3] as String,
      endtime: fields[4] as String,
      id: fields[5] as String,
      isCompleted: fields[6] as bool?,
      colorindex: fields[7] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Taskmodel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.starttime)
      ..writeByte(4)
      ..write(obj.endtime)
      ..writeByte(5)
      ..write(obj.id)
      ..writeByte(6)
      ..write(obj.isCompleted)
      ..writeByte(7)
      ..write(obj.colorindex);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskmodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
