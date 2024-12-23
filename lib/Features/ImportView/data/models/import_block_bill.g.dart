// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'import_block_bill.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ImportBlockBillModelAdapter extends TypeAdapter<ImportBlockBillModel> {
  @override
  final int typeId = 9;

  @override
  ImportBlockBillModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImportBlockBillModel(
      number: fields[0] as int?,
      date: fields[1] as String?,
      supplierId: fields[2] as String?,
      price: fields[3] as double?,
      paid: fields[4] as double?,
      rest: fields[5] as double?,
      tips: fields[6] as double?,
      notes: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ImportBlockBillModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.number)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.supplierId)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.paid)
      ..writeByte(5)
      ..write(obj.rest)
      ..writeByte(6)
      ..write(obj.tips)
      ..writeByte(7)
      ..write(obj.notes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImportBlockBillModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
