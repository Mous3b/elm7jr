// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'import_store_bill_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ImportStoreBillModelAdapter extends TypeAdapter<ImportStoreBillModel> {
  @override
  final int typeId = 4;

  @override
  ImportStoreBillModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImportStoreBillModel(
      supplierId: fields[0] as String?,
      notes: fields[1] as String?,
      date: fields[2] as String?,
      paid: fields[3] as double?,
      rest: fields[5] as double?,
      total: fields[4] as double?,
      items: (fields[6] as List?)?.cast<ImportItemModel>(),
      tips: fields[7] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, ImportStoreBillModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.supplierId)
      ..writeByte(1)
      ..write(obj.notes)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.paid)
      ..writeByte(4)
      ..write(obj.total)
      ..writeByte(5)
      ..write(obj.rest)
      ..writeByte(6)
      ..write(obj.items)
      ..writeByte(7)
      ..write(obj.tips);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImportStoreBillModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
