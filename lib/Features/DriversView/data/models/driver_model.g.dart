// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DriverModelAdapter extends TypeAdapter<DriverModel> {
  @override
  final int typeId = 19;

  @override
  DriverModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DriverModel(
      id: fields[0] as String?,
      name: fields[1] as String?,
      phoneNumber: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, DriverModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.phoneNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DriverModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
