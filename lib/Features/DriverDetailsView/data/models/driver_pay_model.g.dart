// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_pay_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DriverPayModelAdapter extends TypeAdapter<DriverPayModel> {
  @override
  final int typeId = 20;

  @override
  DriverPayModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DriverPayModel(
      driverId: fields[0] as String?,
      date: fields[1] as String?,
      paid: fields[2] as double?,
      notes: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, DriverPayModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.driverId)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.paid)
      ..writeByte(3)
      ..write(obj.notes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DriverPayModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
