// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usersmodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UsersmodelAdapter extends TypeAdapter<Usersmodel> {
  @override
  final int typeId = 5;

  @override
  Usersmodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Usersmodel(
      name: fields[7] as String,
      email: fields[8] as String,
      password: fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Usersmodel obj) {
    writer
      ..writeByte(3)
      ..writeByte(7)
      ..write(obj.name)
      ..writeByte(8)
      ..write(obj.email)
      ..writeByte(9)
      ..write(obj.password);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UsersmodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
