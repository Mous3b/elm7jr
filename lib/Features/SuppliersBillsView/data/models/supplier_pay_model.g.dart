// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supplier_pay_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SupplierPayModelAdapter extends TypeAdapter<SupplierPayModel> {
  @override
  final int typeId = 15;

  @override
  SupplierPayModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SupplierPayModel(
      supplierId: fields[0] as String?,
      date: fields[1] as String?,
      paid: fields[2] as double?,
      notes: fields[3] as String?,
      id: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SupplierPayModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.supplierId)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.paid)
      ..writeByte(3)
      ..write(obj.notes)
      ..writeByte(4)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SupplierPayModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
