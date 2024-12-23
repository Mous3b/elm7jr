// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'import_m7jar_bill.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ImportM7jarBillModelAdapter extends TypeAdapter<ImportM7jarBillModel> {
  @override
  final int typeId = 8;

  @override
  ImportM7jarBillModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImportM7jarBillModel(
      type: fields[0] as String?,
      size: fields[1] as String?,
      date: fields[2] as String?,
      supplierId: fields[3] as String?,
      price: fields[4] as double?,
      paid: fields[5] as double?,
      rest: fields[6] as double?,
      tips: fields[7] as double?,
      notes: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ImportM7jarBillModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.size)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.supplierId)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.paid)
      ..writeByte(6)
      ..write(obj.rest)
      ..writeByte(7)
      ..write(obj.tips)
      ..writeByte(8)
      ..write(obj.notes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImportM7jarBillModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
