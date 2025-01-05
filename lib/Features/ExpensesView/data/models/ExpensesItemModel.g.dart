// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ExpensesItemModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExpensesItemModelAdapter extends TypeAdapter<ExpensesItemModel> {
  @override
  final int typeId = 1;

  @override
  ExpensesItemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExpensesItemModel(
      type: fields[1] as String?,
      price: fields[2] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, ExpensesItemModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExpensesItemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
