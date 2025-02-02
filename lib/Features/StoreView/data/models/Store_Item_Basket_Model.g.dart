// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Store_Item_Basket_Model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StoreItemBasketModelAdapter extends TypeAdapter<StoreItemBasketModel> {
  @override
  final int typeId = 12;

  @override
  StoreItemBasketModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StoreItemBasketModel(
      name: fields[0] as String?,
      qty: fields[1] as int?,
      price: fields[2] as double?,
      description: fields[3] as String?,
      id: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, StoreItemBasketModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.qty)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StoreItemBasketModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
