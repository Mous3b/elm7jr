// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_export_bill_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StoreExportBillModelAdapter extends TypeAdapter<StoreExportBillModel> {
  @override
  final int typeId = 11;

  @override
  StoreExportBillModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StoreExportBillModel(
      customerId: fields[0] as String?,
      total: fields[1] as double?,
      paid: fields[2] as double?,
      rest: fields[3] as double?,
      discount: fields[4] as double?,
      notes: fields[5] as String?,
      items: (fields[6] as List?)?.cast<StoreItemBasketModel>(),
      date: fields[7] as String?,
      id: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, StoreExportBillModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.customerId)
      ..writeByte(1)
      ..write(obj.total)
      ..writeByte(2)
      ..write(obj.paid)
      ..writeByte(3)
      ..write(obj.rest)
      ..writeByte(4)
      ..write(obj.discount)
      ..writeByte(5)
      ..write(obj.notes)
      ..writeByte(6)
      ..write(obj.items)
      ..writeByte(7)
      ..write(obj.date)
      ..writeByte(8)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StoreExportBillModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
