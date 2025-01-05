// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'block_export_bill_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BlockExportBillModelAdapter extends TypeAdapter<BlockExportBillModel> {
  @override
  final int typeId = 14;

  @override
  BlockExportBillModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BlockExportBillModel(
      id: fields[0] as String?,
      number: fields[1] as int?,
      customerId: fields[2] as String?,
      paid: fields[3] as double?,
      total: fields[4] as double?,
      rest: fields[5] as double?,
      discount: fields[6] as double?,
      date: fields[7] as String?,
      notes: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, BlockExportBillModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.number)
      ..writeByte(2)
      ..write(obj.customerId)
      ..writeByte(3)
      ..write(obj.paid)
      ..writeByte(4)
      ..write(obj.total)
      ..writeByte(5)
      ..write(obj.rest)
      ..writeByte(6)
      ..write(obj.discount)
      ..writeByte(7)
      ..write(obj.date)
      ..writeByte(8)
      ..write(obj.notes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BlockExportBillModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
