// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ExpensesModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExpensesModelAdapter extends TypeAdapter<ExpensesModel> {
  @override
  final int typeId = 2;

  @override
  ExpensesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExpensesModel(
      items: (fields[0] as List?)?.cast<ExpensesItemModel>(),
      dateTime: fields[1] as DateTime?,
      totalPrice: fields[2] as double?,
      notes: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ExpensesModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.items)
      ..writeByte(1)
      ..write(obj.dateTime)
      ..writeByte(2)
      ..write(obj.totalPrice)
      ..writeByte(3)
      ..write(obj.notes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExpensesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
