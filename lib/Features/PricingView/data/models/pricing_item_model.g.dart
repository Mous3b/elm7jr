// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pricing_item_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PricingItemModelAdapter extends TypeAdapter<PricingItemModel> {
  @override
  final int typeId = 16;

  @override
  PricingItemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PricingItemModel(
      type: fields[0] as int?,
      price: fields[1] as double?,
      name: fields[2] as String?,
      date: fields[3] as String?,
      id: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PricingItemModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PricingItemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
