// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'taskmodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TsskModelAdapter extends TypeAdapter<TsskModel> {
  @override
  final int typeId = 0;

  @override
  TsskModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TsskModel(
      id: fields[0] as String,
      title: fields[1] as String,
      description: fields[2] as String,
      taskdate: fields[3] as String,
      start: fields[4] as String,
      end: fields[5] as String,
      completed: fields[6] as bool,
      colorindex: fields[7] as int,
    );
  }

  @override
  void write(BinaryWriter writer, TsskModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.taskdate)
      ..writeByte(4)
      ..write(obj.start)
      ..writeByte(5)
      ..write(obj.end)
      ..writeByte(6)
      ..write(obj.completed)
      ..writeByte(7)
      ..write(obj.colorindex);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TsskModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
