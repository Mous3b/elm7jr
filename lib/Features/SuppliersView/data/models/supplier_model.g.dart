// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supplier_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SupplierModelAdapter extends TypeAdapter<SupplierModel> {
  @override
  final int typeId = 6;

  @override
  SupplierModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SupplierModel(
      id: fields[0] as int?,
      name: fields[1] as String?,
      phone: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SupplierModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.phone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SupplierModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
