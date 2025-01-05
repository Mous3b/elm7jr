// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class M7jarItemModelAdapter extends TypeAdapter<M7jarItemModel> {
  @override
  final int typeId = 17;

  @override
  M7jarItemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return M7jarItemModel(
      number: fields[0] as double?,
      type: fields[1] as String?,
      name: fields[2] as String?,
      size: fields[3] as String?,
      customerId: fields[4] as String?,
      price: fields[5] as double?,
      discount: fields[6] as double?,
      notes: fields[7] as String?,
      dateTime: fields[8] as DateTime?,
      paid: fields[9] as double?,
      rest: fields[10] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, M7jarItemModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.number)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.size)
      ..writeByte(4)
      ..write(obj.customerId)
      ..writeByte(5)
      ..write(obj.price)
      ..writeByte(6)
      ..write(obj.discount)
      ..writeByte(7)
      ..write(obj.notes)
      ..writeByte(8)
      ..write(obj.dateTime)
      ..writeByte(9)
      ..write(obj.paid)
      ..writeByte(10)
      ..write(obj.rest);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is M7jarItemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
