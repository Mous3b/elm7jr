// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accountant_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AccountantModelAdapter extends TypeAdapter<AccountantModel> {
  @override
  final int typeId = 10;

  @override
  AccountantModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AccountantModel(
      total: fields[0] as double?,
      dateTime: fields[1] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, AccountantModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.total)
      ..writeByte(1)
      ..write(obj.dateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccountantModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
